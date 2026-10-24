"""Read the base (+0) stat lines of each chest item, for the knowledge card.

What it does:
    The inventory item card lists an item's stats ("Attack 10", "Critical
    Rate Lv 1", "Food Effect Lv +3"). This script reads the same data from
    the game's tables (read-only) for every chest item, surface and Abyss,
    and writes the lines in the game's own words:

    1. Item stat block (iteminfo). Each equipment row holds one block per
       refinement level; the first is +0. A block starts with
         list A: u32 count, then per entry u32 status key + i64 value
                 (value / 1000 is what the game shows: Attack 10 = 10000);
         list B: u32 count, then per entry u32 status key + u8 level
                 ("Critical Rate Lv 1");
       and further on (within the same block) list C, the buffs:
         u32 0x0f marker, u32 count, then per entry u32 buff key +
         u32 level + u32 (0).
    2. Socket passive skills (iteminfo, before the blocks): u32 count, then
       u32 skill key + u32 level; used by the resistance Abyss gears.
    3. Buff and skill levels (buffinfo, skill): each level has an effect
       template from patterndescription.paloc, e.g. "Food Effect Lv
       +{Param1}" or "{Staticinfo:Status:FireResistance} Lv {Param1}".
       Level templates ("Lv" next to {Param1}) take the level from the item.
       Other templates take their number from the level's parameter record,
       which starts 59 bytes after the template key ("03 00 00 00 00" then
       the record). Record forms and scales (checked against Thomas's
       Witch's Earring tooltip, "Health: +0.2 every 1 sec", and crimsondb.gg
       for Efficiency III 9%, Beastbane III 12%, Ascent III 6%, Fortune III
       30%, Aptitude III 30%, Blessing of the Beast III 30%, Disarm III 3%,
       Solidarity / Equestrian / Energy Drain III +3):
         status key u32 + i64: Health/Spirit amounts / 1000, rates / 10^7 %;
         type byte (< 0x10) + u32: "%" templates / 10^4, others as is;
         any other u32 (a target hash) + i64: / 10^4 %.
       {RepeatTick} is the i64 in milliseconds stored just before the
       level's Korean source text. Templates outside these forms (Vigor's
       "Regen -{|Param1|}%" did not match crimsondb) give no line.
    4. Status names: each statusinfo row points to its knowledge entry (the
       u32 18 bytes before the row's fixed marker ef cf 99 dc); its English
       name is the label ("Attack", "Critical Rate", ...). This is also what
       {Staticinfo:Status:X} means in the templates.

    Only non-zero lines are kept. No line is written for anything not fully
    resolved; each item gets a status and the list of what was left out.

Key terms:
    status - a character stat (statusinfo row), e.g. DDD = Attack.
    buff   - a timed or passive effect with levels (buffinfo row).

Reads:  research/vendor/work/staticinfo/ (iteminfo, statusinfo, buffinfo,
        skill, knowledgeinfo, patterndescriptioninfo);
        research/vendor/work/eng/ (knowledge.paloc, patterndescription.paloc);
        research/analysis/treasure-chest-contents.json;
        research/analysis/abyss-chest-cards.json;
        research/analysis/unique-gear-cards.json (v0.112, kind "unique")
Writes: research/analysis/chest-item-stats.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_item_stats.py
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

from find_chest_contents import load_table, read_paloc, table_names, text_ids  # noqa: E402

# Marker that follows every statusinfo row's knowledge key (18 bytes later).
STATUS_MARKER = bytes.fromhex("efcf99dc")
# {Staticinfo:SubLevel:X} names the player's gauges; map them to statusinfo rows.
SUB_LEVEL_STATUS = {"hp": "hp", "mp": "mp", "sp": "stamina", "stamina": "stamina"}
# Status keys are 1000000 and up, in a small range; target hashes are not.
STATUS_KEY_RANGE = range(1000000, 1001000)
# Parameter record: "03 00 00 00 00" this many bytes after the template key, then the record.
PARAMETER_OFFSET = 59
RECORD_START = bytes([3, 0, 0, 0, 0])


def u32(data, offset):
    """Little-endian u32 at `offset`."""
    return struct.unpack_from("<I", data, offset)[0]


def status_names():
    """Return {status key: (internal name, English name)} from statusinfo + knowledge."""
    knowledge_texts = read_paloc(WORK / "eng" / "knowledge.paloc")
    knowledge = {key: next((knowledge_texts[text] for _, text in text_ids(row) if text in knowledge_texts), None)
                 for key, row in load_table("knowledgeinfo").items()}
    names = {}
    for internal, (key, row) in table_names("statusinfo").items():
        marker = row.find(STATUS_MARKER)
        english = knowledge.get(u32(row, marker - 18)) if marker >= 18 else None
        names[key] = (internal, english)
    return names


def level_templates(table, pattern_texts):
    """Return {row key: (row name, row bytes, [(template, offset) per level])} for buffinfo or skill."""
    result = {}
    for name, (key, row) in table_names(table).items():
        templates = [(pattern_texts[u32(row, offset)], offset) for offset in range(len(row) - 3)
                     if u32(row, offset) > 0xffff and u32(row, offset) in pattern_texts]
        result[key] = (name, row, templates)
    return result


def parameter(row, offset, template, statuses):
    """Return the number for {Param1}/{Param2} of the level whose template key is at `offset`, or None."""
    position = offset + PARAMETER_OFFSET + len(RECORD_START)
    if row[position - 5:position] != RECORD_START or position + 12 > len(row):
        return None
    percent = "%" in template
    key = u32(row, position)
    if key in STATUS_KEY_RANGE and key in statuses:
        value = struct.unpack_from("<q", row, position + 4)[0]
        if statuses[key][0] in ("hp", "mp", "stamina") and not percent:
            return value / 1000
        return value / 10 ** 7 if percent else None
    if row[position] < 0x10:
        value = u32(row, position + 1)
        return value / 10 ** 4 if percent else value
    value = struct.unpack_from("<q", row, position + 4)[0]
    return value / 10 ** 4 if percent else None


def level_of(row, offset):
    """Return the level number of the level record whose template key is at `offset`, or None.

    Each level record stores its level as an i32 40 bytes before the length
    of its Korean source text (which ends right at the template key). Levels
    are not always 1..N in order: Vigor's stamina buff has levels -10..-1 and
    1..15 (one record each), so records are matched by this number.
    """
    for length in range(1, 120):
        start = offset - length
        if start < 48 or u32(row, start - 4) != length:
            continue
        return struct.unpack_from("<i", row, start - 4 - 40)[0]
    return None


def repeat_tick(row, offset):
    """Return the level's {RepeatTick} in seconds (the i64 ms before its Korean text), or None."""
    for length in range(1, 120):
        start = offset - length
        if start < 12 or u32(row, start - 4) != length:
            continue
        return struct.unpack_from("<q", row, start - 12)[0] / 1000
    return None


def stat_block(row, statuses):
    """Return (offset, list A, list B, end) of the item's first stat block, or None."""
    for offset in range(len(row) - 16):
        count = u32(row, offset)
        if not 1 <= count <= 8 or offset + 4 + 12 * count > len(row):
            continue
        if not all(u32(row, offset + 4 + 12 * entry) in statuses for entry in range(count)):
            continue
        flat = [(u32(row, offset + 4 + 12 * entry), struct.unpack_from("<q", row, offset + 8 + 12 * entry)[0])
                for entry in range(count)]
        position = offset + 4 + 12 * count
        level_count = u32(row, position)
        if level_count > 8:
            return None
        levels = [(u32(row, position + 4 + 5 * entry), row[position + 8 + 5 * entry]) for entry in range(level_count)]
        if not all(key in statuses for key, _ in levels):
            return None
        return offset, flat, levels, position + 4 + 5 * level_count
    return None


def block_buffs(row, start, buffs):
    """Return the buff list (list C) found within 160 bytes after `start`: [(buff key, level)].

    The list is a u32 count followed by entries of u32 buff key, u32 level
    (0 = not active at this refinement) and u32 0, right after a small u32
    (0x0b or 0x0f seen).
    """
    for offset in range(start, min(start + 160, len(row) - 8)):
        if not 0 < u32(row, offset) <= 0x40:
            continue
        count = u32(row, offset + 4)
        if not 1 <= count <= 4 or offset + 8 + 12 * count > len(row):
            continue
        entries = [(u32(row, offset + 8 + 12 * entry), u32(row, offset + 12 + 12 * entry),
                    u32(row, offset + 16 + 12 * entry)) for entry in range(count)]
        if all(key in buffs and level <= 20 and zero == 0 for key, level, zero in entries):
            return [(key, level) for key, level, _ in entries]
    return []


def passive_skills(row, end, skills):
    """Return socket passive skills [(skill key, level)] stored before offset `end`."""
    found = []
    for offset in range(0, max(0, end - 12)):
        count = u32(row, offset)
        if not 1 <= count <= 4:
            continue
        entries = [(u32(row, offset + 4 + 8 * entry), u32(row, offset + 8 + 8 * entry)) for entry in range(count)]
        if all(key in skills and skills[key][0].startswith("equip_") and 1 <= level <= 20 for key, level in entries):
            found = entries
            break
    return found


def fill_template(template, level, statuses_by_name, row=None, offset=None, statuses=None):
    """Return the template filled for `level`, or None if a part is not resolved.

    Level templates ("Lv" right before {Param1}, with an optional "+") take
    the level; other templates take the level record's number (parameter).
    {Staticinfo:Status:X} and {Staticinfo:SubLevel:X} become the stat's
    English name.
    """
    def name_of(match):
        kind, value = match.group(1).lower(), match.group(2).lower()
        internal = SUB_LEVEL_STATUS.get(value) if kind == "sublevel" else value
        english = statuses_by_name.get(internal)
        if not english:
            raise KeyError(match.group(0))
        return english

    try:
        text = re.sub(r"\{Static[Ii]nfo:(Status|SubLevel):([A-Za-z_]+)\}", name_of, template)
    except KeyError:
        return None
    if re.search(r"Lv ?\+?\{Param1\}", text):
        text = re.sub(r"(Lv) ?(\+?)\{Param1\}", lambda m: f"{m.group(1)} {m.group(2)}{level}", text)
        return None if "{" in text else text
    if not re.search(r"\{\|?Param|\{RepeatTick", text):
        # A plain effect name ("Daze Immunity"); {Key:...} is left for the
        # game's own text formatter, as in its knowledge texts.
        return text if not re.search(r"\{(?!Key:)", text) else None
    if row is None:
        return None
    value = parameter(row, offset, template, statuses)
    if value is None:
        return None
    # {|ParamN|} is the absolute value: the sign is already in the template
    # ("Regen -{|Param1|}%" for negative levels, "Regen +{|Param1|}%" above).
    text = re.sub(r"\{\|Param[12]\|\}", f"{abs(value):g}", text)
    text = re.sub(r"\{Param[12]\}", f"{value:g}", text)
    if "{RepeatTick}" in text:
        tick = repeat_tick(row, offset)
        if not tick:
            return None
        text = text.replace("{RepeatTick}", f"{tick:g}")
    return None if re.search(r"\{(?!Key:)", text) else text


def number(value):
    """Return a status value / 1000 as the game writes it (no trailing .0)."""
    shown = value / 1000
    return str(int(shown)) if shown == int(shown) else f"{shown:g}"


def item_lines(row, statuses, buffs, skills, statuses_by_name):
    """Return (lines, parts, left out, status) for one iteminfo row.

    parts has one entry per line for the card layouts (v0.109): a stat row
    {"kind": "stat", "label", "value", "status"} or an effect line
    {"kind": "effect", "text", "status"}; "status" is the statusinfo name
    the line is about (for its icon), or None when no status is involved.
    """
    block = stat_block(row, statuses)
    if block is None:
        return [], [], [], "no stats"
    offset, flat, levels, end = block
    lines = []
    parts = []
    left_out = []
    for key, value in flat:
        name = statuses[key][1]
        if value == 0:
            continue
        if not name:
            left_out.append(f"status {statuses[key][0]} has no name")
            continue
        lines.append(f"{name} {number(value)}")
        parts.append({"kind": "stat", "label": name, "value": number(value), "status": statuses[key][0]})
    for key, level in levels:
        name = statuses[key][1]
        if level == 0:
            continue
        if not name:
            left_out.append(f"status {statuses[key][0]} has no name")
            continue
        lines.append(f"{name} Lv {level}")
        parts.append({"kind": "stat", "label": name, "value": f"Lv {level}", "status": statuses[key][0]})
    effects = [(buffs, key, level) for key, level in block_buffs(row, end, buffs)]
    effects += [(skills, key, level) for key, level in passive_skills(row, offset, skills)]
    for table, key, level in effects:
        name, source, templates = table[key]
        if level == 0:
            continue
        if not templates:
            left_out.append(f"{name} Lv {level}: no template")
            continue
        if table is buffs:
            matches = [(template, offset) for template, offset in templates if level_of(source, offset) == level]
        else:
            # Skill rows keep their levels 1..N in order with no level number
            # in that place (all read 1), so the position is the level.
            matches = [templates[level - 1]] if level <= len(templates) else []
        if len(matches) != 1:
            left_out.append(f"{name} Lv {level}: {len(matches)} level records with that number")
            continue
        template, offset = matches[0]
        text = fill_template(template, level, statuses_by_name, source, offset, statuses)
        if text is None:
            left_out.append(f"{name} Lv {level}: {template!r} not resolved")
            continue
        lines.append(text)
        parts.append({"kind": "effect", "text": text, "icon": PATTERN_ICONS.get(u32(source, offset)),
                      "status": effect_status(template, source, offset, statuses)})
    status = "stats" if lines else "no lines"
    if left_out:
        status += " (some left out)"
    return lines, parts, left_out, status


def pattern_icons():
    """Return {template key: icon texture name} for every patterndescriptioninfo row that names one.

    Each effect template row stores its buff icon as a stringinfo key (the
    texture name, e.g. "cd_icon_ability_FIRE"); the inventory tooltip draws
    that texture in front of the effect line (0xf438d0 sets it by name as
    the icon's background image).
    """
    from find_item_icons import string_rows
    names = {key: name for key, (_, name) in string_rows().items() if name.lower().startswith("cd_icon")}
    icons = {}
    for key, row in load_table("patterndescriptioninfo").items():
        found = [names[u32(row, offset)] for offset in range(8, len(row) - 3) if u32(row, offset) in names]
        if found:
            icons[key] = found[0]
    return icons


PATTERN_ICONS = {}


def effect_status(template, row, offset, statuses):
    """Return the statusinfo name an effect line is about, or None.

    From the template's {Staticinfo:Status:X} / {Staticinfo:SubLevel:X}, else
    from the level record's parameter key when that is a status key.
    """
    match = re.search(r"\{Static[Ii]nfo:(Status|SubLevel):([A-Za-z_]+)\}", template)
    if match:
        value = match.group(2).lower()
        return SUB_LEVEL_STATUS.get(value) if match.group(1) == "SubLevel" else value
    position = offset + PARAMETER_OFFSET + len(RECORD_START)
    if row[position - 5:position] == RECORD_START and position + 4 <= len(row):
        key = u32(row, position)
        if key in STATUS_KEY_RANGE and key in statuses:
            return statuses[key][0]
    return None


def main():
    """Read all chest items' stat lines and write the JSON report."""
    statuses = status_names()
    statuses_by_name = {internal: english for internal, english in statuses.values()}
    pattern_texts_paloc = read_paloc(WORK / "eng" / "patterndescription.paloc")
    pattern_texts = {key: next((pattern_texts_paloc[text] for _, text in text_ids(row) if text in pattern_texts_paloc),
                               None)
                     for key, row in load_table("patterndescriptioninfo").items()}
    pattern_texts = {key: text for key, text in pattern_texts.items() if text}
    global PATTERN_ICONS
    PATTERN_ICONS = pattern_icons()
    buffs = level_templates("buffinfo", pattern_texts)
    skills = level_templates("skill", pattern_texts)
    items = table_names("iteminfo")

    surface = json.loads((ROOT / "research" / "analysis" / "treasure-chest-contents.json")
                         .read_text(encoding="utf-8"))["categories"]["Chest"]
    abyss = json.loads((ROOT / "research" / "analysis" / "abyss-chest-cards.json")
                       .read_text(encoding="utf-8"))["chests"]
    # v0.112: the unique gear layer's items (find_unique_gear_cards.py).
    unique = json.loads((ROOT / "research" / "analysis" / "unique-gear-cards.json")
                        .read_text(encoding="utf-8"))["items"]
    report = {}
    for kind, rows in (("surface", surface), ("abyss", abyss), ("unique", unique)):
        records = []
        for chest in rows:
            internal = chest.get("itemName")
            record = {"chest": chest["name"], "item": chest.get("english"), "itemName": internal}
            if not internal or internal.lower() not in items:
                record.update(lines=[], status="no item")
            else:
                lines, parts, left_out, status = item_lines(items[internal.lower()][1], statuses, buffs, skills,
                                                     statuses_by_name)
                record.update(lines=lines, parts=parts, status=status)
                if left_out:
                    record["leftOut"] = left_out
            records.append(record)
        report[kind] = records

    summary = {kind: dict(Counter(record["status"] for record in records)) for kind, records in report.items()}
    (ROOT / "research" / "analysis" / "chest-item-stats.json").write_text(
        json.dumps({"summary": summary, **report}, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
