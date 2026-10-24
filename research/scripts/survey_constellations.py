"""Survey the 13 Constellations (anamorphic puzzles) for a possible map category.

What it does:
    1. Takes the 13 landmark objects of type 1000005 ("anamorphic_constellation")
       from the game's landmark list, with their positions (the three floats
       after the object's empty alias name), via survey_landmark_categories.py.
    2. Pairs them one to one with the 13 MapGenie Constellation points.
    3. Links each to its challenge mission (Challenge_Anamorphic_<Name>), its
       two knowledge entries and its completion gimmick, by the game's own
       names (level Anamorphic_00NN = gimmick_anamorphic_constellation_NN).
    4. Reads saves (pycrimson) and reports, per constellation, the mission
       state, knowledge levels and completion field record.

Reads:  research/vendor/work (landmark list, missioninfo, knowledgeinfo),
        data/poi-data.js, the save files given on the command line
Writes: research/analysis/constellation-survey.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B survey_constellations.py <repository root> <save>...
        (pycrimson: LukeFZ, MIT)
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(sys.argv[1])
sys.path.insert(0, str(Path(__file__).resolve().parent))
sys.argv = [sys.argv[0], str(ROOT)] + sys.argv[2:]
import survey_landmark_categories as landmarks  # noqa: E402

CONSTELLATION = 1000005
# Game name of each constellation, in level order (Anamorphic_0001 .. _0013);
# MapGenie names come from the pairing.
GAME_NAMES = ["Shield", "Adventurer", "Wagon", "Hammer", "Treant_Owl", "Sealing_Stone", "Boat",
              "Elephant", "Camel", "Goblin", "Black_Dragon", "Black_Giant", "Black_Key"]


def table_names(stem):
    """Row key -> name for one static table."""
    return {key: landmarks.row_name(row) for key, row in
            landmarks.load_table(landmarks.WORK / "staticinfo" / stem, 2).items()}


def read_save(path):
    """Mission states, knowledge levels and constellation field records of one save."""
    vendor = ROOT / "research" / "vendor"
    sys.path[:0] = [str(vendor / "pycrimson" / "src"), str(vendor / "bier-src")]
    from bier.EndianedBinaryIO import EndianedBytesIO
    from pycrimson._files import SaveFile
    from pycrimson._reflection import ReflectionParser
    objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(Path(path)))).objects
    result = {"missions": {}, "knowledge": {}, "field": []}
    for item in objects:
        kind = item.get("__pycr_type__")
        if kind == "QuestSaveData":
            result["missions"] = {m["_key"]: m.get("_state") for m in item["_missionStateList"]}
        elif kind == "KnowledgeSaveData":
            result["knowledge"] = {e["_key"]: e.get("_level") for e in item["_list"]}
        elif kind == "FieldSaveData":
            result["field"] += [e for e in item.get("_fieldGimmickSaveDataList") or []
                                if str(e.get("_ownerLevelName", "")).startswith("Anamorphic_")]
    return result


def main():
    """Build the constellation table and print each save's state per constellation."""
    objects = sorted((o for o in landmarks.landmark_objects() if o["type"] == CONSTELLATION),
                     key=lambda o: o["level"])
    points = [p for p in landmarks.mapgenie_points() if p["category"] == "Constellation"]
    paired = {id(o): (d, p) for d, o, p in landmarks.pair(objects, points)}
    missions = {name: key for key, name in table_names("missioninfo").items() if name}
    knowledge = {name: key for key, name in table_names("knowledgeinfo").items() if name}
    rows = []
    for number, item in enumerate(objects, 1):
        game = GAME_NAMES[number - 1]
        distance, point = paired[id(item)]
        rows.append({
            "index": number, "level": item["level"], "uuid": item["uuid"], "gamePosition": item["position"],
            "gameName": game, "mapGenieName": point["name"], "mapGenieId": point["id"],
            "region": point.get("region"), "mapGenieDistance": round(distance, 1),
            "missionKey": missions["Challenge_Anamorphic_" + game],
            "knowledgeKeys": [knowledge["Knowledge_Anamorphic_" + game],
                              knowledge["Knowledge_AncientRuinAnamorphic_" + game]],
        })
    saves = {}
    for path in sys.argv[2:]:
        save = read_save(path)
        saves[path] = [{
            "index": row["index"],
            "mission": save["missions"].get(row["missionKey"]),
            "knowledge": [save["knowledge"].get(key) for key in row["knowledgeKeys"]],
            "completeRecord": any(e.get("_ownerLevelName") == row["level"] and
                                  e.get("_isRaiseGamePlayLevelGimmickComplete") for e in save["field"]),
        } for row in rows]
        print(path, saves[path])
    output = ROOT / "research" / "analysis" / "constellation-survey.json"
    output.write_text(json.dumps({"constellations": rows, "saves": saves}, indent=1) + "\n", encoding="utf-8")
    print(f"{len(rows)} constellations written to {output}")


if __name__ == "__main__":
    main()
