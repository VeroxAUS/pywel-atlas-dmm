// =============================================================================
// Pywel Atlas - collectible route: worker, map snapshots and screen maths
// (RouteSystem.cpp, v0.104-v0.122)
// =============================================================================
//
// WHAT THIS FILE DOES
//   1. Keeps the route settings (shown, how many stops, which maps), which
//      the marker part saves in filters.ini.
//   2. Takes small copies ("snapshots") of the world map's and the minimap's
//      view. The marker part calls the capture functions from its existing
//      map hooks, on the game's map thread, right after the game's own code.
//      They only read memory (ReadProcessMemory, so a bad pointer gives
//      "unreadable" instead of a crash) and never wait for a lock.
//   3. Runs the route worker thread: it takes the stops the mod would show
//      right now, keeps the nearest ones on the player's map layer, orders
//      them (RoutePlanner.cpp), notices reached stops and publishes the plan
//      for the overlay (RouteOverlay.cpp). It writes
//      %LOCALAPPDATA%\PywelAtlas\route.log.
//      v0.111: the order uses road costs, and each leg follows the roads
//      (RouteLegs.cpp). The legs are published as lines (RouteLines.h) for
//      the world map's canvas (RouteCanvas.cpp) and the overlay; the current
//      leg is trimmed behind the player every 100 ms and planned again when
//      the player is more than 60 m off it.
//   4. Turns world positions into back-buffer pixels for both maps; the
//      overlay and the log use the same functions.
//
// KEY TERMS
//   Controller - the game object that runs one map (world map or minimap).
//   Element    - one item of the game's interface (like an HTML element).
//                Its "layout node" holds where it was laid out last, in UI
//                pixels: +0x70 x, +0x74 y, +0x78 width, +0x7c height.
//   U          - the interface scale: UI pixels per canvas unit. The game
//                works it out from its interface root object as
//                root+0xd4 x (root+0x13b ? (root+0x13c ? root+0xe0 : root+0xdc)
//                : root+0xd8) (game function 0x35b4b90).
//   Back buffer - the image the game is about to show; the overlay draws in
//                its pixels.
//
// SCREEN MATHS (static research, research/scripts/route_line_scan.py and the
// Ghidra export; see the v0.104 route research report)
//   World map (game function 0xd91660): an icon at world (X, Z) is placed at
//     canvas x = (X - ctrl[0xa58]) / ctrl[0xa98] + W / 2
//     canvas y = (ctrl[0xa5c] - Z) / ctrl[0xa98] + H / 2
//   where W, H are the map root element's size in canvas units. So in UI
//   pixels: root.x + root.width / 2 + (X - centre X) * U / ctrl[0xa98].
//   Minimap (game functions 0xe13cf0 and 0xe0efd0): an icon is placed in
//   #VolumeContainer at (X - Px) * ctrl[0x554] + h, (Pz - Z) * ctrl[0x554] + h
//   (P = player, h = half the container), and the container is turned by
//   -ctrl[0x530] degrees. Best estimates still to be confirmed by the v0.104
//   test log: the scale layer's own scale is applied once more on screen,
//   and the turn is clockwise for a positive angle (screen y points down).
//   UI pixels to back-buffer pixels: assumed equal unless the root element's
//   size (plus its offset on both sides) differs from the back buffer.
// =============================================================================
#define NOMINMAX
#include "RouteSystem.h"

#include <shlobj.h>
#include <cmath>
#include <cstdint>
#include <cstring>

#include <vector>

#include "LoadedSave.h"
#include "RoutePlanner.h"
#include "MarkerFilter.h"
// v0.111: road-following legs, the published lines and the canvas counters.
#include "RouteCanvas.h"
#include "RouteLegs.h"
#include "RouteLines.h"
// v0.119: the "Skip route stop" key (Keybinds.h; no key by default).
#include "Keybinds.h"

static_assert(kRouteMaxStops == kPywelRoutePlanMax, "The planner and the published plan hold the same number of stops");

namespace {

// ---------------------------------------------------------------------------
// Section: settings
// ---------------------------------------------------------------------------

SRWLOCK settingsLock = SRWLOCK_INIT;
// Defaults: route off until the user switches it on; 10 stops; both maps;
// (v0.111) the world map's own canvas for the world-map line.
PywelRouteSettings settings = {false, 10, true, true, true};
volatile LONG skipRequested = 0; // The panel's "Skip stop" button was pressed.

// Keeps the stop count inside the slider's range.
unsigned ClampStops(unsigned stops) {
    return stops < 1 ? 1 : (stops > kRouteMaxStops ? kRouteMaxStops : stops);
}

// ---------------------------------------------------------------------------
// Section: small helpers
// ---------------------------------------------------------------------------

// Safely copies `size` bytes; false instead of a crash if not readable.
bool Read(const void* address, void* destination, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(), address, destination, size, &read) &&
        read == size;
}

// Reads a pointer stored at `address + offset` (0 if unreadable).
uintptr_t ReadPointer(uintptr_t address, uintptr_t offset) {
    uintptr_t value = 0;
    if (!address || !Read(reinterpret_cast<const void*>(address + offset), &value, sizeof(value))) {
        return 0;
    }
    return value;
}

// True for an ordinary number (not infinity or "not a number").
bool Finite(float value) {
    return std::isfinite(value);
}

// The layout node of an element: *(*(element + 0x18)), as the game's own
// size function 0x35b4b90 reaches it. 0 if unreadable.
uintptr_t LayoutNode(uintptr_t element) {
    return ReadPointer(ReadPointer(element, 0x18), 0);
}

// Copies an element's laid-out rectangle (UI pixels). Returns its layout
// node (0 if unreadable).
uintptr_t ReadElementRect(uintptr_t element, PywelUiRect& rect) {
    rect = {};
    uintptr_t node = LayoutNode(element);
    float values[4] = {};
    if (!node || !Read(reinterpret_cast<const void*>(node + 0x70), values, sizeof(values))) {
        return node;
    }
    rect.x = values[0];
    rect.y = values[1];
    rect.width = values[2];
    rect.height = values[3];
    rect.valid = Finite(rect.x) && Finite(rect.y) && Finite(rect.width) && Finite(rect.height) &&
        rect.width >= 0.0f && rect.height >= 0.0f;
    return node;
}

// Reads the interface scale U for a layout node, the way the game's 0x35b4b90
// does: the root object is entry node+0x94 of the list at
// *(*(*(node+0x58)+0xb0)+0xb0). The game takes another path when the node
// has a special owner (node+0xa0 with a non-zero +8); that path is not
// copied here, so U is then reported as not found (and 1 is used).
bool ReadUiScale(uintptr_t node, float (&fields)[4], BYTE (&flags)[2], float& scale) {
    scale = 1.0f;
    memset(fields, 0, sizeof(fields));
    memset(flags, 0, sizeof(flags));
    uintptr_t owner = ReadPointer(node, 0xa0);
    if (!node || (owner && ReadPointer(owner, 8))) {
        return false;
    }
    BYTE slot = 0xff;
    if (!Read(reinterpret_cast<const void*>(node + 0x94), &slot, sizeof(slot)) || slot == 0xff) {
        return false;
    }
    uintptr_t list = ReadPointer(ReadPointer(ReadPointer(node, 0x58), 0xb0), 0xb0);
    DWORD count = 0;
    if (!list || !Read(reinterpret_cast<const void*>(list + 8), &count, sizeof(count)) || slot >= count) {
        return false;
    }
    uintptr_t root = ReadPointer(ReadPointer(list, 0), slot * sizeof(uintptr_t));
    if (!root || !Read(reinterpret_cast<const void*>(root + 0xd4), fields, sizeof(fields)) ||
        !Read(reinterpret_cast<const void*>(root + 0x13b), flags, sizeof(flags))) {
        return false;
    }
    float chosen = !flags[0] ? fields[1] : (flags[1] ? fields[3] : fields[2]);
    float value = fields[0] * chosen;
    if (!Finite(value) || value < 0.05f || value > 20.0f) {
        return false;
    }
    scale = value;
    return true;
}

// ---------------------------------------------------------------------------
// Section: snapshots (written on the game's map thread)
// ---------------------------------------------------------------------------

SRWLOCK viewLock = SRWLOCK_INIT;
PywelWorldMapView worldView = {};
PywelMinimapView minimapView = {};
// The stop whose marker icon the captures look up (category << 16 | index;
// -1 = none). Set by the worker to the route's first stop.
volatile LONG probeTarget = -1;
// The back buffer the overlay last drew on (for the log).
volatile LONG backBufferWidth = 0;
volatile LONG backBufferHeight = 0;

// Looks up the probe stop's marker icon on this map (at most every 250 ms,
// so the game's lookup is not called every frame) and copies its element's
// rectangle. `last*` hold the previous result on the map thread.
void ProbeMarker(void* controller, bool world, ULONGLONG now, ULONGLONG& lastProbe, bool& found,
    unsigned& category, unsigned& index, PywelUiRect& rect, ULONGLONG& tick) {
    LONG target = InterlockedCompareExchange(&probeTarget, 0, 0);
    if (target < 0) {
        found = false;
        return;
    }
    unsigned wantedCategory = static_cast<unsigned>(target) >> 16;
    unsigned wantedIndex = static_cast<unsigned>(target) & 0xffff;
    bool sameTarget = wantedCategory == category && wantedIndex == index;
    if (sameTarget && now - lastProbe < 250) {
        return;
    }
    lastProbe = now;
    category = wantedCategory;
    index = wantedIndex;
    tick = now;
    void* icon = PywelFindMarkerIcon(controller, world, category, index);
    found = icon != nullptr;
    rect = {};
    if (found) {
        ReadElementRect(ReadPointer(reinterpret_cast<uintptr_t>(icon), 8), rect);
    }
}

} // namespace

// Map thread, world map controller (checked by the caller). The projection
// hook runs several times per frame (once per icon layer), so only the
// first call per timer tick (about 16 ms) copies anything.
void PywelRouteCaptureWorldMap(void* controller) {
    static thread_local ULONGLONG lastCapture = 0;
    static thread_local ULONGLONG lastProbe = 0;
    static thread_local bool probeFound = false;
    static thread_local unsigned probeCategory = 0xffff;
    static thread_local unsigned probeIndex = 0xffff;
    static thread_local PywelUiRect probeRect = {};
    static thread_local ULONGLONG probeTick = 0;
    ULONGLONG now = GetTickCount64();
    if (!controller || now == lastCapture) {
        return;
    }
    lastCapture = now;
    auto* bytes = static_cast<const BYTE*>(controller);
    PywelWorldMapView view = {};
    view.tick = now;
    if (!Read(bytes + 0xa58, &view.centerX, sizeof(float)) || !Read(bytes + 0xa5c, &view.centerZ, sizeof(float)) ||
        !Read(bytes + 0xa98, &view.metresPerUnit, sizeof(float))) {
        return;
    }
    uintptr_t node = ReadElementRect(ReadPointer(reinterpret_cast<uintptr_t>(controller), 8), view.root);
    view.scaleFound = ReadUiScale(node, view.scaleFields, view.scaleFlags, view.uiScale);
    ProbeMarker(controller, true, now, lastProbe, probeFound, probeCategory, probeIndex, probeRect, probeTick);
    view.probeFound = probeFound;
    view.probeCategory = probeCategory;
    view.probeIndex = probeIndex;
    view.probe = probeRect;
    view.probeTick = probeTick;
    // Never wait on the game's thread: if a reader holds the lock, skip.
    if (TryAcquireSRWLockExclusive(&viewLock)) {
        worldView = view;
        ReleaseSRWLockExclusive(&viewLock);
    }
}

// Map thread, minimap controller (checked by the caller), once per minimap
// update.
void PywelRouteCaptureMinimap(void* controller) {
    static thread_local ULONGLONG lastProbe = 0;
    static thread_local bool probeFound = false;
    static thread_local unsigned probeCategory = 0xffff;
    static thread_local unsigned probeIndex = 0xffff;
    static thread_local PywelUiRect probeRect = {};
    static thread_local ULONGLONG probeTick = 0;
    if (!controller) {
        return;
    }
    ULONGLONG now = GetTickCount64();
    auto* bytes = static_cast<const BYTE*>(controller);
    uintptr_t base = reinterpret_cast<uintptr_t>(controller);
    PywelMinimapView view = {};
    view.tick = now;
    float player[3] = {};
    BYTE abyss = 0;
    if (!Read(bytes + 0x330, player, sizeof(player)) || !Read(bytes + 0x569, &abyss, sizeof(abyss)) ||
        !Read(bytes + 0x530, &view.yaw, sizeof(float)) || !Read(bytes + 0x53c, &view.zoom53c, sizeof(float)) ||
        !Read(bytes + 0x554, &view.scale554, sizeof(float))) {
        return;
    }
    view.playerX = player[0];
    view.playerY = player[1];
    view.playerZ = player[2];
    view.abyssLayer = abyss != 0;
    // #MinimapScaleLayer's style block: *(*(node + 0x20) + 0x20), scale X at +0x20.
    uintptr_t layerStyle = ReadPointer(ReadPointer(LayoutNode(ReadPointer(base, 0x3a0)), 0x20), 0x20);
    view.layerScaleX = 1.0f;
    if (!layerStyle || !Read(reinterpret_cast<const void*>(layerStyle + 0x20), &view.layerScaleX, sizeof(float)) ||
        !Finite(view.layerScaleX) || view.layerScaleX <= 0.0f) {
        view.layerScaleX = 1.0f;
    }
    ReadElementRect(ReadPointer(base, 8), view.root);
    ReadElementRect(ReadPointer(base, 0x388), view.display);
    uintptr_t volumeNode = ReadElementRect(ReadPointer(base, 0x390), view.volume);
    float fields[4] = {};
    BYTE flags[2] = {};
    view.scaleFound = ReadUiScale(volumeNode, fields, flags, view.uiScale);
    view.half = view.volume.valid ? view.volume.width / view.uiScale * 0.5f : 0.0f;
    ProbeMarker(controller, false, now, lastProbe, probeFound, probeCategory, probeIndex, probeRect, probeTick);
    view.probeFound = probeFound;
    view.probeCategory = probeCategory;
    view.probeIndex = probeIndex;
    view.probe = probeRect;
    view.probeTick = probeTick;
    if (TryAcquireSRWLockExclusive(&viewLock)) {
        minimapView = view;
        ReleaseSRWLockExclusive(&viewLock);
    }
}

// Copies the latest world-map snapshot (false if none yet).
bool PywelGetWorldMapView(PywelWorldMapView& view) {
    AcquireSRWLockShared(&viewLock);
    view = worldView;
    ReleaseSRWLockShared(&viewLock);
    return view.tick != 0;
}

// Copies the latest minimap snapshot (false if none yet).
bool PywelGetMinimapView(PywelMinimapView& view) {
    AcquireSRWLockShared(&viewLock);
    view = minimapView;
    ReleaseSRWLockShared(&viewLock);
    return view.tick != 0;
}

// Remembers the back buffer the overlay drew on (render thread).
void PywelRouteNoteBackBuffer(unsigned width, unsigned height) {
    InterlockedExchange(&backBufferWidth, static_cast<LONG>(width));
    InterlockedExchange(&backBufferHeight, static_cast<LONG>(height));
}

// ---------------------------------------------------------------------------
// Section: screen positions (see SCREEN MATHS at the top)
// ---------------------------------------------------------------------------

namespace {

// UI pixels to back-buffer pixels along one axis. The root element is
// assumed to cover the screen, centred: its size plus its offset on both
// sides is the UI's full size. If that is unknown, 1:1 is used.
float UiToBack(float rootOffset, float rootSize, float backSize) {
    float uiSize = rootSize + 2.0f * rootOffset;
    return uiSize > 1.0f && backSize > 0.0f ? backSize / uiSize : 1.0f;
}

} // namespace

// See RouteSystem.h. World map: centre of the root element plus the offset
// in metres times U / ctrl[0xa98].
bool PywelRouteWorldToScreen(const PywelWorldMapView& view, float x, float z, float backWidth,
    float backHeight, float& screenX, float& screenY) {
    if (!view.root.valid || view.root.width <= 0.0f || !Finite(view.metresPerUnit) || view.metresPerUnit <= 0.0f ||
        !Finite(view.centerX) || !Finite(view.centerZ)) {
        return false;
    }
    float pixelsPerMetre = view.uiScale / view.metresPerUnit;
    float uiX = view.root.x + view.root.width * 0.5f + (x - view.centerX) * pixelsPerMetre;
    float uiY = view.root.y + view.root.height * 0.5f + (view.centerZ - z) * pixelsPerMetre;
    screenX = uiX * UiToBack(view.root.x, view.root.width, backWidth);
    screenY = uiY * UiToBack(view.root.y, view.root.height, backHeight);
    return Finite(screenX) && Finite(screenY);
}

// See RouteSystem.h. The circle is #MinimapDisplay: its centre, and half its
// width as the radius.
bool PywelRouteMinimapCircle(const PywelMinimapView& view, float backWidth, float backHeight, float& centerX,
    float& centerY, float& radius) {
    if (!view.display.valid || view.display.width <= 1.0f) {
        return false;
    }
    float kx = view.root.valid ? UiToBack(view.root.x, view.root.width, backWidth) : 1.0f;
    float ky = view.root.valid ? UiToBack(view.root.y, view.root.height, backHeight) : 1.0f;
    centerX = (view.display.x + view.display.width * 0.5f) * kx;
    centerY = (view.display.y + view.display.height * 0.5f) * ky;
    radius = view.display.width * 0.5f * kx;
    return true;
}

// See RouteSystem.h. Offset in canvas units, turned by -yaw, scaled to UI
// pixels by #MinimapDisplay's pixel width over #VolumeContainer's canvas
// width (2h), then placed around the circle's centre.
bool PywelRouteMinimapToScreen(const PywelMinimapView& view, float x, float z, float backWidth,
    float backHeight, float& screenX, float& screenY) {
    float centerX = 0.0f;
    float centerY = 0.0f;
    float radius = 0.0f;
    if (!PywelRouteMinimapCircle(view, backWidth, backHeight, centerX, centerY, radius) ||
        !Finite(view.scale554) || view.scale554 <= 0.0f || !Finite(view.yaw)) {
        return false;
    }
    float unitsPerMetre = view.scale554 * view.layerScaleX;
    float dx = (x - view.playerX) * unitsPerMetre;
    float dy = (view.playerZ - z) * unitsPerMetre;
    float angle = -view.yaw * 3.14159265f / 180.0f;
    float turnedX = dx * std::cos(angle) - dy * std::sin(angle);
    float turnedY = dx * std::sin(angle) + dy * std::cos(angle);
    // UI pixels per canvas unit inside the minimap (falls back to U).
    float pixelsPerUnit = view.half > 1.0f ? view.display.width / (2.0f * view.half) : view.uiScale;
    float kx = view.root.valid ? UiToBack(view.root.x, view.root.width, backWidth) : 1.0f;
    float ky = view.root.valid ? UiToBack(view.root.y, view.root.height, backHeight) : 1.0f;
    screenX = centerX + turnedX * pixelsPerUnit * kx;
    screenY = centerY + turnedY * pixelsPerUnit * ky;
    return Finite(screenX) && Finite(screenY);
}

// ---------------------------------------------------------------------------
// Section: settings (any thread)
// ---------------------------------------------------------------------------

// Copies the current route choices.
PywelRouteSettings PywelGetRouteSettings() {
    AcquireSRWLockShared(&settingsLock);
    PywelRouteSettings copy = settings;
    ReleaseSRWLockShared(&settingsLock);
    return copy;
}

// Stores new route choices (from the panel) and asks for a save.
void PywelSetRouteSettings(const PywelRouteSettings& changed) {
    PywelRouteSettings clean = changed;
    clean.stops = ClampStops(clean.stops);
    AcquireSRWLockExclusive(&settingsLock);
    bool different = memcmp(&settings, &clean, sizeof(clean)) != 0;
    settings = clean;
    ReleaseSRWLockExclusive(&settingsLock);
    if (different) {
        PywelRequestFiltersSave();
    }
}

// filters.ini lines: route=0/1, routeStops=N, routeWorldLine=0/1,
// routeMinimapLine=0/1, (v0.111) routeCanvasLine=0/1. Unknown values are
// ignored.
bool PywelRouteLoadSetting(const char* key, const char* value) {
    bool flag = value[0] == '1';
    bool flagValid = value[0] == '0' || value[0] == '1';
    AcquireSRWLockExclusive(&settingsLock);
    bool known = true;
    if (strcmp(key, "route") == 0 && flagValid) {
        settings.shown = flag;
    } else if (strcmp(key, "routeWorldLine") == 0 && flagValid) {
        settings.worldLine = flag;
    } else if (strcmp(key, "routeMinimapLine") == 0 && flagValid) {
        settings.minimapLine = flag;
    } else if (strcmp(key, "routeCanvasLine") == 0 && flagValid) {
        settings.canvasLine = flag;
    } else if (strcmp(key, "routeStops") == 0) {
        unsigned stops = 0;
        if (sscanf_s(value, "%u", &stops) == 1) {
            settings.stops = ClampStops(stops);
        }
    } else {
        known = false;
    }
    ReleaseSRWLockExclusive(&settingsLock);
    return known;
}

// Writes the route lines into filters.ini (marker part's SaveFilters).
void PywelRouteWriteSettings(FILE* file) {
    PywelRouteSettings copy = PywelGetRouteSettings();
    fprintf(file, "route=%d\nrouteStops=%u\nrouteWorldLine=%d\nrouteMinimapLine=%d\nrouteCanvasLine=%d\n",
        copy.shown ? 1 : 0, copy.stops, copy.worldLine ? 1 : 0, copy.minimapLine ? 1 : 0, copy.canvasLine ? 1 : 0);
}

// The panel's "Skip stop" button; the worker carries it out.
void PywelRouteSkipStop() {
    InterlockedExchange(&skipRequested, 1);
}

// ---------------------------------------------------------------------------
// Section: the published plan
// ---------------------------------------------------------------------------

namespace {

SRWLOCK planLock = SRWLOCK_INIT;
PywelRoutePlan publishedPlan = {0, 0, 0.0f, {}, "Route is off"};

// Replaces the published plan (worker thread).
void Publish(const PywelRoutePlan& plan) {
    AcquireSRWLockExclusive(&planLock);
    publishedPlan = plan;
    ReleaseSRWLockExclusive(&planLock);
}

} // namespace

// Copies the latest plan (false if it has no stops).
bool PywelGetRoutePlan(PywelRoutePlan& plan) {
    AcquireSRWLockShared(&planLock);
    plan = publishedPlan;
    ReleaseSRWLockShared(&planLock);
    return plan.count > 0;
}

// ---------------------------------------------------------------------------
// Section: the published lines (v0.111, RouteLines.h)
// ---------------------------------------------------------------------------

namespace {

SRWLOCK linesLock = SRWLOCK_INIT;
RouteLines publishedLines = {};

// Replaces the published lines (worker thread).
void PublishLines(const RouteLines& lines) {
    AcquireSRWLockExclusive(&linesLock);
    publishedLines.serial = lines.serial;
    publishedLines.legCount = lines.legCount;
    memcpy(publishedLines.legs, lines.legs, lines.legCount * sizeof(RouteLineLeg));
    publishedLines.pointCount = lines.pointCount;
    memcpy(publishedLines.points, lines.points, lines.pointCount * sizeof(RoutePoint));
    ReleaseSRWLockExclusive(&linesLock);
}

} // namespace

// See RouteLines.h. Never waits (the world-map canvas calls this on the
// game's map thread): if the worker is publishing right now, `lines` keeps
// the caller's previous copy, so callers keep one copy and pass it each time.
// Only changed lines are copied.
bool PywelGetRouteLines(RouteLines& lines) {
    if (!TryAcquireSRWLockShared(&linesLock)) {
        return lines.legCount > 0;
    }
    if (lines.serial != publishedLines.serial || lines.legCount != publishedLines.legCount) {
        lines.serial = publishedLines.serial;
        lines.legCount = publishedLines.legCount;
        memcpy(lines.legs, publishedLines.legs, publishedLines.legCount * sizeof(RouteLineLeg));
        lines.pointCount = publishedLines.pointCount;
        memcpy(lines.points, publishedLines.points, publishedLines.pointCount * sizeof(RoutePoint));
    }
    ReleaseSRWLockShared(&linesLock);
    return lines.legCount > 0;
}

// ---------------------------------------------------------------------------
// Section: the route worker
// ---------------------------------------------------------------------------

namespace {

HANDLE logFile = INVALID_HANDLE_VALUE;

// Appends one line to route.log with the time in milliseconds (worker only).
void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    char stamped[2200];
    int length = sprintf_s(stamped, "t=%llu %s\r\n", GetTickCount64(), line);
    if (length <= 0) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, stamped, static_cast<DWORD>(length), &written, nullptr);
    FlushFileBuffers(logFile);
}

// Horizontal distance on X/Z.
float Distance(float ax, float az, float bx, float bz) {
    float dx = ax - bx;
    float dz = az - bz;
    return std::sqrt(dx * dx + dz * dz);
}

// A reached stop (by the player walking there or by "Skip stop") counts as
// visited for routing only; it never hides a marker. Session-only.
// v0.105: one row per marker category (was 7, which left Abyss Cressets out).
constexpr unsigned kCategoryLimit = kPywelMarkerCategories;
constexpr unsigned kMarkerLimit = 256;
bool reached[kCategoryLimit][kMarkerLimit] = {};

// Forgets every reached stop.
void ClearReached() {
    memset(reached, 0, sizeof(reached));
}

// Writes a rectangle as "(x,y w x h)" or "(unreadable)".
void FormatRect(const PywelUiRect& rect, char (&text)[96]) {
    if (!rect.valid) {
        strcpy_s(text, "(unreadable)");
        return;
    }
    sprintf_s(text, "(%.1f,%.1f %.1fx%.1f)", rect.x, rect.y, rect.width, rect.height);
}

// Logs the world-map snapshot, our pixel for the first stop and that stop's
// own marker element (UI pixels and converted), so the error can be seen.
void LogWorldView(const char* why, const PywelRoutePlan& plan) {
    PywelWorldMapView view = {};
    if (!PywelGetWorldMapView(view)) {
        Log("world-map view: never captured (world map not opened yet)");
        return;
    }
    float backWidth = static_cast<float>(InterlockedCompareExchange(&backBufferWidth, 0, 0));
    float backHeight = static_cast<float>(InterlockedCompareExchange(&backBufferHeight, 0, 0));
    char root[96];
    FormatRect(view.root, root);
    char line[1200];
    sprintf_s(line, "world-map view%s age=%llums centre=(%.2f,%.2f) metresPerUnit=%g root=%s U=%g scaleFound=%u "
        "fields(d4,d8,dc,e0)=(%g,%g,%g,%g) flags(13b,13c)=(%u,%u) backBuffer=%.0fx%.0f",
        why, GetTickCount64() - view.tick, view.centerX, view.centerZ, view.metresPerUnit, root, view.uiScale,
        view.scaleFound ? 1u : 0u, view.scaleFields[0], view.scaleFields[1], view.scaleFields[2],
        view.scaleFields[3], view.scaleFlags[0], view.scaleFlags[1], backWidth, backHeight);
    Log(line);
    // v0.111: the world map's own canvas line (RouteCanvas.cpp).
    RouteCanvasStats canvas = {};
    PywelGetRouteCanvasStats(canvas);
    const RouteCanvasStats::Map& world = canvas.world;
    float widthPixels = view.metresPerUnit > 0.0f ? world.lastWidth / view.metresPerUnit * view.uiScale : 0.0f;
    sprintf_s(line, "world-map canvas (ours, #PywelRouteCanvas): guards %s, updates %ld, drawn %ld, "
        "not found %ld, searches %ld, cleared %ld, transform writes %ld, lines %ld, current-leg width %.3f m "
        "(= %.2f UI px at this zoom), "
        "colours sent (linear B,G,R,A) crimson (%.4f,%.4f,%.4f,%.2f) outline (%.4f,%.4f,%.4f,%.2f), last drawn %llums ago",
        !canvas.guardsChecked ? "not checked" : (canvas.guardsMatched ? "matched" : "CHANGED (overlay used)"),
        world.updates, world.drawn, world.notFound, world.lookups, world.cleared, world.matrixWrites,
        world.polylines,
        world.lastWidth, widthPixels, canvas.crimson[0], canvas.crimson[1], canvas.crimson[2], canvas.crimson[3],
        canvas.outline[0], canvas.outline[1], canvas.outline[2], canvas.outline[3],
        world.lastDrawTick ? GetTickCount64() - world.lastDrawTick : 0ULL);
    Log(line);
    if (plan.count == 0) {
        return;
    }
    const PywelRoutePlanStop& first = plan.stops[0];
    float ourX = 0.0f;
    float ourY = 0.0f;
    bool ours = PywelRouteWorldToScreen(view, first.x, first.z, backWidth, backHeight, ourX, ourY);
    // Where the canvas puts the same spot: its transform maps (X, -Z) to UI
    // pixels counted from the canvas's own top-left corner (assumed to be the
    // map page's, i.e. the screen's); the overlay adds the root's offset.
    if (ours && view.metresPerUnit > 0.0f) {
        float k = view.uiScale / view.metresPerUnit;
        float canvasX = (first.x - view.centerX) * k + view.root.width * 0.5f;
        float canvasY = (view.centerZ - first.z) * k + view.root.height * 0.5f;
        float backX = canvasX * UiToBack(view.root.x, view.root.width, backWidth);
        float backY = canvasY * UiToBack(view.root.y, view.root.height, backHeight);
        sprintf_s(line, "world-map first stop: canvas pixel (%.1f,%.1f), overlay pixel (%.1f,%.1f), difference (%.1f,%.1f)",
            backX, backY, ourX, ourY, ourX - backX, ourY - backY);
        Log(line);
    }
    bool matches = view.probeFound && view.probeCategory == first.category && view.probeIndex == first.index;
    char probe[96];
    FormatRect(view.probe, probe);
    float markerX = 0.0f;
    float markerY = 0.0f;
    if (matches && view.probe.valid) {
        markerX = view.probe.x * UiToBack(view.root.x, view.root.width, backWidth);
        markerY = view.probe.y * UiToBack(view.root.y, view.root.height, backHeight);
    }
    sprintf_s(line, "world-map first stop '%s' (%u/%u) world=(%.2f,%.2f) ourPixel=%s(%.1f,%.1f) marker=%s rect=%s "
        "markerPixel=(%.1f,%.1f) error=(%.1f,%.1f) probeAge=%llums",
        first.name, first.category, first.index, first.x, first.z, ours ? "" : "unusable", ourX, ourY,
        matches ? "found" : "none", probe, markerX, markerY, matches && view.probe.valid ? ourX - markerX : 0.0f,
        matches && view.probe.valid ? ourY - markerY : 0.0f, GetTickCount64() - view.probeTick);
    Log(line);
}

// Logs the minimap snapshot, its circle, our pixel for the first stop and
// that stop's own minimap marker element.
void LogMinimapView(const char* why, const PywelRoutePlan& plan) {
    PywelMinimapView view = {};
    if (!PywelGetMinimapView(view)) {
        Log("minimap view: never captured");
        return;
    }
    float backWidth = static_cast<float>(InterlockedCompareExchange(&backBufferWidth, 0, 0));
    float backHeight = static_cast<float>(InterlockedCompareExchange(&backBufferHeight, 0, 0));
    char root[96];
    char display[96];
    char volume[96];
    FormatRect(view.root, root);
    FormatRect(view.display, display);
    FormatRect(view.volume, volume);
    float centerX = 0.0f;
    float centerY = 0.0f;
    float radius = 0.0f;
    bool circle = PywelRouteMinimapCircle(view, backWidth, backHeight, centerX, centerY, radius);
    char line[1200];
    sprintf_s(line, "minimap view%s age=%llums player=(%.2f,%.2f,%.2f) abyss=%u yaw=%.2f zoom53c=%g scale554=%g "
        "layerScaleX=%g root=%s display=%s volume=%s U=%g scaleFound=%u h=%g backBuffer=%.0fx%.0f circle=%s(%.1f,%.1f r=%.1f)",
        why, GetTickCount64() - view.tick, view.playerX, view.playerY, view.playerZ, view.abyssLayer ? 1u : 0u,
        view.yaw, view.zoom53c, view.scale554, view.layerScaleX, root, display, volume, view.uiScale,
        view.scaleFound ? 1u : 0u, view.half, backWidth, backHeight, circle ? "" : "unusable", centerX, centerY,
        radius);
    Log(line);
    // v0.115: the minimap's own canvas line (RouteCanvas.cpp).
    RouteCanvasStats canvas = {};
    PywelGetRouteCanvasStats(canvas);
    const RouteCanvasStats::Map& minimap = canvas.minimap;
    sprintf_s(line, "minimap canvas (ours, #PywelRouteMinimapCanvas): guards %s, updates %ld, drawn %ld, "
        "not found %ld, searches %ld, cleared %ld, lines %ld, current-leg width %.4f canvas units, "
        "last drawn %llums ago",
        !canvas.guardsChecked ? "not checked" : (canvas.guardsMatched ? "matched" : "CHANGED (overlay used)"),
        minimap.updates, minimap.drawn, minimap.notFound, minimap.lookups, minimap.cleared, minimap.polylines,
        minimap.lastWidth, minimap.lastDrawTick ? GetTickCount64() - minimap.lastDrawTick : 0ULL);
    Log(line);
    if (plan.count == 0) {
        return;
    }
    const PywelRoutePlanStop& first = plan.stops[0];
    float ourX = 0.0f;
    float ourY = 0.0f;
    bool ours = PywelRouteMinimapToScreen(view, first.x, first.z, backWidth, backHeight, ourX, ourY);
    bool matches = view.probeFound && view.probeCategory == first.category && view.probeIndex == first.index;
    char probe[96];
    FormatRect(view.probe, probe);
    float markerX = 0.0f;
    float markerY = 0.0f;
    if (matches && view.probe.valid) {
        markerX = view.probe.x * (view.root.valid ? UiToBack(view.root.x, view.root.width, backWidth) : 1.0f);
        markerY = view.probe.y * (view.root.valid ? UiToBack(view.root.y, view.root.height, backHeight) : 1.0f);
    }
    sprintf_s(line, "minimap first stop '%s' (%u/%u) world=(%.2f,%.2f) distance=%.1fm ourPixel=%s(%.1f,%.1f) "
        "marker=%s rect=%s markerPixel=(%.1f,%.1f) error=(%.1f,%.1f) probeAge=%llums",
        first.name, first.category, first.index, first.x, first.z,
        Distance(view.playerX, view.playerZ, first.x, first.z), ours ? "" : "unusable", ourX, ourY,
        matches ? "found" : "none", probe, markerX, markerY, matches && view.probe.valid ? ourX - markerX : 0.0f,
        matches && view.probe.valid ? ourY - markerY : 0.0f, GetTickCount64() - view.probeTick);
    Log(line);
}

// Logs a new plan: stop count, total length and the order with leg lengths.
void LogPlan(const PywelRoutePlan& plan, const char* reason, float playerX, float playerZ, bool abyss,
    unsigned candidates) {
    char line[2000];
    int used = sprintf_s(line, "plan #%u (%s): %u stops of %u candidates, %.0f m, player=(%.1f,%.1f) layer=%s:",
        plan.serial, reason, plan.count, candidates, plan.length, playerX, playerZ, abyss ? "Abyss" : "surface");
    float previousX = playerX;
    float previousZ = playerZ;
    for (unsigned stop = 0; stop < plan.count && used > 0 && used < static_cast<int>(sizeof(line)) - 120; ++stop) {
        const PywelRoutePlanStop& item = plan.stops[stop];
        int added = sprintf_s(line + used, sizeof(line) - used, " %u. %s (%u/%u, +%.0f m);", stop + 1, item.name,
            item.category, item.index, Distance(previousX, previousZ, item.x, item.z));
        used = added > 0 ? used + added : used;
        previousX = item.x;
        previousZ = item.z;
    }
    Log(line);
}

// Identifies a candidate set (which stops, and the stop count wanted), so a
// changed done mask, category choice, layer or reached set triggers a plan.
uint64_t CandidateHash(const PywelRouteStop* stops, unsigned count, unsigned wanted) {
    uint64_t hash = 1469598103934665603ULL ^ wanted;
    for (unsigned item = 0; item < count; ++item) {
        hash = (hash ^ (stops[item].category << 16 | stops[item].index)) * 1099511628211ULL;
    }
    return hash;
}

PywelRouteStop allStops[kPywelRouteMaxCandidates];
PywelRouteStop candidates[kPywelRouteMaxCandidates];
RoutePoint candidatePoints[kPywelRouteMaxCandidates];

// --- v0.111: road-following legs -------------------------------------------

// Most points one leg may use (a long road leg is thinned to this).
constexpr unsigned kLegPointCap = 1024;
// Leaving the current leg's line by more than this re-plans that leg.
constexpr float kOffLegReplan = 60.0f;

// The planned legs (worker only): leg i leads to plan stop i; leg 0 starts at
// the player's position when it was planned.
std::vector<RoutePoint> legPoints[kRouteMaxStops];
RouteLegInfo legInfo[kRouteMaxStops];
unsigned legCount = 0;
RouteLines shownLines = {}; // What is published: leg 0 trimmed behind the player.
unsigned linesSerial = 0;

// Plans leg `leg` from `from` to its stop and logs a one-line summary.
void PlanLeg(unsigned leg, const RoutePoint& from, const PywelRoutePlanStop& stop, const char* why) {
    RoutePoint buffer[kLegPointCap];
    unsigned count = 0;
    legInfo[leg] = PlanRouteLeg(from, {stop.x, stop.z}, buffer, kLegPointCap, count);
    legPoints[leg].assign(buffer, buffer + count);
    const RouteLegInfo& info = legInfo[leg];
    char line[400];
    sprintf_s(line, "leg %u (%s) to '%s' (%u/%u): %s, %.0f m (road %.0f m, to road %.0f m, road to stop %.0f m), "
        "cost %.0f, %u points", leg + 1, why, stop.name, stop.category, stop.index,
        info.onRoad ? "roads" : "straight", info.length, info.roadLength, info.entryDistance, info.exitDistance,
        info.cost, count);
    Log(line);
}

// Orders `count` stops by road cost from `start` (one road search per place),
// writing their new order to `order`. Logs how long it took.
void OrderByRoad(const RoutePoint& start, const RoutePoint* stops, unsigned count, unsigned* order) {
    ULONGLONG began = GetTickCount64();
    unsigned places = count + 1;
    std::vector<RoutePoint> place(places);
    place[0] = start;
    for (unsigned stop = 0; stop < count; ++stop) {
        place[stop + 1] = stops[stop];
    }
    std::vector<float> costs(static_cast<size_t>(places) * places, 0.0f);
    for (unsigned from = 0; from < places; ++from) {
        RouteLegCosts(place[from], place.data() + 1, count, costs.data() + from * places + 1);
    }
    // The way back to the start is never walked; use the way out for both.
    for (unsigned stop = 1; stop < places; ++stop) {
        costs[stop * places] = costs[stop];
    }
    float total = OrderByCosts(count, costs.data(), order);
    char line[160];
    sprintf_s(line, "tour order by road cost: %u stops, total cost %.0f, %llu ms", count, total,
        GetTickCount64() - began);
    Log(line);
}

// Copies the legs into shownLines, with leg 0 starting at `player`'s nearest
// spot on it (the part behind the player is left out). Returns how far the
// player is from leg 0's line (metres).
float PublishTrimmed(const RoutePoint& player, const PywelRoutePlan& plan) {
    shownLines.legCount = 0;
    shownLines.pointCount = 0;
    float offLeg = 0.0f;
    for (unsigned leg = 0; leg < legCount && leg < plan.count; ++leg) {
        const std::vector<RoutePoint>& line = legPoints[leg];
        if (line.size() < 2) {
            continue;
        }
        size_t first = 0;
        RoutePoint start = line[0];
        if (leg == 0) {
            // The nearest spot on the line to the player.
            float best = -1.0f;
            for (size_t segment = 0; segment + 1 < line.size(); ++segment) {
                const RoutePoint& a = line[segment];
                const RoutePoint& b = line[segment + 1];
                float dx = b.x - a.x;
                float dz = b.z - a.z;
                float lengthSquared = dx * dx + dz * dz;
                float t = lengthSquared > 0.0f ? ((player.x - a.x) * dx + (player.z - a.z) * dz) / lengthSquared : 0.0f;
                t = t < 0.0f ? 0.0f : (t > 1.0f ? 1.0f : t);
                RoutePoint spot = {a.x + dx * t, a.z + dz * t};
                float distance = Distance(spot.x, spot.z, player.x, player.z);
                if (best < 0.0f || distance < best) {
                    best = distance;
                    first = segment + 1;
                    start = spot;
                }
            }
            offLeg = best;
        }
        unsigned needed = static_cast<unsigned>(line.size() - first) + 2;
        if (shownLines.pointCount + needed > kRouteLineMaxPoints || shownLines.legCount >= kRouteLineMaxLegs) {
            break;
        }
        RouteLineLeg& item = shownLines.legs[shownLines.legCount++];
        item.first = shownLines.pointCount;
        item.category = plan.stops[leg].category;
        item.index = plan.stops[leg].index;
        item.onRoad = legInfo[leg].onRoad;
        // Leg 0: from the player to the line (when not already on it), then on.
        if (leg == 0 && offLeg > 2.0f) {
            shownLines.points[shownLines.pointCount++] = player;
        }
        shownLines.points[shownLines.pointCount++] = start;
        for (size_t point = first; point < line.size(); ++point) {
            shownLines.points[shownLines.pointCount++] = line[point];
        }
        item.count = shownLines.pointCount - item.first;
    }
    shownLines.serial = ++linesSerial;
    PublishLines(shownLines);
    return offLeg;
}

} // namespace

// The route worker: plans, reaches, skips and logs (see the top of the file).
DWORD WINAPI PywelRouteRun(void*) {
    wchar_t path[MAX_PATH] = {};
    if (SUCCEEDED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path)) &&
        wcscat_s(path, L"\\PywelAtlas") == 0) {
        CreateDirectoryW(path, nullptr);
        if (wcscat_s(path, L"\\route.log") == 0) {
            logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr, CREATE_ALWAYS,
                FILE_ATTRIBUTE_NORMAL, nullptr);
        }
    }
    Log("Pywel Atlas combined v0.122 route (v0.122: no route change (map code split into files); v0.121: our own line canvases on both maps (#PywelRouteCanvas, "
        "#PywelRouteMinimapCanvas from UI add-on v0.86): plain solid lines without the game's dotted path "
        "material, cleared and redrawn every update, the game's own canvases no longer touched; overlay if not "
        "found; v0.119: optional Skip stop key from the panel's Keys section; v0.118: world-map line follows zoom and pan with a game waypoint "
        "(transform written every update), legs drawn as overlapping pieces (no gaps) with two passes of Chaikin "
        "corner smoothing; v0.115: minimap line on the minimap's own canvas "
        "(#MinimapDestinationCanvas); Crimson Route look on both canvases: solid crimson continuous paths "
        "(slot 0x398) on a dark outline, colours in linear blue-green-red order, later legs thinner and fainter; "
        "v0.111: legs follow the world map's roads (road-graph.h from the game's "
        "worldmaproad network; off-road metres x4, so the line leaves the road as late as possible), tour order by "
        "road cost, current leg trimmed behind the player and re-planned 60 m off it, world-map line on the game's "
        "own map canvas with the overlay as fallback; v0.108: unique gear stops; v0.107: small red dots under the stop icons instead of rings, world-map "
        "route hidden while a knowledge card is open, room for every marker category; v0.104: first route build): "
        "nearest stops on the player's map layer, "
        "nearest neighbour then 2-opt, re-plan on save or choice changes / reached or skipped stop; "
        "reached = within 10 m (routing only, never hides a marker); world-map and minimap snapshots from the "
        "existing map hooks; view lines every 2 s while a map is visible and on F8");

    PywelRoutePlan plan = {0, 0, 0.0f, {}, "Route is off"};
    unsigned planSerial = 0;
    uint64_t plannedHash = 0;
    bool planned = false;
    bool lastSaveValid = false;
    LONG lastLoadScope = 0;
    bool loadScopeKnown = false;
    bool previousShown = false;
    bool previousF8 = false;
    bool previousSkipKey = false; // v0.119.
    ULONGLONG nextWorldLog = 0;
    ULONGLONG nextMinimapLog = 0;

    while (true) {
        Sleep(100);
        ULONGLONG now = GetTickCount64();
        PywelRouteSettings choice = PywelGetRouteSettings();
        if (choice.shown != previousShown) {
            Log(choice.shown ? "route turned on (panel)" : "route turned off (panel)");
            previousShown = choice.shown;
            planned = false;
        }

        // A new save load or a return to the title forgets the reached stops.
        LoadedSaveBell loaded = {};
        bool saveValid = PywelGetLoadedSaveBell(loaded);
        if (lastSaveValid && !saveValid) {
            ClearReached();
            planned = false;
            Log("no detected save (title screen or loading): reached stops forgotten");
        } else if (saveValid && loadScopeKnown && loaded.loadScope != lastLoadScope) {
            ClearReached();
            planned = false;
            Log("new save load: reached stops forgotten");
        }
        lastSaveValid = saveValid;
        if (saveValid) {
            lastLoadScope = loaded.loadScope;
            loadScopeKnown = true;
        }

        PywelMinimapView player = {};
        bool playerKnown = PywelGetMinimapView(player);
        bool skip = InterlockedExchange(&skipRequested, 0) != 0;
        // v0.119: the Skip stop key does the same as the panel's button
        // (only while the route is on; checked every 100 ms, once per press).
        bool skipKey = PywelKeybindDown(kKeySkipStop);
        if (skipKey && !previousSkipKey && choice.shown) {
            skip = true;
            Log("Skip stop key pressed");
        }
        previousSkipKey = skipKey;
        const char* reason = nullptr;
        if (!choice.shown) {
            plan.count = 0;
            plan.status = "Route is off";
        } else if (!playerKnown) {
            plan.count = 0;
            plan.status = "Waiting for the player position";
        } else {
            // Reached or skipped: the current stop leaves the route.
            if (plan.count > 0) {
                const PywelRoutePlanStop& current = plan.stops[0];
                float distance = Distance(player.playerX, player.playerZ, current.x, current.z);
                char line[300];
                if (distance <= 10.0f) {
                    reached[current.category][current.index] = true;
                    sprintf_s(line, "reached '%s' (%u/%u) at %.1f m", current.name, current.category, current.index,
                        distance);
                    Log(line);
                    reason = "stop reached";
                } else if (skip) {
                    reached[current.category][current.index] = true;
                    sprintf_s(line, "skipped '%s' (%u/%u) at %.1f m (Skip stop)", current.name, current.category,
                        current.index, distance);
                    Log(line);
                    reason = "stop skipped";
                }
            }

            // The stops the mod would show right now, on the player's layer,
            // not reached this session.
            unsigned total = PywelGetRouteStops(allStops, kPywelRouteMaxCandidates);
            unsigned count = 0;
            for (unsigned item = 0; item < total; ++item) {
                const PywelRouteStop& stop = allStops[item];
                if (stop.abyss != player.abyssLayer || stop.category >= kCategoryLimit ||
                    stop.index >= kMarkerLimit || reached[stop.category][stop.index]) {
                    continue;
                }
                candidates[count] = stop;
                candidatePoints[count] = {stop.x, stop.z};
                ++count;
            }
            uint64_t hash = CandidateHash(candidates, count, choice.stops);
            if (!reason && !planned) {
                reason = "start";
            } else if (!reason && hash != plannedHash) {
                reason = "stops or choices changed";
            }
            RoutePoint start = {player.playerX, player.playerZ};
            if (reason) {
                // The nearest stops (straight distance), then (v0.111) their
                // order by road cost, then one road-following leg per stop.
                unsigned order[kRouteMaxStops] = {};
                float length = 0.0f;
                unsigned stops = PlanRoute(start, candidatePoints, count, choice.stops, order, length);
                RoutePoint chosenPoints[kRouteMaxStops];
                for (unsigned stop = 0; stop < stops; ++stop) {
                    chosenPoints[stop] = candidatePoints[order[stop]];
                }
                unsigned roadOrder[kRouteMaxStops] = {};
                OrderByRoad(start, chosenPoints, stops, roadOrder);
                plan.serial = ++planSerial;
                plan.count = stops;
                plan.status = count == 0 ? "No stops left on this map layer" : nullptr;
                for (unsigned stop = 0; stop < stops; ++stop) {
                    const PywelRouteStop& chosen = candidates[order[roadOrder[stop]]];
                    plan.stops[stop] = {chosen.x, chosen.z, chosen.category, chosen.index, chosen.name};
                }
                plan.length = 0.0f;
                legCount = stops;
                for (unsigned leg = 0; leg < stops; ++leg) {
                    RoutePoint from = leg == 0 ? start : RoutePoint{plan.stops[leg - 1].x, plan.stops[leg - 1].z};
                    PlanLeg(leg, from, plan.stops[leg], "plan");
                    plan.length += legInfo[leg].length;
                }
                plannedHash = hash;
                planned = true;
                LogPlan(plan, reason, player.playerX, player.playerZ, player.abyssLayer, count);
            }
            // Follow the player along the current leg; far off it, plan that
            // leg again from where the player is.
            if (plan.count > 0 && legCount > 0) {
                float offLeg = PublishTrimmed(start, plan);
                if (offLeg > kOffLegReplan) {
                    char line[160];
                    sprintf_s(line, "left the current leg by %.0f m: re-planning it", offLeg);
                    Log(line);
                    PlanLeg(0, start, plan.stops[0], "re-plan");
                    PublishTrimmed(start, plan);
                }
            }
        }
        if (plan.count == 0 && shownLines.legCount != 0) {
            legCount = 0;
            shownLines.legCount = 0;
            shownLines.pointCount = 0;
            shownLines.serial = ++linesSerial;
            PublishLines(shownLines);
        }
        Publish(plan);
        InterlockedExchange(&probeTarget,
            plan.count > 0 ? static_cast<LONG>(plan.stops[0].category << 16 | plan.stops[0].index) : -1);

        // Logging: every 2 s while the route is on and a map is visible
        // (snapshot younger than 200 ms), and on F8 (game window in front).
        DWORD foreground = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foreground);
        bool f8 = foreground == GetCurrentProcessId() && (GetAsyncKeyState(VK_F8) & 0x8000) != 0;
        if (f8 && !previousF8) {
            LogWorldView(" (F8)", plan);
            LogMinimapView(" (F8)", plan);
        }
        previousF8 = f8;
        PywelWorldMapView world = {};
        if (choice.shown && PywelGetWorldMapView(world) && now - world.tick < 200 && now >= nextWorldLog) {
            LogWorldView("", plan);
            nextWorldLog = now + 2000;
        }
        if (choice.shown && playerKnown && now - player.tick < 200 && now >= nextMinimapLog) {
            LogMinimapView("", plan);
            nextMinimapLog = now + 2000;
        }
    }
}
