# Quest order survey (read-only, 2026-10-27)

Script: `survey_quests.py` (same folder). Outputs: `counts.json`, `groups.json`,
`quests.json`, `missions.json`, `conditions-summary.json`,
`condition-quest-edges.json`, `owner-link-test.json`, `save-states.json`.
Nothing else in the repo was touched.

## Short answer

The tables DO hold order data, but the links from a quest/mission row to its
prerequisite condition are untyped numbers (every table shares the key range
1,000,000+, so a number alone does not say which table it points into). The
condition texts themselves are clean and parse well. A full dependency graph
needs the row field layout (Ghidra reflection of the loader) or a save-diff
experiment. Chapter order for the main story is available today.

## 1. Which fields give what

| Wanted | Where | Status |
|---|---|---|
| Name | first field of every row (key, length, text) | decoded |
| Localized title | 15-20 digit text id inside the row -> `quest.paloc` | decoded (see 4) |
| Main-story chapter / list | `questinfo` row: u16 at 13 bytes after the text id = `questgroupinfo` key | decoded, 1000-1013 = Prologue..Epilogue, in order |
| Type (main/side/faction) | questgroup + name prefix | heuristic (see 2) |
| Prerequisites / unlock | `conditioninfo` text: `CompleteMission(X)`, `CompleteSubMission(X,n)`, `CompleteQuest(X)`, `StartQuest`, `PlayingQuest`, `PlayingMission`, `QuestGaugePercent(G)<60`, `CheckFriendlyLevel`, `CheckKnowledge`, `GetFactionNodeState`... | texts decoded; row -> condition link NOT decoded |
| Sub-mission tree | mission rows hold u32 lists pointing at `<name>_0`, `_1`... rows (offsets 8/20 after the name; 28 of 111 `Mission_Dem_*`, 108 of 264 `Mission_Reoccupation*` show it) | partly seen |
| Region / location | no region field found. Name prefix (`Her`, `Dem`, `Del`, `Kwe`, `Crim`, `Tus`...) is the region code. `factionnode` rows hold float positions | name-prefix only |
| Recommended level | not found in either table | none |
| Rewards | not decoded (likely a drop-set or item key inside the row) | none |
| Sort order | only `questgroupinfo` key order (chapters) and the `_N` suffix of sub-missions. No explicit sort field found | partial |

## 2. Counts

Missions (`missioninfo`): 6864 rows, 5268 are numbered sub-mission rows (`_N`).
Mission: 3862 plain `Mission_*`; 605 faction-node (`Mission_Node_/Reoccupation/
Reconstruction/Invasion`); 1266 Abyss challenges; 616 Sealed Artifact
challenges; 315 other `Challenge_*`; 200 other (`Graymane_*`, `ShadowTemple_*`,
`Goblin_*`, `Shop_*`, `Func_*`...).

Quests (`questinfo`): 1098 rows. 41 main-chapter quests (group 1000-1013, 2 to
7 per chapter; Prologue 2, Chapter 9 has 7); 496 `Quest_Node_*` (faction
nodes, group 0); 43 `Quest_Faction_*`; 76 shop; 36 contents; 31 challenge; 39
other `Quest_*` side/story; 328 system rows (`LevelSequencerSpawn_*`, `cd_seq`,
`Schedule_*`, `ReBlockading`, `Func_*`) which are not player quests.
`questgroupinfo` has 42 groups (chapters, Exploration, Mastery, Combat,
Life, Minigame, Bounty, shops, schedules). Caveats: the group u16 is wrong for
some Sealed Artifact quest rows (values over 9999); main vs side classification
is from group plus name, so a few side quests that carry a chapter group are
counted as main.

## 3. Dependency graph attempt

- `conditioninfo`: 10798 conditions; 3106 contain a quest/mission term. Terms by
  function: CompleteMission 1518, CompleteSubMission 1287, CompleteQuest 637,
  PlayingQuest 221, PlayingMission 173, StartQuest 150, StartMission 4.
- Name resolution: 3891 of 3990 such terms (97.5%) name an existing mission/quest
  row; 99 do not (13 CompleteMission, 86 CompleteSubMission).
- Condition syntax is plain `&&`, `||`, `!`, parentheses, `Func(args)`, with a
  `parserType:N` suffix. `decode_level_gates.py` already has a Kleene-logic
  evaluator for it.
- Row -> condition link: not decoded. Test (`owner-link-test.json`): scanning
  4467 `Mission_*` rows for u32s equal to a quest-condition key gives 4435
  candidates (control rows: 4154), so raw hits are mostly chance. But 471 real
  candidates name the owner's own stem against 30 in the control, so genuine
  links exist and can be found once the field offsets are known.
- Where order is already solid: `levelinfo` phase conditions (used by
  `decode_level_gates.py`) give "level X loads after mission Y" edges; main
  chapters give a coarse order.
- Not unparseable by syntax, but not resolvable to an owner: all of them, until
  the row layout is known. Estimate: 0 quests fully resolved today beyond
  chapter grouping.

Suggested next step (not done, was out of scope): get the field layout from the
loader via the existing Ghidra project (`mcp__rea` / ghidra_lookup.py), or diff
two saves one mission apart, then wire row -> start/complete condition keys.

## 4. Localized names

`quest.paloc` (English): titles found for 5999 of 6864 missions (87%, many are
the Abyss/Sealed Artifact `{StaticInfo:Knowledge:...#Name}` form that holds the
name after `#`) and 803 of 1098 quests (the remainder are system rows). Faction
node names/descriptions come from `faction.paloc` (661 of 1119 nodes). Group
titles: 40 of 42. Reader: `read_paloc` in `find_chest_contents.py`.

## 5. Save data (QuestSaveData)

Three save copies compared (`save-states.json`). Records: `_missionStateList`
(`_key`, `_state`, `_uiState`, `_branchedTime`, `_completedTime`,
`_completeCount`, `_delayedTime`), `_questStateList` (`_questKey`, `_state`,
`_branchedTime`, `_completedTime`), `_questGaugeStateList` (`_state`,
`_killRatio`), stage states, and `_lastCompletedMissionKey` /
`_lastCompletedMainQuestKey` (full save: `Quest_Epilogue_Ending`).
- Mission states seen: 1, 2, 3, 4, 5 (and null). 5 = completed (has
  `_completedTime`). Quest states: 2, 3, 4, 5. Gauge states: 2, 4, 5.
- State 2 is the bulk (early save: 2793 of 3021). It cannot mean "started": it
  includes everything the game has registered and not finished. So 2 = known /
  not completed, not a clean "available" vs "started". Transition data
  (2 -> 5 for 2108 missions, 1 -> 5 for 123 between saves) says 1 is an earlier
  state than 2 or 5. 4 appears on faction `Invasion` missions and some nodes
  (likely closed or failed or skipped; not confirmed). 3 is rare (1 mission,
  26 quests, mostly `Quest_Node_*`).
- Missions with no save record: 3843 in the early save, 111 in the full save.
  Absent = not yet created, so presence vs absence is the only
  "not yet available" signal, and it is not a prerequisite check.
- Meaning of states 1, 3 and 4 needs one targeted test (read state before and
  after a specific action); I did not run one.

## 6. Coordinates

No decoded quest-giver or objective position. A float-triple scan (x, z in
500..25000, y -600..4000) flags 829 mission rows, 163 quest rows, 840 of 1119
`factionnode` rows (confirmed: `Node_Her_Temporary_Camp` holds x, y, z as
floats near -10658 / 634), 39279 `stageinfo` rows, 27 knowledge rows. Treat
mission/quest hits as unverified (random bytes can look like floats).
Practical sources: faction node positions, `stageinfo` (stages hold the spawn
points and presumably the quest givers), `levelgimmicksceneobjectinfo` for
placed objects, and MapGenie / crimsondb.gg for hand-made quest locations.
