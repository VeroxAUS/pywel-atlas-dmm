"""Find the inventory icon of each tracked chest's item, for the map knowledge card.

What it does:
    For every named chest in research/analysis/treasure-chest-contents.json
    (made by find_chest_contents.py) it finds the picture the game uses for
    that item in the inventory:
      1. The item's row in the item table (iteminfo) holds a short list of
         icon entries. Each entry names its picture by the key of a row in
         the game's string table (stringinfo). That row's text is the texture
         name, for example "ItemIcon_Prefab_cd_phw_00_hand_00_0151".
      2. The script takes every 4-byte value after the item's text id that is
         the key of a stringinfo row whose text starts with "ItemIcon"
         (any case). Usually there is exactly one. Items with several icons
         (a lantern: on / auto / plain) use the LAST one, as the game does:
         its icon chooser 0x240c800 falls back to the last entry.
      3. The texture must exist as ui/texture/icon/<name>.dds in the game
         packs (research/vendor/work/pack-files.txt), or the item gets the
         status "no texture".
      4. The stringinfo row number (its position in the table) is what the
         game's lookup 0x388e00 takes; the mod passes that number to show the
         icon on the card. The knowledge card's own picture comes from the
         same table through the same lookup (static, 2026-10-24).
    Nothing is guessed: an item without exactly this chain gets a status.

Key terms:
    stringinfo - the game's table of internal strings (texture names, paths).
        Other tables point at its rows by key; the game's lookup takes the
        row number.

Reads:  research/analysis/treasure-chest-contents.json;
        research/vendor/work/staticinfo/ (iteminfo, stringinfo);
        research/vendor/work/pack-files.txt
Writes: research/analysis/chest-item-icons.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_item_icons.py
"""
import json
import re
import struct
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))

from find_chest_contents import load_table, table_names  # noqa: E402

ICON_PREFIX = "itemicon"


def string_rows():
    """Return ({key: (row number, text)}) for every stringinfo row with a text."""
    rows = {}
    for number, (key, row) in enumerate(load_table("stringinfo").items()):
        match = re.search(rb"[\x01-\xff]\x00\x00\x00([ -~]{3,})", row)
        if match:
            rows[key] = (number, match.group(1).decode())
    return rows


def item_icon(row, text_id, strings):
    """Return (stringinfo key, row number, name, count) of the item's default icon, or None."""
    start = row.find(text_id.encode())
    if start < 0:
        return None
    found = []
    for position in range(start + len(text_id), len(row) - 3):
        key = struct.unpack_from("<I", row, position)[0]
        entry = strings.get(key)
        if entry and entry[1].lower().startswith(ICON_PREFIX):
            found.append((key, entry[0], entry[1]))
    if not found:
        return None
    key, number, name = found[-1]
    return key, number, name, len(found)


def main():
    """Find each named chest item's icon and write the JSON report."""
    contents = json.loads((ROOT / "research" / "analysis" / "treasure-chest-contents.json")
                          .read_text(encoding="utf-8"))["categories"]["Chest"]
    items = table_names("iteminfo")
    strings = string_rows()
    packs = (ROOT / "research" / "vendor" / "work" / "pack-files.txt").read_text(
        encoding="utf-8", errors="replace").lower()

    records = []
    for chest in contents:
        record = {"name": chest["name"], "itemName": chest.get("itemName")}
        if chest.get("status") != "named":
            record["status"] = "no item"
            records.append(record)
            continue
        icon = item_icon(items[chest["itemName"].lower()][1], chest["textId"], strings)
        if icon is None:
            record["status"] = "no icon"
        else:
            key, number, name, count = icon
            texture = f"ui/texture/icon/{name.lower()}.dds"
            record.update({"iconName": name, "iconKey": key, "stringinfoRow": number,
                           "iconEntries": count, "textureFile": texture})
            record["status"] = "icon" if texture in packs else "no texture"
        records.append(record)

    summary = dict(Counter(record["status"] for record in records).most_common())
    output = {"summary": summary, "chests": records}
    (ROOT / "research" / "analysis" / "chest-item-icons.json").write_text(
        json.dumps(output, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
