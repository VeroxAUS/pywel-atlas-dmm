"""Build the mission graph from the exactly-parsed missioninfo rows and test it on the saves.

What it does:
    Uses mission_parser.parse_mission() (all 6864 rows decode exactly) and these fields:
        key188      - parent mission (the row is a sub-mission of it)
        keyList18   - child sub-missions
        items38     - missions started when this one completes ("next" links); an
                      optional condition key (key2) says when the next one may start
        blk_b8.k4   - the mission's START condition (a conditioninfo key)
    Condition text is parsed into an AND/OR/NOT tree and evaluated with three-valued
    logic (true / false / unknown) against each save at the moment the mission was
    completed. A real start condition must never be FALSE then.
Reads:  staticinfo tables, mission_parser.py, three saves in late-saves/.
Writes: mission-graph.json, mission-graph-validation.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/mission_graph.py
"""
import json
import re
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
sys.path.insert(0, str(HERE))
for sub in ("pycrimson/src", "bier-src"):
    sys.path.insert(0, str(ROOT / "research" / "vendor" / sub))
import decode_level_gates as gates  # noqa: E402
import mission_parser as parser  # noqa: E402
from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._files import SaveFile  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

mission_rows = gates.load_table("missioninfo")
quest_rows = gates.load_table("questinfo")
conditions = gates.condition_texts()
mission_names = {k: gates.row_name(r) or "" for k, r in mission_rows.items()}
quest_names = {k: gates.row_name(r) or "" for k, r in quest_rows.items()}
mission_by_name = {n: k for k, n in mission_names.items()}
quest_by_name = {n: k for k, n in quest_names.items()}

# ---- saves: completion times for missions ('m', key) and quests ('q', key)
times = []
for folder in ("2106", "2796", "3268"):
    path = ROOT / "research" / "vendor" / "work" / "late-saves" / folder / "save.save"
    objects = ReflectionParser(EndianedBytesIO(SaveFile.from_encrypted_file(path))).objects
    data = next(o for o in objects if o.get("__pycr_type__") == "QuestSaveData")
    t = {("m", r["_key"]): r["_completedTime"] for r in data["_missionStateList"]
         if r.get("_state") == 5 and r.get("_completedTime")}
    t.update({("q", r["_questKey"]): r["_completedTime"] for r in data["_questStateList"]
              if r.get("_state") == 5 and r.get("_completedTime")})
    times.append(t)

# Children of each mission in the order the game stores them: CompleteSubMission(M, i)
# refers to the i-th child in this list (not necessarily the row named M_i).
children_of = {}
for _key, _row in mission_rows.items():
    children_of[_key] = parser.parse_mission(_row)[0]["keyList18"]

# ---- condition text -> boolean tree evaluation (Kleene logic)
TOKEN = re.compile(r"&&|\|\||!|\(|\)|[A-Za-z_][A-Za-z0-9_]*\([^()]*\)|[^\s()!&|]+")
TERM = re.compile(r"(\w+)\((.*)\)$")
KNOWN = {"CompleteMission", "CompleteSubMission", "CompleteQuest"}


def term_ref(token):
    """Return ('m'|'q', key) for a Complete* term that names a real row, else None."""
    match = TERM.match(token)
    if not match:
        return None
    function, argument = match.group(1), match.group(2).strip()
    if function == "CompleteMission" and argument in mission_by_name:
        return ("m", mission_by_name[argument])
    if function == "CompleteSubMission":
        name, _, index = argument.partition(",")
        parent = mission_by_name.get(name.strip())
        kids = children_of.get(parent, [])
        position = int(index.strip()) if index.strip().isdigit() else -1
        if 0 <= position < len(kids):
            return ("m", kids[position])
        child = mission_by_name.get(f"{name.strip()}_{index.strip()}")
        return ("m", child) if child is not None else None
    if function == "CompleteQuest" and argument in quest_by_name:
        return ("q", quest_by_name[argument])
    return None


def evaluate(text, done):
    """Evaluate a condition; terms other than Complete* are unknown (None)."""
    tokens = TOKEN.findall(text)
    pos = [0]

    def peek():
        return tokens[pos[0]] if pos[0] < len(tokens) else None

    def parse_or():
        value = parse_and()
        while peek() == "||":
            pos[0] += 1
            right = parse_and()
            value = True if (value is True or right is True) else \
                (None if (value is None or right is None) else False)
        return value

    def parse_and():
        value = parse_not()
        while peek() == "&&":
            pos[0] += 1
            right = parse_not()
            value = False if (value is False or right is False) else \
                (None if (value is None or right is None) else True)
        return value

    def parse_not():
        token = peek()
        if token == "!":
            pos[0] += 1
            value = parse_not()
            return None if value is None else (not value)
        if token == "(":
            pos[0] += 1
            value = parse_or()
            if peek() == ")":
                pos[0] += 1
            return value
        pos[0] += 1
        ref = term_ref(token) if token else None
        return None if ref is None else (ref in done)

    try:
        return parse_or()
    except Exception:  # noqa: BLE001 - malformed condition text stays unknown
        return None


def prereq_refs(text):
    """Positive (non-negated) Complete* references in a condition text."""
    refs = []
    for match in re.finditer(r"(!?)\s*(\w+\([^()]*\))", text):
        if match.group(1):
            continue
        ref = term_ref(match.group(2))
        if ref:
            refs.append(ref)
    return refs


# ---- decode every mission
graph = {}
for key, row in mission_rows.items():
    m, _ = parser.parse_mission(row)
    start_key = m["blk_b8"]["k4"]
    graph[key] = {
        "name": mission_names[key],
        "parent": m["key188"] if m["key188"] in mission_names else None,
        "children": [c for c in m["keyList18"] if c in mission_names],
        "next": [{"mission": e["key"], "condition": conditions.get(e["key2"])}
                 for e in m["items38"] if e["key"] in mission_names],
        "startCondition": conditions.get(start_key),
        "stages": [e["key"] for e in m["list28"]],
        "questGaugeLike": m["keyList90"],
    }

# ---- validation
report = {"missions": len(graph)}
report["withParent"] = sum(1 for g in graph.values() if g["parent"] is not None)
report["withChildren"] = sum(1 for g in graph.values() if g["children"])
report["withNextLinks"] = sum(1 for g in graph.values() if g["next"])
report["nextLinks"] = sum(len(g["next"]) for g in graph.values())
report["withStartCondition"] = sum(1 for g in graph.values() if g["startCondition"])

# (1) start conditions evaluated at each save's completion time
start = Counter()
violations = []
for key, g in graph.items():
    text = g["startCondition"]
    if not text:
        continue
    refs = prereq_refs(text)
    if refs:
        start["startConditionsWithCompleteTerms"] += 1
    for index, t in enumerate(times):
        completed_at = t.get(("m", key))
        if completed_at is None:
            continue
        done = {x for x, v in t.items() if v <= completed_at and x != ("m", key)}
        verdict = evaluate(text, done)
        start[{True: "true", False: "FALSE", None: "unknown"}[verdict]] += 1
        if verdict is False and len(violations) < 12:
            violations.append({"mission": g["name"], "save": index, "condition": text[:120]})
report["startConditionEval"] = dict(start)
report["startConditionViolationsSample"] = violations

# (2) 'next' links: successor should be completed no earlier than its predecessor
nxt = Counter()
for key, g in graph.items():
    for link in g["next"]:
        for t in times:
            a, b = t.get(("m", key)), t.get(("m", link["mission"]))
            if a is None or b is None:
                nxt["notBothTimed"] += 1
            else:
                nxt["predFirst" if a <= b else "predAfter"] += 1
report["nextLinkOrderInSaves"] = dict(nxt)

# (3) parent/child sanity: parent completes at/after its last child
pc = Counter()
for key, g in graph.items():
    for child in g["children"]:
        for t in times:
            a, b = t.get(("m", key)), t.get(("m", child))
            if a is None or b is None:
                continue
            pc["parentAfterChild" if a >= b else "parentBeforeChild"] += 1
report["parentVsChildOrder"] = dict(pc)

(HERE / "mission-graph.json").write_text(
    json.dumps({mission_names[k]: {kk: vv for kk, vv in g.items() if kk != "name"}
                for k, g in graph.items()}, indent=1, ensure_ascii=False, default=str),
    encoding="utf-8")
(HERE / "mission-graph-validation.json").write_text(
    json.dumps(report, indent=1, ensure_ascii=False), encoding="utf-8")
print(json.dumps(report, indent=1, ensure_ascii=False))
