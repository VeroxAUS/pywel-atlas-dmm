"""Find what each Abyss chest contains, for the map tooltips.

What it does:
    find_chest_contents.py names a surface chest's item by dropping "Drop_"
    from its spawn reason ("Drop_X" -> item row "X"). That fails for the 74
    Abyss chests: their reasons ("Drop_Abyss_0001") are not item or drop-set
    row names. The link is in the chest's gimmick row instead:
      1. levelgimmicksceneobjectinfo_misc lists every Abyss chest by UUID
         (unique ID). The u32 at +32 from the UUID is the chest's spawn reason
         as a checksum: pycrimson's calculate_checksum of the reason name in
         lower case (calculate_checksum("drop_abyss_0001") = 0x56bcd6bd).
         0 means the chest has no spawn reason.
      2. The chest's gimmick row (gimmickinfo, found by the prefab name, for
         example itembox_09 for gimmick_itembox_a_0009.prefab) has a
         <SpawnReasonList> of names and, in its binary part, one reward per
         reason: "... ff ff <u32 item key> <u32 reason checksum>". Some rows
         also give a drop set per reason: "<u32 drop set key> <u32 checksum>".
      3. Before that list the row has a default drop set (u32), then the
         list's count. A chest with no spawn reason is given that default
         drop set here (status "default drop set"); this is inferred, not read.
      4. A drop set row (dropsetinfo) lists its items by u32 item key:
         "01 <key> ... ff ff <key>".
      5. The item row (iteminfo) holds the item's English text id (a
         length-prefixed digit string shortly after the row name); item.paloc
         maps it to the English name.
    As a check, the same method is run on the surface chests and compared
    with the item find_chest_contents.py named for them.

Key terms:
    gimmick - an interactive placed object (chest, gate, lever); its type
        settings are one gimmickinfo row.
    paloc - the game's text file for one language; entries pair a numeric
        text id with the text.
    static table - one of the game's data tables, extracted to
        research/vendor/work/staticinfo/.

Reads:  research/vendor/work/staticinfo/ (gimmickinfo, dropsetinfo, iteminfo,
        levelgimmicksceneobjectinfo_misc); research/vendor/work/eng/item.paloc;
        data/abyss-chest-links.json; data/treasure-chest-links.json;
        research/analysis/treasure-chest-contents.json (for the check only);
        pycrimson's _checksum.py (loaded by path, nothing else of pycrimson).
        Game install not needed.
Writes: research/analysis/abyss-chest-contents.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_abyss_chest_contents.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import importlib.util
import json
import re
import struct
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
WORK = ROOT / "research" / "vendor" / "work"
CHECKSUM_FILE = ROOT / "research" / "vendor" / "pycrimson" / "src" / "pycrimson" / "_crypto" / "_checksum.py"

# Tables whose header uses a 4-byte row count (pycrimson's list, trimmed);
# same list as classify_chest_gates.py.
FOUR_BYTE_COUNT = {"questinfo", "stageinfo", "levelgimmicksceneobjectinfo",
                   "fieldlevelnametableinfo", "levelinfo", "gameplaytrigger"}
# From the start of a chest UUID in the misc list to its reason checksum.
REASON_OFFSET = 32
TEXT_ID_LENGTH = range(5, 25)


def load_checksum():
    """Return pycrimson's calculate_checksum, loaded from its file alone."""
    spec = importlib.util.spec_from_file_location("pycrimson_checksum", CHECKSUM_FILE)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module.calculate_checksum


def load_table(name):
    """Return {row key: row bytes} for one extracted static table."""
    header = (WORK / "staticinfo" / f"{name}.staticinfoheader").read_bytes()
    body = (WORK / "staticinfo" / f"{name}.staticinfobody").read_bytes()
    count_size = 4 if name in FOUR_BYTE_COUNT else 2
    count = int.from_bytes(header[:count_size], "little")
    key_size = (len(header) - count_size - 4 * count) // count

    # The header lists (key, body offset); a row ends where the next one starts.
    rows = []
    position = count_size
    for _ in range(count):
        key = int.from_bytes(header[position:position + key_size], "little")
        offset = struct.unpack_from("<I", header, position + key_size)[0]
        rows.append((key, offset))
        position += key_size + 4
    ends = sorted(offset for _, offset in rows) + [len(body)]
    next_offset = {ends[i]: ends[i + 1] for i in range(len(ends) - 1)}
    return {key: body[offset:next_offset[offset]] for key, offset in rows}


def row_name(row):
    """Return the name of a row that starts with key, then the name; or None."""
    length = struct.unpack_from("<I", row, 4)[0]
    return row[8:8 + length].decode("ascii", "replace") if 0 < length < 200 else None


def read_paloc(path):
    """Return {text id: text} from one .paloc file, read entry by entry.

    Entry: [u64][u32 length][id digits][u32 length][UTF-8 text]. Zero padding
    at the start is skipped.
    """
    data = path.read_bytes()
    texts = {}
    position = 0
    while position < len(data) and data[position] == 0:
        position += 1
    while position + 16 <= len(data):
        id_length = struct.unpack_from("<I", data, position + 8)[0]
        text_id = data[position + 12:position + 12 + id_length]
        if not (id_length in TEXT_ID_LENGTH and text_id.isdigit()):
            position += 1  # Out of step (padding); look for the next entry.
            continue
        text_at = position + 12 + id_length
        text_length = struct.unpack_from("<I", data, text_at)[0]
        texts.setdefault(text_id.decode(), data[text_at + 4:text_at + 4 + text_length]
                         .decode("utf-8", "replace"))
        position = text_at + 4 + text_length
    return texts


def item_text_id(row):
    """Return the item's English text id (digit string) from its iteminfo row, or None."""
    name_end = 8 + struct.unpack_from("<I", row, 4)[0]
    for position in range(name_end, min(name_end + 64, len(row) - 4)):
        length = struct.unpack_from("<I", row, position)[0]
        if length not in TEXT_ID_LENGTH:
            continue
        digits = row[position + 4:position + 4 + length]
        if len(digits) == length and digits.isdigit():
            return digits.decode()
    return None


def gimmick_rewards(row, checksum):
    """Return the reward table of one gimmickinfo row.

    {"reasons": {checksum: (reason name, "item" | "dropSet", key)},
     "defaultDropSet": key or None}
    """
    start = row.find(b"<SpawnReasonList>")
    end = row.find(b"</SpawnReasonList>")
    binary = row[:row.find(b"<Root>")]
    reasons = {}
    for name in re.findall(rb"<(\w+)/>", row[start:end]) if start >= 0 else []:
        name = name.decode()
        value = checksum(name.lower())
        position = binary.find(struct.pack("<I", value))
        if position < 4:
            continue
        key = struct.unpack_from("<I", binary, position - 4)[0]
        kind = "item" if binary[position - 6:position - 4] == b"\xff\xff" else "dropSet"
        reasons[value] = (name, kind, key)

    # The item list is "<u32 default drop set><u32 0><u32 count>" then entries
    # that start with 01 and their item key; take the default from there.
    default = None
    first = min((p for p in (binary.find(struct.pack("<I", v)) for v in reasons) if p > 0), default=-1)
    if first > 0:
        for match in re.finditer(rb"(.{4})\x00\x00\x00\x00(.{4})\x01", binary[:first], re.S):
            count = struct.unpack("<I", match.group(2))[0]
            if 0 < count <= len(reasons) + 64:
                default = struct.unpack("<I", match.group(1))[0] or None
    return {"reasons": reasons, "defaultDropSet": default}


def drop_set_items(row):
    """Return the item keys listed in one dropsetinfo row, in order."""
    found = []
    for match in re.finditer(rb"\x01(.{4}).{40,70}?\xff\xff\1", row, re.S):
        key = struct.unpack("<I", match.group(1))[0]
        if key and key not in found:
            found.append(key)
    return found


def reason_checksums(misc, uuid):
    """Return the reason checksums listed for one chest UUID in the misc list."""
    pattern = struct.pack("<3I", *uuid[:3])
    return [struct.unpack_from("<I", misc, match.start() + REASON_OFFSET)[0]
            for match in re.finditer(re.escape(pattern), misc)]


def name_item(record, key, items, texts):
    """Add the item's row name and English name to `record`; return True if named."""
    row = items.get(key)
    record["itemKey"] = key
    if row is None:
        return False
    record["itemName"] = row_name(row)
    text_id = item_text_id(row)
    record["textId"] = text_id
    record["english"] = texts.get(text_id) if text_id else None
    return bool(record["english"])


def describe(chest, misc, gimmicks, drop_sets, items, texts):
    """Return the contents record for one chest."""
    record = {"name": chest["name"], "uuid": chest["uuid"], "level": chest["level"],
              "prefab": chest.get("prefab")}
    gimmick = gimmicks.get((chest.get("prefab") or "").lower())
    if gimmick is None:
        record["status"] = "no gimmick row"
        return record
    record["gimmick"] = gimmick["name"]

    values = reason_checksums(misc, chest["uuid"])
    record["reasonChecksum"] = "0x%08x" % values[0] if values else None
    if not values:
        record["status"] = "not in gimmick list"
        return record

    if values[0] == 0:
        key = gimmick["defaultDropSet"]
        record["source"] = "default drop set"
        record["dropSetKey"] = key
        record["dropSetName"] = row_name(drop_sets[key]) if key in drop_sets else None
        listed = drop_set_items(drop_sets[key]) if key in drop_sets else []
        if len(listed) != 1:
            record["dropSetItems"] = listed
            record["status"] = "default drop set with %d items" % len(listed)
            return record
        named = name_item(record, listed[0], items, texts)
        record["status"] = "default drop set" if named else "no text"
        return record

    entry = gimmick["reasons"].get(values[0])
    if entry is None:
        record["status"] = "reason not in gimmick row"
        return record
    record["spawnReason"], kind, key = entry
    record["source"] = kind
    if kind == "dropSet":
        record["dropSetKey"] = key
        record["dropSetName"] = row_name(drop_sets[key]) if key in drop_sets else None
        listed = drop_set_items(drop_sets[key]) if key in drop_sets else []
        if len(listed) != 1:
            record["dropSetItems"] = listed
            record["status"] = "drop set with %d items" % len(listed)
            return record
        key = listed[0]
    record["status"] = "named" if name_item(record, key, items, texts) else "no text"
    return record


def main():
    """Name the contents of every Abyss chest, check the method, write the JSON report."""
    checksum = load_checksum()
    misc = (WORK / "staticinfo" / "levelgimmicksceneobjectinfo_misc.base.staticinfomisc").read_bytes()
    drop_sets = load_table("dropsetinfo")
    items = load_table("iteminfo")
    texts = read_paloc(WORK / "eng" / "item.paloc")

    # Gimmick rows by prefab file name ("gimmick_itembox_a_0009.prefab").
    gimmicks = {}
    for row in load_table("gimmickinfo").values():
        match = re.search(rb"/([A-Za-z0-9_]+\.prefab)", row[:400])
        if match and b"<SpawnReasonList>" in row:
            table = gimmick_rewards(row, checksum)
            table["name"] = row_name(row)
            gimmicks.setdefault(match.group(1).decode().lower(), table)

    abyss = json.loads((ROOT / "data" / "abyss-chest-links.json").read_text(encoding="utf-8"))
    # Same order as the data file, because marker keys come from row numbers.
    records = [describe(chest, misc, gimmicks, drop_sets, items, texts) for chest in abyss["locations"]]

    # Check: the same method on the surface chests, against find_chest_contents.py.
    surface = json.loads((ROOT / "data" / "treasure-chest-links.json").read_text(encoding="utf-8"))
    earlier = json.loads((ROOT / "research" / "analysis" / "treasure-chest-contents.json")
                         .read_text(encoding="utf-8"))["categories"]["Chest"]
    check = Counter()
    for chest, old in zip(surface["locations"], earlier):
        if old.get("status") != "named":
            continue
        new = describe(chest, misc, gimmicks, drop_sets, items, texts)
        if not new.get("itemKey"):
            check["not resolved: " + new["status"]] += 1
        else:
            check["same item" if new["itemKey"] == old.get("itemKey") else "different item"] += 1

    summary = dict(Counter(record["status"] for record in records).most_common())
    summary["distinct items"] = len({record.get("itemKey") for record in records if record.get("english")})
    summary["surface check"] = dict(check.most_common())
    summary["englishTexts"] = len(texts)
    output = {"summary": summary, "Abyss Chest": records}
    (ROOT / "research" / "analysis" / "abyss-chest-contents.json").write_text(
        json.dumps(output, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
