"""Add each Abyss chest's quest gate to data/abyss-chest-links.json.

What it does:
    Some chests only exist after quest progress: the game loads their level
    only in a certain phase of a "game level" (see decode_level_gates.py and
    research/analysis/chest-level-gates.json). For the Abyss chests that
    phase's condition contains one term the save can answer:
      - CompleteMission(<mission>)  -> {"kind": "missionCompleted", "key": <mission key>}
      - CompleteQuest(<quest>)      -> {"kind": "questCompleted", "key": <quest key>}
    "Completed" means the mission's or quest's save record (QuestSaveData) has
    state 5 (the state that has a completion time).

    The other terms in those conditions are not existence gates:
      - IsInRegion / CheckCharacterKey only stream the Abyss in while the
        player is there (research/analysis/quest-gated-chests.md);
      - a phase whose condition has no save-answerable term at all (the
        "CheckField(RematchField)" rematch phase) is a special replay mode and
        is left out.
    Any other term (for example StartQuest or CompleteSubMission, which the
    mod cannot check yet) stops the script, and so does a chest whose phases
    disagree on the gate. The script writes {"needs": [...]} as "gate" on
    each Abyss chest row and checks the expected counts: 53 chests behind
    Mission_Intro_Abyss_Tutorial and 21 behind Quest_Caliburn_Boss_MusketSiege.

Reads:  data/abyss-chest-links.json; research/analysis/chest-level-gates.json;
        research/vendor/work/staticinfo/ (missioninfo, questinfo)
Writes: data/abyss-chest-links.json (the "gate" field of each row; nothing else changes)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_chest_gates.py
"""
import json
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(Path(__file__).resolve().parent))

from decode_level_gates import named_rows  # noqa: E402

# Condition terms the save can answer, as gate kinds, and the table holding
# the named mission or quest.
SAVE_TERMS = {"CompleteMission": ("missionCompleted", "missioninfo"),
              "CompleteQuest": ("questCompleted", "questinfo")}
# Terms that only decide streaming, not whether the chest exists.
STREAMING_TERMS = {"IsInRegion", "CheckCharacterKey"}
# A term with no save answer that marks a whole phase as a replay mode.
REPLAY_TERMS = {"CheckField"}
# Expected result (checked): gate name -> number of chests.
EXPECTED = {"missionCompleted:Mission_Intro_Abyss_Tutorial": 53,
            "questCompleted:Quest_Caliburn_Boss_MusketSiege": 21}


def condition_terms(condition):
    """Return [(function, argument)] for every term of a condition text."""
    return re.findall(r"([A-Za-z_][A-Za-z0-9_]*)\(([^()]*)\)", condition)


def phase_needs(condition, keys):
    """Return the save-answerable needs of one phase condition, or None for a replay phase.

    Stops the script on a term it does not know.
    """
    needs = []
    replay = False
    for function, argument in condition_terms(condition):
        if function in SAVE_TERMS:
            kind, table = SAVE_TERMS[function]
            key = keys[table].get(argument.strip())
            if key is None:
                raise SystemExit(f"No {table} row named {argument!r}")
            needs.append({"kind": kind, "key": key, "name": argument.strip()})
        elif function in REPLAY_TERMS:
            replay = True
        elif function not in STREAMING_TERMS:
            raise SystemExit(f"Unknown condition term {function}({argument}) in {condition!r}")
    if not needs:
        if not replay:
            raise SystemExit(f"Phase condition without a save term: {condition!r}")
        return None
    return needs


def main():
    """Work out each Abyss chest's gate and write it into the data file."""
    path = ROOT / "data" / "abyss-chest-links.json"
    data = json.loads(path.read_text(encoding="utf-8"))
    gates = {tuple(row["uuid"]): row for row in json.loads(
        (ROOT / "research" / "analysis" / "chest-level-gates.json").read_text(encoding="utf-8"))["chests"]}
    keys = {table: named_rows(table) for _, table in SAVE_TERMS.values()}

    counts = Counter()
    for chest in data["locations"]:
        gate_row = gates.get(tuple(chest["uuid"]))
        if gate_row is None or gate_row.get("gate") != "game-level-phase":
            raise SystemExit(f"{chest['name']}: no game-level-phase gate in chest-level-gates.json")
        choices = []
        for phase in gate_row["phaseGates"]:
            needs = phase_needs(phase["condition"], keys)
            if needs is not None and needs not in choices:
                choices.append(needs)
        if len(choices) != 1 or len(choices[0]) != 1:
            raise SystemExit(f"{chest['name']}: phases disagree or need several terms: {choices}")
        need = choices[0][0]
        chest["gate"] = {"needs": [{"kind": need["kind"], "key": need["key"]}], "name": need["name"]}
        counts[f"{need['kind']}:{need['name']}"] += 1

    if dict(counts) != EXPECTED:
        raise SystemExit(f"Unexpected gate counts {dict(counts)}; expected {EXPECTED}")
    path.write_text(json.dumps(data, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(dict(counts)))


if __name__ == "__main__":
    main()
