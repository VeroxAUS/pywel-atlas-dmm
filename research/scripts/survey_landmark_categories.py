"""Survey the game's landmark object types and find the next collectible category.

What it does:
    1. Reads the game's list of "level gimmick" objects
       (levelgimmicksceneobjectinfo_misc, the same list classify_chest_gates.py
       reads) and counts the objects per landmark type key.
    2. Reads each object's position from the list itself: three floats right
       after the object's alias name (for example "Challenge_Standstone_
       Adventure_0001"), or, for objects without an alias, the floats that
       follow the empty name. This matches the level-file positions of the
       213 Abyss Nexuses exactly, so no level files are needed.
    3. Pairs chosen landmark types one to one with MapGenie categories, closest
       pairs first, within 80 m (MapGenie is used to name and count, never as
       the position).
    4. Writes the full Abyss Cresset table (both landmark types, positions,
       UUIDs, challenge mission keys, MapGenie ids).

Key terms:
    landmark type - the row key in levelgimmicksceneobjectinfo; the save's
        Bells' list stores it as _levelGimmickSceneObjectInfoKey.
    alias name - the object's own name inside the landmark list entry.

Reads:  research/vendor/work/levelgimmicksceneobjectinfo{.staticinfoheader,
        .staticinfobody,_misc.base.staticinfomisc}, research/vendor/work/
        staticinfo/missioninfo.*, data/poi-data.js
Writes: research/analysis/abyss-cresset-survey.json (overwritten)
Run:    python -B survey_landmark_categories.py <repository root>
"""
import json
import re
import statistics
import struct
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(sys.argv[1] if len(sys.argv) > 1 else ".")
WORK = ROOT / "research" / "vendor" / "work"
PAIR_DISTANCE = 80.0
PUZZLE_STANDSTONE = 1000004  # "Puzzle_StandStone": puzzle cressets.
ADVENTURE_STANDSTONE = 1000103  # "Adventure_StandStone": stand-here cressets.


def load_table(path_stem, count_size):
    """Return {row key: row bytes} for one header/body table pair."""
    header = Path(str(path_stem) + ".staticinfoheader").read_bytes()
    body = Path(str(path_stem) + ".staticinfobody").read_bytes()
    count = int.from_bytes(header[:count_size], "little")
    key_size = (len(header) - count_size - 4 * count) // count
    rows = []
    position = count_size
    for _ in range(count):
        key = int.from_bytes(header[position:position + key_size], "little")
        offset = struct.unpack_from("<I", header, position + key_size)[0]
        rows.append((key, offset))
        position += key_size + 4
    # A row ends where the next one starts.
    ends = sorted(offset for _, offset in rows) + [len(body)]
    following = {ends[i]: ends[i + 1] for i in range(len(ends) - 1)}
    return {key: body[offset:following[offset]] for key, offset in rows}


def row_name(row):
    """Rows start with the key, then a length-prefixed name."""
    length = struct.unpack_from("<I", row, 4)[0] if len(row) >= 8 else 0
    return row[8:8 + length].decode("ascii", "replace") if 0 < length < 200 else None


def plausible(position):
    """A world position: no huge values, and not at the map origin."""
    return all(abs(v) < 30000 for v in position) and (abs(position[0]) > 50 or abs(position[2]) > 50)


def landmark_objects():
    """Return every landmark object: type, level, chain, UUID, alias, position."""
    data = (WORK / "levelgimmicksceneobjectinfo_misc.base.staticinfomisc").read_bytes()
    objects = []
    # Same anchor as classify_chest_gates.gimmick_objects(): the parent chain
    # ends in "rootlevel"; the level name is preceded by the type key.
    for match in re.finditer(rb"\x09\x00\x00\x00rootlevel", data):
        chain_end = match.end()
        for back in range(30, 600):
            start = chain_end - back
            length = struct.unpack_from("<I", data, start)[0]
            if not 3 < length < 120:
                continue
            level = data[start + 4:start + 4 + length]
            if not all(48 <= byte < 123 for byte in level):
                continue
            position = start + 4 + length
            count = struct.unpack_from("<I", data, position)[0]
            position += 4
            if not 1 <= count < 12:
                continue
            chain = []
            for _ in range(count):
                if position + 4 > chain_end:
                    break
                size = struct.unpack_from("<I", data, position)[0]
                chain.append(data[position + 4:position + 4 + size].decode("ascii", "replace"))
                position += 4 + size
            if position != chain_end or chain[-1] != "rootlevel":
                continue
            uuid = list(struct.unpack_from("<3I", data, chain_end + 8))
            alias, world = find_alias_position(data, chain_end + 24)
            objects.append({
                "type": struct.unpack_from("<I", data, start - 20)[0],
                "level": level.decode(),
                "chain": chain,
                "uuid": uuid,
                "alias": alias,
                "position": world,
            })
            break
    return objects


def find_alias_position(data, base):
    """Find the alias name after the UUID and the three floats that follow it."""
    for offset in range(base, base + 80):
        length = struct.unpack_from("<I", data, offset)[0]
        if 3 < length < 80 and re.fullmatch(rb"[A-Za-z0-9_]+", data[offset + 4:offset + 4 + length]):
            floats = struct.unpack_from("<3f", data, offset + 4 + length)
            if plausible(floats):
                return data[offset + 4:offset + 4 + length].decode(), [round(v, 2) for v in floats]
    # No alias: the position follows the empty name (seen for Constellations).
    floats = struct.unpack_from("<3f", data, base + 24)
    return None, [round(v, 2) for v in floats] if plausible(floats) else None


def mapgenie_points():
    """MapGenie points with approximate game x/z on their own map."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    points = []
    for point in data["locations"]:
        if point.get("world") == "Abyss":
            x = (point["mapLng"] + 0.9704511) / 3.1054142e-5
            z = (point["mapLat"] - 0.7620569) / 3.1054118e-5
        else:
            x = (point["mapLng"] + 0.40246) / 4.1456e-5
            z = (point["mapLat"] - 0.77890) / 4.1373e-5
        points.append(dict(point, x=x, z=z))
    return points


def in_abyss(item):
    """Abyss-layer objects sit high up or under the "Abyss" level group."""
    return item["position"][1] > 1500 or any(name.lower() == "abyss" for name in item["chain"])


def pair(objects, points):
    """Pair objects and points one to one, closest first, within PAIR_DISTANCE."""
    candidates = []
    for i, item in enumerate(objects):
        for j, point in enumerate(points):
            if (point.get("world") == "Abyss") != in_abyss(item):
                continue
            distance = ((point["x"] - item["position"][0]) ** 2 + (point["z"] - item["position"][2]) ** 2) ** 0.5
            if distance <= PAIR_DISTANCE:
                candidates.append((distance, i, j))
    used_objects, used_points, pairs = set(), set(), []
    for distance, i, j in sorted(candidates):
        if i not in used_objects and j not in used_points:
            used_objects.add(i)
            used_points.add(j)
            pairs.append((distance, objects[i], points[j]))
    return pairs


def main():
    """Print per-type counts and pairings, then write the Abyss Cresset table."""
    names = {key: row_name(row) for key, row in
             load_table(WORK / "levelgimmicksceneobjectinfo", 4).items()}
    objects = [item for item in landmark_objects() if item["position"]]
    counts = Counter(item["type"] for item in objects)
    for key in sorted(names):
        print(key, names[key], counts.get(key, 0))

    points = mapgenie_points()
    checks = [({PUZZLE_STANDSTONE, ADVENTURE_STANDSTONE}, "Abyss Cresset"),
              ({1000005}, "Constellation"), ({1000002}, "Sealed Abyss Artifact")]
    for types, category in checks:
        chosen = [item for item in objects if item["type"] in types]
        wanted = [point for point in points if point["category"] == category]
        pairs = pair(chosen, wanted)
        distances = [distance for distance, _, _ in pairs]
        print(f"{category}: {len(chosen)} objects, {len(wanted)} points, {len(pairs)} paired, "
              f"median {statistics.median(distances):.1f} m, max {max(distances):.1f} m")

    # Challenge mission per cresset, by the game's own naming.
    missions = {}
    for key, row in load_table(WORK / "staticinfo" / "missioninfo", 2).items():
        name = row_name(row)
        if name:
            missions[name.lower()] = key
    cressets = [item for item in objects if item["type"] in (PUZZLE_STANDSTONE, ADVENTURE_STANDSTONE)]
    rows = []
    for distance, item, point in pair(cressets, [p for p in points if p["category"] == "Abyss Cresset"]):
        alias = item["alias"]
        if item["type"] == ADVENTURE_STANDSTONE:
            mission = "challenge_standstone_adventure_" + alias[-4:]
        else:
            mission = "challenge_standstone_puzzle_" + alias[len("Puzzle_"):].lower()
        if mission not in missions and alias.startswith("Puzzle_Maze_"):
            # The maze cressets' missions are named Maze_0001_Burhum and so on.
            maze = "maze_" + alias[-4:]
            mission = next((name for name in sorted(missions) if name == maze or name.startswith(maze + "_")),
                           mission)
        rows.append({
            "kind": "adventure" if item["type"] == ADVENTURE_STANDSTONE else "puzzle",
            "landmarkType": item["type"], "alias": alias, "level": item["level"],
            "uuid": item["uuid"], "gamePosition": item["position"],
            "missionName": mission, "missionKey": missions.get(mission),
            "mapGenieId": point["id"], "mapGenieName": point["name"],
            "region": point.get("region"), "mapGenieDistance": round(distance, 1),
        })
    rows.sort(key=lambda row: (row["kind"], row["alias"]))
    output = ROOT / "research" / "analysis" / "abyss-cresset-survey.json"
    output.write_text(json.dumps({"cressets": rows}, indent=1) + "\n", encoding="utf-8")
    print(f"{len(rows)} cressets written to {output}")


if __name__ == "__main__":
    main()
