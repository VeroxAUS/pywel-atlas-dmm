# Collectible categories beyond Bells, and a map filter

Read-only research, 2026-10-22. Nothing under `src/` or `data/` was changed,
nothing was built or run in the game, and the game's save folder was not
opened. Labels used below:

- **Evidence**: seen directly in a file, the save copy or the game exe.
- **Inference**: follows from names or structure, but not confirmed in game.
- **Guess**: plausible, with no direct support yet.

## 1. Short answer

- The MapGenie snapshot has **11,342 POIs in 117 categories**. Every POI has
  a unique id (`mg:<n>`) and a map-grid position (`mapLat`/`mapLng`). None
  has a game position or a scene-object UUID. Only the 8 Bells have those,
  in `data/bell-save-links.json`.
- The Bell save family (`DiscoveredLevelGimmickSceneObjectSaveData`) is a
  family of **discoverable map landmarks**, not a general collectible log.
  In the two save copies it holds only 4 records: the Hernand Bell, one
  Abyss Nexus ("Abyss Ruins") and two unidentified landmarks.
- **Best next category: Abyss Nexus.** One record in this family links by
  exact UUID to the level `AbyssRuins_Her_0021`, which sits 6 m from MapGenie
  Abyss Nexus `mg:544720`. That record has no `_isCompleted` flag, so its
  "done" rule is still unknown.
- Treasure chests are the most valuable category. The game draws its own
  "opened chest" icon, but where it saves the opened state was **not found**
  in these saves.
- The marker code supports at most 31 markers per mask today. Hundreds of
  markers need per-category bitsets, a sliced map-thread update, and a native
  capacity test.

## 2. Sources and tools

| Source | What it gave |
| --- | --- |
| `data/poi-data.js` | Categories, counts, ids, map-grid positions |
| `data/bell-save-links.json` | 8 Bell UUIDs, info keys and game positions |
| `%LOCALAPPDATA%\PywelAtlas\native-save-proof-60062761-slot1.save` and `-slot101.save` | The mod's own encrypted save copies (21–22 Oct), decoded in memory, read-only |
| `CrimsonDesert.exe` strings | Save type names, field names, info-table field names |
| Earlier traces/logs | Native map icon template names (`MapIcon_*`) |

New research scripts (each starts with a plain-language header):

- `research/scripts/survey_poi_categories.py`: per-category counts.
- `research/scripts/survey_save_record_lists.py`: decodes a proof copy like
  `NativeSaveReader.cpp` does, walks **every** top-level object, and lists
  record lists, entry counts, key fields and yes/no flags. `--detail` prints
  each discovered-landmark record and the field gimmicks by info key. It
  refuses paths inside the game's save folder.
- `research/scripts/find_savedata_type_names.py`: lists every `*SaveData`
  type name and progress-like field name in the exe.

Limit: both save copies are from early in the game (Hernand area, one Bell
completed), so most landmark families have no records yet. A later save would
show much more.

## 3. POI survey (`data/poi-data.js`)

All 117 categories: every POI has a map-grid position and a unique id (0
duplicates). Abyss-world POIs (244) use a separate map.

| Group | Categories (count) |
| --- | --- |
| Collectibles | Memory Fragment 251, Treasure Chest 251, Sealed Abyss Artifact 141, Key Item 65, Kuku Pot Item 62, Mount 50, Abyss Artifact 39, Abyss Gear 17, Treasure Map 14 |
| Locations | Abyss Nexus 266, Cave 139, Abyss Cresset 101, Point of Interest 67, Hidden Space 34, Sanctum 16, Constellation 13, Greymane Shrine 12, Spire 9, **Bell 8**, Witch Hideout 5 |
| Items | Chest 596, Armor 202, Dye 184, Elixir 158, Weapon 154, Reading Material 132, Common Equipment 99, Tool 56, Key 50, Accessory 25, Currency 17, Treasure Map Solution 12, Pack 4 |
| Crafting Manuals | Equipment Blueprint 127, Recipe 83, Alchemy Formula 17 |
| Other | Pet 84, Observe Skill 76, Hidden Passage 74, Miscellaneous 20, Puzzle Clue 15 |
| Enemies | Mysterious Creature 115, Boss 81, Elite Enemy 31, Abyss Enemy 26, Legendary Animal 24, Walker 15 |
| Quests | Faction Quest 663, Main Quest 168 |
| Strongholds | Stronghold 783 |
| Crafting Tools | Bonfire 1024, Anvil 440, Grindstone 399, Special Cooking Tool 159, Well 111 |
| Resources (29) | Iron Ore 836, Copper Ore 576, Bismuth Ore 184, Scolecite Ore 162, Herb 159, Azurite 146, Bloodstone 145, Garnet 133, Produce 132, Epidote 111, Red Seaweed 111, Diamond 61, Stone 34, Green Algae 31, Oakwood Mushroom 29, Pine Mushroom 28, Palmar Leaf 22, Gold Ore 11, Silver Ore 11, Coral Mushroom 10, Brimstone 9, Skyroot 8, Ginseng 7, Rubber 7, Honey 5, Cotton 3, Spider Web 3, Mercury 2 |
| Services (33) | Trading Center 123, Notice Board 103, Street Shop 64, Grocer's Shop 39, Equipment Shop 25, Minigame 25, Fishing Shop 17, Provisioner's Shop 17, Back Alley Shop 14, Contribution Shop 11, Dyehouse 11, Tailor's Shop 11, Guard Station 10, Tavern 10, Confessional 9, Smithy 9, Saddlery 8, Stable 8, Black Market 7, Butchery 7, Bank 6, Furniture 6, Mineral 6, Rancher's 6, Research Institute 6, Tannery 6, Livestock Fence 4, Wagon Fence 3, Artwork 2, Decorative Stone 2, Horse Black Market 2, Pet Shop 2, Secret Shop 2, Kuku Shop 1 |

Full per-category output, including region and description counts, comes
from `survey_poi_categories.py`.

**Map grid to game position (evidence, fitted from the 8 Bells):**
`mapLat ≈ 4.1373e-5 · z + 0.77890`, `mapLng ≈ 4.1456e-5 · x − 0.40246`.
The error is under 12 m for 7 Bells and 33 m for Demeniss. There is no
height (y). This is good enough to place a planning marker, but it must
never decide identity or completion. Marker positions for linked POIs should
come from game data, as the Bell positions do.

## 4. What the save records look like

### 4.1 The Bell family (evidence)

`DiscoveredLevelGimmickSceneObjectSaveData._discoveredLevelGimmickSceneObjectSaveDataList`
holds `LevelGimmickSceneObjectElementSaveData` records with exactly five
fields: `_levelGimmickSceneObjectInfoKey`, `_sceneObjectUuid` (16 bytes),
`_fogPivotPosition` (float3), `_isCompleted`, `_isDiscoverd`.

In both save copies it has 4 records:

| Info key | UUID words | Flags stored | Identity |
| --- | --- | --- | --- |
| 1000119 | 1601869702, 1450446765, 1450142268, 0 | `_isCompleted=1` | Hernand Bell (evidence, existing link) |
| 1000001 | 3783951294, 4279243110, 2038457056, 0 | none (pivot 1.7, 0, −9.5) | Same UUID as field gimmick `AbyssRuins_Her_0021` at game (−10626, 621, −3813), 6 m from MapGenie **Abyss Nexus `mg:544720`** (UUID evidence; POI link inferred from position) |
| 1000043 | 285700176, 3222801038, 131836493, 0 | none | Unidentified |
| 1000043 | 1907650133, 3222801036, 131836493, 0 | none | Unidentified |

The alert history (`AlertHistorySaveData`, alert type 33) holds a
"discovered" alert for the Bell and for both 1000043 records (evidence).

What the game's info table for this family holds (exe field names,
evidence; meaning inferred): `LevelGimmickSceneObjectInfo` has `_levelName`,
`_mapIconTextureInfo`, `_fogMapIconTextureInfo`, `_useTeleport`,
`_isSubInnerGimmick`, `_discoverDistance`, `_discoverNearFog`, `_fogDistance`
and a `_levelGimmickSceneObjectDataList`. Each entry in that list has
`_worldTransform`, `_gimmickAliasName`, `_teleportOffsetTransform` and
`_linkedCompleteGimmickList`. So this family is for **map landmarks that
are discovered, may reveal fog, may allow teleport, and have their own map
icon**. That fits Bells, Abyss Nexus (Abyss Ruins), and probably other
"Locations" landmarks (inference). It does not fit loot or resources.

The exe also names a sibling list that these saves do not contain yet:
`LevelGimmickSceneObjectUIMapStateSaveData._levelGimmickSceneObjectUIMapStateElementSaveDataList`,
with a bool, a UUID and an info key (evidence from the reflection type names).
It may hold per-landmark map-icon state (guess).

### 4.2 Other record families (evidence unless marked)

| Family | Size in save | Fits a POI category? |
| --- | --- | --- |
| `FieldSaveData._fieldGimmickSaveDataList` (`FieldGimmickSaveData`) | 535 | Has a UUID, info key, transform, reset timer and `_isBroken`. Mostly town props, shop displays and sewer objects near the player. It is a local, resettable state cache, **not** a lasting collection log (inference). Not suitable for completion. |
| `FactionNodeElementSaveData._completedSubInnerGimmickUuidList` | 1119 nodes | A list of completed scene-object UUIDs per faction node. With `_isSubInnerGimmick` above, this probably covers stronghold sub-objectives (inference). |
| `KnowledgeSaveData._list` | 124 keys | Learned knowledge by key. Might cover Observe Skill, Reading Material or Memory Fragment (guess). Needs the knowledge table. |
| `QuestSaveData` (quest, mission, stage states) | 654 / 3023 / 45871 | Main/Faction Quest by key. Needs the quest table. |
| `MercenaryClanSaveData` | 2 | Owned mounts/companions by character key. |
| `InventorySaveData` | 33 items | Items are sold and used up, so "has item" is not "collected". |
| `FogSaveData` | RLE | Map reveal, not per POI. |
| `ContentsMiscSaveData._pinMarkerDataList` | 3 | The player's own map pins. All 3 are at the exact Hernand Bell position (probably from the early native-pin experiments). |

Native map icons from earlier traces (evidence) show which objects the game
draws itself: `MapIcon_Gimmick_LevelTreasureBox` and
`...LevelTreasureBoxOpened`, `MapIcon_AbyssTreasureBox` and `...Opened`,
`MapIcon_Gimmick_SealedArtifact`, `MapIcon_Gimmick_AbyssArtifactCube_01`,
`MapIcon_Gimmick_GreyManeTemple`, `MapIcon_Abyss_Ruins`,
`MapIcon_Gimmick_Bell_00/01`. The "Opened" chest icons show the game tracks
opened chests (evidence). Where that is saved was not found (no chest records
in the landmark list; the field-gimmick cache is resettable).

## 5. Category assessment

How likely each category is stored like Bells (scene UUID plus an explicit
flag):

| Category | Count | Likely save home | Likelihood |
| --- | --- | --- | --- |
| Abyss Nexus | 266 (215 Pywel) | Landmark list (info key 1000001) | **High** (UUID evidence for 1 instance) |
| Greymane Shrine, Spire, Sanctum, Constellation, Witch Hideout | 12, 9, 16, 13, 5 | Landmark list | Medium (inference: landmark-type info fields; `GreyManeTemple` icon) |
| Abyss Cresset | 101 | Landmark list | Medium–low (guess) |
| Cave, Hidden Space, Point of Interest | 139, 34, 67 | Landmark list or none | Low (guess) |
| Stronghold | 783 | Faction-node completed-UUID list | Medium for sub-objectives (inference); a different family |
| Treasure Chest | 251 | Unknown (game has an "opened" icon) | Unknown; needs an experiment |
| Sealed Abyss Artifact, Abyss Artifact | 141, 39 | Unknown (native gimmick icons exist) | Low–unknown |
| Memory Fragment, Observe Skill, Reading Material, Recipe, Blueprint, Alchemy Formula | 251, 76, 132, 83, 127, 17 | Knowledge or items (key based, no UUID) | Low for a UUID link; needs game tables |
| Main / Faction Quest | 168 / 663 | Quest states by key | Not this family; needs the quest table |
| Mount, Pet | 50, 84 | Mercenary/character keys | Not this family |
| Items, Resources, Crafting Tools, Services, Enemies | — | Inventory, field cache or none | Not completion-trackable (respawn, shops) |

## 6. Ranked shortlist

Ranked by player value and how close it is to the Bell method.

1. **Abyss Nexus (266).** Fast-travel points, high value. Strongest evidence:
   a real record in the Bell family. Needed:
   - an exact POI-id → scene UUID table for each Nexus, taken from game data
     (the `AbyssRuins_*` levels or the `levelgimmicksceneobjectinfo` data
     list), like the Bell mission assets;
   - the allowed info key(s) (1000001 so far);
   - a before/after save diff when the player activates one new Nexus, to
     learn which state means "done". The record here has no
     `_isCompleted`, so record presence may mean only "discovered".
     Until a diff proves it, presence must not be shown as completed;
   - a filter and more than 31 markers.
2. **Small landmark sets: Greymane Shrine (12), Spire (9), Sanctum (16),
   Constellation (13), Witch Hideout (5).** Low pin counts, so each fits the
   current 31-marker mask. They are likely in the same family (inference).
   Needed: the same UUID/info-key table from game data, plus one runtime diff
   per category, since none has a record in these early saves.
3. **Abyss Cresset (101).** It may be in the same family (guess). Same
   evidence as above.
4. **Treasure Chest (251).** Highest everyday value. Feasibility is unknown.
   Needed first: open one known chest (for example the Hernand Sewers chest
   with the Grace Plate Helm), save, and diff the two proof copies with
   `survey_save_record_lists.py` to find the record that changes. Then a
   chest → UUID table.
5. **Sealed Abyss Artifact (141).** The game has native icons for it. Needs
   the same diff experiment as chests.

Common blocker: the Bell UUIDs came from game asset files read with
pycrimson. That reader is not in this repository now (only its license is
in `third_party/python/`). Building the UUID tables needs it back, or an
equivalent archive reader, as a research-only tool.

## 7. Filter design

**File:** `%LOCALAPPDATA%\PywelAtlas\pywel-atlas-filter.json`, beside
`native-map-marker.json` (the mod's own folder, never the game's). If the
file is missing, the mod writes a default copy, as it already does for the
marker file.

```json
{
  "schemaVersion": 1,
  "maxMarkers": 48,
  "categories": {
    "bell": { "enabled": true },
    "abyss-nexus": { "enabled": false, "radius": 0 },
    "greymane-shrine": { "enabled": false }
  }
}
```

- **Per category:** `enabled` (true/false). Only categories this build has
  verified links for are accepted. An unknown name is logged and ignored,
  never guessed.
- **Defaults that avoid flooding:** Bell on, everything else off.
  `maxMarkers` is a global cap (default 48). Completed items are always
  hidden, and unknown save state never creates new markers (as today).
- **Optional `radius` (metres, 0 = off):** show only markers within that
  distance of the player. The ASI has no player-position source yet, so the
  first version should accept the field but log "radius not supported yet".
  This is a display filter only. It never marks anything as discovered.
- **Reload:** parse on the worker thread with the existing Windows JSON code
  in `NativeMarkerDefinition.cpp`. Reload on F6. The map thread only receives
  a copied "wanted" set.

**Fit with the marker code (`NativeMapCategoryProbe.cpp`):**

- **Keys:** keep the Bell range `0x5059415400000100 + i`. Give each category
  its own block, for example `0x50594154_00CC_NNNN` (CC = category number,
  NNNN = index, up to 65,536 each). Replace `BellMarkerIndex`/`IsBellMarker`
  with one decoder that checks category, index, key, type and the exact
  stored position.
- **Today's limit:** `bellMarkerWanted` and `bellMarkerPresent` are single
  32-bit `LONG`s (`static_assert(kBellMarkerCount <= 31)`).
  `NativeSaveSummary` masks are 32-bit too, and `ServiceBellMarkers` looks up
  every marker on every map update.
- **For hundreds of markers:**
  - per-category bitsets (arrays of 64-bit words) in place of the `LONG`
    masks, published by the worker as a whole snapshot (lock, or pointer swap
    with a generation number);
  - the map thread checks a bounded slice per update (round-robin, for
    example 32 lookups) and still creates at most one or a few per update;
  - the save reader maps UUID → (category, index) with a hash table, instead
    of the linear scan in `Match()`, and returns per-category bitsets through
    `LoadedSave.h`;
  - a native capacity test: only 9 icons have been shown so far. v0.25
    showed one private icon did not use a personal-pin slot. That does not
    prove hundreds are safe. Step up 32 → 64 → 128 → 256 and check frame
    time and personal-pin count;
  - per-category icons: every marker uses the chest icon today. A distinct
    icon per category needs its native template traced (Bell = type 360 is
    known).
