"""List every item the level files place directly in the world.

What it does:
    A save test (dump_picked_up_objects.py) showed how one-off ground items are
    placed: a plain SceneObject whose only component is a SpawnComponent with
    an `_itemKey` (the item it gives) and sometimes a `_gimmickAliasName`.
    Picking one up writes a field-object record (reason 2, never resets) for
    that object's UUID. This script reads every level file in pack group 0015,
    keeps the levels whose bytes mention "_itemKey", and records each placed
    object that has a SpawnComponent with an item key: UUID, level, world
    position, item key, alias and the object's prefab (type) name. Objects
    nested inside other objects use the parent transform, as in
    find_treasure_chests.py.

Reads:  the installed game's level packs (group 0015) through pycrimson,
        research/vendor/work/pack-files.txt
Writes: research/analysis/item-spawn-placements.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/scan_item_spawns.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
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


def spawns_in(objects):
    """Yield (object, SpawnComponent, world position, parent type) for each item spawn."""
    def walk(item, parent, parent_type):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), multiply(parent[1], rotation))
        for component in item.get("_components") or []:
            if (isinstance(component, dict) and component.get("__pycr_type__") == "SpawnComponent"
                    and component.get("_itemKey") and world):
                yield item, component, world[0], parent_type
                break
        for child in item.get("_childSceneObjects") or []:
            if isinstance(child, dict):
                yield from walk(child, world, str(item.get("__pycr_type__")))

    for item in objects:
        if isinstance(item, dict):
            yield from walk(item, None, None)


def main():
    """Scan all levels, collect item spawns and write the JSON report."""
    paths = [line.split(" ", 1)[1].strip()
             for line in (VENDOR / "work" / "pack-files.txt").read_text(encoding="utf-8").splitlines()
             if line.rstrip().endswith(".palevel")]
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    found, seen, errors, levels_hit = [], set(), [], 0
    started = time.time()
    for index, path in enumerate(paths):
        if index % 2000 == 0:
            print(f"{index}/{len(paths)} levels, {len(found)} spawns, {time.time() - started:.0f}s", flush=True)
        try:
            data = context.get_file(path)
        except Exception as error:  # A pack read failure is reported, not fatal.
            errors.append(f"{path}: {error}")
            continue
        if b"_itemKey" not in data:
            continue
        levels_hit += 1
        for item, component, position, parent_type in spawns_in(parse_level(data)):
            uuid = list(item.get("_sceneObjectUuid") or [])
            key = (tuple(uuid), path)
            if key in seen:
                continue
            seen.add(key)
            extra = {name: value for name, value in component.items()
                     if name not in ("__pycr_type__", "_itemKey", "_gimmickAliasName", "_linkdataGroupList")
                     and value not in (None, "", 0, [], {})}
            found.append({
                "uuid": uuid,
                "level": path,
                "type": str(item.get("__pycr_type__")).rsplit("/", 1)[-1],
                "parentType": parent_type.rsplit("/", 1)[-1] if parent_type else None,
                "components": [str(c.get("__pycr_type__")) for c in item.get("_components") or [] if isinstance(c, dict)],
                "itemKey": component.get("_itemKey"),
                "alias": component.get("_gimmickAliasName") or None,
                "spawnExtra": extra or None,
                "gamePosition": [round(v, 2) for v in position],
            })

    summary = {
        "levelsRead": len(paths),
        "levelsWithItemKey": levels_hit,
        "spawns": len(found),
        "distinctUuids": len({tuple(f["uuid"]) for f in found}),
        "distinctItems": len({f["itemKey"] for f in found}),
        "byType": dict(Counter(f["type"] for f in found).most_common(30)),
        "readErrors": len(errors),
    }
    out = ROOT / "research" / "analysis" / "item-spawn-placements.json"
    out.write_text(json.dumps({"summary": summary, "errors": errors[:50], "spawns": found},
                              indent=1, ensure_ascii=False, default=str) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
