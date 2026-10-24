"""Measure how much of its picture each chest item's icon fills, for the card mock-up.

What it does:
    The map knowledge card of a chest shows the item's inventory icon
    (v0.100+; Abyss chests v0.102+, measured too since v0.103). Icons differ in how much of their square canvas the item
    covers (gloves fill nearly all of it, an earring much less), so on the
    card some look much bigger than others. This script:
      1. reads each icon named in research/analysis/chest-item-icons.json
         (ui/texture/icon/<name>.dds) from the game packs, read-only;
      2. converts it to PNG (research/analysis/item-icons/<name>.png);
      3. measures the box around its visible pixels (alpha above
         ALPHA_THRESHOLD): its size as a fraction of the canvas width and
         height, and how far its centre sits from the canvas centre;
      4. also writes the pictures the mock-up needs as a background: the
         card's usual Treasure Chest picture and the card's round ink mask.

Key terms:
    DDS - the game's texture file format (here compressed DXT5 with alpha).
    alpha - per-pixel transparency; 0 = fully transparent.

Reads:  the installed game's interface packs (group 0012) through pycrimson;
        research/analysis/chest-item-icons.json, abyss-chest-cards.json and
        (v0.112) unique-gear-cards.json
Writes: research/analysis/item-icons/*.png (overwritten);
        research/analysis/chest-item-icon-sizes.json (overwritten)
Run:    an interpreter with Pillow, using the research venv's packages, e.g.
        C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe -B research/scripts/measure_item_icons.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import io
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
# pycrimson and its packages (lz4, bier, ...) come from the research venv;
# Pillow from the interpreter running this script.
sys.path[:0] = [str(ROOT / "research" / "vendor" / "pycrimson" / "src"),
                str(ROOT / "research" / "vendor" / ".venv" / "Lib" / "site-packages")]

from PIL import Image  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
OUTPUT = ROOT / "research" / "analysis" / "item-icons"
ALPHA_THRESHOLD = 16
# Extra pictures for the mock-up background: output name -> pack path.
BACKGROUNDS = {
    "_card_treasurebox": "ui/texture/image/knowledgeimage/cd_knowledgeimage_knowledge_gimmick_treasurebox.dds",
    "_card_mask": "ui/texture/cd_ink_tooltip_mask.dds",
}


def to_png(context, pack_path, name):
    """Read one DDS from the packs, save it as PNG and return the RGBA image."""
    image = Image.open(io.BytesIO(context.get_file(pack_path))).convert("RGBA")
    image.save(OUTPUT / f"{name}.png")
    return image


def measure(image):
    """Return the visible-pixel box of an RGBA image as fractions of its size."""
    width, height = image.size
    alpha = image.getchannel("A").point(lambda value: 255 if value > ALPHA_THRESHOLD else 0)
    box = alpha.getbbox()
    if box is None:
        return {"canvas": [width, height], "empty": True}
    left, top, right, bottom = box
    return {
        "canvas": [width, height],
        "box": [left, top, right, bottom],
        "fillWidth": round((right - left) / width, 4),
        "fillHeight": round((bottom - top) / height, 4),
        "fill": round(max(right - left, bottom - top) / max(width, height), 4),
        "centreOffset": [round(((left + right) / 2 - width / 2) / width, 4),
                         round(((top + bottom) / 2 - height / 2) / height, 4)],
    }


def main():
    """Convert and measure every chest item icon and write the JSON report."""
    OUTPUT.mkdir(parents=True, exist_ok=True)
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    icons = json.loads((ROOT / "research" / "analysis" / "chest-item-icons.json")
                       .read_text(encoding="utf-8"))["chests"]
    contents = {chest["name"]: chest for chest in json.loads(
        (ROOT / "research" / "analysis" / "treasure-chest-contents.json").read_text(encoding="utf-8"))
        ["categories"]["Chest"]}

    measured = {}
    rows = []
    for icon in icons:
        if icon.get("status") != "icon":
            continue
        name = icon["iconName"].lower()
        if name not in measured:
            measured[name] = measure(to_png(context, icon["textureFile"], name))
        chest = contents.get(icon["name"], {})
        rows.append({"chest": icon["name"], "item": chest.get("english"), "itemType": chest.get("itemType"),
                     "icon": name, **measured[name]})
    # Abyss chest items (v0.103): icons named in abyss-chest-cards.json.
    abyss_rows = []
    for card in json.loads((ROOT / "research" / "analysis" / "abyss-chest-cards.json")
                           .read_text(encoding="utf-8"))["chests"]:
        if not card.get("iconName"):
            continue
        name = card["iconName"].lower()
        if name not in measured:
            measured[name] = measure(to_png(context, f"ui/texture/icon/{name}.dds", name))
        abyss_rows.append({"chest": card["name"], "item": card.get("english"), "icon": name, **measured[name]})
    # Unique gear items (v0.112): icons named in unique-gear-cards.json.
    unique_rows = []
    for card in json.loads((ROOT / "research" / "analysis" / "unique-gear-cards.json")
                           .read_text(encoding="utf-8"))["items"]:
        if not card.get("iconName"):
            continue
        name = card["iconName"].lower()
        if name not in measured:
            measured[name] = measure(to_png(context, f"ui/texture/icon/{name}.dds", name))
        unique_rows.append({"chest": card["name"], "item": card.get("english"), "icon": name, **measured[name]})
    for name, path in BACKGROUNDS.items():
        to_png(context, path, name)

    fills = sorted(row["fill"] for row in rows + abyss_rows + unique_rows if "fill" in row)
    summary = {"items": len(rows), "abyssItems": len(abyss_rows), "uniqueItems": len(unique_rows),
               "distinctIcons": len(measured),
               "fillMin": fills[0], "fillMedian": fills[len(fills) // 2], "fillMax": fills[-1]}
    (ROOT / "research" / "analysis" / "chest-item-icon-sizes.json").write_text(
        json.dumps({"summary": summary, "items": rows, "abyssItems": abyss_rows, "uniqueItems": unique_rows}, indent=1, ensure_ascii=False)
        + "\n", encoding="utf-8")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
