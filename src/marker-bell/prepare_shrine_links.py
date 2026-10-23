"""Embed the checked Greymane Shrine list for the native mod.

What it does:
    Converts data/greymane-shrine-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has the map id, the name, the shrine's knowledge key
    (the save record that says it was found) and its game position.
    If any entry has a different shape the script stops with an error
    instead of writing a suspect table.

Reads:  data/greymane-shrine-links.json at the repository root
Writes: src/marker-bell/shrine-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_shrine_links.py
"""
import json
from pathlib import Path


def main():
    """Read the shrine JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "greymane-shrine-links.json").read_text(encoding="utf-8"))
    lines = [
        "// Generated from data/greymane-shrine-links.json by prepare_shrine_links.py - do not edit by hand.",
        "// Found = knowledgeKey present in the save's KnowledgeSaveData._list at level 2 or more.",
        "#pragma once",
        "struct ShrineLink { const char* id; const char* name; uint32_t knowledgeKey; float position[3]; };",
        "constexpr ShrineLink kShrineLinks[] = {",
    ]
    for entry in mapping["locations"]:
        key = entry["knowledgeKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff:
            raise ValueError("Unsupported shrine knowledge key")
        # The temple's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported shrine position")
        lines.append("    {" + json.dumps(entry["poiId"]) + ", " + json.dumps(entry["name"]) + ", " +
                     str(key) + "u, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}},")
    lines.append("};")
    (directory / "shrine-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
