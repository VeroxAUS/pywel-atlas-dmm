"""Fill the position gap with NPC schedule path files (.paschedulepath).

What it does:
    Stage scripts without a .paseq usually have a .paschedule (NPC schedule) and a
    .paschedulepath (the route). The path file is a plain list of 12-byte points
    (x, y, z floats) after a small header. This script reads the path file named like
    the stage's sequencer script (pack group 0014, read-only), keeps a chain of points that
    follow each other (within 400 units, so stray bytes are ignored) and records the
    first point and the median. It then merges these positions into the exact
    quest/mission positions: quests/missions without a .paseq anchor now get a
    position from their path files.
Reads:  game install (read-only), pack-files.txt, staticinfo tables, mission_parser.py,
        paseq-anchors.json, exact-quest-positions.json, exact-mission-positions.json.
Writes: schedule-paths.json, positions-v2-quest.json, positions-v2-mission.json,
        positions-v2-coverage.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/schedule_paths.py
"""
import json
import math
import statistics
import struct
import sys
from collections import Counter
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


def in_world(x, y, z):
    """True for a position inside the map box."""
    return (all(map(math.isfinite, (x, y, z))) and -13500 < x < 500 and -7500 < z < 4000
            and -200 < y < 2500 and (abs(x) > 1 or abs(z) > 1))


def path_points(data):
    """Longest chain of consecutive 12-byte points that follow each other (<400 units)."""
    best = []
    for start in range(0, 4):  # points are 4-byte aligned; try each alignment
        chain, previous = [], None
        offset = start
        while offset + 12 <= len(data):
            x, y, z = struct.unpack_from("<3f", data, offset)
            if in_world(x, y, z) and (previous is None or
                                      math.hypot(x - previous[0], z - previous[2]) < 400):
                chain.append((x, y, z))
                previous = (x, y, z)
                offset += 12
                continue
            if len(chain) > len(best):
                best = chain
            chain, previous = [], None
            offset += 4
        if len(chain) > len(best):
            best = chain
    return best


paths = {}
for line in PACK_LIST.open(encoding="utf-8"):
    line = line.strip()
    if line.endswith(".paschedulepath"):
        path = line.split(" ", 1)[1]
        paths[path.rsplit("/", 1)[1][:-15].lower()] = path

stage_rows = gates.load_table("stageinfo")
stage_script = {}
for key, row in stage_rows.items():
    s, _ = parser.parse_stage_prefix(row)
    if s["s1"]:
        stage_script[key] = s["s1"].lower()

context = PackageContext(GAME, pack_group_whitelist=["0014"])
anchors = json.loads((HERE / "paseq-anchors.json").read_text(encoding="utf-8"))
schedule = {}
for script in sorted({s for s in stage_script.values() if s in paths}):
    data = context.get_file(paths[script])
    if not data:
        continue
    chain = path_points(data)
    if len(chain) >= 2:
        schedule[script] = {
            "x": round(chain[0][0], 1), "y": round(chain[0][1], 1), "z": round(chain[0][2], 1),
            "medianX": round(statistics.median(p[0] for p in chain), 1),
            "medianZ": round(statistics.median(p[2] for p in chain), 1), "points": len(chain)}
(HERE / "schedule-paths.json").write_text(json.dumps(schedule), encoding="utf-8")

# agreement between path start and paseq anchor where both exist
both = [math.hypot(schedule[s]["x"] - anchors[s]["anchor"][0], schedule[s]["z"] - anchors[s]["anchor"][2])
        for s in schedule if s in anchors and anchors[s]["anchor"]]


def position_v2(stage_keys):
    """Median position over paseq anchors, falling back to schedule path starts."""
    pts, how = [], Counter()
    for stage in stage_keys:
        script = stage_script.get(stage)
        a = anchors.get(script)
        if a and a["anchor"]:
            pts.append((a["anchor"][0], a["anchor"][1], a["anchor"][2]))
            how["paseq"] += 1
        elif script in schedule:
            s = schedule[script]
            pts.append((s["x"], s["y"], s["z"]))
            how["schedulePath"] += 1
    if not pts:
        return None
    return {"x": round(statistics.median(p[0] for p in pts), 1),
            "y": round(statistics.median(p[1] for p in pts), 1),
            "z": round(statistics.median(p[2] for p in pts), 1),
            "scripts": len(pts), "sources": dict(how)}


mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
mission_stages, mission_loc, quest_loc, quest_group = {}, {}, {}, {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    stages = [e["key"] for e in m["list28"]] + list(m["blk_b8"]["l1"])
    for entry in m["list1a0"]:
        stages += entry["l1"]
    mission_stages[key] = stages
    loc = position_v2(stages)
    if loc:
        mission_loc[mission_names[key]] = loc
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    quest_group[quest_names[key]] = q["h58"]
    stages = list(q["keyList_e0"])
    for mission in q["keyList_d0"]:
        stages += mission_stages.get(mission, [])
    loc = position_v2(stages)
    if loc:
        quest_loc[quest_names[key]] = loc
(HERE / "positions-v2-quest.json").write_text(json.dumps(quest_loc, indent=1), encoding="utf-8")
(HERE / "positions-v2-mission.json").write_text(json.dumps(mission_loc, indent=1), encoding="utf-8")


def system(name):
    """True for non-player quest rows."""
    return name.startswith(("LevelSequencerSpawn", "cd_", "Func_", "Schedule_", "ReBlockading", "Shop_"))


player = [n for n in quest_names.values() if n and not system(n)]
main = {n for n, g in quest_group.items() if 1000 <= g <= 1013}
report = {
    "schedulePathFiles": len(paths), "scriptsWithSchedulePath": len(schedule),
    "pathVsPaseqAnchor": {"pairs": len(both),
                          "median": round(statistics.median(both)) if both else None,
                          "within500": sum(1 for d in both if d < 500)},
    "playerQuestsWithPosition": sum(1 for n in player if n in quest_loc), "playerQuests": len(player),
    "mainChapterQuestsWithPosition": sum(1 for n in main if n in quest_loc),
    "questsWithPosition": len(quest_loc),
    "missionsWithPosition": len(mission_loc), "missions": len(mission_names),
    "plainMissionsWithPosition": sum(1 for n in mission_loc if n.startswith("Mission_")),
    "challengeMissionsWithPosition": sum(1 for n in mission_loc if n.startswith("Challenge_")),
}
(HERE / "positions-v2-coverage.json").write_text(json.dumps(report, indent=1), encoding="utf-8")
print(json.dumps(report, indent=1))
