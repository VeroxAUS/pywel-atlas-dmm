"""Collect the knowledge card texts and icon of each Abyss chest's item.

What it does:
    research/analysis/abyss-chest-contents.json (find_abyss_chest_contents.py)
    names the item each Abyss chest gives: 50 chests give a named item (mostly
    Abyss gear such as "Destruction I"); 24 give only a Faded Abyss Artifact
    (the default drop set). For each chest's item this script adds, with the
    same rules as the surface chests:
      - the item type: the equip type text (equiptypeinfo, equiptype.paloc),
        or none if the item has no equip type (find_chest_contents.py);
      - the description: the next text id after the name (item.paloc, read
        with the length-prefix reader of find_chest_contents.py);
      - the inventory icon: find_item_icons.py's rule (stringinfo row named
        "ItemIcon...", the last one; the texture must exist in the packs).
    Also contains: every named Abyss chest also gives one Faded Abyss Artifact
    (item 75002). The contents JSON has no field for that yet, so the script
    applies ALSO_CONTAINS_NAMED to named rows; a row's own "alsoContains"
    item key, if present, wins.
    Rows keep the order of data/abyss-chest-links.json (marker keys depend on it).

Reads:  research/analysis/abyss-chest-contents.json; data/abyss-chest-links.json;
        research/vendor/work/staticinfo/ (iteminfo, equiptypeinfo, stringinfo);
        research/vendor/work/eng/ (item.paloc, equiptype.paloc);
        research/vendor/work/pack-files.txt
Writes: research/analysis/abyss-chest-cards.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_abyss_chest_cards.py
"""
import json
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / "research" / "vendor" / "work"
sys.path.insert(0, str(Path(__file__).resolve().parent))

from find_chest_contents import (equip_type_texts, item_description_id, item_equip_type,  # noqa: E402
                                 read_paloc, table_names)
from find_item_icons import item_icon, string_rows  # noqa: E402

# The Faded Abyss Artifact every named Abyss chest also gives (item key).
ALSO_CONTAINS_NAMED = 75002


def main():
    """Add type, description, icon and also-contains to each Abyss chest and write the JSON."""
    contents = json.loads((ROOT / "research" / "analysis" / "abyss-chest-contents.json")
                          .read_text(encoding="utf-8"))["Abyss Chest"]
    links = json.loads((ROOT / "data" / "abyss-chest-links.json").read_text(encoding="utf-8"))["locations"]
    if [row["name"] for row in contents] != [link["name"] for link in links]:
        raise SystemExit("abyss-chest-contents.json does not follow data/abyss-chest-links.json")
    items = table_names("iteminfo")
    items_by_key = {key: row for key, row in items.values()}
    texts = read_paloc(WORK / "eng" / "item.paloc")
    equip_types = equip_type_texts(read_paloc(WORK / "eng" / "equiptype.paloc"))
    strings = string_rows()
    packs = (WORK / "pack-files.txt").read_text(encoding="utf-8", errors="replace").lower()

    def item_card(key):
        """Return {name, type, description, icon, status} for one item key."""
        row = items_by_key.get(key)
        if row is None:
            return {"status": "no item row"}
        name_length = int.from_bytes(row[4:8], "little")
        internal = row[8:8 + name_length].decode("ascii", "replace")
        from find_chest_contents import item_text_id  # one helper, same rule
        text_id = item_text_id(row)
        card = {"itemKey": key, "itemName": internal, "english": texts.get(text_id) if text_id else None}
        if not card["english"]:
            card["status"] = "no text"
            return card
        card["itemType"] = equip_types.get(item_equip_type(row, text_id))
        description_id = item_description_id(row, text_id)
        card["description"] = texts.get(description_id) if description_id else None
        icon = item_icon(row, text_id, strings)
        if icon:
            texture = f"ui/texture/icon/{icon[2].lower()}.dds"
            card["iconName"] = icon[2] if texture in packs else None
        card["status"] = "card"
        return card

    rows = []
    for chest in contents:
        record = {"name": chest["name"], "source": chest["status"], **item_card(chest["itemKey"])}
        also = chest.get("alsoContains", ALSO_CONTAINS_NAMED if chest["status"] == "named" else None)
        if also is not None:
            also_card = item_card(also)
            record["alsoContains"] = also_card.get("english")
        rows.append(record)

    summary = {
        "chests": len(rows),
        "cards": sum(1 for row in rows if row["status"] == "card"),
        "withType": sum(1 for row in rows if row.get("itemType")),
        "withDescription": sum(1 for row in rows if row.get("description")),
        "withIcon": sum(1 for row in rows if row.get("iconName")),
        "withAlsoContains": sum(1 for row in rows if row.get("alsoContains")),
        "statuses": dict(Counter(row["status"] for row in rows)),
    }
    (ROOT / "research" / "analysis" / "abyss-chest-cards.json").write_text(
        json.dumps({"summary": summary, "chests": rows}, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
