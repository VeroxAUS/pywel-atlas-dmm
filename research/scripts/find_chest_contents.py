"""Find what each tracked chest contains, for the map tooltips.

What it does:
    For every chest the mod marks (data/treasure-chest-links.json and
    data/abyss-chest-links.json) it looks up the main item inside, by name,
    from the game's own files:
      1. Reads the chest's level file and finds the chest object by its UUID
         (unique ID). The chest object has a spawn component whose
         `_spawnReason` names what it drops, for example
         "Drop_Demian_PlateArmor_Gloves_II".
      2. Drops the "Drop_" prefix. The rest should be an item row name in the
         item table (iteminfo), for example "Demian_PlateArmor_Gloves_II".
      3. That item row holds the item's English text id: a length-prefixed
         string of digits just after the row name.
      4. The English item text file (item.paloc) maps that id to the name,
         for example "Light of the Battlefield Plate Gloves".
      5. For equipment, the item row also names its equip type (a key into
         equiptypeinfo), whose English text (equiptype.paloc) is the item
         type, for example "Earring".
      6. The next text id in the item row is the item's description, also
         in item.paloc (for the map knowledge card).
    If step 2 finds no item row, it tries the drop table (dropsetinfo): a row
    of that name lists item names; the item is used only if exactly one item
    is listed. Anything else is reported with a status, never guessed.

Key terms:
    level file - a .palevel file listing the objects placed in one area.
    paloc - the game's text file for one language; entries pair a numeric
        text id with the text.
    static table - one of the game's data tables (iteminfo, dropsetinfo),
        extracted to research/vendor/work/staticinfo/.

Reads:  the installed game's level packs (group 0015) through pycrimson,
        read-only; research/vendor/work/staticinfo/ (iteminfo, dropsetinfo, equiptypeinfo);
        research/vendor/work/eng/item.paloc and equiptype.paloc; data/treasure-chest-links.json;
        data/abyss-chest-links.json; research/analysis/treasure-chest-placements.json
Writes: research/analysis/treasure-chest-contents.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_chest_contents.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import re
import struct
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / "research" / "vendor" / "work"
sys.path.insert(0, str(Path(__file__).resolve().parent))

# Shared helpers: the level reader and the static-table reader.
from classify_chest_gates import GAME, PackageContext, load_table  # noqa: E402
from find_treasure_chests import parse_level  # noqa: E402

DROP_PREFIX = "drop_"
# A text id is a run of digits with this many characters (seen: 17).
TEXT_ID_LENGTH = range(5, 25)


def table_names(name):
    """Return {lower-case row name: (key, row bytes)} for a table whose rows start with key, name."""
    rows = {}
    for key, row in load_table(name).items():
        length = struct.unpack_from("<I", row, 4)[0]
        if 0 < length < 200:
            rows[row[8:8 + length].decode("ascii", "replace").lower()] = (key, row)
    return rows


def item_text_id(row):
    """Return the item's English text id (digit string) from its iteminfo row, or None."""
    name_end = 8 + struct.unpack_from("<I", row, 4)[0]
    # The id follows the name closely; look a short way ahead for
    # "u32 length, then exactly that many digits".
    for position in range(name_end, min(name_end + 64, len(row) - 4)):
        length = struct.unpack_from("<I", row, position)[0]
        if length not in TEXT_ID_LENGTH:
            continue
        digits = row[position + 4:position + 4 + length]
        if len(digits) == length and digits.isdigit():
            return digits.decode()
    return None


def equip_type_texts(texts):
    """Return {equip type key: English type name} from equiptypeinfo and equiptype.paloc."""
    names = {}
    for key, row in load_table("equiptypeinfo").items():
        # The row holds the type's text id as a length-prefixed digit string.
        match = re.search(rb"[\x05-\x18]\x00\x00\x00(\d{5,24})", row)
        if match and match.group(1).decode() in texts:
            names[key] = texts[match.group(1).decode()]
    return names


def item_equip_type(row, text_id):
    """Return the equip type key of an iteminfo row, or None.

    It is the u32 four bytes after the end of the item's text id (measured on
    all 189 named chest items; recipes, maps and keys have 0 there).
    """
    end = row.find(text_id.encode()) + len(text_id)
    if end < len(text_id) or end + 8 > len(row):
        return None
    return struct.unpack_from("<I", row, end + 4)[0] or None


def item_description_id(row, text_id):
    """Return the item's description text id (digit string) from its iteminfo row, or None.

    It is the next length-prefixed digit string after the name's text id
    (usually the name id + 1; measured on the chest items, v0.91).
    """
    start = row.find(text_id.encode()) + len(text_id)
    for match in re.finditer(rb"[\x05-\x18]\x00\x00\x00(\d{5,24})", row[start:]):
        digits = match.group(1)
        if len(digits) == row[start + match.start()] and digits.decode() != text_id:
            return digits.decode()
    return None


def read_paloc(path):
    """Return {text id: text} from one .paloc file."""
    data = path.read_bytes()
    texts = {}
    # Entry: [8 bytes][u32 length][id digits][u32 length][UTF-8 text]. Find
    # each "length + digits" and accept it only if a sane text follows.
    for match in re.finditer(rb"[\x05-\x18]\x00\x00\x00(\d{5,24})", data):
        digits = match.group(1)
        if len(digits) != data[match.start()]:
            continue
        position = match.end()
        if position + 4 > len(data):
            continue
        length = struct.unpack_from("<I", data, position)[0]
        if not 0 < length < 4096:
            continue
        try:
            text = data[position + 4:position + 4 + length].decode("utf-8")
        except UnicodeDecodeError:
            continue
        texts.setdefault(digits.decode(), text)
    return texts


def find_object(objects, uuid):
    """Return the placed object whose UUID starts with `uuid` (3 words), or None."""
    stack = [item for item in objects if isinstance(item, dict)]
    while stack:
        item = stack.pop()
        if list((item.get("_sceneObjectUuid") or [])[:3]) == list(uuid[:3]):
            return item
        stack += [child for child in item.get("_childSceneObjects") or [] if isinstance(child, dict)]
    return None


def spawn_reasons(item, include_children):
    """Return every `_spawnReason` text inside one object (components included)."""
    found = []

    def walk(value):
        if isinstance(value, dict):
            for key, inner in value.items():
                if key == "_childSceneObjects" and not include_children:
                    continue
                if key == "_spawnReason" and isinstance(inner, str) and inner:
                    found.append(inner)
                else:
                    walk(inner)
        elif isinstance(value, list):
            for inner in value:
                walk(inner)

    walk(item)
    return found


def drop_set_items(row, items):
    """Return the item names (lower case) listed in one dropsetinfo row."""
    names = []
    # Item names appear as length-prefixed ASCII, sometimes as "Item(<name>,...)".
    for match in re.finditer(rb"[A-Za-z][A-Za-z0-9_]{3,120}", row):
        name = match.group(0).decode().lower()
        if name in items and name not in names:
            names.append(name)
    return names


def describe(chest, level_objects, items, drop_sets, texts, equip_types):
    """Return the contents record for one chest."""
    record = {"name": chest["name"], "uuid": chest["uuid"], "level": chest["level"]}
    objects = level_objects.get(chest["level"])
    if objects is None:
        record["status"] = "level not readable"
        return record
    item = find_object(objects, chest["uuid"])
    if item is None:
        record["status"] = "chest not in level"
        return record

    # The chest's own components first; its parts only if it has none.
    reasons = spawn_reasons(item, False) or spawn_reasons(item, True)
    record["spawnReasons"] = reasons
    if not reasons:
        record["status"] = "no spawn reason"
        return record

    reason = reasons[0].lower()
    name = reason[len(DROP_PREFIX):] if reason.startswith(DROP_PREFIX) else reason
    if name not in items and reason in drop_sets:
        listed = drop_set_items(drop_sets[reason][1], items)
        record["dropSetItems"] = listed
        if len(listed) != 1:
            record["status"] = "drop set with %d items" % len(listed)
            return record
        name = listed[0]
    if name not in items:
        record["status"] = "no item row"
        return record

    key, row = items[name]
    record["itemKey"] = key
    record["itemName"] = row[8:8 + struct.unpack_from("<I", row, 4)[0]].decode("ascii", "replace")
    text_id = item_text_id(row)
    record["textId"] = text_id
    english = texts.get(text_id) if text_id else None
    if not english:
        record["status"] = "no text"
        return record
    record["english"] = english
    record["status"] = "named"

    # The item's type ("Earring"), for equipment only; missing is allowed.
    equip_type = item_equip_type(row, text_id)
    record["equipTypeKey"] = equip_type
    record["itemType"] = equip_types.get(equip_type)

    # The item's description text, for the map knowledge card; missing is allowed.
    description_id = item_description_id(row, text_id)
    record["descriptionId"] = description_id
    record["description"] = texts.get(description_id) if description_id else None
    return record


def main():
    """Name the contents of every tracked chest and write the JSON report."""
    tables = {
        "Chest": json.loads((ROOT / "data" / "treasure-chest-links.json").read_text(encoding="utf-8")),
        "Abyss Chest": json.loads((ROOT / "data" / "abyss-chest-links.json").read_text(encoding="utf-8")),
    }

    # Full level paths seen by the placement scan; others use the usual folder.
    placements = json.loads((ROOT / "research" / "analysis" / "treasure-chest-placements.json")
                            .read_text(encoding="utf-8"))
    level_paths = {}
    for spot in placements["spots"]:
        for chest in spot["chests"]:
            level_paths[chest["level"].rsplit("/", 1)[-1].removesuffix(".palevel")] = chest["level"]

    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    level_objects = {}
    for table in tables.values():
        for chest in table["locations"]:
            level = chest["level"]
            if level in level_objects:
                continue
            path = level_paths.get(level, f"leveldata/bin__/rootlevel/{level.lower()}.palevel")
            try:
                level_objects[level] = parse_level(context.get_file(path))
            except Exception as error:  # A missing level is reported per chest.
                print(f"cannot read {path}: {error}")
                level_objects[level] = None

    items = table_names("iteminfo")
    drop_sets = table_names("dropsetinfo")
    texts = read_paloc(WORK / "eng" / "item.paloc")
    equip_types = equip_type_texts(read_paloc(WORK / "eng" / "equiptype.paloc"))

    output = {"summary": {}, "categories": {}}
    for label, table in tables.items():
        # Same order as the data file, because marker keys come from row numbers.
        records = [describe(chest, level_objects, items, drop_sets, texts, equip_types)
                   for chest in table["locations"]]
        output["categories"][label] = records
        summary = dict(Counter(record["status"] for record in records).most_common())
        summary["named without item type"] = sum(
            1 for record in records if record["status"] == "named" and not record.get("itemType"))
        summary["named without description"] = sum(
            1 for record in records if record["status"] == "named" and not record.get("description"))
        output["summary"][label] = summary
    output["summary"]["itemRows"] = len(items)
    output["summary"]["englishTexts"] = len(texts)

    (ROOT / "research" / "analysis" / "treasure-chest-contents.json").write_text(
        json.dumps(output, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(output["summary"], indent=1))


if __name__ == "__main__":
    main()
