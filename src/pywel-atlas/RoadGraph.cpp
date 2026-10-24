// =============================================================================
// Pywel Atlas - the world map's road network (RoadGraph.cpp)
// =============================================================================
//
// Builds the searchable road graph from the embedded table (road-graph.h)
// once, then answers "which edges leave this point" and "where is the
// nearest road". See RoadGraph.h. Pure code: no game reads.
// =============================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>

#include <algorithm>
#include <cmath>
#include <vector>

#include "RoadGraph.h"
#include "road-graph.h"

namespace {

// Size of one lookup cell (metres).
constexpr float kCellSize = 50.0f;

// Everything built from the embedded table. Read-only once built.
struct Graph {
    bool ready;
    std::vector<unsigned> linkStart; // Point i's links are links[linkStart[i] .. linkStart[i + 1]).
    std::vector<RoadLink> links;
    std::vector<float> edgeLength;
    std::vector<float> edgeCost;
    std::vector<unsigned> component;
    // The lookup grid: cell c's edges are cellEdges[cellStart[c] .. cellStart[c + 1]).
    float minX;
    float minZ;
    int columns;
    int rows;
    std::vector<unsigned> cellStart;
    std::vector<unsigned> cellEdges;
};

Graph graph = {};
INIT_ONCE buildOnce = INIT_ONCE_STATIC_INIT;

// A road point from the embedded table.
RoutePoint PointOf(unsigned point) {
    return {kRoadPoints[point][0], kRoadPoints[point][1]};
}

// The grid cell (column, row) a position falls in, clamped to the grid.
void CellOf(float x, float z, int& column, int& row) {
    column = static_cast<int>(std::floor((x - graph.minX) / kCellSize));
    row = static_cast<int>(std::floor((z - graph.minZ) / kCellSize));
    column = std::clamp(column, 0, graph.columns - 1);
    row = std::clamp(row, 0, graph.rows - 1);
}

// Fills the adjacency lists, edge lengths and costs.
void BuildLinks() {
    std::vector<unsigned> degree(kRoadPointCount + 1, 0);
    graph.edgeLength.resize(kRoadEdgeCount);
    graph.edgeCost.resize(kRoadEdgeCount);
    for (unsigned edge = 0; edge < kRoadEdgeCount; ++edge) {
        RoutePoint a = PointOf(kRoadEdges[edge][0]);
        RoutePoint b = PointOf(kRoadEdges[edge][1]);
        float length = std::hypot(a.x - b.x, a.z - b.z);
        graph.edgeLength[edge] = length;
        graph.edgeCost[edge] = kRoadEdges[edge][2] ? length * kMainRoadFactor : length;
        ++degree[kRoadEdges[edge][0]];
        ++degree[kRoadEdges[edge][1]];
    }
    graph.linkStart.assign(kRoadPointCount + 1, 0);
    for (unsigned point = 0; point < kRoadPointCount; ++point) {
        graph.linkStart[point + 1] = graph.linkStart[point] + degree[point];
    }
    graph.links.resize(graph.linkStart[kRoadPointCount]);
    std::vector<unsigned> filled(graph.linkStart.begin(), graph.linkStart.end() - 1);
    for (unsigned edge = 0; edge < kRoadEdgeCount; ++edge) {
        unsigned a = kRoadEdges[edge][0];
        unsigned b = kRoadEdges[edge][1];
        graph.links[filled[a]++] = {b, edge, graph.edgeLength[edge], graph.edgeCost[edge]};
        graph.links[filled[b]++] = {a, edge, graph.edgeLength[edge], graph.edgeCost[edge]};
    }
}

// Numbers the connected parts (a breadth-first walk from each unvisited point).
void BuildComponents() {
    graph.component.assign(kRoadPointCount, 0xffffffffu);
    std::vector<unsigned> queue;
    unsigned next = 0;
    for (unsigned start = 0; start < kRoadPointCount; ++start) {
        if (graph.component[start] != 0xffffffffu) {
            continue;
        }
        queue.assign(1, start);
        graph.component[start] = next;
        for (size_t head = 0; head < queue.size(); ++head) {
            unsigned point = queue[head];
            for (unsigned link = graph.linkStart[point]; link < graph.linkStart[point + 1]; ++link) {
                unsigned to = graph.links[link].to;
                if (graph.component[to] == 0xffffffffu) {
                    graph.component[to] = next;
                    queue.push_back(to);
                }
            }
        }
        ++next;
    }
}

// Lists every edge in each 50 m cell its bounding box touches.
void BuildGrid() {
    float minX = kRoadPoints[0][0];
    float maxX = minX;
    float minZ = kRoadPoints[0][1];
    float maxZ = minZ;
    for (unsigned point = 1; point < kRoadPointCount; ++point) {
        minX = std::min(minX, kRoadPoints[point][0]);
        maxX = std::max(maxX, kRoadPoints[point][0]);
        minZ = std::min(minZ, kRoadPoints[point][1]);
        maxZ = std::max(maxZ, kRoadPoints[point][1]);
    }
    graph.minX = minX;
    graph.minZ = minZ;
    graph.columns = static_cast<int>((maxX - minX) / kCellSize) + 1;
    graph.rows = static_cast<int>((maxZ - minZ) / kCellSize) + 1;
    size_t cells = static_cast<size_t>(graph.columns) * graph.rows;

    // Two passes: count per cell, then fill.
    std::vector<unsigned> counts(cells + 1, 0);
    for (int pass = 0; pass < 2; ++pass) {
        std::vector<unsigned> filled;
        if (pass == 1) {
            graph.cellStart.assign(cells + 1, 0);
            for (size_t cell = 0; cell < cells; ++cell) {
                graph.cellStart[cell + 1] = graph.cellStart[cell] + counts[cell];
            }
            graph.cellEdges.resize(graph.cellStart[cells]);
            filled.assign(graph.cellStart.begin(), graph.cellStart.end() - 1);
        }
        for (unsigned edge = 0; edge < kRoadEdgeCount; ++edge) {
            RoutePoint a = PointOf(kRoadEdges[edge][0]);
            RoutePoint b = PointOf(kRoadEdges[edge][1]);
            int column0 = 0;
            int row0 = 0;
            int column1 = 0;
            int row1 = 0;
            CellOf(std::min(a.x, b.x), std::min(a.z, b.z), column0, row0);
            CellOf(std::max(a.x, b.x), std::max(a.z, b.z), column1, row1);
            for (int row = row0; row <= row1; ++row) {
                for (int column = column0; column <= column1; ++column) {
                    size_t cell = static_cast<size_t>(row) * graph.columns + column;
                    if (pass == 0) {
                        ++counts[cell];
                    } else {
                        graph.cellEdges[filled[cell]++] = edge;
                    }
                }
            }
        }
    }
}

// INIT_ONCE callback: builds everything once.
BOOL CALLBACK Build(PINIT_ONCE, void*, void**) {
    static_assert(kRoadPointCount >= 2 && kRoadEdgeCount >= 1, "The embedded road table is empty");
    BuildLinks();
    BuildComponents();
    BuildGrid();
    graph.ready = true;
    return TRUE;
}

// The nearest spot on edge `edge` to `position`.
RoadSnap SnapToEdge(unsigned edge, const RoutePoint& position) {
    RoadSnap snap = {};
    snap.found = true;
    snap.edge = edge;
    snap.a = kRoadEdges[edge][0];
    snap.b = kRoadEdges[edge][1];
    RoutePoint a = PointOf(snap.a);
    RoutePoint b = PointOf(snap.b);
    float dx = b.x - a.x;
    float dz = b.z - a.z;
    float lengthSquared = dx * dx + dz * dz;
    float t = lengthSquared > 0.0f ? ((position.x - a.x) * dx + (position.z - a.z) * dz) / lengthSquared : 0.0f;
    snap.t = std::clamp(t, 0.0f, 1.0f);
    snap.point = {a.x + dx * snap.t, a.z + dz * snap.t};
    snap.distance = std::hypot(snap.point.x - position.x, snap.point.z - position.z);
    return snap;
}

} // namespace

// See RoadGraph.h.
bool RoadGraphReady() {
    InitOnceExecuteOnce(&buildOnce, Build, nullptr, nullptr);
    return graph.ready;
}

// See RoadGraph.h.
unsigned RoadPointCount() {
    return kRoadPointCount;
}

// See RoadGraph.h.
RoutePoint RoadPointAt(unsigned point) {
    return point < kRoadPointCount ? PointOf(point) : RoutePoint{0.0f, 0.0f};
}

// See RoadGraph.h.
const RoadLink* RoadLinksOf(unsigned point, unsigned& count) {
    count = 0;
    if (!RoadGraphReady() || point >= kRoadPointCount) {
        return nullptr;
    }
    count = graph.linkStart[point + 1] - graph.linkStart[point];
    return graph.links.data() + graph.linkStart[point];
}

// See RoadGraph.h.
unsigned RoadComponentOf(unsigned point) {
    return RoadGraphReady() && point < kRoadPointCount ? graph.component[point] : 0xffffffffu;
}

// See RoadGraph.h.
float RoadEdgeLength(unsigned edge) {
    return RoadGraphReady() && edge < kRoadEdgeCount ? graph.edgeLength[edge] : 0.0f;
}

// See RoadGraph.h.
float RoadEdgeCost(unsigned edge) {
    return RoadGraphReady() && edge < kRoadEdgeCount ? graph.edgeCost[edge] : 0.0f;
}

// See RoadGraph.h. Looks at every edge in the cells within `radius`; an
// edge seen in several cells is measured once per cell (cheap, and the
// list is de-duplicated before sorting).
unsigned RoadSnapsNear(const RoutePoint& position, float radius, RoadSnap* snaps, unsigned capacity) {
    if (!snaps || capacity == 0 || !RoadGraphReady()) {
        return 0;
    }
    int column0 = 0;
    int row0 = 0;
    int column1 = 0;
    int row1 = 0;
    CellOf(position.x - radius, position.z - radius, column0, row0);
    CellOf(position.x + radius, position.z + radius, column1, row1);
    std::vector<RoadSnap> found;
    for (int row = row0; row <= row1; ++row) {
        for (int column = column0; column <= column1; ++column) {
            size_t cell = static_cast<size_t>(row) * graph.columns + column;
            for (unsigned item = graph.cellStart[cell]; item < graph.cellStart[cell + 1]; ++item) {
                RoadSnap snap = SnapToEdge(graph.cellEdges[item], position);
                if (snap.distance <= radius) {
                    found.push_back(snap);
                }
            }
        }
    }
    std::sort(found.begin(), found.end(), [](const RoadSnap& left, const RoadSnap& right) {
        return left.edge != right.edge ? left.edge < right.edge : left.distance < right.distance;
    });
    found.erase(std::unique(found.begin(), found.end(),
        [](const RoadSnap& left, const RoadSnap& right) { return left.edge == right.edge; }), found.end());
    std::sort(found.begin(), found.end(),
        [](const RoadSnap& left, const RoadSnap& right) { return left.distance < right.distance; });
    unsigned count = static_cast<unsigned>(std::min<size_t>(found.size(), capacity));
    std::copy(found.begin(), found.begin() + count, snaps);
    return count;
}

// See RoadGraph.h.
RoadSnap SnapToRoad(const RoutePoint& position, float maxDistance) {
    RoadSnap snap = {};
    RoadSnapsNear(position, maxDistance, &snap, 1);
    return snap;
}
