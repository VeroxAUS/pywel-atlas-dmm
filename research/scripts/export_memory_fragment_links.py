"""Write the list of Memory Fragments the mod is built from.

What it does:
    Takes the fragment placements found by find_memory_fragments.py and writes
    a small, stable data file with one entry per fragment: display name (the
    game's English name), knowledge key, UUID, position, level, region and
    MapGenie id. Only plain and Alustin journal fragments are kept; the
    boss-rematch chips are left out (MapGenie hardly lists them and they sit
    in the boss rematch arenas).

    Some fragments are placed more than once (a story level plus a sector or
    rematch copy at the same spot). One placement is kept per knowledge key,
    in this order of preference:
      1. a placement paired with a MapGenie point (name agreeing first, then
         the closest);
      2. a placement in the dedicated "visione_chip" level;
      3. a placement outside the sector_* and bossrematch_* levels;
      4. otherwise the first one found.
    Knowledge entries with no placement are listed under "notPlaced".

Save rule (full save copy and the 12 live slots, 2026-10-25):
    collected = KnowledgeSaveData._list holds the fragment's knowledge key
    (any _level; the full save has all 327 at level 1, early saves have none).
    Missing = not collected.

Reads:  research/analysis/memory-fragment-survey.json
Writes: data/memory-fragment-links.json (overwritten)
Run:    python -B research/scripts/export_memory_fragment_links.py
"""
import json
import unicodedata
from pathlib import Path

KINDS = {"plain": "plain", "Alustin_Journal": "journal"}
MAX_ENTRIES = 256  # The marker masks hold 256 markers per category.


def kind_of(game_name):
    """Return "plain", "journal" or None (boss rematch) for a knowledge name."""
    lower = game_name.lower()
    if "bossrematch" in lower:
        return None
    return "journal" if "alustin_journal" in lower else "plain"


def ascii_name(text):
    """Return the name as plain ASCII: typographic quotes and accents simplified."""
    text = text.replace("‘", "'").replace("’", "'").replace("“", '"').replace("”", '"')
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode()
    if not 0 < len(text) < 64:
        raise ValueError(f"Unsupported fragment name {text!r}")
    return text


def preference(row):
    """Sort key: lower is better (see the module comment for the order)."""
    level = row["level"].lower()
    if row.get("mapGenieId"):
        return (0, not row.get("mapGenieNameMatches"), row["mapGenieDistance"])
    if level == "visione_chip":
        return (1, False, 0)
    if not level.startswith(("sector_", "bossrematch_")):
        return (2, False, 0)
    return (3, False, 0)


def main():
    """Pick one placement per fragment, validate it and write the data file."""
    # Folder of this script (research/scripts); parents[2] is the repository root.
    root = Path(__file__).resolve().parents[2]
    survey = json.loads((root / "research" / "analysis" / "memory-fragment-survey.json").read_text(encoding="utf-8"))

    by_key = {}
    for row in survey["fragments"]:
        if row["knowledgeKey"] and kind_of(row["gameName"]):
            by_key.setdefault(row["knowledgeKey"], []).append(row)

    locations = []
    for key, rows in sorted(by_key.items()):
        row = min(rows, key=preference)
        if not row["englishName"] or len(row["uuid"]) != 4:
            raise ValueError(f"Incomplete row for {row['gameName']}")
        locations.append({
            "name": ascii_name(row["englishName"]),
            "knowledgeKey": key,
            "gameName": row["gameName"],
            "uuid": row["uuid"],
            "gamePosition": row["gamePosition"],
            "level": row["level"],
            "region": row.get("region"),
            "mapGenieId": row.get("mapGenieId"),
            "kind": kind_of(row["gameName"]),
            "placements": len(rows),
        })
    if len(locations) > MAX_ENTRIES:
        raise ValueError(f"{len(locations)} fragments do not fit the {MAX_ENTRIES}-marker mask")

    not_placed = [{"knowledgeKey": entry["knowledgeKey"], "gameName": entry["gameName"],
                   "name": entry["englishName"]}
                  for entry in survey["unplacedKnowledgeEntries"] if kind_of(entry["gameName"])]
    output = {
        "version": 1,
        "category": "Memory Fragment (Knowledge_Visione_Chip_*, plain and Alustin journal)",
        "doneRule": "collected = KnowledgeSaveData._list holds knowledgeKey (any _level); missing = not collected",
        "placementChoice": "one placement per knowledge key: MapGenie-paired (name agreeing, then closest), "
                           "else the visione_chip level, else a non-sector/non-rematch level, else the first",
        # The game's own fragment icon (v0.103 F8 trace "worldlook" lines; types 222
        # and 223 share it). Its template id is not traced yet: the F8 catalogue
        # only lists Gimmick/Treasure/Pin_Marker/StandStone names.
        "nativeIcon": {
            "type": 222,
            "templateType": None,
            "templateName": "MapIcon_Item_Visione_Memory_Chip",
            "category": "0xffffffff",
            "look": "0x16f1",
            "note": "world layout in worldmapicon.thtml with zoom window 0.88 0.93 1 1 (like the Bell icon); "
                    "minimap layout in minimapicon.thtml; templateType needs one F8 run with the catalogue "
                    "filter widened to Item names",
        },
        "locations": locations,
        "notPlaced": not_placed,
    }
    path = root / "data" / "memory-fragment-links.json"
    path.write_text(json.dumps(output, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"{len(locations)} Memory Fragments written to {path} "
          f"({sum(1 for e in locations if e['kind'] == 'journal')} journal, "
          f"{sum(1 for e in locations if e['mapGenieId'])} with MapGenie), {len(not_placed)} not placed")


if __name__ == "__main__":
    main()
