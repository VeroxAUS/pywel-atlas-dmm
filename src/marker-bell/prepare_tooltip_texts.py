"""Embed the chest contents (and Sealed Artifact challenges) for the map tooltips.

What it does:
    Converts the "Chest" rows of research/analysis/treasure-chest-contents.json
    (made by research/scripts/find_chest_contents.py) into a C++ header. The
    header holds one entry per chest, in the same order as
    data/treasure-chest-links.json (marker keys come from row numbers): the
    English name of the main item inside, followed by its type in brackets
    for equipment ("Witch's Earring (Earring)"), or nullptr when the
    research script could not name it. v0.91 adds tables for the map
    knowledge card: kChestItemNames (the title); v0.92: kChestCardParagraph1
    and kChestCardParagraph2 (the two description paragraphs: item type and
    item description, see card_paragraphs). v0.93 adds the Sealed Abyss
    Artifact card tables (kArtifactCard*, see artifact_card_lines) from
    data/sealed-artifact-links.json. v0.98 adds the description markup
    tables kChestCardMarkup and kArtifactCardMarkup (lines joined with
    "<br/>", see card_markup). v0.100 adds kChestIconRow and kChestIconName
    (the item's inventory icon, from research/analysis/chest-item-icons.json,
    see chest_icon_lines). v0.103 adds kChestIconStep and
    kAbyssChestIconStep (the icon's size class, see icon_step_lines). v0.106
    puts the item's base stat lines (research/analysis/chest-item-stats.json,
    research/scripts/find_item_stats.py) into the chest card markup. v0.109
    writes one markup table per card style (kCardStatStyle in the mod, see
    style_markup): 0 plain lines, 1 compact (white stat lines, yellow
    effect lines), 2 two columns like the inventory tooltip's stat rows,
    3 the same with the inventory's stat icons (Thomas's choice). v0.112 adds
    the unique gear card tables (kUniqueGear*, see unique_gear_lines) and
    the Defense Efficiency icon (STAT_ICON_OVERRIDES). The header stays plain ASCII: every
    non-ASCII byte is written as an \\xNN escape. The script stops with an
    error if the rows do not match the chest list, a label or title is longer
    than 100 bytes, or a card paragraph is longer than 3000 bytes.

    Not run by build.ps1 yet: run it by hand after the contents JSON changes.

Reads:  research/analysis/treasure-chest-contents.json, data/treasure-chest-links.json,
        data/sealed-artifact-links.json and research/analysis/chest-item-stats.json
Writes: src/marker-bell/tooltip-texts.h (overwritten)
Run:    python -B src/marker-bell/prepare_tooltip_texts.py
"""
import json
from pathlib import Path

# Longest item text accepted, in UTF-8 bytes (the tooltip buffer is 160).
MAX_TEXT_BYTES = 100
# Longest knowledge card description accepted, in UTF-8 bytes (the mod
# passes the text by pointer, no copy; v0.109 nested stat rows need room).
MAX_DESCRIPTION_BYTES = 3000
# v0.106: font classes for the stat lines in the card description, the ones
# the game's inventory item tooltip and knowledge card use (itemtooltip2,
# worldmapview #KnowledgeInfoDiscriptionText).
STAT_LINE_CSS = "font-text-caption-minor-white"
NOTE_LINE_CSS = "font-text-caption-minor-beige"
# v0.109: the inventory tooltip's buff yellow and its muted gray
# (cdcommon_font.css, 15 px like the card text).
EFFECT_LINE_CSS = "font-text-caption-minor-yellow"
MUTED_LINE_CSS = "font-text-caption-minor-gray"
# v0.109: stats with an icon class in the inventory tooltip
# (itemtooltip2.css ".item-tooltip-stat-icon2.cpp-<stat>"); any other stat
# gets no icon element.
STAT_ICON_CLASSES = {
    "hp", "stamina", "mp", "ddd", "dpv", "dhit", "ddv", "criticaldamage", "criticalrate", "attackeddamagerate",
    "attackeddamagereduction", "attackspeedrate", "movespeedrate", "climbspeedrate", "swimspeedrate",
    "equipdroprate", "movespeedlevel", "acclevel", "rotationlevel", "jumplevel",
}
# v0.112: stats the inventory has no icon class for, drawn with a related
# game icon through the UI add-on (v0.81): Defense Efficiency gets the guard
# icon the game uses for its guard effects (cd_icon_ability_GUARDCRASH;
# Thomas's choice, 2026-10-24).
STAT_ICON_OVERRIDES = {"guardpvrate": "pywel-stat-guardpvrate"}
# v0.109: the card styles, in kCardStatStyle order (table name suffix).
# "IconsNoBuff" is style 3 without the effect lines' buff icons (the mod's
# kCardBuffIconsOn off; those icons need the UI add-on v0.80).
CARD_STYLES = ("Plain", "Compact", "Columns", "Icons", "IconsNoBuff")
# v0.109: the class of an effect line's buff icon (UI add-on v0.80 rules:
# ".item-tooltip-buff-stat-icon.pywel-buff-<name> { background-image:
# textureid(<texture>); }"), from the icon texture its template names.
BUFF_ICON_PREFIX = "cd_icon_ability_"


def buff_icon_class(texture):
    """Return "pywel-buff-<name>" for a buff icon texture (cd_icon_ability_FIRE -> pywel-buff-fire)."""
    if not texture.startswith(BUFF_ICON_PREFIX):
        raise ValueError(f"Unexpected buff icon texture {texture!r}")
    return "pywel-buff-" + texture[len(BUFF_ICON_PREFIX):].lower().replace("_", "-")
# v0.106: OUR wording, not the game's (approved by Thomas 2026-10-24): one
# explanation line after each siphon effect line, which the game names only
# ("Spirit Siphon Lv 1"). Keyed by the start of the game's line.
SIPHON_EXPLANATIONS = {
    "Health Siphon": "Restores some Health each time you hit an enemy.",
    "Spirit Siphon": "Restores some Spirit each time you hit an enemy.",
    "Stamina Siphon": "Restores some Stamina each time you hit an enemy.",
}
# Joins lines inside one card paragraph. The card's paragraph element shows
# no line breaks ("\n" became a space; the CSS route crashed or did nothing,
# v0.93/v0.94-test), so lines are separated by a middle dot (v0.94).
LINE_JOIN = " \u00b7 "
# Card picture sizes (v0.103, the user's choice from the mock-up): each icon is
# shrunk so its visible part covers about TARGET_FILL of the picture, in
# ICON_STEPS percent classes (the UI add-on's .pywel-icon-NN rules). 100 means
# "as the game draws it": an icon is never enlarged.
TARGET_FILL = 0.6
ICON_STEPS = (60, 70, 80, 90, 100)


def c_string(text):
    """Return `text` as a C string literal with only printable ASCII inside."""
    parts = []
    after_escape = False
    for byte in text.encode("utf-8"):
        character = chr(byte)
        if byte < 0x20 or byte > 0x7e or character in '"\\':
            parts.append("\\x%02x" % byte)
            after_escape = True
            continue
        # A hex escape swallows every following hex digit, so close the
        # string and open a new one ("" "") before a plain character.
        if after_escape:
            parts.append('" "')
        parts.append(character)
        after_escape = False
    return '"' + "".join(parts) + '"'


def main():
    """Check the contents rows against the chest list and write the header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    root = directory.parents[1]
    links = json.loads((root / "data" / "treasure-chest-links.json").read_text(encoding="utf-8"))["locations"]
    contents = json.loads((root / "research" / "analysis" / "treasure-chest-contents.json")
                          .read_text(encoding="utf-8"))["categories"]["Chest"]
    if len(contents) != len(links):
        raise ValueError(f"{len(contents)} contents rows for {len(links)} chests")

    for link, record in zip(links, contents):
        if record["name"] != link["name"] or record["uuid"] != link["uuid"]:
            raise ValueError(f"Contents row {record['name']!r} does not match chest {link['name']!r}")

    stats = item_stats(root, "surface", [record["name"] for record in contents])

    # Tables in chest order; None becomes nullptr.
    labels = []
    titles = []
    paragraphs = []
    markups = []
    styled = {style: [] for style in CARD_STYLES}
    for record, stat_parts in zip(contents, stats):
        named = record.get("status") == "named"
        name = record.get("english") if named else None
        item_type = record.get("itemType") if named else None
        description = record.get("description") if named else None
        # Map label line: "Witch's Earring (Earring)".
        labels.append(f"{name} ({item_type})" if name and item_type else name)
        # Knowledge card title: the item name alone.
        titles.append(name)
        paragraphs.append(card_paragraphs(item_type, description) if name else (None, None))
        # Knowledge card description markup (v0.98): type, then (v0.106) the
        # stat lines, then the item's own lines; one table per style (v0.109).
        body = description_lines(description)
        for index, style in enumerate(CARD_STYLES):
            styled[style].append(style_markup(index, item_type, stat_parts, body, None)
                                 if name and (item_type or body) else None)

    lines = [
        "// Generated from research/analysis/treasure-chest-contents.json by",
        "// prepare_tooltip_texts.py - do not edit by hand. All tables follow",
        "// kChestLinks (same order); nullptr = not known.",
        "#pragma once",
    ]
    lines += table_lines("kChestContents", "map label: item name (type)", labels, links, MAX_TEXT_BYTES)
    lines += table_lines("kChestItemNames", "knowledge card title: item name", titles, links, MAX_TEXT_BYTES)
    lines += table_lines("kChestCardParagraph1", "knowledge card, first description paragraph (item type)",
                         [first for first, _ in paragraphs], links, MAX_DESCRIPTION_BYTES)
    lines += table_lines("kChestCardParagraph2", "knowledge card, second description paragraph (item text)",
                         [second for _, second in paragraphs], links, MAX_DESCRIPTION_BYTES)
    for index, style in enumerate(CARD_STYLES):
        lines += table_lines(f"kChestCardMarkup{style}", f"knowledge card description markup, card style {index}",
                             styled[style], links, MAX_DESCRIPTION_BYTES)
    lines += chest_icon_lines(root, links)
    lines += abyss_chest_lines(root)
    lines += icon_step_lines(root, links)
    lines += unique_gear_lines(root)
    lines += artifact_card_lines(root)

    # The comments carry chest names; keep them ASCII too.
    header = "\n".join(lines) + "\n"
    header.encode("ascii")
    (directory / "tooltip-texts.h").write_text(header, encoding="ascii")
    texts = [text for pair in paragraphs for text in pair if text]
    print(f"Wrote tooltip-texts.h: {sum(1 for text in labels if text)} of {len(links)} chests named, "
          f"{sum(1 for first, _ in paragraphs if first is not None)} card paragraph pairs "
          f"(longest paragraph {max(len(text.encode('utf-8')) for text in texts)} bytes)")


def artifact_card_lines(root):
    """Return the knowledge card tables for the Sealed Abyss Artifacts (v0.93).

    Same order as data/sealed-artifact-links.json (and artifact-links.h):
    title = the challenge name, paragraph 1 = the challenge (a multi-step
    challenge lists its steps joined with LINE_JOIN), paragraph 2 =
    "Reward: <rewards>" or "" when the data has no reward ("" hides the
    card's generic paragraph).
    """
    artifacts = json.loads((root / "data" / "sealed-artifact-links.json").read_text(encoding="utf-8"))["locations"]
    titles = [artifact.get("challengeName") or None for artifact in artifacts]
    first = []
    for artifact in artifacts:
        steps = artifact.get("challengeSteps") or []
        if len(steps) > 1:
            first.append(LINE_JOIN.join(steps))
        else:
            first.append(artifact.get("challengeText") or None)
    second = ["Reward: " + ", ".join(artifact["challengeReward"]) if artifact.get("challengeReward") else ""
              for artifact in artifacts]
    lines = table_lines("kArtifactCardTitles", "Sealed Abyss Artifact card title: challenge name",
                        titles, artifacts, MAX_TEXT_BYTES)
    lines += table_lines("kArtifactCardParagraph1", "Sealed Abyss Artifact card, first paragraph: challenge",
                         first, artifacts, MAX_DESCRIPTION_BYTES)
    lines += table_lines("kArtifactCardParagraph2", "Sealed Abyss Artifact card, second paragraph: reward",
                         second, artifacts, MAX_DESCRIPTION_BYTES)
    # Description markup (v0.98): each step on its own line, then the reward.
    markups = []
    for artifact in artifacts:
        steps = artifact.get("challengeSteps") or ([artifact["challengeText"]] if artifact.get("challengeText") else [])
        reward = ["Reward: " + ", ".join(artifact["challengeReward"])] if artifact.get("challengeReward") else []
        markups.append(card_markup(steps + reward) if steps or reward else None)
    lines += table_lines("kArtifactCardMarkup", "Sealed Abyss Artifact card description markup (steps, reward)",
                         markups, artifacts, MAX_DESCRIPTION_BYTES)
    print(f"Artifact cards: {sum(1 for title in titles if title)} of {len(artifacts)} titled, "
          f"{sum(1 for text in second if text)} with a reward")
    return lines


def abyss_chest_lines(root):
    """Return the Abyss chest label and knowledge card tables (v0.102).

    From research/analysis/abyss-chest-cards.json (find_abyss_chest_cards.py),
    in data/abyss-chest-links.json order. Abyss items have no equip type, so
    there is no type line. Label line 2: the item name. Card: title = item
    name; markup = the description lines, then "Also contains: <item>" when
    the chest also gives one; fallback paragraphs = the description's first
    part and the rest (same rule as card_paragraphs, with the also-contains
    line last); icon = the item's inventory icon.
    """
    links = json.loads((root / "data" / "abyss-chest-links.json").read_text(encoding="utf-8"))["locations"]
    cards = json.loads((root / "research" / "analysis" / "abyss-chest-cards.json")
                       .read_text(encoding="utf-8"))["chests"]
    if [card["name"] for card in cards] != [link["name"] for link in links]:
        raise ValueError("abyss-chest-cards.json does not follow data/abyss-chest-links.json; rerun it")
    stats = item_stats(root, "abyss", [card["name"] for card in cards])
    labels, titles, first, second, icons = [], [], [], [], []
    styled = {style: [] for style in CARD_STYLES}
    for card, stat_parts in zip(cards, stats):
        name = card.get("english") if card.get("status") == "card" else None
        parts = description_lines(card.get("description"))
        also = [f"Also contains: {card['alsoContains']}"] if card.get("alsoContains") else []
        labels.append(name)
        titles.append(name)
        body = parts + also
        first.append(body[0] if name and body else None)
        second.append(LINE_JOIN.join(body[1:]) if name and body else None)
        # v0.106: the gear's effect first (what it does), then its text;
        # v0.109: one table per style, "Also contains" muted from style 1 on.
        for index, style in enumerate(CARD_STYLES):
            styled[style].append(style_markup(index, None, stat_parts, parts, also[0] if also else None)
                                 if name and body else None)
        icons.append(card.get("iconName") if name else None)
    lines = table_lines("kAbyssChestContents", "Abyss chest map label line 2: item name", labels, links, MAX_TEXT_BYTES)
    lines += table_lines("kAbyssChestItemNames", "Abyss chest card title: item name", titles, links, MAX_TEXT_BYTES)
    lines += table_lines("kAbyssChestCardParagraph1", "Abyss chest card, first paragraph (fallback)",
                         first, links, MAX_DESCRIPTION_BYTES)
    lines += table_lines("kAbyssChestCardParagraph2", "Abyss chest card, second paragraph (fallback)",
                         second, links, MAX_DESCRIPTION_BYTES)
    for index, style in enumerate(CARD_STYLES):
        lines += table_lines(f"kAbyssChestCardMarkup{style}", f"Abyss chest card description markup, card style {index}",
                             styled[style], links, MAX_DESCRIPTION_BYTES)
    lines += table_lines("kAbyssChestIconName", "Abyss chest item's inventory icon texture name",
                         icons, links, MAX_TEXT_BYTES)
    print(f"Abyss chest cards: {sum(1 for title in titles if title)} of {len(links)} titled, "
          f"{sum(1 for icon in icons if icon)} with an icon")
    return lines


def chest_icon_lines(root, links):
    """Return the chest item icon tables (v0.100) from research/analysis/chest-item-icons.json.

    kChestIconRow[i]: the stringinfo row number of the item's inventory icon
    (0xffff = none); the card's picture lookup 0x388e00 takes that number.
    kChestIconName[i]: the icon's texture name, which the mod compares with
    the row the game returns before using it (nullptr = none).
    """
    icons = json.loads((root / "research" / "analysis" / "chest-item-icons.json")
                       .read_text(encoding="utf-8"))["chests"]
    if len(icons) != len(links) or any(icon["name"] != link["name"] for icon, link in zip(icons, links)):
        raise ValueError("chest-item-icons.json does not follow the chest list; rerun find_item_icons.py")
    rows = []
    names = []
    for icon in icons:
        usable = icon["status"] == "icon"
        if usable and not 0 <= icon["stringinfoRow"] < 0xffff:
            raise ValueError(f"Unsupported stringinfo row for {icon['name']!r}")
        rows.append(icon["stringinfoRow"] if usable else 0xffff)
        names.append(icon["iconName"] if usable else None)
    lines = ["// kChestIconRow[i]: stringinfo row of the item's inventory icon (0xffff = none).",
             "constexpr uint16_t kChestIconRow[] = {"]
    for link, row in zip(links, rows):
        label = link["name"].encode("ascii", "replace").decode()
        lines.append(f"    {row}, // {label}")
    lines.append("};")
    lines += table_lines("kChestIconName", "the icon's texture name, checked against the game's row",
                         names, links, MAX_TEXT_BYTES)
    print(f"Chest item icons: {sum(1 for name in names if name)} of {len(links)}")
    return lines


def icon_step(fill):
    """Return the size class (60..90, or 0 = unchanged) for an icon covering `fill` of its canvas."""
    step = min(ICON_STEPS, key=lambda candidate: abs(candidate / 100 - TARGET_FILL / fill))
    return 0 if step == 100 else step


def unique_gear_lines(root):
    """Return the unique gear knowledge card tables (v0.112).

    From research/analysis/unique-gear-cards.json (find_unique_gear_cards.py),
    in data/unique-gear-links.json order (unique-gear-links.h, marker keys).
    Same card as the surface chests: title = item name; markup = the type
    line, the stat lines, the item's own text (one table per card style);
    fallback paragraphs as card_paragraphs; the item's inventory icon and its
    size class.
    """
    links = json.loads((root / "data" / "unique-gear-links.json").read_text(encoding="utf-8"))["items"]
    cards = json.loads((root / "research" / "analysis" / "unique-gear-cards.json")
                       .read_text(encoding="utf-8"))["items"]
    if [card["name"] for card in cards] != [link["name"] for link in links]:
        raise ValueError("unique-gear-cards.json does not follow data/unique-gear-links.json; rerun it")
    stats = item_stats(root, "unique", [card["name"] for card in cards])
    sizes = json.loads((root / "research" / "analysis" / "chest-item-icon-sizes.json").read_text(encoding="utf-8"))
    fills = {row["icon"]: row["fill"] for row in sizes["uniqueItems"] if "fill" in row}
    titles, first, second, icons, steps = [], [], [], [], []
    styled = {style: [] for style in CARD_STYLES}
    for card, stat_parts in zip(cards, stats):
        name = card.get("english") if card.get("status") == "card" else None
        item_type = card.get("itemType") if name else None
        body = description_lines(card.get("description")) if name else []
        titles.append(name)
        paragraph1, paragraph2 = card_paragraphs(item_type, card.get("description")) if name else (None, None)
        first.append(paragraph1)
        second.append(paragraph2)
        for index, style in enumerate(CARD_STYLES):
            styled[style].append(style_markup(index, item_type, stat_parts, body, None)
                                 if name and (item_type or body) else None)
        icon = card.get("iconName") if name else None
        icons.append(icon)
        steps.append(icon_step(fills[icon.lower()]) if icon and icon.lower() in fills else 0)
    lines = table_lines("kUniqueGearItemNames", "unique gear card title: item name", titles, links, MAX_TEXT_BYTES)
    lines += table_lines("kUniqueGearCardParagraph1", "unique gear card, first paragraph (fallback)",
                         first, links, MAX_DESCRIPTION_BYTES)
    lines += table_lines("kUniqueGearCardParagraph2", "unique gear card, second paragraph (fallback)",
                         second, links, MAX_DESCRIPTION_BYTES)
    for index, style in enumerate(CARD_STYLES):
        lines += table_lines(f"kUniqueGearCardMarkup{style}", f"unique gear card description markup, card style {index}",
                             styled[style], links, MAX_DESCRIPTION_BYTES)
    lines += table_lines("kUniqueGearIconName", "unique gear item's inventory icon texture name",
                         icons, links, MAX_TEXT_BYTES)
    lines += ["// kUniqueGearIconStep[i]: card picture size class in percent (0 = as the game draws it).",
              "constexpr uint8_t kUniqueGearIconStep[] = {"]
    for link, step in zip(links, steps):
        lines.append(f"    {step}, // {link['name'].encode('ascii', 'replace').decode()}")
    lines.append("};")
    print(f"Unique gear cards: {sum(1 for title in titles if title)} of {len(links)} titled, "
          f"{sum(1 for icon in icons if icon)} with an icon, "
          f"{sum(1 for parts in stats if parts)} with stat lines; "
          f"kUniqueGearIconStep: {dict((step, steps.count(step)) for step in sorted(set(steps)))}")
    return lines


def icon_step_lines(root, links):
    """Return kChestIconStep and kAbyssChestIconStep from research/analysis/chest-item-icon-sizes.json.

    One byte per chest, in table order: the percent class the mod adds to the
    card picture ("pywel-icon-NN"), or 0 for none (no icon, an unmeasured
    icon, or one that would need enlarging).
    """
    sizes = json.loads((root / "research" / "analysis" / "chest-item-icon-sizes.json").read_text(encoding="utf-8"))
    abyss_links = json.loads((root / "data" / "abyss-chest-links.json").read_text(encoding="utf-8"))["locations"]
    surface_icons = json.loads((root / "research" / "analysis" / "chest-item-icons.json")
                               .read_text(encoding="utf-8"))["chests"]
    abyss_cards = json.loads((root / "research" / "analysis" / "abyss-chest-cards.json")
                             .read_text(encoding="utf-8"))["chests"]
    fills = {row["icon"]: row["fill"] for row in sizes["items"] + sizes["abyssItems"] if "fill" in row}
    lines = []
    for table, names, table_links in (
            ("kChestIconStep", [icon.get("iconName") if icon["status"] == "icon" else None
                                for icon in surface_icons], links),
            ("kAbyssChestIconStep", [card.get("iconName") if card.get("status") == "card" else None
                                     for card in abyss_cards], abyss_links)):
        steps = [icon_step(fills[name.lower()]) if name and name.lower() in fills else 0 for name in names]
        lines += [f"// {table}[i]: card picture size class in percent (0 = as the game draws it).",
                  f"constexpr uint8_t {table}[] = {{"]
        for link, step in zip(table_links, steps):
            label = link["name"].encode("ascii", "replace").decode()
            lines.append(f"    {step}, // {label}")
        lines.append("};")
        print(f"{table}: {dict((step, steps.count(step)) for step in sorted(set(steps)))}")
    return lines


def item_stats(root, kind, chest_names):
    """Return the stat lines per chest (v0.106) from research/analysis/chest-item-stats.json.

    `kind` is "surface" or "abyss"; the rows must follow `chest_names`.
    Items find_item_stats.py could not fully resolve keep only their
    resolved lines (an empty list when none).
    """
    rows = json.loads((root / "research" / "analysis" / "chest-item-stats.json").read_text(encoding="utf-8"))[kind]
    if [row["chest"] for row in rows] != chest_names:
        raise ValueError(f"chest-item-stats.json ({kind}) does not follow the chest list; rerun find_item_stats.py")
    return [row.get("parts", []) for row in rows]


def markup_text(text):
    """Return `text` unchanged after checking it holds no markup characters."""
    if any(character in text for character in "<>&"):
        raise ValueError(f"Markup character in card text: {text!r}")
    return text


def div(css, inner):
    """Return one <div css="..."> element around already-checked `inner` markup."""
    return f'<div css="{css}">{inner}</div>'


def style_markup(style, item_type, parts, body, also):
    """Return the card description markup for one chest in card style 0..3 (v0.109).

    parts: the item's stat parts (find_item_stats.py), body: the item's own
    text lines, also: the "Also contains" line or None.
      0 plain: every line a text line, joined with <br/> (the v0.98 form).
      1 compact: type beige, each stat a white div, each effect a yellow div,
        no <br/> between divs (a div is already its own line), one <br/>
        before the item text, "Also contains" gray.
      2 columns: the inventory's ItemTooltipStat2 row (name in a 130 px
        label wrap, value after it); effects in its ItemTooltipBuffStatSet
        form (yellow value that may wrap); type gray.
      3 icons: as 2 with the inventory's stat icon (item-tooltip-stat-icon2
        cpp-<stat>) in front of each stat row that has one, and each effect
        line's own buff icon (item-tooltip-buff-stat-icon pywel-buff-<name>,
        UI add-on v0.80) in front of the effect.
      4 as 3 but effects only get a stat icon where one exists (no add-on
        classes).
    After each siphon effect comes our explanation (SIPHON_EXPLANATIONS) in
    the beige description font, from style 1 on as its own div.
    """
    def notes(text):
        return [note for start, note in SIPHON_EXPLANATIONS.items() if text.startswith(start)]

    def icon(status):
        if style >= 3 and status in STAT_ICON_OVERRIDES:
            return div(f"item-tooltip-stat-icon2 {STAT_ICON_OVERRIDES[status]}", "")
        if style >= 3 and status in STAT_ICON_CLASSES:
            return div(f"item-tooltip-stat-icon2 cpp-{status}", "")
        return ""

    def effect_icon(part):
        if style == 3 and part.get("icon"):
            return div(f"item-tooltip-buff-stat-icon {buff_icon_class(part['icon'])}", "")
        return icon(part["status"])

    if style == 0:
        lines = [item_type] if item_type else []
        for part in parts:
            text = f"{part['label']} {part['value']}" if part["kind"] == "stat" else part["text"]
            lines += [text] + notes(text)
        return card_markup(lines + body + ([also] if also else []))

    markup = ""
    if item_type:
        markup += div(NOTE_LINE_CSS if style == 1 else MUTED_LINE_CSS, markup_text(item_type))
    for part in parts:
        if part["kind"] == "stat":
            label, value = markup_text(part["label"]), markup_text(part["value"])
            if style == 1:
                markup += div(STAT_LINE_CSS, f"{label} {value}")
            else:
                markup += div("item-tooltip-stat-wrap2", icon(part["status"])
                              + div("item-tooltip-sub-stat-label-wrap item-tooltip-sub-stat2",
                                    div(f"item-tooltip-sub-stat-label {STAT_LINE_CSS}", label))
                              + div("item-tooltip-stat-info-wrap", div(f"stat-common-value {STAT_LINE_CSS}", value)))
            continue
        text = markup_text(part["text"])
        if style == 1:
            markup += div(EFFECT_LINE_CSS, text)
        else:
            markup += div("item-tooltip-buff-stat-set", effect_icon(part)
                          + div(f"item-tooltip-buff-stat-value multi-line-text-buff {EFFECT_LINE_CSS}", text))
        for note in notes(text):
            markup += div(NOTE_LINE_CSS, markup_text(note))
    if parts and body:
        markup += "<br/>"
    markup += "<br/>".join(markup_text(line) for line in body)
    if also:
        markup += div(MUTED_LINE_CSS, markup_text(also))
    return markup


def description_lines(description):
    """Return the lines of a game item description (split at its own "<br/>")."""
    return [part.strip() for part in (description or "").split("<br/>") if part.strip()]


def card_markup(lines_of_text):
    """Return knowledge card description markup: the lines joined with "<br/>".

    The card's description is markup (v0.96 log): "<br/>" makes a new line,
    any other tag or entity would be read as markup too. Our texts contain
    none of "<", ">" or "&" (checked); the script stops if one appears rather
    than guessing how the game's parser treats it.
    """
    for line in lines_of_text:
        if any(character in line for character in "<>&"):
            raise ValueError(f"Markup character in card text: {line!r}")
    return "<br/>".join(lines_of_text)


def card_paragraphs(item_type, description):
    """Return the two description paragraphs of a chest's knowledge card.

    The Treasure Chest card the mod reuses writes its description as two
    separate text elements, one per paragraph (v0.91 log), and those elements
    show text as written, with no markup. So: paragraph 1 = the item type,
    paragraph 2 = the item's description. Recipes, maps and keys have no type:
    their description's first part fills paragraph 1 instead. The game's own
    "<br/>" breaks inside item texts are joined with LINE_JOIN. An empty
    paragraph 2 hides the card's generic chest paragraph.
    """
    parts = [part.strip() for part in (description or "").split("<br/>") if part.strip()]
    if item_type:
        return item_type, LINE_JOIN.join(parts)
    if not parts:
        return None, None
    return parts[0], LINE_JOIN.join(parts[1:])


def table_lines(name, purpose, texts, links, limit):
    """Return the C++ lines of one `const char*` table, checking each text's length."""
    lines = [f"// {name}[i]: {purpose}.", f"constexpr const char* {name}[] = {{"]
    for link, text in zip(links, texts):
        # The row name only goes into a comment; keep it ASCII ("?" for others).
        label = link["name"].encode("ascii", "replace").decode()
        if text is None:
            lines.append(f"    nullptr, // {label}")
            continue
        # Only a second card paragraph may be empty (it hides the game's text).
        if (not text and not name.endswith("Paragraph2")) or len(text.encode("utf-8")) > limit:
            raise ValueError(f"Unsupported {name} text for {link['name']!r}: {text!r}")
        lines.append(f"    {c_string(text)}, // {label}")
    lines.append("};")
    return lines


if __name__ == "__main__":
    main()
