"""Find mission pairs the late saves order consistently and check them against unlock edges.

What it does:
    1. Edge check: for each decoded unlock edge (mission M needs X), test in each save
       whether X was completed before M. "CompleteSubMission(Y, n)" means sub-mission
       row "Y_n" (not the parent Y, which completes last). This also tests that
       _completedTime is a real play order.
    2. Pairs within the same name-prefix group (first two name tokens) that are
       completed in all compared saves. A pair "agrees" when every save puts the
       same item first.
    3. Because far-apart pairs agree by chance (progress is broadly monotonic), the
       forced share is estimated from CLOSE pairs: two items finished within 1% of
       the save's time span in save A. If order were free, another save agrees
       50% of the time; f = 2*agree - 1 estimates the forced share.
    4. Reports results for all three saves and for B+C only (B predates the
       Enhanced update; A has hand-added items).
Reads:  mission-prerequisites.json, missions.json, three saves under late-saves/.
Writes: forced-order.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -I -B research/quest-order-survey/forced_order.py
"""
import itertools
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
for sub in ("pycrimson/src", "bier-src"):
    sys.path.insert(0, str(ROOT / "research" / "vendor" / sub))
from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

W = ROOT / "research" / "vendor" / "work" / "late-saves"
NAMES = ["A_2106", "B_2796", "C_3268"]
PATHS = [W / "2106/save.save", W / "2796/save.save", W / "3268/save.save"]
missions = {m["key"]: m["name"] for m in json.loads((HERE / "missions.json").read_text(encoding="utf-8"))}
prereq = json.loads((HERE / "mission-prerequisites.json").read_text(encoding="utf-8"))["missions"]
SUB = re.compile(r"CompleteSubMission\(([^,()]+),\s*(\d+)\)")
MISSION = re.compile(r"CompleteMission\(([^()]+)\)")

times = []
for path in PATHS:
    objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects
    data = next(o for o in objects if o.get("__pycr_type__") == "QuestSaveData")
    times.append({missions[r["_key"]]: r["_completedTime"] for r in data["_missionStateList"]
                  if r.get("_state") == 5 and r.get("_completedTime") and r["_key"] in missions})

# Edges as (mission, prerequisite row name); only plain positive terms (no "!" before).
edges = set()
for name, data in prereq.items():
    text = data.get("unlock") or ""
    for m in SUB.finditer(text):
        if not text[:m.start()].rstrip().endswith("!"):
            edges.add((name, f"{m.group(1).strip()}_{m.group(2)}"))
    for m in MISSION.finditer(text):
        if not text[:m.start()].rstrip().endswith("!"):
            edges.add((name, m.group(1).strip()))
edges = {(a, b) for a, b in edges if a != b and a in set(missions.values()) and b in set(missions.values())}


def edge_check(save_indexes):
    """Count edges whose prerequisite finished before / after the mission."""
    result = Counter()
    for mission, target in edges:
        for i in save_indexes:
            t = times[i]
            if mission in t and target in t:
                result["prereqFirst" if t[target] <= t[mission] else "prereqAfter"] += 1
    return dict(result)


def group_of(name):
    parts = name.split("_")
    return "_".join(parts[:2]) if len(parts) > 1 else name


def analyse(indexes):
    """Pair statistics for the saves at `indexes` (first index is the reference save)."""
    sets = [set(times[i]) for i in indexes]
    common = set.intersection(*sets)
    ref = times[indexes[0]]
    span = max(ref.values()) - min(ref.values())
    groups = defaultdict(list)
    for name in common:
        groups[group_of(name)].append(name)
    pairs = agree_all = 0
    close = close_agree = 0
    unanimous_edge = unanimous_noedge = 0
    candidates = []
    for names in groups.values():
        for x, y in itertools.combinations(names, 2):
            ordered = [(times[i][x] < times[i][y]) for i in indexes if times[i][x] != times[i][y]]
            if len(ordered) < len(indexes):
                continue
            pairs += 1
            unanimous = len(set(ordered)) == 1
            agree_all += unanimous
            gap = abs(ref[x] - ref[y])
            if gap <= 0.01 * span:
                close += 1
                close_agree += unanimous
                if unanimous:
                    first, second = (x, y) if ordered[0] else (y, x)
                    linked = (second, first) in edges
                    unanimous_edge += linked
                    unanimous_noedge += not linked
                    if len(candidates) < 40 and not linked:
                        candidates.append([first, second])
    agree_rate = close_agree / close if close else None
    chance_unanimous = 2 * 0.5 ** len(indexes)
    forced = (agree_rate - chance_unanimous) / (1 - chance_unanimous) if close else None
    return {
        "savesCompared": [NAMES[i] for i in indexes], "missionsInAll": len(common),
        "groups": len(groups), "pairsWithinGroup": pairs, "unanimousPairs": agree_all,
        "closePairs": close, "closePairsUnanimous": close_agree,
        "estimatedForcedShareOfClosePairs": round(forced, 3) if forced is not None else None,
        "closeUnanimousPairsConfirmedByEdge": unanimous_edge,
        "closeUnanimousPairsWithoutEdge": unanimous_noedge,
        "sampleCandidatesWithoutEdge": candidates,
    }


# Decoded edges that the saves contradict / cannot test.
def edge_support(indexes):
    supported = contradicted = untested = 0
    for mission, target in edges:
        verdicts = [times[i][target] <= times[i][mission] for i in indexes
                    if mission in times[i] and target in times[i]]
        if not verdicts:
            untested += 1
        elif all(verdicts):
            supported += 1
        else:
            contradicted += 1
    return {"supported": supported, "contradictedInAnySave": contradicted, "untestable": untested}


report = {
    "decodedEdgesUsed": len(edges),
    "edgeCheckPerSaveEvents": {NAMES[i]: edge_check([i]) for i in range(3)},
    "edgeSupportAllThree": edge_support([0, 1, 2]),
    "edgeSupportBandC": edge_support([1, 2]),
    "allThree": analyse([0, 1, 2]),
    "BandC": analyse([1, 2]),
}
(HERE / "forced-order.json").write_text(json.dumps(report, indent=1, ensure_ascii=False))
slim = json.loads(json.dumps(report))
for key in ("allThree", "BandC"):
    slim[key].pop("sampleCandidatesWithoutEdge")
print(json.dumps(slim, indent=1))
