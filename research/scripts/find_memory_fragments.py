"""Survey the Memory Fragments ("Visione chips"): where they are and what the save records.

What it does:
    1. Reads the knowledge table: every Knowledge_Visione_Chip_* entry with its
       English name (knowledge.paloc), and the item table: every
       Visione_Chip_* item with the knowledge key stored in its row.
    2. Reads every level file in pack group 0015 that may hold a chip (a byte
       pre-filter for "visione_chip" or a chip item / knowledge key) and keeps
       each placed object that is a chip:
         - a plain chip is a bare SceneObject whose SpawnComponent spawns a
           Visione_Chip_* item (_itemKey); that item names the knowledge entry;
         - a boss-rematch chip uses a gimmick_item_basic_visione_chip_* prefab
           whose GimmickSpawnDataComponent._spawnReason is "BossRematch_<Boss>",
           matching Knowledge_Visione_Chip_BossRematch_<Boss>;
         - any other object with a field equal to a chip knowledge key.
       World positions walk children with the parent transform.
    3. Links each placement to the landmark list (types 1000023 Visione_Chip and
       1000140 Visione_Chip_Boss) by UUID, and pairs it one to one with the
       MapGenie "Memory Fragment" points, closest first (MapGenie only names
       and counts; it is never the position). Knowledge entries are also
       matched to MapGenie points by English name.
    4. Reads save copies and reports, per fragment, its knowledge level in
       KnowledgeSaveData._list, plus counts of other records that point at a
       chip placement (field-object records, the Bells' list, disabled-object
       lists) and chip items in the inventory, so the save rule can be chosen.
    Read-only on the game files and saves. compare_chest_saves.load_save refuses
    the game's save folder, so copy the slot files first (default folder below).

Key terms:
    knowledge entry - a row of knowledgeinfo; the save's KnowledgeSaveData._list
        holds the entries the player knows, with a _level.
    landmark list - levelgimmicksceneobjectinfo_misc (see
        survey_landmark_categories.py); the save's Bells' list stores its type.

Reads:  research/vendor/work/staticinfo/{knowledgeinfo,iteminfo}.*,
        research/vendor/work/eng/knowledge.paloc, research/vendor/work/pack-files.txt,
        the installed game's level packs (group 0015), the landmark list,
        data/poi-data.js, save copies in research/vendor/work/memory-fragment-survey/
        (<slot>.save; or paths given on the command line)
Writes: research/analysis/memory-fragment-survey.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_memory_fragments.py [A.save ...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import re
import struct
import sys
import time
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
SAVE_ARGS = sys.argv[1:]
# survey_landmark_categories reads the repository root from argv[1] when imported.
sys.argv = [sys.argv[0], str(ROOT)]
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

import compare_chest_saves as saves  # noqa: E402
import survey_landmark_categories as landmarks  # noqa: E402
from find_chest_contents import load_table, read_paloc, text_ids  # noqa: E402
from find_treasure_chests import GAME, PackageContext, multiply, parse_level, rotate  # noqa: E402
from scan_ground_items import fields  # noqa: E402

CHIP_LANDMARKS = {1000023: "Visione_Chip", 1000140: "Visione_Chip_Boss"}
MAPGENIE_CATEGORY = "Memory Fragment"
PAIR_DISTANCE = 80.0
CHIP_PREFAB = re.compile(r"visione_chip", re.IGNORECASE)
SAVE_FOLDER = VENDOR / "work" / "memory-fragment-survey"


def row_names(table):
    """Return {key: (name as stored, row bytes)} for a table whose rows start with key, name."""
    rows = {}
    for key, row in load_table(table).items():
        name = landmarks.row_name(row)
        if name:
            rows[key] = (name, row)
    return rows


def chip_knowledge():
    """Return {knowledge key: {"name", "english"}} for every Knowledge_Visione_Chip_* entry."""
    texts = read_paloc(VENDOR / "work" / "eng" / "knowledge.paloc")
    entries = {}
    for key, (name, row) in row_names("knowledgeinfo").items():
        if name.lower().startswith("knowledge_visione_chip_"):
            # The first text id that has an English text is the entry's name.
            english = next((texts[text] for _, text in text_ids(row) if text in texts), None)
            entries[key] = {"name": name, "english": english}
    return entries


def chip_items(knowledge):
    """Return {item key: {"name", "knowledgeKey", "offset"}} for Visione_Chip_* items.

    The item row holds its knowledge entry's key as a plain u32 (offset 207 in
    the rows checked); the expected name Knowledge_<item name> breaks a tie.
    """
    by_name = {entry["name"].lower(): key for key, entry in knowledge.items()}
    items = {}
    for key, (name, row) in row_names("iteminfo").items():
        if "visione_chip" not in name.lower():
            continue
        found = [(offset, struct.unpack_from("<I", row, offset)[0]) for offset in range(len(row) - 3)
                 if struct.unpack_from("<I", row, offset)[0] in knowledge]
        expected = by_name.get("knowledge_" + name.lower())
        chosen = next((hit for hit in found if hit[1] == expected), found[0] if found else (None, None))
        items[key] = {"name": name, "knowledgeKey": chosen[1], "offset": chosen[0],
                      "otherKnowledgeRefs": sorted({value for _, value in found} - {chosen[1]})}
    return items


def placed_objects(objects):
    """Yield (object, world position, parent prefab) for every object with a transform."""
    def walk(item, parent, parent_prefab):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), multiply(parent[1], rotation))
        prefab = str(item.get("__pycr_type__"))
        if world:
            yield item, world[0], parent_prefab
        for child in item.get("_childSceneObjects") or []:
            if isinstance(child, dict):
                yield from walk(child, world, prefab)

    for item in objects:
        if isinstance(item, dict):
            yield from walk(item, None, None)


def chip_link(prefab, values, items, knowledge, by_name):
    """Return (knowledge key, how it was linked) for one object's fields, or (None, None)."""
    for path, value in values.items():
        if path.endswith("_itemKey") and value in items:
            return items[value]["knowledgeKey"], f"{path} -> item {items[value]['name']}"
    if CHIP_PREFAB.search(prefab):
        for path, value in values.items():
            if path.endswith("_spawnReason") and isinstance(value, str):
                key = by_name.get("knowledge_visione_chip_" + value.lower())
                if key:
                    return key, f"{path} = {value}"
        return None, "chip prefab, no knowledge link"
    for path, value in values.items():
        if isinstance(value, int) and value in knowledge:
            return value, f"{path} = knowledge key"
    return None, None


def may_hold_chip(data, keys):
    """Quick byte test: the level names a chip prefab or holds a chip item/knowledge key.

    All keys lie in 0x0F4000-0x0F5FFF, so only u32s whose upper bytes are
    40-5F 0F 00 need a set lookup (a regex with one branch per key was far slower).
    """
    if b"visione_chip" in data.lower():
        return True
    for match in re.finditer(rb"[\x40-\x5f]\x0f\x00", data):
        start = match.start() - 1
        if start >= 0 and struct.unpack_from("<I", data, start)[0] in keys:
            return True
    return False


def scan_levels(items, knowledge):
    """Return every chip placement in the pack-group-0015 level files."""
    by_name = {entry["name"].lower(): key for key, entry in knowledge.items()}
    keys = set(items) | set(knowledge)
    paths = [line.split(" ", 1)[1].strip()
             for line in (VENDOR / "work" / "pack-files.txt").read_text(encoding="utf-8").splitlines()
             if line.rstrip().endswith(".palevel")]
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    found, seen, errors = [], set(), []
    started = time.time()
    for index, path in enumerate(paths):
        if index % 4000 == 0:
            print(f"{index}/{len(paths)} levels, {len(found)} chips, {time.time() - started:.0f}s", flush=True)
        try:
            data = context.get_file(path)
        except Exception as error:  # A pack read failure is reported, not fatal.
            errors.append(f"{path}: {error}")
            continue
        if not may_hold_chip(data, keys):
            continue
        for item, position, parent_prefab in placed_objects(parse_level(data)):
            prefab = str(item.get("__pycr_type__"))
            values = fields(item)
            key, link = chip_link(prefab, values, items, knowledge, by_name)
            if not link:
                continue
            uuid = list(item.get("_sceneObjectUuid") or [])
            if (tuple(uuid), path) in seen:
                continue
            seen.add((tuple(uuid), path))
            found.append({
                "knowledgeKey": key,
                "gameName": knowledge[key]["name"] if key else None,
                "englishName": knowledge[key]["english"] if key else None,
                "link": link,
                "prefab": prefab.rsplit("/", 1)[-1],
                "parentPrefab": parent_prefab.rsplit("/", 1)[-1] if parent_prefab else None,
                "uuid": uuid,
                "level": path.rsplit("/", 1)[-1][:-len(".palevel")],
                "alias": values.get("_aliasName") or values.get("_name"),
                "gamePosition": [round(v, 2) for v in position],
                "fields": values,
            })
    return found, errors


def simplify(text):
    """Lower-case letters and digits only, for comparing names."""
    return re.sub(r"[^a-z0-9]", "", (text or "").lower())


def pair_with_mapgenie(rows, points):
    """Pair rows with MapGenie points one to one, closest first, within PAIR_DISTANCE."""
    candidates = []
    for r, row in enumerate(rows):
        abyss = row["gamePosition"][1] > 1500
        for p, point in enumerate(points):
            if (point.get("world") == "Abyss") != abyss:
                continue
            distance = math.hypot(point["x"] - row["gamePosition"][0], point["z"] - row["gamePosition"][2])
            if distance <= PAIR_DISTANCE:
                candidates.append((distance, r, p))
    used_rows, used_points = set(), set()
    for distance, r, p in sorted(candidates):
        if r in used_rows or p in used_points:
            continue
        used_rows.add(r)
        used_points.add(p)
        point = points[p]
        rows[r].update(mapGenieId=point["id"], mapGenieName=point["name"], region=point.get("region"),
                       mapGenieDistance=round(distance, 1),
                       mapGenieNameMatches=simplify(point["name"]) == simplify(rows[r]["englishName"]))
    return used_points


def survey_save(path, rows, knowledge, items):
    """Return what one save copy records for the fragments."""
    objects = saves.load_save(path)
    known = {}
    for container in saves.top(objects, "KnowledgeSaveData"):
        for entry in container["_list"]:
            known[entry["_key"]] = entry.get("_level")
    chip_known = {key: level for key, level in known.items() if key in knowledge}

    uuids = {tuple(row["uuid"][:3]) for row in rows}
    # A UUID is only unique within its level, so a field record must also name the chip's level.
    placed = {(tuple(row["uuid"][:3]), row["level"].lower()) for row in rows}
    field, disabled, field_gimmicks = 0, 0, Counter()
    for container in saves.top(objects, "FieldSaveData"):
        for record in container.get("_fieldGimmickSaveDataList") or []:
            level = str(record.get("_ownerLevelName", "")).lower()
            if (tuple(record.get("_levelOriginSceneObjectUuid") or ())[:3], level) in placed:
                field += 1
                field_gimmicks[str(record.get("_gimmickInfoKey"))] += 1
            disabled += sum(1 for uuid in record.get("_levelOrigin_disabledSceneObjectUuidList") or []
                            if (tuple(uuid)[:3], level) in placed)
    landmark = saves.landmark_records(objects)
    bells = [record for uuid, record in landmark.items() if uuid[:3] in uuids]
    bells_by_type = Counter(str(record.get("_levelGimmickSceneObjectInfoKey")) for record in landmark.values()
                            if record.get("_levelGimmickSceneObjectInfoKey") in CHIP_LANDMARKS)
    inventory = Counter(
        items[entry["_itemKey"]]["name"]
        for container in saves.top(objects, "InventorySaveData")
        for bag in container["_inventorylist"]
        for entry in bag.get("_itemList") or []
        if entry.get("_itemKey") in items)

    per_fragment = {row["knowledgeKey"]: chip_known.get(row["knowledgeKey"]) for row in rows if row["knowledgeKey"]}
    return {
        "save": path.name,
        "chipKnowledgeEntries": len(chip_known),
        "chipKnowledgeLevels": dict(Counter(str(level) for level in chip_known.values())),
        "placedFragmentsKnown": sum(1 for level in per_fragment.values() if level is not None),
        "byKind": dict(Counter(kind(knowledge[key]["name"]) for key in chip_known)),
        "fieldRecordsForChipUuids": field,
        "fieldRecordGimmicks": dict(field_gimmicks),
        "disabledListHitsForChipUuids": disabled,
        "bellsListRecordsForChipUuids": len(bells),
        "bellsListRecordsOfChipTypes": dict(bells_by_type),
        "chipItemsInInventory": dict(inventory),
        "knowledgeLevelPerPlacedFragment": {str(key): level for key, level in per_fragment.items()},
    }


def kind(name):
    """Group a knowledge name: plain, BossRematch or Alustin_Journal."""
    lower = name.lower()
    if "bossrematch" in lower:
        return "BossRematch"
    if "alustin_journal" in lower:
        return "Alustin_Journal"
    return "plain"


def main():
    """Find, link and pair the fragments, read the saves and write the analysis file."""
    knowledge = chip_knowledge()
    items = chip_items(knowledge)
    rows, errors = scan_levels(items, knowledge)

    # Landmark list link by UUID (first three words).
    table = {tuple(item["uuid"]): item for item in landmarks.landmark_objects() if item["type"] in CHIP_LANDMARKS}
    for row in rows:
        mark = table.get(tuple(row["uuid"][:3]))
        row["landmarkType"] = mark["type"] if mark else None

    points = [point for point in landmarks.mapgenie_points() if point.get("category") == MAPGENIE_CATEGORY]
    used = pair_with_mapgenie(rows, points)

    # Knowledge entries matched to MapGenie points by English name alone.
    by_english = {}
    for key, entry in knowledge.items():
        by_english.setdefault(simplify(entry["english"]), []).append(key)
    name_matched = {point["id"]: by_english.get(simplify(point["name"]), []) for point in points}
    placed_keys = {row["knowledgeKey"] for row in rows if row["knowledgeKey"]}
    named_keys = {key for keys in name_matched.values() for key in keys}

    paths = [Path(arg) for arg in SAVE_ARGS] or sorted(SAVE_FOLDER.glob("*.save"))
    surveys = [survey_save(path, rows, knowledge, items) for path in paths]

    summary = {
        "knowledgeEntries": dict(Counter(kind(entry["name"]) for entry in knowledge.values())),
        "chipItems": len(items),
        "chipItemsWithoutKnowledge": [item["name"] for item in items.values() if not item["knowledgeKey"]],
        "placements": len(rows),
        "placementsByPrefab": dict(Counter(row["prefab"] for row in rows)),
        "placementsByKind": dict(Counter(kind(row["gameName"]) if row["gameName"] else "unlinked" for row in rows)),
        "placementsLinkedToKnowledge": sum(1 for row in rows if row["knowledgeKey"]),
        "distinctKnowledgePlaced": len(placed_keys),
        "placementsWithLandmark": dict(Counter(str(row["landmarkType"]) for row in rows)),
        "landmarkObjects": dict(Counter(item["type"] for item in table.values())),
        "landmarkObjectsWithoutPlacement": len(set(table) - {tuple(row["uuid"][:3]) for row in rows}),
        "mapGeniePoints": len(points),
        "pairedWithMapGenie": len(used),
        "pairedNameAgrees": sum(1 for row in rows if row.get("mapGenieNameMatches")),
        "mapGeniePointsMatchedByName": sum(1 for keys in name_matched.values() if keys),
        "readErrors": len(errors),
    }
    unplaced = [{"knowledgeKey": key, "gameName": entry["name"], "englishName": entry["english"],
                 "kind": kind(entry["name"]), "mapGenieByName": key in named_keys}
                for key, entry in sorted(knowledge.items()) if key not in placed_keys]
    unmatched_points = [{"mapGenieId": point["id"], "name": point["name"], "region": point.get("region"),
                         "world": point.get("world"), "knowledgeByName": name_matched[point["id"]],
                         "description": point.get("description")}
                        for point in points if point["id"] not in {row.get("mapGenieId") for row in rows}]

    output = {
        "summary": summary,
        "linkRule": "Plain chip: bare SceneObject, SpawnComponent._itemKey = a Visione_Chip_* item whose iteminfo row "
                    "holds the knowledge key as a u32. Boss-rematch chip: gimmick_item_basic_visione_chip_bossrematch* "
                    "prefab, GimmickSpawnDataComponent._spawnReason BossRematch_<Boss> = "
                    "Knowledge_Visione_Chip_BossRematch_<Boss>.",
        "fragments": [{key: value for key, value in row.items() if key != "fields"} for row in rows],
        "unplacedKnowledgeEntries": unplaced,
        "unmatchedMapGeniePoints": unmatched_points,
        "rawFieldSamples": [{"prefab": row["prefab"], "level": row["level"], "fields": row["fields"]}
                            for row in (rows[:1] + [r for r in rows if "bossrematch" in r["prefab"]][:1] + rows[-1:])],
        "saves": surveys,
        "errors": errors[:50],
    }
    target = ROOT / "research" / "analysis" / "memory-fragment-survey.json"
    target.write_text(json.dumps(output, indent=1, ensure_ascii=False, default=str) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))
    for survey in surveys:
        print({key: value for key, value in survey.items() if key != "knowledgeLevelPerPlacedFragment"})
    print(f"wrote {target.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
