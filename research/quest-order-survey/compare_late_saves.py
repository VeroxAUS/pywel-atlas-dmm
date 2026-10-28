"""Compare completion order across late-save copies (read-only).

What it does:
    Reads QuestSaveData from each save copy, counts completed quests/missions and
    those carrying _completedTime, checks whether the 41 chapter quests come out in
    chapter order, and measures how often two saves put the same pair of
    quests/missions in the same order (concordance), to separate forced orders
    (always the same) from chosen ones.
Reads:  save copies listed in SAVES, quests.json/missions.json (this folder).
Writes: late-save-comparison.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -I -B research/quest-order-survey/compare_late_saves.py
"""
import itertools
import json
import random
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
for sub in ("pycrimson/src", "bier-src"):
    sys.path.insert(0, str(ROOT / "research" / "vendor" / sub))
from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

W = ROOT / "research" / "vendor" / "work"
SAVES = {"A_2106": W / "late-saves/2106/save.save", "B_2796": W / "late-saves/2796/save.save",
         "C_3268": W / "late-saves/3268/save.save"}
quests = {q["key"]: q for q in json.loads((HERE / "quests.json").read_text(encoding="utf-8"))}
missions = {m["key"]: m for m in json.loads((HERE / "missions.json").read_text(encoding="utf-8"))}


def load(path):
    """Return QuestSaveData of one save or None if unreadable."""
    try:
        objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects
    except Exception as error:  # noqa: BLE001 - report any parser failure
        return {"error": repr(error)[:200]}
    return next((o for o in objects if o.get("__pycr_type__") == "QuestSaveData"), None)


def concordance(a, b, sample=200000):
    """Share of item pairs (present with times in both) ordered the same way."""
    common = [k for k in a if k in b]
    random.seed(1)
    pairs = (itertools.combinations(common, 2) if len(common) < 600
             else ((random.choice(common), random.choice(common)) for _ in range(sample)))
    same = total = 0
    for x, y in pairs:
        if x == y or a[x] == a[y] or b[x] == b[y]:
            continue
        total += 1
        same += (a[x] < a[y]) == (b[x] < b[y])
    return {"commonItems": len(common), "pairs": total, "sameOrder": round(same / total, 4) if total else None}


report, times = {}, {}
for name, path in SAVES.items():
    data = load(path)
    if not data or "error" in data:
        report[name] = {"readable": False, "detail": data}
        continue
    q = {r["_questKey"]: r for r in data["_questStateList"] if r.get("_state") == 5}
    m = {r["_key"]: r for r in data["_missionStateList"] if r.get("_state") == 5}
    qt = {k: r["_completedTime"] for k, r in q.items() if r.get("_completedTime")}
    mt = {k: r["_completedTime"] for k, r in m.items() if r.get("_completedTime")}
    chapter = sorted((k for k in qt if 1000 <= (quests.get(k, {}).get("group") or 0) <= 1013),
                     key=lambda k: qt[k])
    groups = [quests[k]["group"] for k in chapter]
    report[name] = {
        "readable": True, "size": path.stat().st_size,
        "questRecords": len(data["_questStateList"]), "missionRecords": len(data["_missionStateList"]),
        "completedQuests": len(q), "completedQuestsWithTime": len(qt),
        "completedMissions": len(m), "completedMissionsWithTime": len(mt),
        "distinctMissionTimes": len(set(mt.values())),
        "chapterQuestsCompleted": len(chapter),
        "chapterOrderMonotonic": groups == sorted(groups),
        "chapterOrder": [quests[k]["name"] for k in chapter],
        "lastCompletedMainQuest": quests.get(data.get("_lastCompletedMainQuestKey"), {}).get("name"),
        "maxMissionTime": max(mt.values(), default=None), "minMissionTime": min(mt.values(), default=None),
        "stateCounts": dict(Counter(r.get("_state") for r in data["_missionStateList"])),
    }
    times[name] = {"q": qt, "m": mt}
report["pairwise"] = {}
for a, b in itertools.combinations(times, 2):
    report["pairwise"][f"{a} vs {b}"] = {"quests": concordance(times[a]["q"], times[b]["q"]),
                                         "missions": concordance(times[a]["m"], times[b]["m"])}
(HERE / "late-save-comparison.json").write_text(json.dumps(report, indent=1, ensure_ascii=False))
slim = {k: ({kk: vv for kk, vv in v.items() if kk != "chapterOrder"} if isinstance(v, dict) and "chapterOrder" in v else v)
        for k, v in report.items()}
print(json.dumps(slim, indent=1))
