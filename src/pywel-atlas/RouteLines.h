// =============================================================================
// Pywel Atlas - the route as drawable lines (RouteLines.h)
// =============================================================================
//
// What this file is for:
//   Once legs follow the roads (RouteLegs.h), the route is no longer one
//   straight line per stop but a polyline per leg. The route worker
//   publishes them in this shape; the world-map canvas drawing
//   (RouteCanvas.cpp) and the ImGui overlay (RouteOverlay.cpp) both read it.
//
// Points are world metres on the X/Z plane. Only plain copies cross threads.
// =============================================================================
#pragma once

#include "MarkerFilter.h"
#include "RoutePlanner.h"

// Room for all legs' points together (a long tour on roads).
constexpr unsigned kRouteLineMaxPoints = 8192;
// Room for the legs (the planner's stop limit).
constexpr unsigned kRouteLineMaxLegs = kRouteMaxStops;

// One leg: which points of the shared buffer it uses, and where it ends.
struct RouteLineLeg {
    unsigned first; // Index of its first point in RouteLines::points.
    unsigned count; // How many points (at least 2).
    unsigned category; // The stop it leads to (marker category and number).
    unsigned index;
    bool onRoad; // False = a straight line.
};

// The whole route, leg by leg; legs[0] is the current leg (from the player).
struct RouteLines {
    unsigned serial; // Changes whenever the lines change.
    unsigned legCount;
    RouteLineLeg legs[kRouteLineMaxLegs];
    unsigned pointCount;
    RoutePoint points[kRouteLineMaxPoints];
};

// Copies the latest lines (false if there is no route). Implemented by the
// route worker (RouteSystem.cpp). Any thread.
bool PywelGetRouteLines(RouteLines& lines);
