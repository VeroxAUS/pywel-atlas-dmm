"""Build a draft "100% guide" skeleton from the survey JSON (read-only research).

What it does:
    1. Lists the main-story chapters (questgroupinfo 1000..1013) with their
       chapter quests, and adds the order of quest titles that ConsolePulse
       publishes for each chapter (hand-copied below) so gaps are visible.
    2. Groups faction/side quests and top-level side missions by region, using
       the region code in the row name (Her, Dem, Del, Kwe, Crim, ...).
    3. Tries to give each quest/mission a prerequisite list from conditioninfo.
       The row->condition link is not decoded, so a candidate link is accepted
       only when a u32 inside the row equals a condition key AND the condition
       text names the owner (a strong hint the condition belongs to it).
    4. Counts what is still unknown.

Reads:  survey JSON in this folder, research/vendor/work/staticinfo/.
Writes: draft-guide-skeleton.json (this folder).
Run:    research/vendor/.venv/Scripts/python.exe -B research/quest-order-survey/build_skeleton.py
"""
import json
import re
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "research" / "scripts"))
import decode_level_gates as gates  # noqa: E402

SAVE = "state:full-save/save.save"
TERM = re.compile(r"(\w+)\(([^()]*)\)")
PREREQ_FUNCTIONS = ("CompleteMission", "CompleteSubMission", "CompleteQuest",
                    "StartQuest", "PlayingQuest", "PlayingMission", "StartMission")

# Region codes in row names: guess and confidence. Only Her/Dem/Del are backed
# by castle names (HernandCastle, DemenissCastle, DelesyiaCastle).
REGIONS = {
    "Her": ("Hernand", "high"),
    "Dem": ("Demeniss", "high"),
    "Del": ("Delesyia", "high"),
    "Kwe": ("Kweiden (north: Vatnholl, Askelund, Steinnfell forts)", "medium"),
    "Crim": ("Crimson / eastern desert region (Howlsands, power station)", "low"),
    "Cal": ("Calphade", "low"),
    "Neut": ("Neutral / no region", "low"),
    "Tus": ("unknown", "none"),
}

# Chapter quest titles in journal order, from ConsolePulse (game version 2.01
# page; some entries there are sub-chapter headers). Counts are the page's own.
CONSOLEPULSE_CHAPTERS = {
    1000: ["Ambush", "Unfamiliar Lands", "In Ashes", "Unknown Space", "Realm of Uncertainty",
           "New Journey"],
    1001: ["Trials of Kindness", "Where Rumors Gather", "Mysterious Man",
           "True Wisdom in Kindness", "Actions Speak Louder than Words", "Heart Beyond Borders",
           "Mystical Key", "Polar Opposites", "Abyss Without Balance", "Woman in White"],
    1002: ["Unexpected Gift", "Where the Light Leads", "Memory Fragment", "Reunion",
           "Hernand in Chaos", "For Honor", "Awestruck", "Shadow Cast Over the River",
           "Where Misery Gathers", "Trial After Trial", "The Man Trapped in the Mire",
           "Missing Companion", "Secrets Hidden in the Dark", "The End of Greed",
           "The Dark Veil", "The Flames of Greed", "Kidnapped Healer",
           "Rebellion or Revolution", "Cheers Echoing From the Edge"],
    1003: ["Homestead", "Old Friend", "First Step to Rebuilding", "A Fresh Start",
           "Reward for Their Sweat", "Return of the Comrade", "Familiar Curses",
           "The Face Behind the Mask", "Return", "Traces in the Manor", "Nonhuman",
           "Seed of Unease", "Dance with the Devil", "Pioneering", "Hope After the Draught",
           "Scattered Comrades", "Rumors from the Sawmill", "A Gentle Touch", "Bustling Hill",
           "Greymanes Reunited"],
    1004: ["Mysterious Iron Pot", "Kilnden Workshop", "Kiln Repair at the Kilnden Workshop",
           "The Mysterious Pot", "The Iron Pot's Usage", "Daily Life", "Disturbance at the Arena",
           "Skilled in Archery", "Forbidden Knowledge", "The Words of Alustin", "Scholastone",
           "On the Right Path", "Gate to the Otherworld", "Spire of the Stars",
           "Obsession and Madness", "Casted Shadow"],
    1005: ["Uninvited Guest", "Double-sided Invitation", "Unwelcomed Guests",
           "Demenissian Delegation", "Exposed Plot", "Black and White", "The Missing Seal",
           "Crowcaller", "The Crow's Warning", "Bloodwind", "Secret at the Church",
           "Toward the Nest"],
    1006: ["Blazing Beacon", "News", "To the Battlefield", "The Counterattack",
           "Under the Banner Pike Again", "Cradle of Defense", "The Hand of Deliverance",
           "Fire on the Frontlines", "Turning Tides", "Fire Support", "In Ashes", "Hidden Fangs",
           "Reclamation", "The Undying Shields", "A Thousand Troops", "Traitor",
           "All Quiet on the Front", "News of Victory", "Return Home"],
    1007: ["Dawn Mist", "Ashes of Treachery", "Trust Lost", "Bared Fang", "Rekindled Hope",
           "Podium of Resolve", "Dawnrise", "Shadows Over Pailune", "Driving out the Shadows",
           "Lurking Wolves", "Reclamation", "Lonely Jackals", "Resolution", "Decisive Battle",
           "The Counterattack", "Unleashed Fury", "The Final Bridge", "Broken Claws",
           "Battle at Silverwolf Mountain", "Incomplete Victory", "Twisted Fate",
           "Ludvig's Whereabouts", "Time to Face Justice"],
    1008: ["Ashen Steps", "Healing Pailune", "A Bond", "Ritual Preparations",
           "Where the Wind Guides You", "To Demeniss", "Chasing a Shadow", "Blazing Fire",
           "Whispering Shadows", "Bloodied Invitation", "Resolve Amidst a Storm",
           "Preparations for Advance", "Rebel Suppression", "The Cursed Knight",
           "The Blood Coronation", "Traitor", "Clue", "A Fleeting Dream"],
    1009: ["The Calling", "An Unknown Voice", "Cloister of Enlightenment", "Shattered Ties",
           "Mark of the Scar", "Shackles of Fate", "Thinning Blade", "Crossing Point",
           "Unwavering Steps", "Six Pensive Statues and the Evil Spirit", "Morning Fog",
           "Jijeong Temple in Chaos", "Path to Enlightenment", "Path of the Disciple",
           "True Strength", "Face the Inner Self", "Veiled Witch", "Fragments of Darkness",
           "Pursuit Beyond the Veil", "Black Witch", "Enlightenment",
           "The Cloister of Enlightenment", "The Sage of the Desert", "New Perspectives",
           "Lust for Power"],
    1010: ["Secret Weapon", "Untouchable", "The Gate of War", "Master of the Ironworks",
           "Hidden Ace", "Clockwork Insect Clash", "Greater Firepower", "Beating Heart",
           "Invaders from the East", "Frozen Hearted Predator", "Lingering Shadow"],
    1011: ["Brave New World", "The City of Steel", "Crossroads", "Strange Manor",
           "Fortress Keys", "Truth and Lies", "Foreboding Shadow", "Master of a Forgotten Land",
           "Whispers in the Wind", "Cloud Castle Orbian"],
    1012: ["The Final Battle", "Precise Execution", "Deferred Advance", "Departure of the Brave",
           "Forbidden Gate", "The Void", "A Shadow in the Void", "Blinding Darkness"],
    1013: ["Journey's End", "A New Beginning", "Peace in Hernand", "The Unyielding Shields",
           "The Heart of Pywel", "The Enduring Flame", "Evolving City", "The Desert's Edge",
           "New Horizons"],
}


def region_of(name):
    """Return the region code in a row name, or the first content token."""
    parts = name.split("_")
    # Quest_Node_<Reg>_..., Mission_Node_<Reg>_..., Mission_Reoccupation_Node_<Reg>_...
    for index, part in enumerate(parts[:5]):
        if part == "Node" and index + 1 < len(parts):
            return parts[index + 1]
    if parts[:2] == ["Quest", "Faction"] and len(parts) > 2:
        return parts[2]
    if len(parts) > 1 and parts[1] in REGIONS:
        return parts[1]
    return parts[1] if len(parts) > 1 else None


def prerequisite_candidates(rows, names, conditions, owners):
    """Return {owner key: [condition text]} where the link is plausible.

    A u32 in the owner's row equals a quest-term condition key and the
    condition text names the owner's own stem.
    """
    quest_conditions = {k: t for k, t in conditions.items()
                        if any(f + "(" in t for f in PREREQ_FUNCTIONS)}
    found = defaultdict(list)
    for key in owners:
        row, name = rows[key], names[key]
        stem = re.sub(r"_\d+$", "", re.sub(r"^(Mission|Quest)_", "", name)).lower()
        if len(stem) < 8:
            continue
        for offset in range(8 + len(name) + 1, len(row) - 3):
            value = struct.unpack_from("<I", row, offset)[0]
            text = quest_conditions.get(value)
            if text and stem in text.lower() and text not in found[key]:
                found[key].append(text)
    return found


def prerequisites_from(text, owner_name):
    """Return the quest/mission names a condition asks for, excluding the owner."""
    wanted = []
    for function, argument in TERM.findall(text):
        if function in PREREQ_FUNCTIONS:
            target = argument.split(",")[0].strip()
            if target != owner_name and (function, target) not in wanted:
                wanted.append((function, target))
    return [{"function": f, "target": t} for f, t in wanted]


def main():
    """Assemble the skeleton and write it."""
    quests = json.loads((HERE / "quests.json").read_text(encoding="utf-8"))
    missions = json.loads((HERE / "missions.json").read_text(encoding="utf-8"))
    groups = json.loads((HERE / "groups.json").read_text(encoding="utf-8"))
    conditions = gates.condition_texts()
    quest_rows, mission_rows = gates.load_table("questinfo"), gates.load_table("missioninfo")
    quest_names = {q["key"]: q["name"] for q in quests}
    mission_names = {m["key"]: m["name"] for m in missions}

    top_missions = [m for m in missions if m["category"] == "mission" and not m["isSubMission"]]
    side_quests = [q for q in quests if q["category"] in ("faction-node", "faction")]
    quest_pre = prerequisite_candidates(quest_rows, quest_names, conditions,
                                        [q["key"] for q in quests if q["category"] not in
                                         ("system", "shop")])
    mission_pre = prerequisite_candidates(mission_rows, mission_names, conditions,
                                          [m["key"] for m in top_missions])

    def attach(entry, found, names):
        """Add the parsed prerequisites for one entry, when any candidate exists."""
        texts = found.get(entry["key"], [])
        entry["prerequisites"] = [
            {"condition": text, "requires": prerequisites_from(text, names[entry["key"]])}
            for text in texts]
        return bool(texts)

    # 1. main story
    chapters = []
    for group_key in range(1000, 1014):
        chapter_quests = sorted((q for q in quests if q["group"] == group_key),
                                key=lambda q: q["key"])
        with_pre = sum(attach(q, quest_pre, quest_names) for q in chapter_quests)
        chapters.append({
            "group": group_key,
            "name": groups[str(group_key)]["name"],
            "title": groups[str(group_key)]["title"],
            "questsInTables": [
                {k: q[k] for k in ("key", "name", "title", SAVE, "prerequisites")}
                for q in chapter_quests],
            "questsWithPrerequisite": with_pre,
            "journalOrderConsolePulse": CONSOLEPULSE_CHAPTERS[group_key],
            "journalEntriesNotInTables": len(CONSOLEPULSE_CHAPTERS[group_key])
            - len(chapter_quests),
        })

    # 2. regional side content
    regional = defaultdict(lambda: {"factionQuests": [], "sideMissions": []})
    for quest in side_quests:
        attach(quest, quest_pre, quest_names)
        regional[region_of(quest["name"])]["factionQuests"].append(
            {k: quest[k] for k in ("key", "name", "title", "category", SAVE, "prerequisites")})
    for mission in top_missions:
        attach(mission, mission_pre, mission_names)
        regional[region_of(mission["name"])]["sideMissions"].append(
            {k: mission[k] for k in ("key", "name", "title", SAVE, "prerequisites")})
    regions = []
    for code, data in sorted(regional.items(), key=lambda x: -len(x[1]["factionQuests"])
                             - len(x[1]["sideMissions"])):
        label, confidence = REGIONS.get(code, ("(content name, not a region code)", "n/a"))
        regions.append({"code": code, "region": label, "confidence": confidence,
                        "factionQuestCount": len(data["factionQuests"]),
                        "sideMissionCount": len(data["sideMissions"]), **data})

    everything = [q for c in chapters for q in c["questsInTables"]]
    everything += [q for r in regions for q in r["factionQuests"] + r["sideMissions"]]
    with_prereq = [e for e in everything if e["prerequisites"]]
    with_requirements = [e for e in with_prereq
                         if any(p["requires"] for p in e["prerequisites"])]
    summary = {
        "chapters": len(chapters),
        "chapterQuests": sum(len(c["questsInTables"]) for c in chapters),
        "factionQuests": len(side_quests),
        "topLevelSideMissions": len(top_missions),
        "regionGroups": len(regions),
        "entriesTotal": len(everything),
        "entriesWithCandidateCondition": len(with_prereq),
        "entriesWithAtLeastOneNamedPrerequisite": len(with_requirements),
        "journalEntriesNotInTables": sum(c["journalEntriesNotInTables"] for c in chapters),
        "regionCodeCounts": Counter({r["code"]: r["factionQuestCount"] + r["sideMissionCount"]
                                     for r in regions}).most_common(),
    }
    out = {"summary": summary, "chapters": chapters, "regions": regions}
    (HERE / "draft-guide-skeleton.json").write_text(
        json.dumps(out, indent=2, ensure_ascii=False, default=str), encoding="utf-8")
    print(json.dumps(summary, indent=1))
    for chapter in chapters:
        print(chapter["group"], chapter["name"], len(chapter["questsInTables"]), "tables vs",
              len(chapter["journalOrderConsolePulse"]), "journal;",
              chapter["questsWithPrerequisite"], "with prereq")


if __name__ == "__main__":
    main()
