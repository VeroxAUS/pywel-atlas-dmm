"""List the rewards of every mission (dropset records) and flag access/ability rewards.

What it does:
    Each mission record in list_a0 (see mission_parser.e_1509500) has a dropset key k1.
    dropsetinfo text rows look like "Item(Abyss_Artifact, 10)" or
    "Knowledge(Knowledge_White_Horse, 2)". This script resolves them for all missions,
    totals them, and searches the reward names for abilities, mounts, tools and area access.
Reads:  staticinfo tables, mission_parser.py.
Writes: mission-rewards.json, gate-rewards.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/mission_rewards.py
"""
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
sys.path.insert(0, str(HERE))
import decode_level_gates as gates  # noqa: E402
import mission_parser as parser  # noqa: E402

mission_rows = gates.load_table("missioninfo")
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
dropsets = {k: gates.row_name(r) or "" for k, r in gates.load_table("dropsetinfo").items()}

rewards = {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    texts = []
    for entry in m["list_a0"]:
        text = dropsets.get(entry["k1"])
        if text and entry["k1"] not in (0, 0xFFFFFFFF):
            texts.append(text.rstrip(";"))
    if texts:
        rewards[mission_names[key]] = texts

kinds = Counter()
for texts in rewards.values():
    for t in texts:
        kinds[re.match(r"(\w+)\(", t).group(1) if re.match(r"(\w+)\(", t) else "other"] += 1

WORDS = ("glide", "grapple", "hook", "mount", "wyvern", "dragon", "horse", "ability", "skill",
         "fasttravel", "fast_travel", "teleport", "abyssgate", "abyss_gate", "key_", "tool",
         "ballista", "pet", "ship", "cart", "unlock")
gates_found = defaultdict(list)
for mission, texts in rewards.items():
    for t in texts:
        low = t.lower()
        for w in WORDS:
            if w in low:
                gates_found[w].append({"mission": mission, "reward": t})
                break
(HERE / "mission-rewards.json").write_text(json.dumps(rewards, indent=1, ensure_ascii=False),
                                           encoding="utf-8")
(HERE / "gate-rewards.json").write_text(json.dumps(
    {k: v for k, v in gates_found.items()}, indent=1, ensure_ascii=False), encoding="utf-8")
print("missions with rewards", len(rewards), "of", len(mission_rows), dict(kinds))
for w, lst in gates_found.items():
    print(w, len(lst), [x["mission"] + " -> " + x["reward"] for x in lst[:2]])
