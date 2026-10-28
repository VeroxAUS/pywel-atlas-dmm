"""Turn the non-quest terms of mission start conditions into 'needs X' hints.

What it does:
    mission start conditions (mission_graph.py) hold terms the saves cannot order:
    CheckKnowledge(K), CheckFriendlyLevel(NPC)=n, CheckHaveItem(I), QuestGaugePercent(G)>n,
    GetFactionNodeState(N)... This script lists them per mission and resolves
      - a knowledge K to the mission(s) whose reward gives it (mission-rewards.json),
      - a faction node to its quest (Quest_<node>...),
    so a guide can say "needs knowledge K (given by mission M)". Negated terms ("!") are
    "must NOT yet have" and are skipped.
Reads:  mission-graph.json, mission-rewards.json, staticinfo tables.
Writes: mission-hints.json, mission-hints-summary.json.
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/mission_hints.py
"""
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
graph = json.loads((HERE / "mission-graph.json").read_text(encoding="utf-8"))
rewards = json.loads((HERE / "mission-rewards.json").read_text(encoding="utf-8"))

giver = defaultdict(list)  # knowledge name -> missions that reward it
for mission, texts in rewards.items():
    for text in texts:
        match = re.match(r"Knowledge\(([^,]+),", text)
        if match:
            giver[match.group(1).strip()].append(mission)

TERM = re.compile(r"(!?)\s*(\w+)\(([^()]*)\)(\s*[=<>!]+\s*\d+)?")
KIND = {"CheckKnowledge": "knowledge", "KnowledgeKey": "knowledge", "Knowledge": "knowledge",
        "CheckFriendlyLevel": "friendship", "CheckHaveItem": "item", "CheckhaveItem": "item",
        "QuestGaugePercent": "gauge", "GetFactionNodeState": "factionNode",
        "LevelName": "level", "GetLevelGimmickLeftDropRollCount": "chestState",
        "CompleteStage": "stage", "StageKey": "stage", "QuestDialogKey": "dialog",
        "MissionKey": "missionRef", "QuestKey": "questRef", "ItemKey": "item"}
hints, summary = {}, Counter()
for mission, g in graph.items():
    text = g.get("startCondition")
    if not text:
        continue
    found = []
    for negated, function, argument, compare in TERM.findall(text):
        if negated or function not in KIND:
            continue
        entry = {"kind": KIND[function], "term": f"{function}({argument.strip()}){compare.strip()}"}
        if KIND[function] == "knowledge":
            sources = giver.get(argument.strip().split(",")[0].strip(), [])
            if sources:
                entry["givenByMissions"] = sources[:5]
        found.append(entry)
    if found:
        hints[mission] = found
        for e in found:
            summary[e["kind"]] += 1
            if e.get("givenByMissions"):
                summary["knowledgeResolvedToMission"] += 1
summary_out = {"missionsWithHints": len(hints), "termCounts": dict(summary),
               "startConditionsTotal": sum(1 for g in graph.values() if g.get("startCondition"))}
(HERE / "mission-hints.json").write_text(json.dumps(hints, indent=1, ensure_ascii=False), encoding="utf-8")
(HERE / "mission-hints-summary.json").write_text(json.dumps(summary_out, indent=1), encoding="utf-8")
print(json.dumps(summary_out, indent=1))
