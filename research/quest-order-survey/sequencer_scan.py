"""Scan quest sequencer scripts for world positions and merge all position sources.

What it does:
    A stage row names its sequencer script (for example "cd_seq_quest_greywolf_camp_1300").
    About half of those scripts ship as .paseq files under sequencer/ in the user's game
    install (pack group 0014, read-only). The .paseq format is not decoded, so this
    script scans the raw bytes for three consecutive floats that look like a world
    position (x, z inside the map, plausible height) - a heuristic that can pick up
    camera points too. Per quest/mission it keeps the median of those points.
    It then merges every position source per quest and mission, best first:
        1. faction node (name match)        - exact node coordinates
        2. sequencer road files             - NPC routes (sequencer_positions.py)
        3. paseq byte scan                  - heuristic (this script)
        4. stage row XYZ                    - quest_locations.py
    and reports coverage by content type and how often sources agree.
Reads:  game install (read-only), pack-files.txt, staticinfo tables, mission_parser.py,
        faction-node-positions.json, quest-road-locations.json, mission-road-locations.json,
        quest-locations.json, mission-locations.json, quest-locations-from-nodes.json.
Writes: paseq-points.json, merged-quest-positions.json, merged-mission-positions.json,
        merged-position-coverage.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/sequencer_scan.py
"""
import json
import math
import re
import statistics
import struct
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
from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
PACK_LIST = ROOT / "research" / "vendor" / "work" / "pack-files.txt"


def load(name):
    """Read one JSON result file of this folder."""
    return json.loads((HERE / name).read_text(encoding="utf-8"))


def plausible(x, y, z):
    """True for a world position inside the map (same box the mod's data uses)."""
    return (all(map(math.isfinite, (x, y, z))) and -13200 < x < -1 and -7100 < z < 3600
            and -50 < y < 1500 and abs(x) > 50 and abs(z) > 50)


# ---- paseq byte scan for every script named by a stage
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
script_points = {}
for script in sorted({s for s in stage_script.values() if s in paseq_path}):
    data = context.get_file(paseq_path[script])
    if not data:
        continue
    points = []
    for offset in range(0, len(data) - 12):
        x, y, z = struct.unpack_from("<3f", data, offset)
        if plausible(x, y, z):
            points.append((round(x, 1), round(y, 1), round(z, 1)))
    if points:
        script_points[script] = points
(HERE / "paseq-points.json").write_text(json.dumps(
    {k: v[:20] for k, v in script_points.items()}), encoding="utf-8")


def median_of(points):
    """Median x,y,z of a list of points."""
    return {"x": round(statistics.median(p[0] for p in points), 1),
            "y": round(statistics.median(p[1] for p in points), 1),
            "z": round(statistics.median(p[2] for p in points), 1)}


def scan_position(stage_keys):
    """Median of scanned points over the scripts behind these stages."""
    points = []
    for stage in stage_keys:
        points += script_points.get(stage_script.get(stage), [])[:8]
    if not points:
        return None
    loc = median_of(points)
    loc["points"] = len(points)
    return loc


# ---- stage keys per mission / quest (same links as sequencer_positions.py)
mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
mission_stages = {}
scan_mission = {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    stages = [e["key"] for e in m["list28"]] + list(m["blk_b8"]["l1"])
    for entry in m["list1a0"]:
        stages += entry["l1"]
    mission_stages[key] = stages
    loc = scan_position(stages)
    if loc:
        scan_mission[mission_names[key]] = loc
scan_quest = {}
quest_group = {}
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    quest_group[quest_names[key]] = q["h58"]
    stages = list(q["keyList_e0"])
    for mission in q["keyList_d0"]:
        stages += mission_stages.get(mission, [])
    loc = scan_position(stages)
    if loc:
        scan_quest[quest_names[key]] = loc

# ---- merge, best source first
nodes_by_quest = load("quest-locations-from-nodes.json")
sources = {
    "quest": [("node", nodes_by_quest), ("road", load("quest-road-locations.json")),
              ("paseqScan", scan_quest), ("stageXYZ", load("quest-locations.json"))],
    "mission": [("node", nodes_by_quest), ("road", load("mission-road-locations.json")),
                ("paseqScan", scan_mission), ("stageXYZ", load("mission-locations.json"))],
}
merged = {"quest": {}, "mission": {}}
agree = defaultdict(list)
for kind, names in (("quest", quest_names.values()), ("mission", mission_names.values())):
    for name in names:
        found = [(label, src[name]) for label, src in sources[kind] if name in src]
        if not found:
            continue
        best_label, best = found[0]
        merged[kind][name] = {"x": best["x"], "y": best["y"], "z": best["z"],
                              "source": best_label,
                              "otherSources": [label for label, _ in found[1:]]}
        for label, loc in found[1:]:
            agree[(kind, best_label, label)].append(
                math.hypot(loc["x"] - best["x"], loc["z"] - best["z"]))

(HERE / "merged-quest-positions.json").write_text(json.dumps(merged["quest"], indent=1), encoding="utf-8")
(HERE / "merged-mission-positions.json").write_text(json.dumps(merged["mission"], indent=1), encoding="utf-8")


def count(kind, test):
    """How many merged entries of `kind` have a name that passes `test`."""
    return sum(1 for n in merged[kind] if test(n))


player_quest = lambda n: not n.startswith(("LevelSequencerSpawn", "cd_", "Func_", "Schedule_",  # noqa: E731
                                           "ReBlockading", "Shop_"))
main_names = {n for n, g in quest_group.items() if 1000 <= g <= 1013}
total_player = sum(1 for n in quest_names.values() if player_quest(n))
report = {
    "paseqScriptsScanned": len(script_points),
    "questsWithPosition": len(merged["quest"]), "quests": len(quest_names),
    "playerQuestsWithPosition": count("quest", player_quest), "playerQuests": total_player,
    "mainChapterQuestsWithPosition": sum(1 for n in main_names if n in merged["quest"]),
    "mainChapterQuests": len(main_names),
    "questNodeWithPosition": count("quest", lambda n: n.startswith("Quest_Node")),
    "questFactionWithPosition": count("quest", lambda n: n.startswith("Quest_Faction")),
    "missionsWithPosition": len(merged["mission"]), "missions": len(mission_names),
    "plainMissionsWithPosition": count("mission", lambda n: n.startswith("Mission_")),
    "challengeMissionsWithPosition": count("mission", lambda n: n.startswith("Challenge_")),
    "sourceMixQuests": dict(Counter(v["source"] for v in merged["quest"].values())),
    "sourceMixMissions": dict(Counter(v["source"] for v in merged["mission"].values())),
    "agreement": {f"{k[0]}:{k[1]} vs {k[2]}": {
        "pairs": len(v), "median": round(statistics.median(v)),
        "within500": sum(1 for d in v if d < 500)} for k, v in agree.items()},
}
(HERE / "merged-position-coverage.json").write_text(json.dumps(report, indent=1), encoding="utf-8")
print(json.dumps(report, indent=1))
