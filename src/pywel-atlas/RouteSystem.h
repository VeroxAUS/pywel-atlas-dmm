// =============================================================================
// Pywel Atlas - collectible route: what the parts share (RouteSystem.h, v0.104)
// =============================================================================
//
// What this file is for:
//   The route line (v0.104, first route build) joins three parts of the mod:
//   - The map-marker part (src/marker-bell/NativeMapCategoryProbe.cpp) knows
//     which collectibles are still to do. It hands out the "stops" a route may
//     visit (PywelGetRouteStops) and finds our own marker icon for a stop.
//   - The route worker (RouteSystem.cpp, its own thread) plans the tour,
//     notices reached stops and writes route.log. It also takes small copies
//     ("snapshots") of the world map's and the minimap's view, made inside
//     the marker part's existing map hooks on the game's map thread.
//   - The overlay (RouteOverlay.cpp, called from FilterPanel.cpp's frame
//     drawing) turns the planned stops into screen pixels and draws the line.
//
// Coordinates:
//   World positions are game metres: X (east), Y (height), Z (north), the
//   same space as a map icon's +0xe0 position. A route ignores Y except for
//   deciding the map layer (surface or Abyss).
//   "Canvas units" are the game interface's own layout units (CSS-like
//   pixels before the interface scale). "UI pixels" are canvas units times
//   the interface scale U. Both are explained in RouteSystem.cpp.
//
// Only plain copies cross between threads here; no game pointers are kept.
// =============================================================================
#pragma once
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <cstdio>

#include "MarkerFilter.h"

// --- Stops: from the map-marker part ---------------------------------------

// One collectible a route may visit.
struct PywelRouteStop {
    float x; // Game position (metres).
    float y;
    float z;
    unsigned category; // Marker category (same numbering as MarkerFilter.h).
    unsigned index; // Marker number inside its category.
    bool abyss; // Above the game's Abyss altitude threshold (Abyss map layer).
    const char* name; // Display name; points at constant data (always valid).
};

// Room for every marker of every category (v0.107: all panel categories,
// 256 markers each; was 7 x 256).
constexpr unsigned kPywelRouteMaxCandidates = kPywelMarkerCategories * 256;

// Copies the stops a route may visit right now: category switched on in the
// panel, markers on (F10 off), the save's result known, and not done, unknown
// or quest-locked. Returns how many were written. Any thread.
unsigned PywelGetRouteStops(PywelRouteStop* stops, unsigned capacity);
// Our own marker icon for a stop on the map whose controller this is (world
// map or minimap), or null. Map thread only (it calls the game's lookup).
void* PywelFindMarkerIcon(void* controller, bool world, unsigned category, unsigned index);
// Asks the marker part to save filters.ini soon (route settings changed).
void PywelRequestFiltersSave();

// --- 0.29.0: Legendary Animal patrol paths, from the map-marker part --------

// One line of an animal's patrol network: `count` world points (X, Z in
// metres) at `points`. Points at constant data (always valid).
struct PywelAnimalLine {
    const float (*points)[2];
    unsigned count;
};
// Most lines one animal's network has (prepare_legendary_animal_links.py).
constexpr unsigned kPywelAnimalMaxLines = 128;
// An animal's whole patrol network.
struct PywelAnimalPath {
    const char* name; // Display name (constant data).
    unsigned lineCount;
    unsigned pointCount; // All lines together.
    PywelAnimalLine lines[kPywelAnimalMaxLines];
};
// Which animals to draw right now: the one whose marker the world map's
// cursor rests on (only while the world map is updating) and the tracked
// one. -1 = none. trackedName is null when none is tracked.
struct PywelAnimalPathState {
    int hovered;
    int tracked;
    const char* trackedName;
};
// Fills `state`; false if the marker part has not started. Any thread.
bool PywelGetAnimalPathState(PywelAnimalPathState& state);
// Copies animal `animal`'s patrol network (false if it has none). Any thread.
bool PywelGetAnimalPath(int animal, PywelAnimalPath& path);
// The panel's Stop tracking button.
void PywelStopTrackingAnimal();

// --- Settings: shown in the panel, saved in filters.ini --------------------

// The user's route choices.
struct PywelRouteSettings {
    bool shown; // "Show route".
    unsigned stops; // How many stops to plan (1..10; v0.133, was 1..50).
    bool worldLine; // Draw on the world map.
    bool minimapLine; // Draw on the minimap.
    // v0.111 "Line style": true = the world map's own canvas (RouteCanvas.cpp),
    // false = the ImGui overlay. The overlay also takes over if the canvas
    // cannot draw.
    bool canvasLine;
};
PywelRouteSettings PywelGetRouteSettings();
// Stores new choices and asks for filters.ini to be saved.
void PywelSetRouteSettings(const PywelRouteSettings& settings);
// filters.ini: reads one "key=value" line if it is a route setting (true if
// it was one), and writes all route lines. Called by the marker part's
// LoadFilters / SaveFilters (worker thread).
bool PywelRouteLoadSetting(const char* key, const char* value);
void PywelRouteWriteSettings(FILE* file);
// The panel's "Skip stop" button: the current stop counts as reached.
void PywelRouteSkipStop();

// --- Snapshots: copied on the map thread -----------------------------------

// A UI element's laid-out rectangle in UI pixels, plus whether it was readable.
struct PywelUiRect {
    bool valid;
    float x;
    float y;
    float width;
    float height;
};

// The world map's view (world map controller, vtable 0x566ff50).
struct PywelWorldMapView {
    ULONGLONG tick; // When copied (GetTickCount64); 0 = never.
    float centerX; // ctrl+0xa58: world X at the map's screen centre.
    float centerZ; // ctrl+0xa5c: world Z at the map's screen centre.
    float metresPerUnit; // ctrl+0xa98: metres per canvas unit.
    PywelUiRect root; // The map's root element (*(ctrl+8)) in UI pixels.
    bool scaleFound; // The interface scale fields could be read.
    float scaleFields[4]; // root+0xd4, +0xd8, +0xdc, +0xe0.
    BYTE scaleFlags[2]; // root+0x13b, +0x13c (which field is used).
    float uiScale; // U: UI pixels per canvas unit (1 if not found).
    // The first route stop's own marker icon (if it has one), for comparison.
    bool probeFound;
    unsigned probeCategory;
    unsigned probeIndex;
    PywelUiRect probe; // Its element's laid-out rectangle.
    ULONGLONG probeTick;
};

// The minimap's view (minimap controller, vtable 0x5674e00).
struct PywelMinimapView {
    ULONGLONG tick; // When copied; 0 = never.
    float playerX; // ctrl+0x330 / +0x334 / +0x338: player position.
    float playerY;
    float playerZ;
    bool abyssLayer; // ctrl+0x569: the player is on the Abyss layer.
    float yaw; // ctrl+0x530: minimap rotation (degrees; layers turn by -yaw).
    float zoom53c; // ctrl+0x53c: canvas units per metre before the scale layer.
    float scale554; // ctrl+0x554: canvas units per metre used for icons.
    float layerScaleX; // #MinimapScaleLayer's current scale (ctrl+0x3a0 style +0x20).
    PywelUiRect root; // The minimap's root element (*(ctrl+8)).
    PywelUiRect display; // #MinimapDisplay (ctrl+0x388).
    PywelUiRect volume; // #VolumeContainer (ctrl+0x390), the icons' parent.
    bool scaleFound;
    float uiScale; // U for the minimap's root.
    float half; // h: half of #VolumeContainer's width, in canvas units.
    bool probeFound;
    unsigned probeCategory;
    unsigned probeIndex;
    PywelUiRect probe;
    ULONGLONG probeTick;
};

// Called by the marker part's hooks right after the game's own function,
// once the controller's vtable has been checked. Never wait or block.
void PywelRouteCaptureWorldMap(void* controller);
void PywelRouteCaptureMinimap(void* controller);
// Latest copies (false if never copied). Any thread.
bool PywelGetWorldMapView(PywelWorldMapView& view);
bool PywelGetMinimapView(PywelMinimapView& view);

// --- The planned route: for the overlay and the panel ----------------------

// The most stops a plan holds (the panel's slider maximum). v0.133: 10 (was
// 50; Thomas's v0.132 test: around 30 and more stops the drawing broke).
constexpr unsigned kPywelRoutePlanMax = 10;

// One stop of the planned route.
struct PywelRoutePlanStop {
    float x;
    float z;
    unsigned category;
    unsigned index;
    const char* name;
};

// The planned route as the worker last published it.
struct PywelRoutePlan {
    unsigned serial; // Changes with every new plan.
    unsigned count; // Stops in `stops` (0 = nothing to show).
    float length; // Path length from the player through all stops (metres).
    PywelRoutePlanStop stops[kPywelRoutePlanMax];
    const char* status; // Why there is no route, when count == 0.
};
bool PywelGetRoutePlan(PywelRoutePlan& plan);

// --- Screen positions: shared by the overlay and the log --------------------

// Back-buffer pixels for a world position on the world map. False if the
// view is unusable.
bool PywelRouteWorldToScreen(const PywelWorldMapView& view, float x, float z, float backWidth,
    float backHeight, float& screenX, float& screenY);
// Where the minimap circle is on the back buffer (centre and radius).
bool PywelRouteMinimapCircle(const PywelMinimapView& view, float backWidth, float backHeight, float& centerX,
    float& centerY, float& radius);
// Back-buffer pixels for a world position on the minimap (may lie outside
// the circle; the caller clips).
bool PywelRouteMinimapToScreen(const PywelMinimapView& view, float x, float z, float backWidth,
    float backHeight, float& screenX, float& screenY);
// The overlay reports the back buffer it draws on (for the log).
void PywelRouteNoteBackBuffer(unsigned width, unsigned height);

// The route worker thread (started by PywelAtlas.cpp).
DWORD WINAPI PywelRouteRun(void* address);
