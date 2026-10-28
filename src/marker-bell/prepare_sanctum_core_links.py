"""Embed the Sanctum Core list for the native mod.

What it does:
    Converts data/sanctum-core-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, its game position (the secret
    puzzle on the surface; the height is approximate) and the Witch mission
    key that says the Sanctum is cleansed (0 = no save rule, never hidden).
    If any entry has a different shape, a repeated key, or there are more
    than 256 entries (the per-category marker mask), the script stops with
    an error instead of writing a suspect table.

Reads:  data/sanctum-core-links.json at the repository root
Writes: src/marker-bell/sanctum-core-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_sanctum_core_links.py
"""
import json
from pathlib import Path

MAX_ENTRIES = 256


def main():
    """Read the Sanctum Core JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "sanctum-core-links.json").read_text(encoding="utf-8"))
    if mapping.get("version") != 1 or mapping.get("nativeIcon", {}).get("templateName") != "MapIcon_Gimmick_KuKu_Battery":
        raise ValueError("Unexpected Sanctum Core data file")
    if not 0 < len(mapping["locations"]) <= MAX_ENTRIES:
        raise ValueError(f"Expected 1 to {MAX_ENTRIES} Sanctum Cores, found {len(mapping['locations'])}")
    lines = [
        "// Generated from data/sanctum-core-links.json by prepare_sanctum_core_links.py - do not edit by hand.",
        "// Done = the Witch mission missionKey is at state 5 (cleansed) in QuestSaveData._missionStateList;",
        "// no record = unknown; missionKey 0 = no save rule known, so the marker is never hidden.",
        "#pragma once",
        "struct SanctumCoreLink { const char* name; float position[3]; uint32_t missionKey; };",
        "constexpr SanctumCoreLink kSanctumCoreLinks[] = {",
    ]
    keys = set()
    for entry in mapping["locations"]:
        # The core's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported Sanctum Core position")
        key = entry["missionKey"]
        if type(key) is not int or not 0 <= key <= 0xffffffff or (key and key in keys):
            raise ValueError(f"Unsupported or repeated Sanctum mission key {key!r}")
        keys.add(key)
        name = entry["name"]
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64:
            raise ValueError(f"Unsupported Sanctum Core name {name!r}")
        lines.append("    {" + json.dumps(name) + ", {" + ", ".join(repr(float(v)) + "f" for v in position) +
                     "}, " + str(key) + "u},")
    lines.append("};")
    (directory / "sanctum-core-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{len(mapping['locations'])} Sanctum Cores written to sanctum-core-links.h")


if __name__ == "__main__":
    main()
