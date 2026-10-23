"""Survey the 141 Sealed Abyss Artifacts: where they are and what the save records.

What it does:
    1. Takes every object of landmark type 1000002 ("challenge_sealed_artifact")
       from the game's landmark table (levelgimmicksceneobjectinfo, via
       classify_chest_gates.py) and finds the same object in its level file
       (Challenge_Sealed_Artifact_<Her|Dem|Del|Kwe|Dessert>). The level object
       gives the exact position and the item it spawns (Sealed_Abyss_Artifact_NNNN),
       and that item names its challenge mission (Challenge_SealedArtifact_...).
    2. Pairs each artifact with a MapGenie "Sealed Abyss Artifact" point, one to
       one, closest pairs first. The MapGenie point is only used to pair and
       name, never as the position.
    3. Reads save copies (never the game's save folder) and lists, per save,
       which artifacts have a field-object record, which artifact items are in
       the inventory, and the state of each artifact's two challenge missions.

Key terms:
    field-object record - an entry of FieldSaveData._fieldGimmickSaveDataList.
        The game writes one when a placed object changes; a picked-up artifact
        gets one that lists its own UUID as "disabled" (removed from the world).
    mission state - 2 = open, 5 = finished (as for other finished missions).

Reads:  the landmark table and static tables in research/vendor/work/,
        the game's level files (pack group 0015, read-only), data/poi-data.js,
        save copies in research/vendor/work/sealed-artifact-survey/ (or paths
        given on the command line)
Writes: research/analysis/sealed-artifact-survey.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_sealed_artifacts.py [A.save ...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "scripts"))

import classify_chest_gates as gates  # noqa: E402
import compare_chest_saves as saves  # noqa: E402
import find_treasure_chests as levels  # noqa: E402
from find_greymane_shrines import read_table  # noqa: E402

ARTIFACT_KEY = 1000002  # Landmark type "challenge_sealed_artifact".
ARTIFACT_GIMMICK = 1004255  # gimmick "item_sealed_artifact".
EXPECTED = 141
REGIONS = {"Her": "Hernand", "Dem": "Demeniss", "Del": "Delesyia", "Kwe": "Kweiden", "Dessert": "Crimson Desert"}
MAPGENIE_CATEGORY = "Sealed Abyss Artifact"
PAIR_DISTANCE = 80.0
SAVE_FOLDER = ROOT / "research" / "vendor" / "work" / "sealed-artifact-survey"


def named_entries(table, pattern):
    """Return {key: name} for table entries whose text holds a name matching pattern."""
    names = {}
    for key, entry in read_table(table):
        match = re.search(pattern + rb"\x00", entry)
        if match:
            names[key] = match.group(1).decode()
    return names


def level_objects(level):
    """Return {first three UUID words: (object, world position, is a child)} for one level.

    Children are included: a few artifacts sit inside a parent object, and their
    stored position is relative to it (rotated by the parent, then added).
    """
    context = level_objects.context
    data = context.get_file(f"leveldata/bin__/rootlevel/{level.lower()}.palevel")
    objects = {}

    def walk(item, parent):
        """Record this object with its world position, then its children."""
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
        if uuid and world:
            objects[tuple(uuid[:3])] = (item, world[0], parent is not None)
        for child in item.get("_childSceneObjects") or []:
            walk(child, world)

    for item in levels.parse_level(data):
        if isinstance(item, dict):
            walk(item, None)
    return objects


def mapgenie_points():
    """MapGenie Sealed Abyss Artifact points as dicts with game x/z added."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    points = []
    for point in data["locations"]:
        if point.get("category") == MAPGENIE_CATEGORY:
            x, z = levels.mapgenie_to_game(point["mapLat"], point["mapLng"])
            points.append({"id": point["id"], "name": point["name"], "region": point.get("region"), "x": x, "z": z})
    return points


def find_artifacts():
    """Build one row per artifact from the landmark table and level files."""
    table = [item for item in gates.gimmick_objects() if item["type"] == ARTIFACT_KEY]
    if len(table) != EXPECTED:
        raise ValueError(f"Expected {EXPECTED} sealed artifacts, found {len(table)}")

    item_names = named_entries("iteminfo", rb"(Sealed_Abyss_Artifact_\d+)")
    item_entries = dict(read_table("iteminfo"))
    mission_keys = {name: key for key, name in named_entries("missioninfo", rb"(Challenge_SealedArtifact_[A-Za-z_0-9]+)").items()}
    level_objects.context = levels.PackageContext(levels.GAME, pack_group_whitelist=["0015"])

    rows = []
    for level in sorted({item["level"] for item in table}):
        objects = level_objects(level)
        for item in (entry for entry in table if entry["level"] == level):
            if tuple(item["uuid"]) not in objects:
                raise ValueError(f"{level}: artifact {item['uuid']} missing from its level file")
            placed, world, inside_parent = objects[tuple(item["uuid"])]
            position = [round(value, 4) for value in world]
            # The table position is a cross-check only; it may be garbage (as for Nexuses).
            table_distance = math.dist(position, item["position"])
            spawned = [c["_itemKey"] for c in placed.get("_components") or [] if c.get("_itemKey")]
            if len(spawned) != 1 or spawned[0] not in item_names:
                raise ValueError(f"{level}: artifact {item['uuid']} spawns {spawned}, not one artifact item")
            # The item entry names its challenge; the mission table has it plus a "_0" step.
            # No trailing zero byte here: one item (0105) has other bytes after the name.
            challenge = re.search(rb"(Challenge_SealedArtifact_[A-Za-z_0-9]+)", item_entries[spawned[0]]).group(1).decode()
            rows.append({
                "itemName": item_names[spawned[0]],
                "itemKey": spawned[0],
                "challenge": challenge,
                "missionKey": mission_keys.get(challenge),
                "stepMissionKey": mission_keys.get(challenge + "_0"),
                "uuid": list(placed["_sceneObjectUuid"]),
                "level": level,
                "region": REGIONS[level.rsplit("_", 1)[1]],
                "gamePosition": position,
                "insideParent": inside_parent,
                "tablePositionMatches": table_distance < 0.01,
            })
    rows.sort(key=lambda row: row["itemName"])
    if len({tuple(row["uuid"]) for row in rows}) != len(rows) or len({row["itemKey"] for row in rows}) != len(rows):
        raise ValueError("An artifact UUID or item repeats")
    return rows


def pair_with_mapgenie(rows):
    """Pair rows with MapGenie points one to one, closest first."""
    points = mapgenie_points()
    pairs = sorted(
        (math.hypot(point["x"] - row["gamePosition"][0], point["z"] - row["gamePosition"][2]), r, p)
        for r, row in enumerate(rows) for p, point in enumerate(points))
    used_rows, used_points = set(), set()
    for distance, r, p in pairs:
        if r in used_rows or p in used_points or distance > PAIR_DISTANCE:
            continue
        used_rows.add(r)
        used_points.add(p)
        rows[r].update(mapGenieId=points[p]["id"], mapGenieName=points[p]["name"], mapGenieDistance=round(distance, 1))
    return len(points)


def survey_save(path, rows):
    """Return what one save copy records for the artifacts."""
    objects = saves.load_save(path)
    by_uuid = {tuple(row["uuid"][:3]): row for row in rows}
    by_item = {row["itemKey"]: row for row in rows}
    by_mission = {}
    for row in rows:
        by_mission[row["missionKey"]] = (row, "challenge")
        by_mission[row["stepMissionKey"]] = (row, "step")

    field = []
    for container in saves.top(objects, "FieldSaveData"):
        for record in container["_fieldGimmickSaveDataList"]:
            row = by_uuid.get(tuple(record.get("_levelOriginSceneObjectUuid") or ())[:3])
            if row:
                disabled = [list(u) for u in record.get("_levelOrigin_disabledSceneObjectUuidList") or []]
                field.append({
                    "itemName": row["itemName"],
                    "gimmickInfoKey": record.get("_gimmickInfoKey"),
                    "reason": record.get("_fieldSaveDataReason"),
                    "resetNever": record.get("_resetTimeSecondsOfDays") == 0xFFFFFFFFFFFFFFFF,
                    "initStateNameHash": record.get("_initStateNameHash"),
                    "ownUuidDisabled": row["uuid"] in disabled,
                })
    inventory = sorted(
        by_item[entry["_itemKey"]]["itemName"]
        for container in saves.top(objects, "InventorySaveData")
        for bag in container["_inventorylist"]
        for entry in bag.get("_itemList") or []
        if entry.get("_itemKey") in by_item)
    missions = {"challenge": {}, "step": {}}
    for container in saves.top(objects, "QuestSaveData"):
        for record in container["_missionStateList"]:
            if record.get("_key") in by_mission:
                row, kind = by_mission[record["_key"]]
                state = str(record.get("_state"))
                missions[kind][state] = missions[kind].get(state, 0) + 1
                if state != "2":
                    missions.setdefault("notOpen", []).append({"itemName": row["itemName"], "mission": kind, "state": record.get("_state")})
    landmark = [by_uuid[u[:3]]["itemName"] for u in saves.landmark_records(objects) if u[:3] in by_uuid]
    return {"save": path.name, "fieldRecords": field, "inventory": inventory, "missionStates": missions, "bellsListRecords": landmark}


def main():
    """Find, pair and survey the artifacts, then write the analysis file."""
    rows = find_artifacts()
    point_count = pair_with_mapgenie(rows)
    distances = sorted(row["mapGenieDistance"] for row in rows if "mapGenieDistance" in row)
    paths = [Path(arg) for arg in sys.argv[1:]] or sorted(SAVE_FOLDER.glob("*.save"))
    surveys = [survey_save(path, rows) for path in paths]

    print(f"{len(rows)} artifacts, {len(distances)} of {point_count} MapGenie points paired, "
          f"distance median {distances[len(distances) // 2] if distances else None} m, max {distances[-1] if distances else None} m")
    for survey in surveys:
        print(survey["save"], "field", [(f["itemName"], f["ownUuidDisabled"]) for f in survey["fieldRecords"]],
              "inventory", survey["inventory"], "missions", survey["missionStates"])

    output = {
        "summary": "Sealed Abyss Artifacts: landmark type 1000002 (challenge_sealed_artifact), gimmick 1004255 "
                   "(item_sealed_artifact). Offline survey of the game data and the user's save copies.",
        "nativeIcon": {
            "type": 187, "templateType": 28813, "templateName": "MapIcon_Gimmick_SealedArtifact", "category": "0xffffffff",
            "note": "Type/template from the icon catalogue in the map traces (v0.53+); the category byte is the "
                    "catalogue's 0xffffffff, the same as the shrine icon 186. World-map and minimap layouts exist "
                    "(worldmapicon.thtml, minimapicon.thtml); the world layout has zoom window 0.88 0.93 1 1 like the "
                    "Bell icon, so it needs the same zoom-window fix.",
        },
        "candidateRule": {
            "pickedUp": "FieldSaveData._fieldGimmickSaveDataList record for the artifact's UUID: gimmick 1004255, "
                        "reason 1, reset never, own UUID in _levelOrigin_disabledSceneObjectUuidList; the step mission "
                        "Challenge_SealedArtifact_<...>_0 is at state 5 and the item is in the inventory.",
            "unsealed": "Unknown. Probably the challenge mission Challenge_SealedArtifact_<...> moving from 2 to 5; "
                        "no save has an unsealed artifact yet.",
            "evidence": "Artifact 0001 picked up in the user's saves (older slots have none). Confirmed by a save pair "
                        "on 2026-10-24 (research/vendor/work/sealed-artifact-test/): before = Manual 1 (slot100), "
                        "after pickup = autosave slot2 and Manual 2 (slot101); artifact 0016 (Shield of Unchanging "
                        "Will I, Hernand) gained all three signs and nothing else about the artifacts changed.",
            "proposedDoneRule": "Done = the field-object record for the artifact's UUID with gimmick 1004255 and its "
                                "own UUID in the disabled list. A record for the UUID without that = unknown (hidden).",
        },
        "mapGeniePairing": {"points": point_count, "paired": len(distances),
                            "medianMetres": distances[len(distances) // 2] if distances else None,
                            "maxMetres": distances[-1] if distances else None},
        "artifacts": rows,
        "saves": surveys,
    }
    target = ROOT / "research" / "analysis" / "sealed-artifact-survey.json"
    target.write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"wrote {target.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
