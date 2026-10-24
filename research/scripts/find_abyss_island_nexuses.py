"""Survey the Abyss-island Nexuses: where they are and what the save records.

What it does:
    1. Takes every object of the three landmark types for Nexuses that are not
       on the surface (from the game's landmark table, levelgimmicksceneobjectinfo,
       via classify_chest_gates.py):
         1000008 "AbyssRuins_AbyssIsland"        44, levels AbyssIsland_<n>_Phase00_00
         1000114 "AbyssRuins_AbyssIsland_Quest"   7, levels AbyssIslandCore_<n>_Phase00_00
         1000053 "AbyssRuins_Housing"             2, levels KliffHouse_Useartifact_<n>_...
       The surface Nexuses (1000001, 213) are done already (export_nexus_links.py).
    2. Finds the same object in its level file (read-only, from the game's
       packages) and takes its world position from there. The table's own
       position field is garbage for most of these, as for the surface Nexuses.
       A level whose file is missing, or that does not hold the object, is
       reported, not guessed.
    3. Pairs each Nexus with a MapGenie "Abyss Nexus" point, one to one, closest
       first. Island and quest Nexuses pair with the Abyss map; the two housing
       Nexuses pair with surface points that no surface Nexus has taken (the
       surface map has 215 points for 213 surface Nexuses). The MapGenie point is
       only used to pair and name, never as the position.
    4. Reads save copies (never the game's save folder) and lists, per save,
       which island Nexuses are discovered (Bells' list record) and which have a
       field-object record (the surface Nexus "activated" sign).

Key terms:
    Bells' list - DiscoveredLevelGimmickSceneObjectSaveData: one record per
        discovered map landmark, keyed by landmark type and scene-object UUID.
    field-object record - an entry of FieldSaveData._fieldGimmickSaveDataList.
        For a surface Nexus, the record for its UUID with reason 1, reset
        "never" and state 353047760 means "activated".
    island Nexus gimmick - abyssruins_useartifact_04 (1008572) or its desert
        variant _04_desert (1008610); housing ones use _01_attach (1007470).

Reads:  the landmark table in research/vendor/work/ (via classify_chest_gates.py),
        the game's level files (pack group 0015, read-only), data/poi-data.js,
        data/abyss-nexus-links.json (which surface points are taken),
        save copies in research/vendor/work/sealed-artifact-survey/ and
        sealed-artifact-test/ (or paths given on the command line)
Writes: research/analysis/abyss-island-nexus-survey.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_abyss_island_nexuses.py [A.save ...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "scripts"))

import classify_chest_gates as gates  # noqa: E402
import compare_chest_saves as saves  # noqa: E402
import find_treasure_chests as levels  # noqa: E402

# Landmark type key -> short kind name used in the output.
KINDS = {1000008: "island", 1000114: "quest", 1000053: "housing"}
EXPECTED = {1000008: 44, 1000114: 7, 1000053: 2}
# Gimmick keys of the Nexus object itself (abyssruins_useartifact_04,
# _04_desert, _01_attach). Their "_part" child has UUID fourth word 1.
NEXUS_GIMMICKS = {1008572, 1008610, 1007470}
ACTIVATED_STATE = 353047760  # Same "opened" state as strongboxes and surface Nexuses.
RESET_NEVER = 0xFFFFFFFFFFFFFFFF
MAPGENIE_CATEGORY = "Abyss Nexus"
PAIR_DISTANCE = 80.0
SAVE_FOLDERS = [ROOT / "research" / "vendor" / "work" / name
                for name in ("sealed-artifact-survey", "sealed-artifact-test")]
# The game's own Abyss-island Nexus icons, seen in the v0.83 map trace
# (research/traces/pywel-atlas-v0.83-nexus-hide-show-map.log, icon catalogue):
# type 235 (template MapIcon_Abyss_Ruins, category 0x21) and its fog version
# 335 (MapIcon_Abyss_Ruins_Fog, category 0x23). Used here only as a cross-check
# of the level positions.
NATIVE_SIGHTINGS = [
    {"type": 235, "xyz": [-10665.498, 1794.694, -3700.333]},
    {"type": 335, "xyz": [-10243.889, 1832.406, -4039.178]},
]


def abyss_mapgenie_to_game(lat, lng):
    """Convert a MapGenie Abyss-map point to game (x, z) (fit in classify_chest_gates.py)."""
    x = (lng + gates.ABYSS_LNG_OFFSET) / gates.ABYSS_LNG_SCALE
    z = (lat + gates.ABYSS_LAT_OFFSET) / gates.ABYSS_LAT_SCALE
    return x, z


def mapgenie_points():
    """MapGenie Abyss Nexus points as dicts with game x/z, split into Abyss and surface."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    abyss, surface = [], []
    for point in data["locations"]:
        if point.get("category") != MAPGENIE_CATEGORY:
            continue
        is_abyss = (point.get("world") or "").lower() == "abyss"
        convert = abyss_mapgenie_to_game if is_abyss else levels.mapgenie_to_game
        x, z = convert(point["mapLat"], point["mapLng"])
        # The description often says how to reach the Nexus; keep its first line.
        note = (point.get("description") or "").strip().splitlines()
        row = {"id": point["id"], "x": x, "z": z, "note": note[0][:160] if note else ""}
        (abyss if is_abyss else surface).append(row)
    return abyss, surface


def level_objects(context, level):
    """Return {first three UUID words: (object, world position)} for one level, or None if missing."""
    try:
        data = context.get_file(f"leveldata/bin__/rootlevel/{level.lower()}.palevel")
    except Exception:
        return None
    if not data:
        return None
    objects = {}

    def walk(item, parent):
        """Record this object (fourth UUID word 0 only) with its world position, then its children."""
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = levels.rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), levels.multiply(parent[1], rotation))
        uuid = item.get("_sceneObjectUuid")
        if uuid and len(uuid) == 4 and uuid[3] == 0 and world:
            objects[tuple(uuid[:3])] = (item, world[0])
        for child in item.get("_childSceneObjects") or []:
            walk(child, world)

    for item in levels.parse_level(data):
        if isinstance(item, dict):
            walk(item, None)
    return objects


def find_nexuses():
    """Build one row per Nexus from the landmark table and its level file."""
    table = [item for item in gates.gimmick_objects() if item["type"] in KINDS]
    for key, count in EXPECTED.items():
        found = sum(1 for item in table if item["type"] == key)
        if found != count:
            raise ValueError(f"Expected {count} objects of type {key}, found {found}")
    context = levels.PackageContext(levels.GAME, pack_group_whitelist=["0015"])

    rows = []
    cache = {}
    for item in sorted(table, key=lambda entry: entry["level"].lower()):
        row = {
            "kind": KINDS[item["type"]],
            "typeKey": item["type"],
            "gimmickKey": item["gimmickKey"],
            "level": item["level"],
            "group": item["chain"][0],
            "uuid": item["uuid"] + [0],
            "gamePosition": None,
            "positionSource": None,
        }
        # Try the object's own level first, then its parent (for "_sub_" levels).
        for level in (item["level"], item["chain"][0]):
            if level not in cache:
                cache[level] = level_objects(context, level)
            objects = cache[level]
            if objects and tuple(item["uuid"]) in objects:
                placed, world = objects[tuple(item["uuid"])]
                row["gamePosition"] = [round(value, 4) for value in world]
                row["positionSource"] = f"level file {level.lower()}"
                row["prefab"] = str(placed.get("__pycr_type__")).rsplit("/", 1)[-1]
                break
        # The table position is valid for some (for example the 7 quest Nexuses);
        # use it only when no level file holds the object, and say so.
        if row["gamePosition"] is None and all(abs(value) < 100000 for value in item["position"]):
            row["gamePosition"] = item["position"]
            row["positionSource"] = "landmark table (no level file held the object)"
        if row["gamePosition"] is not None and row.get("positionSource", "").startswith("level"):
            row["tablePositionMatches"] = math.dist(row["gamePosition"], item["position"]) < 0.5
        rows.append(row)
    if len({tuple(row["uuid"]) for row in rows}) != len(rows):
        raise ValueError("A Nexus UUID repeats")
    return rows


def pair(rows, points):
    """Pair rows with points one to one, closest first, within PAIR_DISTANCE."""
    pairs = sorted(
        (math.hypot(point["x"] - row["gamePosition"][0], point["z"] - row["gamePosition"][2]), r, p)
        for r, row in enumerate(rows) if row["gamePosition"]
        for p, point in enumerate(points))
    used_rows, used_points = set(), set()
    for distance, r, p in pairs:
        if r in used_rows or p in used_points or distance > PAIR_DISTANCE:
            continue
        used_rows.add(r)
        used_points.add(p)
        rows[r].update(mapGenieId=points[p]["id"], mapGenieDistance=round(distance, 1),
                       mapGenieNote=points[p]["note"])
    return [point for p, point in enumerate(points) if p not in used_points]


def pair_with_mapgenie(rows):
    """Pair island/quest Nexuses with the Abyss map, housing with spare surface points."""
    abyss, surface = mapgenie_points()
    links = json.loads((ROOT / "data" / "abyss-nexus-links.json").read_text(encoding="utf-8"))
    taken = {row["mapGenieId"] for row in links["locations"] if row.get("mapGenieId")}
    spare_surface = [point for point in surface if point["id"] not in taken]
    unpaired_abyss = pair([row for row in rows if row["kind"] != "housing"], abyss)
    unpaired_surface = pair([row for row in rows if row["kind"] == "housing"], spare_surface)
    return {
        "abyssPoints": len(abyss),
        "spareSurfacePoints": len(spare_surface),
        "unpairedAbyssPoints": [point["id"] for point in unpaired_abyss],
        "unpairedSurfacePoints": [point["id"] for point in unpaired_surface],
    }


def survey_save(path, rows):
    """Return what one save copy records for the island Nexuses."""
    objects = saves.load_save(path)
    by_uuid = {tuple(row["uuid"][:3]): row for row in rows}

    discovered = []
    for uuid, record in saves.landmark_records(objects).items():
        row = by_uuid.get(tuple(uuid[:3]))
        if row:
            flags = {key: value for key, value in record.items() if key.startswith("_is")}
            discovered.append({"level": row["level"], "infoKey": record.get("_levelGimmickSceneObjectInfoKey"),
                               "flags": flags})
    field = []
    for container in saves.top(objects, "FieldSaveData"):
        for record in container.get("_fieldGimmickSaveDataList") or []:
            origin = list(record.get("_levelOriginSceneObjectUuid") or [])
            row = by_uuid.get(tuple(origin[:3]))
            # Only the Nexus object itself (fourth word 0); its part (1) has its own records.
            if row and len(origin) == 4 and origin[3] == 0:
                field.append({
                    "level": row["level"],
                    "gimmickInfoKey": record.get("_gimmickInfoKey"),
                    "reason": record.get("_fieldSaveDataReason"),
                    "resetNever": record.get("_resetTimeSecondsOfDays") == RESET_NEVER,
                    "initStateNameHash": record.get("_initStateNameHash"),
                    "matchesActivatedRule": (record.get("_gimmickInfoKey") in NEXUS_GIMMICKS
                                             and record.get("_fieldSaveDataReason") == 1
                                             and record.get("_resetTimeSecondsOfDays") == RESET_NEVER
                                             and record.get("_initStateNameHash") == ACTIVATED_STATE),
                })
    return {"save": f"{path.parent.name}/{path.name}", "discovered": discovered, "fieldRecords": field}


def cross_check(rows):
    """Nearest Nexus to each of the game's own island Nexus icons seen in a trace."""
    checks = []
    for sighting in NATIVE_SIGHTINGS:
        placed = [row for row in rows if row["gamePosition"]]
        if not placed:
            break
        nearest = min(placed, key=lambda row: math.dist(row["gamePosition"], sighting["xyz"]))
        checks.append({**sighting, "nearestLevel": nearest["level"],
                       "metres": round(math.dist(nearest["gamePosition"], sighting["xyz"]), 2)})
    return checks


def main():
    """Find, pair and survey the island Nexuses, then write the analysis file."""
    rows = find_nexuses()
    pairing = pair_with_mapgenie(rows)
    paths = [Path(arg) for arg in sys.argv[1:]] or sorted(p for folder in SAVE_FOLDERS for p in folder.glob("*.save"))
    surveys = [survey_save(path, rows) for path in paths]
    checks = cross_check(rows)

    located = [row for row in rows if row["gamePosition"]]
    paired = [row for row in rows if row.get("mapGenieId")]
    distances = sorted(row["mapGenieDistance"] for row in paired)
    print(f"{len(rows)} island Nexuses, {len(located)} with a position, {len(paired)} paired with MapGenie "
          f"(median {distances[len(distances) // 2] if distances else None} m, "
          f"max {distances[-1] if distances else None} m)")
    for row in rows:
        if not row["gamePosition"] or not row.get("mapGenieId"):
            print("  not located/paired:", row["level"], row["positionSource"], row["gamePosition"])
    print("unpaired MapGenie points:", pairing["unpairedAbyssPoints"], pairing["unpairedSurfacePoints"])
    for check in checks:
        print("native icon", check["type"], "->", check["nearestLevel"], check["metres"], "m")
    for survey in surveys:
        print(survey["save"], "discovered", [d["level"] for d in survey["discovered"]],
              "activated", [f["level"] for f in survey["fieldRecords"] if f["matchesActivatedRule"]],
              "other field", [(f["level"], f["gimmickInfoKey"], f["initStateNameHash"])
                              for f in survey["fieldRecords"] if not f["matchesActivatedRule"]])

    output = {
        "summary": "Abyss-island Nexuses: landmark types 1000008 (AbyssRuins_AbyssIsland), 1000114 "
                   "(AbyssRuins_AbyssIsland_Quest) and 1000053 (AbyssRuins_Housing). Offline survey of the game "
                   "data and the user's save copies.",
        "nativeIcon": {
            "activated": {"type": 235, "templateType": 28866, "templateName": "MapIcon_Abyss_Ruins",
                          "category": "0x21"},
            "fog": {"type": 335, "templateType": 29057, "templateName": "MapIcon_Abyss_Ruins_Fog",
                    "category": "0x23"},
            "note": "From the icon catalogue in the v0.83 map trace: the game draws its own island Nexus with "
                    "type 235 (same world-map and minimap template as the surface Nexus icon 234, which the mod "
                    "already uses), and type 335 while it is only discovered. The landmark table gives these "
                    "types the textures Abyss_Ruins_Abyss (5500) and Abyss_Ruins_Fog_Abyss (5503).",
        },
        "candidateRule": {
            "discovered": "Bells' list record with the landmark type key (1000008/1000114/1000053) and the UUID, "
                          "no flags.",
            "activated": "FieldSaveData._fieldGimmickSaveDataList record for the UUID (fourth word 0) with the "
                         "Nexus gimmick (1008572, 1008610 or 1007470), reason 1, reset never and state 353047760: "
                         "the surface Nexus rule with the island gimmick.",
            "evidence": "In the user's saves AbyssIsland_0002 has both signs and AbyssIsland_0001 is discovered "
                        "only. A before/after save pair at one island Nexus would confirm that the field record "
                        "appears on activation.",
        },
        "mapGeniePairing": {**pairing, "paired": len(paired),
                            "medianMetres": distances[len(distances) // 2] if distances else None,
                            "maxMetres": distances[-1] if distances else None},
        "nativeIconCrossCheck": checks,
        "nexuses": rows,
        "saves": surveys,
    }
    target = ROOT / "research" / "analysis" / "abyss-island-nexus-survey.json"
    target.write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {target.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
