"""Survey the Legendary Animals for the map markers (0.29.0).

What it does:
    Each Legendary Animal is a challenge mission (Mission_Legendanimal_*,
    quests Challenge_LegendAnimal and Challenge_LegendAnimal_II). 23 of the
    24 roam along a patrol network the game keeps as a sequencer path file,
    sequencer/pathbinary__/stageseq/contents/legendanimal/
    cd_seq_contents_legendanimal_<animal>_0100.paschedulepath (pack 0014).
    A path file holds runs of "count, then count x (X, Y, Z) floats"; each
    run is one stretch of the network. This script reads every run, drops
    repeated stretches, folds the runs into one network (repeated laps
    become one line, near joins close), leaves out short side stubs and
    small loops (see drawn_lines), thins each line (Douglas-Peucker)
    to at most MAX_POINTS points per animal, and
    takes the marker position as the middle of all points. Black Lion has
    no path file (it is part of the House Celeste quest "Dark Catastrophe");
    its marker uses the position of its hunt step in a completed save.

    Names: the English names players and MapGenie use (data/poi-data.js,
    "Legendary Animal"), matched by the nearest MapGenie point; the two
    animals MapGenie lacks keep a name made from the mission name.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert (pack group 0014, read-only)
        data/poi-data.js (MapGenie export, for names and regions)
Writes: data/legendary-animal-links.json (overwritten)
Run:    python -B research/scripts/survey_legendary_animals.py
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
sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
PATH_FOLDER = "sequencer/pathbinary__/stageseq/contents/legendanimal"
# Most points kept per animal (the mod's table and its canvas drawing).
MAX_POINTS = 512
# Points of the same stretch are at most this far apart (metres); a run with
# a longer step is not a path.
MAX_STEP = 200.0
# The drawn lines (see drawn_lines): runs are walked in STEP metre steps,
# points within SNAP metres become one node of a network, and stubs and
# small loops shorter than STUB_SHARE of the animal's area (at least
# STUB_MIN metres) are left out (the path files have many short side trips;
# drawn, they only clutter the map). All points still count for the marker
# position and the roam distance.
# Each drawn line is then smoothed over SMOOTH steps either side (this
# irons out the zigzags where laps cross) and thinned to within
# TOLERANCE_SHARE of the area (at least 0.5 m).
STEP = 1.0
SNAP = 2.0
STUB_SHARE = 0.18
STUB_MIN = 4.0
SMOOTH = 3
TOLERANCE_SHARE = 0.012
# MapGenie points further than this from a path's middle are not a match.
MATCH_DISTANCE = 120.0

# The 24 missions (key, internal name), with the path file each one uses
# (None = no path) and the name for animals MapGenie does not list.
ANIMALS = [
    (1001214, "Mission_Legendanimal_Whitehorse", "whitehorse_0100", None),
    (1001229, "Mission_Legendanimal_Blackhorse", "blackhorse_0100", None),
    (1001468, "Mission_Legendanimal_Redhorse", "redhorse_0100", None),
    (1001474, "Mission_Legendanimal_GoldenTench", "goldentench_0100", None),
    (1001480, "Mission_Legendanimal_GoldenCarp", "goldencarp_0100", None),
    (1001486, "Mission_Legendanimal_Coelacanth", "coelacanth_0100", None),
    (1001487, "Mission_Legendanimal_Golden_Coelacanth", "goldencoelacanth_0100", None),
    (1002197, "Mission_Legendanimal_Marni_MachineFish", "machinefish_0100", None),
    (1001489, "Mission_Legendanimal_SilverFangs", "silverfangswolf_0100", None),
    (1001490, "Mission_Legendanimal_Whitebear", "whitebearwild_0100", None),
    (1001491, "Mission_Legendanimal_WhiteCrocodile", "whitecrocodile_0100", None),
    (1001492, "Mission_Legendanimal_PureWhiteBion", "purewhitebion_0100", None),
    (1001493, "Mission_Legendanimal_Giantbull", "giantbull_0100", None),
    (1001494, "Mission_Legendanimal_Whitestag", "whitestag_0100", None),
    (1001495, "Mission_Legendanimal_Whitemoose", "whitemoose_0100", None),
    (1001496, "Mission_Legendanimal_Purewhitedeer", "purewhitedeer_0100", None),
    (1001497, "Mission_Legendanimal_Vineddeer", "vineddeer_0100", None),
    (1001498, "Mission_Legendanimal_Redriverpig", "redriverpig_0100", None),
    (1001499, "Mission_Legendanimal_Whitelion", "whitelion_0100", None),
    (1002243, "Mission_Legendanimal_Blacklion", None, "Black Lion"),
    (1001501, "Mission_Legendanimal_Tiger", "tigerwild_0100", None),
    (1001502, "Mission_Legendanimal_Phoenix", "phoenix_0100", None),
    (1003957, "Mission_Legendanimal_Macaw_Parrot", "macaw_parrot_0100", "Macaw Parrot"),
    (1003958, "Mission_Legendanimal_Machine_Eagle", "machine_eagle_0101", "Machine Eagle"),
]
# Black Lion's hunt step (Mission_Friendly_Legendary_Black_Lion_0) map
# position in a completed save, and its region.
BLACK_LION_POSITION = [-7384.31, 650.04, -1662.0]
BLACK_LION_REGION = "Demeniss"
# MapGenie names the nearest-point match cannot give: the White Horse's
# nearest MapGenie point is the Golden Carp's, and the Phoenix flies a wide
# loop whose middle is 238 m from its MapGenie point.
NAME_OVERRIDES = {"whitehorse_0100": "Legendary Horse: Royler", "phoenix_0100": "Phoenix"}


def plausible(x, y, z):
    """True for a point inside the game world (metres)."""
    return -16000 < x < 4000 and 0 < y < 2500 and -10000 < z < 8000 and abs(x) > 100


def read_runs(data):
    """Every "count, count x (X, Y, Z)" run in a path file, in file order."""
    runs = []
    offset = 0
    while offset + 4 <= len(data):
        count = struct.unpack_from("<I", data, offset)[0]
        if 2 <= count <= 5000 and offset + 4 + 12 * count <= len(data):
            points = [struct.unpack_from("<fff", data, offset + 4 + 12 * i) for i in range(count)]
            if all(plausible(*p) for p in points) and all(
                    math.dist(points[i], points[i + 1]) < MAX_STEP for i in range(count - 1)):
                runs.append(points)
                offset += 4 + 12 * count
                continue
        offset += 1
    return runs


def unique_runs(runs):
    """The runs without repeats (the same stretch in either direction)."""
    seen = {}
    for run in runs:
        key = tuple((round(p[0]), round(p[2])) for p in run)
        seen.setdefault(min(key, key[::-1]), run)
    return list(seen.values())


def resample(run):
    """A run's ground points (X, Z), with extra points so none are more than STEP metres apart."""
    points = [(p[0], p[2]) for p in run]
    out = [points[0]]
    for a, b in zip(points, points[1:]):
        steps = max(1, int(math.dist(a, b) / STEP))
        out.extend((a[0] + (b[0] - a[0]) * k / steps, a[1] + (b[1] - a[1]) * k / steps) for k in range(1, steps + 1))
    return out


def network(runs):
    """The runs as one network: points within SNAP metres become one node.

    Returns (node positions, neighbours of each node). Repeated laps that
    differ by a metre or two fold into one line, and runs that nearly meet
    are joined.
    """
    sums = []
    grid = defaultdict(list)
    neighbours = defaultdict(set)

    def node_at(point):
        cell = (math.floor(point[0] / SNAP), math.floor(point[1] / SNAP))
        best, best_distance = None, SNAP
        for dx in (-1, 0, 1):
            for dz in (-1, 0, 1):
                for node in grid[(cell[0] + dx, cell[1] + dz)]:
                    distance = math.dist(grid_points[node], point)
                    if distance < best_distance:
                        best, best_distance = node, distance
        if best is None:
            best = len(grid_points)
            grid_points.append(point)
            sums.append([point[0], point[1], 1])
            grid[cell].append(best)
        else:
            sums[best][0] += point[0]
            sums[best][1] += point[1]
            sums[best][2] += 1
        return best

    grid_points = []
    for run in runs:
        previous = None
        for point in resample(run):
            node = node_at(point)
            if previous is not None and node != previous:
                neighbours[node].add(previous)
                neighbours[previous].add(node)
            previous = node
    return [(x / n, z / n) for x, z, n in sums], neighbours


def unlink(neighbours, nodes):
    """Removes the links along `nodes` and any node left with no links."""
    for a, b in zip(nodes, nodes[1:]):
        neighbours[a].discard(b)
        neighbours[b].discard(a)
    for node in nodes:
        if node in neighbours and not neighbours[node]:
            del neighbours[node]


def stretches(neighbours):
    """The network's stretches: node lists between ends or forks (a closed loop is one stretch)."""
    seen = set()
    found = []

    def walk(a, b):
        nodes = [a, b]
        seen.add(frozenset((a, b)))
        while len(neighbours[b]) == 2:
            following = next(n for n in neighbours[b] if n != a)
            if frozenset((b, following)) in seen:
                break
            seen.add(frozenset((b, following)))
            a, b = b, following
            nodes.append(b)
        return nodes

    for start in [n for n in neighbours if len(neighbours[n]) != 2] + list(neighbours):
        for following in list(neighbours[start]):
            if frozenset((start, following)) not in seen:
                found.append(walk(start, following))
    return found


def stretch_length(positions, nodes):
    """A stretch's length (metres)."""
    return sum(math.dist(positions[a], positions[b]) for a, b in zip(nodes, nodes[1:]))


def shortest_way(positions, neighbours, start, end, limit):
    """The shortest way from `start` to `end` through the network (metres), or None past `limit`."""
    best = {start: 0.0}
    queue = [(0.0, start)]
    while queue:
        distance, node = heapq.heappop(queue)
        if node == end:
            return distance
        if distance > limit:
            return None
        for following in neighbours[node]:
            total = distance + math.dist(positions[node], positions[following])
            if total < best.get(following, math.inf):
                best[following] = total
                heapq.heappush(queue, (total, following))
    return None


def tidy(positions, neighbours, limit):
    """Drops stubs and small loops shorter than `limit` metres.

    A stub is a stretch from a loose end to a fork; a small loop is a short
    stretch between two forks that another way of under 2 x `limit` also
    joins. Repeats until nothing changes.
    """
    changed = True
    while changed:
        changed = False
        for nodes in sorted(stretches(neighbours), key=lambda nodes: stretch_length(positions, nodes)):
            if stretch_length(positions, nodes) >= limit:
                break
            first, last = nodes[0], nodes[-1]
            loose = len(neighbours[first]) == 1 or len(neighbours[last]) == 1
            forked = len(neighbours[first]) >= 3 or len(neighbours[last]) >= 3
            if loose and forked:
                unlink(neighbours, nodes)
                changed = True
                break
            if not loose and first != last:
                unlink(neighbours, nodes)
                if shortest_way(positions, neighbours, first, last, 2 * limit) is not None:
                    changed = True
                    break
                for a, b in zip(nodes, nodes[1:]):
                    neighbours[a].add(b)
                    neighbours[b].add(a)


def smooth(line):
    """`line` (X, Z points) walked in STEP metre steps and averaged over SMOOTH steps either side.

    The ends stay where they are, so lines still meet at their forks.
    """
    points = resample([(x, 0.0, z) for x, z in line])
    smoothed = [points[0]]
    for index in range(1, len(points) - 1):
        reach = min(SMOOTH, index, len(points) - 1 - index)
        near = points[index - reach:index + reach + 1]
        smoothed.append((sum(p[0] for p in near) / len(near), sum(p[1] for p in near) / len(near)))
    if len(points) > 1:
        smoothed.append(points[-1])
    return smoothed


def area_size(points):
    """The larger side of the box around `points` (X, Z; metres)."""
    xs = [p[0] for p in points]
    zs = [p[1] for p in points]
    return max(max(xs) - min(xs), max(zs) - min(zs))


def drawn_lines(runs):
    """The lines to draw for an animal's runs (X, Z points), stubs and small loops left out, smoothed."""
    positions, neighbours = network(runs)
    tidy(positions, neighbours, max(STUB_MIN, STUB_SHARE * area_size(positions)))
    return [smooth([positions[node] for node in nodes]) for nodes in stretches(neighbours)]


def simplify(line, tolerance):
    """Douglas-Peucker: the fewest points within `tolerance` metres of the line."""
    if len(line) <= 2:
        return list(line)
    (ax, az), (bx, bz) = line[0], line[-1]
    length = math.hypot(bx - ax, bz - az)
    worst, worst_index = -1.0, 0
    for index in range(1, len(line) - 1):
        px, pz = line[index]
        if length < 1e-6:
            distance = math.hypot(px - ax, pz - az)
        else:
            distance = abs((bx - ax) * (az - pz) - (ax - px) * (bz - az)) / length
        if distance > worst:
            worst, worst_index = distance, index
    if worst <= tolerance:
        return [line[0], line[-1]]
    left = simplify(line[:worst_index + 1], tolerance)
    return left[:-1] + simplify(line[worst_index:], tolerance)


def thin(lines):
    """Each line simplified, the tolerance raised until all fit MAX_POINTS."""
    tolerance = max(0.5, TOLERANCE_SHARE * area_size([p for line in lines for p in line]))
    while True:
        thinned = [simplify(line, tolerance) for line in lines]
        if sum(len(line) for line in thinned) <= MAX_POINTS:
            return thinned, tolerance
        tolerance *= 1.25


def mapgenie_animals():
    """MapGenie's Legendary Animal points: (name, game X, game Z, region)."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    return [(p["name"], (p["mapLng"] + 0.40246) / 4.1456e-5, (p["mapLat"] - 0.77890) / 4.1373e-5, p["region"])
            for p in data["locations"] if p["category"] == "Legendary Animal"]


def survey(get_file):
    """The data file's contents; `get_file(path)` returns a pack file's bytes."""
    mapgenie = mapgenie_animals()
    locations = []
    for key, mission, path, own_name in ANIMALS:
        entry = {"missionKey": key, "mission": mission}
        if path is None:
            entry.update(name=own_name, gamePosition=BLACK_LION_POSITION, region=BLACK_LION_REGION,
                         roam=0, pathFile=None, pathTolerance=None, paths=[])
            locations.append(entry)
            continue
        file_name = f"cd_seq_contents_legendanimal_{path}.paschedulepath"
        runs = unique_runs(read_runs(get_file(f"{PATH_FOLDER}/{file_name}")))
        if not runs:
            raise ValueError(f"No path runs in {file_name}")
        points = [p for run in runs for p in run]
        cx = sum(p[0] for p in points) / len(points)
        cy = sum(p[1] for p in points) / len(points)
        cz = sum(p[2] for p in points) / len(points)
        roam = max(math.hypot(p[0] - cx, p[2] - cz) for p in points)
        lines, tolerance = thin(drawn_lines(runs))
        near = min(mapgenie, key=lambda m: math.hypot(m[1] - cx, m[2] - cz))
        distance = math.hypot(near[1] - cx, near[2] - cz)
        name = NAME_OVERRIDES.get(path) or (near[0] if distance <= MATCH_DISTANCE and not own_name else own_name)
        if not name:
            raise ValueError(f"No name for {mission}")
        entry.update(
            name=name.replace("\u2019", "'"),
            gamePosition=[round(cx, 2), round(cy, 2), round(cz, 2)],
            region=near[3] if distance <= MATCH_DISTANCE else None,
            mapGenieDistance=round(distance, 1),
            roam=round(roam),
            pathFile=f"{PATH_FOLDER}/{file_name}",
            pathPoints=len(points),
            pathTolerance=round(tolerance, 2),
            paths=[[[round(x, 1), round(z, 1)] for x, z in line] for line in lines],
        )
        locations.append(entry)
    return {
        "version": 1,
        "category": "Legendary Animal (Challenge_LegendAnimal, Challenge_LegendAnimal_II)",
        "doneRule": "QuestSaveData._missionStateList record for missionKey with _state 5; a record at another "
                    "state = not done; no record = unknown",
        "nativeIcon": {
            "type": 407,
            "templateType": 29131,
            "templateName": "MapIcon_TestGimmick9",
            "category": "0xffffffff",
            "note": "the game's unused test icon; the UI add-on 0.11.0 gives it the game's Animals knowledge "
                    "category picture (a lion head) on a dark disc",
        },
        "paths": "X, Z pairs in metres; each list is one line of the animal's patrol network",
        "locations": locations,
    }


def dump(mapping):
    """The data file's text: indented, with each [X, Z] point on one line."""
    text = json.dumps(mapping, indent=2) + "\n"
    return re.sub(r"\[\s+(-?[0-9.]+),\s+(-?[0-9.]+)\s+\]", r"[\1, \2]", text)


def main():
    """Reads pack 0014 of the installed game and writes the data file."""
    from pycrimson._context import PackageContext
    context = PackageContext(GAME, pack_group_whitelist=["0014"])
    mapping = survey(context.get_file)
    out = ROOT / "data" / "legendary-animal-links.json"
    out.write_text(dump(mapping), encoding="utf-8")
    for entry in mapping["locations"]:
        print(f"{entry['name']:40} {entry['missionKey']} roam {entry['roam']:>4} m "
              f"{sum(len(line) for line in entry['paths']):>4} points in {len(entry['paths'])} lines")


if __name__ == "__main__":
    main()
