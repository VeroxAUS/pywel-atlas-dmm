"""Embed the treasure chest list for the native mod.

What it does:
    Converts data/treasure-chest-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the chest's unique ID (UUID, 4
    numbers), its game position and (v0.68) which save rule decides it is
    opened: "list" (the Bells' list only) or "field" (puzzle strongboxes and
    surface itemboxes: the field-object list, or the Bells' list). v0.69 adds
    a second table, kAbyssChestLinks, for the Abyss chests (their own map
    category; Bells'-list rule). If any entry has a different shape the
    script stops with an error instead of writing a suspect table.

Reads:  data/treasure-chest-links.json and data/abyss-chest-links.json at the repository root
Writes: src/marker-bell/chest-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_chest_links.py
"""
import json
from pathlib import Path

# Save rule name in the JSON -> constant name in the header.
RULES = {"list": "kChestRuleList", "field": "kChestRuleField"}


def table_line(entry, default_rule=None):
    """One validated C++ table row for a chest entry."""
    uuid = entry["uuid"]
    if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
        raise ValueError("Unsupported chest UUID")
    # The chest's game-world position (X/Z horizontal, Y altitude).
    position = entry["gamePosition"]
    if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
        raise ValueError("Unsupported chest position")
    rule = RULES.get(entry.get("rule", default_rule))
    if rule is None:
        raise ValueError(f"Unsupported chest save rule {entry.get('rule')!r}")
    return ("    {" + json.dumps(entry["name"]) + ", {" + ", ".join(str(v) + "u" for v in uuid) +
            "}, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}, " + rule + "},")


def main():
    """Read the chest JSON files, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    data = directory.parents[1] / "data"
    mapping = json.loads((data / "treasure-chest-links.json").read_text(encoding="utf-8"))
    abyss = json.loads((data / "abyss-chest-links.json").read_text(encoding="utf-8"))
    if mapping.get("infoKey") != 1000007 or abyss.get("infoKey") != 1000007:
        raise ValueError("Unexpected chest info key")
    lines = [
        "// Generated from data/treasure-chest-links.json by prepare_chest_links.py - do not edit by hand.",
        "// Opened = a DiscoveredLevelGimmickSceneObjectSaveData record with key kChestInfoKey,",
        "// this UUID and _isCompleted = true. Rows with kChestRuleField (v0.68: puzzle",
        "// strongboxes, surface itemboxes) may instead use key kSectorChestInfoKey, or a",
        "// field-object record for this UUID (see NativeSaveReader.cpp).",
        "#pragma once",
        "constexpr uint32_t kChestInfoKey = 1000007; // \"TreasureBox\" in the level-gimmick table.",
        "constexpr uint32_t kSectorChestInfoKey = 1000134; // \"TreasureBox_Sector\".",
        "enum ChestRule : uint8_t { kChestRuleList = 0, kChestRuleField = 1 };",
        "struct ChestLink { const char* name; uint32_t uuid[4]; float position[3]; ChestRule rule; };",
        "constexpr ChestLink kChestLinks[] = {",
    ]
    for entry in mapping["locations"]:
        lines.append(table_line(entry))
    lines.append("};")
    # v0.69: Abyss chests (map category "Abyss Chest"), Bells'-list rule only.
    lines.append("// Abyss chests (v0.69): same record and key as above; shown with the chest icon (v0.70).")
    lines.append("constexpr ChestLink kAbyssChestLinks[] = {")
    for entry in abyss["locations"]:
        lines.append(table_line(entry, "list"))
    lines.append("};")
    (directory / "chest-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
