"""Build the chest card stat-line style mock-up (research/mockups/chest-card-stat-styles.html).

What it does:
    v0.106 put each stat line on the knowledge card in its own
    <div css="font-text-caption-minor-white">, joined with <br/>. In game
    (Thomas, Nagmore Leather Boots) every div sits on its own line AND the
    <br/> after it adds an empty line, and the white is hard to tell from the
    card's beige text. This script draws four candidate layouts side by side
    for four real cards, in a browser page, so the style can be picked
    without starting the game:
      A. compact: no <br/> between the stat divs (a div is already its own
         line), one <br/> gap before the item text; type line beige.
      B. two columns like the inventory tooltip's stat rows
         (ItemTooltipStat2: label wrap 130 px, value after it), type muted.
      C. B plus the tooltip's 22 px stat icon in front of each row.
      D. Abyss gear in the tooltip's buff style: the effect line in the buff
         yellow, our siphon note in beige, "Also contains" in gray.
    Colours and sizes are the game's own (cdcommon_font.css, itemtooltip2.css,
    worldmapview.css). The page states which layouts reuse only structures
    already proven on the card (safe) and which rely on more (riskier).

    Item pictures come from research/analysis/item-icons/ (measure_item_icons.py)
    with their v0.103 size class; the three stat icons are cut from Thomas's
    inventory screenshot of Witch's Earring (the game draws the others from
    its texture atlas, which this script does not read).

Reads:  research/analysis/chest-item-stats.json, treasure-chest-contents.json,
        abyss-chest-cards.json, chest-item-icon-sizes.json, item-icons/*.png;
        the screenshot path in SCREENSHOT
Writes: research/mockups/chest-card-stat-styles.html (overwritten)
Run:    C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe -B research/scripts/build_stat_style_mockup.py
"""
import base64
import html
import io
import json
from pathlib import Path

from PIL import Image

ROOT = Path(__file__).resolve().parents[2]
ANALYSIS = ROOT / "research" / "analysis"
SCREENSHOT = Path("C:/Users/Thomas/.claude/uploads/27f7d1d1-fdcf-4865-8833-f345b61cd72c/9bef7546-image.png")
# Stat icon boxes in the screenshot (left, top, right, bottom).
SCREENSHOT_ICONS = {"dpv": (26, 151, 46, 171), "movespeed": (26, 176, 46, 196), "heart": (26, 233, 46, 253)}
SURFACE = ["Nagmore Leather Boots", "Red Needle"]
ABYSS = ["Spirit Transference", "Vitality I"]
SIPHON_NOTE = {"Spirit Siphon": "Restores some Spirit each time you hit an enemy."}
# Which stat icon a line would use (game class cpp-<status>); None = no icon reachable here.
LINE_ICONS = {"Defense": "dpv", "Movement Speed": "movespeed", "Health:": "heart"}


def data_uri(image, size=None):
    """Return a PNG data URI for a PIL image (optionally resized)."""
    if size:
        image = image.resize(size, Image.LANCZOS)
    buffer = io.BytesIO()
    image.save(buffer, "PNG")
    return "data:image/png;base64," + base64.b64encode(buffer.getvalue()).decode()


def load(name):
    """Read one analysis JSON file."""
    return json.loads((ANALYSIS / name).read_text(encoding="utf-8"))


def card_data():
    """Return the four cards: title, type, stat lines, text lines, picture URI and size class."""
    stats = load("chest-item-stats.json")
    contents = load("treasure-chest-contents.json")["categories"]["Chest"]
    abyss = load("abyss-chest-cards.json")["chests"]
    sizes = load("chest-item-icon-sizes.json")
    fills = {row["item"]: (row["icon"], row["fill"]) for row in sizes["items"] + sizes["abyssItems"]}
    cards = []
    for name in SURFACE + ABYSS:
        surface = name in SURFACE
        rows = contents if surface else abyss
        index = next(i for i, row in enumerate(rows) if row.get("english") == name)
        row = rows[index]
        lines = stats["surface" if surface else "abyss"][index]["lines"]
        text = [part.strip() for part in (row.get("description") or "").split("<br/>") if part.strip()]
        also = f"Also contains: {row['alsoContains']}" if row.get("alsoContains") else None
        icon, fill = fills[name]
        step = min((60, 70, 80, 90, 100), key=lambda candidate: abs(candidate / 100 - 0.6 / fill))
        picture = data_uri(Image.open(ANALYSIS / "item-icons" / f"{icon}.png").convert("RGBA"), (160, 160))
        cards.append({"title": name, "type": row.get("itemType") if surface else None, "lines": lines,
                      "text": text, "also": also, "picture": picture, "step": step, "abyss": not surface})
    return cards


def split_line(line):
    """Split "Attack 9" / "Critical Rate Lv 2" into (label, value) for the two-column layouts, or None."""
    if " Lv " in line:
        label, value = line.rsplit(" Lv ", 1)
        return label, f"Lv {value}"
    head, _, tail = line.rpartition(" ")
    if head and tail.replace(".", "").isdigit():
        return head, tail
    return None


def esc(text):
    """HTML-escape a text."""
    return html.escape(text, quote=True)


def body(card, variant, icons):
    """Return the description area's HTML for one card in one variant (mirrors the planned markup)."""
    parts = []
    white, beige, yellow, gray = ("f-white", "f-beige", "f-yellow", "f-gray")
    if card["type"]:
        parts.append(f'<div class="{beige if variant == "A" else gray}">{esc(card["type"])}</div>')
    for line in card["lines"]:
        note = next((text for start, text in SIPHON_NOTE.items() if line.startswith(start)), None)
        pair = split_line(line)
        if variant == "D" and card["abyss"]:
            parts.append(f'<div class="{yellow}">{esc(line)}</div>')
        elif variant in ("B", "C", "D") and pair:
            icon = ""
            if variant == "C":
                key = next((key for start, key in LINE_ICONS.items() if line.startswith(start)), None)
                icon = (f'<img class="stat-icon" src="{icons[key]}" alt="">' if key
                        else '<span class="stat-icon blank" title="icon from the game atlas"></span>')
            parts.append(f'<div class="stat-wrap2">{icon}<div class="label-wrap"><div class="{white}">'
                         f'{esc(pair[0])}</div></div><div class="{white} value">{esc(pair[1])}</div></div>')
        else:
            parts.append(f'<div class="{yellow if card["abyss"] and variant != "A" else white}">{esc(line)}</div>')
        if note:
            parts.append(f'<div class="{beige} note">{esc(note)}</div>')
    if card["lines"]:
        parts.append('<div class="gap"></div>')
    parts += [f'<div class="{beige}">{esc(text)}</div>' for text in card["text"]]
    if card["also"]:
        parts.append(f'<div class="{gray if variant == "D" else beige}">{esc(card["also"])}</div>')
    return "\n".join(parts)


def main():
    """Write the mock-up page."""
    shot = Image.open(SCREENSHOT).convert("RGBA")
    icons = {key: data_uri(shot.crop(box), (44, 44)) for key, box in SCREENSHOT_ICONS.items()}
    cards = card_data()
    variants = [
        ("A", "Compact", "safe", "Only &lt;div css=\"font-text-caption-minor-white\"&gt; lines (already shown on the "
         "card in v0.106) with the extra &lt;br/&gt; removed, plus one &lt;br/&gt; before the item text."),
        ("B", "Two columns", "riskier", "Nested divs with the inventory tooltip's ItemTooltipStat2 classes "
         "(item-tooltip-stat-wrap2, item-tooltip-sub-stat-label-wrap; label kept on one line as the game does). Needs ItemTooltip2.css "
         "on the map page (the map page uses ItemTooltip2 widgets, so probably loaded) and flex rows inside the "
         "description."),
        ("C", "Two columns + icons", "riskiest", "As B plus item-tooltip-stat-icon2 cpp-&lt;stat&gt; icons. "
         "Icons here: the Defense shield, Movement Speed boot and Health heart are cut from your "
         "Witch's Earring inventory tooltip screenshot; the others (blank squares) come from the game's "
         "texture atlas in game, which this page cannot read."),
        ("D", "Buff style (Abyss)", "safe", "Abyss effect line in the tooltip's buff yellow "
         "(font-text-caption-minor-yellow, #ffd292), siphon note beige, \"Also contains\" gray. Same one-div "
         "lines as A, no icons. Surface cards: as B."),
    ]
    head = "".join(f'<th><span class="tag {risk}">{risk}</span> {key}. {name}<p>{note}</p></th>'
                   for key, name, risk, note in variants)
    rows = []
    for card in cards:
        cells = []
        for key, *_ in variants:
            pic = card["step"]
            cells.append(f"""<td><div class="card">
  <div class="title">{esc(card['title'])}</div>
  <div class="frame"><div class="pic" style="background-image:url({card['picture']});background-size:{pic}% {pic}%"></div></div>
  <div class="desc">{body(card, key, icons)}</div>
</div></td>""")
        rows.append("<tr>" + "".join(cells) + "</tr>")
    page = f"""<!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">
<title>Chest Card Stat Styles</title>
<style>
:root{{--bg:#1d1b1a;--text:#e3d6c6;--muted:#a59886;--gold:#ffd292}}
body{{margin:0;background:var(--bg);color:var(--text);font-family:Georgia,"Times New Roman",serif}}
header{{padding:16px;max-width:1800px;margin:0 auto}}
h1{{font-size:20px;margin:0 0 6px;color:var(--gold)}}
header p{{margin:4px 0;font-family:system-ui,sans-serif;font-size:13px;color:var(--muted);max-width:900px}}
.scroll{{overflow-x:auto;padding:0 16px 32px}}
table{{border-collapse:separate;border-spacing:14px 10px;margin:0 auto}}
th{{vertical-align:top;text-align:left;font-family:system-ui,sans-serif;font-size:13px;color:var(--gold);width:330px}}
th p{{font-weight:normal;color:var(--muted);font-size:12px;margin:6px 0 0}}
.tag{{display:inline-block;padding:1px 6px;border-radius:3px;font-size:11px;color:#111}}
.tag.safe{{background:#31ba7e}}.tag.riskier{{background:#e0b25a}}.tag.riskiest{{background:#d14d45}}
td{{vertical-align:top}}
/* Card: worldmapview.css #KnowledgeInfoTooltipBg #34312f, title #KnowledgeInfoTitle #ffd292 */
.card{{width:330px;background:#34312f;border:1px solid #3d3733}}
.title{{padding:12px;text-align:center;color:#ffd292;font-size:22px;background:repeating-linear-gradient(135deg,#2b2725 0 4px,#312c2a 4px 8px);border-bottom:1px solid #4a423c}}
.frame{{position:relative;width:220px;height:220px;margin:12px auto;border-radius:50%;background:radial-gradient(circle,#0e0d0c 0 55%,#1d1a19 72%,transparent 73%)}}
.pic{{position:absolute;left:7%;top:7%;width:86%;height:86%;border-radius:50%;background-repeat:no-repeat;background-position:center}}
.desc{{margin:0 10px 14px;padding:8px 10px;background:#3a3532;line-height:21px}}
/* cdcommon_font.css: all 15px, shadow 2px 2px 1px #181818 */
.desc div{{font-size:15px;text-shadow:2px 2px 1px #181818}}
.f-white{{color:#f6f0f0}}.f-beige{{color:#e0c9b1}}.f-yellow{{color:#ffd292}}.f-gray{{color:#acacac}}
.gap{{height:21px}}
.note{{margin-bottom:2px}}
/* itemtooltip2.css ItemTooltipStat2 */
.stat-wrap2{{display:flex;align-items:center}}
.label-wrap{{width:150px;margin-left:3px;margin-right:5px;white-space:nowrap}}
.stat-icon{{width:22px;height:22px;display:block}}
.stat-icon.blank{{background:#f6f0f0;opacity:.15}}
/* itemtooltip2.css ItemTooltipBuffStatSet */
.buff-set{{display:flex;align-items:center;margin-bottom:3px}}
.buff-icon{{width:22px;height:22px;margin-right:4px;display:block}}
.buff-icon.blank{{width:0;margin:0}}
</style></head><body>
<header><h1>Chest card stat lines: four layouts</h1>
<p>Real data (research/analysis/chest-item-stats.json) and the game's own colours and sizes. In game the card is drawn larger
(UI scale); proportions match. v0.106 showed every stat line followed by an empty line (a div is already a line, and the
&lt;br/&gt; after it added another). "safe" = only structures already shown on the card; "riskier"/"riskiest" = structures
the game uses in its inventory tooltip but that we have not tried inside the card description.</p></header>
<div class="scroll"><table><tr>{head}</tr>
{''.join(rows)}
</table></div></body></html>
"""
    output = ROOT / "research" / "mockups" / "chest-card-stat-styles.html"
    output.write_text(page, encoding="utf-8")
    print(f"Wrote {output} ({len(page) // 1024} KB)")


if __name__ == "__main__":
    main()
