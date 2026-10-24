"""Collect the knowledge card texts and icon of each unique gear item (v0.112).

What it does:
    data/unique-gear-links.json lists the 43 one-of-a-kind items the unique
    gear map layer marks (reward-scene and ground items). For each item this
    script adds, with the same rules as the chest cards
    (find_abyss_chest_cards.py / find_chest_contents.py / find_item_icons.py):
      - the item type: the equip type text (equiptypeinfo, equiptype.paloc);
      - the description: the next text id after the name (item.paloc);
      - the inventory icon: the last stringinfo row named "ItemIcon..."
        whose texture exists in the packs.
    Rows keep the order of data/unique-gear-links.json (marker keys depend on it).

Reads:  data/unique-gear-links.json;
        research/vendor/work/staticinfo/ (iteminfo, equiptypeinfo, stringinfo);
        research/vendor/work/eng/ (item.paloc, equiptype.paloc);
        research/vendor/work/pack-files.txt
Writes: research/analysis/unique-gear-cards.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_unique_gear_cards.py
"""
import json
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / "research" / "vendor" / "work"
sys.path.insert(0, str(Path(__file__).resolve().parent))

from find_chest_contents import (equip_type_texts, item_description_id, item_equip_type,  # noqa: E402
                                 item_text_id, read_paloc, table_names)
from find_item_icons import item_icon, string_rows  # noqa: E402


def main():
    """Add type, description and icon to each unique gear item and write the JSON."""
    links = json.loads((ROOT / "data" / "unique-gear-links.json").read_text(encoding="utf-8"))["items"]
    items = table_names("iteminfo")
    items_by_key = {key: row for key, row in items.values()}
    texts = read_paloc(WORK / "eng" / "item.paloc")
    equip_types = equip_type_texts(read_paloc(WORK / "eng" / "equiptype.paloc"))
    strings = string_rows()
    packs = (WORK / "pack-files.txt").read_text(encoding="utf-8", errors="replace").lower()

    rows = []
    for link in links:
        record = {"name": link["name"], "itemKey": link["itemKey"]}
        row = items_by_key.get(link["itemKey"])
        if row is None:
            record["status"] = "no item row"
            rows.append(record)
            continue
        name_length = int.from_bytes(row[4:8], "little")
        record["itemName"] = row[8:8 + name_length].decode("ascii", "replace")
        text_id = item_text_id(row)
        record["english"] = texts.get(text_id) if text_id else None
        if not record["english"]:
            record["status"] = "no text"
            rows.append(record)
            continue
        record["itemType"] = equip_types.get(item_equip_type(row, text_id))
        description_id = item_description_id(row, text_id)
        record["description"] = texts.get(description_id) if description_id else None
        icon = item_icon(row, text_id, strings)
        if icon:
            texture = f"ui/texture/icon/{icon[2].lower()}.dds"
            record["iconName"] = icon[2] if texture in packs else None
        record["status"] = "card"
        rows.append(record)

    summary = {
        "items": len(rows),
        "cards": sum(1 for row in rows if row["status"] == "card"),
        "withType": sum(1 for row in rows if row.get("itemType")),
        "withDescription": sum(1 for row in rows if row.get("description")),
        "withIcon": sum(1 for row in rows if row.get("iconName")),
        "statuses": dict(Counter(row["status"] for row in rows)),
    }
    (ROOT / "research" / "analysis" / "unique-gear-cards.json").write_text(
        json.dumps({"summary": summary, "items": rows}, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
