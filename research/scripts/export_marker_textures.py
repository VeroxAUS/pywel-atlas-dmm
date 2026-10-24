"""Export the map icon pictures our markers use, so their empty margins can be measured.

What it does:
    Each map marker category uses one of the game's own icon pictures (a
    "texture"). Most pictures sit inside a big shared picture sheet (an
    "atlas"), at a rectangle named in the game's texture lists
    (ui/xml/texture/*.xml, e.g. GetRect="861,929,52,52"). This script reads
    those lists from the user's own game install (read-only), finds the
    pictures named in WANTED, and copies each sheet they live on, plus a
    list of names, sheet files and rectangles. The pictures are measured
    later (visible part vs. empty margin) to size our markers evenly.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert (pack group 0012, read-only)
Writes: research/analysis/marker-textures/ (sheets as .dds, textures.json)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_marker_textures.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))

from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
OUTPUT = ROOT / "research" / "analysis" / "marker-textures"
TEXTURE_LIST_DIRECTORY = "ui/xml/texture"

# The pictures our marker categories show: world map (worldmapicon.css)
# and minimap (minimapicon.css) picture names, compared without case.
WANTED = [
    "cd_Icon_map_bell_01", "cd_Icon_map_gimmick_bell_01",
    "cd_icon_map_GreyManeTemple_minimap",
    "cd_Icon_worldmap_treasurebox_00", "cd_Icon_map_treasurebox",
    "cd_knowledgeimage_Knowledge_abyss_mark", "cd_Icon_map_gimmick_abyss_mark",
    "cd_Icon_map_sealed_artifact_00", "itemicon_prefab_cd_t0000_abyss_artifact_c_0001",
    "cd_Icon_map_standstone",
    "cd_Icon_map_testgimmick11",
]

# One <Texture .../> line of a texture list.
TEXTURE_LINE = re.compile(rb'<Texture\s+Name="([^"]+)"\s+Filename="([^"]+)"[^>]*?GetRect="(\d+),(\d+),(\d+),(\d+)"')


def main():
    """Find each wanted picture in the texture lists and copy its sheet."""
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    wanted = {name.lower(): name for name in WANTED}
    found = {}

    # Every texture list in the folder (the folder listing comes from the
    # pack index, so new lists after a game update are included).
    for pack in context._packs.values():
        files = pack.directories.get(TEXTURE_LIST_DIRECTORY, {})
        for file_name in sorted(files):
            if not file_name.lower().endswith(".xml"):
                continue
            text = context.get_file(f"{TEXTURE_LIST_DIRECTORY}/{file_name}") or b""
            for match in TEXTURE_LINE.finditer(text):
                name = match.group(1).decode("ascii", "replace")
                if name.lower() in wanted and name.lower() not in found:
                    found[name.lower()] = {
                        "name": name,
                        "list": file_name,
                        "sheet": match.group(2).decode("ascii", "replace"),
                        "rect": [int(match.group(index)) for index in range(3, 7)],
                    }

    OUTPUT.mkdir(parents=True, exist_ok=True)
    sheets = {}
    for entry in found.values():
        # Sheet paths in the lists start with "UI/texture/"; the pack uses lower case folders.
        sheet_path = entry["sheet"].replace("\\", "/")
        sheet_path = sheet_path[0:2].lower() + sheet_path[2:]
        if sheet_path not in sheets:
            data = context.get_file(sheet_path) or context.get_file(sheet_path.lower())
            sheets[sheet_path] = data
            if data:
                (OUTPUT / Path(sheet_path).name.lower()).write_bytes(data)
        entry["sheetFile"] = Path(sheet_path).name.lower() if sheets[sheet_path] else None

    missing = [name for name in WANTED if name.lower() not in found]
    (OUTPUT / "textures.json").write_text(
        json.dumps({"textures": list(found.values()), "missing": missing}, indent=2) + "\n", encoding="utf-8")
    print(f"Found {len(found)} of {len(WANTED)} pictures on {len(sheets)} sheets; missing: {missing or 'none'}")


if __name__ == "__main__":
    main()
