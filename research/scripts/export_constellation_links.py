"""Write the list of Constellations the mod is built from (v0.114).

What it does:
    Takes the 13 Constellations found by survey_constellations.py (landmark
    type 1000005 "anamorphic_constellation", positions from the landmark
    list, one to one with the MapGenie points) and writes a small, stable
    data file: display name (the MapGenie name, e.g. "Shield Constellation"),
    UUID, position, region and the key of its challenge mission. Stops with
    an error if the count is not 13 or a row has no mission.

Save rule (full and early save copies, 2026-10-24; same pattern as the Abyss
Cresset save pair):
    done = QuestSaveData._missionStateList holds the constellation's
    challenge mission (Challenge_Anamorphic_<Name>) with state 5 (completed).
    A record at another state = not done yet (state 2 in every early save).
    No record = unknown, so the marker is not shown.

Reads:  research/analysis/constellation-survey.json
Writes: data/constellation-links.json (overwritten)
Run:    python -B research/scripts/export_constellation_links.py
"""
import json
from pathlib import Path

CONSTELLATION_COUNT = 13


def main():
    """Read the constellation survey, validate every row and write the data file."""
    # Folder of this script (research/scripts); parents[2] is the repository root.
    root = Path(__file__).resolve().parents[2]
    survey = json.loads((root / "research" / "analysis" / "constellation-survey.json").read_text(encoding="utf-8"))
    rows = survey["constellations"]
    if len(rows) != CONSTELLATION_COUNT:
        raise ValueError(f"Expected {CONSTELLATION_COUNT} Constellations, found {len(rows)}")
    locations = []
    for row in rows:
        if type(row.get("missionKey")) is not int or not row.get("mapGenieId"):
            raise ValueError(f"Incomplete row for {row['level']}")
        locations.append({
            "name": row["mapGenieName"],
            # The landmark list gives three words; the save's UUIDs have a fourth word of 0.
            "uuid": list(row["uuid"]) + [0],
            "gamePosition": row["gamePosition"],
            "region": row["region"],
            "level": row["level"],
            "mission": "Challenge_Anamorphic_" + row["gameName"],
            "missionKey": row["missionKey"],
            "mapGenieId": row["mapGenieId"],
            "mapGenieDistance": row["mapGenieDistance"],
        })
    if len({entry["missionKey"] for entry in locations}) != CONSTELLATION_COUNT:
        raise ValueError("Two constellations share a challenge mission")
    output = {
        "version": 1,
        "category": "Constellation (anamorphic_constellation 1000005)",
        "doneRule": "QuestSaveData._missionStateList record for missionKey with _state 5; "
                    "a record at another state = not done; no record = unknown",
        "nativeIcon": {
            "type": 409,
            "templateType": 29133,
            "templateName": "MapIcon_TestGimmick11",
            "category": "0xffffffff",
            "note": "the game's unused test icon; the UI add-on (v0.81) gives it the Pywel Atlas star-cluster picture",
        },
        "locations": locations,
    }
    path = root / "data" / "constellation-links.json"
    path.write_text(json.dumps(output, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"{len(locations)} Constellations written to {path}")


if __name__ == "__main__":
    main()
