"""Embed the surface Abyss Nexus list for the native mod (v0.79).

What it does:
    Converts data/abyss-nexus-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the Nexus's unique ID (UUID, 4
    numbers) and its game position. If any entry has a different shape the
    script stops with an error instead of writing a suspect table.

Reads:  data/abyss-nexus-links.json at the repository root
Writes: src/marker-bell/nexus-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_nexus_links.py
"""
import json
from pathlib import Path


def main():
    """Read the Nexus JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "abyss-nexus-links.json").read_text(encoding="utf-8"))
    if mapping.get("infoKey") != 1000001:
        raise ValueError("Unexpected Abyss Nexus info key")
    lines = [
        "// Generated from data/abyss-nexus-links.json by prepare_nexus_links.py - do not edit by hand.",
        "// Discovered = a DiscoveredLevelGimmickSceneObjectSaveData record with key kNexusInfoKey and",
        "// this UUID; activated = a field-object record for this UUID in an opened state",
        "// (see NativeSaveReader.cpp).",
        "#pragma once",
        "constexpr uint32_t kNexusInfoKey = 1000001; // \"AbyssRuins_Field\" in the level-gimmick table.",
        "struct NexusLink { const char* name; uint32_t uuid[4]; float position[3]; };",
        "constexpr NexusLink kNexusLinks[] = {",
    ]
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
            raise ValueError("Unsupported Nexus UUID")
        # The Nexus's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported Nexus position")
        lines.append("    {" + json.dumps(entry["name"]) + ", {" + ", ".join(str(v) + "u" for v in uuid) +
                     "}, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}},")
    lines.append("};")
    (directory / "nexus-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
