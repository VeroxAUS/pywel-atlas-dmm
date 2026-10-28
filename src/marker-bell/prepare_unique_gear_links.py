"""Embed the unique gear list for the native mod (v0.108).

What it does:
    Converts data/unique-gear-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has the item's readable name, its item key, where
    it comes from (a reward scene, lying on the ground, or a quest item on
    the ground), its game position, and what the save must show for it to
    be collected: a reward item's stage key, or a ground item's unique ID
    (UUID, first 3 numbers). If any entry has a different shape the script
    stops with an error instead of writing a suspect table.

Reads:  data/unique-gear-links.json at the repository root
Writes: src/marker-bell/unique-gear-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_unique_gear_links.py
"""
import json
from pathlib import Path

# The C++ name of each source kind (see the header's enum).
SOURCES = {"reward": "kUniqueGearReward", "ground": "kUniqueGearGround", "quest": "kUniqueGearQuest"}


def main():
    """Read the unique gear JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "unique-gear-links.json").read_text(encoding="utf-8"))
    items = mapping["items"]
    # 0.29.1: 44 items, the second Acria Sword (lying in the Ancestors' Ruins) added.
    if len(items) != 44:
        raise ValueError("Expected 44 unique gear items")
    lines = [
        "// Generated from data/unique-gear-links.json by prepare_unique_gear_links.py - do not edit by hand.",
        "// Collected (see NativeSaveReader.cpp): a reward item when the save's stage list holds stageKey at",
        "// state 5 (completed); a ground or quest item when the save's field-object list has a record of its",
        "// uuid (first 3 numbers) with reason 2 that never resets.",
        "#pragma once",
        "enum UniqueGearSource : uint8_t { kUniqueGearReward, kUniqueGearGround, kUniqueGearQuest };",
        "struct UniqueGearLink {",
        "    const char* name; uint32_t itemKey; UniqueGearSource source; float position[3];",
        "    uint32_t stageKey; uint32_t uuid[3];",
        "};",
        "constexpr UniqueGearLink kUniqueGearLinks[] = {",
    ]
    seen = set()
    for entry in items:
        name = entry["name"]
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64 or '"' in name:
            raise ValueError(f"Unsupported unique gear name {name!r}")
        source = entry["source"]
        if source not in SOURCES:
            raise ValueError(f"Unsupported unique gear source {source!r}")
        key = entry["itemKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff:
            raise ValueError(f"Unsupported item key {key!r}")
        # The item's game-world position (X/Z horizontal, Y altitude; Y above 1500 is the Abyss).
        position = [entry["x"], entry["y"], entry["z"]]
        if any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported unique gear position")
        if (entry["world"] == "Abyss") != (position[1] > 1500):
            raise ValueError(f"World and altitude disagree for {name!r}")
        if source == "reward":
            stage = entry["stageKey"]
            if type(stage) is not int or not 0 < stage <= 0xffffffff:
                raise ValueError(f"Unsupported stage key {stage!r}")
            uuid = [0, 0, 0]
            identity = ("stage", stage)
        else:
            stage = 0
            uuid = entry["uuid"]
            if len(uuid) != 3 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
                raise ValueError("Unsupported unique gear UUID")
            identity = ("uuid", tuple(uuid))
        if identity in seen:
            raise ValueError(f"Repeated unique gear identity for {name!r}")
        seen.add(identity)
        lines.append("    {" + json.dumps(name) + ", " + str(key) + "u, " + SOURCES[source] + ", {" +
                     ", ".join(repr(float(v)) + "f" for v in position) + "}, " + str(stage) + "u, {" +
                     ", ".join(str(v) + "u" for v in uuid) + "}},")
    lines.append("};")
    (directory / "unique-gear-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
