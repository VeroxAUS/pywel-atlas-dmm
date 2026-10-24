// =============================================================================
// Pywel Atlas - road-following route legs (RouteLegs.cpp)
// =============================================================================
//
// Finds the cheapest way from a start to one or more stops: straight to the
// nearest road, along the roads, then off the road at the best exit point
// (road cost + kOffRoadWeight x off-road metres), or a plain straight line
// when that is cheaper or no road helps. See RouteLegs.h.
//
// Costs used below:
//   entry  = kOffRoadWeight x (start to the road spot nearest it)
//   road   = road metres between that spot and an exit spot (main roads
//            discounted, see RoadGraph.h)
//   exit   = kOffRoadWeight x (exit spot to the stop)
//   direct = kOffRoadWeight x (start to the stop), the no-road fallback
// =============================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <algorithm>
#include <cmath>
#include <queue>
#include <utility>
#include <vector>

#include "RoadGraph.h"
#include "RouteLegs.h"

namespace {

constexpr unsigned kNone = 0xffffffffu;
// Exit spots tried per stop (the nearest ones).
constexpr unsigned kMaxExits = 48;

// Horizontal distance.
float Distance(const RoutePoint& a, const RoutePoint& b) {
    return std::hypot(a.x - b.x, a.z - b.z);
}

// Scratch memory for one search, kept per thread so it is allocated once.
struct Scratch {
    std::vector<float> cost; // Road cost from the start's road spot to each point.
    std::vector<unsigned> previous; // The point before it on that cheapest way.
    std::vector<unsigned> stamp; // Search number that last wrote this point.
    unsigned search;
};
thread_local Scratch scratch = {};

// One stop's best way found so far.
struct TargetBest {
    float cost;
    bool viaRoad;
    RoadSnap exit; // Where it leaves the road.
    bool sameEdge; // Enters and leaves on the same edge (no graph walk).
    unsigned endPoint; // The graph point the road part ends at (kNone if sameEdge).
};

// An exit spot of one stop, remembered under the edge's end points so it can
// be priced as soon as an end point is settled.
struct ExitRef {
    unsigned point;
    unsigned target;
    unsigned exit;
};

// The search. `targets` are the stops; `best` receives one entry per stop.
// `entry` receives the start's road spot (found = false if none in range).
void Search(const RoutePoint& from, const RoutePoint* targets, unsigned targetCount, std::vector<TargetBest>& best,
    RoadSnap& entry) {
    best.assign(targetCount, {});
    for (unsigned target = 0; target < targetCount; ++target) {
        best[target].cost = kOffRoadWeight * Distance(from, targets[target]);
        best[target].viaRoad = false;
        best[target].endPoint = kNone;
    }
    entry = RoadGraphReady() ? SnapToRoad(from, kRoadJoinDistance) : RoadSnap{};
    if (!entry.found) {
        return;
    }
    float entryCost = kOffRoadWeight * entry.distance;
    float entryEdgeCost = RoadEdgeCost(entry.edge);

    // Each stop's exit spots, and an index from end point to exit.
    std::vector<std::vector<RoadSnap>> exits(targetCount);
    std::vector<ExitRef> refs;
    for (unsigned target = 0; target < targetCount; ++target) {
        RoadSnap found[kMaxExits];
        unsigned count = RoadSnapsNear(targets[target], kRoadExitDistance, found, kMaxExits);
        exits[target].assign(found, found + count);
        for (unsigned exit = 0; exit < count; ++exit) {
            const RoadSnap& spot = found[exit];
            // Entering and leaving on the same edge: priced straight away.
            if (spot.edge == entry.edge) {
                float total = entryCost + std::fabs(spot.t - entry.t) * entryEdgeCost + kOffRoadWeight * spot.distance;
                if (total < best[target].cost) {
                    best[target] = {total, true, spot, true, kNone};
                }
            }
            refs.push_back({spot.a, target, exit});
            refs.push_back({spot.b, target, exit});
        }
    }
    std::sort(refs.begin(), refs.end(), [](const ExitRef& left, const ExitRef& right) { return left.point < right.point; });

    // Prices the exits listed under a settled point.
    auto priceExitsAt = [&](unsigned point, float pointCost) {
        auto range = std::equal_range(refs.begin(), refs.end(), ExitRef{point, 0, 0},
            [](const ExitRef& left, const ExitRef& right) { return left.point < right.point; });
        for (auto ref = range.first; ref != range.second; ++ref) {
            const RoadSnap& spot = exits[ref->target][ref->exit];
            float along = point == spot.a ? spot.t : 1.0f - spot.t;
            float total = entryCost + pointCost + along * RoadEdgeCost(spot.edge) + kOffRoadWeight * spot.distance;
            if (total < best[ref->target].cost) {
                best[ref->target] = {total, true, spot, false, point};
            }
        }
    };
    // The search may stop once nothing cheaper than every stop's best can
    // still turn up.
    auto bound = [&]() {
        float worst = 0.0f;
        for (const TargetBest& item : best) {
            worst = std::max(worst, item.cost);
        }
        return worst;
    };

    unsigned points = RoadPointCount();
    if (scratch.cost.size() != points) {
        scratch.cost.assign(points, 0.0f);
        scratch.previous.assign(points, kNone);
        scratch.stamp.assign(points, 0);
        scratch.search = 0;
    }
    unsigned search = ++scratch.search;
    using Item = std::pair<float, unsigned>;
    std::priority_queue<Item, std::vector<Item>, std::greater<Item>> open;
    auto seed = [&](unsigned point, float cost) {
        if (scratch.stamp[point] != search || cost < scratch.cost[point]) {
            scratch.stamp[point] = search;
            scratch.cost[point] = cost;
            scratch.previous[point] = kNone;
            open.push({cost, point});
        }
    };
    seed(entry.a, entry.t * entryEdgeCost);
    seed(entry.b, (1.0f - entry.t) * entryEdgeCost);
    float limit = bound();
    while (!open.empty()) {
        auto [cost, point] = open.top();
        open.pop();
        if (cost > scratch.cost[point]) {
            continue; // An older, dearer copy.
        }
        if (entryCost + cost >= limit) {
            break;
        }
        priceExitsAt(point, cost);
        limit = bound();
        unsigned linkCount = 0;
        const RoadLink* links = RoadLinksOf(point, linkCount);
        for (unsigned link = 0; link < linkCount; ++link) {
            unsigned to = links[link].to;
            float next = cost + links[link].cost;
            if (scratch.stamp[to] != search || next < scratch.cost[to]) {
                scratch.stamp[to] = search;
                scratch.cost[to] = next;
                scratch.previous[to] = point;
                open.push({next, to});
            }
        }
    }
}

// Adds `point` to `line` unless it repeats the last one.
void Append(std::vector<RoutePoint>& line, const RoutePoint& point) {
    if (line.empty() || Distance(line.back(), point) > 0.01f) {
        line.push_back(point);
    }
}

} // namespace

// See RouteLegs.h.
RouteLegInfo PlanRouteLeg(const RoutePoint& from, const RoutePoint& to, RoutePoint* points, unsigned capacity,
    unsigned& count) {
    count = 0;
    RouteLegInfo info = {};
    std::vector<TargetBest> best;
    RoadSnap entry = {};
    Search(from, &to, 1, best, entry);
    const TargetBest& chosen = best[0];
    info.cost = chosen.cost;
    info.onRoad = chosen.viaRoad;

    std::vector<RoutePoint> line;
    Append(line, from);
    if (chosen.viaRoad) {
        Append(line, entry.point);
        if (!chosen.sameEdge) {
            // Walk back from the road part's end point to the entry edge.
            std::vector<RoutePoint> road;
            for (unsigned point = chosen.endPoint; point != kNone; point = scratch.previous[point]) {
                road.push_back(RoadPointAt(point));
            }
            for (auto item = road.rbegin(); item != road.rend(); ++item) {
                Append(line, *item);
            }
        }
        Append(line, chosen.exit.point);
    }
    Append(line, to);
    if (line.size() < 2) {
        line.push_back(to);
    }

    // Too many points for the caller's buffer: keep an even spread, always
    // with the first and last.
    if (!points || capacity < 2) {
        return info;
    }
    unsigned total = static_cast<unsigned>(line.size());
    unsigned written = std::min(total, capacity);
    for (unsigned item = 0; item < written; ++item) {
        unsigned source = written == total ? item : static_cast<unsigned>((static_cast<unsigned long long>(item) *
            (total - 1)) / (written - 1));
        points[item] = line[source];
    }
    count = written;
    for (size_t item = 1; item < line.size(); ++item) {
        info.length += Distance(line[item - 1], line[item]);
    }
    if (chosen.viaRoad) {
        info.entryDistance = entry.distance;
        info.exitDistance = chosen.exit.distance;
        info.roadLength = info.length - info.entryDistance - info.exitDistance;
    }
    return info;
}

// See RouteLegs.h.
void RouteLegCosts(const RoutePoint& from, const RoutePoint* targets, unsigned targetCount, float* costs) {
    if (!targets || !costs || targetCount == 0) {
        return;
    }
    std::vector<TargetBest> best;
    RoadSnap entry = {};
    Search(from, targets, targetCount, best, entry);
    for (unsigned target = 0; target < targetCount; ++target) {
        costs[target] = best[target].cost;
    }
}
