"""Work out which treasure chests only exist after quest progress, and why.

What it does:
    Pywel Atlas puts a marker on every chest the player has not opened yet.
    Some chests sit in levels that the game only loads at certain points of a
    quest, so a marker there could point at nothing. This script finds the
    game's own rule for each chest, from game data only.

    1. Reads the game's "game level" table (levelinfo). Each row is a small
       state machine: a list of phases, each with a condition (a key into
       conditioninfo, which holds the condition as text, for example
       "CompleteMission(Mission_Intro_Abyss_Tutorial)") and the levels that
       phase loads. Levels are named by a 32-bit hash of their CamelCase name.
    2. Names those hashes from the level-name table (fieldlevelnametableinfo).
    3. For every chest in research/analysis/chest-gate-classification.json,
       looks for its level, or one of its parent groups, in a phase. That is a
       "game level phase" gate: the chest exists only while that phase is the
       active one.
    4. Chests in quest, mission or faction-node levels (the GameDataLevel
       branch of the level tree) have no row in levelinfo. For those it names
       the owner: the mission, quest or faction node whose name equals the
       level or a parent group, plus missions, quests and stages whose names
       share the level's stem (candidates only).
    5. Optionally reads save copies and evaluates each phase condition from
       the save's quest and mission records. Terms the save cannot
       answer (region, field, character, game-play variables) stay unknown.

Key terms:
    phase - one state of a game level, for example "before the chapel is
        built" and "after". Only one phase of a game level is active.
    stem - a level name without suffixes like _Gimmick, _Start or _Child2.
    Kleene logic - true/false/unknown logic: "unknown and false" is false,
        "unknown and true" stays unknown.

Reads:  research/vendor/work/staticinfo/ (levelinfo, conditioninfo,
        fieldlevelnametableinfo, missioninfo, questinfo, stageinfo,
        factionnode); research/analysis/chest-gate-classification.json;
        optional save copies given on the command line (never the game's save
        folder; the script refuses paths inside it).
Writes: research/analysis/chest-level-gates.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/decode_level_gates.py [copy.save ...]
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import re
import struct
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
STATIC = VENDOR / "work" / "staticinfo"
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from pycrimson._crypto import calculate_checksum  # noqa: E402

# Tables whose header uses a 4-byte row count (same list as classify_chest_gates.py).
FOUR_BYTE_COUNT = {"questinfo", "stageinfo", "levelgimmicksceneobjectinfo",
                   "fieldlevelnametableinfo", "levelinfo", "gameplaytrigger"}
# Level-tree groups that say nothing about an owner.
GENERIC_GROUPS = {"rootlevel", "gamedatalevel", "faction", "main", "contents",
                  "content_level", "abyss"}
# Mission and quest states seen in save copies: 5 has a completion time.
STATE_COMPLETED = 5
# A row ends in text, then the 0x00 that ends it; conditions also end in ", parserType:N".
PARSER_SUFFIX = re.compile(r",\s*parserType:\d+$")


def load_table(name):
    """Return {row key: row bytes} for one extracted static table."""
    header = (STATIC / f"{name}.staticinfoheader").read_bytes()
    body = (STATIC / f"{name}.staticinfobody").read_bytes()
    count_size = 4 if name in FOUR_BYTE_COUNT else 2
    count = int.from_bytes(header[:count_size], "little")
    key_size = (len(header) - count_size - 4 * count) // count

    # The header lists (key, body offset); a row ends where the next one starts.
    rows = []
    position = count_size
    for _ in range(count):
        key = int.from_bytes(header[position:position + key_size], "little")
        offset = struct.unpack_from("<I", header, position + key_size)[0]
        rows.append((key, offset))
        position += key_size + 4
    ends = sorted(offset for _, offset in rows) + [len(body)]
    next_offset = {ends[i]: ends[i + 1] for i in range(len(ends) - 1)}
    return {key: body[offset:next_offset[offset]] for key, offset in rows}


def row_name(row):
    """Return the name that starts a row (key, u32 length, text), or None."""
    if len(row) < 8:
        return None
    length = struct.unpack_from("<I", row, 4)[0]
    if not 0 < length < 300:
        return None
    return row[8:8 + length].decode("ascii", "replace")


def named_rows(name):
    """Return {row name: key} for a table whose rows start with their name."""
    names = {}
    for key, row in load_table(name).items():
        text = row_name(row)
        if text:
            names[text] = key
    return names


def level_names():
    """Return {hash: CamelCase level name} from the level-name table."""
    data = (STATIC / "fieldlevelnametableinfo.staticinfobody").read_bytes()
    names = {match.decode() for match in re.findall(rb"[A-Za-z0-9][A-Za-z0-9_\-]{2,}", data)}
    return {calculate_checksum(name): name for name in names}


def read_game_levels(hash_to_level, conditions):
    """Decode levelinfo into game levels, each with its phases.

    Row layout (checked on all 269 rows; 266 decode cleanly): key, name,
    0x00, u32 default-phase hash, u16, u32 phase count, then per phase:
    u32 phase-name hash, u32 condition key (0 = none), u32 (often a game
    level key), u32 level count, that many u32 level hashes, u32, u8 flag.
    """
    game_levels = {}
    for key, row in load_table("levelinfo").items():
        name = row_name(row)
        position = 8 + len(name) + 1 + 6
        try:
            count = struct.unpack_from("<I", row, position)[0]
            position += 4
            phases = []
            for index in range(count):
                phase_hash, condition_key, extra = struct.unpack_from("<3I", row, position)
                position += 12
                level_count = struct.unpack_from("<I", row, position)[0]
                position += 4
                hashes = struct.unpack_from(f"<{level_count}I", row, position)
                position += 4 * level_count + 4 + 1
                phases.append({
                    "index": index,
                    "phaseHash": phase_hash,
                    "conditionKey": condition_key,
                    "condition": conditions.get(condition_key),
                    "levels": [hash_to_level.get(h, hex(h)) for h in hashes],
                })
        except struct.error:
            # Three rows use a longer layout; none of them names a chest level.
            continue
        game_levels[name] = {"key": key, "phases": phases}
    return game_levels


def condition_texts():
    """Return {condition key: expression} from conditioninfo, without the parser suffix."""
    texts = {}
    for key, row in load_table("conditioninfo").items():
        text = row_name(row)
        if text:
            texts[key] = PARSER_SUFFIX.sub("", text)
    return texts


def level_stem(level):
    """Return the level name without trailing helper parts (_Gimmick, _Start, _ChildN, _Item)."""
    stem = level
    while True:
        shorter = re.sub(r"_(Gimmick|Start|Child\d*|Item|All|Normal)$", "", stem, flags=re.IGNORECASE)
        if shorter == stem:
            return stem
        stem = shorter


def owner_links(chain, missions, quests, nodes, stages):
    """Name the mission/quest/faction node owning a GameDataLevel chest level.

    Exact: a row whose name equals the level or a parent group. Candidates:
    rows whose name contains the level's stem (inference only).
    """
    exact, candidates = [], []
    lowered = {
        "mission": {name.lower(): (name, key) for name, key in missions.items()},
        "quest": {name.lower(): (name, key) for name, key in quests.items()},
        "factionNode": {name.lower(): (name, key) for name, key in nodes.items()},
    }
    for group in chain:
        if group.lower() in GENERIC_GROUPS:
            continue
        for kind, table in lowered.items():
            if group.lower() in table:
                name, key = table[group.lower()]
                exact.append({"kind": kind, "name": name, "key": key, "level": group})

    # Candidates from the level's own stem, for example
    # SplitHorn_Boss_Ibano_Start_Child2_Gimmick -> SplitHorn_Boss_Ibano.
    stem = level_stem(chain[0]).lower()
    stem = re.sub(r"^(mission|quest)_", "", stem)
    if len(stem) >= 12:
        for kind, table in (("mission", missions), ("quest", quests), ("stage", stages)):
            for name, key in table.items():
                lowered_name = name.lower()
                if stem in lowered_name and not re.search(r"_\d+$", name):
                    candidates.append({"kind": kind, "name": name, "key": key})
    return exact, candidates[:20]


# ---------------------------------------------------------------- save checks

def load_save_facts(path, missions, quests):
    """Read one save copy (read-only) and return the records conditions need."""
    if "pearl abyss" in str(Path(path).resolve()).lower():
        raise SystemExit("Refusing to read inside the game's save folder; copy the file first.")
    from bier.EndianedBinaryIO import EndianedBytesIO
    from pycrimson._files import SaveFile
    from pycrimson._reflection import ReflectionParser

    objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(Path(path)))).objects
    facts = {"missions": {}, "quests": {}}
    for item in objects:
        kind = item.get("__pycr_type__")
        if kind == "QuestSaveData":
            facts["missions"] = {m["_key"]: m.get("_state") for m in item["_missionStateList"]}
            facts["quests"] = {q["_questKey"]: q.get("_state") for q in item["_questStateList"]}
    facts["missionKeys"] = missions
    facts["questKeys"] = quests
    return facts


def term_value(function, argument, facts):
    """Answer one condition term from save records: True, False or None (unknown)."""
    missions, quests = facts["missions"], facts["quests"]
    mission_key = facts["missionKeys"].get(argument)
    quest_key = facts["questKeys"].get(argument)
    if function == "CompleteMission" and mission_key is not None:
        return missions.get(mission_key) == STATE_COMPLETED
    if function == "CompleteSubMission":
        # A sub-mission is its own mission row named <mission>_<index>.
        name, _, index = argument.partition(",")
        sub_key = facts["missionKeys"].get(f"{name.strip()}_{index.strip()}")
        if sub_key is not None:
            return missions.get(sub_key) == STATE_COMPLETED
        return None
    if function == "CompleteQuest" and quest_key is not None:
        return quests.get(quest_key) == STATE_COMPLETED
    if function == "StartQuest" and quest_key is not None:
        # Any state record with a start counts; 1 looks like "listed, not started".
        return quests.get(quest_key) not in (None, 1)
    if function == "PlayingQuest" and quest_key is not None:
        return quests.get(quest_key) not in (None, 1, STATE_COMPLETED)
    return None


def evaluate(expression, facts):
    """Evaluate a condition with Kleene logic; terms the save cannot answer are None."""
    tokens = re.findall(r"&&|\|\||!|\(|\)|[A-Za-z_][A-Za-z0-9_]*\([^()]*\)", expression)
    position = 0

    def parse_or():
        nonlocal position
        value = parse_and()
        while position < len(tokens) and tokens[position] == "||":
            position += 1
            right = parse_and()
            value = True if value is True or right is True else (None if None in (value, right) else False)
        return value

    def parse_and():
        nonlocal position
        value = parse_not()
        while position < len(tokens) and tokens[position] == "&&":
            position += 1
            right = parse_not()
            value = False if value is False or right is False else (None if None in (value, right) else True)
        return value

    def parse_not():
        nonlocal position
        if tokens[position] == "!":
            position += 1
            value = parse_not()
            return None if value is None else not value
        if tokens[position] == "(":
            position += 1
            value = parse_or()
            position += 1  # the closing ")"
            return value
        function, argument = re.match(r"(\w+)\((.*)\)", tokens[position]).groups()
        position += 1
        return term_value(function, argument.strip(), facts)

    try:
        return parse_or()
    except (IndexError, AttributeError):
        return None


def term_values(expression, facts):
    """List every term of a condition with its save answer, for terms evaluate() leaves unknown."""
    terms = []
    for function, argument in re.findall(r"(\w+)\(([^()]*)\)", expression):
        terms.append({"term": f"{function}({argument})",
                      "value": term_value(function, argument.strip(), facts)})
    return terms


# ---------------------------------------------------------------- main

def main():
    """Classify every chest by the rule that loads its level, and write the report."""
    conditions = condition_texts()
    hash_to_level = level_names()
    game_levels = read_game_levels(hash_to_level, conditions)
    missions = named_rows("missioninfo")
    quests = named_rows("questinfo")
    nodes = named_rows("factionnode")
    stages = named_rows("stageinfo")
    known_levels = {name.lower() for name in hash_to_level.values()}

    # Which game-level phases load each level (lower case, as the level tree).
    phases_by_level = {}
    for game_level, data in game_levels.items():
        for phase in data["phases"]:
            for level in phase["levels"]:
                phases_by_level.setdefault(level.lower(), []).append((game_level, phase))

    saves = []
    for path in sys.argv[1:]:
        saves.append((Path(path).name, load_save_facts(path, missions, quests)))

    classification = json.loads((ROOT / "research" / "analysis" / "chest-gate-classification.json")
                                .read_text(encoding="utf-8"))
    entries = []
    sources = [("placed", chest) for chest in classification["chests"]]
    placed = {tuple(chest["uuid"][:3]) for chest in classification["chests"]}
    # TreasureBox objects missed by the placement scan (none since 2026-10-22, kept for safety).
    sources += [("gameList", box) for box in classification["treasureBoxObjects"]
                if tuple(box["uuid"][:3]) not in placed]

    for source, chest in sources:
        level = chest["level"]
        chain = chest.get("levelChain") or chest.get("chain") or [level]
        if chain[0].lower() != level.lower():
            chain = [level] + chain
        entry = {
            "uuid": chest["uuid"],
            "prefab": chest.get("prefab"),
            "level": level,
            "levelChain": chain,
            "oldGateClass": chest.get("gateClass"),
            "gimmickTypes": chest.get("gimmickTypes") or [chest.get("type")],
            "mapGenieId": chest.get("mapGenieId"),
            "source": source,
        }

        # 1. Game-level phases that load this level or a parent group.
        phase_gates = []
        for group in chain:
            for game_level, phase in phases_by_level.get(group.lower(), []):
                all_phases = game_levels[game_level]["phases"]
                phase_gates.append({
                    "gameLevel": game_level,
                    "viaGroup": group,
                    "phase": phase["index"],
                    "condition": phase["condition"],
                    "otherPhases": [{"phase": p["index"], "condition": p["condition"],
                                     "levels": p["levels"]} for p in all_phases if p is not phase],
                })

        # 2. Owner of a GameDataLevel quest/mission/node level.
        exact, candidates = owner_links(chain, missions, quests, nodes, stages)
        lowered_chain = [name.lower() for name in chain]

        if phase_gates:
            entry["gate"] = "game-level-phase"
            entry["phaseGates"] = phase_gates
        elif level.lower() not in known_levels and entry["oldGateClass"] == "not-in-level-tree":
            # Neither the level tree nor the level-name table knows this level.
            entry["gate"] = "level-not-in-game-tables"
        elif "contents" in lowered_chain or entry["oldGateClass"] == "terrain":
            entry["gate"] = "none-found"
        elif "faction" in lowered_chain or "main" in lowered_chain:
            entry["gate"] = "quest-data-level"
        else:
            entry["gate"] = "none-found"
        if exact or (entry["gate"] == "quest-data-level" and candidates):
            entry["owners"] = exact
            entry["ownerCandidates"] = candidates

        # 3. Save checks: is each phase condition true in each copy?
        for save_name, facts in saves:
            results = {}
            for gate in entry.get("phaseGates", []):
                label = f"{gate['gameLevel']}#{gate['phase']}"
                if not gate["condition"]:
                    results[label] = "default"
                    continue
                results[label] = evaluate(gate["condition"], facts)
                # Region or field terms make the whole answer unknown; keep the parts.
                results[label + ":terms"] = term_values(gate["condition"], facts)
            for owner in entry.get("owners", []):
                states = facts["missions"] if owner["kind"] == "mission" else facts["quests"]
                if owner["kind"] != "factionNode":
                    results[f"{owner['kind']}:{owner['name']}"] = states.get(owner["key"])
            entry.setdefault("saves", {})[save_name] = results
        entries.append(entry)

    summary = {
        "chests": len(entries),
        "byGate": dict(Counter(e["gate"] for e in entries).most_common()),
        "byGateWithTreasureBoxRecord": dict(Counter(
            e["gate"] for e in entries if 1000007 in (e["gimmickTypes"] or [])).most_common()),
        "gameLevelsDecoded": len(game_levels),
        "phaseGatedLevels": sorted({e["level"] for e in entries if e["gate"] == "game-level-phase"}),
        "questDataLevels": sorted({e["level"] for e in entries if e["gate"] == "quest-data-level"}),
        "levelsNotInGameTables": sorted({e["level"] for e in entries
                                         if e["gate"] == "level-not-in-game-tables"}),
    }
    output = {"summary": summary, "gameLevels": game_levels, "chests": entries}
    (ROOT / "research" / "analysis" / "chest-level-gates.json").write_text(
        json.dumps(output, indent=1) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
