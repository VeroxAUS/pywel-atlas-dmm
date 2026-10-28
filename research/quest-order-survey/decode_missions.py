"""Decode the unlock/complete conditions of mission rows and build a dependency graph.

What it does:
    Mission rows (missioninfo) keep two condition keys at fixed distances after
    their text id string (measured on 6001 rows that have a text id):
        text id end + 39 -> unlock/accept condition  (3979 rows hold a valid key)
        text id end + 60 -> objective/complete condition (3511 rows)
    Both are u32 keys into conditioninfo. This script reads them for every
    mission, parses the quest/mission terms in the unlock condition into edges
    (mission -> prerequisite mission/quest), then:
      - rolls missions up to the quest that owns them (name stem match
        Quest_X <-> Mission_X[_...]),
      - counts how many resolve, how deep the dependency chains go, and whether
        cycles exist,
      - writes mission-prerequisites.json and dependency-graph-summary.json.

Key terms:
    unlock condition - must be true before the mission can start.
    objective condition - what finishes the (sub-)mission (kill, item, stage...).
    edge - "mission A needs mission/quest B done".

Reads:  research/vendor/work/staticinfo/, missions.json and quests.json (this folder).
Writes: mission-prerequisites.json, dependency-graph-summary.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/decode_missions.py
"""
import json
import re
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
import decode_level_gates as gates  # noqa: E402

TEXT_ID = re.compile(rb"[\x12\x13\x14]\x00\x00\x00(\d{15,20})")
UNLOCK_OFFSET = 39
COMPLETE_OFFSET = 60
TERM = re.compile(r"(\w+)\(([^()]*)\)")
NEEDS = ("CompleteMission", "CompleteSubMission", "CompleteQuest", "StartQuest",
         "PlayingQuest", "PlayingMission", "StartMission")


def read_condition(row, text_end, offset, conditions):
    """Return (key, text) of the condition key at text_end+offset, or (None, None)."""
    position = text_end + offset
    if position + 4 > len(row):
        return None, None
    key = struct.unpack_from("<I", row, position)[0]
    return (key, conditions[key]) if key in conditions else (None, None)


def needs_of(text, owner):
    """Return [(function, target name, negated)] for quest/mission terms in a condition."""
    found = []
    for match in TERM.finditer(text):
        function, argument = match.groups()
        if function not in NEEDS:
            continue
        target = argument.split(",")[0].strip()
        if target == owner:
            continue
        # A "!" right before the term means "must NOT be done" - not a prerequisite.
        negated = text[:match.start()].rstrip().endswith("!")
        found.append((function, target, negated))
    return found


def main():
    """Decode, link, and summarize."""
    conditions = gates.condition_texts()
    rows = gates.load_table("missioninfo")
    quest_rows = gates.load_table("questinfo")
    mission_names = {k: gates.row_name(r) or "" for k, r in rows.items()}
    quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
    mission_by_name = {n: k for k, n in mission_names.items()}
    quest_by_name = {n: k for k, n in quest_names.items()}

    missions = {}
    for key, row in rows.items():
        match = TEXT_ID.search(row)
        if not match:
            continue
        unlock_key, unlock = read_condition(row, match.end(), UNLOCK_OFFSET, conditions)
        done_key, done = read_condition(row, match.end(), COMPLETE_OFFSET, conditions)
        name = mission_names[key]
        needs = needs_of(unlock, name) if unlock else []
        missions[name] = {
            "key": key, "unlockConditionKey": unlock_key, "unlock": unlock,
            "objectiveConditionKey": done_key, "objective": done,
            "needs": [{"function": f, "target": t, "negated": n,
                       "targetKind": "mission" if t in mission_by_name
                       else "quest" if t in quest_by_name else "unknown"}
                      for f, t, n in needs],
        }

    # ---- owner quest by name stem: Quest_X owns Mission_X / Mission_X_*
    quest_stems = {re.sub(r"^Quest_", "", n).lower(): n for n in quest_by_name
                   if n.startswith("Quest_")}
    owner = {}
    for name in missions:
        stem = re.sub(r"_\d+$", "", re.sub(r"^Mission_", "", name)).lower()
        parts = stem.split("_")
        for length in range(len(parts), 1, -1):
            candidate = "_".join(parts[:length])
            if candidate in quest_stems:
                owner[name] = quest_stems[candidate]
                break

    # ---- graph: mission -> prerequisite names that exist (positive terms only)
    graph = defaultdict(set)
    for name, data in missions.items():
        for need in data["needs"]:
            if not need["negated"] and need["targetKind"] != "unknown":
                graph[name].add(need["target"])

    def depth_of(node, seen, memo):
        """Longest chain below a node; returns -1 on a cycle."""
        if node in memo:
            return memo[node]
        if node in seen:
            return -1
        seen = seen | {node}
        best = 0
        for parent in graph.get(node, ()):
            sub = depth_of(parent, seen, memo)
            if sub < 0:
                memo[node] = -1
                return -1
            best = max(best, sub + 1)
        memo[node] = best
        return best

    memo = {}
    depths = {name: depth_of(name, frozenset(), memo) for name in graph}
    chained = [n for n, d in depths.items() if d >= 1]
    with_unlock = [n for n, d in missions.items() if d["unlock"]]
    with_needs = [n for n, d in missions.items() if graph.get(n)]

    # ---- roll up to quests: external needs of the quest's first missions
    quest_needs = defaultdict(set)
    for name, targets in graph.items():
        quest = owner.get(name)
        if not quest:
            continue
        for target in targets:
            target_quest = target if target in quest_by_name else owner.get(target)
            if target_quest and target_quest != quest:
                quest_needs[quest].add(target_quest)

    summary = {
        "missionsWithTextId": len(missions),
        "missionRowsWithoutTextIdNotDecoded": len(rows) - len(missions),
        "missionsWithUnlockCondition": len(with_unlock),
        "missionsWithObjectiveCondition": sum(1 for d in missions.values() if d["objective"]),
        "missionsNeedingAnotherMissionOrQuest": len(with_needs),
        "needTargetKinds": dict(Counter(n["targetKind"] for d in missions.values()
                                        for n in d["needs"])),
        "negatedNeeds": sum(1 for d in missions.values() for n in d["needs"] if n["negated"]),
        "missionsInChains": len(chained),
        "maxChainDepth": max(depths.values(), default=0),
        "missionsOnACycle": sum(1 for d in depths.values() if d < 0),
        "depthHistogram": dict(sorted(Counter(depths.values()).items())),
        "missionsOwnedByAQuestByName": len(owner),
        "questsWithQuestLevelPrerequisite": len(quest_needs),
        "unlockFunctionMix": Counter(re.sub(r"\(.*", "", d["unlock"])[:30]
                                     for d in missions.values() if d["unlock"]).most_common(15),
    }
    (HERE / "mission-prerequisites.json").write_text(
        json.dumps({"missions": missions, "ownerQuestByName": owner,
                    "questNeeds": {k: sorted(v) for k, v in quest_needs.items()}},
                   indent=1, ensure_ascii=False), encoding="utf-8")
    (HERE / "dependency-graph-summary.json").write_text(
        json.dumps(summary, indent=2, ensure_ascii=False), encoding="utf-8")
    print(json.dumps(summary, indent=1, ensure_ascii=False))


if __name__ == "__main__":
    main()
