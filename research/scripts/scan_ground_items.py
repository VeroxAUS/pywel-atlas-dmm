"""List every item placed on the ground in the game's level files.

What it does:
    1. Reads every level file (.palevel) in pack group 0015 and keeps the ones
       that place a ground-item object: a prefab under
       object/cd_gimmick/00_common/item/ (for example gimmick_item_basic_onehand,
       gimmick_item_basic_equip_offset, gimmick_item_paper) or
       object/cd_gimmick/00_common/equip/ (gimmick_equip_onehandsword ...).
    2. Parses those levels and, for each placed ground item, records its
       prefab, unique ID (UUID), level, alias name, world position and every
       text or number field inside it (its components included), so the item
       it gives can be read afterwards. Child objects are walked with the
       parent transform, as in find_treasure_chests.py.
    Read-only on the game files.

Reads:  the installed game's level packs (group 0015) through pycrimson,
        research/vendor/work/pack-files.txt
Writes: research/analysis/ground-item-placements.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/scan_ground_items.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import re
import sys
import time
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from pycrimson._context import PackageContext  # noqa: E402
from find_treasure_chests import GAME, multiply, parse_level, rotate  # noqa: E402

ITEM_PREFAB = re.compile(r"/00_common/(?:item|equip)/gimmick_(?:item|equip)_[^/]*\.prefab$", re.IGNORECASE)
QUICK_TEST = (b"/00_common/item/gimmick_item_", b"/00_common/equip/gimmick_equip_")


def fields(value, path="", out=None):
    """Return {path: value} for every text and number inside one object, children excluded."""
    out = {} if out is None else out
    if isinstance(value, dict):
        for key, inner in value.items():
            if key in ("_childSceneObjects", "_worldTransform"):
                continue
            fields(inner, f"{path}.{key}" if path else key, out)
    elif isinstance(value, list):
        if value and all(isinstance(v, (int, float)) for v in value) and len(value) <= 16:
            out[path] = value
        else:
            for index, inner in enumerate(value[:64]):
                fields(inner, f"{path}[{index}]", out)
    elif isinstance(value, (str, int, float)) and value not in ("", 0):
        out[path] = value
    elif isinstance(value, bytes) and value:
        out[path] = value.hex()[:64]
    return out


def items_in(objects):
    """Yield (prefab, object, world position, parent prefab) for each ground item."""
    def walk(item, parent, parent_prefab):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), multiply(parent[1], rotation))
        prefab = str(item.get("__pycr_type__"))
        if ITEM_PREFAB.search(prefab) and world:
            yield prefab, item, world[0], parent_prefab
        for child in item.get("_childSceneObjects") or []:
            yield from walk(child, world, prefab)

    for item in objects:
        if isinstance(item, dict):
            yield from walk(item, None, None)


def main():
    """Scan all levels, collect ground items and write the JSON report."""
    paths = [line.split(" ", 1)[1].strip()
             for line in (VENDOR / "work" / "pack-files.txt").read_text(encoding="utf-8").splitlines()
             if line.rstrip().endswith(".palevel")]
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    found, seen, errors, levels_hit = [], set(), [], 0
    started = time.time()
    for index, path in enumerate(paths):
        if index % 2000 == 0:
            print(f"{index}/{len(paths)} levels, {len(found)} items, {time.time() - started:.0f}s", flush=True)
        try:
            data = context.get_file(path)
        except Exception as error:  # A pack read failure is reported, not fatal.
            errors.append(f"{path}: {error}")
            continue
        low = data.lower()
        if not any(test in low for test in QUICK_TEST):
            continue
        levels_hit += 1
        for prefab, item, position, parent_prefab in items_in(parse_level(data)):
            uuid = list(item.get("_sceneObjectUuid") or [])
            key = (tuple(uuid), path)
            if key in seen:
                continue
            seen.add(key)
            found.append({
                "prefab": prefab.rsplit("/", 1)[-1],
                "parentPrefab": parent_prefab.rsplit("/", 1)[-1] if parent_prefab else None,
                "uuid": uuid,
                "level": path,
                "gamePosition": [round(v, 2) for v in position],
                "fields": fields(item),
            })

    summary = {
        "levelsRead": len(paths),
        "levelsWithItems": levels_hit,
        "items": len(found),
        "distinctUuids": len({tuple(f["uuid"]) for f in found}),
        "byPrefab": dict(Counter(f["prefab"] for f in found).most_common()),
        "readErrors": len(errors),
    }
    out = ROOT / "research" / "analysis" / "ground-item-placements.json"
    out.write_text(json.dumps({"summary": summary, "errors": errors[:50], "items": found},
                              indent=1, ensure_ascii=False, default=str) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
