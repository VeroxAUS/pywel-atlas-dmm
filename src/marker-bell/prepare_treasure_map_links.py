"""Embed the Hidden Treasure Map piece list for the native mod (0.29.0).

What it does:
    Converts data/treasure-map-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has the piece's name and number (1-12), its unique ID
    (UUID, 4 numbers), its game position, the knowledge key the save gets
    when the piece is picked up, and the row of its solution chest in
    kChestLinks (found by that chest's UUID in data/treasure-chest-links.json,
    whose order the chest table keeps). If any entry has a different shape,
    or a solution chest is not in the chest list, the script stops with an
    error instead of writing a suspect table.

Reads:  data/treasure-map-links.json and data/treasure-chest-links.json at the repository root
Writes: src/marker-bell/treasure-map-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_treasure_map_links.py
"""
import json
from pathlib import Path


def main():
    """Read the treasure map JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    data = directory.parents[1] / "data"
    mapping = json.loads((data / "treasure-map-links.json").read_text(encoding="utf-8"))
    chests = json.loads((data / "treasure-chest-links.json").read_text(encoding="utf-8"))["locations"]
    if mapping.get("version") != 1 or mapping.get("nativeIcon", {}).get("templateName") != "MapIcon_TestGimmick10":
        raise ValueError("Unexpected Treasure Map data file")
    if len(mapping["locations"]) != 12:
        raise ValueError("Expected 12 Treasure Map pieces")
    lines = [
        "// Generated from data/treasure-map-links.json by prepare_treasure_map_links.py - do not edit by hand.",
        "// Done = the save's knowledge list holds knowledgeKey at any level (picked up); no entry = not",
        "// yet (see NativeSaveReader.cpp). solutionChest is the row of the chest it leads to in kChestLinks.",
        "#pragma once",
        "struct TreasureMapLink { const char* name; unsigned piece; uint32_t uuid[4]; float position[3];",
        "    uint32_t knowledgeKey; unsigned solutionChest; };",
        "constexpr TreasureMapLink kTreasureMapLinks[] = {",
    ]
    keys = set()
    for number, entry in enumerate(mapping["locations"], start=1):
        if entry["piece"] != number:
            raise ValueError(f"Treasure Map pieces must be listed 1 to 12 in order (row {number})")
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
            raise ValueError("Unsupported treasure map UUID")
        # The piece's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported treasure map position")
        key = entry["knowledgeKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff or key in keys:
            raise ValueError(f"Unsupported or repeated treasure map knowledge key {key!r}")
        keys.add(key)
        name = entry["name"]
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64:
            raise ValueError(f"Unsupported treasure map name {name!r}")
        solution = entry["solutionChest"]
        rows = [row for row, chest in enumerate(chests)
                if chest["uuid"] == solution["uuid"] and chest["name"] == solution["name"]]
        if len(rows) != 1:
            raise ValueError(f"Solution chest {solution['name']!r} of {name!r} is not in the chest list once")
        lines.append("    {" + json.dumps(name) + ", " + str(number) + "u, {" +
                     ", ".join(str(v) + "u" for v in uuid) + "}, {" +
                     ", ".join(repr(float(v)) + "f" for v in position) + "}, " + str(key) + "u, " +
                     str(rows[0]) + "u},")
    lines.append("};")
    (directory / "treasure-map-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
