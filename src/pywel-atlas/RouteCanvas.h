// =============================================================================
// Pywel Atlas - the route line drawn on map canvases
// (RouteCanvas.h, v0.111-v0.121)
// =============================================================================
//
// What this file is for:
//   v0.121: the UI add-on adds one line canvas of ours to each map, next to
//   the game's own route canvas: #PywelRouteCanvas on the world map page and
//   #PywelRouteMinimapCanvas inside the minimap's round mask (v0.111-v0.120
//   drew on the game's own canvases). They sit inside the maps' own layers:
//   they pan, zoom and turn with the map, the game's icons draw above them,
//   and the knowledge card and other popups cover them. Drawing our route
//   there (instead of with the ImGui overlay on top of everything) makes it
//   look and layer like the game's own line.
//
// When it runs:
//   On the game's map thread, right after each map update (called from the
//   marker part's ObserveWorldMapUpdate and ObserveMinimapUpdate hooks).
// =============================================================================
#pragma once

// Draws the current route lines on our world map canvas. `controller` is
// the world map controller (its vtable already checked by the caller).
void PywelRouteDrawWorldCanvas(void* controller);
// v0.115: the same on our minimap canvas. `controller` is the minimap
// controller (its vtable already checked by the caller).
void PywelRouteDrawMinimapCanvas(void* controller);

// Counters for the route log (any thread).
struct RouteCanvasStats {
    bool guardsChecked;
    bool guardsMatched; // Canvas class, clear slot, drawing and query functions as studied.
    // One set per map.
    struct Map {
        long updates; // Map updates seen.
        long drawn; // Updates in which our lines were added.
        long notFound; // v0.121: updates without our canvas (UI add-on missing or older).
        long cleared; // Updates in which we cleared our canvas.
        long matrixWrites; // World map: updates in which we set the canvas transform.
        long lookups; // v0.121: searches for our canvas.
        long polylines; // Lines added (0x3d14990; legs and dots).
        float lastWidth; // Current-leg width sent last time (canvas coordinates).
        unsigned long long lastDrawTick; // GetTickCount64 of the last update showing our lines (0 = never).
    } world, minimap;
    float crimson[4]; // The colours as sent (linear blue, green, red, opacity).
    float outline[4];
};
void PywelGetRouteCanvasStats(RouteCanvasStats& stats);
