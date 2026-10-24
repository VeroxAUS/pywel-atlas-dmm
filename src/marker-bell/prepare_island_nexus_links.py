"""Embed the Abyss-island Nexus list for the native mod (v0.95).

What it does:
    Converts data/abyss-island-nexus-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the Nexus's landmark type key,
    its unique ID (UUID, 4 numbers) and its game position. Only the 51
    Nexuses on the Abyss map go here; the 2 at Kliff's houses are on the
    surface map and join the surface Nexus list instead (prepare_nexus_links.py).
    If any entry has a different shape the script stops with an error instead
    of writing a suspect table.

Reads:  data/abyss-island-nexus-links.json at the repository root
Writes: src/marker-bell/island-nexus-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_island_nexus_links.py
"""
import json
from pathlib import Path

# Landmark type keys in the level-gimmick table: island, quest-area and housing Nexuses.
INFO_KEYS = {1000008, 1000114, 1000053}
HOUSING_KEY = 1000053  # Surface Nexuses at Kliff's houses: not in this list.


def main():
    """Read the island Nexus JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "abyss-island-nexus-links.json").read_text(encoding="utf-8"))
    if set(mapping.get("infoKeys") or []) != INFO_KEYS:
        raise ValueError("Unexpected Abyss-island Nexus info keys")
    rows = [entry for entry in mapping["locations"] if entry["infoKey"] != HOUSING_KEY]
    if len(mapping["locations"]) != 53 or len(rows) != 51:
        raise ValueError("Expected 53 Nexuses in the file, 51 of them on the Abyss map")
    lines = [
        "// Generated from data/abyss-island-nexus-links.json by prepare_island_nexus_links.py - do not edit by hand.",
        "// Discovered = a DiscoveredLevelGimmickSceneObjectSaveData record with the row's infoKey and",
        "// this UUID; activated = a field-object record for this UUID in an opened state",
        "// (see NativeSaveReader.cpp).",
        "#pragma once",
        "// infoKey: 1000008 \"AbyssRuins_AbyssIsland\" or 1000114 \"AbyssRuins_AbyssIsland_Quest\".",
        "struct IslandNexusLink { const char* name; uint32_t infoKey; uint32_t uuid[4]; float position[3]; };",
        "constexpr IslandNexusLink kIslandNexusLinks[] = {",
    ]
    for entry in rows:
        if entry["infoKey"] not in INFO_KEYS:
            raise ValueError("Unsupported island Nexus info key")
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
            raise ValueError("Unsupported island Nexus UUID")
        # The Nexus's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported island Nexus position")
        lines.append("    {" + json.dumps(entry["name"]) + ", " + str(entry["infoKey"]) + "u, {" +
                     ", ".join(str(v) + "u" for v in uuid) + "}, {" +
                     ", ".join(repr(float(v)) + "f" for v in position) + "}},")
    lines.append("};")
    (directory / "island-nexus-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
