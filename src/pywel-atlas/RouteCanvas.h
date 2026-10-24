// =============================================================================
// Pywel Atlas - the route line drawn on map canvases
// (RouteCanvas.h, v0.111-v0.133)
// =============================================================================
//
// What this file is for:
//   v0.121: the UI add-on adds line canvases of ours to each map, next to
//   the game's own route canvas: on the world map page
//   #PywelRouteCanvasPlain (v0.124; v0.124-v0.132 also a "Painted" one),
//   and #PywelRouteMinimapCanvas
//   inside the minimap's round mask (v0.111-v0.120 drew on the game's own
//   canvases). They sit inside the maps' own layers: they pan, zoom and turn
//   with the map, the game's icons draw above them, and the knowledge card
//   and other popups cover them. Drawing our route there (instead of with the
//   ImGui overlay on top of everything) makes it look and layer like the
//   game's own line.
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

// v0.124: true while the world map shows the player's map layer (surface or
// Abyss), as last seen by the world map update (true before the first one).
// The route is drawn on the world map only then.
bool PywelRouteWorldLayerMatches();

// Counters for the route log (any thread).
struct RouteCanvasStats {
    bool guardsChecked;
    bool guardsMatched; // Canvas class, clear and path slots, drawing and query functions as studied.
    // One set per map.
    struct Map {
        long updates; // Map updates seen.
        long drawn; // Updates in which our lines were added.
        long notFound; // v0.121: updates without our canvas (UI add-on missing or older).
        long cleared; // Updates in which we cleared a canvas of ours.
        long matrixWrites; // World map: updates in which we set the canvas transform.
        long lookups; // v0.121: searches for our canvas.
        long paths; // v0.124: continuous paths added (slot 0x398; legs and rings).
        long layerSkips; // v0.124 world map: updates skipped because the map shows the other layer.
        long budgetSkips; // v0.131: legs or rings left out to stay within the geometry budget.
        unsigned layerBytes; // v0.124 world map: the "layer showing" bytes 0..3 (controller +0x468).
        bool playerAbyss; // v0.124: the player is on the Abyss layer (minimap snapshot).
        const char* found; // v0.124: how our canvas was found ("query", "child walk" or "not found").
        const char* drawnOn; // v0.124 world map: "painted", "plain" or "none".
        float lastWidth; // Current-leg width sent last time (canvas coordinates).
        unsigned long long lastDrawTick; // GetTickCount64 of the last update our canvas handled (0 = never).
    } world, minimap;
    float crimson[4]; // The colours as sent (linear blue, green, red, opacity).
    float outline[4];
};
void PywelGetRouteCanvasStats(RouteCanvasStats& stats);

// v0.124: the latest canvas search report of each map (0 = world map, 1 =
// minimap), and a serial that grows with every new report. A report may
// hold several lines (separated by "\n"). Returns false if `map` has no
// report newer than `seenSerial`.
bool PywelGetRouteCanvasFindLog(unsigned map, unsigned seenSerial, unsigned& serial, char* text, size_t size);
