"""Join the mod's collectibles to quest scenes, regions and quest gates.

What it does:
    For every collectible in data/*-links.json (chests, nexuses, cressets, constellations,
    animals, memory fragments, sealed artifacts, shrines, bells, treasure maps) this script
      - assigns a region (code of the nearest faction node),
      - finds the nearest quest/mission scene (positions-v2-*.json and node-quest positions)
        and its distance,
      - attaches the game's own gate for it where known: the collectible's own mission
        (missionKey / mission / challenge) or, for chests, the level-phase gate from
        research/analysis/chest-level-gates.json (condition text).
    It writes the joined list and counts by category.
Reads:  data/*-links.json (read-only), research/analysis/chest-level-gates.json,
        faction-node-positions.json, positions-v2-quest.json, positions-v2-mission.json,
        quest-locations-from-nodes.json.
Writes: collectible-quest-join.json, collectible-join-summary.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/collectible_join.py
"""
import glob
import json
import math
import os
import statistics
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent


def load(path):
    """Read a JSON file."""
    return json.loads(Path(path).read_text(encoding="utf-8"))


nodes = load(HERE / "faction-node-positions.json")
node_list = [(n["x"], n["z"], name) for name, n in nodes.items()]
scenes = []
for label, name in (("quest", "positions-v2-quest.json"), ("mission", "positions-v2-mission.json"),
                    ("nodeQuest", "quest-locations-from-nodes.json")):
    for scene, pos in load(HERE / name).items():
        scenes.append((pos["x"], pos["z"], scene, label))


def nearest(x, z, items):
    """Nearest item by horizontal distance."""
    best = min(items, key=lambda i: (i[0] - x) ** 2 + (i[1] - z) ** 2)
    return best, math.hypot(best[0] - x, best[1] - z)


chest_gates = {}
for chest in load(ROOT / "research" / "analysis" / "chest-level-gates.json")["chests"]:
    chest_gates[tuple(chest["uuid"][:3])] = chest

joined, summary = [], defaultdict(Counter)
for path in sorted(glob.glob(str(ROOT / "data" / "*-links.json"))):
    data = load(path)
    category = os.path.basename(path).replace("-links.json", "")
    for entry in data.get("locations", []):
        pos = entry.get("gamePosition")
        if not pos:
            continue
        x, y, z = pos
        node, node_dist = nearest(x, z, node_list)
        parts = node[2].split("_")
        scene, scene_dist = nearest(x, z, scenes)
        row = {"category": category, "name": entry.get("name"), "x": round(x, 1), "z": round(z, 1),
               "region": parts[1] if len(parts) > 1 else node[2], "nearestNode": node[2],
               "nodeDistance": round(node_dist), "nearestScene": scene[2], "sceneKind": scene[3],
               "sceneDistance": round(scene_dist)}
        own = entry.get("missionKey") or entry.get("mission") or entry.get("challenge")
        if own:
            row["ownMission"] = entry.get("mission") or entry.get("challenge") or entry.get("missionKey")
        uuid = entry.get("uuid")
        if uuid and tuple(uuid[:3]) in chest_gates:
            gate = chest_gates[tuple(uuid[:3])]
            row["levelGate"] = gate.get("gate")
            phases = gate.get("phaseGates") or []
            if phases:
                row["gateCondition"] = phases[0].get("condition")
            if gate.get("owners"):
                row["gateOwners"] = [o.get("name") for o in gate["owners"]][:3]
        joined.append(row)
        summary[category]["total"] += 1
        summary[category]["sceneWithin500"] += row["sceneDistance"] < 500
        summary[category]["withOwnMission"] += "ownMission" in row
        summary[category]["withLevelGate"] += row.get("levelGate", "none-found") != "none-found"

(HERE / "collectible-quest-join.json").write_text(json.dumps(joined, indent=0, ensure_ascii=False),
                                                  encoding="utf-8")
(HERE / "collectible-join-summary.json").write_text(
    json.dumps({k: dict(v) for k, v in summary.items()}, indent=1), encoding="utf-8")
print(json.dumps({k: dict(v) for k, v in summary.items()}))
print("regions", dict(Counter(r["region"] for r in joined).most_common(8)))
print("median nearest scene distance", round(statistics.median(r["sceneDistance"] for r in joined)))
