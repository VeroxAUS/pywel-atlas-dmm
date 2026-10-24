"""Write the list of Abyss Cressets the mod is built from (v0.105).

What it does:
    Takes the 101 Abyss Cressets found by survey_landmark_categories.py
    (landmark types 1000004 "Puzzle_StandStone" and 1000103
    "Adventure_StandStone", positions from the landmark list, one to one
    with the MapGenie points) and writes a small, stable data file: display
    name (the MapGenie name, e.g. "A Hill Guided by Light"), UUID, position,
    region, the cresset's challenge mission and its key. Stops with an error
    if the count is not 101 or any cresset has no mission.

Save rule (from the user's save copies and a before/after pair, 2026-10-24):
    done = QuestSaveData._missionStateList holds the cresset's challenge
    mission with state 5 (completed). A record at any other state = not done
    yet (every cresset's mission is at state 2 early in the game). No record
    = unknown, so the marker is not shown. The Bells'-list record for the
    cresset only means it was discovered, and the reward item (key 75001) is
    one count shared by every cresset, so neither is used.

Reads:  research/analysis/abyss-cresset-survey.json
Writes: data/abyss-cresset-links.json (overwritten)
Run:    python -B research/scripts/export_cresset_links.py
"""
import json
from pathlib import Path

CRESSET_COUNT = 101
LANDMARK_TYPES = {"puzzle": 1000004, "adventure": 1000103}


def main():
    """Read the cresset survey, validate every row and write the data file."""
    # Folder of this script (research/scripts); parents[1] is the repository root.
    root = Path(__file__).resolve().parents[2]
    survey = json.loads((root / "research" / "analysis" / "abyss-cresset-survey.json").read_text(encoding="utf-8"))
    rows = survey["cressets"]
    if len(rows) != CRESSET_COUNT:
        raise ValueError(f"Expected {CRESSET_COUNT} Abyss Cressets, found {len(rows)}")
    locations = []
    for row in rows:
        if LANDMARK_TYPES.get(row["kind"]) != row["landmarkType"]:
            raise ValueError(f"Unexpected landmark type for {row['alias']}")
        if type(row.get("missionKey")) is not int:
            raise ValueError(f"No challenge mission for {row['alias']}")
        if not row.get("mapGenieId"):
            raise ValueError(f"No MapGenie point for {row['alias']}")
        locations.append({
            "name": row["mapGenieName"],
            # The landmark list gives three words; the save's UUIDs have a fourth word of 0.
            "uuid": list(row["uuid"]) + [0],
            "gamePosition": row["gamePosition"],
            "region": row["region"],
            "kind": row["kind"],
            "alias": row["alias"],
            "level": row["level"],
            "mission": row["missionName"],
            "missionKey": row["missionKey"],
            "mapGenieId": row["mapGenieId"],
            "mapGenieDistance": row["mapGenieDistance"],
        })
    if len({entry["missionKey"] for entry in locations}) != CRESSET_COUNT:
        raise ValueError("Two cressets share a challenge mission")
    output = {
        "version": 1,
        "category": "Abyss Cresset (Puzzle_StandStone 1000004, Adventure_StandStone 1000103)",
        "doneRule": "QuestSaveData._missionStateList record for missionKey with _state 5; "
                    "a record at another state = not done; no record = unknown",
        "nativeIcon": {
            "type": 340,
            "templateType": None,
            "templateName": "MapIcon_StandStone",
            "category": "0xffffffff",
        },
        "locations": locations,
    }
    path = root / "data" / "abyss-cresset-links.json"
    path.write_text(json.dumps(output, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"{len(locations)} Abyss Cressets written to {path}")


if __name__ == "__main__":
    main()
