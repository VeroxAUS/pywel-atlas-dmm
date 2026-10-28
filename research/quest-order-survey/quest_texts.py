"""Resolve English titles/descriptions for every quest and mission from the exact parsers.

What it does:
    A text block in a row is (u8 flag, u64 text id, string). The text id is the key into the
    .paloc string tables (research/vendor/work/eng/*.paloc). Missions have four blocks
    (s108, s128, s148, s168 = title / description / ... as found), quests have two
    (s18, s38). Strings that look like "{StaticInfo:Knowledge:Key#Name}" are shown as Name.
Reads:  research/vendor/work/eng/*.paloc, staticinfo tables, mission_parser.py.
Writes: quest-texts.json, mission-texts.json, text-coverage.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/quest_texts.py
"""
import glob
import json
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
sys.path.insert(0, str(HERE))
import decode_level_gates as gates  # noqa: E402
import mission_parser as parser  # noqa: E402
from find_chest_contents import read_paloc  # noqa: E402

texts = {}
for path in sorted(glob.glob(str(ROOT / "research" / "vendor" / "work" / "eng" / "*.paloc"))):
    for key, value in read_paloc(Path(path)).items():
        texts.setdefault(key, value)
TAG = re.compile(r"^\{StaticInfo:[^#}]*#([^}]*)\}$")


def clean(value):
    """Show the readable name inside a {StaticInfo:...#Name} reference."""
    match = TAG.match(value or "")
    return match.group(1) if match else value


def block_text(block):
    """Text for one (flag, u64 id, string) block, or None."""
    return clean(texts.get(str(block["q"])))


mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
mission_out, quest_out, coverage = {}, {}, Counter()
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    blocks = [block_text(m[f]) for f in ("s108", "s128", "s148", "s168")]
    if any(blocks):
        mission_out[m["name"]] = {"title": blocks[0], "text2": blocks[1], "text3": blocks[2],
                                  "text4": blocks[3]}
        coverage["missionsWithAnyText"] += 1
        if blocks[0]:
            coverage["missionsWithTitle"] += 1
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - placeholder row 1
        continue
    blocks = [block_text(q[f]) for f in ("s18", "s38")]
    if any(blocks):
        quest_out[q["name"]] = {"title": blocks[0], "description": blocks[1]}
        coverage["questsWithAnyText"] += 1
        if blocks[0]:
            coverage["questsWithTitle"] += 1
        if blocks[1]:
            coverage["questsWithDescription"] += 1
(HERE / "quest-texts.json").write_text(json.dumps(quest_out, indent=1, ensure_ascii=False), encoding="utf-8")
(HERE / "mission-texts.json").write_text(json.dumps(mission_out, indent=1, ensure_ascii=False), encoding="utf-8")
coverage.update({"quests": len(quest_rows), "missions": len(mission_rows)})
(HERE / "text-coverage.json").write_text(json.dumps(coverage, indent=1), encoding="utf-8")
print(dict(coverage))
for n in list(quest_out)[:3]:
    print(n, quest_out[n])
for n in list(mission_out)[:3]:
    print(n, mission_out[n])
