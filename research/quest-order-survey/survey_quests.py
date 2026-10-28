"""Survey what order/prerequisite data the game tables hold for quests and missions.

What it does:
    Read-only survey for a planned "100% completion guide". It decodes only what
    can be decoded safely from the extracted static tables:
      - the name that starts every row of missioninfo/questinfo/questgroupinfo,
      - the localized title (text id inside the row -> quest.paloc),
      - the chapter/group of a quest (u16 that sits 13 bytes after its text id),
      - every condition text in conditioninfo (parsed into terms),
      - quest/mission states in save copies (QuestSaveData).
    It also measures how well rows can be tied to conditions without a field
    schema (see findings.md), and writes the results as JSON next to this file.

Key terms:
    group - questgroupinfo row: a chapter (1000-1013), a challenge list, shops...
    condition - conditioninfo row: text like "CompleteMission(X) && !CheckKnowledge(Y)".
    text id - 15-20 digit string inside a row; the key into quest.paloc.

Reads:  research/vendor/work/staticinfo/, research/vendor/work/eng/*.paloc,
        save copies listed in SAVES (never the game's save folder).
Writes: research/quest-order-survey/*.json (new files only)
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/survey_quests.py
"""
import json
import random
import re
import struct
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))
sys.path.insert(0, str(ROOT / "research" / "vendor" / "bier-src"))

import decode_level_gates as gates  # noqa: E402
from find_chest_contents import read_paloc  # noqa: E402

WORK = ROOT / "research" / "vendor" / "work"
# Save copies, oldest progress first (the survey compares states between them).
SAVES = ["chest-test/slot100.save", "chest-test/slot104.save", "full-save/save.save"]
TEXT_ID = re.compile(rb"[\x12\x13\x14]\x00\x00\x00(\d{15,20})")
TERM = re.compile(r"(\w+)\(([^()]*)\)")
QUEST_FUNCTIONS = ("CompleteMission", "CompleteSubMission", "CompleteQuest",
                   "StartQuest", "PlayingQuest", "PlayingMission", "StartMission")


def mission_category(name):
    """Return a coarse type for a missioninfo row name (from its prefix)."""
    if name.startswith("Challenge_AbyssRuins") or name.startswith("Challenge_Abyss_"):
        return "challenge-abyss"
    if name.startswith("Challenge_SealedArtifact"):
        return "challenge-sealed-artifact"
    if name.startswith("Challenge_"):
        return "challenge-other"
    if name.startswith(("Mission_Node_", "Mission_Reoccupation", "Mission_Reconstruction",
                        "Mission_Invasion")):
        return "faction-node-mission"
    if name.startswith("Mission_"):
        return "mission"
    return "other"


def quest_category(name, group):
    """Return a coarse type for a questinfo row from its group and name."""
    if 1000 <= (group or 0) <= 1013:
        return "main-chapter"
    if name.startswith("Quest_Node"):
        return "faction-node"
    if name.startswith("Quest_Faction"):
        return "faction"
    if name.startswith("Shop_"):
        return "shop"
    if name.startswith(("LevelSequencerSpawn", "cd_seq", "Func_", "Schedule_", "ReBlockading")):
        return "system"
    if name.startswith("Contents_"):
        return "contents"
    if name.startswith("Challenge_"):
        return "challenge"
    if name.startswith("Quest_"):
        return "side-or-story"
    return "other"


def row_text_id(row):
    """Return (text id, end offset) of the first text id string in a row, or None."""
    match = TEXT_ID.search(row)
    return (match.group(1).decode(), match.end()) if match else None


def read_saves():
    """Return {save name: quest records} read from the save copies (read-only)."""
    from bier.EndianedBinaryIO import EndianedBytesIO
    from pycrimson._files import SaveFile
    from pycrimson._reflection import ReflectionParser

    result = {}
    for relative in SAVES:
        path = WORK / relative
        if not path.exists():
            continue
        objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects
        for item in objects:
            if item.get("__pycr_type__") == "QuestSaveData":
                result[relative] = {
                    "missions": {m["_key"]: m for m in item["_missionStateList"]},
                    "quests": {q["_questKey"]: q for q in item["_questStateList"]},
                    "gauges": {g["_key"]: g for g in item["_questGaugeStateList"]},
                    "stages": Counter(s.get("_state") for s in item["_stageStateData"]),
                    "lastMission": item.get("_lastCompletedMissionKey"),
                    "lastMainQuest": item.get("_lastCompletedMainQuestKey"),
                }
    return result


def build_groups(group_rows, texts):
    """Decode questgroupinfo rows: u16 key, name, title text id, kind byte."""
    groups = {}
    for key, row in group_rows.items():
        name_length = struct.unpack_from("<I", row, 2)[0]
        found = row_text_id(row)
        groups[key] = {
            "name": row[6:6 + name_length].decode(),
            "title": texts.get(found[0]) if found else None,
            "kindByte": row[6 + name_length + 1],
        }
    return groups


def link_test(mission_rows, mission_names, conditions):
    """Count u32 values in mission rows that equal a quest condition key, vs a control.

    A real link should often name its owner; a random row should not.
    """
    quest_conditions = {k: t for k, t in conditions.items()
                        if any(f + "(" in t for f in QUEST_FUNCTIONS)}
    random.seed(0)
    plain = [k for k in mission_rows if mission_names[k].startswith("Mission_")]
    totals = {"real": [0, 0], "control": [0, 0]}  # [candidate links, owner named]
    for key in plain:
        stem = mission_names[key].lower().replace("mission_", "")[:12]
        for label, owner in (("real", key), ("control", random.choice(plain))):
            row = mission_rows[owner]
            for offset in range(8 + len(mission_names[owner]) + 1, len(row) - 3):
                value = struct.unpack_from("<I", row, offset)[0]
                if value in quest_conditions:
                    totals[label][0] += 1
                    totals[label][1] += stem in quest_conditions[value].lower()
    return {"missionsTested": len(plain),
            "candidateLinksReal": totals["real"][0], "candidateLinksControl": totals["control"][0],
            "ownerNamedInConditionReal": totals["real"][1],
            "ownerNamedInConditionControl": totals["control"][1]}


def condition_report(conditions, mission_names, quest_names):
    """Parse every condition into terms; report which quest terms resolve to a row."""
    known = set(mission_names.values()) | set(quest_names.values())
    functions, resolved, unresolved, edges = Counter(), Counter(), Counter(), []
    for key, text in conditions.items():
        for function, argument in TERM.findall(text):
            functions[function] += 1
            if function in QUEST_FUNCTIONS:
                target = argument.split(",")[0].strip()
                (resolved if target in known else unresolved)[function] += 1
                edges.append({"condition": key, "function": function, "target": target,
                              "resolved": target in known})
    summary = {
        "conditionRows": len(conditions),
        "withQuestOrMissionTerm": len({e["condition"] for e in edges}),
        "termFunctionCounts": functions.most_common(60),
        "questTermsResolvedToRow": dict(resolved),
        "questTermsNotResolved": dict(unresolved),
    }
    return summary, edges


def save_report(saves, mission_rows, quest_rows, mission_names, quest_names):
    """Summarize quest/mission states per save, plus old->new transitions."""
    report = {}
    for save_name, save in saves.items():
        report[save_name] = {
            "missionRecords": len(save["missions"]),
            "missionStates": dict(Counter(m.get("_state") for m in save["missions"].values())),
            "missionFieldsSeen": sorted({f for m in save["missions"].values() for f in m}),
            "questRecords": len(save["quests"]),
            "questStates": dict(Counter(q.get("_state") for q in save["quests"].values())),
            "questFieldsSeen": sorted({f for q in save["quests"].values() for f in q}),
            "questGaugeStates": dict(Counter(g.get("_state") for g in save["gauges"].values())),
            "stageStates": dict(save["stages"]),
            "lastCompletedMission": mission_names.get(save["lastMission"]),
            "lastCompletedMainQuest": quest_names.get(save["lastMainQuest"]),
            "missionRowsAbsentFromSave": sum(1 for k in mission_rows if k not in save["missions"]),
            "questRowsAbsentFromSave": sum(1 for k in quest_rows if k not in save["quests"]),
        }
    names = list(saves)
    if len(names) >= 2:
        old, new = saves[names[0]], saves[names[-1]]
        moves = Counter()
        for key, record in new["missions"].items():
            before = old["missions"].get(key)
            moves[(before.get("_state") if before else None, record.get("_state"))] += 1
        report[f"missionStateTransitions {names[0]} -> {names[-1]}"] = \
            {f"{a}->{b}": n for (a, b), n in sorted(moves.items(), key=str)}
    return report


def main():
    """Run every survey step and write the JSON files."""
    texts = {}
    for name in ("quest", "faction", "knowledge"):
        texts.update(read_paloc(WORK / "eng" / f"{name}.paloc"))

    mission_rows = gates.load_table("missioninfo")
    quest_rows = gates.load_table("questinfo")
    conditions = gates.condition_texts()
    mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
    quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
    groups = build_groups(gates.load_table("questgroupinfo"), texts)
    saves = read_saves()

    quests = []
    for key, row in quest_rows.items():
        found = row_text_id(row)
        group = struct.unpack_from("<H", row, found[1] + 13)[0] if found else None
        entry = {"key": key, "name": quest_names[key], "group": group,
                 "groupName": groups.get(group, {}).get("name"),
                 "title": texts.get(found[0]) if found else None,
                 "category": quest_category(quest_names[key], group)}
        for save_name, save in saves.items():
            record = save["quests"].get(key)
            entry[f"state:{save_name}"] = record.get("_state") if record else None
        quests.append(entry)

    missions = []
    for key, row in mission_rows.items():
        found = row_text_id(row)
        entry = {"key": key, "name": mission_names[key],
                 "category": mission_category(mission_names[key]),
                 "title": texts.get(found[0]) if found else None,
                 "isSubMission": bool(re.search(r"_\d+$", mission_names[key]))}
        for save_name, save in saves.items():
            record = save["missions"].get(key)
            entry[f"state:{save_name}"] = record.get("_state") if record else None
        missions.append(entry)

    condition_summary, edges = condition_report(conditions, mission_names, quest_names)
    counts = {
        "missionRows": len(mission_rows),
        "missionsByCategory": dict(Counter(m["category"] for m in missions)),
        "subMissionRows": sum(1 for m in missions if m["isSubMission"]),
        "missionsWithLocalizedTitle": sum(1 for m in missions if m["title"]),
        "questRows": len(quest_rows),
        "questsByCategory": dict(Counter(q["category"] for q in quests)),
        "questsByGroup": {f"{g}:{groups.get(g, {}).get('name')}": n
                          for g, n in Counter(q["group"] for q in quests).most_common()},
        "questsWithLocalizedTitle": sum(1 for q in quests if q["title"]),
        "questGroups": len(groups),
    }
    outputs = {
        "groups.json": groups, "quests.json": quests, "missions.json": missions,
        "conditions-summary.json": condition_summary, "condition-quest-edges.json": edges,
        "owner-link-test.json": link_test(mission_rows, mission_names, conditions),
        "save-states.json": save_report(saves, mission_rows, quest_rows, mission_names,
                                        quest_names),
        "counts.json": counts,
    }
    for filename, data in outputs.items():
        (OUT / filename).write_text(json.dumps(data, indent=2, ensure_ascii=False, default=str),
                                    encoding="utf-8")
    print(json.dumps({"counts": counts, "linkTest": outputs["owner-link-test.json"]},
                     indent=1, default=str))


if __name__ == "__main__":
    main()
