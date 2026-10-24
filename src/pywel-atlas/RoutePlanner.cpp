// =============================================================================
// Pywel Atlas - route planner (RoutePlanner.cpp, v0.104)
// =============================================================================
//
// Orders the nearest collectibles into a short path that starts at the
// player. See RoutePlanner.h for the steps. Pure code: no game reads.
// =============================================================================
#include "RoutePlanner.h"

#include <algorithm>
#include <cmath>

namespace {

// Horizontal distance between two spots, in metres.
float Distance(const RoutePoint& a, const RoutePoint& b) {
    float dx = a.x - b.x;
    float dz = a.z - b.z;
    return std::sqrt(dx * dx + dz * dz);
}

// One candidate while choosing the nearest ones: its index and squared
// distance to the player (squared is enough for sorting).
struct Candidate {
    float distanceSquared;
    unsigned index;
};

} // namespace

// See RoutePlanner.h.
unsigned PlanRoute(const RoutePoint& start, const RoutePoint* points, unsigned count, unsigned keep,
    unsigned* order, float& length) {
    length = 0.0f;
    if (!points || !order || count == 0 || keep == 0) {
        return 0;
    }
    keep = std::min(keep, kRouteMaxStops);

    // Step 1: the `keep` nearest candidates. The list holds at most a few
    // thousand spots, so a plain sort of their distances is fast enough.
    Candidate nearest[kRouteMaxStops];
    unsigned kept = 0;
    for (unsigned index = 0; index < count; ++index) {
        float dx = points[index].x - start.x;
        float dz = points[index].z - start.z;
        Candidate candidate = {dx * dx + dz * dz, index};
        if (kept < keep) {
            nearest[kept++] = candidate;
            continue;
        }
        // Full: replace the farthest kept one if this one is closer.
        unsigned farthest = 0;
        for (unsigned slot = 1; slot < kept; ++slot) {
            if (nearest[slot].distanceSquared > nearest[farthest].distanceSquared) {
                farthest = slot;
            }
        }
        if (candidate.distanceSquared < nearest[farthest].distanceSquared) {
            nearest[farthest] = candidate;
        }
    }

    // Step 2: nearest neighbour from the player. path[0] is the player;
    // path[1..kept] are the stops (as indices into `points`).
    RoutePoint path[kRouteMaxStops + 1];
    unsigned pathIndex[kRouteMaxStops + 1];
    bool used[kRouteMaxStops] = {};
    path[0] = start;
    for (unsigned step = 1; step <= kept; ++step) {
        unsigned best = kept;
        float bestDistance = 0.0f;
        for (unsigned slot = 0; slot < kept; ++slot) {
            if (used[slot]) {
                continue;
            }
            float distance = Distance(path[step - 1], points[nearest[slot].index]);
            if (best == kept || distance < bestDistance) {
                best = slot;
                bestDistance = distance;
            }
        }
        used[best] = true;
        pathIndex[step] = nearest[best].index;
        path[step] = points[nearest[best].index];
    }

    // Step 3: 2-opt for an open path. Reversing path[i+1..j] swaps the edges
    // (i, i+1) and (j, j+1) for (i, j) and (i+1, j+1). The start (i = 0 is
    // the player) never moves; the end has no edge after it.
    bool improved = true;
    unsigned rounds = 0;
    while (improved && rounds++ < 100) {
        improved = false;
        for (unsigned i = 0; i + 1 < kept; ++i) {
            for (unsigned j = i + 1; j <= kept; ++j) {
                float before = Distance(path[i], path[i + 1]);
                float after = Distance(path[i], path[j]);
                if (j < kept) {
                    before += Distance(path[j], path[j + 1]);
                    after += Distance(path[i + 1], path[j + 1]);
                }
                // A small margin stops endless swaps of equal-length paths.
                if (after < before - 0.01f) {
                    std::reverse(path + i + 1, path + j + 1);
                    std::reverse(pathIndex + i + 1, pathIndex + j + 1);
                    improved = true;
                }
            }
        }
    }

    for (unsigned step = 1; step <= kept; ++step) {
        order[step - 1] = pathIndex[step];
        length += Distance(path[step - 1], path[step]);
    }
    return kept;
}

// See RoutePlanner.h.
float OrderByCosts(unsigned count, const float* costs, unsigned* order) {
    count = std::min(count, kRouteMaxStops);
    if (!costs || !order || count == 0) {
        return 0.0f;
    }
    unsigned places = count + 1;
    // Cost between two places, the same both ways.
    auto cost = [&](unsigned a, unsigned b) { return 0.5f * (costs[a * places + b] + costs[b * places + a]); };

    // Nearest neighbour from the start (place 0).
    unsigned path[kRouteMaxStops + 1];
    bool used[kRouteMaxStops + 1] = {};
    path[0] = 0;
    used[0] = true;
    for (unsigned step = 1; step <= count; ++step) {
        unsigned best = 0;
        for (unsigned place = 1; place <= count; ++place) {
            if (!used[place] && (best == 0 || cost(path[step - 1], place) < cost(path[step - 1], best))) {
                best = place;
            }
        }
        used[best] = true;
        path[step] = best;
    }

    // 2-opt for an open path, as in PlanRoute.
    bool improved = true;
    unsigned rounds = 0;
    while (improved && rounds++ < 100) {
        improved = false;
        for (unsigned i = 0; i + 1 < count; ++i) {
            for (unsigned j = i + 1; j <= count; ++j) {
                float before = cost(path[i], path[i + 1]);
                float after = cost(path[i], path[j]);
                if (j < count) {
                    before += cost(path[j], path[j + 1]);
                    after += cost(path[i + 1], path[j + 1]);
                }
                if (after < before - 0.01f) {
                    std::reverse(path + i + 1, path + j + 1);
                    improved = true;
                }
            }
        }
    }

    float total = 0.0f;
    for (unsigned step = 1; step <= count; ++step) {
        order[step - 1] = path[step] - 1;
        total += cost(path[step - 1], path[step]);
    }
    return total;
}
