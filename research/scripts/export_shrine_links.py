"""Write the checked Greymane Shrine list the mod is built from.

What it does:
    Copies the 12 shrines from the research output into a small, stable data
    file (data/greymane-shrine-links.json), keeping only what the mod needs:
    map id and name, the game's faction node key, the shrine's knowledge key
    (the save record that says it was found), and its game position.
    Stops with an error if the research output does not have exactly 12
    shrines, each with one knowledge key and a plausible position.

Save rule (confirmed in game 2026-10-22, docs/native-save-detection.md):
    a shrine is found when its knowledge key is in the save's
    KnowledgeSaveData._list at level 2. Missing or level 1 = not found.

Reads:  research/analysis/greymane-shrine-positions.json
Writes: data/greymane-shrine-links.json (overwritten)
Run:    python -B research/scripts/export_shrine_links.py
"""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]


def main():
    """Validate the research rows and write the data file."""
    research = json.loads((ROOT / "research" / "analysis" / "greymane-shrine-positions.json")
                          .read_text(encoding="utf-8"))
    rows = []
    for entry in research["shrines"]:
        knowledge = entry["knowledge"]
        position = entry["gamePosition"]
        # One knowledge key per shrine, and a position inside the world.
        if len(knowledge) != 1 or len(position) != 3 or any(abs(v) > 100000 for v in position):
            raise ValueError(f"Unexpected shrine row {entry.get('poiName')}")
        rows.append({
            "poiId": entry["poiId"],
            "name": entry["poiName"],
            "nodeKey": entry["nodeKey"],
            "knowledgeKey": knowledge[0]["knowledgeKey"],
            "gamePosition": position,
            "positionSource": entry["positionSource"],
        })
    if len(rows) != 12 or len({row["knowledgeKey"] for row in rows}) != 12:
        raise ValueError("Expected 12 shrines with 12 different knowledge keys")

    output = {
        "version": 1,
        "category": "Greymane Shrine",
        "saveType": "KnowledgeSaveData",
        "saveList": "_list",
        "foundRule": "knowledge key present at _level >= 2 (level 1 or missing = not found)",
        "nativeIcon": {"type": 186, "templateType": 28812, "templateName": "MapIcon_Gimmick_GreyManeTemple"},
        "evidence": "Rule confirmed 2026-10-22 with Nas River and Deepfog Basin and the Well-Informed "
                    "Greymane challenge count; positions from the level files (Kingshield Mountains "
                    "Northern: user in-game check). See docs/native-save-detection.md.",
        "locations": rows,
    }
    (ROOT / "data" / "greymane-shrine-links.json").write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"{len(rows)} shrines written")


if __name__ == "__main__":
    main()
