"""Read exact world anchors and spawned NPCs from quest sequencer (.paseq) files.

What it does:
    A .paseq file is a reflection-format timeline (same field/type encoding as level files,
    but the 16-byte header has no "PARC" tag, so the parser is started at offset 16 with
    shared strings on). Its root object "Sequencer" has _sequencerTransform: ten numbers
    = scale xyz, rotation quaternion xyzw, position xyz. The last three are the script's
    world anchor in the same coordinates as the map. The file also lists spawned
    characters (ActorTrackNodeData_SpawnCharacter._spawnCharacterKey, a characterinfo key)
    and gimmicks, which gives the NPCs of a quest scene (givers, targets).
    This script reads every script referenced by a stage row, then joins
    stage -> mission -> quest to give each an exact position and NPC list.
    Positions replace the earlier heuristic float scan.
Reads:  game install (read-only, pack group 0014), staticinfo tables, mission_parser.py,
        faction-node-positions.json, stage/mission/quest links.
Writes: paseq-anchors.json, exact-quest-positions.json, exact-mission-positions.json,
        exact-position-coverage.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/paseq_anchors.py
"""
import json
import math
import statistics
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
sys.path.insert(0, str(HERE))
for sub in ("pycrimson/src", "bier-src"):
    sys.path.insert(0, str(ROOT / "research" / "vendor" / sub))
import decode_level_gates as gates  # noqa: E402
import mission_parser as parser  # noqa: E402
from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
PACK_LIST = ROOT / "research" / "vendor" / "work" / "pack-files.txt"


def in_world(x, y, z):
    """True for a position inside the map box used elsewhere in this folder."""
    return (all(map(math.isfinite, (x, y, z))) and -13500 < x < 500 and -7500 < z < 4000
            and -200 < y < 2500 and (abs(x) > 1 or abs(z) > 1))


def collect(value, wanted, out):
    """Collect every dict of the wanted type names from a nested object."""
    if isinstance(value, dict):
        if value.get("__pycr_type__") in wanted:
            out.append(value)
        for inner in value.values():
            collect(inner, wanted, out)
    elif isinstance(value, list):
        for inner in value:
            collect(inner, wanted, out)


def parse_script(data):
    """Return anchor, rotation, spawned character keys and gimmick keys of one .paseq."""
    stream = EndianedBytesIO(data)
    stream.seek(16)
    root = ReflectionParser(stream, has_shared_strings=True).objects[0]
    transform = root.get("_sequencerTransform") or []
    anchor = None
    if len(transform) >= 10 and in_world(*transform[7:10]):
        anchor = [round(v, 2) for v in transform[7:10]]
    spawns, gimmicks = [], []
    found = []
    collect(root, {"ActorTrackNodeData_SpawnCharacter", "GimmickActorTrackNode"}, found)
    for item in found:
        if item["__pycr_type__"] == "ActorTrackNodeData_SpawnCharacter":
            spawns.append(item.get("_spawnCharacterKey"))
        else:
            gimmicks.append(item.get("_gimmickKey"))
    return {"anchor": anchor, "rotation": [round(v, 3) for v in transform[3:7]] if transform else None,
            "characters": [k for k in spawns if isinstance(k, int)],
            "gimmicks": [k for k in gimmicks if isinstance(k, int)]}


# ---- scripts referenced by stage rows
paseq_path = {}
for line in PACK_LIST.open(encoding="utf-8"):
    line = line.strip()
    if line.endswith(".paseq"):
        path = line.split(" ", 1)[1]
        paseq_path[path.rsplit("/", 1)[1][:-6].lower()] = path
stage_rows = gates.load_table("stageinfo")
stage_script = {}
for key, row in stage_rows.items():
    s, _ = parser.parse_stage_prefix(row)
    if s["s1"]:
        stage_script[key] = s["s1"].lower()

context = PackageContext(GAME, pack_group_whitelist=["0014"])
anchors, failures = {}, Counter()
for script in sorted({s for s in stage_script.values() if s in paseq_path}):
    data = context.get_file(paseq_path[script])
    if not data:
        failures["noData"] += 1
        continue
    try:
        anchors[script] = parse_script(data)
    except Exception as error:  # noqa: BLE001 - count parse failures, keep going
        failures[type(error).__name__] += 1
(HERE / "paseq-anchors.json").write_text(json.dumps(anchors, indent=0), encoding="utf-8")

# ---- character names
character_names = {k: gates.row_name(r) or "" for k, r in gates.load_table("characterinfo").items()}

# ---- join stage -> mission -> quest
mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}


def summarize(stage_keys):
    """Median anchor, spread, and NPC names over the stages' scripts."""
    points, npcs = [], Counter()
    for stage in stage_keys:
        info = anchors.get(stage_script.get(stage))
        if not info:
            continue
        if info["anchor"]:
            points.append(info["anchor"])
        for key in info["characters"]:
            if key in character_names:
                npcs[character_names[key]] += 1
    if not points:
        return None
    return {"x": round(statistics.median(p[0] for p in points), 1),
            "y": round(statistics.median(p[1] for p in points), 1),
            "z": round(statistics.median(p[2] for p in points), 1),
            "scripts": len(points),
            "spreadX": round(max(p[0] for p in points) - min(p[0] for p in points)),
            "spreadZ": round(max(p[2] for p in points) - min(p[2] for p in points)),
            "npcs": [n for n, _ in npcs.most_common(8)]}


mission_stages, mission_loc = {}, {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    stages = [e["key"] for e in m["list28"]] + list(m["blk_b8"]["l1"])
    for entry in m["list1a0"]:
        stages += entry["l1"]
    mission_stages[key] = stages
    loc = summarize(stages)
    if loc:
        mission_loc[mission_names[key]] = loc
quest_loc, quest_group = {}, {}
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    quest_group[quest_names[key]] = q["h58"]
    stages = list(q["keyList_e0"])
    for mission in q["keyList_d0"]:
        stages += mission_stages.get(mission, [])
    loc = summarize(stages)
    if loc:
        quest_loc[quest_names[key]] = loc
(HERE / "exact-quest-positions.json").write_text(json.dumps(quest_loc, indent=1), encoding="utf-8")
(HERE / "exact-mission-positions.json").write_text(json.dumps(mission_loc, indent=1), encoding="utf-8")

# ---- validation against faction nodes and other sources
nodes = json.loads((HERE / "faction-node-positions.json").read_text(encoding="utf-8"))
node_dist = []
for name, loc in quest_loc.items():
    if name.startswith("Quest_Node_"):
        node = "Node_" + name[len("Quest_Node_"):]
        while node and node not in nodes:
            node = node.rsplit("_", 1)[0] if "_" in node else ""
        if node:
            node_dist.append(math.hypot(loc["x"] - nodes[node]["x"], loc["z"] - nodes[node]["z"]))
stage_xyz = json.loads((HERE / "quest-locations.json").read_text(encoding="utf-8"))
xyz_dist = [math.hypot(loc["x"] - stage_xyz[n]["x"], loc["z"] - stage_xyz[n]["z"])
            for n, loc in quest_loc.items() if n in stage_xyz]
road = json.loads((HERE / "quest-road-locations.json").read_text(encoding="utf-8"))
road_dist = [math.hypot(loc["x"] - road[n]["x"], loc["z"] - road[n]["z"])
             for n, loc in quest_loc.items() if n in road]


def stats(values):
    """Pairs, median and share within 500 for a list of distances."""
    return {"pairs": len(values), "median": round(statistics.median(values)) if values else None,
            "within500": sum(1 for v in values if v < 500)}


def system(name):
    """True for non-player quest rows."""
    return name.startswith(("LevelSequencerSpawn", "cd_", "Func_", "Schedule_", "ReBlockading", "Shop_"))


main = {n for n, g in quest_group.items() if 1000 <= g <= 1013}
player = [n for n in quest_names.values() if n and not system(n)]
report = {
    "scriptsParsed": len(anchors), "scriptsFailed": dict(failures),
    "scriptsWithAnchor": sum(1 for a in anchors.values() if a["anchor"]),
    "scriptsWithCharacters": sum(1 for a in anchors.values() if a["characters"]),
    "questsWithExactPosition": len(quest_loc),
    "playerQuests": len(player),
    "playerQuestsWithExactPosition": sum(1 for n in player if n in quest_loc),
    "mainChapterQuestsWithExactPosition": sum(1 for n in main if n in quest_loc),
    "mainChapterQuests": len(main),
    "questNodeWithExactPosition": sum(1 for n in quest_loc if n.startswith("Quest_Node")),
    "questFactionWithExactPosition": sum(1 for n in quest_loc if n.startswith("Quest_Faction")),
    "missionsWithExactPosition": len(mission_loc), "missions": len(mission_names),
    "plainMissionsWithExactPosition": sum(1 for n in mission_loc if n.startswith("Mission_")),
    "challengeMissionsWithExactPosition": sum(1 for n in mission_loc if n.startswith("Challenge_")),
    "questsWithNpcNames": sum(1 for v in quest_loc.values() if v["npcs"]),
    "accuracy": {"vsFactionNode": stats(node_dist), "vsStageXYZ": stats(xyz_dist),
                 "vsRoadFiles": stats(road_dist)},
}
(HERE / "exact-position-coverage.json").write_text(json.dumps(report, indent=1), encoding="utf-8")
print(json.dumps(report, indent=1))
