"""Build the card placeholder fix mock-up (research/mockups/chest-card-placeholder-fix.html).

What it does:
    Cards whose text has a game placeholder ({Key:...}, {Staticinfo:...})
    showed their description twice and the placeholder raw (Thomas, Plate
    Helm of the Shadows; cause and fix in MapKnowledgeCard.h ObserveSetMarkup
    and prepare_tooltip_texts.split_placeholder). This page shows, for the 4
    unique gear / surface items most affected, the card before the fix (as
    seen in game) and after it, in the card's style-3 layout: the game's own
    colours (cdcommon_font.css), its stat and buff icons cut from the game's
    icon sheets (ui/xml/texture/cd_icon_common_00/01.xml rects), and real
    data (chest-item-stats.json, unique-gear-cards.json,
    treasure-chest-contents.json).

    Stand-ins, marked on the page: the key icon is drawn as a key cap with
    the default key letter where known (B for Key_Skill_5_Start, as in
    Thomas's screenshot) or the action name; {Staticinfo:Knowledge:...#Health}
    shows its display text ("Health"), as the game writes it.

Reads:  research/analysis/*.json above; the installed game's interface packs
        (group 0012) through pycrimson, read-only
Writes: research/mockups/chest-card-placeholder-fix.html (overwritten)
Run:    C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe -B research/scripts/build_card_fix_mockup.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import base64
import html
import io
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ANALYSIS = ROOT / "research" / "analysis"
sys.path[:0] = [str(ROOT / "research" / "vendor" / "pycrimson" / "src"),
                str(ROOT / "research" / "vendor" / ".venv" / "Lib" / "site-packages"),
                str(ROOT / "src" / "marker-bell")]

from PIL import Image  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402

import prepare_tooltip_texts as generator  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
ITEMS = [("unique", "Plate Helm of the Shadows"), ("unique", "Marni Laser Helm"),
         ("surface", "Tidebreaker Boots"), ("unique", "Health Detection Device")]
# Icon textures by name (sheet, GetRect) from cd_icon_common_00/01.xml.
SHEET_RECTS = {
    "cd_icon_ability_offense": ("ui/texture/cd_icon_common_00.dds", (814, 631, 52, 52)),
    "cd_icon_ability_defense": ("ui/texture/cd_icon_common_00.dds", (862, 155, 52, 52)),
    "cd_icon_ability_speed": ("ui/texture/cd_icon_common_00.dds", (863, 294, 52, 52)),
    "cd_icon_ability_ICE": ("ui/texture/cd_icon_common_01.dds", (599, 953, 52, 52)),
    "cd_icon_ability_immune": ("ui/texture/cd_icon_common_00.dds", (809, 415, 52, 52)),
    "cd_icon_ability_movement_speed": ("ui/texture/cd_icon_common_00.dds", (813, 577, 52, 52)),
    "cd_icon_ability_Skill": ("ui/texture/cd_icon_common_01.dds", (563, 487, 52, 52)),
    "cd_icon_ability_vitality": ("ui/texture/cd_icon_common_00.dds", (916, 155, 52, 52)),
}
# Stat row icon textures (itemtooltip2.css cpp-<stat>).
STAT_TEXTURES = {"ddd": "cd_icon_ability_offense", "dpv": "cd_icon_ability_defense",
                 "movespeedrate": "cd_icon_ability_speed"}
KEY_CAPS = {"Key_Skill_5_Start": "B", "Key_Roll": "Roll", "Key_Slide": "Slide"}


def load(name):
    """Read one analysis JSON file."""
    return json.loads((ANALYSIS / name).read_text(encoding="utf-8"))


def data_uri(image):
    """Return a PNG data URI for a PIL image."""
    buffer = io.BytesIO()
    image.save(buffer, "PNG")
    return "data:image/png;base64," + base64.b64encode(buffer.getvalue()).decode()


def expand(text, raw):
    """Return HTML for a text: placeholders raw (before the fix) or as the game shows them (after)."""
    out = html.escape(text)
    if raw:
        return out

    def replace(match):
        body = match.group(1)
        if body.startswith("Key:"):
            key = body[4:]
            return f'<span class="keycap">{html.escape(KEY_CAPS.get(key, key))}</span>'
        if "#" in body:
            return f'<span class="f-yellow">{html.escape(body.split("#", 1)[1])}</span>'
        return html.escape(body)

    return re.sub(r"\{([^}]*)\}", replace, out)


def card_body(parts, item_type, body, icons, fixed):
    """Return the description HTML in style 3, as the game would build it."""
    rows = []
    if item_type:
        rows.append(f'<div class="f-gray">{html.escape(item_type)}</div>')
    for part in parts:
        if part["kind"] == "stat":
            texture = STAT_TEXTURES.get(part["status"])
            icon = f'<img class="icon" src="{icons[texture]}">' if texture else '<span class="icon"></span>'
            rows.append(f'<div class="row">{icon}<div class="label f-white">{html.escape(part["label"])}</div>'
                        f'<div class="f-white">{html.escape(part["value"])}</div></div>')
            continue
        texture = part.get("icon")
        icon = f'<img class="icon buff" src="{icons[texture]}">' if texture in icons else '<span class="icon"></span>'
        text, outside = generator.split_placeholder(part["text"]) if fixed else (part["text"], "")
        rows.append(f'<div class="row">{icon}<div class="f-yellow">{expand(text, not fixed)}</div></div>')
        if outside:
            rows.append(f'<div class="f-beige">{expand(outside, False)}</div>')
    description = "<br>".join(expand(line, not fixed) for line in body)
    if fixed:
        return "\n".join(rows) + f'<div class="gap"></div><div class="f-beige">{description}</div>'
    # Before the fix: a full copy before the first placeholder's icon, then
    # the icon, then the whole card again (one copy per set-markup call).
    copy = "\n".join(rows) + f'<div class="gap"></div><div class="f-beige">{description}</div>'
    return (f'<div class="dup">{copy}</div><div class="loose"><span class="keycap">?</span>'
            f' (the key icon the game made)</div>{copy}')


def main():
    """Write the page."""
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    sheets = {}
    icons = {}
    for name, (sheet, (x, y, w, h)) in SHEET_RECTS.items():
        if sheet not in sheets:
            sheets[sheet] = Image.open(io.BytesIO(context.get_file(sheet))).convert("RGBA")
        icons[name] = data_uri(sheets[sheet].crop((x, y, x + w, y + h)))
    stats = load("chest-item-stats.json")
    sources = {"unique": load("unique-gear-cards.json")["items"],
               "surface": load("treasure-chest-contents.json")["categories"]["Chest"]}
    columns = []
    for kind, name in ITEMS:
        rows = sources[kind]
        index = next(i for i, row in enumerate(rows) if row.get("english") == name)
        row = rows[index]
        parts = stats[kind][index]["parts"]
        body = generator.description_lines(row.get("description"))
        cards = []
        for fixed in (False, True):
            label = "After the fix" if fixed else "Before (as seen in game)"
            cards.append(f'<div class="card"><div class="tag {"ok" if fixed else "bad"}">{label}</div>'
                         f'<div class="title">{html.escape(name)}</div>'
                         f'<div class="desc">{card_body(parts, row.get("itemType"), body, icons, fixed)}</div></div>')
        columns.append(f'<div class="pair">{"".join(cards)}</div>')
    page = f"""<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Card Placeholder Fix</title>
<style>
:root{{--bg:#1d1b1a;--muted:#a59886;--gold:#ffd292}}
body{{margin:0;background:var(--bg);color:#e3d6c6;font-family:Georgia,"Times New Roman",serif}}
header{{padding:16px;max-width:1400px;margin:0 auto}}
h1{{font-size:20px;margin:0 0 6px;color:var(--gold)}}
header p{{margin:4px 0;font-family:system-ui,sans-serif;font-size:13px;color:var(--muted);max-width:900px}}
.wrap{{display:flex;flex-direction:column;gap:20px;padding:0 16px 32px;max-width:1400px;margin:0 auto}}
.pair{{display:flex;flex-wrap:wrap;gap:16px}}
.card{{width:min(420px,100%);background:#34312f;border:1px solid #3d3733}}
.tag{{font-family:system-ui,sans-serif;font-size:12px;padding:4px 10px;color:#111}}
.tag.bad{{background:#d14d45}}.tag.ok{{background:#31ba7e}}
.title{{padding:12px;text-align:center;color:#ffd292;font-size:22px;background:repeating-linear-gradient(135deg,#2b2725 0 4px,#312c2a 4px 8px);border-bottom:1px solid #4a423c}}
.desc{{margin:10px;padding:8px 10px;background:#3a3532;line-height:21px;font-size:15px;text-shadow:2px 2px 1px #181818}}
.f-white{{color:#f6f0f0}}.f-beige{{color:#e0c9b1}}.f-yellow{{color:#ffd292}}.f-gray{{color:#acacac}}
.row{{display:flex;align-items:center;gap:4px}}
.label{{width:150px;white-space:nowrap}}
.icon{{width:22px;height:22px;display:inline-block;flex:none}}
.icon.buff{{filter:sepia(1) saturate(2) hue-rotate(-10deg) brightness(1.1)}}
.gap{{height:21px}}
.keycap{{display:inline-block;min-width:16px;padding:0 4px;border:1px solid #cbbfae;border-radius:3px;font-family:system-ui,sans-serif;font-size:12px;line-height:16px;text-align:center;color:#f6f0f0;background:#2a2624}}
.dup{{opacity:.85;border-bottom:1px dashed #d14d45;margin-bottom:6px;padding-bottom:6px}}
.loose{{color:var(--muted);font-family:system-ui,sans-serif;font-size:12px;margin-bottom:6px}}
</style></head><body>
<header><h1>Cards with game placeholders: before and after the fix</h1>
<p>Real data and the game's colours and icons (cut from its icon sheets). Before: the game builds a description in pieces
around each placeholder, and the mod pasted the whole card into every piece, so the card appeared twice around the key
icon and the placeholder stayed raw. After: the card is built once, the game draws the key icon, and the key part sits
on its own line under its effect. Key caps are stand-ins: B is the default for Glacial Domain/Laser (from your
screenshot); other keys show the action name, the game shows your own binding.</p></header>
<div class="wrap">{''.join(columns)}</div></body></html>
"""
    output = ROOT / "research" / "mockups" / "chest-card-placeholder-fix.html"
    output.write_text(page, encoding="utf-8")
    print(f"Wrote {output} ({len(page) // 1024} KB)")


if __name__ == "__main__":
    main()
