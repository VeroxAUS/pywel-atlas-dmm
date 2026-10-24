"""Build the road map the route line follows (build time only).

What it does:
    Reads the world map's road network ("worldmaproad") and the cart roads
    ("wagon") from the user's own game install, pack 0008,
    gamedata/road/rootlevel/main/fielddefault.road (read-only; the decoder
    is research/scripts/extract_road_graph.py). It then makes the network
    small enough to embed in the mod:
      1. Junctions and road ends (nodes with other than two neighbours) are
         always kept.
      2. Each stretch of road between two kept nodes is simplified with
         Douglas-Peucker at 3 m: a point is dropped when the road without
         it stays within 3 m of the original line, so the shape is kept.
      3. A stretch counts as a main road when most of its original nodes
         lie within 8 m of a cart road (the route prefers main roads).
    It writes the points (world X and Z in metres) and the edges between
    them as a C++ header, so the mod never reads game files while it runs.
    It stops with an error instead of writing a suspect table.

    v0.115: rebuilding takes about 15 s, so the header carries two stamps and
    the script stops early when they still match:
      - a quick one: the names, sizes and change times of the game's pack
        group 0008 files (no pack is opened);
      - if that changed (a game update touched the packs), a SHA-256 of the
        road file itself; when only the quick stamp changed, just the stamp
        line is rewritten.

Key terms:
    Node / point - a spot on a road. Edge - a straight piece of road
    between two points. Douglas-Peucker - a standard way to drop points
    from a line while keeping its shape within a tolerance.

Reads:  the game install (or --file, a copy of fielddefault.road)
Writes: src/pywel-atlas/road-graph.h (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B src/pywel-atlas/prepare_road_graph.py [--file PATH]
        (the research venv: reading the game packs needs its lz4 module)
"""
import argparse
import hashlib
import math
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "scripts"))
import extract_road_graph as decoder  # noqa: E402

OUTPUT = Path(__file__).resolve().parent / "road-graph.h"
TOLERANCE = 3.0  # Douglas-Peucker tolerance in metres.
MAIN_ROAD_DISTANCE = 8.0  # A node this close to a cart road is on a main road.
# Sanity limits: the route research run (2026-10-24) found 43,656 nodes and 45,808 edges.
MIN_NODES = 30000
MAX_POINTS = 60000
# v0.115: the stamp lines at the top of road-graph.h.
PACK_STAMP = "// stamp-pack: "
FILE_STAMP = "// stamp-file: "


def pack_stamp(path_override):
    """A quick fingerprint of the road file's source: the names, sizes and
    change times of the game's pack group 0008 files (or of --file)."""
    files = [Path(path_override)] if path_override else sorted((decoder.GAME / "0008").iterdir())
    listing = "|".join(f"{f.name}:{f.stat().st_size}:{f.stat().st_mtime_ns}" for f in files if f.is_file())
    return hashlib.sha256(listing.encode("utf-8")).hexdigest()


def read_stamps():
    """The stamps in the current road-graph.h, or (None, None)."""
    if not OUTPUT.exists():
        return None, None
    pack, file = None, None
    with OUTPUT.open(encoding="utf-8") as header:
        for _, line in zip(range(20), header):
            line = line.rstrip("\n")
            if line.startswith(PACK_STAMP):
                pack = line[len(PACK_STAMP):]
            elif line.startswith(FILE_STAMP):
                file = line[len(FILE_STAMP):]
    return pack, file


def load_types(data):
    """Decodes the road types and returns {name: (nodes, edges)}."""
    names = decoder.find_type_names(data)
    types = {}
    for index, (offset, name) in enumerate(names):
        if name not in ("worldmaproad", "wagon"):
            continue
        end = names[index + 1][0] if index + 1 < len(names) else len(data)
        start = decoder.find_node_section(data, offset, end)
        if start is None:
            raise SystemExit(f"No node list found for road type {name}; nothing written.")
        nodes, _ = decoder.read_nodes(data, start)
        edges, _ = decoder.build_edges(nodes)
        types[name] = (nodes, edges)
    if "worldmaproad" not in types or "wagon" not in types:
        raise SystemExit("The road file has no worldmaproad or wagon type; nothing written.")
    return types


def chains(node_count, edges):
    """Splits the network into stretches between kept nodes (degree != 2).
    Returns a list of node-id lists; each starts and ends at a kept node
    (or loops back to its start for a ring with no junction)."""
    neighbours = defaultdict(list)
    for a, b in edges:
        neighbours[a].append(b)
        neighbours[b].append(a)
    kept = {node for node in range(node_count) if len(neighbours[node]) != 2}
    used = set()
    result = []

    def walk(start, first):
        line = [start, first]
        used.add((min(start, first), max(start, first)))
        previous, current = start, first
        while current not in kept and current != start:
            following = [n for n in neighbours[current] if n != previous]
            if not following:
                break
            previous, current = current, following[0]
            used.add((min(previous, current), max(previous, current)))
            line.append(current)
        return line

    for start in sorted(kept):
        for first in neighbours[start]:
            if (min(start, first), max(start, first)) not in used:
                result.append(walk(start, first))
    # Rings without any junction: start anywhere on them.
    for a, b in edges:
        if (min(a, b), max(a, b)) not in used:
            kept.add(a)
            result.append(walk(a, b))
    return result


def simplify(points, tolerance):
    """Douglas-Peucker on a list of (x, z); returns the indices kept."""
    keep = {0, len(points) - 1}
    stack = [(0, len(points) - 1)]
    while stack:
        first, last = stack.pop()
        ax, az = points[first]
        bx, bz = points[last]
        length = math.hypot(bx - ax, bz - az)
        worst, worst_index = 0.0, None
        for index in range(first + 1, last):
            px, pz = points[index]
            if length < 1e-6:
                distance = math.hypot(px - ax, pz - az)
            else:
                distance = abs((bx - ax) * (az - pz) - (ax - px) * (bz - az)) / length
            if distance > worst:
                worst, worst_index = distance, index
        if worst_index is not None and worst > tolerance:
            keep.add(worst_index)
            stack.append((first, worst_index))
            stack.append((worst_index, last))
    return sorted(keep)


def main():
    """Decode, simplify, check and write road-graph.h."""
    parser = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    parser.add_argument("--file", help="a copy of fielddefault.road instead of the game install")
    arguments = parser.parse_args()
    # v0.115: nothing to do when the source is unchanged.
    quick = pack_stamp(arguments.file)
    old_pack, old_file = read_stamps()
    if quick == old_pack:
        print(f"{OUTPUT.name} is up to date (game packs unchanged); skipped.")
        return
    data = decoder.read_road_file(arguments.file)
    file_stamp = hashlib.sha256(data).hexdigest()
    if file_stamp == old_file:
        text = OUTPUT.read_text(encoding="utf-8").replace(PACK_STAMP + str(old_pack), PACK_STAMP + quick, 1)
        OUTPUT.write_text(text, encoding="utf-8")
        print(f"{OUTPUT.name} is up to date (road file unchanged); stamp refreshed.")
        return
    types = load_types(data)
    nodes, edges = types["worldmaproad"]
    wagon_nodes, _ = types["wagon"]
    if len(nodes) < MIN_NODES:
        raise SystemExit(f"Only {len(nodes)} road nodes decoded (expected over {MIN_NODES}); nothing written.")

    # Which world-map road nodes lie on a cart road (main road).
    grid = defaultdict(list)
    for node in wagon_nodes:
        grid[(int(node["x"] // 16), int(node["z"] // 16))].append(node)

    def on_main_road(node):
        cell = (int(node["x"] // 16), int(node["z"] // 16))
        return any(math.hypot(other["x"] - node["x"], other["z"] - node["z"]) <= MAIN_ROAD_DISTANCE
                   for dx in (-1, 0, 1) for dz in (-1, 0, 1) for other in grid.get((cell[0] + dx, cell[1] + dz), ()))

    main_node = [on_main_road(node) for node in nodes]

    # Simplify every stretch; points are shared where stretches meet.
    point_index = {}
    points = []
    out_edges = set()

    def point_for(node_id):
        if node_id not in point_index:
            point_index[node_id] = len(points)
            points.append((nodes[node_id]["x"], nodes[node_id]["z"]))
        return point_index[node_id]

    for line in chains(len(nodes), edges):
        coordinates = [(nodes[n]["x"], nodes[n]["z"]) for n in line]
        kept = simplify(coordinates, TOLERANCE)
        for first, last in zip(kept, kept[1:]):
            a = point_for(line[first])
            b = point_for(line[last])
            if a == b:
                continue
            stretch = line[first:last + 1]
            main = sum(main_node[n] for n in stretch) * 2 >= len(stretch)
            out_edges.add((min(a, b), max(a, b), 1 if main else 0))
    out_edges = sorted(out_edges)
    if not points or len(points) > MAX_POINTS:
        raise SystemExit(f"Unexpected point count {len(points)}; nothing written.")
    original = sum(decoder.horizontal(nodes[a], nodes[b]) for a, b in edges)
    simplified = sum(math.hypot(points[a][0] - points[b][0], points[a][1] - points[b][1]) for a, b, _ in out_edges)
    main_count = sum(main for _, _, main in out_edges)

    lines = [
        "// road-graph.h - the world map's road network for the route line.",
        "// Generated by src/pywel-atlas/prepare_road_graph.py from the game's",
        "// gamedata/road/rootlevel/main/fielddefault.road (\"worldmaproad\");",
        "// main roads from its \"wagon\" type. Do not edit by hand.",
        f"// {len(nodes)} road nodes simplified to {len(points)} points (Douglas-Peucker {TOLERANCE:g} m);",
        f"// {len(out_edges)} edges, {main_count} on main roads; road length {original / 1000:.1f} km,",
        f"// {simplified / 1000:.1f} km after simplifying.",
        PACK_STAMP + quick,
        FILE_STAMP + file_stamp,
        "#pragma once",
        "",
        f"constexpr unsigned kRoadPointCount = {len(points)};",
        f"constexpr unsigned kRoadEdgeCount = {len(out_edges)};",
        "",
        "// Road points: world X, world Z (metres).",
        "constexpr float kRoadPoints[kRoadPointCount][2] = {",
    ]
    lines += [f"    {{{x:.2f}f, {z:.2f}f}}," for x, z in points]
    lines += [
        "};",
        "",
        "// Edges: first point, second point, 1 = main road.",
        "constexpr unsigned kRoadEdges[kRoadEdgeCount][3] = {",
    ]
    lines += [f"    {{{a}, {b}, {main}}}," for a, b, main in out_edges]
    lines += ["};", ""]
    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUTPUT}: {len(points)} points, {len(out_edges)} edges ({main_count} main), "
          f"{original / 1000:.1f} km -> {simplified / 1000:.1f} km")


if __name__ == "__main__":
    main()
