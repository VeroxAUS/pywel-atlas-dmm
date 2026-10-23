"""Embed the chest contents for the map tooltips.

What it does:
    Converts the "Chest" rows of research/analysis/treasure-chest-contents.json
    (made by research/scripts/find_chest_contents.py) into a C++ header. The
    header holds one entry per chest, in the same order as
    data/treasure-chest-links.json (marker keys come from row numbers): the
    English name of the main item inside, followed by its type in brackets
    for equipment ("Witch's Earring (Earring)"), or nullptr when the
    research script could not name it. v0.91 adds two tables for the map
    knowledge card: kChestItemNames (the title) and kChestDescriptions
    ("<type><br><item description>"). The header stays plain ASCII: every
    non-ASCII byte is written as an \\xNN escape. The script stops with an
    error if the rows do not match the chest list, a label or title is longer
    than 100 bytes, or a description is longer than 600 bytes.

    Not run by build.ps1 yet: run it by hand after the contents JSON changes.

Reads:  research/analysis/treasure-chest-contents.json and data/treasure-chest-links.json
Writes: src/marker-bell/tooltip-texts.h (overwritten)
Run:    python -B src/marker-bell/prepare_tooltip_texts.py
"""
import json
from pathlib import Path

# Longest item text accepted, in UTF-8 bytes (the tooltip buffer is 160).
MAX_TEXT_BYTES = 100
# Longest knowledge card description accepted, in UTF-8 bytes.
MAX_DESCRIPTION_BYTES = 600


def c_string(text):
    """Return `text` as a C string literal with only printable ASCII inside."""
    parts = []
    after_escape = False
    for byte in text.encode("utf-8"):
        character = chr(byte)
        if byte < 0x20 or byte > 0x7e or character in '"\\':
            parts.append("\\x%02x" % byte)
            after_escape = True
            continue
        # A hex escape swallows every following hex digit, so close the
        # string and open a new one ("" "") before a plain character.
        if after_escape:
            parts.append('" "')
        parts.append(character)
        after_escape = False
    return '"' + "".join(parts) + '"'


def main():
    """Check the contents rows against the chest list and write the header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    root = directory.parents[1]
    links = json.loads((root / "data" / "treasure-chest-links.json").read_text(encoding="utf-8"))["locations"]
    contents = json.loads((root / "research" / "analysis" / "treasure-chest-contents.json")
                          .read_text(encoding="utf-8"))["categories"]["Chest"]
    if len(contents) != len(links):
        raise ValueError(f"{len(contents)} contents rows for {len(links)} chests")

    for link, record in zip(links, contents):
        if record["name"] != link["name"] or record["uuid"] != link["uuid"]:
            raise ValueError(f"Contents row {record['name']!r} does not match chest {link['name']!r}")

    # Three tables in chest order; None becomes nullptr.
    labels = []
    titles = []
    descriptions = []
    for record in contents:
        named = record.get("status") == "named"
        name = record.get("english") if named else None
        item_type = record.get("itemType") if named else None
        description = record.get("description") if named else None
        # Map label line: "Witch's Earring (Earring)".
        labels.append(f"{name} ({item_type})" if name and item_type else name)
        # Knowledge card title: the item name alone.
        titles.append(name)
        # Knowledge card description: "<type><br><description>", or what exists.
        parts = [part for part in (item_type, description) if part]
        descriptions.append("<br>".join(parts) if name and parts else None)

    lines = [
        "// Generated from research/analysis/treasure-chest-contents.json by",
        "// prepare_tooltip_texts.py - do not edit by hand. All tables follow",
        "// kChestLinks (same order); nullptr = not known.",
        "#pragma once",
    ]
    lines += table_lines("kChestContents", "map label: item name (type)", labels, links, MAX_TEXT_BYTES)
    lines += table_lines("kChestItemNames", "knowledge card title: item name", titles, links, MAX_TEXT_BYTES)
    lines += table_lines("kChestDescriptions", "knowledge card description: type<br>item description",
                         descriptions, links, MAX_DESCRIPTION_BYTES)

    # The comments carry chest names; keep them ASCII too.
    header = "\n".join(lines) + "\n"
    header.encode("ascii")
    (directory / "tooltip-texts.h").write_text(header, encoding="ascii")
    longest = max(len(text.encode("utf-8")) for text in descriptions if text)
    print(f"Wrote tooltip-texts.h: {sum(1 for text in labels if text)} of {len(links)} chests named, "
          f"{sum(1 for text in descriptions if text)} card descriptions (longest {longest} bytes)")


def table_lines(name, purpose, texts, links, limit):
    """Return the C++ lines of one `const char*` table, checking each text's length."""
    lines = [f"// {name}[i]: {purpose}.", f"constexpr const char* {name}[] = {{"]
    for link, text in zip(links, texts):
        if text is None:
            lines.append(f"    nullptr, // {link['name']}")
            continue
        if not text or len(text.encode("utf-8")) > limit:
            raise ValueError(f"Unsupported {name} text for {link['name']!r}: {text!r}")
        lines.append(f"    {c_string(text)}, // {link['name']}")
    lines.append("};")
    return lines


if __name__ == "__main__":
    main()
