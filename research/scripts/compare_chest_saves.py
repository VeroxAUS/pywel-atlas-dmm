"""Compare save copies taken before and after opening a treasure chest.

What it does:
    Decodes save copies with pycrimson and compares neighbouring copies:
      1. the Bells' list, DiscoveredLevelGimmickSceneObjectSaveData, by
         scene-object UUID (a chest may be recorded here like a Bell);
      2. the field-object list, FieldSaveData._fieldGimmickSaveDataList, by
         the placed object it came from (_levelOriginSceneObjectUuid) and its
         gimmick type, with gimmick names from the game's gimmick table and
         the refill timer (_resetTimeSecondsOfDays);
      3. every other top-level save object, as a count of changed values
         plus a few example paths, to spot an unexpected home.
    Each UUID found in steps 1-2 is looked up in
    research/analysis/treasure-chest-placements.json, so a change can be
    tied to a known chest object.
    Read-only: it refuses paths inside the game's save folder. Copy the slot
    files elsewhere first (for example research/vendor/work/chest-test/).

Reads:  two or more save copies given on the command line, in order;
        research/vendor/work/gimmick-names.json (gimmick key -> name);
        research/analysis/treasure-chest-placements.json
Writes: nothing; prints a report.
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/compare_chest_saves.py A0.save A1.save [...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

# Values that change in every save regardless of what the player did.
NOISY = ("Time", "time", "_lastRevived", "Seed", "_playTime", "_position", "Position", "_transform")


def load_save(path):
    """Decode one save copy into its list of top-level objects."""
    if "pearl abyss" in str(path.resolve()).lower():
        raise SystemExit("Refusing to read inside the game's save folder; copy the file first.")
    return ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects


def top(objects, type_name):
    """Return all top-level objects of that type."""
    return [item for item in objects if item.get("__pycr_type__") == type_name]


def flatten(value, path, out):
    """Flatten nested dicts/lists into {path: leaf value}."""
    if isinstance(value, dict):
        for key, item in value.items():
            if key != "__pycr_type__":
                flatten(item, f"{path}.{key}", out)
    elif isinstance(value, list):
        if all(not isinstance(item, (dict, list)) for item in value):
            out[path] = tuple(value)
        else:
            for index, item in enumerate(value):
                flatten(item, f"{path}[{index}]", out)
    else:
        out[path] = value


def landmark_records(objects):
    """UUID -> record of the Bells' list."""
    records = {}
    for container in top(objects, "DiscoveredLevelGimmickSceneObjectSaveData"):
        for entry in container["_discoveredLevelGimmickSceneObjectSaveDataList"]:
            records[tuple(entry.get("_sceneObjectUuid") or ())] = entry
    return records


def field_records(objects):
    """(origin UUID, gimmick key, save key) -> record of the field-object list."""
    records = {}
    for field in top(objects, "FieldSaveData"):
        for entry in field.get("_fieldGimmickSaveDataList") or []:
            origin = tuple(entry.get("_levelOriginSceneObjectUuid") or ())
            records[(origin, entry.get("_gimmickInfoKey"), entry.get("_fieldGimmickSaveDataKey"))] = entry
    return records


def short(entry, names):
    """One-line summary of a field-object record."""
    return (f"{names.get(str(entry.get('_gimmickInfoKey')), '?')} reason={entry.get('_fieldSaveDataReason')} "
            f"reset={entry.get('_resetTimeSecondsOfDays')} level={entry.get('_ownerLevelName')} "
            f"state={entry.get('_initStateNameHash')} origin={entry.get('_levelOriginSceneObjectUuid')}")


def main():
    """Compare each neighbouring pair of save copies."""
    paths = [Path(argument) for argument in sys.argv[1:]]
    if len(paths) < 2:
        raise SystemExit(__doc__)
    names = json.loads((VENDOR / "work" / "gimmick-names.json").read_text(encoding="utf-8"))
    placements = json.loads((ROOT / "research" / "analysis" / "treasure-chest-placements.json")
                            .read_text(encoding="utf-8"))
    chests = {tuple(chest["uuid"]): chest for spot in placements["spots"] for chest in spot["chests"]}
    saves = [load_save(path) for path in paths]

    for (before, after), (old_path, new_path) in zip(zip(saves, saves[1:]), zip(paths, paths[1:])):
        print(f"== {old_path.name} -> {new_path.name}")

        old, new = landmark_records(before), landmark_records(after)
        for uuid in new.keys() | old.keys():
            if old.get(uuid) != new.get(uuid):
                known = chests.get(tuple(uuid[:3]) + (0,)) or chests.get(uuid)
                print(f"  landmark {uuid} {old.get(uuid)} -> {new.get(uuid)} "
                      f"chest={known['prefab'] if known else '-'}")

        old, new = field_records(before), field_records(after)
        for key in sorted(new.keys() - old.keys(), key=str):
            known = chests.get(tuple(key[0][:3]) + (0,)) if key[0] else None
            print(f"  field added   {short(new[key], names)} chest={known['prefab'] if known else '-'}")
        for key in sorted(old.keys() - new.keys(), key=str):
            print(f"  field removed {short(old[key], names)}")
        for key in sorted(old.keys() & new.keys(), key=str):
            if old[key] != new[key]:
                a, b = {}, {}
                flatten(old[key], "", a)
                flatten(new[key], "", b)
                changed = [p for p in a.keys() | b.keys() if a.get(p) != b.get(p)]
                print(f"  field changed {short(new[key], names)} fields={sorted(changed)[:6]}")

        # Everything else: count changed values per top-level type.
        skip = {"DiscoveredLevelGimmickSceneObjectSaveData", "FieldSaveData"}
        types = {item.get("__pycr_type__") for item in before + after} - skip
        for name in sorted(types, key=str):
            a, b = {}, {}
            for item in top(before, name):
                flatten(item, name, a)
            for item in top(after, name):
                flatten(item, name, b)
            changed = [p for p in a.keys() | b.keys()
                       if a.get(p) != b.get(p) and not any(word in p for word in NOISY)]
            if changed:
                print(f"  {name}: {len(changed)} changed, e.g. {sorted(changed)[:4]}")


if __name__ == "__main__":
    main()
