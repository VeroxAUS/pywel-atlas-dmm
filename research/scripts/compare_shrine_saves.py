"""Compare save copies taken before and after finding a Greymane Shrine.

What it does:
    Decodes save copies with pycrimson (decrypt, check, decompress, then read
    the save's self-describing "reflection" data) and compares them by key,
    not by list position, so inserted entries do not hide real changes:
      - knowledge entries (key -> level, new-mark flag), with names from the
        game's knowledge table;
      - the 12 shrine faction-node records (list positions 1107-1118, which
        follow the faction node table order; each record's owner key is its
        node key);
      - mission states (key -> state, UI state);
      - the newest alert-history entries.
    Read-only: it refuses paths inside the game's save folder. Copy the slot
    files elsewhere first (for example research/vendor/work/shrine-test/).

Key terms:
    knowledge - the game's "you learned about this" records. Each shrine has
        one (Knowledge_Node_<Name>_GreyManeTemple). Level 2 appeared when the
        shrine was discovered in the 2026-10-22 test.

Reads:  two or more save copies given on the command line, in order;
        research/vendor/work/staticinfo/knowledgeinfo.staticinfo* (names)
Writes: nothing; prints a report.
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/compare_shrine_saves.py A.save B.save [C.save]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import re
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

SHRINE_NODE_POSITIONS = range(1107, 1119)


def load_save(path):
    """Decode one save copy into its list of top-level objects."""
    if "pearl abyss" in str(path.resolve()).lower():
        raise SystemExit("Refusing to read inside the game's save folder; copy the file first.")
    plain = SaveFile.from_encrypted_file(path)
    return ReflectionParser(EndianedBytesIO(plain)).objects


def top(objects, type_name):
    """Return the first top-level object of that type."""
    return next(item for item in objects if item.get("__pycr_type__") == type_name)


def knowledge_names():
    """Map knowledge key -> name from the extracted static table."""
    folder = VENDOR / "work" / "staticinfo"
    header = (folder / "knowledgeinfo.staticinfoheader").read_bytes()
    body = (folder / "knowledgeinfo.staticinfobody").read_bytes()
    count = int.from_bytes(header[:2], "little")
    key_size = (len(header) - 2 - 4 * count) // count
    names = {}
    for index in range(count):
        start = 2 + (key_size + 4) * index
        key = int.from_bytes(header[start:start + key_size], "little")
        offset = struct.unpack_from("<I", header, start + key_size)[0]
        match = re.search(rb"Knowledge_[A-Za-z0-9_]+", body[offset:offset + 200])
        names[key] = match.group().decode() if match else "?"
    return names


def main():
    """Load every save given and print key-by-key changes between neighbours."""
    paths = [Path(argument) for argument in sys.argv[1:]]
    if len(paths) < 2:
        raise SystemExit(__doc__)
    saves = [load_save(path) for path in paths]
    names = knowledge_names()

    for before, after, label in zip(saves, saves[1:], [f"{a.name} -> {b.name}" for a, b in zip(paths, paths[1:])]):
        print(f"== {label}")
        old = {e["_key"]: (e.get("_level"), e.get("_isNewMark")) for e in top(before, "KnowledgeSaveData")["_list"]}
        new = {e["_key"]: (e.get("_level"), e.get("_isNewMark")) for e in top(after, "KnowledgeSaveData")["_list"]}
        for key in new:
            if key not in old:
                print(f"  knowledge added   {key} {names.get(key)} level={new[key][0]}")
            elif old[key] != new[key]:
                print(f"  knowledge changed {key} {names.get(key)} {old[key]} -> {new[key]}")

        old_nodes = top(before, "FactionSaveData")["_factionNodeElementSaveDataList"]
        new_nodes = top(after, "FactionSaveData")["_factionNodeElementSaveDataList"]
        for position in SHRINE_NODE_POSITIONS:
            # Ignore the timer that changes on every node in every save.
            a = {k: v for k, v in old_nodes[position].items() if k != "_lastRevivedFieldTimeRaw"}
            b = {k: v for k, v in new_nodes[position].items() if k != "_lastRevivedFieldTimeRaw"}
            if a != b:
                print(f"  shrine node {position} (owner {b.get('_ownerFactionKey')}) changed:",
                      {k: (a.get(k), b.get(k)) for k in set(a) | set(b) if a.get(k) != b.get(k)})

        old_missions = {m["_key"]: (m.get("_state"), m.get("_uiState")) for m in top(before, "QuestSaveData")["_missionStateList"]}
        new_missions = {m["_key"]: (m.get("_state"), m.get("_uiState")) for m in top(after, "QuestSaveData")["_missionStateList"]}
        for key, state in new_missions.items():
            if old_missions.get(key) != state:
                print(f"  mission {key}: {old_missions.get(key)} -> {state}")

        alerts_before = len(top(before, "ContentsMiscSaveData")["_alertHistorySaveDataList"])
        for alert in top(after, "ContentsMiscSaveData")["_alertHistorySaveDataList"][alerts_before:]:
            shown = {k: v for k, v in alert.items() if k in ("_alertType", "_knowledgeKey", "_missionKey",
                                                             "_level", "_levelGimmickSceneObjectKey")}
            print(f"  new alert {shown}")

    print("== shrine nodes in the last save (position, owner key, state):",
          [(p, top(saves[-1], "FactionSaveData")["_factionNodeElementSaveDataList"][p].get("_ownerFactionKey"),
            top(saves[-1], "FactionSaveData")["_factionNodeElementSaveDataList"][p].get("_factionState"))
           for p in SHRINE_NODE_POSITIONS])


if __name__ == "__main__":
    main()
