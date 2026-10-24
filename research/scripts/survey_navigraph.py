"""Survey the game's navigation graph near collectibles (route research).

What it does:
    Reads gamedata/road/rootlevel/navigraph/*.roadsector from the user's own
    game install (pack 0008, read-only). Each sector file covers 4 x 4 map
    cells of 64 m; its header is: u32 version, i32 first cell x, i32 first
    cell z, then 16 (offset, size) pairs, one chunk per cell. A cell chunk is
    "1, 9, navigraph", then link records, then a node count and node records:

        link (not decoded in full): u32 link id, f32 0.1, f32 length (m), ...
        node: u32 node id (global), f32 x, y, z, f32 0.1, u32 flags,
              u32 count, count x u32 link ids

    Two nodes listing the same link id are joined by that link. Node and link
    ids are global, so links across cell and sector borders join up.

    For a few test collectibles (far off-road ones and ordinary ones) it
    decodes the sectors within 1 km, then reports: the nearest navigation
    node to the collectible, the nearest one to the nearest world-map road
    point, whether a path exists between them, and how much longer that
    path is than the straight line. It also counts nodes, links and bytes to
    estimate what embedding the graph near every collectible would cost.

Reads:  the game install, research/analysis/road-graph.json, data/*-links.json
Writes: research/analysis/navigraph-survey.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/survey_navigraph.py
"""
import heapq
import json
import math
import re
import struct
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
OUTPUT = ROOT / "research" / "analysis" / "navigraph-survey.json"
CELL = 64.0
RADIUS = 1000.0  # Metres of navigation graph decoded around each test spot.
# name -> data file, for the far ones from the road check and a few ordinary chests.
TESTS = ["Demeniss chest 31", "Crimson Desert Abyss Nexus 36", "Hernand cave chest 10", "Hernand cave chest 15",
         "Hernand chest 2", "Hernand chest 13", "Hernand chest 26", "Hernand chest 27", "Hernand Abyss Nexus 4"]
SECTOR_NAME = re.compile(r"navigraph_(-?\d+)_(-?\d+)_(-?\d+)_(-?\d+)\.roadsector$")


def sector_files():
    """All navigraph sector names with their cell ranges."""
    names = [line.split()[1] for line in (ROOT / "research/vendor/work/pack-files.txt").read_text(encoding="utf-8").splitlines()
             if "gamedata/road/rootlevel/navigraph/" in line]
    sectors = []
    for name in names:
        match = SECTOR_NAME.search(name)
        if match:
            sectors.append((name, *map(int, match.groups())))
    return sectors


def decode_cell(data, offset, size, x0, z0):
    """Node records of one cell chunk: found by scanning for the first node
    whose position lies in the cell, then read one after another."""
    end = offset + size
    lo_x, hi_x = x0 * CELL - 1, (x0 + 1) * CELL + 1
    lo_z, hi_z = z0 * CELL - 1, (z0 + 1) * CELL + 1
    nodes = []
    position = offset + 21
    while position + 28 <= end:
        x, y, z = struct.unpack_from("<fff", data, position + 4)
        if lo_x <= x <= hi_x and lo_z <= z <= hi_z and -1000 < y < 4000:
            break
        position += 1
    # The node count sits just before the first node record.
    total = struct.unpack_from("<I", data, position - 4)[0] if position + 28 <= end else 0
    for _ in range(min(total, 100000)):
        if position + 28 > end:
            break
        node, x, y, z, _radius, flags, count = struct.unpack_from("<IffffII", data, position)
        if count > 64:
            break
        links = struct.unpack_from(f"<{count}I", data, position + 28)
        nodes.append((node, x, y, z, flags, links))
        position += 28 + 4 * count
    return nodes


def decode_sector(data, x0, z0):
    """All nodes of one sector file (16 cells)."""
    table = struct.unpack_from("<32I", data, 12)
    nodes = []
    for cell in range(16):
        offset, size = table[2 * cell], table[2 * cell + 1]
        if size > 21:
            nodes += decode_cell(data, offset, size, x0 + cell % 4, z0 + cell // 4)
    return nodes


def nearest(points, x, z):
    """(distance, item) of the point nearest (x, z); points are (id, x, z)."""
    best = None
    for item in points:
        distance = math.hypot(item[1] - x, item[2] - z)
        if best is None or distance < best[0]:
            best = (distance, item)
    return best


def shortest(adjacency, positions, start, goal):
    """Dijkstra on the navigation graph; returns metres or None."""
    distance = {start: 0.0}
    queue = [(0.0, start)]
    while queue:
        cost, node = heapq.heappop(queue)
        if node == goal:
            return cost
        if cost > distance[node]:
            continue
        for other in adjacency[node]:
            step = math.hypot(positions[node][0] - positions[other][0], positions[node][1] - positions[other][1])
            if cost + step < distance.get(other, float("inf")):
                distance[other] = cost + step
                heapq.heappush(queue, (cost + step, other))
    return None


def main():
    """Decode around each test spot and report reachability and detours."""
    sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))
    from pycrimson._context import PackageContext  # noqa: E402

    context = PackageContext(GAME, pack_group_whitelist=["0008"])
    sectors = sector_files()
    locations = {}
    for file in ("treasure-chest-links.json", "abyss-nexus-links.json"):
        for row in json.loads((ROOT / "data" / file).read_text(encoding="utf-8"))["locations"]:
            locations[row["name"]] = row["gamePosition"]
    road = json.loads((ROOT / "research/analysis/road-graph.json").read_text(encoding="utf-8"))
    road_points = [(n[0], n[1], n[3]) for n in road["types"]["worldmaproad"]["nodes"]]

    total_bytes = 0
    results = []
    decoded = {}
    for test in TESTS:
        x, _, z = locations[test]
        wanted = [s for s in sectors
                  if s[1] * CELL - RADIUS <= x <= (s[3] + 1) * CELL + RADIUS
                  and s[2] * CELL - RADIUS <= z <= (s[4] + 1) * CELL + RADIUS]
        nodes = []
        for name, x0, z0, _, _ in wanted:
            if name not in decoded:
                data = context.get_file(name)
                total_bytes += len(data)
                decoded[name] = decode_sector(data, x0, z0)
            nodes += decoded[name]
        positions = {n[0]: (n[1], n[3]) for n in nodes}
        by_link = defaultdict(list)
        for n in nodes:
            for link in n[5]:
                by_link[link].append(n[0])
        adjacency = defaultdict(set)
        for members in by_link.values():
            for a in members:
                for b in members:
                    if a != b:
                        adjacency[a].add(b)
        points = [(n[0], n[1], n[3]) for n in nodes]
        stop = nearest(points, x, z)
        road_near = nearest([p for p in road_points if abs(p[1] - x) < 1500 and abs(p[2] - z) < 1500], x, z)
        entry = nearest(points, road_near[1][1], road_near[1][2]) if road_near else None
        path = shortest(adjacency, positions, entry[1][0], stop[1][0]) if stop and entry else None
        straight = math.hypot(road_near[1][1] - x, road_near[1][2] - z) if road_near else None
        results.append({
            "name": test, "position": locations[test], "sectors": len(wanted), "nodesDecoded": len(nodes),
            "nearestNavNodeToStop": round(stop[0], 1) if stop else None,
            "roadToStopStraight": round(straight, 1) if straight else None,
            "navNodeNearRoad": round(entry[0], 1) if entry else None,
            "navPathFromRoadNode": round(path, 1) if path is not None else None,
            "detourFactor": round(path / straight, 2) if path and straight else None,
        })
        print(json.dumps(results[-1]))
    all_nodes = sum(len(v) for v in decoded.values())
    summary = {"sectorsDecoded": len(decoded), "bytes": total_bytes, "nodes": all_nodes,
               "nodesPerSector": round(all_nodes / max(1, len(decoded))),
               "sectorsInGame": len(sectors)}
    print(json.dumps(summary))
    OUTPUT.write_text(json.dumps({"summary": summary, "tests": results}, indent=1), encoding="utf-8")


if __name__ == "__main__":
    main()
