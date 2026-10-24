"""Export the game's region map for the completion tracker (region-map.h).

What it does:
    The completion tracker shows "X of Y collected" per region and for the
    region the player stands in. The game keeps its regions as data:
      1. bitmapposition, row "Bitmap_Region": a 2048 x 2048 grid over the
         world, one cell per 10 m, stored as run-length planes. Plane 1 names
         the state or domain a cell is in (plane 2, towns, is not needed).
         Row layout after the name: 13 bytes of settings (byte 11 = 1 when a
         second plane follows), then per plane: u32 chunk count, that many
         u32 cumulative cell counts (a seek table), u32 run count, then runs
         of (u8 value, u8 length), row by row from the north edge.
         World to cell: column = 1024 + (x + 6144) / 10,
                        row    = 1024 - (z + 1024) / 10.
      2. regioninfo: one row per region with its parent, its plane-1 value, a
         level (4 province, 5 state, 6 domain) and a text id that
         eng/region.paloc turns into the English name.
    Check (research, 2026-10-24): all 8 Bells land in their own domain, and
    688 of 691 markers land in a region; the 3 others are Abyss sky markers.

    The tracker groups regions the way the game nests them: one group per
    state (Tribal State of Pailune, Duchy of Hernand, Kingdom of Demeniss,
    Republic of Delesyia, Tashkalp), plus "Crimson Desert" for the desert
    outside Tashkalp, plus "Abyss". Cells of a state that belong to none of
    its domains become that state's "Other areas". The Abyss has no cells:
    markers above kRegionAbyssHeight, and a player on the minimap's Abyss
    layer, count as Abyss.

Reads:  research/vendor/work/staticinfo/ (bitmapposition, regioninfo);
        research/vendor/work/eng/region.paloc
Writes: src/marker-bell/region-map.h (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_region_map.py
"""
import struct
import sys
from pathlib import Path

ROOT = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(__file__).resolve().parents[2]
WORK = ROOT / "research" / "vendor" / "work"
STATIC = WORK / "staticinfo"
OUT = ROOT / "src" / "marker-bell" / "region-map.h"
SIZE = 2048
# Surface markers reach about 1210 m (mountain Cressets); the lowest Abyss
# marker is at about 1780 m.
ABYSS_HEIGHT = 1500.0


def table_rows(name, key_format):
    """Return [(key, row bytes)] of one static table, in file order."""
    header = (STATIC / f"{name}.staticinfoheader").read_bytes()
    body = (STATIC / f"{name}.staticinfobody").read_bytes()
    count = struct.unpack_from("<H", header, 0)[0]
    step = struct.calcsize("<" + key_format + "I")
    entries = sorted((struct.unpack_from("<" + key_format + "I", header, 2 + step * i)
                      for i in range(count)), key=lambda entry: entry[1])
    ends = [offset for _, offset in entries[1:]] + [len(body)]
    return [(key, body[offset:end]) for (key, offset), end in zip(entries, ends)]


def region_runs():
    """Return plane 1 of Bitmap_Region as [(value, length)] runs."""
    for _, row in table_rows("bitmapposition", "I"):
        name_length = struct.unpack_from("<I", row, 4)[0]
        if row[8:8 + name_length] != b"Bitmap_Region":
            continue
        data = row[8 + name_length:]
        chunks = struct.unpack_from("<I", data, 13)[0]
        position = 13 + 4 + 4 * chunks
        count = struct.unpack_from("<I", data, position)[0]
        position += 4
        runs = [(data[position + 2 * i], data[position + 2 * i + 1]) for i in range(count)]
        if sum(length for _, length in runs) != SIZE * SIZE:
            raise ValueError("Bitmap_Region plane 1 does not cover the grid")
        return runs
    raise KeyError("Bitmap_Region")


def read_regions():
    """Return {region key: {name, textId, parent, value, level}} from regioninfo."""
    regions = {}
    for key, row in table_rows("regioninfo", "H"):
        name_length = struct.unpack_from("<I", row, 2)[0]
        position = 6 + name_length + 6
        _, text_length = struct.unpack_from("<II", row, position)
        text_id = row[position + 8:position + 8 + text_length].decode()
        position += 8 + text_length
        _, count = struct.unpack_from("<II", row, position)
        position += 8 + 8 * count
        parent, children = struct.unpack_from("<HI", row, position)
        position += 6 + 2 * children
        if struct.unpack_from("<f", row, position + 2)[0] != -1.0:
            continue  # Rows of another layout (prohibited zones); not on the region grid.
        regions[key] = {"name": row[6:6 + name_length].decode(), "textId": text_id, "parent": parent,
                        "value": row[position], "level": row[position + 6]}
    return regions


def read_paloc(path):
    """Return {text id: text} from one .paloc file (same reader as find_abyss_chest_contents.py)."""
    data = path.read_bytes()
    texts, position = {}, 0
    while position < len(data) and data[position] == 0:
        position += 1
    while position + 16 <= len(data):
        id_length = struct.unpack_from("<I", data, position + 8)[0]
        text_id = data[position + 12:position + 12 + id_length]
        if not (0 < id_length < 24 and text_id.isdigit()):
            position += 1
            continue
        text_at = position + 12 + id_length
        text_length = struct.unpack_from("<I", data, text_at)[0]
        texts.setdefault(text_id.decode(), data[text_at + 4:text_at + 4 + text_length].decode("utf-8", "replace"))
        position = text_at + 4 + text_length
    return texts


def c_string(text):
    """Return text as a C string literal (ASCII, UTF-8 bytes escaped)."""
    out = []
    for byte in text.encode("utf-8"):
        out.append(chr(byte) if 32 <= byte < 127 and chr(byte) not in '"\\' else f"\\x{byte:02x}\"\"")
    return '"' + "".join(out) + '"'


def main():
    runs = region_runs()
    regions = read_regions()
    texts = read_paloc(WORK / "eng" / "region.paloc")
    english = lambda key: texts.get(regions[key]["textId"], regions[key]["name"])
    used = {value for value, _ in runs if value}  # 0 marks no region.

    # Groups: every state (level 5) in table order, then the province-level
    # desert outside Tashkalp, then the Abyss (no cells).
    groups = [key for key, region in regions.items() if region["level"] == 5]
    desert = [key for key, region in regions.items() if region["level"] == 4 and region["value"] in used]
    group_names = [english(key) for key in groups] + [english(key) for key in desert] + ["Abyss"]

    # Areas: each domain under its state, then the state's own cells as
    # "Other areas", then the desert, then the Abyss.
    areas = []  # (name, group index, grid value or None)
    for index, state in enumerate(groups):
        for key, region in regions.items():
            if region["level"] == 6 and region["parent"] == state and region["value"] in used:
                areas.append((english(key), index, region["value"]))
        if regions[state]["value"] in used:
            areas.append(("Other areas", index, regions[state]["value"]))
    for offset, key in enumerate(desert):
        areas.append((english(key), len(groups) + offset, regions[key]["value"]))
    areas.append(("Abyss", len(group_names) - 1, None))
    abyss_area = len(areas) - 1

    area_of_value = [0xFF] * 256
    for index, (_, _, value) in enumerate(areas):
        if value is not None:
            area_of_value[value] = index
    unassigned = sorted(value for value in used if area_of_value[value] == 0xFF)

    lines = [
        "// region-map.h - the game's region map for the completion tracker.",
        "// Generated by research/scripts/export_region_map.py from the game's",
        "// bitmapposition (Bitmap_Region, plane 1) and regioninfo tables and",
        "// eng/region.paloc. Do not edit by hand; run the script again instead.",
        "#pragma once",
        "",
        "// The grid: kRegionGridSize x kRegionGridSize cells of kRegionCellSize m,",
        "// centred on (kRegionCentreX, kRegionCentreZ), row 0 at the north edge.",
        f"constexpr unsigned kRegionGridSize = {SIZE};",
        "constexpr float kRegionCentreX = -6144.0f;",
        "constexpr float kRegionCentreZ = -1024.0f;",
        "constexpr float kRegionCellSize = 10.0f;",
        "// Markers above this height are on the Abyss layer (see kRegionAbyssArea).",
        f"constexpr float kRegionAbyssHeight = {ABYSS_HEIGHT:.1f}f;",
        "",
        "// Region groups, shown as the panel's headings (states, the desert, the Abyss).",
        f"constexpr unsigned kRegionGroupCount = {len(group_names)};",
        "constexpr const char* kRegionGroupNames[kRegionGroupCount] = {",
    ]
    lines += [f"    {c_string(name)}," for name in group_names]
    lines += [
        "};",
        "",
        "// Areas: the regions markers are counted in. Each belongs to one group.",
        "struct RegionArea {",
        "    const char* name;",
        "    unsigned char group; // Index into kRegionGroupNames.",
        "};",
        f"constexpr unsigned kRegionAreaCount = {len(areas)};",
        f"constexpr unsigned kRegionAbyssArea = {abyss_area};",
        "constexpr RegionArea kRegionAreas[kRegionAreaCount] = {",
    ]
    lines += [f"    {{{c_string(name)}, {group}}}," for name, group, _ in areas]
    lines += [
        "};",
        "",
        "// Grid value -> area index (0xff: no area; the sea, prohibited zones and",
        f"// the unassigned values {unassigned}).",
        "constexpr unsigned char kRegionAreaOfValue[256] = {",
    ]
    for start in range(0, 256, 16):
        lines.append("    " + ", ".join(f"0x{value:02x}" for value in area_of_value[start:start + 16]) + ",")
    lines += [
        "};",
        "",
        "// The grid as runs of (value, length), row by row from the north edge;",
        "// runs may cross row ends. The lengths add up to kRegionGridSize squared.",
        f"constexpr unsigned kRegionRunCount = {len(runs)};",
        "constexpr unsigned char kRegionRuns[kRegionRunCount * 2] = {",
    ]
    flat = [byte for run in runs for byte in run]
    for start in range(0, len(flat), 24):
        lines.append("    " + ",".join(str(byte) for byte in flat[start:start + 24]) + ",")
    lines.append("};")
    OUT.parent.mkdir(parents=True, exist_ok=True)
    OUT.write_bytes(("\r\n".join(lines) + "\r\n").encode("ascii"))
    print(f"{len(group_names)} groups, {len(areas)} areas, {len(runs)} runs -> {OUT}")
    for name, group, value in areas:
        print(f"  {group_names[group]:28s} {name:28s} {value}")


if __name__ == "__main__":
    main()
