// =============================================================================
// Pywel Atlas - the world map's road network (RoadGraph.h)
// =============================================================================
//
// What this file is for:
//   The route line follows the game's own world-map roads. Their points and
//   edges are embedded at build time (road-graph.h, made by
//   prepare_road_graph.py from the game's road file). This part turns that
//   table into something quick to search:
//   - for every point, the edges leaving it (an "adjacency list");
//   - a grid of 50 m cells listing the edges that pass through each cell,
//     so "the nearest road to this spot" only looks at a few edges.
//
// Coordinates are world metres on the X/Z plane (height is not stored).
// The graph is built once, on first use, from any thread; after that it is
// read-only, so every function here is safe to call from any thread.
// =============================================================================
#pragma once

#include "RoutePlanner.h"

// One edge leaving a road point.
struct RoadLink {
    unsigned to; // The point at the other end.
    unsigned edge; // Edge number (into the embedded table).
    float length; // Metres.
    float cost; // Length with the main-road discount applied.
};

// The nearest spot on one road edge to a given position.
struct RoadSnap {
    bool found;
    unsigned edge; // Edge number.
    unsigned a; // The edge's first and second point.
    unsigned b;
    float t; // Where on the edge: 0 = at a, 1 = at b.
    RoutePoint point; // The spot itself.
    float distance; // Metres from the given position.
};

// Main roads count as this fraction of their length, so the route prefers
// them a little (the cart roads of the game's "wagon" road type).
constexpr float kMainRoadFactor = 0.9f;

// Builds the graph on first call; false if the embedded table is unusable.
bool RoadGraphReady();
// How many road points there are, and where one is.
unsigned RoadPointCount();
RoutePoint RoadPointAt(unsigned point);
// The edges leaving `point`; `count` receives how many.
const RoadLink* RoadLinksOf(unsigned point, unsigned& count);
// Which connected part of the network a point belongs to (same number =
// reachable from one another).
unsigned RoadComponentOf(unsigned point);
// Length and cost of one edge.
float RoadEdgeLength(unsigned edge);
float RoadEdgeCost(unsigned edge);
// The nearest spot on any road within `maxDistance` metres (found = false
// if there is none).
RoadSnap SnapToRoad(const RoutePoint& position, float maxDistance);
// The nearest spot on each road edge within `radius` metres, nearest first,
// up to `capacity` of them. Returns how many were written.
unsigned RoadSnapsNear(const RoutePoint& position, float radius, RoadSnap* snaps, unsigned capacity);
