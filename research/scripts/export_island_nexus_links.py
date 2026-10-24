"""Write the list of Abyss-island Nexuses the mod is built from (v0.95).

What it does:
    Takes the 53 Nexuses found by find_abyss_island_nexuses.py (44 on the
    Abyss islands, 7 in the Abyss core quest area, 2 at Kliff's houses on the
    surface), each with its position from its level file, and writes a small,
    stable data file: name, landmark type key, UUID, position, level and the
    paired MapGenie point. Stops with an error if the survey is incomplete
    (a missing position or MapGenie pair, a repeated UUID, or not 53 rows).

Save rule (offline, from the user's save copies and the v0.83 map trace):
    - discovered: the Bells' list (DiscoveredLevelGimmickSceneObjectSaveData)
      holds a record with the Nexus's type key and UUID, without flags;
    - activated: FieldSaveData._fieldGimmickSaveDataList holds a record for
      this UUID with reason 1, refill time "never" and state 353047760, the
      same rule as the surface Nexuses. In the saves AbyssIsland_0002 has both
      and AbyssIsland_0001 is discovered only; the game's own icons in the
      v0.83 trace sit at exactly those two (235 = activated, 335 = fog).
    The mod hides a Nexus once it is activated.

Reads:  research/analysis/abyss-island-nexus-survey.json
Writes: data/abyss-island-nexus-links.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_island_nexus_links.py
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
EXPECTED = 53
# Readable kind per landmark type key.
TYPE_KEYS = {1000008: "island", 1000114: "quest", 1000053: "housing"}


def readable(group):
    """Turn a level group like "AbyssIsland_SpireOfTheStars" into "Spire Of The Stars"."""
    words = group.removeprefix("AbyssIsland_")
    return re.sub(r"(?<=[a-z])(?=[A-Z])", " ", words)


def name_for(row):
    """A short, unique display name for the log and the save popup."""
    number = int(re.search(r"_(\d+)_Phase", row["level"]).group(1))
    if row["kind"] == "island":
        return f"Abyss-island Nexus {number} ({readable(row['group'])})"
    if row["kind"] == "quest":
        return f"Abyss core Nexus {number}"
    return f"Kliff's house Nexus {number}"


def main():
    """Check the survey and write the data file."""
    survey = json.loads((ROOT / "research" / "analysis" / "abyss-island-nexus-survey.json").read_text(encoding="utf-8"))
    rows = []
    for row in survey["nexuses"]:
        if TYPE_KEYS.get(row["typeKey"]) != row["kind"]:
            raise ValueError(f"{row['level']}: unexpected type key {row['typeKey']}")
        if not row["gamePosition"] or not str(row["positionSource"]).startswith("level file"):
            raise ValueError(f"{row['level']}: no position from its level file")
        if not row.get("mapGenieId"):
            raise ValueError(f"{row['level']}: no MapGenie pair")
        if len(row["uuid"]) != 4 or row["uuid"][3] != 0:
            raise ValueError(f"{row['level']}: unexpected UUID {row['uuid']}")
        rows.append({
            "name": name_for(row),
            "kind": row["kind"],
            "infoKey": row["typeKey"],
            "uuid": row["uuid"],
            "gamePosition": row["gamePosition"],
            "level": row["level"].lower(),
            "mapGenieId": row["mapGenieId"],
            "mapGenieDistance": row["mapGenieDistance"],
        })
    if len(rows) != EXPECTED:
        raise ValueError(f"Expected {EXPECTED} island Nexuses, found {len(rows)}")
    if len({tuple(row["uuid"]) for row in rows}) != len(rows) or len({row["name"] for row in rows}) != len(rows):
        raise ValueError("A Nexus UUID or name repeats")

    output = {
        "version": 1,
        "category": "Abyss-island Nexus (AbyssRuins_AbyssIsland, _Quest, _Housing)",
        "infoKeys": sorted(TYPE_KEYS),
        "discoveredRule": "DiscoveredLevelGimmickSceneObjectSaveData record with the row's infoKey and this UUID",
        "activatedRule": "FieldSaveData._fieldGimmickSaveDataList record for this UUID with reason 1, reset never "
                         "and state 353047760 or 1537827618 (2255254665 = not yet)",
        "nativeIcon": {"type": 235, "templateType": 28866, "templateName": "MapIcon_Abyss_Ruins", "category": "0x21"},
        "locations": rows,
    }
    (ROOT / "data" / "abyss-island-nexus-links.json").write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"{len(rows)} Abyss-island Nexuses written")


if __name__ == "__main__":
    main()
