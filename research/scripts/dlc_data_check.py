"""Compare the game data Pywel Atlas is built from, before and after a game update.

What it does:
    The mod's marker lists, tooltips, region lookup and quest gates all come
    from game files that were extracted once into research/vendor/work/
    (static tables, English text files, the map icon layouts). A DLC can add
    rows, change rows or add whole new landmark types. This script compares
    a copy of that folder made BEFORE the update with a fresh extraction made
    AFTER it and writes a short Markdown report:

      1. Static tables: which tables were added, removed or changed, with
         row counts, and the tables the mod reads are flagged.
      2. English text files (.paloc): which changed.
      3. Landmark census (levelgimmicksceneobjectinfo_misc): objects per
         landmark type key, with new types and changed counts. New
         collectibles usually show up here first (the Nexuses, artifacts,
         chests and Bells are all landmark types).
      4. New top-level level groups and level-name prefixes (where new
         regions or a new map layer would appear).
      5. Every UUID in the mod's data/*-links.json files: still in the
         landmark list, gone, or with a changed table position.
      6. Map icon layouts (worldmapicon.thtml / minimapicon.thtml): new and
         removed MapIcon_* components, and whether the icons the mod uses
         still have a layout on each map.
      7. Optional (--old-save/--new-save): the save's reflection versions and
         the type/field table of every save type the save reader walks.
    Read-only: nothing in either folder is changed and the game's save
    folder is never opened (save paths inside it are refused).

Key terms:
    landmark type - a row key of levelgimmicksceneobjectinfo (1000007 =
        TreasureBox, 1000001 = surface Abyss Nexus, ...). The save's Bells'
        list stores it per discovered object.
    static table - a .staticinfoheader (row keys and offsets) plus a
        .staticinfobody (the rows) pair, extracted from the game's packages.
    reflection data - the save describes its own layout: first a table of
        type and field names, then objects stored using that table.

Reads:  two work folders (old and new), the repository's data/*-links.json,
        optional save copies
Writes: the Markdown report given with --report (default dlc-data-recheck.md)
Run:    python -B dlc_data_check.py --old research/vendor/work-pre-dlc --new research/vendor/work
            --repo . [--old-save A.save --new-save B.save] [--report research/dlc/data-recheck.md]
"""
import argparse
import hashlib
import json
import re
import struct
import sys
from collections import Counter
from pathlib import Path

# Tables whose header starts with a 4-byte row count (the rest use 2 bytes);
# the same list as classify_chest_gates.py.
FOUR_BYTE_COUNT = {"questinfo", "stageinfo", "levelgimmicksceneobjectinfo",
                   "fieldlevelnametableinfo", "levelinfo", "gameplaytrigger"}
# Tables the mod's research scripts read, and what for.
USED_TABLES = {
    "levelgimmicksceneobjectinfo": "landmark types (every marker category)",
    "bitmapposition": "region map grid (region lookup)",
    "regioninfo": "region names and hierarchy (region lookup)",
    "iteminfo": "chest contents, card texts, item icons",
    "dropsetinfo": "chest contents when the drop names a set",
    "equiptypeinfo": "item type line on chest cards",
    "stringinfo": "item icon texture names (card picture swap)",
    "knowledgeinfo": "knowledge keys (Greymane Shrines, card rows 0x16fb/0x16fc/0x16ed)",
    "knowledgegroupinfo": "knowledge groups",
    "missioninfo": "quest gates, artifact challenges",
    "questinfo": "quest gates",
    "levelinfo": "level phase gates (decode_level_gates.py)",
    "conditioninfo": "level phase conditions",
    "fieldlevelnametableinfo": "level name hashes",
    "gimmickinfo": "gimmick keys (artifact 1004255, Nexus use-artifact)",
    "uimaptextureinfo": "map icon textures",
}
# Map icon layouts the mod's markers need (template name, world map, minimap).
USED_ICONS = [
    "MapIcon_Gimmick_Bell_01", "MapIcon_Gimmick_GreyManeTemple", "MapIcon_Gimmick_LevelTreasureBox",
    "MapIcon_Abyss_Ruins", "MapIcon_Gimmick_SealedArtifact",
]
# Save types the save reader (NativeSaveReader.cpp) walks.
SAVE_TYPES = [
    "DiscoveredLevelGimmickSceneObjectSaveData", "LevelGimmickSceneObjectElementSaveData",
    "KnowledgeSaveData", "KnowledgeElementSaveData", "FieldSaveData", "FieldGimmickSaveData",
    "QuestSaveData",
]


def table_rows(folder, name):
    """Return {row key: row bytes} for one header/body table pair (None if missing)."""
    header_path = folder / f"{name}.staticinfoheader"
    body_path = folder / f"{name}.staticinfobody"
    if not header_path.exists() or not body_path.exists():
        return None
    header = header_path.read_bytes()
    body = body_path.read_bytes()
    count_size = 4 if name in FOUR_BYTE_COUNT else 2
    count = int.from_bytes(header[:count_size], "little")
    if count == 0:
        return {}
    key_size = (len(header) - count_size - 4 * count) // count
    rows = []
    position = count_size
    for _ in range(count):
        key = int.from_bytes(header[position:position + key_size], "little")
        offset = struct.unpack_from("<I", header, position + key_size)[0]
        rows.append((key, offset))
        position += key_size + 4
    ends = sorted(offset for _, offset in rows) + [len(body)]
    next_offset = {ends[index]: ends[index + 1] for index in range(len(ends) - 1)}
    return {key: body[offset:next_offset[offset]] for key, offset in rows}


def row_name(row):
    """Return the row's own name (rows start with key, then a length and the name)."""
    if len(row) < 8:
        return ""
    length = struct.unpack_from("<I", row, 4)[0]
    return row[8:8 + length].decode("ascii", "replace") if 0 < length < 200 else ""


def landmark_objects(folder):
    """Return the landmark object list: type key, level, parent chain, UUID, position.

    Same walk as gimmick_objects() in classify_chest_gates.py: every record's
    parent chain ends in "rootlevel"; the level name before it is preceded by
    five u32 (type key, 0, gimmick key, 0, 0).
    """
    path = folder / "levelgimmicksceneobjectinfo_misc.base.staticinfomisc"
    if not path.exists():
        path = folder.parent / path.name
    if not path.exists():
        return None
    data = path.read_bytes()
    records = []
    for match in re.finditer(rb"\x09\x00\x00\x00rootlevel", data):
        chain_end = match.end()
        for back in range(30, 600):
            start = chain_end - back
            length = struct.unpack_from("<I", data, start)[0]
            if not 3 < length < 120:
                continue
            level = data[start + 4:start + 4 + length]
            if not all(48 <= byte < 123 for byte in level):
                continue
            position = start + 4 + length
            count = struct.unpack_from("<I", data, position)[0]
            position += 4
            if not 1 <= count < 12:
                continue
            chain = []
            for _ in range(count):
                if position + 4 > chain_end:
                    break
                size = struct.unpack_from("<I", data, position)[0]
                chain.append(data[position + 4:position + 4 + size].decode("ascii", "replace"))
                position += 4 + size
            if position != chain_end or chain[-1] != "rootlevel":
                continue
            records.append({
                "type": struct.unpack_from("<I", data, start - 20)[0],
                "level": level.decode(),
                "chain": chain,
                "uuid": tuple(struct.unpack_from("<3I", data, chain_end + 8)),
                "position": struct.unpack_from("<3f", data, chain_end + 48),
            })
            break
    return records


def digest(path):
    """Return a short SHA-256 of a file's bytes."""
    return hashlib.sha256(path.read_bytes()).hexdigest()[:12]


def static_folder(work):
    """Return the folder that holds the .staticinfo* tables inside a work folder."""
    return work / "staticinfo" if (work / "staticinfo").is_dir() else work


def compare_tables(old, new, lines):
    """Section 1: static tables added, removed or changed."""
    old_folder, new_folder = static_folder(old), static_folder(new)
    names = sorted({path.name.split(".")[0] for path in old_folder.glob("*.staticinfoheader")} |
                   {path.name.split(".")[0] for path in new_folder.glob("*.staticinfoheader")})
    lines += ["## 1. Static tables", "", "| Table | Rows before | Rows after | Rows added | Rows removed | "
              "Rows changed | Used for |", "| --- | --- | --- | --- | --- | --- | --- |"]
    unchanged = 0
    for name in names:
        before, after = table_rows(old_folder, name), table_rows(new_folder, name)
        if before is not None and after is not None and before == after:
            unchanged += 1
            if name in USED_TABLES:
                lines.append(f"| **{name}** | {len(before)} | {len(after)} | 0 | 0 | 0 | {USED_TABLES[name]} |")
            continue
        added = len(set(after or {}) - set(before or {}))
        removed = len(set(before or {}) - set(after or {}))
        changed = sum(1 for key in set(before or {}) & set(after or {}) if before[key] != after[key])
        label = f"**{name}**" if name in USED_TABLES else name
        lines.append(f"| {label} | {'-' if before is None else len(before)} | {'-' if after is None else len(after)} | "
                     f"{added} | {removed} | {changed} | {USED_TABLES.get(name, '')} |")
    lines += ["", f"{unchanged} tables are byte-for-byte the same rows. Bold = read by the mod's scripts.", ""]


def compare_texts(old, new, lines):
    """Section 2: English text files that changed."""
    lines += ["## 2. English text files (.paloc)", ""]
    old_files = {path.name: path for path in (old / "eng").glob("*.paloc")} if (old / "eng").is_dir() else {}
    new_files = {path.name: path for path in (new / "eng").glob("*.paloc")} if (new / "eng").is_dir() else {}
    changed = [name for name in sorted(set(old_files) & set(new_files)) if digest(old_files[name]) != digest(new_files[name])]
    lines.append(f"- Changed: {', '.join(changed) or 'none'}")
    lines.append(f"- New: {', '.join(sorted(set(new_files) - set(old_files))) or 'none'}")
    lines.append(f"- Missing after: {', '.join(sorted(set(old_files) - set(new_files))) or 'none'}")
    lines.append("- item.paloc / quest.paloc / knowledge.paloc changes mean the card and tooltip texts "
                 "(tooltip-texts.h, prepare_tooltip_texts.py) should be regenerated.")
    lines.append("")


def type_names(work):
    """Return {landmark type key: row name} from the levelgimmicksceneobjectinfo table."""
    rows = table_rows(static_folder(work), "levelgimmicksceneobjectinfo") or {}
    return {key: row_name(row) for key, row in rows.items()}


def compare_landmarks(old, new, lines):
    """Sections 3 and 4: landmark census, new level groups. Returns both object lists."""
    before, after = landmark_objects(static_folder(old)), landmark_objects(static_folder(new))
    lines += ["## 3. Landmark census", ""]
    if before is None or after is None:
        lines += ["levelgimmicksceneobjectinfo_misc missing in one folder; skipped.", ""]
        return before or [], after or []
    names = type_names(old)
    names.update(type_names(new))
    count_before = Counter(item["type"] for item in before)
    count_after = Counter(item["type"] for item in after)
    lines += [f"{len(before)} objects before, {len(after)} after.", "",
              "| Type key | Name | Before | After | Note |", "| --- | --- | --- | --- | --- |"]
    tracked = {1000119: "Bell", 1000007: "TreasureBox (chests)", 1000001: "Abyss Nexus (surface)",
               1000053: "Abyss Nexus (Kliff's houses)", 1000008: "Abyss-island Nexus",
               1000114: "Abyss-island Nexus (quest)", 1000002: "Sealed Abyss Artifact",
               1000005: "Constellation (candidate)", 1000004: "Abyss Cresset (puzzle, candidate)",
               1000103: "Abyss Cresset (stand-here, candidate)", 1000028: "Hexe sanctuary totem (candidate)"}
    for key in sorted(set(count_before) | set(count_after)):
        a, b = count_before.get(key, 0), count_after.get(key, 0)
        if a == b and key not in tracked:
            continue
        note = "NEW TYPE" if a == 0 else "gone" if b == 0 else ("changed" if a != b else "")
        if key in tracked:
            note = (note + "; " if note else "") + "mod: " + tracked[key]
        lines.append(f"| {key} | {names.get(key, '')} | {a} | {b} | {note} |")
    lines.append("")

    lines += ["## 4. New level groups and level names", ""]
    groups_before = Counter(item["chain"][-2] if len(item["chain"]) > 1 else "" for item in before)
    groups_after = Counter(item["chain"][-2] if len(item["chain"]) > 1 else "" for item in after)
    for group in sorted(set(groups_before) | set(groups_after)):
        if groups_before.get(group, 0) != groups_after.get(group, 0):
            lines.append(f"- top group `{group}`: {groups_before.get(group, 0)} -> {groups_after.get(group, 0)} objects")
    prefixes_before = {re.split(r"_\d", item["level"])[0].lower() for item in before}
    new_prefixes = Counter(re.split(r"_\d", item["level"])[0].lower() for item in after
                           if re.split(r"_\d", item["level"])[0].lower() not in prefixes_before)
    for prefix, count in new_prefixes.most_common(40):
        lines.append(f"- new level name `{prefix}*`: {count} landmark objects")
    if lines[-1].startswith("## 4"):
        lines.append("- none")
    lines.append("")
    return before, after


def link_uuids(value, found):
    """Collect (name, uuid triple) pairs from any nested links JSON value."""
    if isinstance(value, dict):
        uuid = value.get("uuid")
        if isinstance(uuid, list) and len(uuid) >= 3 and all(isinstance(item, int) for item in uuid[:3]):
            found.append((value.get("name") or value.get("id") or "?", tuple(uuid[:3])))
        for item in value.values():
            link_uuids(item, found)
    elif isinstance(value, list):
        for item in value:
            link_uuids(item, found)
    return found


def compare_links(repo, before, after, lines):
    """Section 5: every marker UUID in data/*-links.json against both landmark lists."""
    lines += ["## 5. Marker data (data/*-links.json)", "",
              "| File | Markers | In landmark list before | Still there after | Gone | Table position moved |",
              "| --- | --- | --- | --- | --- | --- |"]
    old_index = {item["uuid"]: item for item in before}
    new_index = {item["uuid"]: item for item in after}
    problems = []
    for path in sorted((repo / "data").glob("*-links.json")):
        entries = link_uuids(json.loads(path.read_text(encoding="utf-8")), [])
        listed = [entry for entry in entries if entry[1] in old_index]
        still = [entry for entry in listed if entry[1] in new_index]
        gone = [entry for entry in listed if entry[1] not in new_index]
        moved = [entry for entry in still if any(abs(a - b) > 0.5 for a, b in zip(
            old_index[entry[1]]["position"], new_index[entry[1]]["position"]))]
        lines.append(f"| {path.name} | {len(entries)} | {len(listed)} | {len(still)} | {len(gone)} | {len(moved)} |")
        problems += [f"- {path.name}: **{name}** is no longer in the landmark list" for name, _ in gone[:20]]
        problems += [f"- {path.name}: {name} moved in the table (check its level-file position)" for name, _ in moved[:20]]
    lines += [""] + (problems or ["No marker lost or moved."]) + [
        "", "Markers that are not in the landmark list (chests from level placements, Bells) are only "
        "checked by rerunning their export scripts; see the checklist.", ""]


def components(path):
    """Return the set of component names in one map icon layout file."""
    if not path.exists():
        return None
    return set(re.findall(rb'<component name="([^"]+)"', path.read_bytes()))


def compare_icons(old, new, lines):
    """Section 6: MapIcon_* layouts on the world map and minimap."""
    lines += ["## 6. Map icon layouts", ""]
    for file in ("worldmapicon.thtml", "minimapicon.thtml"):
        before, after = components(old / "ui-map" / file), components(new / "ui-map" / file)
        if before is None or after is None:
            lines.append(f"- {file}: missing in one folder (extract ui/xml/gamemain/template/{file} from pack 0012)")
            continue
        added = sorted(name.decode() for name in after - before)
        removed = sorted(name.decode() for name in before - after)
        lines.append(f"- {file}: {len(before)} -> {len(after)} layouts; new: {', '.join(added) or 'none'}; "
                     f"removed: {', '.join(removed) or 'none'}")
        for icon in USED_ICONS:
            if icon.encode() in before and icon.encode() not in after:
                lines.append(f"  - **{icon} lost its layout here**")
    lines += ["- GreyManeTemple has no world-map layout in the game's own file; the Shrine Icons file mod "
              "adds it. Rebuild that mod (build_ui_patch.py) after every game update.", ""]


def save_tables(path):
    """Decode one save copy and return (versions, {type name: [(field, type, kind, size, flags)]})."""
    if "pearl abyss" in str(Path(path).resolve()).lower():
        raise SystemExit("Refusing to read inside the game's save folder; copy the file first.")
    scripts = Path(__file__).resolve().parent
    for candidate in (scripts, scripts.parent / "research" / "scripts"):
        if (candidate / "survey_save_record_lists.py").exists():
            sys.path.insert(0, str(candidate))
    from survey_save_record_lists import Survey, decode  # noqa: E402 - repository script
    raw = Path(path).read_bytes()
    envelope = struct.unpack_from("<HH", raw, 4)
    survey = Survey(decode(raw))
    types = {item["name"]: [(prop["name"], prop["typeName"], prop["kind"], prop["size"], prop["flags"])
                            for prop in item["properties"]] for item in survey.types}
    return {"envelope": envelope, "serialization": survey.version}, types


def compare_saves(old_save, new_save, lines):
    """Section 7: save versions and the type table of the types the reader walks."""
    lines += ["## 7. Save format", ""]
    old_versions, old_types = save_tables(old_save)
    new_versions, new_types = save_tables(new_save)
    lines.append(f"- Envelope (version, header size): {old_versions['envelope']} -> {new_versions['envelope']} "
                 "(the reader accepts only (2, 128))")
    lines.append(f"- Reflection serialization version: {old_versions['serialization']} -> "
                 f"{new_versions['serialization']} (the reader accepts 11..15)")
    lines.append(f"- Types: {len(old_types)} -> {len(new_types)}; new types: "
                 f"{', '.join(sorted(set(new_types) - set(old_types))[:60]) or 'none'}")
    for name in SAVE_TYPES:
        if old_types.get(name) != new_types.get(name):
            lines.append(f"- **{name} changed**: {old_types.get(name)} -> {new_types.get(name)}")
    lines.append("")


def main():
    """Parse the command line and write the report."""
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--old", required=True, type=Path, help="work folder copied before the update")
    parser.add_argument("--new", required=True, type=Path, help="work folder extracted after the update")
    parser.add_argument("--repo", type=Path, default=Path("."), help="repository root (for data/*-links.json)")
    parser.add_argument("--old-save", type=Path)
    parser.add_argument("--new-save", type=Path)
    parser.add_argument("--report", type=Path, default=Path("dlc-data-recheck.md"))
    arguments = parser.parse_args()
    lines = ["# Pywel Atlas game data re-check", "", f"Before: `{arguments.old}`", f"After: `{arguments.new}`", ""]
    compare_tables(arguments.old, arguments.new, lines)
    compare_texts(arguments.old, arguments.new, lines)
    before, after = compare_landmarks(arguments.old, arguments.new, lines)
    compare_links(arguments.repo, before, after, lines)
    compare_icons(arguments.old, arguments.new, lines)
    if arguments.old_save and arguments.new_save:
        compare_saves(arguments.old_save, arguments.new_save, lines)
    arguments.report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {arguments.report}")


if __name__ == "__main__":
    main()
