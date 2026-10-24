"""Dump the level objects behind the save's "picked up, never respawns" records.

What it does:
    research/analysis/picked-up-targets.json lists (level name, object UUID)
    pairs taken from a near-complete save: field-object records with reason 2
    and a reset time of "never" whose UUID was not found by
    scan_ground_items.py. For each pair this script opens the level file,
    finds the object by UUID and writes the object (its components included,
    children left out), its parent chain's type names and its world position,
    so the way unique ground items are placed can be read.

Reads:  research/analysis/picked-up-targets.json, research/vendor/work/pack-files.txt,
        the installed game's level packs (group 0015) through pycrimson, read-only
Writes: research/analysis/picked-up-objects.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/dump_picked_up_objects.py
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from pycrimson._context import PackageContext  # noqa: E402
from find_treasure_chests import GAME, multiply, parse_level, rotate  # noqa: E402


def strip_children(value, depth=0):
    """Return the object with child scene objects replaced by their type names."""
    if depth > 12:
        return "..."
    if isinstance(value, dict):
        out = {}
        for key, inner in value.items():
            if key == "_childSceneObjects":
                out[key] = [str(child.get("__pycr_type__")) for child in inner or [] if isinstance(child, dict)][:40]
            else:
                out[key] = strip_children(inner, depth + 1)
        return out
    if isinstance(value, list):
        return [strip_children(inner, depth + 1) for inner in value[:80]]
    if isinstance(value, bytes):
        return value.hex()[:128]
    return value


def find(objects, uuid):
    """Return (object, world position, parent type chain) for the UUID, or None."""
    def walk(item, parent, chain):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), multiply(parent[1], rotation))
        if list((item.get("_sceneObjectUuid") or [])[:3]) == uuid:
            return item, world[0] if world else None, chain
        for child in item.get("_childSceneObjects") or []:
            if isinstance(child, dict):
                found = walk(child, world, chain + [str(item.get("__pycr_type__"))])
                if found:
                    return found
        return None

    for item in objects:
        if isinstance(item, dict):
            found = walk(item, None, [])
            if found:
                return found
    return None


def main():
    """Look up every target and write what was found."""
    targets = json.loads((ROOT / "research" / "analysis" / "picked-up-targets.json").read_text(encoding="utf-8"))
    by_name = {}
    for line in (VENDOR / "work" / "pack-files.txt").read_text(encoding="utf-8").splitlines():
        if line.rstrip().endswith(".palevel"):
            path = line.split(" ", 1)[1].strip()
            by_name.setdefault(path.rsplit("/", 1)[-1][:-len(".palevel")].lower(), []).append(path)
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    cache, results = {}, []
    for target in targets:
        record = dict(target)
        paths = by_name.get(target["level"].lower(), [])
        record["levelPaths"] = paths
        for path in paths:
            if path not in cache:
                try:
                    cache[path] = parse_level(context.get_file(path))
                except Exception as error:  # Reported per target.
                    cache[path] = []
                    record.setdefault("errors", []).append(f"{path}: {error}")
            found = find(cache[path], target["uuid"])
            if found:
                item, position, chain = found
                record["foundIn"] = path
                record["gamePosition"] = [round(v, 2) for v in position] if position else None
                record["parentTypes"] = chain
                record["object"] = strip_children(item)
                break
        results.append(record)
    out = ROOT / "research" / "analysis" / "picked-up-objects.json"
    out.write_text(json.dumps(results, indent=1, ensure_ascii=False, default=str) + "\n", encoding="utf-8")
    print(f"{sum(1 for r in results if 'object' in r)} of {len(results)} found; wrote {out}")


if __name__ == "__main__":
    main()
