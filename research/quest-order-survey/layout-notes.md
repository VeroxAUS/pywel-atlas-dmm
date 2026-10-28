# Row layout decode (empirical, 2026-10-27)

Method: Ghidra export was searched first (see below); the layout was then recovered
from the data by measuring where condition keys sit relative to a fixed anchor.

## Ghidra attempt (not enough)
- `pa::MissionInfoManager` vftable 0x57b6a38; slot 8 (0x15e9700, 3976 bytes) is the
  post-load indexer, not the row reader. Runtime MissionInfo fields seen: +0xa0
  list of 0x38-byte entries (type byte 4 = condition-like), +0xd8 u32 key list,
  +0x1c4 flag. These are in-memory offsets, not file offsets.
- No field-name strings for MissionInfo exist in the exe (only type names such as
  `CompleteConditionKey`, `ConditionKey`, `RewardKey`, `SubMissionKey` near
  0x5734dd8..0x57b2ed0), and the generic row reader was not located. The only
  staticinfo reader found by string (`%#_misc.*.staticinfomisc`, 0x15e0970) is for
  LevelGimmickSceneObjectInfo.

## Data-driven layout: missioninfo (6001 of 6864 rows have a text id)
Row = u32 key, u32 name length, name, 0x00, then fields. Anchor = end of the text id
string (`<len u32><15-20 digits>`; len byte 0x12/0x13/0x14).
- anchor + 39: u32 key into conditioninfo = unlock/accept condition (3979 rows).
- anchor + 60: u32 key into conditioninfo = objective/complete condition (3511 rows).
- start of row after name: u32 type key (1000100 constant), then lists
  `count + keys`: first list = first sub-mission (`<name>_0`), second list = stage
  key(s) (e.g. `Legendanimal_whitehorse_0100`). Verified on Legendanimal rows.
- Top-level mission rows (no `_N` suffix) hold no unlock condition at these offsets;
  gating lives in their `_0`/`_N` sub-mission rows.
Checks: unlock texts are real gates (`CompleteSubMission(M, 0)`, `CompleteMission(X)`,
`CheckFriendlyLevel(...)=2`, `!CheckKnowledge(...)`, `QuestGaugePercent`); objective
texts are real objectives (`CharacterKey(Animal_...)`, `ItemKey(Food_...)`,
`StageKey(...)`).

## questinfo: not decoded
Rows are huge and variable (up to 20 KB; repeated ~309-byte records). Fixed
anchors give no concentrated condition offsets (best ~405 of 803). Group u16 at
text id end + 13 remains the only decoded quest field (chapter / list).

## Update 2026-10-27: layouts recovered from the exe (supersedes "not decoded" above)
Found by following MissionInfoManager (vftable 0x57b6a38) and QuestInfoManager
(0x5983438): the lazy row loaders (0x4344e0 for missions, 0x5c2910 for quests) call the
row deserializers FUN_141509960 (MissionInfo, RVA 0x1509960) and FUN_141515550 (QuestInfo,
RVA 0x1515550). They read fields with a stream whose Read(buf, size) is vtable slot 1.
Primitives: key = u32, string = u32 length + bytes, list = u32 count + elements.
- `mission_parser.py: parse_mission` decodes ALL 6864 mission rows with exact byte consumption.
- `parse_quest_prefix` decodes the fields before the nested stage records of questinfo;
  validated by an exact tail match on the 961 rows whose nested list is empty
  (the other 136 rows have the same prefix, nested records not decoded).
Quest fields (name = my label, offset = in-memory offset in the game's struct):
  h58 = group/chapter (questgroupinfo key); keyList_b0 = predecessor quests;
  list_a0 = successor quests, each with a condition key; keyList_d0 = the quest's missions;
  keys_f0[0] = start mission; keyList_e0 = stage keys; u32List_c0 = quest gauge keys.
