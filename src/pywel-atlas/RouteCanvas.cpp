// =============================================================================
// Pywel Atlas - the route line drawn on our own map canvases
// (RouteCanvas.cpp, v0.111-v0.133)
// =============================================================================
//
// WHAT THIS FILE DOES
//   Draws our route on line canvases of our own, right after each map
//   update, with the game's own canvas drawing functions. See RouteCanvas.h.
//   - World map: #PywelRouteCanvasPlain, added by the UI add-on right after
//     the game's #WorldmapCanvas, so it pans and zooms with the map, the
//     icons draw above it and the knowledge card and popups cover it.
//     (v0.124-v0.132 also had a "Painted" canvas with the game's map line
//     material; Thomas's v0.132 test: the material binds, but its dots
//     vanish at some zooms and the minimap cannot use it, so v0.133 and
//     add-on v0.91 keep only this plain one.)
//   - Minimap: #PywelRouteMinimapCanvas, right after the game's
//     #MinimapDestinationCanvas, inside the round mask and the layer the
//     minimap turns with the camera; full opacity (its own style rule).
//   The game's canvases are never touched. Without our canvases the ImGui
//   overlay draws the line instead (RouteOverlay.cpp).
//
// THE LOOK
//   One crimson line (#d14d45) on a slightly wider dark-crimson outline, the
//   same thickness at every zoom; later legs a little thinner and muted.
//   v0.124: each leg is one continuous path (vtable slot 0x398, as the game
//   draws its own route). v0.131: slot 0x398 (0x3d14ff0) is a smooth curve
//   of its own: a cubic B-spline through the points, sampled at least 6
//   times per point (more for long sides), handed to the line call
//   0x3d14990. So our own Chaikin smoothing (v0.118-v0.130) is gone, the
//   rings use 0x3d14990 directly, and each update stays within
//   kGeometryBudget points (see THE GEOMETRY BUDGET).
//   v0.133: that curve does not pass through its end points, so a leg
//   curled past or round its stop's ring. Each leg's first and last point is
//   now given twice more (a "clamped" B-spline starts and ends exactly
//   there), and before the trim to the ring any of its points inside the
//   ring are dropped, so the last piece comes straight in to the ring. The
//   minimap line and its ring glow are drawn thinner (kMinimapLineScale). Each stop gets a ring centred on its icon, just
//   outside the icon's edge and under it. v0.130 (Thomas's option 3; v0.124
//   drew a heavier ring with a dark outline): a soft crimson glow, 8
//   concentric rings fading out over about 12 UI px, and a 1 px crimson
//   hairline at the icon's edge. Legs end at the hairline.
//   Colours: the canvas takes (blue, green, red, opacity) in linear light.
//
// FINDING OUR CANVASES (v0.124: two ways, both logged)
//   1. The game's selector query 0x3d1dab0, called as 0xcb7a70 calls it
//      (root = the page element at controller + 0x8, a permanent string
//      object with reference count -1). It returns the element (vtable rva
//      0x5d6b618 in the v0.127 log), whose +0xd8 is the canvas object;
//      v0.121-v0.123 checked the element itself, so it "never found" ours.
//      v0.130 takes +0xd8. The same query also runs for the game's own
//      canvas as a control.
//   2. A read-only walk of the page's elements: an element keeps its
//      children at +0x40 (array) and +0x48 (count), and element +0xd8 points
//      at its owner object (as the marker part's FindPictureInContainers
//      uses for icon pictures). Starting from the page element, it looks for
//      the element of the game's own canvas (gameCanvas + 0x8); our canvases
//      are its next siblings (the add-on puts them right after it), and
//      their +0xd8 must be a UICanvas.
//   A result is kept until the game's canvas pointer changes (page rebuilt).
//   v0.130 test: when the world map canvases are found, the first 0x200
//   bytes of the game's #WorldmapCanvas, our Painted and our Plain canvas
//   objects are logged (8 values a line), to see whether the Painted canvas
//   got the game's material (a pointer it shares with the game's canvas and
//   the Plain one lacks).
//   A failed search is retried every 2 s; the child walk and the report run
//   on the first 5 tries, then every 30th.
//
// THE GEOMETRY BUDGET (v0.131)
//   v0.130 drew 9 rings of 49 points per stop through slot 0x398; its curve
//   turned each ring into about 280 points, about 25,000 per update with 10
//   stops (v0.127: 4 rings, about 11,000). Thomas then saw huge filled
//   triangles across the world map: a canvas holds only so many points
//   (most likely 65,536 corners, a 16-bit index), and past that its shapes
//   reuse wrong corners. Now the rings go straight to 0x3d14990 (33 points
//   each), every stroke's cost is counted before anything is drawn (for a
//   path, the points its curve will make), and strokes beyond the budget
//   are left out, nearest first kept: the current leg, its stop's ring,
//   then the next leg and ring, and so on. Every count is checked against
//   its buffer; a leg that does not fit is skipped, never drawn wrong.

// THE MAP LAYER (v0.124)
//   The world map shows either the surface or the Abyss. The world map
//   controller's +0x468 points at one "layer showing" byte per layer class
//   (3 = Abyss; static research for v0.80). The route is drawn on the world
//   map only while the shown layer is the player's own (minimap +0x569).
//
// HOW THE CANVASES DRAW (static research)
//   - A canvas object (class UICanvas, vtable 0x5d49c58) keeps its strokes
//     at +0x98 (count at +0xa0) until cleared (vtable slot 0x380,
//     0x3d11360), a 4 x 4 transform at +0x38 .. +0x77, and its element at
//     +0x8. Slot 0x398 (0x3d11b90) adds a path through 3 or more 2D points.
//   - World map transform (the game's own, from 0xdbdcb0), with U = the
//     interface scale, a98 = metres per canvas unit, (a58, a5c) = the map
//     centre and W, H = the map root's size in canvas units: k = U / a98,
//     tx = W / 2 * a98 - a58, ty = H / 2 * a98 + a5c, rows (k, 0, 0, 0),
//     (0, k, 0, 0), (0, 0, 1, 0), (tx * k, ty * k, 0, 1); points are
//     (X, -Z) in world metres, widths in metres.
//   - Minimap: a point is placed at
//         W / 2 + (X - Px) * ctrl[0x554] / Sx,  H / 2 + (Pz - Z) * ctrl[0x554] / Sy
//     (W, H = the canvas element's size, Sx, Sy = its style scale, 1 for ours).
//
// WHAT WE DO, each update
//   1. Check (once) the canvas class, the clear and path slots and the guard
//      bytes of the query function.
//   2. World map: read the layer bytes. Find our canvas (cached).
//   3. If the route is off for this map (or the map shows the other layer):
//      clear our canvas if it still holds lines. Otherwise, once the view
//      is readable: clear it, set the transform (world map) and add the legs
//      and rings. A canvas is never cleared without being redrawn while the
//      route is on, so a missing input keeps the last lines.
// =============================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>

#include "RouteCanvas.h"
#include "RouteLines.h"
#include "RouteSystem.h"

namespace {

// Game addresses (RVAs, this executable build).
constexpr uintptr_t kWorldCanvasOffset = 0x7b8; // World map controller -> the game's #WorldmapCanvas.
constexpr uintptr_t kMinimapCanvasOffset = 0x400; // Minimap controller -> the game's #MinimapDestinationCanvas.
constexpr uintptr_t kLayerShowingOffset = 0x468; // World map controller -> one "layer showing" byte per class.
constexpr unsigned kAbyssLayerClass = 3;
constexpr uintptr_t kCanvasVtableRva = 0x5d49c58; // pa::UICanvas.
constexpr uintptr_t kClearRva = 0x3d11360; // Canvas vtable slot 0x380: remove every stroke.
constexpr uintptr_t kPathRva = 0x3d11b90; // Canvas vtable slot 0x398: a B-spline path (v0.131 note).
constexpr uintptr_t kPolylineRva = 0x3d14990; // v0.131: a line through 2D points (the rings).
constexpr uintptr_t kQueryRva = 0x3d1dab0; // Selector query (as 0xcb7a70 uses it).
constexpr uintptr_t kPerspectiveFlagRva = 0x6d66cd8; // 3D map mode (a debug switch, normally 0).
constexpr unsigned kClearSlot = 0x380;
constexpr unsigned kPathSlot = 0x398;
// v0.131: the polyline function starts with a jump into the game's
// protected code; these are its first 24 bytes in the supported build.
constexpr BYTE kPolylineGuard[24] = {
    0xe9, 0x7b, 0xdb, 0xce, 0x10, 0x4e, 0x0f, 0x8d, 0x1a, 0xca, 0x0d, 0x03,
    0x74, 0x8f, 0xff, 0x86, 0xdb, 0xc4, 0xa9, 0x36, 0x0f, 0x86, 0x82, 0x5e,
};
// The first 24 bytes of the selector query function.
constexpr BYTE kQueryGuard[24] = {
    0x40, 0x55, 0x53, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56, 0x41,
    0x57, 0x48, 0x8d, 0xac, 0x24, 0x98, 0xfc, 0xff, 0xff, 0x48, 0x81, 0xec,
};
// Element layout (see FINDING OUR CANVASES).
constexpr uintptr_t kChildrenOffset = 0x40;
constexpr uintptr_t kChildCountOffset = 0x48;
constexpr uintptr_t kOwnerOffset = 0xd8;
constexpr unsigned kWalkMaxElements = 60000;
constexpr unsigned kWalkMaxChildren = 4096;
// Our canvases' selectors (ids set by the UI add-on, v0.87), and the game's
// own canvases' selectors for the control search.
constexpr char kWorldPlainSelector[] = "#PywelRouteCanvasPlain";
constexpr char kMinimapSelector[] = "#PywelRouteMinimapCanvas";
constexpr char kWorldGameSelector[] = "#WorldmapCanvas";
constexpr char kMinimapGameSelector[] = "#MinimapDestinationCanvas";
// A failed search is retried after this long (milliseconds).
constexpr ULONGLONG kLookupRetry = 2000;

// The point list the drawing functions read: pointer and count (the game's
// own dynamic array; they copy the points, so ours may live anywhere).
struct CanvasPoints {
    const float* data; // x, y pairs.
    unsigned count;
    unsigned capacity;
};
// Slot 0x398's arguments, as the game's own call in 0xdbdcb0 passes them
// (first and last point, the list, colour, two widths, two zeros).
using AddPath = void (*)(void* canvas, const float* first, const float* last, const CanvasPoints* points,
    const float* colour, float width, float width2, unsigned zero, unsigned zero2);
// 0x3d14990's arguments, as the game's own call site 0xdbe6b9 passes them.
using AddPolyline = void (*)(void* canvas, const CanvasPoints* points, const float* colour, float width,
    float width2, float zero, uintptr_t unused, BYTE flag);
// Slot 0x380: clear.
using ClearCanvas = void (*)(void* canvas);

// The game's string object, as 0x14203f0 builds it: text pointer, length,
// -1, reference count, a flag. A negative reference count marks a string
// that is never freed.
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
    unsigned long long flags;
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
// v0.118: later legs in muted colours, fully opaque.
constexpr unsigned kCrimsonLater = 0xcd6658;
constexpr unsigned kOutlineLater = 0x673a30;
// Sizes in UI pixels at 1080 lines (scaled with the map's height).
constexpr float kCurrentWidth = 4.0f;
constexpr float kLaterWidth = 3.0f;
constexpr float kOutlineExtra = 1.5f; // Outline width = line width + 2 x this.
// Stop rings: radius just outside the icon (all markers show about 24 px
// since v0.120; the minimap's are smaller). v0.130: a 1 px hairline there,
// and a glow of kGlowRings 1.5 px rings outside it, fading from
// kGlowOpacity to nothing over about 12 px.
constexpr float kWorldRingRadius = 14.0f;
constexpr float kMinimapRingRadius = 10.0f;
constexpr float kHairlineWidth = 1.0f;
constexpr unsigned kGlowRings = 8;
constexpr float kGlowRingWidth = 1.5f;
constexpr float kGlowOpacity = 0.35f;
constexpr unsigned kRingPoints = 32;
// Room for one leg's points (a leg holds at most 1024 + 2, see RouteSystem.cpp).
constexpr unsigned kLinePointRoom = 1030;
// v0.133: copies added at each end of a leg (see THE LOOK).
constexpr unsigned kClampCopies = 2;
// v0.133: the minimap's line and outline widths, against the world map's
// (Thomas: thinner around the icons); its ring glow is thinned half as much.
constexpr float kMinimapLineScale = 0.62f;
// v0.131: most points the canvas line calls may make in one update (about
// v0.127's amount, which drew correctly).
constexpr unsigned kGeometryBudget = 12000;

uintptr_t imageBase = 0;
AddPath addPath = nullptr;
AddPolyline addPolyline = nullptr;
SelectorQuery selectorQuery = nullptr;
volatile LONG guardsChecked = 0;
volatile LONG guardsMatched = 0;
volatile LONG worldLayerMatches = 1;

// What one map knows about our canvases (that map's thread only).
struct Canvases {
    void* gameCanvas; // The game's canvas pointer when we searched.
    void* ours[2]; // Our canvases (world map: painted, plain; minimap: one).
    const char* found; // How they were found.
    ULONGLONG lastLookup;
    unsigned attempts;
};

// Everything one map keeps between updates (that map's thread only).
struct CanvasState {
    Canvases canvases;
    RouteLines lines; // Copy of the route (large, so not on the stack).
    float points[2 * (kLinePointRoom + 2 * kClampCopies)]; // One leg's points (v0.133: with the end copies).
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
    volatile LONG paths;
    volatile LONG layerSkips;
    volatile LONG budgetSkips; // v0.131.
    volatile LONG layerBytes;
    volatile LONG playerAbyss;
    volatile LONG found; // 0 = not found, 1 = query, 2 = child walk.
    volatile LONG drawnOn; // 0 = none, 1 = painted, 2 = plain.
    volatile LONG widthBits;
    volatile LONG64 lastDraw;
};
Counters worldCounters = {};
Counters minimapCounters = {};

// The latest search report of each map (written on the map threads, read
// by the worker; never waited on by a map thread).
SRWLOCK findLock = SRWLOCK_INIT;
char findText[2][2000] = {};
unsigned findSerial[2] = {};

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

// Checks once that this is the studied executable layout.
bool GuardsOk() {
    if (InterlockedCompareExchange(&guardsChecked, 0, 0)) {
        return InterlockedCompareExchange(&guardsMatched, 0, 0) != 0;
    }
    imageBase = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
    BYTE code[sizeof(kQueryGuard)] = {};
    bool matched = imageBase && Read(reinterpret_cast<const void*>(imageBase + kQueryRva), code, sizeof(code)) &&
        memcmp(code, kQueryGuard, sizeof(code)) == 0 &&
        Read(reinterpret_cast<const void*>(imageBase + kPolylineRva), code, sizeof(code)) &&
        memcmp(code, kPolylineGuard, sizeof(code)) == 0 &&
        ReadPointer(imageBase + kCanvasVtableRva, kClearSlot) == imageBase + kClearRva &&
        ReadPointer(imageBase + kCanvasVtableRva, kPathSlot) == imageBase + kPathRva;
    if (matched) {
        addPath = reinterpret_cast<AddPath>(imageBase + kPathRva);
        addPolyline = reinterpret_cast<AddPolyline>(imageBase + kPolylineRva);
        selectorQuery = reinterpret_cast<SelectorQuery>(imageBase + kQueryRva);
    }
    InterlockedExchange(&guardsMatched, matched ? 1 : 0);
    InterlockedExchange(&guardsChecked, 1);
    return matched;
}

// True if `object` is a UICanvas script object.
bool IsCanvas(uintptr_t object) {
    return object && ReadPointer(object, 0) == imageBase + kCanvasVtableRva;
}

// The object's vtable as an RVA (0 if unreadable), for the report.
uintptr_t VtableRva(uintptr_t object) {
    uintptr_t table = ReadPointer(object, 0);
    return table > imageBase ? table - imageBase : 0;
}

// Runs the game's selector query for `selector` from `root`. Returns the
// number of results and the first one.
unsigned Query(uintptr_t root, const char* selector, uintptr_t& first) {
    first = 0;
    if (!root) {
        return 0;
    }
    GameString text = {selector, static_cast<int>(strlen(selector)), -1, -1, 0};
    QueryArgs args = {reinterpret_cast<void*>(root), &text, 1, 0x101};
    QueryResults results = {};
    results.data = results.inlined;
    results.capacity = static_cast<unsigned>(_countof(results.inlined));
    selectorQuery(&args, &results);
    // shortcut: a list grown past 10 results (never for one id) is not freed.
    if (results.count > 0 && results.data == results.inlined) {
        first = reinterpret_cast<uintptr_t>(results.data[0]);
    }
    return results.count;
}

// The read-only element walk (see FINDING OUR CANVASES): finds the parent
// of `target` below `root` and copies up to two siblings after it. Returns
// how many elements it visited (and `parentFound`). Scratch space per map,
// as the two maps may update on different threads.
unsigned WalkForSiblings(unsigned map, uintptr_t root, uintptr_t target, uintptr_t* siblings, unsigned wanted,
    bool& parentFound) {
    static uintptr_t stacks[2][kWalkMaxElements];
    static uintptr_t lists[2][kWalkMaxChildren];
    uintptr_t* stack = stacks[map];
    uintptr_t* children = lists[map];
    parentFound = false;
    unsigned top = 0;
    unsigned visited = 0;
    stack[top++] = root;
    while (top > 0 && visited < kWalkMaxElements) {
        uintptr_t element = stack[--top];
        ++visited;
        uintptr_t list = ReadPointer(element, kChildrenOffset);
        DWORD count = 0;
        if (!list || !Read(reinterpret_cast<const void*>(element + kChildCountOffset), &count, sizeof(count)) ||
            count == 0 || count > kWalkMaxChildren ||
            !Read(reinterpret_cast<const void*>(list), children, count * sizeof(uintptr_t))) {
            continue;
        }
        for (DWORD child = 0; child < count; ++child) {
            if (children[child] == target) {
                parentFound = true;
                for (unsigned next = 0; next < wanted; ++next) {
                    siblings[next] = child + 1 + next < count ? children[child + 1 + next] : 0;
                }
                return visited;
            }
        }
        for (DWORD child = 0; child < count && top < kWalkMaxElements; ++child) {
            if (children[child]) {
                stack[top++] = children[child];
            }
        }
    }
    return visited;
}

#ifdef PYWEL_ATLAS_DEV
// Development builds (v0.130, as v0.129 keeps diagnostics out of the
// release): the search report for route.log, written into `text` from
// `used` on. Short lines, separated by "\n" (the worker logs each).
#define SEARCH_NOTE(...) (used += sprintf_s(text + used, sizeof(text) - used, __VA_ARGS__))

// Stores one search report for the worker to log (never waits).
void Report(unsigned map, const char* text) {
    if (TryAcquireSRWLockExclusive(&findLock)) {
        strcpy_s(findText[map], text);
        ++findSerial[map];
        ReleaseSRWLockExclusive(&findLock);
    }
}
#else
#define SEARCH_NOTE(...) ((void)0)
#endif

// Searches for our canvases on one map (both ways). `selectors` are ours
// (`wanted` of them), `gameSelector` the game's own canvas for the control
// search. Development builds report what each way found.
void Search(unsigned map, void* controller, uintptr_t gameCanvas, const char* const* selectors, unsigned wanted,
    const char* gameSelector, Canvases& found, Counters& counters) {
    uintptr_t root = ReadPointer(reinterpret_cast<uintptr_t>(controller), 8);
    // The element walk reads many elements, so it runs only on these tries.
    bool walkNow = found.attempts < 5 || found.attempts % 30 == 0;
    ++found.attempts;
    InterlockedIncrement(&counters.lookups);
#ifdef PYWEL_ATLAS_DEV
    char text[2000];
    int used = 0;
#endif
    SEARCH_NOTE("canvas search %s #%u: page %p, game canvas %p\n", map == 0 ? "world map" : "minimap",
        found.attempts, reinterpret_cast<void*>(root), reinterpret_cast<void*>(gameCanvas));

    // 1. The selector query, ours and the game's own as a control.
    uintptr_t byQuery[2] = {};
    bool queryOk = true;
    for (unsigned item = 0; item < wanted; ++item) {
        uintptr_t first = 0;
        [[maybe_unused]] unsigned count = Query(root, selectors[item], first);
        // v0.130: the query returns the element; its +0xd8 is the canvas.
        uintptr_t owner = ReadPointer(first, kOwnerOffset);
        byQuery[item] = IsCanvas(owner) ? owner : (IsCanvas(first) ? first : 0);
        queryOk = queryOk && byQuery[item] != 0;
        SEARCH_NOTE("canvas search query %s: %u result(s), element vtable rva 0x%llx, +0xd8 %s\n", selectors[item],
            count, static_cast<unsigned long long>(VtableRva(first)), IsCanvas(owner) ? "a canvas" : "NOT a canvas");
    }
    {
        uintptr_t first = 0;
        [[maybe_unused]] unsigned count = Query(root, gameSelector, first);
        SEARCH_NOTE("canvas search control query %s: %u result(s), %s\n", gameSelector, count,
            ReadPointer(first, kOwnerOffset) == gameCanvas || first == gameCanvas ? "is the game's canvas" :
            "NOT the game's canvas");
    }
    if (queryOk) {
        found.ours[0] = reinterpret_cast<void*>(byQuery[0]);
        found.ours[1] = wanted > 1 ? reinterpret_cast<void*>(byQuery[1]) : nullptr;
        found.found = "query";
        InterlockedExchange(&counters.found, 1);
        SEARCH_NOTE("canvas search %s: found by the query", map == 0 ? "world map" : "minimap");
#ifdef PYWEL_ATLAS_DEV
        if (walkNow) {
            Report(map, text);
        }
#endif
        return;
    }

    // 2. The element walk.
    if (walkNow) {
        uintptr_t element = ReadPointer(gameCanvas, 8);
        uintptr_t siblings[2] = {};
        bool parentFound = false;
        [[maybe_unused]] unsigned visited = WalkForSiblings(map, root, element, siblings, 2, parentFound);
        uintptr_t byWalk[2] = {};
        bool walkOk = parentFound;
        for (unsigned item = 0; item < wanted; ++item) {
            uintptr_t candidate = ReadPointer(siblings[item], kOwnerOffset);
            byWalk[item] = candidate != gameCanvas && IsCanvas(candidate) ? candidate : 0;
            walkOk = walkOk && byWalk[item] != 0;
        }
        SEARCH_NOTE("canvas search walk: game element +0xd8 %s, %u elements, parent %s, siblings +0xd8 "
            "vtable rva 0x%llx / 0x%llx\n", ReadPointer(element, kOwnerOffset) == gameCanvas ? "is the canvas" :
            "is NOT the canvas", visited, parentFound ? "found" : "NOT found",
            static_cast<unsigned long long>(VtableRva(ReadPointer(siblings[0], kOwnerOffset))),
            static_cast<unsigned long long>(VtableRva(ReadPointer(siblings[1], kOwnerOffset))));
        if (walkOk) {
            found.ours[0] = reinterpret_cast<void*>(byWalk[0]);
            found.ours[1] = wanted > 1 ? reinterpret_cast<void*>(byWalk[1]) : nullptr;
            found.found = "child walk";
            InterlockedExchange(&counters.found, 2);
            SEARCH_NOTE("canvas search %s: found by the child walk", map == 0 ? "world map" : "minimap");
        } else {
            SEARCH_NOTE("canvas search %s: NOT FOUND by either way (UI add-on v0.90 mounted?); overlay used",
                map == 0 ? "world map" : "minimap");
        }
#ifdef PYWEL_ATLAS_DEV
        Report(map, text);
#endif
    }
}

// Our canvases for this map: the cached ones while the game's canvas is the
// same object, else a new search (failed searches retried every 2 s).
// False if none is known.
bool FindOurs(unsigned map, void* controller, uintptr_t gameOffset, const char* const* selectors, unsigned wanted,
    const char* gameSelector, Canvases& found, Counters& counters) {
    uintptr_t gameCanvas = ReadPointer(reinterpret_cast<uintptr_t>(controller), gameOffset);
    if (!IsCanvas(gameCanvas)) {
        // The page is not (or no longer) set up: forget our canvases with it.
        found.gameCanvas = nullptr;
        found.ours[0] = nullptr;
        found.ours[1] = nullptr;
        return false;
    }
    bool samePage = reinterpret_cast<void*>(gameCanvas) == found.gameCanvas;
    bool valid = found.ours[0] && IsCanvas(reinterpret_cast<uintptr_t>(found.ours[0])) &&
        (wanted < 2 || (found.ours[1] && IsCanvas(reinterpret_cast<uintptr_t>(found.ours[1]))));
    if (samePage && valid) {
        return true;
    }
    ULONGLONG now = GetTickCount64();
    if (samePage && now - found.lastLookup < kLookupRetry) {
        return false;
    }
    if (!samePage) {
        found.attempts = 0;
    }
    found.gameCanvas = reinterpret_cast<void*>(gameCanvas);
    found.ours[0] = nullptr;
    found.ours[1] = nullptr;
    found.found = "not found";
    InterlockedExchange(&counters.found, 0);
    found.lastLookup = now;
    Search(map, controller, gameCanvas, selectors, wanted, gameSelector, found, counters);
    return found.ours[0] != nullptr;
}

// How many strokes `canvas` holds (0 if unreadable).
unsigned StrokeCount(void* canvas) {
    unsigned count = 0;
    Read(static_cast<BYTE*>(canvas) + 0xa0, &count, sizeof(count));
    return count;
}

// Removes every stroke from `canvas` (vtable slot 0x380).
void Clear(void* canvas, Counters& counters) {
    reinterpret_cast<ClearCanvas>(ReadPointer(imageBase + kCanvasVtableRva, kClearSlot))(canvas);
    InterlockedIncrement(&counters.cleared);
}

// Clears `canvas` only if it still holds lines.
void ClearIfUsed(void* canvas, Counters& counters) {
    if (canvas && StrokeCount(canvas) != 0) {
        Clear(canvas, counters);
    }
}

// v0.131: how many points slot 0x398 makes from `count` points, as
// 0x3d14ff0 counts them: for each run of 4 points, (the length of its 3
// sides / 50, at least 5) + 1, plus the first and last point.
unsigned PathCost(const float* points, unsigned count) {
    if (count < 3) {
        return 2;
    }
    unsigned cost = 2;
    for (unsigned run = 0; run + 3 < count; ++run) {
        float length = 0.0f;
        for (unsigned side = 0; side < 3; ++side) {
            const float* a = points + 2 * (run + side);
            length += std::sqrt((a[2] - a[0]) * (a[2] - a[0]) + (a[3] - a[1]) * (a[3] - a[1]));
        }
        float steps = length / 50.0f;
        cost += (steps > 5.0f && steps < 1.0e6f ? static_cast<unsigned>(steps) : 5u) + 1;
    }
    return cost;
}

// Adds a continuous path through `count` points (x, y pairs) with slot
// 0x398, which needs at least 3 points: a 2-point line gets its middle.
void AddLine(void* canvas, const float* points, unsigned count, const CanvasColour& colour, float width,
    Counters& counters) {
    if (count < 2 || count > kLinePointRoom) {
        return;
    }
    float three[6];
    if (count == 2) {
        three[0] = points[0];
        three[1] = points[1];
        three[2] = 0.5f * (points[0] + points[2]);
        three[3] = 0.5f * (points[1] + points[3]);
        three[4] = points[2];
        three[5] = points[3];
        points = three;
        count = 3;
    }
    CanvasPoints list = {points, count, count};
    addPath(canvas, points, points + 2 * (count - 1), &list, colour.channel, width, width, 0, 0);
    InterlockedIncrement(&counters.paths);
}

// Shortens the line in `points` by `distance` at its end (`atEnd`) or its
// start, so it stops at a stop's ring. Returns the new count (0 if the line
// is shorter than that).
unsigned Trim(float* points, unsigned count, float distance, bool atEnd) {
    if (count < 2 || distance <= 0.0f) {
        return count;
    }
    if (!atEnd) {
        // Reverse, trim the end, reverse back.
        for (unsigned a = 0, b = count - 1; a < b; ++a, --b) {
            float x = points[2 * a];
            float y = points[2 * a + 1];
            points[2 * a] = points[2 * b];
            points[2 * a + 1] = points[2 * b + 1];
            points[2 * b] = x;
            points[2 * b + 1] = y;
        }
        unsigned kept = Trim(points, count, distance, true);
        for (unsigned a = 0, b = kept ? kept - 1 : 0; kept && a < b; ++a, --b) {
            float x = points[2 * a];
            float y = points[2 * a + 1];
            points[2 * a] = points[2 * b];
            points[2 * a + 1] = points[2 * b + 1];
            points[2 * b] = x;
            points[2 * b + 1] = y;
        }
        return kept;
    }
    float left = distance;
    while (count >= 2) {
        float* a = points + 2 * (count - 2);
        float* b = points + 2 * (count - 1);
        float dx = b[0] - a[0];
        float dy = b[1] - a[1];
        float length = std::sqrt(dx * dx + dy * dy);
        if (length > left) {
            b[0] -= dx / length * left;
            b[1] -= dy / length * left;
            return count;
        }
        left -= length;
        --count;
    }
    return 0;
}

// v0.133: drops the points of the line in `points` that lie inside the
// ring of radius `radius` around its last point (`atEnd`) or its first point,
// keeping that point itself, so the trim to the ring leaves a straight last
// piece. Returns the new count.
unsigned DropInsideRing(float* points, unsigned count, float radius, bool atEnd) {
    if (count < 3) {
        return count;
    }
    unsigned centre = atEnd ? count - 1 : 0;
    float cx = points[2 * centre];
    float cy = points[2 * centre + 1];
    auto inside = [&](unsigned point) {
        float dx = points[2 * point] - cx;
        float dy = points[2 * point + 1] - cy;
        return dx * dx + dy * dy < radius * radius;
    };
    if (atEnd) {
        while (count > 2 && inside(count - 2)) {
            points[2 * (count - 2)] = points[2 * (count - 1)];
            points[2 * (count - 2) + 1] = points[2 * (count - 1) + 1];
            --count;
        }
    } else {
        unsigned drop = 0;
        while (count - drop > 2 && inside(1 + drop)) {
            ++drop;
        }
        if (drop > 0) {
            memmove(points + 2, points + 2 * (1 + drop), 2 * (count - 1 - drop) * sizeof(float));
            count -= drop;
        }
    }
    return count;
}

// v0.133: gives the first and last point of the `count` points in `points`
// kClampCopies more copies each, so slot 0x398's B-spline starts and ends
// exactly at them. `points` must hold count + 2 * kClampCopies points.
// Returns the new count.
unsigned ClampEnds(float* points, unsigned count) {
    memmove(points + 2 * kClampCopies, points, 2 * count * sizeof(float));
    for (unsigned copy = 0; copy < kClampCopies; ++copy) {
        points[2 * copy] = points[2 * kClampCopies];
        points[2 * copy + 1] = points[2 * kClampCopies + 1];
        unsigned last = kClampCopies + count - 1;
        points[2 * (last + 1 + copy)] = points[2 * last];
        points[2 * (last + 1 + copy) + 1] = points[2 * last + 1];
    }
    return count + 2 * kClampCopies;
}

// Adds one closed ring of radius `radius` around (x, y).
void AddRing(void* canvas, float x, float y, float radius, const CanvasColour& colour, float width,
    Counters& counters) {
    float ring[2 * (kRingPoints + 1)];
    for (unsigned point = 0; point <= kRingPoints; ++point) {
        float angle = 2.0f * 3.14159265f * static_cast<float>(point % kRingPoints) / kRingPoints;
        ring[2 * point] = x + radius * std::cos(angle);
        ring[2 * point + 1] = y + radius * std::sin(angle);
    }
    // v0.131: straight to the line call (no curve to multiply the points).
    CanvasPoints list = {ring, kRingPoints + 1, kRingPoints + 1};
    addPolyline(canvas, &list, colour.channel, width, width, 0.0f, 0, 0);
    InterlockedIncrement(&counters.paths);
}

// Draws every leg of state.lines with `place` turning a world point into the
// canvas's own coordinates, then a ring around each stop. `unit` is canvas
// coordinates per UI pixel, `ringRadius` the rings' radius in UI pixels,
// `lineScale` (v0.133) the line widths against the world map's.
template <typename Place>
void DrawLegs(void* canvas, CanvasState& state, Place place, float unit, float heightScale, float ringRadius,
    float lineScale, Counters& counters) {
    const RouteLines& route = state.lines;
    CanvasColour crimson = ColourOf(kCrimson, 1.0f);
    CanvasColour crimsonLater = ColourOf(kCrimsonLater, 1.0f);
    CanvasColour outline = ColourOf(kOutline, 1.0f);
    CanvasColour outlineLater = ColourOf(kOutlineLater, 1.0f);
    float outlineExtra = 2.0f * kOutlineExtra * heightScale * unit * lineScale;
    float currentWidth = kCurrentWidth * heightScale * unit * lineScale;
    float radius = ringRadius * heightScale * unit;
    LONG widthBits = 0;
    memcpy(&widthBits, &currentWidth, sizeof(widthBits));
    InterlockedExchange(&counters.widthBits, widthBits);

    // Places leg `leg` in state.points, trimmed to end at its stop's ring
    // (later legs also start at the ring of the stop before), coming
    // straight in, with its ends clamped (v0.133). Returns its point count
    // (0 if the leg is unusable or too short).
    auto placeLeg = [&](unsigned leg) -> unsigned {
        const RouteLineLeg& item = route.legs[leg];
        if (item.count < 2 || item.first > route.pointCount || item.count > route.pointCount - item.first ||
            item.count > kLinePointRoom) {
            return 0;
        }
        for (unsigned point = 0; point < item.count; ++point) {
            place(route.points[item.first + point], state.points[2 * point], state.points[2 * point + 1]);
        }
        unsigned count = DropInsideRing(state.points, item.count, radius, true);
        count = Trim(state.points, count, radius, true);
        if (leg > 0) {
            count = DropInsideRing(state.points, count, radius, false);
            count = Trim(state.points, count, radius, false);
        }
        return count >= 2 ? ClampEnds(state.points, count) : 0;
    };

    // v0.131: what fits the budget, nearest first (see THE GEOMETRY BUDGET):
    // the current leg, its stop's ring, the next leg, its ring, and so on.
    bool legFits[kRouteLineMaxLegs] = {};
    bool ringFits[kRouteLineMaxLegs] = {};
    unsigned legs = route.legCount < kRouteLineMaxLegs ? route.legCount : kRouteLineMaxLegs;
    unsigned budget = kGeometryBudget;
    const unsigned ringCost = (kGlowRings + 1) * (kRingPoints + 1);
    for (unsigned leg = 0; leg < legs; ++leg) {
        unsigned count = placeLeg(leg);
        unsigned legCost = count ? 2 * PathCost(state.points, count) : 0;
        if (count && legCost <= budget) {
            legFits[leg] = true;
            budget -= legCost;
        } else if (count) {
            InterlockedIncrement(&counters.budgetSkips);
        }
        if (ringCost <= budget) {
            ringFits[leg] = true;
            budget -= ringCost;
        } else {
            InterlockedIncrement(&counters.budgetSkips);
        }
    }

    // Later legs first, so the current leg lies on top; outline under line.
    for (unsigned leg = legs; leg-- > 0;) {
        unsigned count = legFits[leg] ? placeLeg(leg) : 0;
        if (count < 2) {
            continue;
        }
        float width = (leg == 0 ? kCurrentWidth : kLaterWidth) * heightScale * unit * lineScale;
        AddLine(canvas, state.points, count, leg == 0 ? outline : outlineLater, width + outlineExtra, counters);
        AddLine(canvas, state.points, count, leg == 0 ? crimson : crimsonLater, width, counters);
    }
    // A ring around each stop's icon (the last point of its leg): the glow
    // rings outside (outermost and faintest first), then the hairline.
    float hairline = kHairlineWidth * heightScale * unit;
    float glowWidth = kGlowRingWidth * heightScale * unit * (0.5f + 0.5f * lineScale);
    for (unsigned leg = 0; leg < legs; ++leg) {
        const RouteLineLeg& item = route.legs[leg];
        if (!ringFits[leg] || item.count == 0 || item.first > route.pointCount ||
            item.count > route.pointCount - item.first) {
            continue;
        }
        float x = 0.0f;
        float y = 0.0f;
        place(route.points[item.first + item.count - 1], x, y);
        for (unsigned glow = kGlowRings; glow-- > 0;) {
            float fade = 1.0f - static_cast<float>(glow) / kGlowRings;
            AddRing(canvas, x, y, radius + 0.5f * hairline + glowWidth * (glow + 0.5f),
                ColourOf(kCrimson, kGlowOpacity * fade * fade), glowWidth, counters);
        }
        AddRing(canvas, x, y, radius, crimson, hairline, counters);
    }
}

// Counts an update our canvas handled (drawn or deliberately empty), so the
// overlay stays off.
void Handled(Counters& counters) {
    InterlockedExchange64(&counters.lastDraw, static_cast<LONG64>(GetTickCount64()));
}

// Copies one map's counters into `stats`.
void CopyCounters(const Counters& counters, RouteCanvasStats::Map& stats) {
    static const char* const kFound[] = {"not found", "query", "child walk"};
    static const char* const kDrawnOn[] = {"none", "painted", "plain"};
    stats.updates = counters.updates;
    stats.drawn = counters.drawn;
    stats.notFound = counters.notFound;
    stats.cleared = counters.cleared;
    stats.matrixWrites = counters.matrixWrites;
    stats.lookups = counters.lookups;
    stats.paths = counters.paths;
    stats.layerSkips = counters.layerSkips;
    stats.budgetSkips = counters.budgetSkips;
    stats.layerBytes = static_cast<unsigned>(counters.layerBytes);
    stats.playerAbyss = counters.playerAbyss != 0;
    stats.found = kFound[counters.found >= 0 && counters.found <= 2 ? counters.found : 0];
    stats.drawnOn = kDrawnOn[counters.drawnOn >= 0 && counters.drawnOn <= 2 ? counters.drawnOn : 0];
    LONG bits = counters.widthBits;
    memcpy(&stats.lastWidth, &bits, sizeof(float));
    stats.lastDrawTick = static_cast<unsigned long long>(counters.lastDraw);
}

// The player's layer from the minimap snapshot (surface if unknown).
bool PlayerInAbyss() {
    PywelMinimapView player = {};
    return PywelGetMinimapView(player) && player.abyssLayer;
}

} // namespace

// See RouteCanvas.h.
void PywelRouteDrawWorldCanvas(void* controller) {
    InterlockedIncrement(&worldCounters.updates);
    if (!controller || !GuardsOk()) {
        return;
    }
    CanvasState& state = worldState;

    // Which layer the map shows, against the player's layer.
    BYTE showing[4] = {};
    uintptr_t layers = ReadPointer(reinterpret_cast<uintptr_t>(controller), kLayerShowingOffset);
    bool layersKnown = layers && Read(reinterpret_cast<const void*>(layers), showing, sizeof(showing));
    bool playerAbyss = PlayerInAbyss();
    bool abyssShown = layersKnown && showing[kAbyssLayerClass] != 0;
    bool layerMatches = !layersKnown || abyssShown == playerAbyss;
    LONG packed = 0;
    memcpy(&packed, showing, sizeof(packed));
    InterlockedExchange(&worldCounters.layerBytes, layersKnown ? packed : -1);
    InterlockedExchange(&worldCounters.playerAbyss, playerAbyss ? 1 : 0);
    InterlockedExchange(&worldLayerMatches, layerMatches ? 1 : 0);

    static const char* const kSelectors[1] = {kWorldPlainSelector};
    if (!FindOurs(0, controller, kWorldCanvasOffset, kSelectors, 1, kWorldGameSelector, state.canvases,
        worldCounters)) {
        InterlockedIncrement(&worldCounters.notFound);
        return;
    }
    Handled(worldCounters);
    PywelRouteSettings settings = PywelGetRouteSettings();
    void* canvas = state.canvases.ours[0];
    BYTE perspective = 1;
    bool wanted = settings.shown && settings.worldLine && settings.canvasLine && layerMatches &&
        Read(reinterpret_cast<const void*>(imageBase + kPerspectiveFlagRva), &perspective, sizeof(perspective)) &&
        perspective == 0;
    if (!layerMatches) {
        InterlockedIncrement(&worldCounters.layerSkips);
    }
    if (!wanted || !PywelGetRouteLines(state.lines) || state.lines.legCount == 0) {
        ClearIfUsed(canvas, worldCounters);
        InterlockedExchange(&worldCounters.drawnOn, 0);
        return;
    }

    // The map's view: centre and scale from the controller, interface scale
    // and root size from this update's snapshot. If unreadable, the last
    // lines stay.
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
    Clear(canvas, worldCounters);

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

    // World points (X, -Z) in metres; one UI pixel = a98 / U metres.
    float heightScale = view.root.height / 1080.0f;
    DrawLegs(canvas, state, [](const RoutePoint& point, float& x, float& y) {
        x = point.x;
        y = -point.z;
    }, metresPerUnit / scale, heightScale, kWorldRingRadius, 1.0f, worldCounters);
    InterlockedIncrement(&worldCounters.drawn);
    InterlockedExchange(&worldCounters.drawnOn, 2);
}

// See RouteCanvas.h.
void PywelRouteDrawMinimapCanvas(void* controller) {
    InterlockedIncrement(&minimapCounters.updates);
    if (!controller || !GuardsOk()) {
        return;
    }
    CanvasState& state = minimapState;
    static const char* const kSelectors[1] = {kMinimapSelector};
    if (!FindOurs(1, controller, kMinimapCanvasOffset, kSelectors, 1, kMinimapGameSelector, state.canvases,
        minimapCounters)) {
        InterlockedIncrement(&minimapCounters.notFound);
        return;
    }
    Handled(minimapCounters);
    void* canvas = state.canvases.ours[0];
    PywelRouteSettings settings = PywelGetRouteSettings();
    if (!settings.shown || !settings.minimapLine || !settings.canvasLine || !PywelGetRouteLines(state.lines) ||
        state.lines.legCount == 0) {
        ClearIfUsed(canvas, minimapCounters);
        return;
    }
    auto* bytes = static_cast<BYTE*>(controller);

    // The minimap's view this update: player, metres-to-canvas scale, turn.
    // If unreadable, the last lines stay.
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
    Clear(canvas, minimapCounters);

    // Canvas coordinates: centre plus metres x ctrl[0x554] / style scale.
    // One UI pixel on screen = 1 / (Sx * U) canvas coordinates.
    float px = player[0];
    float pz = player[2];
    float unit = 1.0f / (sx * view.uiScale);
    // Sizes follow the screen height, like the world map's (1080 lines = 1x).
    float heightScale = view.root.valid && view.root.height > 0.0f ? view.root.height / 1080.0f : 1.0f;
    DrawLegs(canvas, state, [&](const RoutePoint& point, float& x, float& y) {
        x = halfWidth + (point.x - px) * unitsPerMetre / sx;
        y = halfHeight + (pz - point.z) * unitsPerMetre / sy;
    }, unit, heightScale, kMinimapRingRadius, kMinimapLineScale, minimapCounters);
    InterlockedIncrement(&minimapCounters.drawn);
    InterlockedExchange(&minimapCounters.drawnOn, 2);
}

// See RouteCanvas.h.
bool PywelRouteWorldLayerMatches() {
    return InterlockedCompareExchange(&worldLayerMatches, 0, 0) != 0;
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

// See RouteCanvas.h.
bool PywelGetRouteCanvasFindLog(unsigned map, unsigned seenSerial, unsigned& serial, char* text, size_t size) {
    if (map > 1 || !text || size == 0) {
        return false;
    }
    AcquireSRWLockShared(&findLock);
    serial = findSerial[map];
    bool fresh = serial != seenSerial;
    if (fresh) {
        strncpy_s(text, size, findText[map], _TRUNCATE);
    }
    ReleaseSRWLockShared(&findLock);
    return fresh;
}
