"""Embed the Kuku Pot item list for the native mod.

What it does:
    Converts data/kuku-pot-item-links.json (Abyss Cell No. 1, Power Cores and
    Aeserion Scales placed in the world) into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the object's unique ID (UUID,
    4 numbers), its game position and its gimmick key. If any entry has a
    different shape, a repeated UUID, or there are more than 256 entries
    (the per-category marker mask), the script stops with an error instead
    of writing a suspect table.

Reads:  data/kuku-pot-item-links.json at the repository root
Writes: src/marker-bell/kuku-pot-item-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_kuku_pot_item_links.py
"""
import json
from pathlib import Path

MAX_ENTRIES = 256


def main():
    """Read the Kuku Pot item JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "kuku-pot-item-links.json").read_text(encoding="utf-8"))
    if mapping.get("version") != 1 or mapping.get("nativeIcon", {}).get("templateName") != "MapIcon_Gimmick_KuKu_Battery":
        raise ValueError("Unexpected Kuku Pot item data file")
    if not 0 < len(mapping["locations"]) <= MAX_ENTRIES:
        raise ValueError(f"Expected 1 to {MAX_ENTRIES} Kuku Pot items, found {len(mapping['locations'])}")
    lines = [
        "// Generated from data/kuku-pot-item-links.json by prepare_kuku_pot_item_links.py - do not edit by hand.",
        "// Taken = a field-object record (FieldSaveData._fieldGimmickSaveDataList) with origin = uuid,",
        "// _gimmickInfoKey = gimmickKey, reason 1 or 2, reset never and its own uuid in the disabled list;",
        "// any other record = unknown; no record = not taken.",
        "#pragma once",
        "struct KukuPotItemLink { const char* name; uint32_t uuid[4]; float position[3]; uint32_t gimmickKey; };",
        "constexpr KukuPotItemLink kKukuPotItemLinks[] = {",
    ]
    seen = set()
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid) or tuple(uuid) in seen:
            raise ValueError("Unsupported or repeated Kuku Pot item UUID")
        seen.add(tuple(uuid))
        # The item's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported Kuku Pot item position")
        key = entry["gimmickKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff:
            raise ValueError(f"Unsupported gimmick key {key!r}")
        name = entry["name"]
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64:
            raise ValueError(f"Unsupported Kuku Pot item name {name!r}")
        lines.append("    {" + json.dumps(name) + ", {" + ", ".join(str(v) + "u" for v in uuid) +
                     "}, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}, " + str(key) + "u},")
    lines.append("};")
    (directory / "kuku-pot-item-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"{len(seen)} Kuku Pot items written to kuku-pot-item-links.h")


if __name__ == "__main__":
    main()
