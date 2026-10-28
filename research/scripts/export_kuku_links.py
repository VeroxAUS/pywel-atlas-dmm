"""Write the two Kuku Pot data files the mod is built from.

What it does:
    1. data/sanctum-core-links.json - one entry per Sanctum Core (16). The
       position is the MapGenie "Core of <Sanctum>" point (the secret puzzle
       on the surface), turned into game X/Z. MapGenie has no height, so the
       height is taken from the nearest object of the game's landmark list
       (usually a chest within 50 m) and marked as approximate.
       Save rule: the Sanctum's Witch mission (Mission_*_Witch_Normal_SanctumOf*)
       at state 5 = cleansed. Mortification, Faith and Oblation have no such
       mission in the game's tables: missionKey 0 = never hidden.
    2. data/kuku-pot-item-links.json - the Abyss Cell No. 1, Power Core and
       Aeserion Scales objects the survey paired with a MapGenie point. Each
       is a placed object (UUID, real level position). Save rule: a field
       record (FieldSaveData._fieldGimmickSaveDataList) with the object's
       UUID as origin, its gimmick key, reason 1 or 2, reset never, and its own
       UUID in _levelOrigin_disabledSceneObjectUuidList = taken.

Reads:  research/analysis/kuku-item-survey.json, data/poi-data.js,
        the landmark list (survey_landmark_categories.py)
Writes: data/sanctum-core-links.json, data/kuku-pot-item-links.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_kuku_links.py
"""
import json
import math
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SURVEY = ROOT / "research" / "analysis" / "kuku-item-survey.json"
# survey_landmark_categories reads the repository root from argv[1] when imported.
sys.argv = [sys.argv[0], str(ROOT)]
sys.path.insert(0, str(Path(__file__).resolve().parent))
import survey_landmark_categories as landmarks  # noqa: E402

# Witch mission key per Sanctum (state 5 = cleansed); 0 = no mission in the game's tables.
SANCTUM_MISSIONS = {
    "Absolution": 1000687, "Temperance": 1000694, "Penitence": 1000989, "Benediction": 1000990,
    "Exaltation": 1000992, "Solace": 1000993, "Deliverance": 1001473, "Atonement": 1000262,
    "Devotion": 1001475, "Veneration": 1001476, "Expiation": 1001479, "Renunciation": 1001481,
    "Revelation": 1001482, "Mortification": 0, "Faith": 0, "Oblation": 0,
}
GIMMICK_KEYS = {  # placed prefab -> gimmick key (gimmick-names.json)
    "gimmick_abysscore_0001": 1002274, "gimmick_attach_abyss_core_0001": 1001459,
    "gimmick_attach_abyss_core_0003": 1001461, "gimmick_snake_boss_scales_01": 1005694,
}
EGG_GIMMICK_KEYS = {"gimmick_egg_kuku_0001": 1011326, "gimmick_egg_wyvern_0001": 1011327}


def sanctum_cores():
    """Return the 16 Sanctum Core entries."""
    objects = [o for o in landmarks.landmark_objects() if landmarks.plausible(o["position"])]
    entries = []
    for point in landmarks.mapgenie_points():
        if point.get("category") != "Kuku Pot Item" or not point["name"].startswith("Core of "):
            continue
        sanctum = point["name"][len("Core of "):]
        near = min(objects, key=lambda o: math.hypot(o["position"][0] - point["x"], o["position"][2] - point["z"]))
        distance = math.hypot(near["position"][0] - point["x"], near["position"][2] - point["z"])
        entries.append({
            "name": point["name"],
            "sanctum": sanctum,
            "missionKey": SANCTUM_MISSIONS[sanctum],
            "gamePosition": [round(point["x"], 2), round(near["position"][1], 2), round(point["z"], 2)],
            "heightFrom": f"nearest landmark object, {distance:.0f} m away (approximate)",
            "region": point.get("region"),
            "mapGenieId": point["id"],
        })
    if sorted(e["sanctum"] for e in entries) != sorted(SANCTUM_MISSIONS):
        raise ValueError("Sanctum Core points do not match the Sanctum list")
    return sorted(entries, key=lambda e: e["name"])


def kuku_items():
    """Return the paired Abyss Cell No. 1 / Power Core / Aeserion Scales objects."""
    survey = json.loads(SURVEY.read_text(encoding="utf-8"))
    entries = []
    for row in survey["objects"]:
        if row["prefab"] not in GIMMICK_KEYS or "mapGenieName" not in row or row["inAbyss"]:
            continue
        name = row["mapGenieName"].replace("Abyss Cell: No.", "Abyss Cell No.")
        if row["prefab"] == "gimmick_abysscore_0001" and not name.startswith("Abyss Cell No. 1"):
            continue
        entries.append({
            "name": name,
            "prefab": row["prefab"],
            "gimmickKey": GIMMICK_KEYS[row["prefab"]],
            "uuid": row["uuid"],
            "level": row["level"],
            "gamePosition": row["gamePosition"],
            "region": row.get("mapGenieRegion"),
            "mapGenieId": row["mapGenieId"],
            "mapGenieDistance": row["mapGenieDistance"],
        })
    entries.sort(key=lambda e: (e["name"], e["gamePosition"]))
    if len({tuple(e["uuid"]) for e in entries}) != len(entries):
        raise ValueError("A Kuku Pot item UUID repeats")
    return entries


def eggs():
    """Return the 10 placed eggs (5 Kuku Bird, 5 Wyvern), each paired with a MapGenie egg point."""
    survey = json.loads(SURVEY.read_text(encoding="utf-8"))
    entries = []
    for row in survey["objects"]:
        if row["prefab"] not in EGG_GIMMICK_KEYS or "mapGenieName" not in row:
            continue
        entries.append({
            "name": "Wyvern Egg" if "wyvern" in row["prefab"] else "Kuku Bird Egg",
            "prefab": row["prefab"],
            "gimmickKey": EGG_GIMMICK_KEYS[row["prefab"]],
            "uuid": row["uuid"],
            "level": row["level"],
            "gamePosition": row["gamePosition"],
            "region": row.get("mapGenieRegion"),
            "mapGenieId": row["mapGenieId"],
            "mapGenieDistance": row["mapGenieDistance"],
        })
    entries.sort(key=lambda e: (e["name"], e["gamePosition"]))
    if len(entries) != 10 or len({tuple(e["uuid"]) for e in entries}) != 10:
        raise ValueError(f"Expected 10 distinct eggs, found {len(entries)}")
    return entries


def main():
    """Write the data files."""
    cores = sanctum_cores()
    (ROOT / "data" / "sanctum-core-links.json").write_text(json.dumps({
        "version": 1,
        "category": "Sanctum Core (Kuku Pot Item)",
        "doneRule": "QuestSaveData._missionStateList record for missionKey (Witch mission) with _state 5 = cleansed = done; "
                    "a record at another state = not done; no record = unknown; missionKey 0 = no save rule, never hidden",
        "nativeIcon": {"type": 376, "templateType": 29100, "templateName": "MapIcon_Gimmick_KuKu_Battery",
                       "category": "0xffffffff"},
        "locations": cores,
    }, indent=2) + "\n", encoding="utf-8")
    items = kuku_items()
    (ROOT / "data" / "kuku-pot-item-links.json").write_text(json.dumps({
        "version": 1,
        "category": "Kuku Pot Item (Abyss Cell No. 1, Power Cores, Aeserion Scales)",
        "doneRule": "FieldSaveData._fieldGimmickSaveDataList record with origin = uuid, _gimmickInfoKey = gimmickKey, "
                    "reason 1 or 2, reset never, own uuid in the disabled list = taken; any other record = unknown; "
                    "no record = not taken",
        "nativeIcon": {"type": 376, "templateType": 29100, "templateName": "MapIcon_Gimmick_KuKu_Battery",
                       "category": "0xffffffff"},
        "locations": items,
    }, indent=2) + "\n", encoding="utf-8")
    egg_entries = eggs()
    (ROOT / "data" / "egg-links.json").write_text(json.dumps({
        "version": 1,
        "category": "Egg (Kuku Bird Egg, Wyvern Egg)",
        "doneRule": "FieldSaveData._fieldGimmickSaveDataList record with origin = uuid, _gimmickInfoKey = gimmickKey, "
                    "reason 1, reset never, own uuid in the disabled list = taken; any other record = unknown; "
                    "no record = not taken. Matched by UUID alone: _ownerLevelName is the parent sector, not the sub-level.",
        "nativeIcon": {"type": 376, "templateType": 29100, "templateName": "MapIcon_Gimmick_KuKu_Battery",
                       "category": "0xffffffff",
                       "note": "the game's own egg icon (type 394 MapIcon_Gimmick_Map_Egg) has a minimap layout only, "
                               "no world-map layout, so the Kuku battery icon is used"},
        "locations": egg_entries,
    }, indent=2) + "\n", encoding="utf-8")
    print(f"{len(cores)} Sanctum Cores ({sum(1 for c in cores if c['missionKey'] == 0)} never hidden), "
          f"{len(items)} Kuku Pot items")


if __name__ == "__main__":
    main()
