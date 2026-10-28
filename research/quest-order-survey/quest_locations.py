"""Give every quest and mission a world position and a region, from decoded stage rows.

What it does:
    - stageinfo rows carry a world XYZ near their start (parse_stage_prefix).
    - A mission lists its stages (list28 keys); a quest lists its stages (keyList_e0) and
      its missions. A mission position is the median of its stages' positions; a quest
      position is the median of its stages and its start mission's stages.
    - Region = the nearest faction node's region code (Her, Dem, Del, Kwe, Crim, ...).
    - Check: for node missions the stage position should lie near the faction node.
Reads:  staticinfo tables, mission_parser.py, faction-node-positions.json.
Writes: quest-locations.json, mission-locations.json, location-validation.json.
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/quest_locations.py
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
import decode_level_gates as gates  # noqa: E402
import mission_parser as parser  # noqa: E402

stage_rows = gates.load_table("stageinfo")
mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
nodes = json.loads((HERE / "faction-node-positions.json").read_text(encoding="utf-8"))


def usable(xyz):
    """True when a decoded position is a plausible world coordinate."""
    x, y, z = xyz
    return (all(math.isfinite(v) for v in xyz) and -15000 < x < 1000 and -9000 < z < 5000
            and -500 < y < 3000 and (x or z))


stage_pos = {}
for key, row in stage_rows.items():
    s, _ = parser.parse_stage_prefix(row)
    if usable(s["xyz"]):
        stage_pos[key] = s["xyz"]


def mission_stage_keys(m):
    """Stage keys of a mission: block list in blk_b8 plus the lists inside list1a0 records."""
    keys = list(m["blk_b8"]["l1"])
    for entry in m["list1a0"]:
        keys += entry["l1"]
    return keys


def median_pos(keys):
    """Median XYZ of the stages that have a position, or None."""
    pts = [stage_pos[k] for k in keys if k in stage_pos]
    if not pts:
        return None
    return [round(statistics.median(p[i] for p in pts), 1) for i in range(3)], len(pts)


node_list = [(n["x"], n["z"], name) for name, n in nodes.items()]


def region_of(x, z):
    """Region code and distance of the nearest faction node (name token after 'Node_')."""
    best = min(node_list, key=lambda n: (n[0] - x) ** 2 + (n[1] - z) ** 2)
    dist = math.hypot(best[0] - x, best[1] - z)
    parts = best[2].split("_")
    return (parts[1] if len(parts) > 1 else best[2]), round(dist), best[2]


mission_loc = {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    found = median_pos(mission_stage_keys(m))
    if found:
        (x, y, z), count = found
        region, dist, node = region_of(x, z)
        mission_loc[mission_names[key]] = {"x": x, "y": y, "z": z, "stages": count,
                                           "region": region, "nearestNode": node,
                                           "nodeDistance": dist}

quest_loc = {}
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    keys = list(q["keyList_e0"])
    for mission in q["keyList_d0"]:
        if mission in mission_rows:
            keys += mission_stage_keys(parser.parse_mission(mission_rows[mission])[0])
    found = median_pos(keys)
    if found:
        (x, y, z), count = found
        region, dist, node = region_of(x, z)
        quest_loc[quest_names[key]] = {"x": x, "y": y, "z": z, "stages": count,
                                       "region": region, "nearestNode": node,
                                       "nodeDistance": dist}

# validation: node missions (Mission_Node_<Reg>_<Name>...) should sit near Node_<Reg>_<Name>
near = []
for name, loc in mission_loc.items():
    if name.startswith("Mission_Node_"):
        node = "Node_" + name[len("Mission_Node_"):]
        while node and node not in nodes:
            node = node.rsplit("_", 1)[0] if "_" in node else ""
        if node:
            n = nodes[node]
            near.append(math.hypot(loc["x"] - n["x"], loc["z"] - n["z"]))
report = {
    "stageRows": len(stage_rows), "stagesWithPosition": len(stage_pos),
    "missionsWithPosition": len(mission_loc), "missions": len(mission_rows),
    "questsWithPosition": len(quest_loc), "quests": len(quest_rows),
    "nodeMissionDistanceCheck": {
        "pairs": len(near),
        "medianDistance": round(statistics.median(near)) if near else None,
        "within300": sum(1 for d in near if d <= 300), "within1000": sum(1 for d in near if d <= 1000)},
    "questRegions": dict(Counter(v["region"] for v in quest_loc.values()).most_common(15)),
    "missionRegions": dict(Counter(v["region"] for v in mission_loc.values()).most_common(15)),
}
(HERE / "quest-locations.json").write_text(json.dumps(quest_loc, indent=1), encoding="utf-8")
(HERE / "mission-locations.json").write_text(json.dumps(mission_loc, indent=1), encoding="utf-8")
(HERE / "location-validation.json").write_text(json.dumps(report, indent=1), encoding="utf-8")
print(json.dumps(report, indent=1))
