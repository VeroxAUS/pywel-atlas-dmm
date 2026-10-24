"""Extract the world map's road network from the game files (route research).

What it does:
    Reads gamedata/road/rootlevel/main/fielddefault.road from the user's own
    game install (pack group 0008, read-only) and decodes its road types.
    Each type ("worldmaproad", "wagon", ...) holds a list of road records and
    then a list of nodes. Only the nodes are needed for routing:

        node record (byte-packed, no padding):
            u32 id            consecutive from 0
            f32 x, y, z       world position in metres (same space as map icons)
            f32 width         road width (1.5 m on most nodes)
            u32 class         0 or 1
            u32 count         how many road segments pass through this node
            u32 segment[count]

    A segment is one stretch of road. Its nodes, taken in id order, are its
    polyline; a node listed by two or more segments is where they meet. So
    the graph's edges join consecutive nodes of the same segment.

    The script writes the nodes and edges of every type, summary statistics
    (counts, connected parts, total length, bounding box, Abyss layer), and
    checks real collectible positions against the road network (distance to
    the nearest road node), plus a simplification estimate for an embedded
    header (junctions and end points kept, shape points about every 20 m).

Key terms:
    Connected part - a set of nodes all reachable from one another.
    Abyss layer    - positions higher than the game's Abyss altitude
                     threshold (1500 m, from the map traces).

Reads:  the game install (or --file, a copy of fielddefault.road),
        data/*-links.json (collectible positions for the check)
Writes: research/analysis/road-graph.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/extract_road_graph.py [--file PATH]
"""
import argparse
import json
import math
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
ROAD_FILE = "gamedata/road/rootlevel/main/fielddefault.road"
OUTPUT = ROOT / "research" / "analysis" / "road-graph.json"
ABYSS_ALTITUDE = 1500.0
# Collectible files used for the "is it near a road" check.
CHECK_FILES = ["bell-save-links.json", "treasure-chest-links.json", "greymane-shrine-links.json",
               "abyss-nexus-links.json"]
SIMPLIFY_STEP = 20.0  # Metres between kept shape points.
# Road types whose nodes and edges are written in full.
FULL_TYPES = ("worldmaproad", "wagon")


def read_road_file(path_override):
    """Returns the bytes of fielddefault.road (from --file or the game install)."""
    if path_override:
        return Path(path_override).read_bytes()
    sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))
    from pycrimson._context import PackageContext  # noqa: E402

    return PackageContext(GAME, pack_group_whitelist=["0008"]).get_file(ROAD_FILE)


def node_at(data, offset):
    """Decodes one node record at `offset`, or None if it does not look like one."""
    if offset + 28 > len(data):
        return None
    node, x, y, z, width, kind, count = struct.unpack_from("<IffffII", data, offset)
    if count > 16 or not (-40000 < x < 40000 and -40000 < z < 40000 and -2000 < y < 6000) or not (0 <= width < 100):
        return None
    if offset + 28 + 4 * count > len(data):
        return None
    segments = struct.unpack_from(f"<{count}I", data, offset + 28)
    return {"id": node, "x": x, "y": y, "z": z, "width": width, "class": kind, "segments": segments,
            "next": offset + 28 + 4 * count}


def find_type_names(data):
    """Finds the road type names: a u32 length, then that many lowercase
    letters, followed by a u32 road count. Returns [(offset, name)]."""
    names = []
    offset = 0
    while offset < len(data) - 8:
        length = struct.unpack_from("<I", data, offset)[0]
        if 3 <= length <= 32:
            text = data[offset + 4:offset + 4 + length]
            if text.isalpha() and text.islower():
                names.append((offset, text.decode("ascii")))
                offset += 4 + length
                continue
        offset += 1
    return names


def find_node_section(data, start, end):
    """The first offset in [start, end) where a chain of node records with ids
    0, 1, 2, ... begins (at least 20 long). None if there is none."""
    for offset in range(start, end):
        first = node_at(data, offset)
        if not first or first["id"] != 0:
            continue
        chain = first
        good = True
        for expected in range(1, 20):
            chain = node_at(data, chain["next"])
            if not chain or chain["id"] != expected:
                good = False
                break
        if good:
            return offset
    return None


def read_nodes(data, offset):
    """Reads node records from `offset` while their ids keep counting up."""
    nodes = []
    while True:
        node = node_at(data, offset)
        if not node or node["id"] != len(nodes):
            return nodes, offset
        nodes.append(node)
        offset = node["next"]


def build_edges(nodes):
    """Edges between consecutive nodes (by id) of the same segment."""
    members = defaultdict(list)
    for node in nodes:
        for segment in node["segments"]:
            members[segment].append(node["id"])
    edges = set()
    for ids in members.values():
        ids.sort()
        for a, b in zip(ids, ids[1:]):
            edges.add((a, b))
    return sorted(edges), members


def horizontal(a, b):
    """Horizontal distance between two nodes (X/Z)."""
    return math.hypot(a["x"] - b["x"], a["z"] - b["z"])


def components(count, edges):
    """Connected parts as a list of node-id lists, largest first (union-find)."""
    parent = list(range(count))

    def root(item):
        while parent[item] != item:
            parent[item] = parent[parent[item]]
            item = parent[item]
        return item

    for a, b in edges:
        ra, rb = root(a), root(b)
        if ra != rb:
            parent[ra] = rb
    groups = defaultdict(list)
    for item in range(count):
        groups[root(item)].append(item)
    return sorted(groups.values(), key=len, reverse=True)


def simplification(nodes, edges):
    """How many points an embedded header would keep: every node whose degree
    is not 2 (junctions and ends), plus one shape point about every 20 m."""
    degree = Counter()
    for a, b in edges:
        degree[a] += 1
        degree[b] += 1
    keep = sum(1 for node in nodes if degree[node["id"]] != 2)
    length = sum(horizontal(nodes[a], nodes[b]) for a, b in edges)
    shape = int(length / SIMPLIFY_STEP)
    return keep, shape


def check_positions(nodes, component_of):
    """Distance from real collectibles to the nearest road node, using a
    50 m grid so the search stays fast."""
    grid = defaultdict(list)
    for node in nodes:
        grid[(int(node["x"] // 50), int(node["z"] // 50))].append(node)
    results = []
    for file in CHECK_FILES:
        path = ROOT / "data" / file
        if not path.exists():
            continue
        for row in json.loads(path.read_text(encoding="utf-8"))["locations"]:
            x, y, z = row["gamePosition"]
            cell = (int(x // 50), int(z // 50))
            best = None
            for radius in range(0, 80):
                for dx in range(-radius, radius + 1):
                    for dz in (-radius, radius) if abs(dx) != radius else range(-radius, radius + 1):
                        for node in grid.get((cell[0] + dx, cell[1] + dz), ()):
                            distance = math.hypot(node["x"] - x, node["z"] - z)
                            if best is None or distance < best[0]:
                                best = (distance, node)
                if best and best[0] < radius * 50:
                    break
            results.append({
                "file": file, "name": row.get("name", "?"), "position": [x, y, z],
                "nearestNode": best[1]["id"] if best else None,
                "distance": round(best[0], 1) if best else None,
                "component": component_of.get(best[1]["id"]) if best else None,
            })
    return results


def main():
    """Decode every road type, write the graph, statistics and checks."""
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    parser.add_argument("--file", help="a copy of fielddefault.road instead of the game install")
    arguments = parser.parse_args()
    data = read_road_file(arguments.file)

    names = find_type_names(data)
    print("road types:", [name for _, name in names])
    output = {"source": ROAD_FILE, "size": len(data), "types": {}}
    for index, (offset, name) in enumerate(names):
        end = names[index + 1][0] if index + 1 < len(names) else len(data)
        start = find_node_section(data, offset, end)
        if start is None:
            print(f"{name}: no node list found")
            continue
        nodes, stop = read_nodes(data, start)
        edges, members = build_edges(nodes)
        parts = components(len(nodes), edges)
        component_of = {node: number for number, part in enumerate(parts) for node in part}
        length = sum(horizontal(nodes[a], nodes[b]) for a, b in edges)
        keep, shape = simplification(nodes, edges)
        xs = [node["x"] for node in nodes]
        zs = [node["z"] for node in nodes]
        stats = {
            "roadCount": struct.unpack_from("<I", data, offset + 4 + len(name))[0],
            "nodeSection": [hex(start), hex(stop)],
            "nodes": len(nodes),
            "edges": len(edges),
            "segments": len(members),
            "components": len(parts),
            "largestComponents": [len(part) for part in parts[:10]],
            "totalLengthKm": round(length / 1000.0, 1),
            "bbox": [round(min(xs)), round(min(zs)), round(max(xs)), round(max(zs))],
            "abyssNodes": sum(1 for node in nodes if node["y"] > ABYSS_ALTITUDE),
            "classes": dict(Counter(node["class"] for node in nodes)),
            "widths": {str(k): v for k, v in Counter(round(node["width"], 1) for node in nodes).most_common(8)},
            "edgeLengthPercentiles": [round(p, 1) for p in
                                      sorted(horizontal(nodes[a], nodes[b]) for a, b in edges)[::max(1, len(edges) // 10)]],
            "simplifiedPoints": {"junctionsAndEnds": keep, "shapePointsAt20m": shape},
        }
        entry = {"stats": stats}
        # Full lists only for the land roads; "ship" (a 216,000-node sea grid)
        # and "train" keep their statistics only, to keep the file small.
        if name in FULL_TYPES:
            entry["nodes"] = [[n["id"], round(n["x"], 2), round(n["y"], 2), round(n["z"], 2), n["width"], n["class"]]
                              for n in nodes]
            entry["edges"] = edges
        if name == "worldmaproad":
            entry["checks"] = check_positions(nodes, component_of)
        output["types"][name] = entry
        print(name, json.dumps(stats))
    OUTPUT.write_text(json.dumps(output, separators=(",", ":")), encoding="utf-8")
    print("wrote", OUTPUT)


if __name__ == "__main__":
    main()
