// =============================================================================
// Pywel Atlas - road-following route legs (RouteLegs.h)
// =============================================================================
//
// What this file is for:
//   A "leg" is the way from one spot to the next stop. It follows the
//   world-map roads (RoadGraph.h) where that helps and leaves them as late
//   as possible:
//     start -> nearest road (straight) -> along the roads -> the point where
//     the road comes closest to the stop, weighed against the extra road
//     walked -> straight to the stop.
//   Off-road metres count kOffRoadWeight times as much as road metres, so
//   the line stays on the road until near the stop (user request). If no
//   road is near, or the roads do not connect, the leg is a straight line.
//
// How it searches:
//   Dijkstra's shortest-path search from the road spot nearest the start.
//   It stops as soon as no cheaper way to the stop can still be found. The
//   same search can price many stops at once (for ordering the tour).
//
// Pure code, no game reads. The search keeps per-thread scratch memory, so
// it may run on any thread, but one call at a time per thread.
// =============================================================================
#pragma once

#include "RoutePlanner.h"

// Off-road metres count this many times as much as road metres.
constexpr float kOffRoadWeight = 4.0f;
// The start joins a road only within this distance; further away the leg
// starts straight (to its exit point or the stop).
constexpr float kRoadJoinDistance = 300.0f;
// Road spots up to this far from a stop are tried as the place to leave
// the road.
constexpr float kRoadExitDistance = 400.0f;

// What a leg costs and how it goes.
struct RouteLegInfo {
    float cost; // Road metres (main roads discounted) + weighted off-road metres.
    float length; // Real metres along the leg's line.
    bool onRoad; // False: a straight line (no useful road).
    float entryDistance; // Start to the road (metres; 0 if straight).
    float exitDistance; // Road exit to the stop (metres; 0 if straight).
    float roadLength; // Metres walked on the road.
};

// Plans the leg from `from` to `to` and writes its line (from, ..., to) to
// `points`, at most `capacity` points (a longer road line is thinned).
// `count` receives how many were written (at least 2).
RouteLegInfo PlanRouteLeg(const RoutePoint& from, const RoutePoint& to, RoutePoint* points, unsigned capacity,
    unsigned& count);
// The costs from `from` to each of `targets` (one search for all of them),
// written to `costs`. Used to order the tour by road distance.
void RouteLegCosts(const RoutePoint& from, const RoutePoint* targets, unsigned targetCount, float* costs);
