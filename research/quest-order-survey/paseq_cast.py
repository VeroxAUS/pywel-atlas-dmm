"""Extract the cast of every quest sequencer scene with world positions (giver pins).

What it does:
    In a .paseq file each actor is a CharacterActorTrackNode with an editor name that ends
    in the character key (for example "NHW_Unique_Lauren_439") and an _initTransform
    (scale xyz, rotation quaternion xyzw, local position xyz). The local position is relative
    to the scene's _sequencerTransform, so the world position is
        anchor + rotate(sequencer rotation, scale * local position).
    This script lists the cast of every script with world positions and flags "named NPCs"
    (characters whose editor name has a person-style prefix and is not an animal, object or
    boss placeholder). The first named NPC of a quest's start scene is its likely giver.
Reads:  game install (read-only, pack group 0014), staticinfo tables, mission_parser.py.
Writes: paseq-cast.json, giver-pins.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/paseq_cast.py
"""
import json
import math
import re
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
from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
PACK_LIST = ROOT / "research" / "vendor" / "work" / "pack-files.txt"
PERSON = re.compile(r"^(NHM|NHW|NGM|NGW|NTM|NTW|NDEM|NDEL|NDW|NKW|NKM|NCM|NCW|NIM|NIW)_", re.I)
NOT_PERSON = re.compile(r"(Animal_|Object_|Boss_|Monster|Gimmick|_Clone|Dummy|Horse)", re.I)


def rotate(q, v):
    """Rotate vector v by quaternion q = (x, y, z, w)."""
    x, y, z, w = q
    vx, vy, vz = v
    tx = 2 * (y * vz - z * vy)
    ty = 2 * (z * vx - x * vz)
    tz = 2 * (x * vy - y * vx)
    return (vx + w * tx + (y * tz - z * ty), vy + w * ty + (z * tx - x * tz),
            vz + w * tz + (x * ty - y * tx))


def walk_actors(node, out):
    """Collect CharacterActorTrackNode dicts anywhere below node."""
    if isinstance(node, dict):
        if node.get("__pycr_type__") == "CharacterActorTrackNode":
            out.append(node)
        for value in node.values():
            walk_actors(value, out)
    elif isinstance(node, list):
        for value in node:
            walk_actors(value, out)


def read_cast(data):
    """Return (anchor, cast list) for one .paseq file."""
    stream = EndianedBytesIO(data)
    stream.seek(16)
    root = ReflectionParser(stream, has_shared_strings=True).objects[0]
    t = root.get("_sequencerTransform") or []
    if len(t) < 10:
        return None, []
    scale, quat, anchor = t[0:3], t[3:7], t[7:10]
    actors = []
    walk_actors(root, actors)
    cast = []
    for actor in actors:
        init = actor.get("_initTransform")
        name = actor.get("_nameForEditor") or ""
        data_node = actor.get("_actorTrackNodeData") or {}
        key = data_node.get("_spawnCharacterKey")
        if not init or len(init) < 10:
            continue
        local = [init[7] * scale[0], init[8] * scale[1], init[9] * scale[2]]
        rx, ry, rz = rotate(quat, local)
        cast.append({"name": name, "characterKey": key,
                     "x": round(anchor[0] + rx, 1), "y": round(anchor[1] + ry, 1),
                     "z": round(anchor[2] + rz, 1)})
    return [round(v, 2) for v in anchor], cast


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
casts, errors = {}, Counter()
for script in sorted({s for s in stage_script.values() if s in paseq_path}):
    data = context.get_file(paseq_path[script])
    if not data:
        errors["noData"] += 1
        continue
    try:
        anchor, cast = read_cast(data)
    except Exception as error:  # noqa: BLE001 - count and continue
        errors[type(error).__name__] += 1
        continue
    casts[script] = {"anchor": anchor, "cast": cast}
(HERE / "paseq-cast.json").write_text(json.dumps(casts), encoding="utf-8")


def named(entry):
    """True when the cast entry looks like a named person (possible quest giver)."""
    return bool(PERSON.match(entry["name"])) and not NOT_PERSON.search(entry["name"])


# ---- giver per mission / quest: first named NPC in the first scripts of the start stages
mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
mission_stages = {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    stages = [e["key"] for e in m["list28"]] + list(m["blk_b8"]["l1"])
    for entry in m["list1a0"]:
        stages += entry["l1"]
    mission_stages[key] = stages


def givers(stage_keys):
    """Named NPCs with positions over the scripts of these stages (most frequent first)."""
    seen = Counter()
    where = {}
    for stage in stage_keys:
        info = casts.get(stage_script.get(stage))
        if not info:
            continue
        for entry in info["cast"]:
            if named(entry):
                seen[entry["name"]] += 1
                where.setdefault(entry["name"], entry)
    return [{"name": n, "scenes": c, "x": where[n]["x"], "y": where[n]["y"], "z": where[n]["z"]}
            for n, c in seen.most_common(5)]


quest_giver, mission_giver = {}, {}
for key, row in mission_rows.items():
    found = givers(mission_stages[key])
    if found:
        mission_giver[mission_names[key]] = found
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    stages = list(q["keyList_e0"])
    start = q["keys_f0"][0]
    ordered = mission_stages.get(start, []) + stages
    for mission in q["keyList_d0"]:
        if mission != start:
            ordered += mission_stages.get(mission, [])
    found = givers(ordered)
    if found:
        quest_giver[quest_names[key]] = found
(HERE / "giver-pins.json").write_text(json.dumps(
    {"quests": quest_giver, "missions": mission_giver}, indent=1), encoding="utf-8")
print(json.dumps({"scripts": len(casts), "errors": dict(errors),
                  "scriptsWithCast": sum(1 for c in casts.values() if c["cast"]),
                  "scriptsWithNamedNpc": sum(1 for c in casts.values() if any(named(e) for e in c["cast"])),
                  "questsWithGiver": len(quest_giver), "missionsWithGiver": len(mission_giver)}))
