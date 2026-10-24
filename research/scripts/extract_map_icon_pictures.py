"""Save a few of the game's world-map and minimap icons as PNG pictures.

What it does:
    The map icon stylesheets (worldmapicon.css, minimapicon.css) give each
    icon a texture id, for example textureid(cd_Icon_map_standstone). The
    game's texture atlas files (ui/xml/texture/*.xml) map each id to a sheet
    picture (DDS) and a rectangle on it: GetRect="x,y,width,height".
    This script looks up each wanted id in those atlas files, cuts its
    rectangle out of the sheet and saves it as a PNG with its transparency.
    It also saves sheet.png: every picture side by side on mid-grey,
    labelled and scaled up 2x.
    The pictures are the raw texture. In game the stylesheet multiplies them
    by a background colour (#f2efe7, or #888 for the cresset), which is not
    applied here.

Key terms:
    atlas - one big texture holding many small pictures; a list of
        rectangles says where each small picture sits.
    DDS - the game's texture file format.

Reads:  the installed game's interface packs (group 0012) through pycrimson,
        read-only; research/vendor/work/pack-files.txt
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
Writes: research/analysis/map-icon-pictures/*.png (overwritten)
Run:    with a Python that has Pillow (the research venv lacks it), e.g.
        ~/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe
        -B research/scripts/extract_map_icon_pictures.py
"""
import io
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path[:0] = [str(ROOT / "research" / "vendor" / "pycrimson" / "src"),
                str(ROOT / "research" / "vendor" / ".venv" / "Lib" / "site-packages")]

from PIL import Image, ImageDraw, ImageFont  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
OUTPUT = ROOT / "research" / "analysis" / "map-icon-pictures"

# Output picture name -> texture id, taken from the icon's CSS class in
# worldmapicon.css / minimapicon.css. Minimap entries are listed only where
# the minimap uses a different texture than the world map.
ICONS = {
    "MapIcon_Item_Visione_Memory_Chip": "cd_icon_worldmap_visione_memory_chip",
    "MapIcon_Item_Visione_Memory_Chip_minimap": "cd_icon_map_visione_memory_chip",
    "MapIcon_Gimmick_Pillar_00": "cd_Icon_map_gimmick_pillar_00",
    "MapIcon_Sign_Unknown": "cd_icon_map_sign_unknown",
    "MapIcon_StandStone": "cd_Icon_map_standstone",
    "MapIcon_Gimmick_Bell_01": "cd_Icon_map_bell_01",
    "MapIcon_Gimmick_Bell_01_minimap": "cd_Icon_map_gimmick_bell_01",
}

TEXTURE_LINE = re.compile(
    r'<Texture Name="([^"]+)" Filename="([^"]+)"[^>]*GetRect="(\d+),(\d+),(\d+),(\d+)"')


def atlas_entries(context):
    """Return {lower-case texture id: (sheet path, (x, y, w, h))} from all atlas files."""
    entries = {}
    for line in (ROOT / "research" / "vendor" / "work" / "pack-files.txt").open(encoding="utf-8"):
        path = line.split(" ", 1)[-1].strip()
        if not (path.startswith("ui/xml/texture/") and path.endswith(".xml")):
            continue
        text = context.get_file(path).decode("utf-8", "replace")
        for name, sheet, *rect in TEXTURE_LINE.findall(text):
            entries[name.lower()] = (sheet.lower(), tuple(int(value) for value in rect))
    return entries


def contact_sheet(pictures):
    """Return the labelled 2x contact sheet of {name: RGBA image} on mid-grey."""
    scale, gap, label_height = 2, 24, 40
    font = ImageFont.load_default(size=14)
    cell = max(max(image.size) for image in pictures.values()) * scale
    cell_width = max(cell, 260)
    sheet = Image.new("RGBA", (gap + len(pictures) * (cell_width + gap), cell + label_height + 2 * gap),
                      (128, 128, 128, 255))
    draw = ImageDraw.Draw(sheet)

    for index, (name, image) in enumerate(pictures.items()):
        big = image.resize((image.width * scale, image.height * scale), Image.NEAREST)
        left = gap + index * (cell_width + gap)
        sheet.alpha_composite(big, (left + (cell_width - big.width) // 2, gap + (cell - big.height) // 2))
        # The long component names go on two lines: prefix, then the rest.
        label = name.replace("MapIcon_", "MapIcon_\n", 1)
        draw.multiline_text((left + cell_width // 2, gap + cell + 6), label, fill="white", font=font,
                            anchor="ma", align="center")
    return sheet


def main():
    """Cut each wanted icon from its atlas sheet and write the PNGs and contact sheet."""
    OUTPUT.mkdir(parents=True, exist_ok=True)
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    entries = atlas_entries(context)

    sheets = {}
    pictures = {}
    for name, texture_id in ICONS.items():
        sheet_path, (x, y, width, height) = entries[texture_id.lower()]
        if sheet_path not in sheets:
            sheets[sheet_path] = Image.open(io.BytesIO(context.get_file(sheet_path))).convert("RGBA")
        picture = sheets[sheet_path].crop((x, y, x + width, y + height))
        picture.save(OUTPUT / f"{name}.png")
        pictures[name] = picture
        print(f"{name}: {texture_id} -> {sheet_path} rect x={x} y={y} w={width} h={height}")

    contact_sheet(pictures).save(OUTPUT / "sheet.png")


if __name__ == "__main__":
    main()
