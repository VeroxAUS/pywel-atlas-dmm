"""Write the list of Bell-style treasure chests the mod is built from.

What it does:
    Takes the chests in the game's six dedicated chest levels (TreasureBox*)
    from the placement research and writes a small, stable data file with
    what the mod needs per chest: its unique ID (UUID), game position, level,
    a readable name and the paired MapGenie point (when one is within 80 m).
    Stops with an error if a row has an odd shape or a UUID repeats.
    v0.59 appends the 44 cave and dungeon chests that are in the game's own
    TreasureBox list (gimmick type 1000007) in always-loaded terrain levels.
    They come after the 120 chest-level chests, so the existing chests keep
    their row numbers (the mod's marker IDs are built from the row number).
    v0.68 appends the puzzle strongboxes and the surface itemboxes outside
    the chest levels (both use the field save rule below), again after the
    rows before them.

Save rule (confirmed in game 2026-10-22, docs/native-save-detection.md):
    a chest in these levels is opened when the save's
    DiscoveredLevelGimmickSceneObjectSaveData list holds a record with key
    1000007 ("TreasureBox"), that UUID and _isCompleted = true. A record
    without the flag means only "seen". Neither refills. The cave chests
    follow the same rule (Echoing Tunnel save test, chest D).

Field save rule (rows with "rule": "field", v0.68; strongbox save test
2026-10-22, owl box, music box, jigsaw safe, padlock safe, Hernand itembox):
    FieldSaveData._fieldGimmickSaveDataList holds a record whose
    _levelOriginSceneObjectUuid is the box's UUID (all four numbers), with
    reason 1 and refill time "never" (the largest 64-bit value). Its
    _initStateNameHash says the state: 353047760 or 1537827618 = opened
    (stolen / looted), 2255254665 = closed. Puzzle boxes get the record only
    when opened; touching the puzzle adds nothing. The itembox also got a
    Bells'-list record with key 1000134 ("TreasureBox_Sector") and
    _isCompleted on opening; the mod accepts that too.

Reads: research/analysis/treasure-chest-placements.json,
        research/analysis/chest-gate-classification.json, data/poi-data.js
Writes: data/treasure-chest-links.json and (v0.69) data/abyss-chest-links.json (overwritten)
Run:    python -B research/scripts/export_chest_links.py
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
# Readable region per dedicated chest level.
REGIONS = {
    "treasureboxcrimsondesert": "Crimson Desert",
    "treasureboxdelesyia": "Delesyia",
    "treasureboxdemeniss": "Demeniss",
    "treasureboxhernand": "Hernand",
    "treasureboxkweiden": "Kweiden",
}
# Readable region per cave group in the level tree (cave chests, v0.59).
# Groups not listed here take the region of the paired MapGenie point.
CAVE_REGIONS = {
    "CD_Cave_Her": "Hernand",
    "CD_Dungeon_Her": "Hernand",
    "CD_Cave_Dem": "Demeniss",
    "CD_Cave_Del": "Delesyia",
    "CD_Cave_Kwe": "Kweiden",
    "CD_Cave_Desert": "Crimson Desert",
}
# MapGenie calls the Kweiden region "Pailune"; use the game-level name.
MAPGENIE_REGIONS = {"Pailune": "Kweiden"}
# Puzzle strongbox families (prefab name part -> readable kind), v0.68.
# Padlock, number wheel, music box and jigsaw were checked in a save test;
# the others are included on the strength of that shared behaviour (any
# unexpected record keeps the marker hidden as unknown).
STRONGBOX_KINDS = {
    "padlock_safe": "padlock",
    "fitnumber_safe": "number wheel",
    "musicbox": "music box",
    "jigsaw_move_safe": "sliding jigsaw",
    "jigsaw_safe": "jigsaw",
    "dial_safe": "dial",
    "allbutton": "all buttons",
    "onetouchdrawing": "one-stroke drawing",
}
# Level groups whose boxes are always placed (quest, phase and unplaced
# levels stay out: their boxes may not exist in a given save).
ALWAYS_PLACED = ("terrain", "content-chest-level")


def check_row(uuid, position):
    """Stop with an error if a chest's UUID or position has an odd shape."""
    if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
        raise ValueError(f"Unexpected chest UUID {uuid}")
    if len(position) != 3 or any(abs(v) > 100000 for v in position):
        raise ValueError(f"Unexpected chest position {position}")


def mapgenie_points():
    """MapGenie id -> point (region, description) from data/poi-data.js."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    return {point["id"]: point for point in data["locations"]}


def place_name(point):
    """The cave or building named in a MapGenie description ("Inside [Echoing Tunnel](...)")."""
    # Only a link right after "inside" names the place; other links are loot.
    match = re.search(r"[Ii]nside (?:the )?\[([^\]]+)\]\(", (point or {}).get("description") or "")
    return match.group(1).strip() if match else None


def cave_rows(placements, points):
    """The cave and dungeon chests of the game's TreasureBox list, in a stable order."""
    gates = json.loads((ROOT / "research" / "analysis" / "chest-gate-classification.json")
                       .read_text(encoding="utf-8"))
    # Full 4-number UUIDs and level-file positions, keyed by the first three numbers.
    placed = {}
    for spot in placements["spots"]:
        for chest in spot["chests"]:
            placed[tuple(chest["uuid"][:3])] = chest

    rows = []
    numbers = {}
    caves = [item for item in gates["treasureBoxObjects"] if item["gateClass"] == "terrain"]
    # Sort by level name, then position, so the order does not depend on file order.
    caves.sort(key=lambda item: (item["level"].lower(), item["position"]))
    for item in caves:
        chest = placed.get(tuple(item["uuid"][:3]))
        if chest is None:
            raise ValueError(f"Cave chest {item['uuid']} is not in the placements file")
        point = points.get(item.get("mapGenieId")) if (item.get("mapGenieDistance") or 999) <= 80 else None
        group = next((name for name in item["chain"] if name in CAVE_REGIONS), None)
        region = CAVE_REGIONS.get(group)
        if region is None and point is not None:
            region = MAPGENIE_REGIONS.get(point.get("region"), point.get("region"))
        region = region or "Pywel"
        uuid = chest["uuid"]
        position = chest["gamePosition"]
        check_row(uuid, position)
        numbers[region] = numbers.get(region, 0) + 1
        rows.append({
            "name": f"{region} cave chest {numbers[region]}",
            "place": place_name(point),
            "uuid": uuid,
            "gamePosition": position,
            "level": item["level"].lower(),
            "prefab": chest["prefab"],
            "mapGenieId": point["id"] if point else None,
            "mapGenieDistance": item.get("mapGenieDistance") if point else None,
        })
    return rows


def strongbox_kind(prefab):
    """Readable kind of a field-rule box ("music box", "itembox"), or None if not one."""
    name = prefab.lower().removesuffix(".prefab")
    if name.startswith("gimmick_itembox_a_"):
        return "itembox"
    for part, kind in STRONGBOX_KINDS.items():
        if re.fullmatch(rf"gimmick_treasurebox_{part}_\d+", name):
            return kind
    return None


def strongbox_rows(placements, points, taken):
    """Puzzle strongboxes and surface itemboxes (field save rule), in a stable order."""
    gates = json.loads((ROOT / "research" / "analysis" / "chest-gate-classification.json")
                       .read_text(encoding="utf-8"))
    # Placement spot per box (for the paired MapGenie point), keyed by UUID.
    spots = {}
    for spot in placements["spots"]:
        for chest in spot["chests"]:
            spots[tuple(chest["uuid"])] = (spot, chest)

    boxes = []
    for item in gates["chests"]:
        kind = strongbox_kind(item["prefab"])
        uuid = tuple(item["uuid"])
        # Boxes in the game's TreasureBox list (1000007) are already rows.
        if kind is None or item["gateClass"] not in ALWAYS_PLACED or uuid in taken:
            continue
        if 1000007 in (item.get("gimmickTypes") or []):
            continue
        spot, chest = spots[uuid]
        boxes.append((item, spot, chest, kind))

    rows = []
    numbers = {}
    # Sort by region, then level name and position, independent of file order.
    def region_of(spot):
        region = spot.get("mapGenieRegion") or "Pywel"
        return MAPGENIE_REGIONS.get(region, region)
    boxes.sort(key=lambda box: (region_of(box[1]), box[0]["level"].lower(), box[2]["gamePosition"]))
    for item, spot, chest, kind in boxes:
        region = region_of(spot)
        position = chest["gamePosition"]
        check_row(list(chest["uuid"]), position)
        label = "house chest" if kind == "itembox" else "strongbox"
        numbers[(region, label)] = numbers.get((region, label), 0) + 1
        name = f"{region} {label} {numbers[(region, label)]}"
        point = points.get(spot.get("mapGenieId")) if (spot.get("mapGenieDistance") or 999) <= 80 else None
        rows.append({
            "name": name if kind == "itembox" else f"{name} ({kind})",
            "rule": "field",
            "uuid": chest["uuid"],
            "gamePosition": position,
            "level": item["level"].lower(),
            "prefab": chest["prefab"],
            "mapGenieId": point["id"] if point else None,
            "mapGenieDistance": spot.get("mapGenieDistance") if point else None,
        })
    return rows


def abyss_name(level):
    """Readable place of an Abyss level ("Abyss island 13", "Abyss core island 5")."""
    match = re.fullmatch(r"Abyss(IslandCore|Island|Bridge)_(\d+)_Phase00_00(?:_sub_\d+_\d+)?", level)
    if match is None:
        raise ValueError(f"Unexpected Abyss chest level {level}")
    kind = {"IslandCore": "core island", "Island": "island", "Bridge": "bridge"}[match.group(1)]
    return f"Abyss {kind} {int(match.group(2))}"


def abyss_rows(placements, points):
    """The Abyss chests of the game's TreasureBox list (v0.69), in a stable order.

    Same save rule as the chest-level and cave chests (key 1000007). The 21
    chests on the seven core islands sit under the level group
    "AbyssIsland_Quest"; the user chose to mark them too (2026-10-22).
    """
    gates = json.loads((ROOT / "research" / "analysis" / "chest-gate-classification.json")
                       .read_text(encoding="utf-8"))
    placed = {}
    for spot in placements["spots"]:
        for chest in spot["chests"]:
            placed[tuple(chest["uuid"][:3])] = chest

    chests = [item for item in gates["treasureBoxObjects"] if item["gateClass"] == "abyss-level"]
    chests.sort(key=lambda item: (abyss_name(item["level"]), item["level"].lower(), item["position"]))
    rows = []
    numbers = {}
    for item in chests:
        chest = placed.get(tuple(item["uuid"][:3]))
        if chest is None:
            raise ValueError(f"Abyss chest {item['uuid']} is not in the placements file")
        place = abyss_name(item["level"])
        numbers[place] = numbers.get(place, 0) + 1
        uuid = chest["uuid"]
        position = chest["gamePosition"]
        check_row(uuid, position)
        point = points.get(item.get("mapGenieId")) if (item.get("mapGenieDistance") or 999) <= 80 else None
        rows.append({
            "name": f"{place} chest {numbers[place]}",
            "uuid": uuid,
            "gamePosition": position,
            "level": item["level"].lower(),
            "levelGroup": item["chain"][0],
            "prefab": chest["prefab"],
            "mapGenieId": point["id"] if point else None,
            "mapGenieDistance": item.get("mapGenieDistance") if point else None,
        })
    return rows


def write_abyss(placements, points):
    """Write data/abyss-chest-links.json (v0.69)."""
    rows = abyss_rows(placements, points)
    if len({tuple(row["uuid"]) for row in rows}) != len(rows):
        raise ValueError("An Abyss chest UUID repeats")
    output = {
        "version": 1,
        "category": "Abyss Chest (the game's TreasureBox list, Abyss levels)",
        "saveType": "DiscoveredLevelGimmickSceneObjectSaveData",
        "saveList": "_discoveredLevelGimmickSceneObjectSaveDataList",
        "infoKey": 1000007,
        "openedRule": "record with infoKey 1000007, this UUID and _isCompleted = true (assumed from the "
                      "surface chests; confirmed by the Abyss save test 2026-10-22, Abyss bridge 1 chest 1)",
        "nativeIcon": {"type": 226, "templateType": 28852, "templateName": "MapIcon_Gimmick_LevelTreasureBox"},
        "locations": rows,
    }
    (ROOT / "data" / "abyss-chest-links.json").write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"{len(rows)} Abyss chests written")


def main():
    """Validate the Bell-style chests and write the data file."""
    placements = json.loads((ROOT / "research" / "analysis" / "treasure-chest-placements.json")
                            .read_text(encoding="utf-8"))
    rows = []
    numbers = {}
    for spot in placements["spots"]:
        for chest in spot["chests"]:
            if chest["saveRule"] != "landmark":
                continue
            level = chest["level"].rsplit("/", 1)[-1].removesuffix(".palevel")
            region = REGIONS[level]
            uuid = chest["uuid"]
            position = chest["gamePosition"]
            check_row(uuid, position)
            numbers[region] = numbers.get(region, 0) + 1
            rows.append({
                "name": f"{region} chest {numbers[region]}",
                "uuid": uuid,
                "gamePosition": position,
                "level": level,
                "prefab": chest["prefab"],
                "mapGenieId": spot["mapGenieId"] if spot["matched"] else None,
                "mapGenieDistance": spot["mapGenieDistance"] if spot["matched"] else None,
            })
    if len(rows) != 120:
        raise ValueError(f"Expected the 120 chest-level chests, found {len(rows)}")

    # v0.59: cave chests go after the chest-level chests (stable marker IDs).
    points = mapgenie_points()
    rows += cave_rows(placements, points)
    for row in rows:
        row["rule"] = "list"
    # v0.68: field-rule boxes go last (stable marker IDs for the rows above).
    rows += strongbox_rows(placements, points, {tuple(row["uuid"]) for row in rows})
    if len({tuple(row["uuid"]) for row in rows}) != len(rows):
        raise ValueError("A chest UUID repeats")

    output = {
        "version": 3,
        "category": "Treasure Chest (dedicated chest levels, then cave and dungeon chests, "
                    "then puzzle strongboxes and surface itemboxes)",
        "saveType": "DiscoveredLevelGimmickSceneObjectSaveData",
        "saveList": "_discoveredLevelGimmickSceneObjectSaveDataList",
        "infoKey": 1000007,
        "openedRule": "rule list: record with infoKey 1000007, this UUID and _isCompleted = true; "
                      "rule field: the same with infoKey 1000007 or 1000134, or a "
                      "FieldSaveData._fieldGimmickSaveDataList record for this UUID with reason 1, "
                      "reset never and state 353047760 or 1537827618 (2255254665 = closed)",
        "nativeIcon": {"type": 226, "templateType": 28852, "templateName": "MapIcon_Gimmick_LevelTreasureBox"},
        "evidence": "Save test 2026-10-22 (chest B, Church of Calphade tower, TreasureBoxHernand): seen added the "
                    "record, opening set _isCompleted, 12 in-game hours later unchanged. Cave save test "
                    "2026-10-22 (chest D, Echoing Tunnel): the same record and flag. Strongbox save test "
                    "2026-10-22 (owl box, music box, jigsaw safe, Hernand itembox): field records on "
                    "opening only, reset never, opened states as in openedRule. Positions from the level "
                    "files via research/scripts/find_treasure_chests.py.",
        "locations": rows,
    }
    (ROOT / "data" / "treasure-chest-links.json").write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"{len(rows)} chests written")

    # v0.69: the Abyss chests go to their own file (their own map category).
    write_abyss(placements, points)


if __name__ == "__main__":
    main()
