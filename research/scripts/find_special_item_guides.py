"""Collect the game's own guide text for each special item on our cards (Pywel Atlas 0.14.0).

What it does:
    Special items (ability shields and spears, gadget helms, sprayers, the
    Tidebreaker boots, ...) have a guide text in ui.paloc: a title row
    "{StaticInfo:Item:<item>#<Name>}" and, in the very next text id, the
    description ("Press {Key:HudSkillSlotPress} to select ..., then press
    {Key:Key_Skill_5_Start} to use it.<br/>It releases a cloud of frost
    ..."). This script finds that text for every item on our chest, Abyss
    chest and unique gear cards and splits it into its parts (at "<br/>").
    The first part is the equip/select step; the card generator drops it
    (keeping only its "then press {Key:...} to use it" key, if any).

Reads:  research/vendor/work/eng/ui.paloc; research/analysis/treasure-chest-contents.json,
        abyss-chest-cards.json, unique-gear-cards.json (item names)
Writes: research/analysis/special-item-guides.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_special_item_guides.py
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ANALYSIS = ROOT / "research" / "analysis"
sys.path.insert(0, str(Path(__file__).resolve().parent))

from find_chest_contents import read_paloc  # noqa: E402

TITLE = re.compile(r"\{StaticInfo:Item:([A-Za-z0-9_]+)#([^}]*)\}")


def main():
    """Find the guide text of every item on our cards and write the JSON."""
    texts = read_paloc(ROOT / "research" / "vendor" / "work" / "eng" / "ui.paloc")
    ours = set()
    for row in json.loads((ANALYSIS / "treasure-chest-contents.json").read_text(encoding="utf-8"))["categories"]["Chest"]:
        ours.add(row.get("itemName"))
    for name, key in (("abyss-chest-cards.json", "chests"), ("unique-gear-cards.json", "items")):
        for row in json.loads((ANALYSIS / name).read_text(encoding="utf-8"))[key]:
            ours.add(row.get("itemName"))
    ours.discard(None)

    guides = {}
    for text_id in sorted(texts, key=int):
        match = TITLE.fullmatch(texts[text_id])
        if not match or match.group(1) not in ours or match.group(1) in guides:
            continue  # The first guide wins when an item has two (Constellation Helm).
        description_id = str(int(text_id) + 1)
        description = texts.get(description_id)
        if not description:
            continue
        # Normalise the game's missing spaces ("press{Key:...}").
        description = re.sub(r"(?<=\w)\{Key:", " {Key:", description)
        parts = [re.sub(r"\s+", " ", part).strip() for part in description.split("<br/>")]
        guides[match.group(1)] = {"name": match.group(2), "titleId": text_id, "descriptionId": description_id,
                                  "parts": [part for part in parts if part]}
    (ANALYSIS / "special-item-guides.json").write_text(
        json.dumps({"count": len(guides), "items": guides}, indent=1, ensure_ascii=False) + "\n", encoding="utf-8")
    print(f"{len(guides)} items with a guide text")


if __name__ == "__main__":
    main()
