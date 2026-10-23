# Handoff: can Pywel Atlas tell which treasure chests are quest-dependent?

Written 2026-10-22 for a reasoning model with no prior context. Evidence is
labelled **[evidence]** (seen directly in game files, saves or logs),
**[inference]** (follows from names or structure) or **[guess]**.

## 1. The question

Pywel Atlas is a Crimson Desert mod that puts the game's own map icons on the
world map at collectibles the player has not done yet, judged from the
player's save file. Chests are the next category. Some chests only exist
after quest progress (MapGenie: "Requires quest progression for chest to
spawn"). A marker shown for a chest that does not exist yet is misleading.

**Wanted:** a feasibility assessment and a concrete research plan for
deciding, per chest, (a) whether it is quest-gated, and (b) if so, which save
record says the gate is open. The answer must come from game data and the
save file, not from guesswork or player position.

## 2. Hard constraints (from the project owner)

- The product is one in-game mod (a native DLL loaded into the game). No
  companion process or Python at runtime. Python is fine for offline research
  and for generating tables that are compiled into the mod.
- The mod reads the player's save file from disk (read-only copies, decrypted
  and parsed natively; format adapted from the MIT library pycrimson). It
  never writes saves.
- Completion or gating may only be decided from explicit records. Never infer
  from proximity, file age, missing data or errors. "Unknown" must never be
  treated as "not done" or "not gated".
- The mod must not call game functions itself (beyond a narrow set of
  existing, carefully checked map-icon calls). Reading quest state from the
  save file is the expected route, not reading live game memory.
- Only chests that do not refill are tracked.

## 3. What is already known

### 3.1 Chest kinds and how opening is saved [evidence, one sample each]

From a controlled before/after save test on 2026-10-22:

- **Chests in the six dedicated chest levels** (`treasurebox.palevel`,
  `treasureboxcrimsondesert`, `treasureboxdelesyia`, `treasureboxdemeniss`,
  `treasureboxhernand`, `treasureboxkweiden`; prefabs `gimmick_itembox_a_00NN`).
  When the player comes near, the save list
  `DiscoveredLevelGimmickSceneObjectSaveData._discoveredLevelGimmickSceneObjectSaveDataList`
  gains a record `{_levelGimmickSceneObjectInfoKey: 1000007 ("TreasureBox"),
  _sceneObjectUuid: <chest UUID>}`. On opening it gains `_isCompleted: True`.
  The chest's record in `FieldSaveData._fieldGimmickSaveDataList` (keyed by
  `_levelOriginSceneObjectUuid`) already existed before discovery, with
  `_fieldSaveDataReason` 1, `_resetTimeSecondsOfDays` = 0xFFFFFFFFFFFFFFFF
  ("never"), `_ownerLevelName` "TreasureBoxHernand", and on looting its
  `_initStateNameHash` changed (2255254665 → 1537827618) and it gained
  `_leftDropRollCount`.
- **Puzzle strongboxes in ordinary world levels** (for example
  `gimmick_treasurebox_padlock_safe_06` in `sector_-42_-16_indoor_1_26`): no
  record of any kind before opening. Opening (item stolen) added a field record
  for that UUID with reason 1, reset "never", state hash 353047760, plus
  reason-4 records for its parts. No Bells'-list record.
- Furniture chests (`dff_chest`, `box_chest`, `treasurebox_cabinet`) have
  finite refill timers and are out of scope.

### 3.2 Where chests are placed [evidence]

`research/analysis/treasure-chest-placements.json` (from
`research/scripts/find_treasure_chests.py`): 422 special chest objects in 321
spots (chests within 15 m grouped). Each entry has prefab, UUID, level path,
world position and the nearest MapGenie point.

Chests by level kind:

| Level kind | Chests | Notes |
| --- | --- | --- |
| Six dedicated chest levels | 120 | Demeniss 35, Hernand 28, Delesyia 26, Crimson Desert 16, Kweiden 15 |
| World sector levels (`sector_X_Z...`) | 170 | Includes indoor sub-levels |
| `cd_waterfall_cave_00NN` | ~76 | 3–4 per cave, one MapGenie point per cave |
| Dungeons, forts, caves (`02_kwe_dungeon_*`, `04_aka_*`) | ~30 | |
| Phase levels (`castlegrant_node_crim_fortmanub_0001_phase00_00` 10, `abyssisland_0003_phase00_00` 5, `velluavillage_0001_phase00_00_sub_2_3` 2, `grace_build_0001_phase00_00` 1) | 18 | "phase00" suggests a stage-dependent variant [inference] |
| Mission / quest levels (`mission_friendly_legendary_black_lion`, `mission_windmeremanor_byron_normal_start_gimmick`, `quest_node_her_spidercastle_all_item`, `splithorn_boss_ibano_start_child2_gimmick`, `node_kwe_stellenmanor`) | 6 | Very likely gated [inference] |

159 of MapGenie's 251 chest points pair with an object within 80 m. Unpaired:
54 Abyss points (no coordinate conversion fitted for the Abyss map) and about
38 surface points. Some of the unpaired ones may be chests that are not placed
by level files at all (see 3.4).

MapGenie text marks at least these as quest-related: `mg:560983` (Torchlight
Cabin, "Requires quest progression for chest to spawn", quest line "Legendary
Animals: Dark Catastrophy"; it pairs with `gimmick_temple_chest_01` in
`mission_friendly_legendary_black_lion` 3 m away), `mg:543899` (Hernand
Castle alchemist's room, "found during the main quest"), `mg:554824` (Wayward
Woods Witch's Hideout, "progress faction quest Protector of the Abyss to
access"), `mg:943981` (house on the walking tree, "may require quest
progression of Woodland Spirit with a House on Its Head"), `mg:564617` (after
finishing "Path of Serpents"). Snapshot: `data/poi-data.js` (MapGenie,
category `mg-category:15041`).

### 3.3 Game tables that mention chest levels [evidence]

Extracted static tables are in `research/vendor/work/staticinfo/` (ignored by
git; regenerate with pycrimson). Each table is `<name>.staticinfoheader`
(u16 count, then per row a key of fixed size and a u32 body offset) plus
`<name>.staticinfobody` (pycrimson knows some layouts; many are only partly
decoded). Raw text searches found:

- `conditioninfo`: condition expressions as plain text, for example
  `GetLevelGimmickLeftDropRollCount(TreasureBoxHernand,Drop_Hwando_TwoHandSword)==0`,
  `GetLevelGimmickLeftDropRollCount(TreasureBoxHernand,Drop_DarknessKing_PlateArmor_Gloves)==0 && CompleteMission(Mission_HohenmarkRuins_Boss_Reward)`,
  `GetLevelGimmickLeftDropRollCount(Mission_Friendly_Legendary_Black_Lion,Drop_Black_Lion_Chest)==0`,
  `CompleteMission(...)`, `CompleteStage(...)`, `CheckFriendlyLevel(...)`.
  "TreasureBoxHernand" appears 60 times, "Mission_Friendly_Legendary_Black_Lion"
  7 times, "Mission_WindmereManor_Byron..." 16 times. So chests are
  addressable as (level name, drop-set name), and the save's
  `_leftDropRollCount` is what that function reads [inference]. These look
  like conditions that react to a chest being looted, not conditions that
  gate a chest's spawn [inference]; whether spawn gates are also expressed
  here is unknown.
- `missioninfo`: names `Mission_Friendly_Legendary_Black_Lion` (9 hits) and
  `Mission_WindmereManor_Byron...` (11), i.e. the chest's level has the same
  name as a mission [evidence], so loading that level is probably tied to
  that mission [inference].
- `fieldlevelnametableinfo`: a table of level names (including all
  `TreasureBox*` levels and most chest levels above). Possibly the master
  list of loadable levels with per-level data such as load conditions
  [guess].
- `stageinfo` / `questinfo`: `Contents_Treasurebox_Backpack_01` with sequencer
  `cd_seq_quest_spawnmainroad_treasurebox_0100` (stage chart
  `quest/stagechart_common2`). So some chests are spawned by a quest
  stage's sequencer at runtime, not placed in a level file [inference]. Those
  would be invisible to the level-file scan.
- `levelgimmicksceneobjectinfo_misc.base.staticinfomisc` (5.7 MB): mentions
  "TreasureBoxHernand" 48 times and "treasurebox" 430 times. Unexplored; may
  hold per-object data for level gimmicks (possibly conditions or drop sets
  per UUID) [guess].
- Other tables present that may matter: `levelinfo`, `sublevelinfo`,
  `contentsphaseinfo`, `gameplaytrigger`, `globalgameevent`,
  `globalgameeventgroup`, `gimmickgroupinfo`, `dropsetinfo`, `questgroupinfo`,
  `questinfo`, `missioninfo`, `stageinfo`, `sequencerspawninfo`.

### 3.4 Save-side quest data [evidence]

The decoded save (pycrimson, `SaveFile.from_encrypted_file` +
`ReflectionParser`) has `QuestSaveData` with `_missionStateList` (about 3000
entries, `_key`, `_state`, `_uiState`, `_usedTagList`), quest and stage
states (`QuestStateData`, `StageStateData`), `_lastCompletedMainQuestKey` and
`_lastCompletedMissionKey`, plus `ContentsMiscSaveData._activatedContentsPhaseGamePlayTriggerInfoKeyList`
and `FieldSaveData._fieldLevelModifiedSaveDataList`. Mission keys are numeric;
names come from `missioninfo` (key ↔ name mapping not yet decoded). A mission
seen earlier ("Well-Informed Greymane", key 1001044) stayed at `_state` 2
while active.

## 4. Hypotheses to test

1. **Level-load gate.** Chests in mission/quest/phase levels exist only
   while that level is loaded, and the level is loaded by a mission or stage
   (`missioninfo`/`stageinfo` name the level, or `levelinfo`/`sublevelinfo`
   carry a load condition). If so: gate = that mission's state in
   `QuestSaveData`.
2. **Phase variants.** `*_phase00_00` levels are one phase of a place that
   changes with story progress (`contentsphaseinfo`,
   `_activatedContentsPhaseGamePlayTriggerInfoKeyList`). Chests in phase 00
   may disappear in later phases, or appear only in some [guess].
3. **Sequencer spawns.** Some chests are created at runtime by a quest
   stage's sequencer (`cd_seq_quest_spawnmainroad_treasurebox_0100`). They have
   no level-file object and may never get a stable UUID; they may be out of
   scope or need their own handling.
4. **Ungated by default.** Chests in world sector levels and the six chest
   levels are always present (no gate). Plausible but unproven; the Hernand
   Castle "found during the main quest" chest is a counter-example to check.
5. **Save already reveals presence.** Chest B's field record existed before
   the player reached it. If the game writes a field record (or some other
   record) for every chest that currently exists, the save itself might show
   "spawned" without decoding any gate logic. Check whether field records
   exist for chests in far-away, never-visited areas.

## 5. Suggested research steps (offline, read-only)

1. Decode `missioninfo` (key → name) and `conditioninfo` (key → expression)
   enough to join names to save keys. pycrimson may already parse some of
   these; otherwise use the header offset table and the text inside each row.
2. For each chest level that is not a sector or chest level, search all tables
   for its exact name and list which rows reference it and how (load,
   unload, condition). Start with `mission_friendly_legendary_black_lion`
   (MapGenie confirms it is gated by "Legendary Animals: Dark Catastrophy").
3. Look for a per-level load rule in `levelinfo`, `sublevelinfo` and
   `fieldlevelnametableinfo` (field names via pycrimson reflection if the
   table is reflection-encoded).
4. Explore `levelgimmicksceneobjectinfo_misc.base.staticinfomisc` for per-UUID
   chest entries (search for known chest UUIDs as 4×u32 little-endian, and for
   drop-set names like `Drop_Hwando_TwoHandSword`).
5. Test hypothesis 5 on existing save copies: count field records per chest
   level and compare with the chests placed there.
6. Decide per chest: `always`, `gated by <mission key, required state>`,
   `runtime-spawned (out of scope)` or `unknown`. Emit a table the mod can
   compile in.

Existing save copies for testing (ignored by git, outside the game's save
folder): `research/vendor/work/chest-test/slot100–104.save` (chest test),
`research/vendor/work/shrine-test/*.save`, and JSON dumps next to some of them.

## 6. Tools and paths

- pycrimson (LukeFZ, MIT) with a patch: `research/vendor/pycrimson/`, Python
  3.12 venv `research/vendor/.venv/`. Level files: `PackageContext(<game dir>,
  pack_group_whitelist=['0015'])`, then parse PARC blocks from offset +16 with
  `ReflectionParser(..., has_shared_strings=True)`. Package listing:
  `research/vendor/work/pack-files.txt`. Game dir:
  `E:/SteamLibrary/steamapps/common/Crimson Desert`.
- Scripts: `research/scripts/find_treasure_chests.py` (placements),
  `research/scripts/compare_chest_saves.py` (save diff by UUID),
  `research/scripts/compare_shrine_saves.py` (knowledge/mission diff),
  `research/vendor/work/scan_chest_levels.py` (level scan),
  `research/vendor/work/gimmick-names.json` (gimmick key → name).
- Project notes: `docs/native-save-detection.md` ("Third category: Treasure
  chests" and "Chest save test result").

## 7. What a good answer looks like

- A verdict per hypothesis, with the evidence used.
- A count: how many of the 422 chests (and of MapGenie's 251 points) are
  always present, gated (and by what), runtime-spawned, or unknown.
- For gated chests: the exact save field and value that means "gate open",
  and how it was verified (ideally one before/after save pair the project
  owner can produce in game).
- Any risk that a gate is reversible (a chest that appears and later
  disappears), since markers must not flicker on wrong data.
