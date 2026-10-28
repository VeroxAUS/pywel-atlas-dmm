"""Survey Kuku Pot items (Abyss Cell, Power Core, Sanctum Core, Aeserion Scales) and the egg mounts.

What it does:
    1. Reads every level file in pack group 0015 that names one of the wanted
       gimmick prefabs and records each placed object: level, scene-object UUID,
       prefab, gimmick key (from gimmick-names.json), world position (children use
       the parent transform) and a few fields.
         - Bismuth Barriers:   Background_Breakable_bismuth_*
         - Abyss cores:        gimmick_abysscore_0001/0002, gimmick_attach_abyss_core_01..
         - Eggs:               gimmick_egg_kuku_0001, gimmick_egg_Wyvern_0001
         - Aeserion Scales:    gimmick_snake_boss_scales_01
    2. Pairs the placed objects one to one with MapGenie points of the matching
       category, closest first (MapGenie only pairs and names; the level position
       is the real one). The pairing shows which prefab each MapGenie name uses.
    3. Reads save copies (never the game's save folder) and says, per placed
       object, whether a field-object record or a disabled-list entry names its
       UUID in that level, and what it holds (reason, reset, broken flag).
    4. Looks for the Sanctum rule: Witch missions Mission_*_Witch_Normal_SanctumOf*
       (state 5 = done) and Knowledge_Node_*Sanctum* entries, per Sanctum name.

Reads:  the installed game's level packs (group 0015), research/vendor/work/
        {pack-files.txt, gimmick-names.json, staticinfo}, data/poi-data.js,
        save copies (default: research/vendor/work/late-saves/*/save.save)
Writes: research/analysis/kuku-item-survey.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/survey_kuku_items.py [A.save ...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import re
import sys
import time
from collections import Counter, defaultdict
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
from find_chest_contents import load_table  # noqa: E402
from find_memory_fragments import placed_objects  # noqa: E402
from find_treasure_chests import GAME, PackageContext, parse_level  # noqa: E402
from scan_ground_items import fields  # noqa: E402

PAIR_DISTANCE = 80.0
# Lower-case prefab file names we want, as a regex on the file name without ".prefab".
WANTED = re.compile(
    r"^(background_breakable_bismuth.*|gimmick_attach_spot_tower_bismuth_\d+_break|gimmick_attach_landspider_bismuth_\d+|gimmick_dragon_bismuth_core_\d+|gimmick_abysscore_\d+|gimmick_attach_abyss_core_\d+"
    r"|gimmick_egg_kuku_\d+|gimmick_egg_wyvern_\d+|gimmick_snake_boss_scales_\d+"
    r"|gimmick_puzzle_antumbra_tokamak_\d+_parts\d+"  # Sanctum Cores (16)
    r"|gimmick_abyss_conductor_battery_part_01_reward|gimmick_abyss_recover_control_device_01_plug"
    r"|gimmick_abyss_visione_platform_gravitator_01_core"  # other "Abyss Cell" gimmicks
    r"|abyss_ator_dungeon_blackstone_\d+|hyperspace_barrage_main_turret_core_01"  # other "Power Core" gimmicks
    r"|gimmick_marni_teleportation_\d+.*|gimmick_marni_chargestation_03.*)$")  # Marni's Transporters
QUICK_TEST = (b"background_breakable_bismuth", b"spot_tower_bismuth", b"attach_landspider_bismuth_", b"dragon_bismuth_core", b"gimmick_abysscore", b"gimmick_attach_abyss_core",
              b"gimmick_egg_kuku", b"gimmick_egg_wyvern", b"gimmick_snake_boss_scales",
              b"antumbra_tokamak", b"gimmick_abyss_conductor_battery_part_01_reward",
              b"gimmick_abyss_recover_control_device_01_plug", b"gimmick_abyss_visione_platform_gravitator_01_core",
              b"abyss_ator_dungeon_blackstone", b"hyperspace_barrage_main_turret_core_01",
              b"gimmick_marni_teleportation", b"gimmick_marni_chargestation_03")
DEFAULT_SAVES = sorted((VENDOR / "work" / "late-saves").glob("*/save.save"))


def prefab_group(prefab):
    """Group name: the prefab name with number runs collapsed to N (keeps Sanctum Cores distinct by suffix)."""
    return re.sub(r"\d+", "N", prefab.lower())


def scan_levels(gimmick_keys):
    """Return every wanted placed object from the level files."""
    paths = [line.split(" ", 1)[1].strip()
             for line in (VENDOR / "work" / "pack-files.txt").read_text(encoding="utf-8").splitlines()
             if line.rstrip().endswith(".palevel")]
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    found, seen, errors = [], set(), []
    started = time.time()
    for index, path in enumerate(paths):
        if index % 4000 == 0:
            print(f"{index}/{len(paths)} levels, {len(found)} objects, {time.time() - started:.0f}s", flush=True)
        try:
            data = context.get_file(path)
        except Exception as error:  # A pack read failure is reported, not fatal.
            errors.append(f"{path}: {error}")
            continue
        lower = data.lower()
        if not any(token in lower for token in QUICK_TEST):
            continue
        for item, position, parent_prefab in placed_objects(parse_level(data)):
            prefab = str(item.get("__pycr_type__")).rsplit("/", 1)[-1]
            prefab = prefab[:-len(".prefab")] if prefab.endswith(".prefab") else prefab
            if not WANTED.match(prefab.lower()):
                continue
            uuid = list(item.get("_sceneObjectUuid") or [])
            if (tuple(uuid), path) in seen:
                continue
            seen.add((tuple(uuid), path))
            values = fields(item)
            found.append({
                "prefab": prefab,
                "group": prefab_group(prefab),
                "gimmickKey": gimmick_keys.get(prefab.lower()),
                "uuid": uuid,
                "level": path.rsplit("/", 1)[-1][:-len(".palevel")],
                "parentPrefab": parent_prefab.rsplit("/", 1)[-1] if parent_prefab else None,
                "alias": values.get("_aliasName") or values.get("_name"),
                "gamePosition": [round(v, 2) for v in position],
                "inAbyss": position[1] > 1500,
                "fields": {k: v for k, v in list(values.items())[:12]},
            })
    return found, errors


def pair(rows, points):
    """Pair rows with points one to one, closest first, within PAIR_DISTANCE; same world only."""
    candidates = []
    for r, row in enumerate(rows):
        for p, point in enumerate(points):
            if (point.get("world") == "Abyss") != row["inAbyss"]:
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
        rows[r].update(mapGenieId=points[p]["id"], mapGenieName=points[p]["name"],
                       mapGenieCategory=points[p]["category"], mapGenieRegion=points[p].get("region"),
                       mapGenieDistance=round(distance, 1))
    return used_points


def survey_save(path, rows):
    """Return per-object save records for one save copy."""
    objects = saves.load_save(path)
    placed = {(tuple(row["uuid"][:3]), row["level"].lower()): index for index, row in enumerate(rows)}
    hits = defaultdict(list)
    for container in saves.top(objects, "FieldSaveData"):
        for record in container.get("_fieldGimmickSaveDataList") or []:
            level = str(record.get("_ownerLevelName", "")).lower()
            index = placed.get((tuple(record.get("_levelOriginSceneObjectUuid") or ())[:3], level))
            if index is not None:
                hits[index].append({
                    "kind": "field",
                    "gimmickInfoKey": record.get("_gimmickInfoKey"),
                    "reason": record.get("_fieldSaveDataReason"),
                    "resetNever": record.get("_resetTimeSecondsOfDays") == 0xFFFFFFFFFFFFFFFF,
                    "isBroken": record.get("_isBroken"),
                    "initStateNameHash": record.get("_initStateNameHash"),
                })
            for uuid in record.get("_levelOrigin_disabledSceneObjectUuidList") or []:
                index = placed.get((tuple(uuid)[:3], level))
                if index is not None:
                    hits[index].append({"kind": "disabledList", "ownerGimmick": record.get("_gimmickInfoKey")})
    landmark = saves.landmark_records(objects)
    landmark_hits = {}
    for uuid, record in landmark.items():
        for (row_uuid, _), index in placed.items():
            if row_uuid == tuple(uuid)[:3]:
                landmark_hits.setdefault(index, []).append(
                    {"type": record.get("_levelGimmickSceneObjectInfoKey"), "completed": record.get("_isCompleted")})
    return {"save": f"{path.parent.name}/{path.name}", "fieldHits": hits, "landmarkHits": landmark_hits,
            "objects": objects}


def table_names(table):
    """Return {key: name} for a static table."""
    return {key: landmarks.row_name(row) for key, row in load_table(table).items() if landmarks.row_name(row)}


def sanctum_rules(objects_per_save):
    """Find Sanctum missions and knowledge entries and their state in each save."""
    missions = {key: name for key, name in table_names("missioninfo").items()
                if re.search(r"sanctum", name, re.I)}
    knowledge = {key: name for key, name in table_names("knowledgeinfo").items()
                 if re.search(r"sanctum", name, re.I)}
    states = {}
    for label, objects in objects_per_save.items():
        mission_state = {}
        for container in saves.top(objects, "QuestSaveData"):
            for record in container["_missionStateList"]:
                if record.get("_key") in missions:
                    mission_state[record["_key"]] = record.get("_state")
        known = {}
        for container in saves.top(objects, "KnowledgeSaveData"):
            for entry in container["_list"]:
                if entry["_key"] in knowledge:
                    known[entry["_key"]] = entry.get("_level")
        states[label] = {"missions": mission_state, "knowledge": known}
    return missions, knowledge, states


def main():
    """Scan, pair, survey saves and write the analysis file."""
    names = json.loads((VENDOR / "work" / "gimmick-names.json").read_text(encoding="utf-8"))
    gimmick_keys = {name.lower(): int(key) for key, name in names.items()}
    rows, errors = scan_levels(gimmick_keys)

    points_all = landmarks.mapgenie_points()
    kuku_points = [p for p in points_all if p.get("category") == "Kuku Pot Item"]
    egg_points = [p for p in points_all if p.get("category") == "Mount" and re.search(r"egg", p["name"], re.I)]
    barrier_points = [p for p in points_all if p.get("category") == "Hidden Passage" and "Bismuth Barrier" in p["name"]]
    barrier_rows = [r for r in rows if "bismuth" in r["group"]]
    used_barrier = pair(barrier_rows, barrier_points)
    egg_rows = [r for r in rows if "egg_" in r["group"]]
    pot_rows = [r for r in rows if "egg_" not in r["group"] and "bismuth" not in r["group"]]
    used_pot = pair(pot_rows, kuku_points)
    used_egg = pair(egg_rows, egg_points)

    paths = [Path(arg) for arg in SAVE_ARGS] or DEFAULT_SAVES
    surveys, loaded = [], {}
    for path in paths:
        survey = survey_save(path, rows)
        loaded[survey["save"]] = survey.pop("objects")
        surveys.append(survey)
    missions, knowledge, sanctum_states = sanctum_rules(loaded)

    # Per MapGenie name: how many points, how many paired, and how many paired objects have a record
    # in the first (completed) save.
    completed = surveys[0] if surveys else None
    by_point = defaultdict(lambda: {"points": 0, "paired": 0, "withRecord": 0, "prefabs": Counter()})
    for point in kuku_points + egg_points:
        by_point[(point["category"], point["name"])]["points"] += 1
    for index, row in enumerate(rows):
        if "mapGenieName" not in row:
            continue
        entry = by_point[(row["mapGenieCategory"], row["mapGenieName"])]
        entry["paired"] += 1
        entry["prefabs"][row["prefab"]] += 1
        if completed and completed["fieldHits"].get(index):
            entry["withRecord"] += 1

    summary = {
        "levelFilesReadErrors": len(errors),
        "placedObjects": len(rows),
        "byGroup": dict(Counter(r["group"] for r in rows)),
        "byPrefab": dict(Counter(r["prefab"] for r in rows)),
        "kukuPotPoints": len(kuku_points), "kukuPotPaired": len(used_pot),
        "barrierPoints": len(barrier_points), "barrierRows": len(barrier_rows), "barrierPaired": len(used_barrier),
        "barrierRowsByPrefab": dict(Counter(r["prefab"] for r in barrier_rows)),
        "eggPoints": len(egg_points), "eggPaired": len(used_egg),
        "unpairedObjectsByGroup": dict(Counter(r["group"] for r in rows if "mapGenieName" not in r)),
        "pairedByCategoryName": {f"{c} / {n}": {**v, "prefabs": dict(v["prefabs"])} for (c, n), v in sorted(by_point.items())},
    }
    unmatched = [{"id": p["id"], "name": p["name"], "region": p.get("region"), "world": p.get("world")}
                 for i, p in enumerate(kuku_points) if i not in used_pot] + \
                [{"id": p["id"], "name": p["name"], "region": p.get("region"), "world": p.get("world")}
                 for i, p in enumerate(egg_points) if i not in used_egg]
    output = {
        "summary": summary,
        "objects": [dict(row, saveRecords={s["save"]: s["fieldHits"].get(i, []) for s in surveys},
                         saveLandmarks={s["save"]: s["landmarkHits"].get(i, []) for s in surveys})
                    for i, row in enumerate(rows)],
        "unmatchedMapGeniePoints": unmatched,
        "sanctum": {"missions": missions, "knowledge": knowledge, "states": sanctum_states},
        "errors": errors[:50],
    }
    target = ROOT / "research" / "analysis" / "kuku-item-survey.json"
    target.write_text(json.dumps(output, indent=1, ensure_ascii=False, default=str) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))
    print(f"wrote {target.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
