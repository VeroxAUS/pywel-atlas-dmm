// =============================================================================
// Pywel Atlas - route line overlay and panel section (RouteOverlay.cpp, v0.104-v0.133)
// =============================================================================
//
// WHAT THIS FILE DOES
//   Draws the planned route (RouteSystem.cpp) over the game's maps with Dear
//   ImGui's foreground draw list, inside FilterPanel.cpp's frame:
//   - the leg from the player to the current stop in the game's destination
//     red (#d14d45, about 4 px, with a thin dark border);
//   - the later legs about 3 px (v0.115: the same crimson, a little fainter;
//     it was a light beige, #dfd4c7);
//   - v0.124 (Thomas's choice; v0.107-v0.123 drew a small dot under each
//     icon): a ring centred on each stop's icon, just outside its edge; legs
//     end at the ring. v0.130 (option 3): a soft crimson glow fading out over
//     about 12 px and a 1 px crimson hairline. (The overlay draws on top of
//     the icons; the canvases draw the ring under them, RouteCanvas.cpp.)
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
//   v0.124: the world-map line only while the map shows the player's layer
//   (surface or Abyss, RouteCanvas.cpp).
//   It also builds the panel's Route section (show, stop count, which maps,
//   line style, Skip stop, status line; v0.124-v0.132 also a canvas Look).
//
// The overlay only draws; it never reads game memory itself.
// =============================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <cmath>
#include <cstring>

#include "MarkerFilter.h"
#include "ReleaseLog.h"
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

// Draws one piece of a leg with its dark border; the minimap clips it to
// the circle.
void DrawLeg(ImDrawList* draw, ImVec2 a, ImVec2 b, ImU32 colour, ImU32 border, float thickness, float edge,
    bool clip, const ImVec2& centre, float radius) {
    if (clip && !ClipToCircle(a, b, centre, radius)) {
        return;
    }
    draw->AddLine(a, b, border, thickness + 2.0f * edge);
    draw->AddLine(a, b, colour, thickness);
}

// v0.130: removes `distance` pixels of line from the end of `line` (walking
// back over as many pieces as that takes, so a short last piece no longer
// leaves the rest untrimmed). False if the line is shorter.
bool TrimEnd(ImVector<ImVec2>& line, float distance) {
    while (line.Size >= 2 && distance > 0.0f) {
        ImVec2& a = line[line.Size - 2];
        ImVec2& b = line[line.Size - 1];
        float dx = b.x - a.x;
        float dy = b.y - a.y;
        float length = std::sqrt(dx * dx + dy * dy);
        if (length > distance) {
            b.x -= dx / length * distance;
            b.y -= dy / length * distance;
            return true;
        }
        distance -= length;
        line.pop_back();
    }
    return line.Size >= 2;
}

// The same at the start of `line`.
bool TrimStart(ImVector<ImVec2>& line, float distance) {
    for (int a = 0, b = line.Size - 1; a < b; ++a, --b) {
        ImVec2 swap = line[a];
        line[a] = line[b];
        line[b] = swap;
    }
    bool kept = TrimEnd(line, distance);
    for (int a = 0, b = line.Size - 1; a < b; ++a, --b) {
        ImVec2 swap = line[a];
        line[a] = line[b];
        line[b] = swap;
    }
    return kept;
}

// Stop ring radius at 1080 lines (all markers show about 24 px since
// v0.120; the minimap's are smaller), and (v0.130) the hairline and glow, as
// RouteCanvas.cpp.
constexpr float kWorldRingRadius = 14.0f;
constexpr float kMinimapRingRadius = 10.0f;
constexpr float kHairlineWidth = 1.0f;
constexpr unsigned kGlowRings = 8;
constexpr float kGlowRingWidth = 1.5f;
constexpr float kGlowOpacity = 0.35f;

// Draws every leg of `lines` (v0.111: road-following polylines), with
// `project` turning a world point into back-buffer pixels. `iconHalf[leg]`
// is the radius (pixels) of the ring around the icon at that leg's end:
// lines end there (v0.124).
template <typename Project>
void DrawLines(ImDrawList* draw, const RouteLines& route, Project project, const float* iconHalf, float scale,
    PywelColourFn colour, bool clip, const ImVec2& centre, float radius) {
    ImU32 red = colour(kRed);
    ImU32 redLater = colour(kRedLater);
    ImU32 border = colour(kBorder);
    float edge = scale > 1.0f ? scale : 1.0f;
    ImVec2 ends[kRouteLineMaxLegs] = {};
    bool endKnown[kRouteLineMaxLegs] = {};
    // Later legs first, so the current leg lies on top. v0.130: each leg is
    // projected whole, then trimmed to the rings at both ends (the arriving
    // leg at its stop, the next leg at the same stop).
    static thread_local ImVector<ImVec2> line;
    for (unsigned leg = route.legCount; leg-- > 0;) {
        const RouteLineLeg& item = route.legs[leg];
        if (item.count < 2 || item.first + item.count > route.pointCount) {
            continue;
        }
        line.resize(0);
        bool known = true;
        for (unsigned point = 0; point < item.count && known; ++point) {
            ImVec2 spot;
            known = project(route.points[item.first + point], spot);
            line.push_back(spot);
        }
        if (!known) {
            continue;
        }
        ends[leg] = line[line.Size - 1];
        endKnown[leg] = true;
        if (!TrimEnd(line, iconHalf[leg]) || (leg > 0 && !TrimStart(line, iconHalf[leg - 1]))) {
            continue;
        }
        for (int point = 1; point < line.Size; ++point) {
            DrawLeg(draw, line[point - 1], line[point], leg == 0 ? red : redLater, border,
                (leg == 0 ? 4.0f : 3.0f) * scale, edge, clip, centre, radius);
        }
    }
    // A ring around each stop's icon: v0.130, a soft glow (outermost and
    // faintest first) and a hairline at the icon's edge.
    float hairline = kHairlineWidth * scale;
    float glowWidth = kGlowRingWidth * scale;
    for (unsigned leg = 0; leg < route.legCount; ++leg) {
        if (!endKnown[leg] || !InsideCircle(ends[leg], centre, radius, clip)) {
            continue;
        }
        for (unsigned glow = kGlowRings; glow-- > 0;) {
            float fade = 1.0f - static_cast<float>(glow) / kGlowRings;
            draw->AddCircle(ends[leg], iconHalf[leg] + 0.5f * hairline + glowWidth * (glow + 0.5f),
                colour(ImVec4(kRed.x, kRed.y, kRed.z, kGlowOpacity * fade * fade)), 48, glowWidth);
        }
        draw->AddCircle(ends[leg], iconHalf[leg], red, 48, hairline);
    }
}

} // namespace

// See RouteOverlay.h.
bool PywelRouteOverlayWanted() {
    OverlayInputs inputs = TakeInputs();
    float card[4] = {};
    bool cardOpen = PywelMapKnowledgeCardState(card);
    return inputs.settings.shown && lines.legCount > 0 &&
        ((inputs.worldByOverlay && !cardOpen && PywelRouteWorldLayerMatches()) || inputs.minimapByOverlay);
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
        // v0.124: and only while the map shows the player's layer.
        if (!inputs.worldByOverlay || PywelMapKnowledgeCardState(card) || !PywelRouteWorldLayerMatches()) {
            return;
        }
        for (unsigned leg = 0; leg < lines.legCount; ++leg) {
            iconHalf[leg] = kWorldRingRadius * scale;
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
        for (unsigned leg = 0; leg < lines.legCount; ++leg) {
            iconHalf[leg] = kMinimapRingRadius * scale;
        }
        // v0.133: the minimap's line thinner, as on its canvas (RouteCanvas.cpp).
        const PywelMinimapView& view = inputs.minimap;
        DrawLines(draw, lines, [&](const RoutePoint& point, ImVec2& out) {
            return PywelRouteMinimapToScreen(view, point.x, point.z, width, height, out.x, out.y);
        }, iconHalf, scale * 0.62f, colour, true, ImVec2(centreX, centreY), radius);
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
        // 0.29.0: the player log notes the route going on or off.
        if (changed.shown != choice.shown) {
            // 0.29.1: an event as well, so bug reports list it with the panel's other changes.
            PywelReleaseNote("route", "Route turned %s (%u stops)", changed.shown ? "on" : "off", changed.stops);
        }
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

    // 0.29.0: a tracked Legendary Animal (clicked on the world map) pauses
    // the route; this button, or another click on its marker, ends it.
    PywelAnimalPathState animals = {};
    if (PywelGetAnimalPathState(animals) && animals.tracked >= 0 && animals.trackedName) {
        if (ImGui::Button("Stop tracking")) {
            PywelStopTrackingAnimal();
        }
        ImGui::SameLine();
        ImGui::TextDisabled("Tracking %s", animals.trackedName);
    } else {
        ImGui::TextDisabled("Click a Legendary Animal on the world map to track it.");
    }
}
