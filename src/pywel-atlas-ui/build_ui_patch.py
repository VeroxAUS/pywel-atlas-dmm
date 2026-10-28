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

    Tried and dropped (v0.93/v0.94-test, 2026-10-24): a rule in
    ui/xml/gamemain/play/worldmapview.css to keep line breaks in the world
    map's knowledge card. "white-space: pre-line" made the game fail to load
    the world map view and crash at start-up; the game's own "pa-break" loaded
    but kept no line breaks. So v0.78 changed the shrine files only.

    v0.79 (with mod v0.103): worldmapview.css again, but only four size-class
    rules for the knowledge card's picture (#KnowledgeInfoImage), so chest
    item icons look about the same size. The mod adds one class
    (pywel-icon-60/70/80/90) to that picture on its own chest cards only;
    without the class the rules match nothing. Each rule uses only
    properties and value forms the game's own CSS already uses: a
    "#Id.class" selector like "#KnowledgeInfoTooltipBg.fixed", and the
    declarations of ".base-icon-texture-layer" in minimapicon.css
    ("background-size: 27px 27px; background-position: center center;
    background-repeat: no-repeat;"), with sizes written like the card's own
    faction picture ("background-size: 300.000000px 300.000000px;"). The
    picture is 86% of its 340 px frame (292.4 px), so a class's size is that
    times its percent. Everything else in the file stays byte-identical.

    v0.80 (with mod v0.109): right after those, one rule per buff icon the
    mod's chest cards use (BUFF_ICON_STYLE), so each stat effect line shows
    its own game icon, as the inventory tooltip does. The inventory sets
    these icons by texture name in code; a card's markup can only name
    classes, so each rule gives one class its texture. The rule form is the
    game's own icon rule copied exactly (itemtooltip2.css
    ".item-tooltip-stat-icon2.cpp-ddd { background-image:
    textureid(cd_icon_ability_offense); }"), on the inventory's buff icon
    element: ".item-tooltip-buff-stat-icon.pywel-buff-fire {
    background-image: textureid(cd_icon_ability_FIRE); }". The textures
    come from research/analysis/chest-item-stats.json (find_item_stats.py:
    the icon each effect's game template names). worldmapview.css already
    uses textureid() in 235 places.

    v0.81 (with mod v0.112): the buff rules also cover the unique gear cards'
    effects (two more textures), and one more rule of the same form gives
    the stat row "Defense Efficiency", which the inventory has no icon for,
    the guard icon the game uses for its guard effects
    (STAT_ICON_STYLE: ".item-tooltip-stat-icon2.pywel-stat-guardpvrate {
    background-image: textureid(cd_icon_ability_GUARDCRASH); }"; Thomas's
    choice). Earlier versions of these rules found in a mounted install are
    taken out first (OUR_ICON_RULE), whatever their count.

    v0.82 (with mod v0.114): the Constellation markers use the game's unused
    test icon MapIcon_TestGimmick11, which has layouts on both maps but a
    placeholder picture. This version gives it the Pywel Atlas star picture
    (pywel-star-cluster.png, drawn by draw_star_icon.py) in the game's own
    forms: a new standalone texture file
    ui/texture/cd_icon_map_pywel_star_cluster.dds made like the game's small
    map icon files (cd_icon_map_enemy_die_1.dds: DXT5, one mip level, whose
    header is copied with only the size fields changed), one new line in the
    map icon texture list ui/xml/texture/cd_icon_map_00.xml written like that
    file's own lines (other texture lists already name several files, e.g.
    cd_image_common.xml with GetRect="0,0,width,height"), and the test
    icon's two picture rules (worldmapicon.css and minimapicon.css) pointed
    at the new texture name; nothing else in them changes. Our line and
    picture names found in a mounted install are taken out first.

    v0.83: a lighter star picture (thinner, mid-grey outline; drawn by
    draw_star_icon.py). Nothing else changes.

    v0.84 (with mod v0.117): even marker sizes (Thomas, 2026-10-24: "the
    size of the Sealed artifacts", for every marker, also future ones). Each
    map icon's size comes from its picture rule (e.g. ".worldmap-icon-standstone
    { width: 32px; ... }") and each picture has its own empty margin, so the
    visible icons ranged from about 15 to 31 px. The mod (MarkerIconSize.h)
    gives the picture elements of OUR markers the extra class "pywel-marker";
    this add-on adds one rule per picture class, in the game's own
    ".class.class" form (like ".worldmap-default-lock-icon-wrap.quest-shop-icon"),
    at the end of worldmapicon.css and minimapicon.css. The game's own icons
    do not have the class, so they keep their size. Sizes are in MARKER_SIZES,
    one entry per icon layout the mod's categories use; the build stops if a
    category's layout has no entry (also run by the mod's build.ps1 with
    --check), so a new category cannot be left at its native size.

    v0.85 (with mod v0.120): the v0.84 world sizes were matched at one zoom,
    but each icon type also has its own zoom size curve, so Nexuses and
    Cressets drifted while zooming (Thomas's v0.117 test). The mod now gives
    all our markers the Sealed Abyss Artifact's curve (scale 1.0 zoomed in),
    so the world sizes below are set for that scale: visible size about
    24 px, the artifact's (30 px box x 0.8 of its picture). The Nexus picture
    is drawn at its own background size (31.5 px of a 40 px box), since its
    old 1.7-1.8 scale no longer enlarges it.

    v0.86 (with mod v0.121): two line canvases of our own for the route line
    (Thomas's v0.118 test: teeth along the world-map line, flicker on the
    minimap). The game's world-map route canvas #WorldmapCanvas draws with
    the material UICanvasWorldMapPath (preset preset-ui-canvas-worldmap-path:
    dots 40 long, 10 apart, with noise), which turns every line dotted, and
    the mod had to share the minimap's #MinimapDestinationCanvas with the
    game's own line. So this adds, in the game's own element form:
      - ui/xml/gamemain/play/worldmapview.html: right after #WorldmapCanvas,
        <div id="PywelRouteCanvas" css="no-pickable worldmap-canvas"
        script="UICanvas"></div>, like the game's canvases but without a
        material (a plain canvas, like the minimap's destination canvas);
      - ui/xml/gamemain/play/minimaphudview2.html: right after
        #MinimapDestinationCanvas, <div id="PywelRouteMinimapCanvas"
        css="pywel-route-minimap-canvas" script="UICanvas"></div>;
      - ui/xml/gamemain/play/minimaphudview2.css: right after the rule
        .minimap-destination-canvas, the same rule for
        .pywel-route-minimap-canvas without its "opacity: 0.75".
    The mod finds the canvases by their ids; without them it draws the line
    with its overlay instead.

    v0.87 (with mod v0.124): the world map gets two route canvases, both right
    after #WorldmapCanvas so the mod can also find them as its next siblings:
    #PywelRouteCanvas ("Painted") with the game's map line material,
    controller-material="UICanvasWorldMapPath" and our own preset
    controller-material-parm="preset-pywel-route", and #PywelRouteCanvasPlain
    ("Plain", the v0.86 canvas without a material). The preset goes into
    ui/xml/gamemain/play/worldmapview.css right after the game's
    preset-ui-canvas-worldmap-path, copied from it with _dotThickness 0 (the
    material's default, as the game's solid node-line presets leave it): the
    same paper-and-noise look without the dotted pattern. The panel's Look
    choice picks the canvas. The v0.86 canvas text of a mounted install is
    taken out first, as our own.

    v0.88 (with mod v0.126): height arrows (Thomas, 2026-10-24: "a small up
    or down arrow in the bottom left of the marker" when the player is above
    or below it). The mod gives our markers' picture elements the class
    pywel-above or pywel-below (more than 10 m up or down); height_arrows.py
    makes a copy of each marker picture with an arrow badge baked into its
    bottom left (the interface draws one background per picture, so the badge
    cannot be laid on top), one small DDS file per copy like the star picture,
    one texture list line each after the star's, and one rule per picture
    class and direction at the end of worldmapicon.css and minimapicon.css,
    after the size blocks. The pictures are cut out of the game's own texture
    sheets at build time.

    v0.89 (mod v0.126 unchanged): v0.88 crashed the game while it started
    (Thomas, 2026-10-24; every mod part logged only its first line). The
    arrow pictures had names up to 64 characters and paths up to 80, longer
    than any in the game's map icon texture list (54 and 45), so they are now
    short and numbered: cd_icon_map_pywel_hu01 / _hd01 and so on (22
    characters, paths 41). Keep any new texture name and path within the
    game's own longest.

    v0.90 (with mod v0.130): a test of whether our Painted canvas takes
    the game's material at all (Thomas's v0.127 screenshots: Painted and
    Plain looked the same). The Painted canvas now uses the game's own
    dotted route preset preset-ui-canvas-worldmap-path: if its line turns
    dotted, the material binds and a solid painted preset is tuned next;
    if not, the Painted / Plain choice is dropped. Our own preset
    preset-pywel-route is no longer added (it is still taken out of a
    mounted install), and the v0.87 Painted canvas text is taken out as ours.

    v0.91 (with mod v0.133): the Painted world-map canvas is dropped
    (Thomas's v0.132 test: the material binds, but its dots vanish at some
    zooms and the minimap cannot use it). Only #PywelRouteCanvasPlain stays,
    right after #WorldmapCanvas; the v0.86-v0.90 world canvas text of a
    mounted install is taken out as ours.

    0.11.0 (with mod 0.29.0): Treasure Map piece markers use the game's
    other unused test icon, MapIcon_TestGimmick10 (type 408), drawn as the
    game's own treasure map item picture
    (ui/texture/icon/itemicon_itemgroup_etc_treasuremap.dds, read from the
    install at build time, Thomas's pick 2026-10-25). The item picture is
    grey, so it is tinted parchment brown here and scaled to the 52 px of
    the game's map icon pictures, then written like the star picture:
    ui/texture/cd_icon_map_pywel_treasuremap.dds (name 29 characters, path
    44, within the game's longest), one texture list line after the
    TestGimmick10 line, and the two TestGimmick10 picture rules point to it.

    0.11.0 (with mod 0.29.0): Legendary Animal markers use a third unused
    test icon, MapIcon_TestGimmick9 (type 407), drawn the same way from the
    game's Animals knowledge category picture (a lion head,
    ui/texture/image/knowledgeimage/cd_knowledgeinfo_categoryicon_animal.dds), tinted pale gold to
    match the patrol path line the mod draws for them:
    ui/texture/cd_icon_map_pywel_animal.dds (name 24 characters, path 39),
    one texture list line after the TestGimmick9 line, and the two
    TestGimmick9 picture rules point to it.

    The game files are taken from the install at build time, so the mod
    always matches the installed game version, and only the user's own copy
    is written. The script stops without writing anything if the files do not
    look as studied (anchor text missing or doubled, or a shrine layout that
    is not this mod's own). While this mod is mounted by DMM the install holds
    our patched copy; our exact addition is then taken out first.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert (pack group 0012, read-only)
Reads (v0.80): research/analysis/chest-item-stats.json (buff icon textures)
Reads (v0.82): src/pywel-atlas-ui/pywel-star-cluster.png (the Constellation picture)
Reads (v0.84): src/marker-bell/MapMarkerShared.h (kCategories layout names, for the size check;
        in NativeMapCategoryProbe.cpp until the v0.122 split)
Reads (v0.86): ui/xml/gamemain/play/worldmapview.html, minimaphudview2.html, minimaphudview2.css (pack 0012)
Reads (v0.88): ui/xml/texture/*.xml and the map icon texture sheets they name (pack 0012)
Reads (0.11.0): ui/texture/icon/itemicon_itemgroup_etc_treasuremap.dds (pack 0012, the Treasure Map picture)
Reads (0.11.0): ui/texture/image/knowledgeimage/cd_knowledgeinfo_categoryicon_animal.dds (pack 0012, the Legendary Animal picture)
Writes: dist/pywel-atlas-shrine-icons/mod.json, dist/pywel-atlas-shrine-icons/ui/... and
        dist/PywelAtlasShrineIcons.zip (all overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B src/pywel-atlas-ui/build_ui_patch.py
        (add --check to only check that every marker category has a size, writing nothing)
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import hashlib
import json
import math
import re
import shutil
import struct
import zipfile
import zlib
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))

from pycrimson._context import PackageContext  # noqa: E402

import height_arrows  # noqa: E402  (v0.88, beside this script)

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
OUTPUT = ROOT / "dist" / "pywel-atlas-shrine-icons"
TEMPLATE_FILE = "ui/xml/gamemain/template/worldmapicon.thtml"
STYLE_FILE = "ui/xml/gamemain/template/worldmapicon.css"
VIEW_FILE = "ui/xml/gamemain/play/worldmapview.css"
VERSION = "0.11.1"
# v0.86: our own route line canvases (see the module comment).
WORLD_PAGE_FILE = "ui/xml/gamemain/play/worldmapview.html"
MINIMAP_PAGE_FILE = "ui/xml/gamemain/play/minimaphudview2.html"
MINIMAP_PAGE_STYLE_FILE = "ui/xml/gamemain/play/minimaphudview2.css"
WORLD_CANVAS_ANCHOR = (b'<div id="WorldmapCanvas" css="no-pickable worldmap-canvas cpp-worldmap-canvas-sdf" '
                       b'script="UICanvas" controller-material="UICanvasWorldMapPath" '
                       b'controller-material-parm="preset-ui-canvas-worldmap-path" ></div>')
# v0.87: Painted (the game's map line material) then Plain; v0.90: Painted
# on the game's own route preset (binding test, see the module comment).
# v0.91: the plain canvas only.
WORLD_ROUTE_CANVAS = (b'\r\n\t\t\t\t\t\t<div id="PywelRouteCanvasPlain" css="no-pickable worldmap-canvas" '
                      b'script="UICanvas"></div>')
# The v0.90 world canvases (Painted on the game's preset), taken out of a mounted install.
WORLD_ROUTE_CANVAS_V090 = (b'\r\n\t\t\t\t\t\t<div id="PywelRouteCanvas" css="no-pickable worldmap-canvas" '
                           b'script="UICanvas" controller-material="UICanvasWorldMapPath" '
                           b'controller-material-parm="preset-ui-canvas-worldmap-path" ></div>'
                           b'\r\n\t\t\t\t\t\t<div id="PywelRouteCanvasPlain" css="no-pickable worldmap-canvas" '
                           b'script="UICanvas"></div>')
# The v0.87-v0.89 world canvases (our own preset), taken out of a mounted install.
WORLD_ROUTE_CANVAS_V087 = (b'\r\n\t\t\t\t\t\t<div id="PywelRouteCanvas" css="no-pickable worldmap-canvas" '
                           b'script="UICanvas" controller-material="UICanvasWorldMapPath" '
                           b'controller-material-parm="preset-pywel-route" ></div>'
                           b'\r\n\t\t\t\t\t\t<div id="PywelRouteCanvasPlain" css="no-pickable worldmap-canvas" '
                           b'script="UICanvas"></div>')
# The v0.86 world canvas, taken out of a mounted install.
WORLD_ROUTE_CANVAS_V086 = (b'\r\n\t\t\t\t\t\t<div id="PywelRouteCanvas" css="no-pickable worldmap-canvas" '
                           b'script="UICanvas"></div>')
# v0.87: our solid preset, after the game's own route preset in worldmapview.css.
PATH_PRESET_ANCHOR = b"@material-param preset-ui-canvas-worldmap-path "
ROUTE_PRESET = (b"\r\n\r\n@material-param preset-pywel-route\r\n{\r\n"
                b"\t_noiseScale: float, 7.000000;\r\n"
                b"\t_noiseIntensity: float, 0.15000;\r\n"
                b"\t_dotThickness: float, 0.000000;\r\n"
                b"\t_dotRoundness: float, 0.800000;\r\n"
                b"\t_dotLength: float, 40.000000;\r\n"
                b"\t_dotSpacing: float, 10.000000;\r\n}")
MINIMAP_CANVAS_ANCHOR = b'<div id="MinimapDestinationCanvas" css="minimap-destination-canvas" script="UICanvas"></div>'
MINIMAP_ROUTE_CANVAS = (b'\r\n' + b' ' * 32 + b'<div id="PywelRouteMinimapCanvas" css="pywel-route-minimap-canvas" '
                        b'script="UICanvas"></div>')
MINIMAP_CANVAS_RULE = (b'.minimap-destination-canvas { position: absolute; top: 0; left: 0; width: 100%; '
                       b'height: 100%; overflow: hidden; opacity: 0.75; } ')
ROUTE_CANVAS_RULE = (b'\r\n.pywel-route-minimap-canvas { position: absolute; top: 0; left: 0; width: 100%; '
                     b'height: 100%; overflow: hidden; } ')
# v0.82: the test icon's picture (see the module comment).
MINIMAP_STYLE_FILE = "ui/xml/gamemain/template/minimapicon.css"
TEXTURE_LIST_FILE = "ui/xml/texture/cd_icon_map_00.xml"
SAMPLE_ICON_FILE = "ui/texture/cd_icon_map_enemy_die_1.dds"
STAR_PICTURE = ROOT / "src" / "pywel-atlas-ui" / "pywel-star-cluster.png"
STAR_TEXTURE_FILE = "ui/texture/cd_icon_map_pywel_star_cluster.dds"
STAR_SIZE = 52  # px, like the game's own map icon pictures (cd_Icon_map_testgimmick11 is 52 x 52).
GAME_TEST_TEXTURE = b"textureid(cd_Icon_map_testgimmick11)"
STAR_TEXTURE = b"textureid(cd_icon_map_pywel_star_cluster)"
# The test icon's two picture rules, up to their closing brace.
WORLD_TEST_RULE = (b".worldmap-icon-testgimmick11 { position: absolute; width: 32px; height: 32px;"
                   b" transform:translate(-50%, -50%); background-image: textureid(cd_Icon_map_testgimmick11);"
                   b" background-color: #f2efe7; background-blend-mode: multiply; }")
MINIMAP_TEST_RULE = (b".minimap-icon-testgimmick11 { background-image: textureid(cd_Icon_map_testgimmick11);"
                     b" background-color: #f2efe7; background-blend-mode: multiply; }")
# The texture list's line for the test icon, and ours right after it.
TEST_TEXTURE_LINE = (b'<Texture Name="cd_Icon_map_testgimmick11" Filename="UI/texture/cd_icon_map_00.dds"'
                     b' Type="Image" GetRect="861,929,52,52"/>\r\n')
STAR_TEXTURE_LINE = (b'<Texture Name="cd_icon_map_pywel_star_cluster"'
                     b' Filename="UI/texture/cd_icon_map_pywel_star_cluster.dds"'
                     b' Type="Image" GetRect="0,0,52,52"/>\r\n')
# 0.11.0: the Treasure Map picture on the other unused test icon
# (TestGimmick10), made from the game's treasure map item picture (see the
# module comment). Same shapes as the star's rules and texture line above.
TREASURE_SOURCE_FILE = "ui/texture/icon/itemicon_itemgroup_etc_treasuremap.dds"
TREASURE_SOURCE_SIZE = 256  # px, DXT5, one mip level (checked when read).
TREASURE_TEXTURE_FILE = "ui/texture/cd_icon_map_pywel_treasuremap.dds"
TREASURE_NAME = "cd_icon_map_pywel_treasuremap"
# Parchment ramp: the grey picture's dark lines become TREASURE_DARK and its
# paper TREASURE_LIGHT (grey 64 and below = dark, 242 and above = light).
TREASURE_DARK = (58, 38, 20)
TREASURE_LIGHT = (238, 214, 162)
GAME_TEST10_TEXTURE = b"textureid(cd_Icon_map_testgimmick10)"
TREASURE_TEXTURE = b"textureid(cd_icon_map_pywel_treasuremap)"
WORLD_TEST10_RULE = (b".worldmap-icon-testgimmick10 { position: absolute; width: 32px; height: 32px;"
                     b" transform:translate(-50%, -50%); background-image: textureid(cd_Icon_map_testgimmick10);"
                     b" background-color: #f2efe7; background-blend-mode: multiply; }")
MINIMAP_TEST10_RULE = (b".minimap-icon-testgimmick10 { background-image: textureid(cd_Icon_map_testgimmick10);"
                       b" background-color: #f2efe7; background-blend-mode: multiply; }")
TEST10_TEXTURE_LINE = (b'<Texture Name="cd_Icon_map_testgimmick10" Filename="UI/texture/cd_icon_map_00.dds"'
                       b' Type="Image" GetRect="861,875,52,52"/>\r\n')
TREASURE_TEXTURE_LINE = (b'<Texture Name="cd_icon_map_pywel_treasuremap"'
                         b' Filename="UI/texture/cd_icon_map_pywel_treasuremap.dds"'
                         b' Type="Image" GetRect="0,0,52,52"/>\r\n')
# 0.11.0: the Legendary Animal picture on a third unused test icon
# (TestGimmick9), made from the game's Animals knowledge category picture the same
# way, on a pale gold ramp (the colour of the mod's patrol path line).
ANIMAL_SOURCE_FILE = "ui/texture/image/knowledgeimage/cd_knowledgeinfo_categoryicon_animal.dds"
ANIMAL_TEXTURE_FILE = "ui/texture/cd_icon_map_pywel_animal.dds"
ANIMAL_NAME = "cd_icon_map_pywel_animal"
ANIMAL_DARK = (60, 38, 12)
ANIMAL_LIGHT = (244, 216, 140)
# 0.29.1: the lion alone faded into the pale map (test 19), so it gets a
# solid dark disc behind it (centre x, centre y, radius in source pixels,
# just inside its outer ring) and a brighter ramp (grey 40 to 200).
ANIMAL_DISC = (129.5, 129.5, 104.0)
ANIMAL_DISC_COLOUR = (38, 24, 8)
ANIMAL_GREYS = (40, 200)
GAME_TEST9_TEXTURE = b"textureid(cd_Icon_map_testgimmick9)"
ANIMAL_TEXTURE = b"textureid(cd_icon_map_pywel_animal)"
WORLD_TEST9_RULE = (b".worldmap-icon-testgimmick9 { position: absolute; width: 32px; height: 32px;"
                    b" transform:translate(-50%, -50%); background-image: textureid(cd_Icon_map_testgimmick9);"
                    b" background-color: #f2efe7; background-blend-mode: multiply; }")
MINIMAP_TEST9_RULE = (b".minimap-icon-testgimmick9 { background-image: textureid(cd_Icon_map_testgimmick9);"
                      b" background-color: #f2efe7; background-blend-mode: multiply; }")
TEST9_TEXTURE_LINE = (b'<Texture Name="cd_Icon_map_testgimmick9" Filename="UI/texture/cd_icon_map_00.dds"'
                      b' Type="Image" GetRect="894,551,52,52"/>\r\n')
ANIMAL_TEXTURE_LINE = (b'<Texture Name="cd_icon_map_pywel_animal"'
                       b' Filename="UI/texture/cd_icon_map_pywel_animal.dds"'
                       b' Type="Image" GetRect="0,0,52,52"/>\r\n')

# v0.84/v0.85: even marker sizes (see the module comment).
# The target is the Sealed Abyss Artifact's look (Thomas's pick). World map
# (v0.85): about 24 px visible at the shared zoom scale 1.0, so each box is
# 24 / (visible share of its picture), from the measured pictures
# (research/analysis/marker-textures/visible.json). Minimap: the artifact
# picture's share (0.82) of the 27 px box, about 22 px: 22.2 / share. Each
# entry: the icon layout (kCategories template name), the picture classes it
# uses on each map with the game's box size and ours, in px (the picture is
# stretched to the box). "background" (Abyss Nexus) is the size its picture
# is drawn at inside the box, since that rule sets its own background size.
MARKER_SIZE_CLASS = b"pywel-marker"
MARKER_SIZES = {
    # Bell: 48 px box, picture 104 of 154 px (with its yellow glow).
    "MapIcon_Gimmick_Bell_01": {"world": [("worldmap-icon-gimmick-bell-01", 48, 36)],
                                "minimap": [("minimap-icon-gimmick-bell-01", 27, 26)]},
    # Greymane Shrine: our own 32 px layout, picture 92 of 100 px.
    "MapIcon_Gimmick_GreyManeTemple": {"world": [("worldmap-icon-gimmick-greymanetemple", 32, 26)],
                                       "minimap": [("icon-image-greymanetemple", 27, 24)]},
    # Chests, Abyss chests and unique gear: 25 px box, chest 85 of 100 px wide.
    "MapIcon_Gimmick_LevelTreasureBox": {"world": [("worldmap-icon-gimmick-level-treasurebox", 25, 28)],
                                         "minimap": [("minimap-icon-gimmick-level-treasurebox", 27, 27)]},
    # Abyss Nexus (surface and Abyss-island): 50 px box and its small variant;
    # the picture (390 of 512 px visible) is drawn at "background" px, centred.
    "MapIcon_Abyss_Ruins": {"world": [("worldmap-illust-abyss-ruins", 50, 40),
                                      ("worldmap-illust-abyss-ruins-small", 50, 40)],
                            "minimap": [("minimap-icon-abyss-ruins", 27, 23)],
                            "background": 31.5},
    # Sealed Abyss Artifact: the target itself; unchanged.
    "MapIcon_Gimmick_SealedArtifact": {"world": [("worldmap-icon-gimmick-sealed-artifact", 30, 30)],
                                       "minimap": [("minimap-icon-gimmick-selaed-artifact", 27, 27)]},
    # Abyss Cresset: 32 px box, picture 50 of 52 px tall.
    "MapIcon_StandStone": {"world": [("worldmap-icon-standstone", 32, 25)],
                           "minimap": [("minimap-icon-standstone", 27, 23)]},
    # Constellation star: 32 px box, star 46 of 52 px.
    "MapIcon_TestGimmick11": {"world": [("worldmap-icon-testgimmick11", 32, 27)],
                              "minimap": [("minimap-icon-testgimmick11", 27, 25)]},
    # 0.11.0: Treasure Map pieces: 32 px box, map 51 of 52 px wide but only
    # 42 tall, so a little larger than the share alone gives.
    "MapIcon_TestGimmick10": {"world": [("worldmap-icon-testgimmick10", 32, 26)],
                              "minimap": [("minimap-icon-testgimmick10", 27, 24)]},
    # 0.11.0: Legendary Animals: the lion disc fills 43 of 52 px; 0.29.1
    # (test 19, hard to see): drawn at 34 px (disc about 28 px), larger
    # than the other pins; minimap at the full 27 px box.
    "MapIcon_TestGimmick9": {"world": [("worldmap-icon-testgimmick9", 32, 34)],
                             "minimap": [("minimap-icon-testgimmick9", 27, 27)]},
    # 0.29.0: Memory Fragments: the game's own fragment icon (25 px box),
    # given the Bell's sizes until its picture is measured.
    "MapIcon_Item_Visione_Memory_Chip": {"world": [("worldmap-icon-item-visione-memory-chip", 25, 36)],
                                         "minimap": [("minimap-icon-item-visione-memory-chip", 27, 26)]},
    # Sanctum Cores and Kuku Pot items: the game's own Kuku battery icon (32 px
    # box on the world map), drawn at the Artifact's 30 px until its picture
    # is measured; minimap at its 27 px box.
    "MapIcon_Gimmick_KuKu_Battery": {"world": [("worldmap-icon-gimmick-kuku-battery", 32, 30)],
                                     "minimap": [("minimap-icon-gimmick-kuku-battery", 27, 27)]},
}
# v0.122: the map code split moved kCategories into MapMarkerShared.h.
CATEGORY_SOURCE = ROOT / "src" / "marker-bell" / "MapMarkerShared.h"
# One kCategories entry: {"Label", type, template id, "MapIcon_...", ...
CATEGORY_ENTRY = re.compile(r'\{"([^"]+)", \d+, \d+, "(MapIcon_[A-Za-z0-9_]+)"')
# The block this add-on appends to each picture style file (found again and
# taken out when a mounted install already holds it).
MARKER_SIZE_START = b"\r\n/* Pywel Atlas: even marker sizes (class pywel-marker on Pywel Atlas markers only) */"
MARKER_SIZE_END = b"\r\n/* Pywel Atlas: end of marker sizes */"


def check_marker_sizes():
    """Stop unless every marker category in the mod has an entry in MARKER_SIZES."""
    text = CATEGORY_SOURCE.read_text(encoding="utf-8")
    start = text.find("kCategories[kCategoryCount] = {")
    end = text.find("};", start)
    if start < 0 or end < 0:
        raise SystemExit("kCategories not found in MapMarkerShared.h; nothing written.")
    categories = CATEGORY_ENTRY.findall(text[start:end])
    if not categories:
        raise SystemExit("No marker categories found in kCategories; nothing written.")
    missing = sorted({f"{label} ({layout})" for label, layout in categories if layout not in MARKER_SIZES})
    if missing:
        raise SystemExit("Marker categories with no size in MARKER_SIZES (build_ui_patch.py): "
                         + ", ".join(missing) + ". Add one so they match the others; nothing written.")
    return categories


def marker_size_rules(side):
    """Return the v0.84 size block for one map ("world" or "minimap")."""
    rules = [MARKER_SIZE_START]
    for layout, entry in MARKER_SIZES.items():
        for picture_class, old_size, new_size in entry[side]:
            rule = b"\r\n.%s.%s { width: %dpx; height: %dpx;" % (
                picture_class.encode("ascii"), MARKER_SIZE_CLASS, new_size, new_size)
            if side == "world" and entry.get("background"):
                # The game draws this picture at its own background size
                # (20 px at 15 px from the corner); ours is centred in the box.
                size = entry["background"]
                offset = (new_size - size) / 2
                rule += b" background-size: %.6fpx %.6fpx; background-position: %.6fpx %.6fpx;" % (
                    size, size, offset, offset)
            rules.append(rule + b" }")
    rules.append(MARKER_SIZE_END)
    return b"".join(rules)


def take_out_marker_sizes(text, name):
    """Remove this add-on's size block from a mounted copy (any version), or stop if it looks foreign."""
    if MARKER_SIZE_CLASS not in text:
        return text
    start = text.find(MARKER_SIZE_START)
    end = text.find(MARKER_SIZE_END)
    if start < 0 or end < start or text.count(MARKER_SIZE_START) != 1:
        raise SystemExit(f"{name} has pywel-marker rules that are not ours; nothing written.")
    text = text[:start] + text[end + len(MARKER_SIZE_END):]
    if MARKER_SIZE_CLASS in text:
        raise SystemExit(f"{name} has pywel-marker rules that are not ours; nothing written.")
    print(f"Found this mod's own marker sizes in {name} (mounted by DMM); rebuilt without them.")
    return text


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

# v0.79: the knowledge card picture's rule, after which the size classes go.
PICTURE_STYLE = b".knowledge-info-image-worldmap { position: absolute; top: 50%;"
PICTURE_SIZE = 340 * 0.86  # px: 86% of #KnowledgeInfoImageWrap's 340 px
ICON_STEPS = (60, 70, 80, 90)
ICON_SIZE_STYLE = b"".join(
    b"\r\n#KnowledgeInfoImage.pywel-icon-%d { background-size: %.6fpx %.6fpx; background-position: center center;"
    b" background-repeat: no-repeat; }" % (step, PICTURE_SIZE * step / 100, PICTURE_SIZE * step / 100)
    for step in ICON_STEPS)



def buff_icon_style():
    """Return the v0.80 buff icon rules: one per icon texture the chest cards' effect lines use.

    Class names follow prepare_tooltip_texts.buff_icon_class:
    cd_icon_ability_FIRE -> pywel-buff-fire.
    """
    stats = json.loads((ROOT / "research" / "analysis" / "chest-item-stats.json").read_text(encoding="utf-8"))
    textures = sorted({part["icon"] for kind in ("surface", "abyss", "unique") for row in stats[kind]
                       for part in row.get("parts", []) if part["kind"] == "effect" and part.get("icon")})
    rules = []
    for texture in textures:
        if not texture.startswith("cd_icon_ability_") or not texture.replace("_", "").isalnum():
            raise SystemExit(f"Unexpected buff icon texture {texture!r}; nothing written.")
        name = texture[len("cd_icon_ability_"):].lower().replace("_", "-")
        rules.append(f"\r\n.item-tooltip-buff-stat-icon.pywel-buff-{name} {{ background-image: textureid({texture}); }}")
    return "".join(rules).encode("ascii")


BUFF_ICON_STYLE = buff_icon_style()
# v0.81: stat rows with no inventory icon class get a related game icon
# (prepare_tooltip_texts.STAT_ICON_OVERRIDES).
STAT_ICON_STYLE = (b"\r\n.item-tooltip-stat-icon2.pywel-stat-guardpvrate"
                   b" { background-image: textureid(cd_icon_ability_GUARDCRASH); }")
# Any icon rule this add-on writes (v0.80 on), for taking an older version out.
OUR_ICON_RULE = re.compile(rb"\r\n\.item-tooltip-(?:buff-stat-icon|stat-icon2)\.pywel-(?:buff|stat)-[a-z0-9-]+"
                           rb" \{ background-image: textureid\([A-Za-z0-9_]+\); \}")


def read_png_rgba(path):
    """Return (width, height, rgba bytes) of an 8-bit RGBA, non-interlaced PNG.

    Only the shape draw_star_icon.py writes is accepted; anything else stops
    the build, so a changed picture never turns into a wrong texture.
    """
    data = path.read_bytes()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise SystemExit(f"{path.name} is not a PNG; nothing written.")
    position = 8
    header = None
    compressed = b""
    while position < len(data):
        length, kind = struct.unpack_from(">I4s", data, position)
        body = data[position + 8:position + 8 + length]
        if kind == b"IHDR":
            header = struct.unpack(">IIBBBBB", body)
        elif kind == b"IDAT":
            compressed += body
        elif kind == b"IEND":
            break
        position += 12 + length
    if header is None or header[2:] != (8, 6, 0, 0, 0):
        raise SystemExit(f"{path.name} is not an 8-bit RGBA PNG; nothing written.")
    width, height = header[:2]
    raw = zlib.decompress(compressed)
    stride = width * 4
    if len(raw) != height * (stride + 1):
        raise SystemExit(f"{path.name} has an unexpected size; nothing written.")

    # Undo the PNG row filters (each row starts with its filter number).
    pixels = bytearray()
    previous = bytearray(stride)
    for row in range(height):
        kind = raw[row * (stride + 1)]
        line = bytearray(raw[row * (stride + 1) + 1:(row + 1) * (stride + 1)])
        for index in range(stride):
            left = line[index - 4] if index >= 4 else 0
            up = previous[index]
            upper_left = previous[index - 4] if index >= 4 else 0
            if kind == 1:
                line[index] = (line[index] + left) & 0xFF
            elif kind == 2:
                line[index] = (line[index] + up) & 0xFF
            elif kind == 3:
                line[index] = (line[index] + (left + up) // 2) & 0xFF
            elif kind == 4:
                guess = left + up - upper_left
                distances = (abs(guess - left), abs(guess - up), abs(guess - upper_left))
                nearest = (left, up, upper_left)[distances.index(min(distances))]
                line[index] = (line[index] + nearest) & 0xFF
            elif kind != 0:
                raise SystemExit(f"{path.name} uses an unknown PNG filter; nothing written.")
        pixels += line
        previous = line
    return width, height, bytes(pixels)


def rgb565(red, green, blue):
    """Pack an 8-bit colour into the 16-bit 5-6-5 form DXT colour ends use."""
    return ((red >> 3) << 11) | ((green >> 2) << 5) | (blue >> 3)


def unpack565(value):
    """Expand a 5-6-5 colour back to 8 bits per channel, as the GPU does."""
    red, green, blue = (value >> 11) & 31, (value >> 5) & 63, value & 31
    return ((red << 3) | (red >> 2), (green << 2) | (green >> 4), (blue << 3) | (blue >> 2))


def encode_dxt5_block(block):
    """Encode one 4 x 4 block (16 RGBA tuples) as 16 bytes of DXT5 (BC3)."""
    # Alpha: two ends and six steps between them, 3 bits per pixel.
    alphas = [pixel[3] for pixel in block]
    high, low = max(alphas), min(alphas)
    alpha_bits = 0  # All zero = every pixel takes the first end (also when high == low).
    if high != low:
        steps = [high, low] + [((7 - step) * high + step * low) // 7 for step in range(1, 7)]
        for index, alpha in enumerate(alphas):
            best = min(range(8), key=lambda step: abs(steps[step] - alpha))
            alpha_bits |= best << (3 * index)
    alpha_part = bytes((high, low)) + alpha_bits.to_bytes(6, "little")

    # Colour: the box around the visible pixels' colours, 2 bits per pixel.
    visible = [pixel[:3] for pixel in block if pixel[3] >= 8] or [(0, 0, 0)]
    first = rgb565(*(max(channel) for channel in zip(*visible)))
    second = rgb565(*(min(channel) for channel in zip(*visible)))
    color_bits = 0
    if first != second:
        # first > second here, so the block uses four colours, no transparency.
        ends = (unpack565(first), unpack565(second))
        palette = [ends[0], ends[1], tuple((2 * a + b) // 3 for a, b in zip(*ends)),
                   tuple((a + 2 * b) // 3 for a, b in zip(*ends))]
        for index, pixel in enumerate(block):
            best = min(range(4), key=lambda step: sum((p - q) ** 2 for p, q in zip(palette[step], pixel[:3])))
            color_bits |= best << (2 * index)
    return alpha_part + struct.pack("<HHI", first, second, color_bits)


def star_texture(sample_icon):
    """Return the DDS file for the star picture, in the form of the game's small map icons.

    `sample_icon` is the game's cd_icon_map_enemy_die_1.dds (32 x 32, DXT5,
    one mip level, not split for streaming). Its 128-byte header is kept
    except height, width and data size; the pixels are our picture in DXT5.
    """
    header = bytearray(sample_icon[:128])
    if header[:4] != b"DDS " or header[84:88] != b"DXT5" or struct.unpack_from("<III", header, 12) != (32, 32, 1024) \
            or struct.unpack_from("<I", header, 28)[0] != 1 or len(sample_icon) != 128 + 1024:
        raise SystemExit("The game's sample map icon file looks different; nothing written.")
    width, height, pixels = read_png_rgba(STAR_PICTURE)
    if (width, height) != (STAR_SIZE, STAR_SIZE):
        raise SystemExit(f"{STAR_PICTURE.name} must be {STAR_SIZE} x {STAR_SIZE}; nothing written.")
    blocks = bytearray()
    for top in range(0, height, 4):
        for left in range(0, width, 4):
            block = [tuple(pixels[((top + y) * width + left + x) * 4:((top + y) * width + left + x) * 4 + 4])
                     for y in range(4) for x in range(4)]
            blocks += encode_dxt5_block(block)
    struct.pack_into("<III", header, 12, height, width, len(blocks))
    return bytes(header) + bytes(blocks)


def item_picture_rows(source, dark_colour, light_colour, what, greys=(64, 242), disc=None, disc_colour=None):
    """Return the 52 x 52 RGBA rows of a map picture made from a game item picture (0.11.0).

    `source` is a game item group picture (256 x 256, DXT5, one mip level).
    Each pixel's grey level picks a colour on the ramp from `dark_colour`
    (grey `greys[0]` and below) to `light_colour` (`greys[1]` and above),
    alpha kept, then the picture is scaled to STAR_SIZE. With `disc`
    (centre x, centre y, radius) the picture lies on a solid `disc_colour`
    disc (0.29.1). `what` names it in the error.
    """
    if source is None or source[:4] != b"DDS " or source[84:88] != b"DXT5" or \
            struct.unpack_from("<II", source, 12) != (TREASURE_SOURCE_SIZE, TREASURE_SOURCE_SIZE) or \
            len(source) != 128 + TREASURE_SOURCE_SIZE * TREASURE_SOURCE_SIZE:
        raise SystemExit(f"The game's {what} item picture looks different; nothing written.")
    rows = height_arrows.decode_dxt5_rect(source, 0, 0, TREASURE_SOURCE_SIZE, TREASURE_SOURCE_SIZE)
    tinted = []
    for row in rows:
        line = []
        for red, green, blue, alpha in row:
            grey = (red * 299 + green * 587 + blue * 114) / 1000
            share = min(1.0, max(0.0, (grey - greys[0]) / (greys[1] - greys[0])))
            colour = tuple(dark + (light - dark) * share for dark, light in zip(dark_colour, light_colour))
            if disc is not None:
                # Edge pixels of the disc get partial cover, so its rim is smooth.
                cover = min(1.0, max(0.0, disc[2] - math.hypot(len(line) - disc[0], len(tinted) - disc[1])))
                over = alpha / 255
                under = cover * (1 - over)
                total = over + under
                if total > 0:
                    colour = tuple((c * over + b * under) / total for c, b in zip(colour, disc_colour))
                alpha = round(total * 255)
            line.append(tuple(round(c) for c in colour) + (alpha,))
        tinted.append(line)
    return height_arrows.resample(tinted, STAR_SIZE)


def treasure_map_rows(source):
    """Return the 52 x 52 RGBA rows of the Treasure Map picture (0.11.0, parchment ramp)."""
    return item_picture_rows(source, TREASURE_DARK, TREASURE_LIGHT, "treasure map")


def animal_rows(source):
    """Return the 52 x 52 RGBA rows of the Legendary Animal picture (0.11.0, pale gold ramp)."""
    return item_picture_rows(source, ANIMAL_DARK, ANIMAL_LIGHT, "animal", ANIMAL_GREYS, ANIMAL_DISC,
                             ANIMAL_DISC_COLOUR)


def add_route_canvas(text, name, anchor, addition, earlier=()):
    """v0.86: puts `addition` right after `anchor` (both exactly once as
    studied). Our own addition (the install holds it while this mod is
    mounted; v0.87: also an `earlier` version's) is taken out first; any
    other pywel route text stops."""
    if b"ywelRoute" in text or b"pywel-route" in text:
        ours = next((form for form in (addition, *earlier) if text.count(anchor + form) == 1), None)
        if ours is None:
            raise SystemExit(f"{name} has pywel route canvas text that is not ours; nothing written.")
        text = text.replace(anchor + ours, anchor, 1)
        if b"ywelRoute" in text or b"pywel-route" in text:
            raise SystemExit(f"{name} has pywel route canvas text that is not ours; nothing written.")
        print(f"Found this mod's own route canvas in {name} (mounted by DMM); rebuilt without it.")
    if text.count(anchor) != 1:
        raise SystemExit(f"{name} does not have the canvas text as studied; nothing written.")
    return text.replace(anchor, anchor + addition, 1)


def insert_after_block(text, anchor, closing, addition):
    """Insert `addition` after the first `closing` that follows the single `anchor`."""
    if text.count(anchor) != 1:
        raise SystemExit(f"Expected exactly one {anchor!r} in the game file; nothing written.")
    start = text.index(anchor)
    end = text.index(closing, start) + len(closing)
    return text[:end] + addition + text[end:]


def main():
    """Read the two game files, add the shrine layout and write the DMM mod folder."""
    # v0.84: every marker category must have a size before anything is read.
    categories = check_marker_sizes()
    if "--check" in sys.argv[1:]:
        print(f"Marker sizes: all {len(categories)} categories have one.")
        return
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    template = context.get_file(TEMPLATE_FILE)
    style = context.get_file(STYLE_FILE)
    view = context.get_file(VIEW_FILE)
    minimap_style = context.get_file(MINIMAP_STYLE_FILE)
    texture_list = context.get_file(TEXTURE_LIST_FILE)
    sample_icon = context.get_file(SAMPLE_ICON_FILE)
    treasure_rows = treasure_map_rows(context.get_file(TREASURE_SOURCE_FILE))
    animal_picture_rows = animal_rows(context.get_file(ANIMAL_SOURCE_FILE))
    world_page = context.get_file(WORLD_PAGE_FILE)
    minimap_page = context.get_file(MINIMAP_PAGE_FILE)
    minimap_page_style = context.get_file(MINIMAP_PAGE_STYLE_FILE)
    if world_page is None or minimap_page is None or minimap_page_style is None:
        raise SystemExit("A game file for the route canvases is missing; nothing written.")
    if minimap_style is None or texture_list is None or sample_icon is None:
        raise SystemExit("A game file for the Constellation picture is missing; nothing written.")
    # v0.88: our height arrow rules and texture lines come out first, since
    # they name the star picture and the class pywel-marker, which the checks
    # below count.
    style = height_arrows.take_out(style, STYLE_FILE)
    minimap_style = height_arrows.take_out(minimap_style, MINIMAP_STYLE_FILE)
    texture_list = height_arrows.take_out_texture_lines(texture_list)
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

    if b"preset-pywel-route" in view:
        # v0.87: same for our route preset.
        if view.count(ROUTE_PRESET) != 1 or view.count(b"preset-pywel-route") != 1:
            raise SystemExit("The world-map view file has a pywel route preset that is not ours; nothing written.")
        view = view.replace(ROUTE_PRESET, b"", 1)
        print("Found this mod's own route preset in the install (mounted by DMM); rebuilt without it.")

    if b"pywel-buff-" in view or b"pywel-stat-" in view:
        # Same as above for the icon rules (v0.80 on), whichever version is mounted.
        view, removed = OUR_ICON_RULE.subn(b"", view)
        if b"pywel-buff-" in view or b"pywel-stat-" in view:
            raise SystemExit("The world-map view file has pywel icon rules that are not ours; nothing written.")
        print(f"Found {removed} of this mod's own icon rules in the install (mounted by DMM); rebuilt without them.")

    if b"pywel-icon-" in view:
        # Same as above for the size classes (v0.79).
        if view.count(ICON_SIZE_STYLE) != 1 or view.count(b"pywel-icon-") != len(ICON_STEPS):
            raise SystemExit("The world-map view file already has pywel-icon rules that are not ours; nothing written.")
        view = view.replace(ICON_SIZE_STYLE, b"", 1)
        print("Found this mod's own size classes in the install (mounted by DMM); rebuilt from the text without them.")

    # v0.82: while mounted, the install holds our texture line and our picture
    # name in the two test icon rules; put the game's text back first.
    # v0.83: each file is checked on its own, because the install can hold our
    # text in some of them only (the v0.82 install had the game's own minimap file).
    if b"pywel_star_cluster" in texture_list:
        if texture_list.count(STAR_TEXTURE_LINE) != 1 or texture_list.count(b"pywel_star_cluster") != 2:
            raise SystemExit("The map icon texture list has a pywel star picture that is not ours; nothing written.")
        texture_list = texture_list.replace(STAR_TEXTURE_LINE, b"", 1)
        print("Found this mod's own star texture line in the install (mounted by DMM); rebuilt without it.")
    if b"pywel_star_cluster" in style:
        if style.count(STAR_TEXTURE) != 1 or style.count(b"pywel_star_cluster") != 1:
            raise SystemExit("The world-map icon file has a pywel star picture that is not ours; nothing written.")
        style = style.replace(STAR_TEXTURE, GAME_TEST_TEXTURE, 1)
        print("Found this mod's own star picture name in the world-map icon file; rebuilt without it.")
    if b"pywel_star_cluster" in minimap_style:
        if minimap_style.count(STAR_TEXTURE) != 1 or minimap_style.count(b"pywel_star_cluster") != 1:
            raise SystemExit("The minimap icon file has a pywel star picture that is not ours; nothing written.")
        minimap_style = minimap_style.replace(STAR_TEXTURE, GAME_TEST_TEXTURE, 1)
        print("Found this mod's own star picture name in the minimap icon file; rebuilt without it.")
    # 0.11.0: the same for the Treasure Map picture.
    if b"pywel_treasuremap" in texture_list:
        if texture_list.count(TREASURE_TEXTURE_LINE) != 1 or texture_list.count(b"pywel_treasuremap") != 2:
            raise SystemExit("The map icon texture list has a pywel treasure map picture that is not ours; "
                             "nothing written.")
        texture_list = texture_list.replace(TREASURE_TEXTURE_LINE, b"", 1)
        print("Found this mod's own treasure map texture line in the install (mounted by DMM); rebuilt without it.")
    for name, text in ((STYLE_FILE, style), (MINIMAP_STYLE_FILE, minimap_style)):
        if b"pywel_treasuremap" in text and (text.count(TREASURE_TEXTURE) != 1 or
                                             text.count(b"pywel_treasuremap") != 1):
            raise SystemExit(f"{name} has a pywel treasure map picture that is not ours; nothing written.")
    if b"pywel_treasuremap" in style:
        style = style.replace(TREASURE_TEXTURE, GAME_TEST10_TEXTURE, 1)
        print("Found this mod's own treasure map picture name in the world-map icon file; rebuilt without it.")
    if b"pywel_treasuremap" in minimap_style:
        minimap_style = minimap_style.replace(TREASURE_TEXTURE, GAME_TEST10_TEXTURE, 1)
        print("Found this mod's own treasure map picture name in the minimap icon file; rebuilt without it.")
    # 0.11.0: and for the Legendary Animal picture.
    if b"pywel_animal" in texture_list:
        if texture_list.count(ANIMAL_TEXTURE_LINE) != 1 or texture_list.count(b"pywel_animal") != 2:
            raise SystemExit("The map icon texture list has a pywel animal picture that is not ours; nothing written.")
        texture_list = texture_list.replace(ANIMAL_TEXTURE_LINE, b"", 1)
        print("Found this mod's own animal texture line in the install (mounted by DMM); rebuilt without it.")
    for name, text in ((STYLE_FILE, style), (MINIMAP_STYLE_FILE, minimap_style)):
        if b"pywel_animal" in text and (text.count(ANIMAL_TEXTURE) != 1 or text.count(b"pywel_animal") != 1):
            raise SystemExit(f"{name} has a pywel animal picture that is not ours; nothing written.")
    if b"pywel_animal" in style:
        style = style.replace(ANIMAL_TEXTURE, GAME_TEST9_TEXTURE, 1)
        print("Found this mod's own animal picture name in the world-map icon file; rebuilt without it.")
    if b"pywel_animal" in minimap_style:
        minimap_style = minimap_style.replace(ANIMAL_TEXTURE, GAME_TEST9_TEXTURE, 1)
        print("Found this mod's own animal picture name in the minimap icon file; rebuilt without it.")
    # v0.84: same for the marker size blocks.
    style = take_out_marker_sizes(style, STYLE_FILE)
    minimap_style = take_out_marker_sizes(minimap_style, MINIMAP_STYLE_FILE)
    for name, text, side in ((STYLE_FILE, style, "world"), (MINIMAP_STYLE_FILE, minimap_style, "minimap")):
        for entry in MARKER_SIZES.values():
            for picture_class, old_size, _ in entry[side]:
                # The rule must exist, and (world map) still have the size the table was made for.
                rule = re.search(rb"\r?\n\.%s \{[^}]*\}" % re.escape(picture_class.encode("ascii")), text)
                if rule is None and picture_class != "worldmap-icon-gimmick-greymanetemple":
                    raise SystemExit(f"{name} has no .{picture_class} rule as studied; nothing written.")
                if rule is not None and side == "world" and b"width: %dpx;" % old_size not in rule.group(0):
                    raise SystemExit(f"{name}: .{picture_class} is no longer {old_size} px wide; "
                                     "check MARKER_SIZES; nothing written.")
    # Each anchor must be there exactly once, as studied.
    for name, text, anchor, key in ((STYLE_FILE, style, WORLD_TEST_RULE, GAME_TEST_TEXTURE),
                                    (MINIMAP_STYLE_FILE, minimap_style, MINIMAP_TEST_RULE, GAME_TEST_TEXTURE),
                                    (TEXTURE_LIST_FILE, texture_list, TEST_TEXTURE_LINE, b'"cd_Icon_map_testgimmick11"'),
                                    (STYLE_FILE, style, WORLD_TEST10_RULE, GAME_TEST10_TEXTURE),
                                    (MINIMAP_STYLE_FILE, minimap_style, MINIMAP_TEST10_RULE, GAME_TEST10_TEXTURE),
                                    (TEXTURE_LIST_FILE, texture_list, TEST10_TEXTURE_LINE,
                                     b'"cd_Icon_map_testgimmick10"'),
                                    (STYLE_FILE, style, WORLD_TEST9_RULE, GAME_TEST9_TEXTURE),
                                    (MINIMAP_STYLE_FILE, minimap_style, MINIMAP_TEST9_RULE, GAME_TEST9_TEXTURE),
                                    (TEXTURE_LIST_FILE, texture_list, TEST9_TEXTURE_LINE,
                                     b'"cd_Icon_map_testgimmick9"')):
        if text.count(anchor) != 1 or text.count(key) != 1:
            raise SystemExit(f"{name} does not have the test icon text as studied; nothing written.")

    patched_template = insert_after_block(template, BELL_COMPONENT, b"</component>", SHRINE_COMPONENT)
    patched_style = insert_after_block(style, BELL_STYLE, b"}", SHRINE_STYLE)
    patched_view = insert_after_block(view, PICTURE_STYLE, b"}", ICON_SIZE_STYLE + BUFF_ICON_STYLE + STAT_ICON_STYLE)
    # v0.87: our solid route preset right after the game's own route preset.
    # v0.82: the test icon's picture becomes our star texture on both maps.
    patched_style = patched_style.replace(WORLD_TEST_RULE, WORLD_TEST_RULE.replace(GAME_TEST_TEXTURE, STAR_TEXTURE), 1)
    patched_minimap_style = minimap_style.replace(
        MINIMAP_TEST_RULE, MINIMAP_TEST_RULE.replace(GAME_TEST_TEXTURE, STAR_TEXTURE), 1)
    # 0.11.0: the other test icon's picture becomes our Treasure Map texture.
    patched_style = patched_style.replace(
        WORLD_TEST10_RULE, WORLD_TEST10_RULE.replace(GAME_TEST10_TEXTURE, TREASURE_TEXTURE), 1)
    patched_minimap_style = patched_minimap_style.replace(
        MINIMAP_TEST10_RULE, MINIMAP_TEST10_RULE.replace(GAME_TEST10_TEXTURE, TREASURE_TEXTURE), 1)
    # 0.11.0: and the third one's the Legendary Animal texture.
    patched_style = patched_style.replace(
        WORLD_TEST9_RULE, WORLD_TEST9_RULE.replace(GAME_TEST9_TEXTURE, ANIMAL_TEXTURE), 1)
    patched_minimap_style = patched_minimap_style.replace(
        MINIMAP_TEST9_RULE, MINIMAP_TEST9_RULE.replace(GAME_TEST9_TEXTURE, ANIMAL_TEXTURE), 1)
    # v0.88: the height arrow copies of every marker picture (from the rules
    # as patched so far: the shrine layout and the star picture are ours).
    width, height, star_pixels = read_png_rgba(STAR_PICTURE)
    star_rows = [[tuple(star_pixels[(y * width + x) * 4:(y * width + x) * 4 + 4]) for x in range(width)]
                 for y in range(height)]
    arrow_rules, arrow_lines, arrow_files = height_arrows.build(
        context, MARKER_SIZES, {"world": patched_style, "minimap": patched_minimap_style}, sample_icon,
        {"cd_icon_map_pywel_star_cluster": star_rows, TREASURE_NAME: treasure_rows, ANIMAL_NAME: animal_picture_rows},
        encode_dxt5_block)
    patched_texture_list = texture_list.replace(TEST_TEXTURE_LINE, TEST_TEXTURE_LINE + STAR_TEXTURE_LINE + arrow_lines, 1)
    patched_texture_list = patched_texture_list.replace(TEST10_TEXTURE_LINE, TEST10_TEXTURE_LINE + TREASURE_TEXTURE_LINE, 1)
    patched_texture_list = patched_texture_list.replace(TEST9_TEXTURE_LINE, TEST9_TEXTURE_LINE + ANIMAL_TEXTURE_LINE, 1)
    # v0.84: the marker size blocks go last, so they come after every rule they change.
    patched_style += marker_size_rules("world")
    patched_minimap_style += marker_size_rules("minimap")
    # v0.88: the arrow rules after them (same classes plus one more).
    patched_style += arrow_rules["world"]
    patched_minimap_style += arrow_rules["minimap"]
    star_dds = star_texture(sample_icon)
    treasure_dds = height_arrows.dds_file(sample_icon, treasure_rows, encode_dxt5_block)
    animal_dds = height_arrows.dds_file(sample_icon, animal_picture_rows, encode_dxt5_block)
    # v0.86: our route line canvases.
    patched_world_page = add_route_canvas(world_page, WORLD_PAGE_FILE, WORLD_CANVAS_ANCHOR, WORLD_ROUTE_CANVAS,
                                          (WORLD_ROUTE_CANVAS_V090, WORLD_ROUTE_CANVAS_V087,
                                           WORLD_ROUTE_CANVAS_V086))
    patched_minimap_page = add_route_canvas(minimap_page, MINIMAP_PAGE_FILE, MINIMAP_CANVAS_ANCHOR,
                                            MINIMAP_ROUTE_CANVAS)
    patched_minimap_page_style = add_route_canvas(minimap_page_style, MINIMAP_PAGE_STYLE_FILE, MINIMAP_CANVAS_RULE,
                                                  ROUTE_CANVAS_RULE)

    if OUTPUT.exists():
        shutil.rmtree(OUTPUT)
    for name, data in ((TEMPLATE_FILE, patched_template), (STYLE_FILE, patched_style), (VIEW_FILE, patched_view),
                       (MINIMAP_STYLE_FILE, patched_minimap_style), (TEXTURE_LIST_FILE, patched_texture_list),
                       (STAR_TEXTURE_FILE, star_dds), (TREASURE_TEXTURE_FILE, treasure_dds), (ANIMAL_TEXTURE_FILE, animal_dds),
                       (WORLD_PAGE_FILE, patched_world_page),
                       (MINIMAP_PAGE_FILE, patched_minimap_page),
                       (MINIMAP_PAGE_STYLE_FILE, patched_minimap_page_style)) + tuple(arrow_files.items()):
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
                           "own Greymane Shrine icon, so Pywel Atlas shrine pins can appear on the world map, "
                           "picture size classes and stat effect icons for Pywel Atlas chest knowledge "
                           "cards, and the Pywel Atlas star picture for Constellation pins (the game's unused "
                           "test icon), and the game's treasure map item picture, tinted, for Pywel Atlas "
                           "Treasure Map pins (the other unused test icon), and the game's Animals knowledge "
                           "category picture, tinted, for Pywel Atlas Legendary Animal pins (a third test icon), and even sizes for Pywel Atlas markers (class pywel-marker; "
                           "the game's own icons keep theirs), and two line canvases for the Pywel Atlas "
                           "route line (world map and minimap), and up / down height arrow "
                           "pictures for Pywel Atlas markers (classes pywel-above / pywel-below). Changes only "
                           "ui/xml/gamemain/template/worldmapicon.thtml, worldmapicon.css, minimapicon.css, "
                           "ui/xml/gamemain/play/worldmapview.css, worldmapview.html, minimaphudview2.html, "
                           "minimaphudview2.css and ui/xml/texture/cd_icon_map_00.xml, and adds "
                           "ui/texture/cd_icon_map_pywel_star_cluster.dds, ui/texture/cd_icon_map_pywel_treasuremap.dds and the "
                           f"{len(arrow_files)} ui/texture/cd_icon_map_pywel_h*.dds height arrow pictures. Built from the installed game files "
                           "(source SHA-256 "
                           f"{hashlib.sha256(template).hexdigest()[:16]} / "
                           f"{hashlib.sha256(style).hexdigest()[:16]} / "
                           f"{hashlib.sha256(view).hexdigest()[:16]} / "
                           f"{hashlib.sha256(minimap_style).hexdigest()[:16]} / "
                           f"{hashlib.sha256(texture_list).hexdigest()[:16]} / "
                           f"{hashlib.sha256(world_page).hexdigest()[:16]} / "
                           f"{hashlib.sha256(minimap_page).hexdigest()[:16]} / "
                           f"{hashlib.sha256(minimap_page_style).hexdigest()[:16]}); rebuild after a game update.",
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
    print(f"Wrote {OUTPUT} ({len(patched_template)} + {len(patched_style)} + {len(patched_view)} bytes) and {archive}")


if __name__ == "__main__":
    main()
