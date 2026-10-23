"""Build the Pywel Atlas Shrine Icons file mod: a world-map look for Greymane Shrines.

What it does:
    The game draws world-map icons from layouts in its interface file
    ui/xml/gamemain/template/worldmapicon.thtml (styles in worldmapicon.css).
    The Greymane Shrine icon (MapIcon_Gimmick_GreyManeTemple) has a layout
    only in the minimap's file, so the game refuses to create it on the world
    map (v0.56-v0.73 logs; confirmed from the game files 2026-10-22). This
    script copies the two world-map files out of the user's own game install
    (read-only), adds one shrine layout copied from the Bell's (with the
    shrine's own minimap picture), and writes a DMM file mod: mod.json beside
    the game folder ui/. Nothing else in the files changes. It is the second
    DMM item next to PywelAtlas.asi (v0.77 test run: all 11 shrine markers
    created; v0.78: part of the release).

    The game files are taken from the install at build time, so the mod
    always matches the installed game version, and only the user's own copy
    is written. The script stops without writing anything if the files do not
    look as studied (anchor text missing or doubled, or a shrine layout that
    is not this mod's own). While this mod is mounted by DMM the install holds
    our patched copy; our exact addition is then taken out first.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert (pack group 0012, read-only)
Writes: dist/pywel-atlas-shrine-icons/mod.json, dist/pywel-atlas-shrine-icons/ui/... and
        dist/PywelAtlasShrineIcons.zip (all overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B src/pywel-atlas-ui/build_ui_patch.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import hashlib
import json
import shutil
import zipfile
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))

from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
OUTPUT = ROOT / "dist" / "pywel-atlas-shrine-icons"
TEMPLATE_FILE = "ui/xml/gamemain/template/worldmapicon.thtml"
STYLE_FILE = "ui/xml/gamemain/template/worldmapicon.css"
VERSION = "0.78"

# The Bell's world-map layout, which the new shrine layout follows.
BELL_COMPONENT = b'<component name="MapIcon_Gimmick_Bell_01"'
BELL_STYLE = b".worldmap-icon-gimmick-bell-01 {"
SHRINE_NAME = b"MapIcon_Gimmick_GreyManeTemple"

# The added layout, in the file's own style. Same container, script and zoom
# range ("changePoint") as the Bell; our own markers switch the zoom limit
# off anyway. The game's text files use Windows line endings.
SHRINE_COMPONENT = (
    b"\r\n\t<!-- Pywel Atlas: Greymane Shrine on the world map (layout as the Bell's,"
    b" picture from the shrine's minimap icon) -->\r\n"
    b'\t<component name="MapIcon_Gimmick_GreyManeTemple" css="map-icon-container cpp-show-layer !cpp-none"'
    b' script="UIGamePlayControlCommon_WorldMapIcon" changePoint="0.88 0.93 1 1"\r\n'
    b'\tselector-change-color-icon="#BaseIcon">\r\n'
    b'\t\t<div id="BaseIcon" css="no-pickable worldmap-icon-gimmick-greymanetemple cpp-checked-layer'
    b' worldmap-icon-common worldmap-icon-focus" script="UIGamePlayControlCommonDefault"></div>\r\n'
    b"\t</component>"
)
# Its picture: the texture the minimap's shrine icon uses, at the 32 px size
# of the world map's other gimmick icons.
SHRINE_STYLE = (
    b"\r\n.worldmap-icon-gimmick-greymanetemple { position: absolute; width: 32px; height: 32px;"
    b" transform:translate(-50%, -50%); background-image: textureid(cd_icon_map_GreyManeTemple_minimap);"
    b" background-color: #f2efe7; background-blend-mode: multiply; }"
)


def insert_after_block(text, anchor, closing, addition):
    """Insert `addition` after the first `closing` that follows the single `anchor`."""
    if text.count(anchor) != 1:
        raise SystemExit(f"Expected exactly one {anchor!r} in the game file; nothing written.")
    start = text.index(anchor)
    end = text.index(closing, start) + len(closing)
    return text[:end] + addition + text[end:]


def main():
    """Read the two game files, add the shrine layout and write the DMM mod folder."""
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    template = context.get_file(TEMPLATE_FILE)
    style = context.get_file(STYLE_FILE)
    if SHRINE_NAME in template:
        # While this mod is mounted by DMM, the install holds our own patched
        # copy. Take our exact addition out again to get the game's text back;
        # anything else (another mod's shrine layout) stops the build.
        if template.count(SHRINE_COMPONENT) != 1 or style.count(SHRINE_STYLE) != 1 or \
                template.count(SHRINE_NAME) != 1:
            raise SystemExit("The world-map file already has a shrine layout that is not ours; nothing written.")
        template = template.replace(SHRINE_COMPONENT, b"", 1)
        style = style.replace(SHRINE_STYLE, b"", 1)
        print("Found this mod's own layout in the install (mounted by DMM); rebuilt from the text without it.")

    patched_template = insert_after_block(template, BELL_COMPONENT, b"</component>", SHRINE_COMPONENT)
    patched_style = insert_after_block(style, BELL_STYLE, b"}", SHRINE_STYLE)

    if OUTPUT.exists():
        shutil.rmtree(OUTPUT)
    for name, data in ((TEMPLATE_FILE, patched_template), (STYLE_FILE, patched_style)):
        target = OUTPUT / name
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(data)

    # DMM reads the title, author and description under "modinfo".
    manifest = {
        "modinfo": {
            "title": "Pywel Atlas - Shrine Icons",
            "author": "Pywel Atlas",
            "version": VERSION,
            "description": "Companion to Pywel Atlas (PywelAtlas.asi): adds a world-map layout for the game's "
                           "own Greymane Shrine icon, so Pywel Atlas shrine pins can appear on the world map. Changes only ui/xml/gamemain/template/worldmapicon.thtml "
                           "and worldmapicon.css. Built from the installed game files (source SHA-256 "
                           f"{hashlib.sha256(template).hexdigest()[:16]} / "
                           f"{hashlib.sha256(style).hexdigest()[:16]}); rebuild after a game update.",
        }
    }
    (OUTPUT / "mod.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")

    # The zip for DMM: mod.json beside ui/, with forward slashes in the
    # entry names (Windows PowerShell's Compress-Archive writes backslashes).
    archive = OUTPUT.with_name("PywelAtlasShrineIcons.zip")
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as package:
        for path in sorted(OUTPUT.rglob("*")):
            if path.is_file():
                package.write(path, path.relative_to(OUTPUT).as_posix())
    print(f"Wrote {OUTPUT} ({len(patched_template)} + {len(patched_style)} bytes) and {archive}")


if __name__ == "__main__":
    main()
