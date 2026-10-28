"""Find quest and mission positions through their sequencer path files (read-only).

What it does:
    Quest and mission stages are scripted: each stage row names a sequencer script
    ("cd_seq_quest_greywolf_camp_1300") instead of holding a position. The game ships
    path files for these scripts (gamedata/road/rootlevel/sequencer/<script>.road): NPC
    walk routes with world positions. This script
      1. reads every sequencer .road file from the user's own game install (pack group
         0008, read-only) and decodes its nodes (same node layout as
         extract_road_graph.py),
      2. links a stage to road files by the stage's sequencer name: exact match, or the
         road names that start with the stage's name stem (a script family),
      3. gives each mission and quest the median of the positions of its stages' roads,
      4. checks the result against known places (faction node positions).
Reads:  game install (read-only), staticinfo tables, mission_parser.py, faction-node-positions.json.
Writes: road-positions.json, mission-road-locations.json, quest-road-locations.json,
        road-location-validation.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/sequencer_positions.py
"""
import json
import math
import re
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
import extract_road_graph as roads  # noqa: E402
import mission_parser as parser  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
PACK_LIST = ROOT / "research" / "vendor" / "work" / "pack-files.txt"

# ---- 1. decode every sequencer road file
context = PackageContext(GAME, pack_group_whitelist=["0008"])
paths = [line.split(" ", 1)[1].strip() for line in PACK_LIST.open(encoding="utf-8")
         if "sequencer" in line and line.rstrip().endswith(".road")]
road_pos = {}
for path in paths:
    base = path.rsplit("/", 1)[1][:-5].lower()
    data = context.get_file(path)
    if not data:
        continue
    offset = roads.find_node_section(data, 0, len(data))
    if offset is None:
        continue
    nodes, _ = roads.read_nodes(data, offset)
    if nodes:
        xs = [n["x"] for n in nodes]
        zs = [n["z"] for n in nodes]
        ys = [n["y"] for n in nodes]
        road_pos[base] = {"x": round(nodes[0]["x"], 1), "y": round(nodes[0]["y"], 1),
                          "z": round(nodes[0]["z"], 1), "nodes": len(nodes),
                          "minX": round(min(xs)), "maxX": round(max(xs)),
                          "minZ": round(min(zs)), "maxZ": round(max(zs)),
                          "medianY": round(statistics.median(ys), 1)}
(HERE / "road-positions.json").write_text(json.dumps(road_pos, indent=1), encoding="utf-8")

road_names = sorted(road_pos)


def roads_for(script):
    """Road files for a stage's sequencer script: exact, else the script-family prefix."""
    script = script.lower()
    if script in road_pos:
        return [script], "exact"
    family = re.sub(r"_\d+(_\d+)?(_dlc)?$", "", script)
    found = [name for name in road_names if name.startswith(family + "_") or name == family]
    return found, "family" if found else "none"


# ---- 2. stage rows -> sequencer names
stage_rows = gates.load_table("stageinfo")
stage_script = {}
for key, row in stage_rows.items():
    s, _ = parser.parse_stage_prefix(row)
    if s["s1"]:
        stage_script[key] = s["s1"]


def position_from_stages(stage_keys):
    """Median start position of the roads behind a set of stages; also the link quality."""
    points, quality = [], Counter()
    for stage in stage_keys:
        script = stage_script.get(stage)
        if not script:
            continue
        found, how = roads_for(script)
        quality[how] += 1
        # Use at most 6 family members per stage so a big family does not dominate.
        for name in found[:6]:
            points.append((road_pos[name]["x"], road_pos[name]["y"], road_pos[name]["z"]))
    if not points:
        return None
    return {"x": round(statistics.median(p[0] for p in points), 1),
            "y": round(statistics.median(p[1] for p in points), 1),
            "z": round(statistics.median(p[2] for p in points), 1),
            "roadPoints": len(points), "link": dict(quality),
            "spreadX": round(max(p[0] for p in points) - min(p[0] for p in points)),
            "spreadZ": round(max(p[2] for p in points) - min(p[2] for p in points))}


mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
mission_stages = {}
mission_loc = {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    stages = [e["key"] for e in m["list28"]] + list(m["blk_b8"]["l1"])
    for entry in m["list1a0"]:
        stages += entry["l1"]
    mission_stages[key] = stages
    loc = position_from_stages(stages)
    if loc:
        mission_loc[mission_names[key]] = loc

quest_loc = {}
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    stages = list(q["keyList_e0"])
    for mission in q["keyList_d0"]:
        stages += mission_stages.get(mission, [])
    loc = position_from_stages(stages)
    if loc:
        quest_loc[quest_names[key]] = loc

# ---- 3. validation against faction nodes
nodes = json.loads((HERE / "faction-node-positions.json").read_text(encoding="utf-8"))
distances = []
for name, loc in quest_loc.items():
    if name.startswith("Quest_Node_"):
        node = "Node_" + name[len("Quest_Node_"):]
        while node and node not in nodes:
            node = node.rsplit("_", 1)[0] if "_" in node else ""
        if node:
            distances.append(math.hypot(loc["x"] - nodes[node]["x"], loc["z"] - nodes[node]["z"]))


def share(names, prefix):
    return sum(1 for n in names if n.startswith(prefix))


report = {
    "roadFilesRead": len(paths), "roadFilesDecoded": len(road_pos),
    "stagesWithScript": len(stage_script),
    "missionsWithRoadPosition": len(mission_loc), "missions": len(mission_rows),
    "questsWithRoadPosition": len(quest_loc), "quests": len(quest_rows),
    "byGroup": {
        "mainChapterQuestsWithPosition": sum(
            1 for k, r in quest_rows.items() if quest_names[k] in quest_loc and
            1000 <= parser.parse_quest_prefix(r)[0]["h58"] <= 1013
            ) if True else 0,
        "Quest_NodeWithPosition": share(quest_loc, "Quest_Node"),
        "Quest_FactionWithPosition": share(quest_loc, "Quest_Faction"),
        "Challenge_missionsWithPosition": share(mission_loc, "Challenge_"),
        "Mission_missionsWithPosition": share(mission_loc, "Mission_"),
    },
    "nodeQuestDistanceCheck": {
        "pairs": len(distances),
        "median": round(statistics.median(distances)) if distances else None,
        "within500": sum(1 for d in distances if d < 500),
        "within2000": sum(1 for d in distances if d < 2000)},
}
(HERE / "mission-road-locations.json").write_text(json.dumps(mission_loc, indent=1), encoding="utf-8")
(HERE / "quest-road-locations.json").write_text(json.dumps(quest_loc, indent=1), encoding="utf-8")
(HERE / "road-location-validation.json").write_text(json.dumps(report, indent=1), encoding="utf-8")
print(json.dumps(report, indent=1))
