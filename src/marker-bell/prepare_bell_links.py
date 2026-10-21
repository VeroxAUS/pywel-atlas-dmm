"""Embed existing verified Bell identities for the native read-only proof.

What it does:
    Converts the verified list of Bell locations in data/bell-save-links.json
    into a C++ header, so the native mod can include the table when it is
    built instead of reading JSON while the game runs. Each row has a POI
    ("point of interest") id, a name, a UUID made of 4 numbers and 5 type
    keys, all unsigned 32-bit numbers. If any entry has a different shape the
    script stops with an error instead of writing a suspect table.

Reads:  data/bell-save-links.json at the repository root (its "locations" list,
        each with poiId, name, uuid and typeKeys)
Writes: src/marker-bell/bell-proof-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_bell_links.py
"""
import json
from pathlib import Path


def main():
    """Read the Bell JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "bell-save-links.json").read_text(encoding="utf-8"))
    # Header start: a C++ struct describing one row, then the array opening.
    lines = [
        "// Generated from verified outputs/data/bell-save-links.json.",
        "#pragma once",
        "struct BellLink { const char* id; const char* name; uint32_t uuid[4]; uint32_t keys[5]; };",
        "constexpr BellLink kBellLinks[] = {",
    ]
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        keys = entry["typeKeys"]
        # Validate: exactly 4 UUID parts and 5 keys, each a whole number that
        # fits in an unsigned 32-bit integer.
        if len(uuid) != 4 or len(keys) != 5 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid + keys):
            raise ValueError("Unsupported Bell identity")
        # Emit one C++ initializer row. json.dumps quotes and escapes the text,
        # and the "u" suffix marks each number as unsigned.
        lines.append("    {" + json.dumps(entry["poiId"]) + ", " + json.dumps(entry["name"]) +
                     ", {" + ", ".join(str(v) + "u" for v in uuid) + "}, {" +
                     ", ".join(str(v) + "u" for v in keys) + "}},")
    lines.append("};")
    # Write the header next to this script.
    (directory / "bell-proof-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
