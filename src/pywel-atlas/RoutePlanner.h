// =============================================================================
// Pywel Atlas - route planner (RoutePlanner.h, v0.104)
// =============================================================================
//
// What this file is for:
//   Plans the order in which to visit collectibles. Given the player's spot
//   and a list of candidate spots, it keeps the nearest few and orders them as
//   an "open path": a line that starts at the player and ends at the last
//   stop (it does not return to the start).
//
// How it works:
//   1. Keep the `keep` candidates nearest to the player.
//   2. Nearest neighbour: from the player, always go to the closest stop not
//      yet visited.
//   3. 2-opt: try reversing every stretch of the path; keep a reversal when it
//      makes the path shorter (it removes a crossing). Repeat until nothing
//      improves.
//
// Pure code: no game memory, no threads, no Windows calls. Distances are
// horizontal metres on the game's X/Z plane (height is ignored).
// =============================================================================
#pragma once

// One spot on the X/Z plane, in game metres.
struct RoutePoint {
    float x;
    float z;
};

// The most stops a route may hold (the panel's slider goes up to this).
constexpr unsigned kRouteMaxStops = 10; // v0.133 (was 50).

// Plans a route from `start` through up to `keep` of the `count` points.
// Writes the chosen points' indices (into `points`) to `order` in visiting
// order and the path's total length (from `start`) to `length`. Returns how
// many stops were written (at most kRouteMaxStops). `order` must hold
// kRouteMaxStops entries.
unsigned PlanRoute(const RoutePoint& start, const RoutePoint* points, unsigned count, unsigned keep,
    unsigned* order, float& length);

// v0.111: orders `count` stops (at most kRouteMaxStops) by given travel
// costs instead of straight distances: `costs[i * (count + 1) + j]` is the
// cost from place i to place j, where place 0 is the start and place s + 1
// is stop s. Same open path method (nearest neighbour, then 2-opt; the two
// directions of a pair are averaged). Writes stop numbers to `order` and
// returns the total cost.
float OrderByCosts(unsigned count, const float* costs, unsigned* order);
