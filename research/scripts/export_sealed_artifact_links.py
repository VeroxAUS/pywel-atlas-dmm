"""Write the list of Sealed Abyss Artifacts the mod is built from (v0.88).

What it does:
    Uses find_sealed_artifacts.py to take the 141 objects of landmark type
    1000002 ("challenge_sealed_artifact") with their exact level-file
    positions (artifact 0023 sits inside another object; its position is
    worked out from that parent) and their MapGenie pairing, then writes a
    small, stable data file: display name (the MapGenie name, e.g. "Shield of
    Unchanging Will I"), UUID, position, region, level, item and challenge.
    Stops with an error if the count is not 141 or an artifact has no
    MapGenie point.

Save rule (from the user's save copies and a before/after pair, 2026-10-24):
    picked up = FieldSaveData._fieldGimmickSaveDataList holds a record for
    this UUID with gimmick 1004255, reason 1, refill time "never", state
    2255254665, and the artifact's own UUID in
    _levelOrigin_disabledSceneObjectUuidList (removed from the world). The
    mod hides an artifact once it is picked up.

Challenge texts (v0.91 data, 2026-10-24):
    Each artifact's challenge is a mission (e.g. Challenge_SealedArtifact_
    Mastery_Shield_I) whose English name is in quest.paloc. Its steps are the
    missions <challenge>_1, _2, ... (the "_0" mission is the pick-up step);
    each step's text id leads to its English text in quest.paloc. The last
    step is always "Use the sealed Abyss artifact" and is left out. Links to
    game knowledge such as "{StaticInfo:Knowledge:Knowledge_Hp#Health}" are
    shown in game as their label after "#", so only that label is kept.
    Rewards are not in the extracted English text files; they come from the
    MapGenie point's description instead (marked as such in the file).

Reads:  what find_sealed_artifacts.py reads (game tables and level files),
        research/vendor/work/eng/quest.paloc, data/poi-data.js
Writes: data/sealed-artifact-links.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_sealed_artifact_links.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import re
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "scripts"))

import find_sealed_artifacts as survey  # noqa: E402
from find_greymane_shrines import read_table  # noqa: E402

# The last step of every challenge: unsealing, not part of the task.
USE_STEP = "Use the sealed Abyss artifact"


def read_paloc(path):
    """Return {text id: text} from one .paloc file.

    Entry: [8 bytes][u32 length][id digits][u32 length][UTF-8 text]. The id is
    taken as exactly `length` digits. (A text length whose low byte is an
    ASCII digit, 0x30-0x39, follows the id directly; a greedy digit match
    would swallow it, so the id is sliced by its length instead.)
    """
    data = path.read_bytes()
    texts = {}
    for match in re.finditer(rb"[\x05-\x18]\x00\x00\x00(?=\d)", data):
        start = match.end()
        digits = data[start:start + data[match.start()]]
        if not digits.isdigit() or start + len(digits) + 4 > len(data):
            continue
        length = struct.unpack_from("<I", data, start + len(digits))[0]
        if not 0 < length < 4096:
            continue
        try:
            text = data[start + len(digits) + 4:start + len(digits) + 4 + length].decode("utf-8")
        except UnicodeDecodeError:
            continue
        texts.setdefault(digits.decode(), text)
    return texts


def challenge_missions():
    """Return {mission name: [English texts of its text ids]} for the artifact challenges."""
    quest = read_paloc(ROOT / "research" / "vendor" / "work" / "eng" / "quest.paloc")
    missions = {}
    for _, entry in read_table("missioninfo"):
        name = re.search(rb"(Challenge_SealedArtifact_[A-Za-z_0-9]+)\x00", entry)
        if not name:
            continue
        ids = [entry[m.end():m.end() + entry[m.start()]].decode()
               for m in re.finditer(rb"[\x05-\x18]\x00\x00\x00(?=\d)", entry)
               if entry[m.end():m.end() + entry[m.start()]].isdigit()]
        missions[name.group(1).decode()] = [quest[i] for i in ids if i in quest]
    return missions


def clean(text):
    """Replace "{StaticInfo:Kind:Key#Label}" with its label; refuse other markup."""
    text = re.sub(r"\{Static[Ii]nfo:[^}#]*#([^}]*)\}", r"\1", text).strip()
    if re.search(r"[{}<>]", text):
        raise ValueError(f"Unhandled markup in challenge text: {text!r}")
    return text


def challenge(row, missions):
    """Return (display name, step texts) for one artifact's challenge."""
    name = missions.get(row["challenge"], [])
    steps = sorted((int(key.rsplit("_", 1)[1]), key) for key in missions
                   if re.fullmatch(re.escape(row["challenge"]) + r"_\d+", key) and not key.endswith("_0"))
    texts = [clean(text) for _, key in steps for text in missions[key] if text != USE_STEP]
    if len(name) != 1 or not texts:
        raise ValueError(f"{row['itemName']}: challenge {row['challenge']} has name {name} and steps {texts}")
    return clean(name[0]), texts


def mapgenie_rewards():
    """Return {MapGenie id: [reward lines]} from the MapGenie descriptions."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    rewards = {}
    for point in data["locations"]:
        part = (point.get("description") or "").split("**Reward:**", 1)
        if point.get("category") == survey.MAPGENIE_CATEGORY and len(part) == 2:
            rewards[point["id"]] = [line[2:].strip() for line in part[1].splitlines() if line.startswith("- ")]
    return rewards


def main():
    """Find and pair the artifacts, then write the data file."""
    rows = survey.find_artifacts()
    survey.pair_with_mapgenie(rows)
    unpaired = [row["itemName"] for row in rows if "mapGenieId" not in row]
    if unpaired:
        raise ValueError(f"Artifacts without a MapGenie point: {unpaired}")
    missions = challenge_missions()
    rewards = mapgenie_rewards()
    for row in rows:
        row["challengeName"], row["challengeSteps"] = challenge(row, missions)

    locations = [{
        "name": row["mapGenieName"],
        "uuid": row["uuid"],
        "gamePosition": row["gamePosition"],
        "region": row["region"],
        "level": row["level"].lower(),
        "itemName": row["itemName"],
        "challenge": row["challenge"],
        "mapGenieId": row["mapGenieId"],
        "mapGenieDistance": row["mapGenieDistance"],
        # v0.91 data: the challenge's game name and task (steps joined by "; ").
        "challengeName": row["challengeName"],
        "challengeText": "; ".join(row["challengeSteps"]),
        "challengeSteps": row["challengeSteps"],
        "challengeReward": rewards.get(row["mapGenieId"], []),
    } for row in rows]

    output = {
        "version": 1,
        "category": "Sealed Abyss Artifact (challenge_sealed_artifact)",
        "infoKey": survey.ARTIFACT_KEY,
        "gimmickInfoKey": survey.ARTIFACT_GIMMICK,
        "pickedUpRule": "FieldSaveData._fieldGimmickSaveDataList record for this UUID with gimmick 1004255, reason 1, "
                        "reset never, state 2255254665 and its own UUID in _levelOrigin_disabledSceneObjectUuidList",
        "challengeSources": "challengeName/challengeText/challengeSteps: the game's missioninfo and quest.paloc "
                            "(English); challengeReward: the MapGenie point's description",
        "nativeIcon": {"type": 187, "templateType": 28813, "templateName": "MapIcon_Gimmick_SealedArtifact",
                       "category": "0xffffffff"},
        "locations": locations,
    }
    (ROOT / "data" / "sealed-artifact-links.json").write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    print(f"{len(locations)} Sealed Abyss Artifacts written")


if __name__ == "__main__":
    main()
