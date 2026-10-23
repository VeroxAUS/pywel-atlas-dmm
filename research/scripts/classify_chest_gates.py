"""Sort the placed treasure chests by what controls whether they exist.

What it does:
    Answers "which chests depend on quest progress?" from game data only,
    without guessing from positions or names alone.
      1. Reads the game's level tree, leveldata/rootlevel/sceneobjectphase/
         mergedphasegroups.dat. Every level has a parent group, for example
         mission_friendly_legendary_black_lion < quest_node_her_friendly_legendary
         < node_hernand < faction_hernand < faction < gamedatalevel < rootlevel.
         The top groups say what kind of level it is: terrain (sectors, caves,
         dungeons), always-on content (the six chest levels), faction or main
         quest content, Abyss content, or story/building phases.
      2. Reads the game's list of "level gimmick" objects,
         levelgimmicksceneobjectinfo_misc. It names every object the save
         tracks in its Bells' list (DiscoveredLevelGimmickSceneObjectSaveData),
         with its type key (1000007 = TreasureBox), level, parent chain and
         UUID. It also lists TreasureBox objects that the level scan missed
         (mostly Abyss levels).
      3. Links each chest level and its parent groups to a mission or quest of
         exactly the same name (missioninfo / questinfo), when one exists.
      4. Optionally reads save copies and reports, per chest: any Bells'-list
         record, any field record, and the state of the linked mission/quest.
      5. Lists every TreasureBox object of the game list with its position
         (three floats at +48 after the chain) and pairs it with the nearest
         MapGenie chest point: surface points with the Bell-fitted formula of
         find_treasure_chests.py, Abyss points with the formula fitted here
         (ABYSS_* below; all 54 Abyss points pair, median about 2.5 m).
    The result is a classification per chest. "unknown" stays unknown; nothing
    here decides that a chest is ungated.

Key terms:
    level tree - the game's grouping of level files; a level is loaded with,
        or instead of, its siblings depending on its group.
    phase level - a level whose name ends in _PhaseNN_NN; one variant of a
        place (before/after an event, a building stage, a fort owner).
    name hash - the game refers to levels by a 32-bit Jenkins hash of the
        level's CamelCase name (pycrimson's calculate_checksum).

Reads:  the installed game's packs (group 0015) through pycrimson, read-only;
        research/vendor/work/staticinfo/ (extracted tables);
        research/vendor/work/levelgimmicksceneobjectinfo_misc.base.staticinfomisc;
        research/analysis/treasure-chest-placements.json; data/poi-data.js;
        optional save copies given on the command line (never the game's save
        folder; the script refuses paths inside it).
Writes: research/analysis/chest-gate-classification.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/classify_chest_gates.py [copy.save ...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import os
import re
import struct
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
WORK = VENDOR / "work"
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
PHASE_GROUPS = "leveldata/rootlevel/sceneobjectphase/mergedphasegroups.dat"
TREASURE_BOX = 1000007  # levelgimmicksceneobjectinfo key "TreasureBox".
MAPGENIE_CHESTS = "mg-category:15041"
PAIR_DISTANCE = 80.0  # Same limit as find_treasure_chests.py.
# MapGenie Abyss map -> game (x, z), fitted 2026-10-22 by matching the 54 Abyss
# chest points to the 74 Abyss TreasureBox objects (vote, then least squares).
# Both axes came out with the same scale, as on the surface map.
ABYSS_LNG_OFFSET, ABYSS_LNG_SCALE = 0.9704511, 3.1054142e-5
ABYSS_LAT_OFFSET, ABYSS_LAT_SCALE = -0.7620569, 3.1054118e-5
# Tables whose header uses a 4-byte row count (pycrimson's list, trimmed).
FOUR_BYTE_COUNT = {"questinfo", "stageinfo", "levelgimmicksceneobjectinfo",
                   "fieldlevelnametableinfo", "levelinfo", "gameplaytrigger"}


def load_table(name):
    """Return {row key: row bytes} for one extracted static table."""
    header = (WORK / "staticinfo" / f"{name}.staticinfoheader").read_bytes()
    body = (WORK / "staticinfo" / f"{name}.staticinfobody").read_bytes()
    count_size = 4 if name in FOUR_BYTE_COUNT else 2
    count = int.from_bytes(header[:count_size], "little")
    key_size = (len(header) - count_size - 4 * count) // count

    # The header lists (key, body offset); a row ends where the next one starts.
    rows = []
    position = count_size
    for _ in range(count):
        key = int.from_bytes(header[position:position + key_size], "little")
        offset = struct.unpack_from("<I", header, position + key_size)[0]
        rows.append((key, offset))
        position += key_size + 4
    ends = sorted(offset for _, offset in rows) + [len(body)]
    next_offset = {ends[i]: ends[i + 1] for i in range(len(ends) - 1)}
    return {key: body[offset:next_offset[offset]] for key, offset in rows}


def row_names(name):
    """Return {lower-case row name: key}; these rows start with key, then the name."""
    names = {}
    for key, row in load_table(name).items():
        length = struct.unpack_from("<I", row, 4)[0]
        if 0 < length < 200:
            names[row[8:8 + length].decode("ascii", "replace").lower()] = key
    return names


def read_level_tree(data):
    """Parse mergedphasegroups.dat into a list of (level name, depth)."""
    # Layout seen: 8-byte header, then (u16 length incl. NUL, name, NUL, u8 depth).
    items = []
    position = 8
    while position < len(data):
        length = struct.unpack_from("<H", data, position)[0]
        if length == 0 or length > 200:
            break
        name = data[position + 2:position + 1 + length].decode("ascii", "replace")
        items.append((name, data[position + 2 + length]))
        position += 3 + length
    return items


def ancestors(items, index):
    """Return the level and its parent groups, nearest first, up to rootlevel."""
    chain = [items[index][0]]
    depth = items[index][1]
    for back in range(index - 1, -1, -1):
        if items[back][1] < depth:
            chain.append(items[back][0])
            depth = items[back][1]
        if depth == 0:
            break
    return chain


def gimmick_objects():
    """Return the level-gimmick object list: type key, level, chain and UUID."""
    data = (WORK / "levelgimmicksceneobjectinfo_misc.base.staticinfomisc").read_bytes()
    records = []
    # Each record's parent chain ends in "rootlevel"; walk back from there to
    # the level name, which is preceded by five u32 (type key, 0, gimmick key, 0, 0).
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
                # A wrong guess for the start can produce any length; stop at the anchor.
                if position + 4 > chain_end:
                    break
                size = struct.unpack_from("<I", data, position)[0]
                chain.append(data[position + 4:position + 4 + size].decode("ascii", "replace"))
                position += 4 + size
            if position != chain_end or chain[-1] != "rootlevel":
                continue
            # UUID: three u32 at +8 after the chain (checked against 147 placed
            # chests); position: three floats at +48 (matched 263 placed chests).
            records.append({
                "type": struct.unpack_from("<I", data, start - 20)[0],
                "gimmickKey": struct.unpack_from("<I", data, start - 12)[0],
                "level": level.decode(),
                "chain": chain,
                "uuid": list(struct.unpack_from("<3I", data, chain_end + 8)),
                "position": [round(v, 4) for v in struct.unpack_from("<3f", data, chain_end + 48)],
            })
            break
    return records


def gate_class(level, chain):
    """Name the kind of level from its parent groups (structure only, not proof)."""
    if chain is None:
        return "not-in-level-tree"
    # The level tree is lower case; the gimmick list keeps CamelCase names.
    chain = [name.lower() for name in chain]
    if level.lower().startswith("sector_") or "world_use_terrain" in chain:
        return "terrain"
    if "contents" in chain:
        return "content-chest-level"
    if "faction" in chain or "main" in chain:
        return "quest-or-faction-level"
    if "abyss" in chain:
        return "abyss-level"
    if "content_level" in chain:
        return "story-or-build-phase-level"
    return "other"


def mapgenie_to_game(point):
    """Convert a MapGenie point to approximate game (x, z) on its own map."""
    if point.get("world") == "Abyss":
        return ((point["mapLng"] + ABYSS_LNG_OFFSET) / ABYSS_LNG_SCALE,
                (point["mapLat"] + ABYSS_LAT_OFFSET) / ABYSS_LAT_SCALE)
    # Surface formula fitted from the 8 Bells (find_treasure_chests.py).
    return (point["mapLng"] + 0.40246) / 4.1456e-5, (point["mapLat"] - 0.77890) / 4.1373e-5


def pair_treasure_boxes(objects, points):
    """Give each TreasureBox object its nearest MapGenie chest point on the same map."""
    converted = [(point, mapgenie_to_game(point)) for point in points]
    for item in objects:
        is_abyss = any(name.lower() == "abyss" for name in item["chain"])
        x, _, z = item["position"]
        best = None
        for point, (px, pz) in converted:
            if (point.get("world") == "Abyss") != is_abyss:
                continue
            distance = ((px - x) ** 2 + (pz - z) ** 2) ** 0.5
            if best is None or distance < best[0]:
                best = (distance, point["id"])
        item["mapGenieId"] = best[1] if best and best[0] <= PAIR_DISTANCE else None
        item["mapGenieDistance"] = round(best[0], 1) if best else None


def load_save(path):
    """Decode one save copy into its top-level objects (read-only)."""
    if "pearl abyss" in str(path.resolve()).lower():
        raise SystemExit("Refusing to read inside the game's save folder; copy the file first.")
    return ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects


def save_facts(objects):
    """Return Bells'-list UUIDs, field-record UUIDs and mission/quest states."""
    landmark, field, missions, quests = {}, set(), {}, {}
    for item in objects:
        kind = item.get("__pycr_type__")
        if kind == "DiscoveredLevelGimmickSceneObjectSaveData":
            for entry in item["_discoveredLevelGimmickSceneObjectSaveDataList"]:
                landmark[tuple((entry.get("_sceneObjectUuid") or [])[:3])] = bool(entry.get("_isCompleted"))
        elif kind == "FieldSaveData":
            for entry in item.get("_fieldGimmickSaveDataList") or []:
                field.add(tuple((entry.get("_levelOriginSceneObjectUuid") or [])[:3]))
        elif kind == "QuestSaveData":
            missions = {m["_key"]: m.get("_state") for m in item["_missionStateList"]}
            quests = {q["_questKey"]: q.get("_state") for q in item["_questStateList"]}
    return landmark, field, missions, quests


def main():
    """Classify every placed chest and write the JSON report."""
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    tree = read_level_tree(context.get_file(PHASE_GROUPS))
    tree_index = {name: index for index, (name, _) in enumerate(tree)}
    missions = row_names("missioninfo")
    quests = row_names("questinfo")
    gimmicks = gimmick_objects()
    by_uuid = {}
    for record in gimmicks:
        by_uuid.setdefault(tuple(record["uuid"]), []).append(record["type"])
    saves = [(Path(p).name, save_facts(load_save(Path(p)))) for p in sys.argv[1:]]

    placements = json.loads((ROOT / "research" / "analysis" / "treasure-chest-placements.json")
                            .read_text(encoding="utf-8"))
    chests = []
    for spot in placements["spots"]:
        for chest in spot["chests"]:
            level = os.path.basename(chest["level"]).replace(".palevel", "")
            chain = ancestors(tree, tree_index[level]) if level in tree_index else None
            uuid = tuple(chest["uuid"][:3])

            # Missions/quests whose name equals the level or one of its groups.
            links = []
            for name in (chain or [])[:-2]:
                if name in missions:
                    links.append({"kind": "mission", "name": name, "key": missions[name]})
                if name in quests:
                    links.append({"kind": "quest", "name": name, "key": quests[name]})

            entry = {
                "uuid": chest["uuid"],
                "prefab": chest["prefab"],
                "level": level,
                "levelChain": chain,
                "gateClass": gate_class(level, chain),
                "gimmickTypes": sorted(by_uuid.get(uuid, [])),
                "nameLinks": links,
                "mapGenieId": spot["mapGenieId"] if spot.get("matched") else None,
            }
            for save_name, (landmark, field, mission_states, quest_states) in saves:
                entry.setdefault("saves", {})[save_name] = {
                    "landmark": landmark.get(uuid),
                    "field": uuid in field,
                    "linkStates": [(mission_states if link["kind"] == "mission" else quest_states)
                                   .get(link["key"]) for link in links],
                }
            chests.append(entry)

    # Every TreasureBox object of the game list: these use the Bells' save rule
    # (key 1000007). Mark the ones the placement scan did not find (Abyss, caves).
    placed = {tuple(chest["uuid"][:3]) for chest in chests}
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    points = [point for point in json.loads(text[text.index("{"):text.rindex("}") + 1])["locations"]
              if point.get("categoryId") == MAPGENIE_CHESTS]
    boxes = [record for record in gimmicks if record["type"] == TREASURE_BOX]
    for record in boxes:
        record["inPlacements"] = tuple(record["uuid"]) in placed
        record["gateClass"] = gate_class(record["level"], record["chain"])
    pair_treasure_boxes(boxes, points)
    missed = [record for record in boxes if not record["inPlacements"]]

    # MapGenie points paired by the placement scan or by the game list.
    paired_points = {c["mapGenieId"] for c in chests if c["mapGenieId"]}
    paired_points |= {b["mapGenieId"] for b in boxes if b["mapGenieId"]}

    summary = {
        "chests": len(chests),
        "byGateClass": dict(Counter(c["gateClass"] for c in chests).most_common()),
        "mapGeniePointsByGateClass": {
            name: len({c["mapGenieId"] for c in chests if c["gateClass"] == name and c["mapGenieId"]})
            for name in Counter(c["gateClass"] for c in chests)},
        "withTreasureBoxRecord": sum(1 for c in chests if TREASURE_BOX in c["gimmickTypes"]),
        "treasureBoxObjectsInGameList": len(boxes),
        "treasureBoxObjectsNotPlaced": len(missed),
        "treasureBoxByGateClass": dict(Counter(b["gateClass"] for b in boxes).most_common()),
        "treasureBoxWithMapGeniePoint": sum(1 for b in boxes if b["mapGenieId"]),
        "withExactNameLink": sum(1 for c in chests if c["nameLinks"]),
        "mapGeniePoints": len(points),
        "mapGeniePointsPaired": len(paired_points),
        "mapGeniePointsUnpaired": sorted(p["id"] for p in points if p["id"] not in paired_points),
    }
    for save_name, _ in saves:
        summary[f"recordsIn:{save_name}"] = {
            "landmark": sum(1 for c in chests if c["saves"][save_name]["landmark"] is not None),
            "field": sum(1 for c in chests if c["saves"][save_name]["field"]),
        }
    output = {"summary": summary, "chests": chests, "treasureBoxObjects": boxes}
    (ROOT / "research" / "analysis" / "chest-gate-classification.json").write_text(
        json.dumps(output, indent=1) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
