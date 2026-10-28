"""Build the quest-to-quest graph from decoded questinfo fields and validate it against saves.

What it does:
    mission_parser.parse_quest_prefix() decodes the first part of every questinfo row
    (the part before the large nested stage records). Two key lists in it hold quest keys:
        keyList_b0 - quests that come BEFORE this one (predecessors)
        list_a0    - quests that come AFTER this one; each entry has a condition key
                     (for example "Quest_GraymaneDay && Quest_TrollUniversity_Brain")
                     that must hold before that next quest starts.
    The script
      1. builds edges  pred -> quest  (from keyList_b0) and  quest -> next  (from list_a0),
      2. compares the two directions for consistency,
      3. tests every edge against the three late saves: a real gate must have the
         predecessor completed first wherever both quests have a completion time,
      4. orders the main-story chapter quests with a topological sort and compares
         that order with the saves' chapter order.

Reads:  staticinfo tables, mission_parser.py, quests.json, three saves in late-saves/.
Writes: quest-graph.json, quest-graph-validation.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/quest_graph.py
"""
import json
import sys
from collections import Counter, defaultdict
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
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

SAVES = {"A_2106": "2106", "B_2796": "2796", "C_3268": "3268"}
quest_rows = gates.load_table("questinfo")
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
conditions = gates.condition_texts()
quests_json = {q["key"]: q for q in json.loads((HERE / "quests.json").read_text(encoding="utf-8"))}

# ---- decode
decoded = {}
for key, row in quest_rows.items():
    try:
        q, _ = parser.parse_quest_prefix(row)
    except Exception:  # noqa: BLE001 - row 1 is a placeholder; skip rows that do not decode
        continue
    decoded[key] = {
        "name": quest_names[key], "group": q["h58"],
        "before": [k for k in q["keyList_b0"] if k in quest_rows],
        "after": [{"quest": e["key"], "condition": conditions.get(e["key2"])}
                  for e in q["list_a0"] if e["key"] in quest_rows],
        "missions": q["keyList_d0"], "startMission": q["keys_f0"][0],
        "stages": len(q["keyList_e0"]),
    }

# ---- edges (pred -> quest)
edges_b = {(p, k) for k, d in decoded.items() for p in d["before"]}
edges_a = {(k, e["quest"]) for k, d in decoded.items() for e in d["after"]}
union = edges_b | edges_a
consistency = {
    "edgesFromBefore": len(edges_b), "edgesFromAfter": len(edges_a),
    "inBoth": len(edges_b & edges_a), "onlyBefore": len(edges_b - edges_a),
    "onlyAfter": len(edges_a - edges_b), "union": len(union),
}

# ---- save completion times for quests
times = {}
for label, folder in SAVES.items():
    path = ROOT / "research" / "vendor" / "work" / "late-saves" / folder / "save.save"
    objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects
    data = next(o for o in objects if o.get("__pycr_type__") == "QuestSaveData")
    times[label] = {r["_questKey"]: r["_completedTime"] for r in data["_questStateList"]
                    if r.get("_state") == 5 and r.get("_completedTime")}


def validate(edge_set):
    """Count edges whose predecessor finished first / after, per save."""
    out = {}
    for label, t in times.items():
        c = Counter()
        for p, k in edge_set:
            if p in t and k in t:
                c["predFirst" if t[p] <= t[k] else "predAfter"] += 1
            else:
                c["notBothTimed"] += 1
        out[label] = dict(c)
    return out


def edge_verdicts(edge_set):
    """Per edge: supported in every timed save / contradicted in any / untestable."""
    s = c = u = 0
    for p, k in edge_set:
        v = [t[p] <= t[k] for t in times.values() if p in t and k in t]
        if not v:
            u += 1
        elif all(v):
            s += 1
        else:
            c += 1
    return {"supportedInAllTimed": s, "contradictedInAny": c, "untestable": u}


validation = {
    "consistency": consistency,
    "perSave": {"before": validate(edges_b), "after": validate(edges_a), "union": validate(union)},
    "verdicts": {"before": edge_verdicts(edges_b), "after": edge_verdicts(edges_a),
                 "union": edge_verdicts(union)},
}

# ---- main story: topological order of chapter quests
main = {k for k, d in decoded.items() if 1000 <= d["group"] <= 1013}
indeg = {k: 0 for k in main}
adj = defaultdict(list)
for p, k in union:
    if p in main and k in main:
        adj[p].append(k)
        indeg[k] += 1
layers, ready, seen = [], sorted(k for k, n in indeg.items() if n == 0), set()
while ready:
    layers.append([quest_names[k] for k in ready])
    seen.update(ready)
    nxt = []
    for k in ready:
        for n in adj[k]:
            indeg[n] -= 1
            if indeg[n] == 0:
                nxt.append(n)
    ready = sorted(nxt)
validation["mainStory"] = {
    "chapterQuests": len(main), "edgesAmongThem": sum(len(v) for v in adj.values()),
    "orderedByTopologicalLayer": len(seen), "layers": layers,
    "cycleOrUnreached": [quest_names[k] for k in main if k not in seen],
}
# Do the layers agree with the saves' chapter order (group number)?
group_of = {k: decoded[k]["group"] for k in main}
layer_conflicts = 0
for p, k in union:
    if p in main and k in main and group_of[p] > group_of[k]:
        layer_conflicts += 1
validation["mainStory"]["edgesGoingToAnEarlierChapter"] = layer_conflicts

# ---- coverage over all quests
covered = {k for e in union for k in e}
real = [k for k, d in decoded.items() if quests_json.get(k, {}).get("category") in
        ("main-chapter", "faction-node", "faction", "side-or-story", "challenge", "contents")]
validation["coverage"] = {
    "questsDecoded": len(decoded), "questsInAnyEdge": len(covered),
    "playerQuestsConsidered": len(real),
    "playerQuestsInAnyEdge": sum(1 for k in real if k in covered),
    "playerQuestsWithAPredecessor": sum(1 for k in real if decoded[k]["before"]),
    "playerQuestsWithASuccessor": sum(1 for k in real if decoded[k]["after"]),
    "successorEntriesWithCondition": sum(1 for d in decoded.values() for e in d["after"]
                                         if e["condition"]),
}
(HERE / "quest-graph.json").write_text(json.dumps(
    {"quests": {quest_names[k]: {kk: vv for kk, vv in d.items() if kk != "name"}
                for k, d in decoded.items()},
     "edges": sorted([quest_names[p], quest_names[k]] for p, k in union)},
    indent=1, ensure_ascii=False), encoding="utf-8")
(HERE / "quest-graph-validation.json").write_text(
    json.dumps(validation, indent=1, ensure_ascii=False), encoding="utf-8")
print(json.dumps({k: v for k, v in validation.items() if k != "mainStory"}, indent=1))
ms = dict(validation["mainStory"])
ms["layers"] = [len(layer) for layer in ms["layers"]]
print(json.dumps(ms, indent=1))
