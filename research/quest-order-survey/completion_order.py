"""List quests and missions in the order the full-save player completed them.

What it does:
    Reads QuestSaveData from the full-save copy (read-only) and sorts every
    completed quest and mission by its _completedTime. Shows how well the save
    gives a real play order for the main-story chapter quests.
Reads:  research/vendor/work/full-save/save.save, quests.json (this folder)
Writes: completion-order.json (this folder)
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/completion_order.py
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
for sub in ("pycrimson/src", "bier-src"):
    sys.path.insert(0, str(ROOT / "research" / "vendor" / sub))
from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

path = ROOT / "research" / "vendor" / "work" / "full-save" / "save.save"
objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects
data = next(o for o in objects if o.get("__pycr_type__") == "QuestSaveData")
quests = {q["key"]: q for q in json.loads((HERE / "quests.json").read_text(encoding="utf-8"))}
done = [{"key": r["_questKey"], "name": quests.get(r["_questKey"], {}).get("name"),
         "title": quests.get(r["_questKey"], {}).get("title"),
         "group": quests.get(r["_questKey"], {}).get("group"),
         "completedTime": r.get("_completedTime"), "branchedTime": r.get("_branchedTime")}
        for r in data["_questStateList"] if r.get("_state") == 5]
done.sort(key=lambda x: (x["completedTime"] is None, x["completedTime"]))
main = [d for d in done if d["group"] and 1000 <= d["group"] <= 1013]
(HERE / "completion-order.json").write_text(json.dumps(
    {"completedQuests": len(done), "withTime": sum(1 for d in done if d["completedTime"]),
     "mainChapterQuestsInCompletionOrder": main, "all": done}, indent=1, ensure_ascii=False))
for d in main:
    print(d["completedTime"], d["group"], d["name"])
print(len(done), sum(1 for d in done if d["completedTime"]))
