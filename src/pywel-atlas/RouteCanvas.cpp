// =============================================================================
// Pywel Atlas - the route line drawn on our own map canvases
// (RouteCanvas.cpp, v0.111-v0.121)
// =============================================================================
//
// WHAT THIS FILE DOES
//   Draws our route on two line canvases of our own, right after each map
//   update, with the game's own canvas drawing functions. See RouteCanvas.h.
//   - World map: #PywelRouteCanvas, added by the UI add-on (v0.86) right
//     after the game's #WorldmapCanvas, so it pans and zooms with the map,
//     the icons draw above it and the knowledge card and popups cover it.
//   - Minimap: #PywelRouteMinimapCanvas, added right after the game's
//     #MinimapDestinationCanvas, inside the round mask and the layer the
//     minimap turns with the camera, so it is clipped to the circle and
//     turns with it. Full opacity (its own style rule, class
//     pywel-route-minimap-canvas; the game's destination canvas is at 75%).
//
// WHY OUR OWN CANVASES (v0.121)
//   v0.111-v0.120 drew on the game's own canvases. That caused:
//   - Dashes and teeth on the world map: #WorldmapCanvas uses the material
//     "UICanvasWorldMapPath" with the preset preset-ui-canvas-worldmap-path
//     (worldmapview.css: dots 40 long, 10 apart, with noise), which draws
//     every line as a dotted line. Our pieces each restarted the dot
//     pattern, so v0.118's overlapping pieces showed as teeth. Our canvas has
//     no material: plain solid lines.
//   - Flicker on the minimap: we shared #MinimapDestinationCanvas with the
//     game's destination line and had to clear it and skip updates.
//   Our canvases are ours alone: each update we clear and redraw them. The
//   game's canvases are no longer touched, so its own lines are unchanged.
//   If a canvas is not found (UI add-on missing or older), nothing is drawn
//   there and the ImGui overlay draws the line instead (RouteOverlay.cpp).
//
// THE LOOK (v0.115, user request: like the Crimson Route mod)
//   One solid crimson line (#d14d45) on a slightly wider dark-crimson
//   outline, the same thickness at every zoom; later legs a little thinner
//   and muted (v0.118); a small crimson dot (with the dark edge) under each
//   stop. Corners are softened with two passes of Chaikin corner cutting
//   (each corner replaced by two points a quarter of the way along its
//   sides; v0.118).
//   - Colours: the canvas takes (blue, green, red, opacity) in linear light,
//     not the usual sRGB red-green-blue: the game makes its own route colour
//     that way from "#d14d45" (0x1423600, then 0x5b3610).
//
// FINDING OUR CANVASES (static research, Ghidra export)
//   The game finds its own canvases with 0xcb7a70: it reads a selector
//   attribute (like selector-minimap-dest-canvas="#MinimapDestinationCanvas")
//   from the page and runs the selector query 0x3d1dab0 from the page's
//   element (controller + 0x8). We call 0x3d1dab0 the same way with our own
//   selector text in a permanent string object (reference count -1, which
//   the game's string release 0x394db0 never frees). The result is the
//   element's script object; we accept it only if it is a UICanvas. The
//   result is kept until the game's own canvas pointer changes (the page was
//   rebuilt); a failed search is retried every 2 s.
//
// HOW THE CANVASES DRAW (static research)
//   - A canvas object (class UICanvas, vtable 0x5d49c58) keeps its strokes
//     until cleared (vtable slot 0x380, 0x3d11360), a 4 x 4 transform at
//     +0x38 .. +0x77, and its element at +0x8. 0x3d14990 adds a line through
//     a list of 2D points.
//   - World map transform (the game's own, from 0xdbdcb0), with U = the
//     interface scale, a98 = metres per canvas unit, (a58, a5c) = the map
//     centre and W, H = the map root's size in canvas units: k = U / a98,
//     tx = W / 2 * a98 - a58, ty = H / 2 * a98 + a5c, rows (k, 0, 0, 0),
//     (0, k, 0, 0), (0, 0, 1, 0), (tx * k, ty * k, 0, 1); points are
//     (X, -Z) in world metres, widths in metres.
//   - Minimap: one metre is ctrl[0x554] canvas units on screen, like the
//     icons. A point is placed at
//         W / 2 + (X - Px) * ctrl[0x554] / Sx,  H / 2 + (Pz - Z) * ctrl[0x554] / Sy
//     (W, H = the canvas element's size, Sx, Sy = its style scale: the game
//     sets it on its own destination canvas; ours keeps 1).
//
// WHAT WE DO, each update
//   1. Check (once) the canvas class, the clear slot and the guard bytes of
//      the drawing and query functions.
//   2. Find our canvas (cached, see above).
//   3. Clear it. If the route is shown with the canvas line style, world
//      map: set the transform; then add each leg (smoothed) as an outline
//      line and a crimson line on top, and a dot under each stop.
//   Never waits on a lock: if the route copy is busy, the previous copy is
//   drawn.
// =============================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <cmath>
#include <cstdint>
#include <cstring>

#include "RouteCanvas.h"
#include "RouteLines.h"
#include "RouteSystem.h"

namespace {

// Game addresses (RVAs, this executable build).
constexpr uintptr_t kWorldCanvasOffset = 0x7b8; // World map controller -> the game's #WorldmapCanvas.
constexpr uintptr_t kMinimapCanvasOffset = 0x400; // Minimap controller -> the game's #MinimapDestinationCanvas.
constexpr uintptr_t kCanvasVtableRva = 0x5d49c58; // pa::UICanvas.
constexpr uintptr_t kClearRva = 0x3d11360; // Canvas vtable slot 0x380: remove every stroke.
constexpr uintptr_t kPolylineRva = 0x3d14990; // A line through a list of 2D points.
constexpr uintptr_t kQueryRva = 0x3d1dab0; // Selector query (as 0xcb7a70 uses it).
constexpr uintptr_t kPerspectiveFlagRva = 0x6d66cd8; // 3D map mode (a debug switch, normally 0).
constexpr unsigned kClearSlot = 0x380;
// The polyline function starts with a jump into the game's protected code;
// these are its first 24 bytes in the supported build.
constexpr BYTE kPolylineGuard[24] = {
    0xe9, 0x7b, 0xdb, 0xce, 0x10, 0x4e, 0x0f, 0x8d, 0x1a, 0xca, 0x0d, 0x03,
    0x74, 0x8f, 0xff, 0x86, 0xdb, 0xc4, 0xa9, 0x36, 0x0f, 0x86, 0x82, 0x5e,
};
// v0.121: the first 24 bytes of the selector query function.
constexpr BYTE kQueryGuard[24] = {
    0x40, 0x55, 0x53, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56, 0x41,
    0x57, 0x48, 0x8d, 0xac, 0x24, 0x98, 0xfc, 0xff, 0xff, 0x48, 0x81, 0xec,
};
// Our canvases' selectors (ids set by the UI add-on, v0.86).
constexpr char kWorldSelector[] = "#PywelRouteCanvas";
constexpr char kMinimapSelector[] = "#PywelRouteMinimapCanvas";
// A failed search is retried after this long (milliseconds).
constexpr ULONGLONG kLookupRetry = 2000;

// The point list the drawing functions read: pointer and count (the game's
// own dynamic array; they copy the points, so ours may live anywhere).
struct CanvasPoints {
    const float* data; // x, y pairs.
    unsigned count;
    unsigned capacity;
};
// 0x3d14990's arguments, as the game's own call site 0xdbe6b9 passes them.
using AddPolyline = void (*)(void* canvas, const CanvasPoints* points, const float* colour, float width,
    float width2, float zero, uintptr_t unused, BYTE flag);
// Slot 0x380: clear.
using ClearCanvas = void (*)(void* canvas);

// The game's string object, as 0x14203f0 builds it: text pointer, length,
// -1, reference count, a flag, then the characters. A negative reference
// count marks a string that is never freed.
struct GameString {
    const char* text;
    int length;
    int minusOne;
    int references;
    BYTE flag;
};
// 0x3d1dab0's two arguments, as 0xcb7a70 fills them on its stack: the
// element to search from, the selector string, then 1 and 0x101.
struct QueryArgs {
    void* root;
    const GameString* selector;
    unsigned long long one;
    unsigned short flags;
};
struct QueryResults {
    void** data; // Starts at `inlined`; the query only grows it past 10 results.
    unsigned count;
    unsigned capacity;
    void* inlined[10];
};
using SelectorQuery = void (*)(QueryArgs* args, QueryResults* results);

// A canvas colour: linear blue, green, red, then opacity (see THE LOOK).
struct CanvasColour {
    float channel[4];
};

// sRGB 0..255 to linear light, as the game's 0x5b3610 does.
float Linear(unsigned value) {
    float c = value / 255.0f;
    return c < 0.04045f ? c / 12.92f : std::pow((c + 0.055f) / 1.055f, 2.4f);
}

// The canvas colour for 0xRRGGBB and an opacity.
CanvasColour ColourOf(unsigned rgb, float opacity) {
    return {{Linear(rgb & 0xff), Linear((rgb >> 8) & 0xff), Linear((rgb >> 16) & 0xff), opacity}};
}

// Colours (sRGB hex as designers write them).
constexpr unsigned kCrimson = 0xd14d45; // The game's destination line colour.
constexpr unsigned kOutline = 0x4a1210; // Dark crimson outline.
// v0.118: later legs in muted colours (crimson and outline mixed 75 / 25 with
// the map's parchment tone), fully opaque.
constexpr unsigned kCrimsonLater = 0xcd6658;
constexpr unsigned kOutlineLater = 0x673a30;
// Sizes in UI pixels at 1080 lines (scaled with the map's height).
constexpr float kCurrentWidth = 4.0f;
constexpr float kLaterWidth = 3.0f;
constexpr float kOutlineExtra = 1.5f; // Outline width = line width + 2 x this.
constexpr float kDotSize = 6.0f;
constexpr float kCurrentDotSize = 8.0f;
// The minimap's icons are smaller than the world map's (canvas units).
constexpr float kMinimapIconHalf = 12.0f;
// Room for one leg's points once smoothed (a leg holds at most 1024 + 2
// points, see RouteSystem.cpp; each smoothing pass nearly doubles them).
constexpr unsigned kLinePointRoom = 4 * 1030;
constexpr unsigned kSmoothPasses = 2;

uintptr_t imageBase = 0;
AddPolyline addPolyline = nullptr;
SelectorQuery selectorQuery = nullptr;
volatile LONG guardsChecked = 0;
volatile LONG guardsMatched = 0;

// Everything one map keeps between updates (that map's thread only).
struct CanvasState {
    void* gameCanvas; // The game's canvas pointer when we searched.
    void* ourCanvas; // Our canvas, or null if not found.
    ULONGLONG lastLookup; // GetTickCount64 of the last search.
    RouteLines lines; // Copy of the route (large, so not on the stack).
    float points[2 * kLinePointRoom]; // One leg's points.
    float smooth[2 * kLinePointRoom]; // Smoothing scratch.
};
CanvasState worldState = {};
CanvasState minimapState = {};

// Counters for the log (one set per map).
struct Counters {
    volatile LONG updates;
    volatile LONG drawn;
    volatile LONG notFound;
    volatile LONG cleared;
    volatile LONG matrixWrites;
    volatile LONG lookups;
    volatile LONG polylines;
    volatile LONG widthBits;
    volatile LONG64 lastDraw;
};
Counters worldCounters = {};
Counters minimapCounters = {};

// Safely copies `size` bytes; false instead of a crash if not readable.
bool Read(const void* address, void* destination, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(), address, destination, size, &read) && read == size;
}

// Reads a pointer at `address + offset` (0 if unreadable).
uintptr_t ReadPointer(uintptr_t address, uintptr_t offset) {
    uintptr_t value = 0;
    return address && Read(reinterpret_cast<const void*>(address + offset), &value, sizeof(value)) ? value : 0;
}

// True if `size` bytes at `rva` are `expected`.
bool BytesMatch(uintptr_t rva, const BYTE* expected, size_t size) {
    BYTE code[24] = {};
    return size <= sizeof(code) && Read(reinterpret_cast<const void*>(imageBase + rva), code, size) &&
        memcmp(code, expected, size) == 0;
}

// Checks once that this is the studied executable layout.
bool GuardsOk() {
    if (InterlockedCompareExchange(&guardsChecked, 0, 0)) {
        return InterlockedCompareExchange(&guardsMatched, 0, 0) != 0;
    }
    imageBase = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
    bool matched = imageBase && BytesMatch(kPolylineRva, kPolylineGuard, sizeof(kPolylineGuard)) &&
        BytesMatch(kQueryRva, kQueryGuard, sizeof(kQueryGuard)) &&
        ReadPointer(imageBase + kCanvasVtableRva, kClearSlot) == imageBase + kClearRva;
    if (matched) {
        addPolyline = reinterpret_cast<AddPolyline>(imageBase + kPolylineRva);
        selectorQuery = reinterpret_cast<SelectorQuery>(imageBase + kQueryRva);
    }
    InterlockedExchange(&guardsMatched, matched ? 1 : 0);
    InterlockedExchange(&guardsChecked, 1);
    return matched;
}

// True if `object` is a UICanvas script object.
bool IsCanvas(void* object) {
    return object && ReadPointer(reinterpret_cast<uintptr_t>(object), 0) == imageBase + kCanvasVtableRva;
}

// Searches the page of `controller` for the element `selector` and returns
// its canvas, or null. Runs the game's own selector query (see FINDING OUR
// CANVASES).
void* QueryCanvas(void* controller, const char* selector, size_t length) {
    void* root = reinterpret_cast<void*>(ReadPointer(reinterpret_cast<uintptr_t>(controller), 8));
    if (!root) {
        return nullptr;
    }
    GameString text = {selector, static_cast<int>(length), -1, -1, 0};
    QueryArgs args = {root, &text, 1, 0x101};
    QueryResults results = {};
    results.data = results.inlined;
    results.capacity = static_cast<unsigned>(_countof(results.inlined));
    selectorQuery(&args, &results);
    // shortcut: a list grown past 10 results (never for one id) is not freed.
    if (results.count == 0 || results.data != results.inlined) {
        return nullptr;
    }
    return IsCanvas(results.data[0]) ? results.data[0] : nullptr;
}

// Our canvas for this map: the cached one while the game's canvas is the
// same object, else a new search (failed searches retried every 2 s).
template <size_t Length>
void* OurCanvas(void* controller, uintptr_t gameOffset, const char (&selector)[Length], CanvasState& state,
    Counters& counters) {
    void* gameCanvas = reinterpret_cast<void*>(ReadPointer(reinterpret_cast<uintptr_t>(controller), gameOffset));
    if (!IsCanvas(gameCanvas)) {
        // The page is not (or no longer) set up: forget our canvas with it.
        state.gameCanvas = nullptr;
        state.ourCanvas = nullptr;
        return nullptr;
    }
    ULONGLONG now = GetTickCount64();
    bool samePage = gameCanvas == state.gameCanvas;
    if (samePage && state.ourCanvas && IsCanvas(state.ourCanvas)) {
        return state.ourCanvas;
    }
    if (samePage && !state.ourCanvas && now - state.lastLookup < kLookupRetry) {
        return nullptr;
    }
    state.gameCanvas = gameCanvas;
    state.lastLookup = now;
    state.ourCanvas = QueryCanvas(controller, selector, Length - 1);
    InterlockedIncrement(&counters.lookups);
    return state.ourCanvas;
}

// Removes every stroke from `canvas` (vtable slot 0x380).
void Clear(void* canvas, Counters& counters) {
    reinterpret_cast<ClearCanvas>(ReadPointer(imageBase + kCanvasVtableRva, kClearSlot))(canvas);
    InterlockedIncrement(&counters.cleared);
}

// Adds a line through `count` points (x, y pairs), with 0x3d14990.
void AddLine(void* canvas, const float* points, unsigned count, const CanvasColour& colour, float width,
    Counters& counters) {
    if (count < 2) {
        return;
    }
    CanvasPoints list = {points, count, count};
    addPolyline(canvas, &list, colour.channel, width, width, 0.0f, 0, 0);
    InterlockedIncrement(&counters.polylines);
}

// Softens the corners of the `count` points in `state.points` with Chaikin
// corner cutting (end points kept). Returns the new count.
unsigned Smooth(CanvasState& state, unsigned count) {
    for (unsigned pass = 0; pass < kSmoothPasses && count >= 3 && 2 * count <= kLinePointRoom; ++pass) {
        const float* in = state.points;
        float* out = state.smooth;
        unsigned made = 0;
        out[0] = in[0];
        out[1] = in[1];
        ++made;
        for (unsigned point = 0; point + 1 < count; ++point) {
            float ax = in[2 * point];
            float ay = in[2 * point + 1];
            float bx = in[2 * point + 2];
            float by = in[2 * point + 3];
            if (point > 0) {
                out[2 * made] = 0.75f * ax + 0.25f * bx;
                out[2 * made + 1] = 0.75f * ay + 0.25f * by;
                ++made;
            }
            if (point + 2 < count) {
                out[2 * made] = 0.25f * ax + 0.75f * bx;
                out[2 * made + 1] = 0.25f * ay + 0.75f * by;
                ++made;
            }
        }
        out[2 * made] = in[2 * (count - 1)];
        out[2 * made + 1] = in[2 * (count - 1) + 1];
        ++made;
        memcpy(state.points, state.smooth, 2 * made * sizeof(float));
        count = made;
    }
    return count;
}

// Draws every leg of state.lines with `place` turning a world point into the
// canvas's own coordinates, then a dot under each stop. `unit` is canvas
// coordinates per UI pixel, `down` the direction "down the screen" in canvas
// coordinates (one unit long), `iconHalf` gives each stop's icon half-size in
// canvas coordinates.
template <typename Place, typename IconHalf>
void DrawLegs(void* canvas, CanvasState& state, Place place, float unit, float heightScale, float downX,
    float downY, IconHalf iconHalf, Counters& counters) {
    const RouteLines& route = state.lines;
    CanvasColour crimson = ColourOf(kCrimson, 1.0f);
    CanvasColour crimsonLater = ColourOf(kCrimsonLater, 1.0f);
    CanvasColour outline = ColourOf(kOutline, 1.0f);
    CanvasColour outlineLater = ColourOf(kOutlineLater, 1.0f);
    float outlineExtra = 2.0f * kOutlineExtra * heightScale * unit;
    float currentWidth = kCurrentWidth * heightScale * unit;
    LONG widthBits = 0;
    memcpy(&widthBits, &currentWidth, sizeof(widthBits));
    InterlockedExchange(&counters.widthBits, widthBits);

    // Later legs first, so the current leg lies on top; outline under line.
    for (unsigned leg = route.legCount; leg-- > 0;) {
        const RouteLineLeg& item = route.legs[leg];
        if (item.count < 2 || item.first + item.count > route.pointCount || item.count > kLinePointRoom) {
            continue;
        }
        for (unsigned point = 0; point < item.count; ++point) {
            place(route.points[item.first + point], state.points[2 * point], state.points[2 * point + 1]);
        }
        float width = (leg == 0 ? kCurrentWidth : kLaterWidth) * heightScale * unit;
        unsigned smoothed = Smooth(state, item.count);
        AddLine(canvas, state.points, smoothed, leg == 0 ? outline : outlineLater, width + outlineExtra, counters);
        AddLine(canvas, state.points, smoothed, leg == 0 ? crimson : crimsonLater, width, counters);
    }
    // A dot just under each stop's icon (the last point of its leg): a very
    // short, thick piece, outline first.
    for (unsigned leg = 0; leg < route.legCount; ++leg) {
        const RouteLineLeg& item = route.legs[leg];
        if (item.count == 0 || item.first + item.count > route.pointCount) {
            continue;
        }
        float size = (leg == 0 ? kCurrentDotSize : kDotSize) * heightScale * unit;
        float x = 0.0f;
        float y = 0.0f;
        place(route.points[item.first + item.count - 1], x, y);
        float below = iconHalf(item.category) + size * 0.5f + unit;
        x += downX * below;
        y += downY * below;
        // The piece runs across the screen (perpendicular to "down").
        float acrossX = -downY * 0.05f * unit;
        float acrossY = downX * 0.05f * unit;
        float dash[4] = {x - acrossX, y - acrossY, x + acrossX, y + acrossY};
        AddLine(canvas, dash, 2, outline, size + outlineExtra, counters);
        AddLine(canvas, dash, 2, crimson, size, counters);
    }
}

// Counts an update in which our lines were drawn.
void Finish(Counters& counters) {
    InterlockedIncrement(&counters.drawn);
    InterlockedExchange64(&counters.lastDraw, static_cast<LONG64>(GetTickCount64()));
}

// Copies one map's counters into `stats`.
void CopyCounters(const Counters& counters, RouteCanvasStats::Map& stats) {
    stats.updates = counters.updates;
    stats.drawn = counters.drawn;
    stats.notFound = counters.notFound;
    stats.cleared = counters.cleared;
    stats.matrixWrites = counters.matrixWrites;
    stats.lookups = counters.lookups;
    stats.polylines = counters.polylines;
    LONG bits = counters.widthBits;
    memcpy(&stats.lastWidth, &bits, sizeof(float));
    stats.lastDrawTick = static_cast<unsigned long long>(counters.lastDraw);
}

} // namespace

// See RouteCanvas.h.
void PywelRouteDrawWorldCanvas(void* controller) {
    InterlockedIncrement(&worldCounters.updates);
    if (!controller || !GuardsOk()) {
        return;
    }
    CanvasState& state = worldState;
    void* canvas = OurCanvas(controller, kWorldCanvasOffset, kWorldSelector, state, worldCounters);
    if (!canvas) {
        InterlockedIncrement(&worldCounters.notFound);
        return;
    }
    // Ours alone: start empty every update (also when the line is off).
    Clear(canvas, worldCounters);
    PywelRouteSettings settings = PywelGetRouteSettings();
    BYTE perspective = 1;
    if (!settings.shown || !settings.worldLine || !settings.canvasLine ||
        !Read(reinterpret_cast<const void*>(imageBase + kPerspectiveFlagRva), &perspective, sizeof(perspective)) ||
        perspective != 0) {
        return;
    }

    // The map's view: centre and scale from the controller, interface scale
    // and root size from this update's snapshot.
    auto* bytes = static_cast<BYTE*>(controller);
    float centreX = 0.0f;
    float centreZ = 0.0f;
    float metresPerUnit = 0.0f;
    PywelWorldMapView view = {};
    if (!Read(bytes + 0xa58, &centreX, sizeof(float)) || !Read(bytes + 0xa5c, &centreZ, sizeof(float)) ||
        !Read(bytes + 0xa98, &metresPerUnit, sizeof(float)) || !(metresPerUnit > 0.0f) ||
        !PywelGetWorldMapView(view) || !view.root.valid || !(view.uiScale > 0.0f)) {
        return;
    }
    float scale = view.uiScale;

    // The transform, the game's own formula (see HOW THE CANVASES DRAW).
    float width = view.root.width / scale; // Canvas units.
    float height = view.root.height / scale;
    float k = scale / metresPerUnit;
    float tx = width * 0.5f * metresPerUnit - centreX;
    float ty = height * 0.5f * metresPerUnit + centreZ;
    float matrix[16] = {k, 0.0f, 0.0f, 0.0f, 0.0f, k, 0.0f, 0.0f, 0.0f, 0.0f, 1.0f, 0.0f, tx * k, ty * k, 0.0f, 1.0f};
    SIZE_T written = 0;
    if (!WriteProcessMemory(GetCurrentProcess(), static_cast<BYTE*>(canvas) + 0x38, matrix, sizeof(matrix),
        &written) || written != sizeof(matrix)) {
        return;
    }
    InterlockedIncrement(&worldCounters.matrixWrites);
    if (!PywelGetRouteLines(state.lines) || state.lines.legCount == 0) {
        return;
    }

    // World points (X, -Z) in metres; one UI pixel = a98 / U metres; down the
    // screen = towards -Z, i.e. +y here.
    float heightScale = view.root.height / 1080.0f;
    DrawLegs(canvas, state, [](const RoutePoint& point, float& x, float& y) {
        x = point.x;
        y = -point.z;
    }, metresPerUnit / scale, heightScale, 0.0f, 1.0f, [&](unsigned category) {
        return (category < kPywelMarkerCategories ? kRouteWorldIconHalf[category] : 16.0f) * metresPerUnit;
    }, worldCounters);
    Finish(worldCounters);
}

// See RouteCanvas.h.
void PywelRouteDrawMinimapCanvas(void* controller) {
    InterlockedIncrement(&minimapCounters.updates);
    if (!controller || !GuardsOk()) {
        return;
    }
    CanvasState& state = minimapState;
    void* canvas = OurCanvas(controller, kMinimapCanvasOffset, kMinimapSelector, state, minimapCounters);
    if (!canvas) {
        InterlockedIncrement(&minimapCounters.notFound);
        return;
    }
    // Ours alone: start empty every update (also when the line is off).
    Clear(canvas, minimapCounters);
    PywelRouteSettings settings = PywelGetRouteSettings();
    if (!settings.shown || !settings.minimapLine || !settings.canvasLine) {
        return;
    }
    auto* bytes = static_cast<BYTE*>(controller);

    // The minimap's view this update: player, metres-to-canvas scale, turn.
    float player[3] = {};
    float unitsPerMetre = 0.0f;
    float yaw = 0.0f;
    PywelMinimapView view = {};
    if (!Read(bytes + 0x330, player, sizeof(player)) || !Read(bytes + 0x554, &unitsPerMetre, sizeof(float)) ||
        !Read(bytes + 0x530, &yaw, sizeof(float)) || !(unitsPerMetre > 0.0f) || !PywelGetMinimapView(view) ||
        !(view.uiScale > 0.0f)) {
        return;
    }
    // The canvas element: its size (canvas units) and its style scale (1
    // unless something set one).
    uintptr_t node = ReadPointer(ReadPointer(ReadPointer(reinterpret_cast<uintptr_t>(canvas), 8), 0x18), 0);
    float size[2] = {};
    if (!node || !Read(reinterpret_cast<const void*>(node + 0x78), size, sizeof(size)) || !(size[0] > 0.0f)) {
        return;
    }
    uintptr_t style = ReadPointer(ReadPointer(node, 0x20), 0x20);
    float sx = 1.0f;
    float sy = 1.0f;
    if (style && (!Read(reinterpret_cast<const void*>(style + 0x20), &sx, sizeof(float)) ||
        !Read(reinterpret_cast<const void*>(style + 0x28), &sy, sizeof(float)) || !(sx > 0.0f) || !(sy > 0.0f))) {
        sx = 1.0f;
        sy = 1.0f;
    }
    float halfWidth = size[0] / view.uiScale * 0.5f;
    float halfHeight = size[1] / view.uiScale * 0.5f;
    if (!PywelGetRouteLines(state.lines) || state.lines.legCount == 0) {
        return;
    }

    // Canvas coordinates: centre plus metres x ctrl[0x554] / style scale.
    // One UI pixel on screen = 1 / (Sx * U) canvas coordinates. The layer
    // turns by -yaw, so "down the screen" here is (0, 1) turned by +yaw.
    float px = player[0];
    float pz = player[2];
    float angle = yaw * 3.14159265f / 180.0f;
    float unit = 1.0f / (sx * view.uiScale);
    // Sizes follow the screen height, like the world map's (1080 lines = 1x).
    float heightScale = view.root.valid && view.root.height > 0.0f ? view.root.height / 1080.0f : 1.0f;
    DrawLegs(canvas, state, [&](const RoutePoint& point, float& x, float& y) {
        x = halfWidth + (point.x - px) * unitsPerMetre / sx;
        y = halfHeight + (pz - point.z) * unitsPerMetre / sy;
    }, unit, heightScale, -std::sin(angle), std::cos(angle), [&](unsigned) {
        return kMinimapIconHalf / sx;
    }, minimapCounters);
    Finish(minimapCounters);
}

// See RouteCanvas.h.
void PywelGetRouteCanvasStats(RouteCanvasStats& stats) {
    stats.guardsChecked = InterlockedCompareExchange(&guardsChecked, 0, 0) != 0;
    stats.guardsMatched = InterlockedCompareExchange(&guardsMatched, 0, 0) != 0;
    CopyCounters(worldCounters, stats.world);
    CopyCounters(minimapCounters, stats.minimap);
    CanvasColour crimson = ColourOf(kCrimson, 1.0f);
    CanvasColour outline = ColourOf(kOutline, 1.0f);
    memcpy(stats.crimson, crimson.channel, sizeof(stats.crimson));
    memcpy(stats.outline, outline.channel, sizeof(stats.outline));
}
