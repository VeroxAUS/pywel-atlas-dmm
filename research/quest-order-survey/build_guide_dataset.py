"""Build the consolidated guide dataset (guide-dataset.json) and its coverage table.

What it does:
    Joins every result file of this folder into one dataset:
      quests    - key, title, description, chapter group, category, region, position (with
                  its source), giver NPCs, predecessor/successor quests (with the condition
                  text), missions, rewards (from their missions), save states + completion
                  times in the three saves, dependency layer.
      missions  - key, title, parent/children/next links, start condition (text) and the
                  mission/quest it needs, rewards, position, givers, save states.
      chapters  - the questgroup list (Prologue .. Epilogue) with the main-story layers.
      gates     - knowledge entries that open abilities/areas and who rewards them.
      collectibles - category counts joined to regions/quest scenes (file reference).
    It also writes guide-coverage.json: how much of each content type has order, position,
    giver, region, reward, text and gates.
Reads:  all JSON results in this folder.
Writes: guide-dataset.json, guide-coverage.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/build_guide_dataset.py
"""
import json
import math
import re
from collections import Counter, defaultdict
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load(name):
    """Read one JSON result file of this folder."""
    return json.loads((HERE / name).read_text(encoding="utf-8"))


quests_base = {q["name"]: q for q in load("quests.json")}
missions_base = {m["name"]: m for m in load("missions.json")}
groups = load("groups.json")
quest_graph = load("quest-graph.json")["quests"]
mission_graph = load("mission-graph.json")
rewards = load("mission-rewards.json")
quest_texts, mission_texts = load("quest-texts.json"), load("mission-texts.json")
pos_quest, pos_mission = load("positions-v2-quest.json"), load("positions-v2-mission.json")
node_quest = load("quest-locations-from-nodes.json")
nodes = load("faction-node-positions.json")
givers = load("giver-pins.json")
hints = load("mission-hints.json")
main_layers = load("main-story-order.json")["layers"]
gate_knowledge = load("gate-knowledge.json")["summary"]

node_list = [(n["x"], n["z"], name) for name, n in nodes.items()]


def region_of(x, z):
    """Region code of the nearest faction node."""
    best = min(node_list, key=lambda n: (n[0] - x) ** 2 + (n[1] - z) ** 2)
    parts = best[2].split("_")
    return parts[1] if len(parts) > 1 else best[2]


def position_for(name, node_source, scene_source):
    """Best position: faction node of the quest, else scripted-scene anchor."""
    if name in node_source:
        p = node_source[name]
        return {"x": p["x"], "y": p["y"], "z": p["z"], "source": "factionNode"}
    if name in scene_source:
        p = scene_source[name]
        return {"x": p["x"], "y": p["y"], "z": p["z"], "source": "sceneAnchor"}
    return None


# ---- dependency layers (longest chain) over the quest graph
before = {n: [p for p in q.get("before", [])] for n, q in quest_graph.items()}
edges = load("quest-graph.json")["edges"]
preds = defaultdict(list)
for a, b in edges:
    preds[b].append(a)
layer_memo = {}


def layer(name, seen=()):
    """Length of the longest predecessor chain behind a quest."""
    if name in layer_memo:
        return layer_memo[name]
    if name in seen:
        return 0
    depth = 0
    for p in preds.get(name, []):
        depth = max(depth, layer(p, seen + (name,)) + 1)
    layer_memo[name] = depth
    return depth


# ---- quest -> missions (names), rewards roll-up
mission_by_key = {m["key"]: n for n, m in missions_base.items()}
quest_out = {}
for name, base in quests_base.items():
    graph = quest_graph.get(name, {})
    texts = quest_texts.get(name, {})
    mission_names = [mission_by_key[k] for k in graph.get("missions", []) if k in mission_by_key]
    reward_texts = []
    for m in mission_names:
        reward_texts += rewards.get(m, [])
    pos = position_for(name, node_quest, pos_quest)
    entry = {
        "key": base["key"], "title": texts.get("title") or base.get("title"),
        "description": texts.get("description"), "chapterGroup": graph.get("group", base.get("group")),
        "category": base["category"],
        "before": preds.get(name, []),
        "after": [{"quest": n, "condition": c} for n, c in
                  ((quest_graph[name]["after"][i]["quest"], quest_graph[name]["after"][i]["condition"])
                   for i in range(len(quest_graph[name]["after"])))] if name in quest_graph else [],
        "layer": layer(name) if name in preds or name in quest_graph else None,
        "missions": mission_names[:60], "missionCount": len(mission_names),
        "rewards": reward_texts[:30],
        "position": pos, "region": region_of(pos["x"], pos["z"]) if pos else None,
        "givers": (givers["quests"].get(name) or [])[:3],
        "states": {k.replace("state:", ""): v for k, v in base.items() if k.startswith("state:")},
    }
    quest_out[name] = entry

# the quest graph stores keys for "after"; convert predecessor/successor keys to names
key_to_quest = {q["key"]: n for n, q in quests_base.items()}
for name, graph in quest_graph.items():
    if name in quest_out:
        quest_out[name]["after"] = [{"quest": key_to_quest.get(e["quest"], e["quest"]),
                                     "condition": e["condition"]} for e in graph["after"]]

mission_out = {}
needs_re = re.compile(r"(!?)\s*(Complete(?:Sub)?Mission|CompleteQuest)\(([^()]*)\)")
for name, base in missions_base.items():
    g = mission_graph.get(name, {})
    texts = mission_texts.get(name, {})
    pos = position_for(name, node_quest, pos_mission)
    needs = []
    for neg, fn, arg in needs_re.findall(g.get("startCondition") or ""):
        if not neg:
            needs.append(f"{fn}({arg.strip()})")
    mission_out[name] = {
        "key": base["key"], "title": texts.get("title") or base.get("title"),
        "category": base["category"],
        "parent": g.get("parent"), "children": g.get("children", []),
        "next": [n if isinstance(n, dict) else n for n in g.get("next", [])],
        "startCondition": g.get("startCondition"), "needs": needs,
        "hints": hints.get(name, []), "rewards": rewards.get(name, []),
        "position": pos, "region": region_of(pos["x"], pos["z"]) if pos else None,
        "givers": (givers["missions"].get(name) or [])[:3],
        "states": {k.replace("state:", ""): v for k, v in base.items() if k.startswith("state:")},
    }

# graph stores keys for parent/children/next; map to names
key_to_mission = {m["key"]: n for n, m in missions_base.items()}
for name, g in mission_graph.items():
    if name not in mission_out:
        continue
    m = mission_out[name]
    m["parent"] = key_to_mission.get(g.get("parent"))
    m["children"] = [key_to_mission.get(k, k) for k in g.get("children", [])]
    m["next"] = [{"mission": key_to_mission.get(e["mission"], e["mission"]), "condition": e["condition"]}
                 for e in g.get("next", [])]

dataset = {
    "schemaVersion": 1,
    "notes": ("Built from the game's static tables (exact row parsers), sequencer scene files "
              "(.paseq anchors, .paschedulepath routes) and three save copies. Positions are scene "
              "anchors unless source=factionNode; they are not objective markers."),
    "chapters": {str(k): v for k, v in groups.items() if 1000 <= int(k) <= 1013},
    "mainStoryLayers": main_layers,
    "quests": quest_out, "missions": mission_out,
    "gateKnowledge": gate_knowledge,
    "collectibleJoinFile": "collectible-quest-join.json",
}
(HERE / "guide-dataset.json").write_text(json.dumps(dataset, ensure_ascii=False), encoding="utf-8")

# ---- coverage table
def system(n):
    """True for non-player quest rows."""
    return n.startswith(("LevelSequencerSpawn", "cd_", "Func_", "Schedule_", "ReBlockading", "Shop_"))


def cover(items, order_test):
    """Share of entries with each kind of data."""
    n = len(items)
    c = Counter()
    for name, e in items.items():
        c["order"] += bool(order_test(e))
        c["prerequisite"] += bool(e.get("needs") or e.get("before"))
        c["startCondition"] += bool(e.get("startCondition"))
        c["next"] += bool(e.get("next") or e.get("after"))
        c["position"] += bool(e.get("position"))
        c["region"] += bool(e.get("region"))
        c["giver"] += bool(e.get("givers"))
        c["reward"] += bool(e.get("rewards"))
        c["title"] += bool(e.get("title"))
        c["description"] += bool(e.get("description"))
    return {"entries": n, **dict(c)}


player_quests = {n: e for n, e in quest_out.items() if not system(n)}
by_cat = defaultdict(dict)
for n, e in player_quests.items():
    by_cat[e["category"]][n] = e
q_order = lambda e: bool(e["before"] or e["after"])  # noqa: E731
m_order = lambda e: bool(e["needs"] or e["next"] or e["startCondition"])  # noqa: E731
coverage = {"quests": {cat: cover(items, q_order) for cat, items in by_cat.items()}}
mission_by_cat = defaultdict(dict)
for n, e in mission_out.items():
    mission_by_cat[e["category"]][n] = e
coverage["missions"] = {cat: cover(items, m_order) for cat, items in mission_by_cat.items()}
(HERE / "guide-coverage.json").write_text(json.dumps(coverage, indent=1), encoding="utf-8")
print(json.dumps(coverage, indent=1))
