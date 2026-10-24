# Quest-gated chests: what is gated and can the mod tell? (2026-10-23)

Static research only, no game run. Script `research/scripts/decode_level_gates.py`
(read-only; uses the extracted tables in `research/vendor/work/staticinfo/`, no
game install needed) writes `research/analysis/chest-level-gates.json`. Evidence is
marked **[evidence]** (seen in game data or save copies) or **[inference]**.

## The missing piece: the game's level-phase table

`levelinfo` was misread before. It is the game's list of 269 "game levels"
(for example `GameLevel_VelluaVillage`). Each one is a small state machine
**[evidence]**:

- a list of phases; each phase has a condition key into `conditioninfo` (the
  condition is stored as text, such as `CompleteQuest(Quest_Node_Her_VelluaVillage_Block)`)
  and the levels that phase loads;
- the levels are 32-bit hashes of their CamelCase names, which the level-name
  table `fieldlevelnametableinfo` resolves (596 of 606 references named).

Row layout: key, name, 0x00, u32 default-phase hash, u16, u32 phase count, then
per phase u32 phase hash, u32 condition key (0 = none, the default phase), u32,
u32 level count, the level hashes, u32, u8 flag. 266 of 269 rows decode with it;
the 3 others name no chest level.

The earlier search looked for a chest level's name or hash next to a mission
name; here the link is level hash → phase → condition key → condition text.

## What is gated (564 placed chest objects)

| Rule | Chests | TreasureBox list | What decides it |
| --- | --- | --- | --- |
| Abyss islands and bridges (`GameLevel_Abyss0001`) | 55 | 53 | `CompleteMission(Mission_Intro_Abyss_Tutorial)` |
| Abyss cores (`GameLevel_AbyssCore`, `AbyssIsland_Quest`) | 21 | 21 | `CompleteQuest(Quest_Caliburn_Boss_MusketSiege)` |
| Ruined Chapel build site (`GameLevel_Her_RuinedChapel`, `grace_Build_0001_Phase00_00`) | 1 | 0 | Default phase. Replaced once `CompleteSubMission(Mission_RuinedChapel_ChapelConstruction_Start, 1)` is true, so this chest **disappears** later |
| Vellua Village "before" (`GameLevel_VelluaVillage`, `VelluaVillage_Before`) | 2 | 0 | Only while `Quest_Node_Her_VelluaVillage_Block` is started and not completed. Both are refilling `treasurebox_06/07`, so they are out of scope anyway |
| Quest, mission or faction-node levels (GameDataLevel branch) | 8 | 1 | Not in `levelinfo`; see next section |
| Level not in any game table | 11 | 0 | `castlegrant_node_crim_fortmanub_0001_phase00_00` (10) and `world_region_01` (1). Neither the level tree nor the level-name table knows them, while the other castle-grant forts (Red Mountain, Flame Knights, Dragon Kill) have phases there. Probably never loaded **[inference]** |
| No gate found | 466 | 164 | 120 chest-level chests, 44 cave/dungeon TreasureBoxes, terrain puzzle boxes, and 34 `itembox_reminiscence_01` in `Reminiscence_Her` |

The Abyss conditions also carry `!IsInRegion(Region_Pywel) || CheckCharacterKey(WorldObserver)`.
That reads as "stream the Abyss while the player is there" rather than an
existence gate **[inference]**. The save cannot answer it.

`AbyssIsland_0003` has a second phase level (`_Phase00_01`) that no `levelinfo`
row selects. What swaps it is still open (5 chests, 3 of them TreasureBoxes).

`Reminiscence_Her` is a flashback level under the content group with no load rule
in the tables. These 34 itemboxes are probably reachable only inside a memory
sequence. They stay unmarked **[inference]**.

## Quest, mission and faction-node levels (8 chests)

These levels sit under `gamedatalevel/faction/...` or `gamedatalevel/main/...`
and are named after the game object that owns them. Quest, mission and
faction-node rows hold their own level's hash (for example mission 1001701 at
row offsets 193/239/272, quest 1000322 at offset 49) **[evidence]**. No phase
condition exists for them.

| Chest | MapGenie | Owner (exact name) | Owner candidates by name |
| --- | --- | --- | --- |
| Torchlight Cabin temple chest, `Mission_Friendly_Legendary_Black_Lion` | mg:560983 | mission 1001701, quest `Quest_Node_Her_Friendly_Legendary` 1000322 | none |
| Windmere Manor jigsaw safe, `Mission_WindmereManor_Byron_Normal_Start_Gimmick` | mg:552487 | faction node `Node_Dem_WindmereManor_Byron` 1000487 | `Quest_Node_Dem_WindmereManor_Byron_All` and others |
| Stellen Manor music box, `Node_Kwe_StellenManor` | mg:550094 | faction node 1000466 | `Quest_Node_Kwe_StellenManor_Normal` |
| Arboria Castle padlock safe, `Quest_Node_Her_SpiderCastle_All_Item` | mg:546356 | faction node `Node_Her_SpiderCastle` 1000060 | `Quest_Node_Her_SpiderCastle_Block`, `_DrugFactory_Normal` |
| Ribentain all-button box, `Crowman_Boss_Ribentain_HideToken_Gimmick` | mg:555574 | none | `Mission_Crowman_Boss_Ribentain_HideToken` 1000247 |
| Hernand Castle alchemist chest, `MeetAlustain_Alustain_Chamber_Gimmick` | mg:546887 | none (main quest group `Quest_MeetAlustain_Alchemist`) | none |
| 2 × `treasurebox_07` in `SplitHorn_Boss_Ibano_Start_Child2_Gimmick` | none | none | `Mission_SplitHorn_Boss_Ibano_FirstMeet` 1000180 (refilling chests, out of scope) |

Save evidence (11 copies in `research/vendor/work/constellation-survey/`, all
from the same early playthrough):
- Mission and quest states: 5 has a completion time (done); 2 = started or
  available; 1 = listed, not started; no record = never touched **[evidence for
  5, inference for the rest]**.
- The Alustain chest was opened (`_isCompleted`) while its main quest
  `Quest_MeetAlustain_Alchemist_CrowWing` (1000509) was at state 2 **[evidence]**.
- The Torchlight Cabin mission 1001701 and its quest 1000322 have no record in
  any copy, which fits MapGenie's "requires quest progression" **[evidence +
  inference]**.
- Bell levels follow the same naming (`Mission_PororinVillage_Bell_All_*`). Their
  missions are at 2 (not rung) or 5 (rung), and the Bells exist in both states
  **[evidence]**.

Working rule, **not yet tested**: a GameDataLevel quest or mission level exists
once its owner mission or quest has a started record (state 2 or 5), and stays
after completion. Faction-node levels likely follow the node's state
(`FactionNodeElementSaveData._factionState`; numbering unknown).

## Can the mod detect it?

- **Phase-gated chests (79, 74 of them TreasureBoxes): yes, from the save.**
  The conditions use `CompleteMission`, `CompleteQuest`, `StartQuest` and
  `CompleteSubMission`. All of them are mission/quest records in
  `QuestSaveData` (a sub-mission is its own mission row named `<mission>_<n>`).
  The mod already decodes that save object. The script evaluates them per save
  copy. In Thomas's copies the Abyss gate is open (tutorial state 5), and the
  Abyss-core gate is closed (no MusketSiege record), so the 21 core chests do
  not exist yet in that playthrough.
- **Grace build chest: yes, but it disappears.** It must lose its marker once
  sub-mission `Mission_RuinedChapel_ChapelConstruction_Start_1` completes.
- **Quest/mission/faction-node levels (8): probably, with one test.** The owner
  is known exactly for the Torchlight Cabin chest and the three faction-node
  chests. A before/after save pair around starting "Legendary Animals: Dark
  Catastrophe" would confirm the state rule. Until then, keep them hidden.
- **Runtime option (allowed since the 2026-10-23 free-rein rule):** the game
  itself has `_checkGameLevelLoadState` on `LevelGimmickSceneObjectInfo`, so it
  can check a gimmick's level state for its own map icons. Calling or reading
  that check in-process would answer "is this chest's level active" for every
  class, without decoding rules. That is an implementation lead, not researched
  here.
- **Never-loaded (11) and reminiscence (34):** keep them unmarked.

## Open questions

1. What selects `AbyssIsland_0003_Phase00_01` over `_Phase00_00`.
2. The exact owner state at which a GameDataLevel quest level appears (one save
   pair).
3. Faction-node state numbering for the three faction-node chests.
