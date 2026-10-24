"""Embed the Abyss Cresset list for the native mod (v0.105).

What it does:
    Converts data/abyss-cresset-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the cresset's unique ID (UUID,
    4 numbers), its game position and the key of its challenge mission. If
    any entry has a different shape the script stops with an error instead
    of writing a suspect table.

Reads:  data/abyss-cresset-links.json at the repository root
Writes: src/marker-bell/cresset-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_cresset_links.py
"""
import json
from pathlib import Path


def main():
    """Read the cresset JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "abyss-cresset-links.json").read_text(encoding="utf-8"))
    if mapping.get("version") != 1 or mapping.get("nativeIcon", {}).get("templateName") != "MapIcon_StandStone":
        raise ValueError("Unexpected Abyss Cresset data file")
    if len(mapping["locations"]) != 101:
        raise ValueError("Expected 101 Abyss Cressets")
    lines = [
        "// Generated from data/abyss-cresset-links.json by prepare_cresset_links.py - do not edit by hand.",
        "// Done = the save's mission list holds missionKey at state 5 (completed); another state = not",
        "// done yet; no record = unknown (see NativeSaveReader.cpp).",
        "#pragma once",
        "struct CressetLink { const char* name; uint32_t uuid[4]; float position[3]; uint32_t missionKey; };",
        "constexpr CressetLink kCressetLinks[] = {",
    ]
    keys = set()
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
            raise ValueError("Unsupported cresset UUID")
        # The cresset's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported cresset position")
        key = entry["missionKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff or key in keys:
            raise ValueError(f"Unsupported or repeated cresset mission key {key!r}")
        keys.add(key)
        # MapGenie uses typographic apostrophes; the mod's text is plain ASCII.
        name = entry["name"].replace("‘", "'").replace("’", "'")
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64:
            raise ValueError(f"Unsupported cresset name {name!r}")
        lines.append("    {" + json.dumps(name) + ", {" + ", ".join(str(v) + "u" for v in uuid) +
                     "}, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}, " + str(key) + "u},")
    lines.append("};")
    (directory / "cresset-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
