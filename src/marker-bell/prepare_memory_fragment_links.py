"""Embed the Memory Fragment list for the native mod.

What it does:
    Converts data/memory-fragment-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the fragment's unique ID (UUID,
    4 numbers), its game position and its knowledge key. If any entry has a
    different shape, a repeated key, or there are more than 256 entries (the
    per-category marker mask), the script stops with an error instead of
    writing a suspect table.

Reads:  data/memory-fragment-links.json at the repository root
Writes: src/marker-bell/memory-fragment-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_memory_fragment_links.py
"""
import json
from pathlib import Path

MAX_ENTRIES = 256


def main():
    """Read the fragment JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "memory-fragment-links.json").read_text(encoding="utf-8"))
    if mapping.get("version") != 1 or mapping.get("nativeIcon", {}).get("templateName") != "MapIcon_Item_Visione_Memory_Chip":
        raise ValueError("Unexpected Memory Fragment data file")
    if not 0 < len(mapping["locations"]) <= MAX_ENTRIES:
        raise ValueError(f"Expected 1 to {MAX_ENTRIES} Memory Fragments, found {len(mapping['locations'])}")
    lines = [
        "// Generated from data/memory-fragment-links.json by prepare_memory_fragment_links.py - do not edit by hand.",
        "// Collected = the save's knowledge list (KnowledgeSaveData._list) holds knowledgeKey at any level;",
        "// missing = not collected.",
        "#pragma once",
        "struct MemoryFragmentLink { const char* name; uint32_t uuid[4]; float position[3]; uint32_t knowledgeKey; };",
        "constexpr MemoryFragmentLink kMemoryFragmentLinks[] = {",
    ]
    keys = set()
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
            raise ValueError("Unsupported fragment UUID")
        # The fragment's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported fragment position")
        key = entry["knowledgeKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff or key in keys:
            raise ValueError(f"Unsupported or repeated fragment knowledge key {key!r}")
        keys.add(key)
        name = entry["name"]
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64:
            raise ValueError(f"Unsupported fragment name {name!r}")
        lines.append("    {" + json.dumps(name) + ", {" + ", ".join(str(v) + "u" for v in uuid) +
                     "}, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}, " + str(key) + "u},")
    lines.append("};")
    (directory / "memory-fragment-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{len(keys)} Memory Fragments written to memory-fragment-links.h")


if __name__ == "__main__":
    main()
