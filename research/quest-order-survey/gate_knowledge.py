"""Find knowledge entries that act as abilities, mounts, tools or area access, and who gives them.

What it does:
    Lists knowledgeinfo rows whose names mention gameplay-unlocking things (glide, grapple,
    hook, parachute, wyvern, mount, dragon, abyss gate/transmitter/teleport, fast travel,
    camp, tool, recipe...) and joins each to the missions that reward it
    (mission-rewards.json, "Knowledge(<name>, level)"). The result is the list of quests
    that open an ability or access, useful for routing order.
Reads:  staticinfo knowledgeinfo, mission-rewards.json, mission-graph.json.
Writes: gate-knowledge.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/gate_knowledge.py
"""
import json
import re
import sys
from collections import defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
import decode_level_gates as gates  # noqa: E402

WORDS = ["glide", "glider", "grapple", "hook", "parachute", "wyvern", "mount", "dragon", "abyssgate",
         "abysstransmitter", "abyssteleport", "teleport", "fasttravel", "fast_travel", "airship",
         "balloon", "ballista", "boat", "ship", "wagon", "camp", "pet_", "skill_", "swim",
         "dive", "lantern", "torch", "tool", "permit", "paper_", "key_", "cart"]
knowledge = {k: gates.row_name(r) or "" for k, r in gates.load_table("knowledgeinfo").items()}
rewards = json.loads((HERE / "mission-rewards.json").read_text(encoding="utf-8"))
giver = defaultdict(list)
for mission, texts in rewards.items():
    for text in texts:
        match = re.match(r"Knowledge\(([^,]+),\s*(\d+)\)", text)
        if match:
            giver[match.group(1).strip()].append({"mission": mission, "level": int(match.group(2))})
out = defaultdict(list)
for name in knowledge.values():
    low = name.lower()
    for word in WORDS:
        if word in low:
            out[word].append({"knowledge": name, "givenBy": giver.get(name, [])[:4]})
            break
summary = {w: {"entries": len(v), "withGiverMission": sum(1 for e in v if e["givenBy"])}
           for w, v in out.items()}
(HERE / "gate-knowledge.json").write_text(json.dumps(
    {"summary": summary, "entries": out}, indent=1, ensure_ascii=False), encoding="utf-8")
print(json.dumps(summary))
for w in ("glide", "grapple", "parachute", "wyvern", "abyssgate", "abysstransmitter", "fasttravel", "airship"):
    for e in out.get(w, [])[:2]:
        print(w, e["knowledge"], [g["mission"] for g in e["givenBy"]])
