// =============================================================================
// Pywel Atlas - route line overlay and panel section (RouteOverlay.cpp, v0.104-v0.123)
// =============================================================================
//
// WHAT THIS FILE DOES
//   Draws the planned route (RouteSystem.cpp) over the game's maps with Dear
//   ImGui's foreground draw list, inside FilterPanel.cpp's frame:
//   - the leg from the player to the current stop in the game's destination
//     red (#d14d45, about 4 px, with a thin dark border);
//   - the later legs about 3 px (v0.115: the same crimson, a little fainter;
//     it was a light beige, #dfd4c7);
//   - v0.107 (user request; v0.104 drew large rings): a small red dot just
//     under each stop's icon, a little larger for the current stop, so the
//     game's own icon stays fully visible; legs end at the icon's edge.
//   Line sizes follow the back-buffer height (1080 lines = 1x); the icon
//   sizes come from the game's own CSS times the interface scale. The
//   world-map line is drawn only while the world-map snapshot is younger
//   than 200 ms (the map is open) and (v0.107) no knowledge card is open,
//   because the overlay would sit on top of the card. The minimap line is
//   drawn only while the minimap snapshot is that young and the world map is
//   not open; it is clipped to the minimap circle.
//   v0.111: the lines are the road-following legs the worker publishes
//   (RouteLines.h). On the world map the game's own canvas draws them
//   (RouteCanvas.cpp); this overlay draws the world-map line only when the
//   panel's Line style is "Overlay" or the canvas is not drawing. v0.115:
//   the same for the minimap (its own canvas, RouteCanvas.cpp), and the
//   overlay uses the same crimson look (later legs thinner and fainter).
//   It also builds the panel's Route section (show, stop count, which maps,
//   line style, Skip stop, status line).
//
// The overlay only draws; it never reads game memory itself.
// =============================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <cmath>
#include <cstring>

#include "MarkerFilter.h"
#include "RouteCanvas.h"
#include "RouteLines.h"
#include "RouteOverlay.h"
#include "RouteSystem.h"

namespace {

// Snapshots older than this mean the map is not on screen.
constexpr ULONGLONG kFreshMs = 200;
// The line colours (sRGB; converted for HDR by the panel's colour function).
const ImVec4 kRed(0.820f, 0.302f, 0.271f, 1.0f); // #d14d45, the game's destination line.
const ImVec4 kRedLater(0.820f, 0.302f, 0.271f, 0.75f); // v0.115: later legs, a little fainter.
const ImVec4 kBorder(0.290f, 0.071f, 0.063f, 0.90f); // v0.115: #4a1210 dark crimson outline.

// What one frame needs to know before drawing.
struct OverlayInputs {
    PywelRouteSettings settings;
    PywelRoutePlan plan;
    PywelWorldMapView world;
    PywelMinimapView minimap;
    bool worldFresh;
    bool minimapFresh;
    bool worldByOverlay; // v0.111: the world-map line is ours to draw (not the canvas's).
    bool minimapByOverlay; // v0.115: the same for the minimap line.
};

// v0.111: the route lines, one copy per presenting thread (they are large;
// PywelGetRouteLines only copies them when they changed).
thread_local RouteLines lines = {};

// Copies the settings, plan, lines and snapshots once per frame.
OverlayInputs TakeInputs() {
    OverlayInputs inputs = {};
    inputs.settings = PywelGetRouteSettings();
    PywelGetRoutePlan(inputs.plan);
    PywelGetRouteLines(lines);
    ULONGLONG now = GetTickCount64();
    inputs.worldFresh = PywelGetWorldMapView(inputs.world) && now - inputs.world.tick < kFreshMs;
    inputs.minimapFresh = PywelGetMinimapView(inputs.minimap) && now - inputs.minimap.tick < kFreshMs;
    // A canvas counts as drawing while it added (or kept) our lines in the
    // last 300 ms.
    RouteCanvasStats canvas = {};
    PywelGetRouteCanvasStats(canvas);
    bool worldCanvas = canvas.guardsMatched && canvas.world.lastDrawTick && now - canvas.world.lastDrawTick < 300;
    bool minimapCanvas = canvas.guardsMatched && canvas.minimap.lastDrawTick &&
        now - canvas.minimap.lastDrawTick < 300;
    inputs.worldByOverlay = inputs.worldFresh && inputs.settings.worldLine &&
        !(inputs.settings.canvasLine && worldCanvas);
    inputs.minimapByOverlay = inputs.minimapFresh && !inputs.worldFresh && inputs.settings.minimapLine &&
        !(inputs.settings.canvasLine && minimapCanvas);
    return inputs;
}

// Cuts the segment a-b down to the part inside the circle (centre c, radius
// r). False if no part of it is inside.
bool ClipToCircle(ImVec2& a, ImVec2& b, const ImVec2& c, float r) {
    float dx = b.x - a.x;
    float dy = b.y - a.y;
    float fx = a.x - c.x;
    float fy = a.y - c.y;
    // Solve |a + t (b - a) - c|^2 = r^2 for t.
    float qa = dx * dx + dy * dy;
    float qb = 2.0f * (fx * dx + fy * dy);
    float qc = fx * fx + fy * fy - r * r;
    if (qa < 1e-6f) {
        return qc <= 0.0f;
    }
    float discriminant = qb * qb - 4.0f * qa * qc;
    if (discriminant <= 0.0f) {
        return false;
    }
    float root = std::sqrt(discriminant);
    float t0 = (-qb - root) / (2.0f * qa);
    float t1 = (-qb + root) / (2.0f * qa);
    t0 = t0 < 0.0f ? 0.0f : t0;
    t1 = t1 > 1.0f ? 1.0f : t1;
    if (t0 >= t1) {
        return false;
    }
    ImVec2 start(a.x + dx * t0, a.y + dy * t0);
    ImVec2 end(a.x + dx * t1, a.y + dy * t1);
    a = start;
    b = end;
    return true;
}

// True if point p lies inside the circle (or there is no circle).
bool InsideCircle(const ImVec2& p, const ImVec2& c, float r, bool clip) {
    float dx = p.x - c.x;
    float dy = p.y - c.y;
    return !clip || dx * dx + dy * dy <= r * r;
}

// Moves `from` towards `to` by `distance` pixels (used to end a leg at a
// stop's icon instead of over it). False if the leg is shorter.
bool Shorten(ImVec2& from, const ImVec2& to, float distance) {
    float dx = to.x - from.x;
    float dy = to.y - from.y;
    float length = std::sqrt(dx * dx + dy * dy);
    if (length <= distance) {
        return false;
    }
    from.x += dx / length * distance;
    from.y += dy / length * distance;
    return true;
}

// Draws one leg with its dark border. `trimStart` / `trimEnd` keep the line
// off the icons at its ends; the minimap clips it to the circle.
void DrawLeg(ImDrawList* draw, ImVec2 a, ImVec2 b, float trimStart, float trimEnd, ImU32 colour, ImU32 border,
    float thickness, float edge, bool clip, const ImVec2& centre, float radius) {
    if ((trimStart > 0.0f && !Shorten(a, b, trimStart)) || (trimEnd > 0.0f && !Shorten(b, a, trimEnd))) {
        return;
    }
    if (clip && !ClipToCircle(a, b, centre, radius)) {
        return;
    }
    draw->AddLine(a, b, border, thickness + 2.0f * edge);
    draw->AddLine(a, b, colour, thickness);
}

// The minimap's icons are smaller than the world map's; one estimate for all
// (canvas units).
constexpr float kMinimapIconHalf = 12.0f;
// Dot radius at 1080 lines: about 6 px across, the current stop's a little
// larger.
constexpr float kDotRadius = 3.0f;
constexpr float kCurrentDotRadius = 4.0f;

// Draws every leg of `lines` (v0.111: road-following polylines), with
// `project` turning a world point into back-buffer pixels. `iconHalf[leg]`
// is the half-size (pixels) of the icon at that leg's end: lines end there
// and the stop's small red dot sits just under it.
template <typename Project>
void DrawLines(ImDrawList* draw, const RouteLines& route, Project project, const float* iconHalf, float scale,
    PywelColourFn colour, bool clip, const ImVec2& centre, float radius) {
    ImU32 red = colour(kRed);
    ImU32 redLater = colour(kRedLater);
    ImU32 border = colour(kBorder);
    float edge = scale > 1.0f ? scale : 1.0f;
    ImVec2 ends[kRouteLineMaxLegs] = {};
    bool endKnown[kRouteLineMaxLegs] = {};
    // Later legs first, so the current leg lies on top.
    for (unsigned leg = route.legCount; leg-- > 0;) {
        const RouteLineLeg& item = route.legs[leg];
        if (item.count < 2 || item.first + item.count > route.pointCount) {
            continue;
        }
        ImVec2 previous;
        bool previousKnown = project(route.points[item.first], previous);
        for (unsigned point = 1; point < item.count; ++point) {
            ImVec2 next;
            bool nextKnown = project(route.points[item.first + point], next);
            if (previousKnown && nextKnown) {
                float trimStart = point == 1 && leg > 0 ? iconHalf[leg - 1] : 0.0f;
                float trimEnd = point + 1 == item.count ? iconHalf[leg] : 0.0f;
                DrawLeg(draw, previous, next, trimStart, trimEnd, leg == 0 ? red : redLater, border,
                    (leg == 0 ? 4.0f : 3.0f) * scale, edge, clip, centre, radius);
            }
            previous = next;
            previousKnown = nextKnown;
        }
        ends[leg] = previous;
        endKnown[leg] = previousKnown;
    }
    for (unsigned leg = 0; leg < route.legCount; ++leg) {
        if (!endKnown[leg]) {
            continue;
        }
        float dot = (leg == 0 ? kCurrentDotRadius : kDotRadius) * scale;
        ImVec2 spot(ends[leg].x, ends[leg].y + iconHalf[leg] + dot + edge);
        if (!InsideCircle(spot, centre, radius, clip)) {
            continue;
        }
        draw->AddCircleFilled(spot, dot + edge, border, 16);
        draw->AddCircleFilled(spot, dot, red, 16);
    }
}

// Back-buffer pixels per canvas unit on the world map, measured with the
// line's own maths (two points one canvas unit apart); the plain height
// scale if the view is unusable.
float WorldCanvasScale(const PywelWorldMapView& view, float width, float height) {
    float x0 = 0.0f;
    float y0 = 0.0f;
    float x1 = 0.0f;
    float y1 = 0.0f;
    if (PywelRouteWorldToScreen(view, view.centerX, view.centerZ, width, height, x0, y0) &&
        PywelRouteWorldToScreen(view, view.centerX + view.metresPerUnit, view.centerZ, width, height, x1, y1) &&
        x1 > x0) {
        return x1 - x0;
    }
    return height / 1080.0f;
}

// Back-buffer pixels per canvas unit on the minimap, measured the same way
// from the player position (falls back to the plain height scale).
float MinimapCanvasScale(const PywelMinimapView& view, float width, float height) {
    float x0 = 0.0f;
    float y0 = 0.0f;
    float x1 = 0.0f;
    float y1 = 0.0f;
    float unitsPerMetre = view.scale554 * view.layerScaleX;
    if (unitsPerMetre > 0.0f &&
        PywelRouteMinimapToScreen(view, view.playerX, view.playerZ, width, height, x0, y0) &&
        PywelRouteMinimapToScreen(view, view.playerX + 1.0f / unitsPerMetre, view.playerZ, width, height, x1, y1)) {
        float dx = x1 - x0;
        float dy = y1 - y0;
        float length = std::sqrt(dx * dx + dy * dy);
        if (length > 0.0f) {
            return length;
        }
    }
    return height / 1080.0f;
}

} // namespace

// See RouteOverlay.h.
bool PywelRouteOverlayWanted() {
    OverlayInputs inputs = TakeInputs();
    float card[4] = {};
    bool cardOpen = PywelMapKnowledgeCardState(card);
    return inputs.settings.shown && lines.legCount > 0 &&
        ((inputs.worldByOverlay && !cardOpen) || inputs.minimapByOverlay);
}

// See RouteOverlay.h.
void PywelRouteDrawOverlay(ImDrawList* draw, float width, float height, PywelColourFn colour) {
    PywelRouteNoteBackBuffer(static_cast<unsigned>(width), static_cast<unsigned>(height));
    OverlayInputs inputs = TakeInputs();
    if (!draw || !inputs.settings.shown || lines.legCount == 0) {
        return;
    }
    float scale = height / 1080.0f;
    float iconHalf[kRouteLineMaxLegs] = {};

    if (inputs.worldFresh) {
        // v0.107: the overlay would sit on top of a knowledge card, and the
        // card's on-screen rectangle is not known, so the world-map route
        // waits while a card is open. (The canvas line sits under the card.)
        float card[4] = {};
        if (!inputs.worldByOverlay || PywelMapKnowledgeCardState(card)) {
            return;
        }
        float unit = WorldCanvasScale(inputs.world, width, height);
        for (unsigned leg = 0; leg < lines.legCount; ++leg) {
            unsigned category = lines.legs[leg].category;
            iconHalf[leg] = (category < kPywelMarkerCategories ? kRouteWorldIconHalf[category] : 16.0f) * unit;
        }
        const PywelWorldMapView& view = inputs.world;
        DrawLines(draw, lines, [&](const RoutePoint& point, ImVec2& out) {
            return PywelRouteWorldToScreen(view, point.x, point.z, width, height, out.x, out.y);
        }, iconHalf, scale, colour, false, ImVec2(0.0f, 0.0f), 0.0f);
    } else if (inputs.minimapByOverlay) {
        float centreX = 0.0f;
        float centreY = 0.0f;
        float radius = 0.0f;
        if (!PywelRouteMinimapCircle(inputs.minimap, width, height, centreX, centreY, radius)) {
            return;
        }
        float unit = MinimapCanvasScale(inputs.minimap, width, height);
        for (unsigned leg = 0; leg < lines.legCount; ++leg) {
            iconHalf[leg] = kMinimapIconHalf * unit;
        }
        const PywelMinimapView& view = inputs.minimap;
        DrawLines(draw, lines, [&](const RoutePoint& point, ImVec2& out) {
            return PywelRouteMinimapToScreen(view, point.x, point.z, width, height, out.x, out.y);
        }, iconHalf, scale, colour, true, ImVec2(centreX, centreY), radius);
    }
}

// See RouteOverlay.h. Changes go to RouteSystem.cpp, which asks the marker
// part to save them in filters.ini.
void PywelRouteBuildPanelSection() {
    PywelRouteSettings choice = PywelGetRouteSettings();
    PywelRouteSettings changed = choice;
    // v0.123: drawn inside the panel's Route tab, which names it, so the
    // section has no heading line of its own any more.
    ImGui::Checkbox("Show route", &changed.shown);
    int stops = static_cast<int>(changed.stops);
    ImGui::SetNextItemWidth(ImGui::GetContentRegionAvail().x * 0.6f);
    if (ImGui::SliderInt("Stops", &stops, 1, static_cast<int>(kPywelRoutePlanMax))) {
        changed.stops = static_cast<unsigned>(stops);
    }
    ImGui::Checkbox("World map line", &changed.worldLine);
    ImGui::SameLine();
    ImGui::Checkbox("Minimap line", &changed.minimapLine);
    // v0.111: who draws the world-map line.
    ImGui::TextDisabled("Line style:");
    ImGui::SameLine();
    if (ImGui::RadioButton("Game canvas", changed.canvasLine)) {
        changed.canvasLine = true;
    }
    ImGui::SameLine();
    if (ImGui::RadioButton("Overlay", !changed.canvasLine)) {
        changed.canvasLine = false;
    }
    ImGui::SetItemTooltip("Game canvas: drawn by the maps themselves, under their cards and popups. "
                          "Overlay: drawn on top of the game.");
    if (memcmp(&changed, &choice, sizeof(choice)) != 0) {
        PywelSetRouteSettings(changed);
    }

    PywelRoutePlan plan = {};
    bool hasPlan = PywelGetRoutePlan(plan) && choice.shown;
    ImGui::BeginDisabled(!hasPlan);
    if (ImGui::Button("Skip stop")) {
        PywelRouteSkipStop();
    }
    ImGui::EndDisabled();
    ImGui::SameLine();
    if (hasPlan) {
        PywelMinimapView player = {};
        if (PywelGetMinimapView(player)) {
            float dx = plan.stops[0].x - player.playerX;
            float dz = plan.stops[0].z - player.playerZ;
            ImGui::TextDisabled("Next: %s, %.0f m, stop 1 of %u", plan.stops[0].name, std::sqrt(dx * dx + dz * dz),
                plan.count);
        } else {
            ImGui::TextDisabled("Next: %s, stop 1 of %u", plan.stops[0].name, plan.count);
        }
    } else {
        ImGui::TextDisabled("%s", choice.shown && plan.status ? plan.status : "Route is off");
    }
}
