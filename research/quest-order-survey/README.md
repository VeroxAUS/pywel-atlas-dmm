# Quest order survey: results and guide dataset

Everything here was produced read-only from the game's own data: the extracted static tables
(`research/vendor/work/staticinfo`), the game install packs (read-only), and three save copies.
Nothing was run, injected or hooked in the game; no source files of the repo were changed.

## Main product
- `guide-dataset.json` (about 4.5 MB): chapters, 1,098 quests, 6,864 missions with order, text,
  rewards, positions, givers, region, gates and save states. Schema below.
- `guide-coverage.json`: coverage per content type. `collectible-quest-join.json`: all collectibles
  joined to region and nearest scene. `main-story-order.json`: the 41 chapter quests in 26 layers.

## Schema (guide-dataset.json)
- `chapters{group}`: name and title (1000 Prologue .. 1013 Epilogue).
- `quests{name}`: `key`, `title`, `description` (30 quests only), `chapterGroup`, `category`,
  `before[]` (quest names that must be done first), `after[{quest, condition}]` (next quests with the
  condition text), `layer` (longest chain of predecessors), `missions[]`, `rewards[]` (text of the
  quest's missions' rewards: `Item(x,n)`, `Knowledge(k,level)`, ...), `position{x,y,z,source}`
  (`factionNode` exact node or `sceneAnchor` = scripted scene centre), `region` (code of the
  nearest faction node), `givers[{name,x,y,z}]` (named NPCs of the scene, may include non-givers),
  `states{save: state}`.
- `missions{name}`: `key`, `title`, `category`, `parent`, `children[]`, `next[{mission,condition}]`,
  `startCondition` (text), `needs[]` (positive Complete* terms in it), `hints[]` (knowledge needed,
  with the missions that give it), `rewards[]`, `position`, `region`, `givers`, `states`.
- `gateKnowledge`: counts of knowledge entries that open abilities/areas (see `gate-knowledge.json`).
- Coordinates are the game's world units (same as the mod's map data); y is height.

## How it was recovered (details in layout-notes.md)
Row layouts come from the game's own row deserializers (missioninfo exact for all 6,864 rows;
questinfo and factionnode and stageinfo: leading fields). Positions: faction node XYZ; scripted
scene anchors from `.paseq` (reflection format started at offset 16) and `.paschedulepath` files.

## Validation against the saves (three saves; 2106 is hand-edited, 2796 predates the Enhanced update)
- Quest graph: 593 edges from the questinfo predecessor lists; successor lists are a strict subset
  (577, no mismatches). Of 50 edges with both quests timed: 48 hold in every save, 2 contradicted
  (both in the edited save). Main story: 41 quests, 26 layers, no cycles, 0 edges to an earlier chapter.
- Mission start conditions (1,244): evaluated at completion time: 766 true, 50 false, 1,447 unknown
  (knowledge terms). 'Next' links have the predecessor first in 70% of timed cases (soft unlocks).
- Faction node neighbour links: chance level (41 vs 41), i.e. adjacency, not gates.

## Coverage (player quests / missions, from guide-coverage.json)
| Content | n | order data | position | giver | reward |
|---|---|---|---|---|---|
| Main-chapter quests | 41 | 41 | 40 | 39 | 1 |
| Faction-node quests | 496 | 64 | 470 | 135 | 134 |
| Faction quests | 43 | 0 | 41 | 28 | 0 |
| Side/story/contents/challenge quests | 106 | about 90 | 49 | 32 | 21 |
| Plain missions | 3,862 | 2,807 (start condition or next link) | 1,668 | 970 | 1,081 |
| Challenge missions (Abyss, Sealed, other) | 2,197 | 1,422 | 12 | 5 | 331 |
| Faction-node missions | 605 | 361 | 282 | 10 | 163 |

## Not decoded / not found
- Nested stage and dialog records of the 136 big quest rows; quest-level rewards (rewards here are
  those of their missions); recommended level (not present in the mission or quest rows examined).
- Faction operations, reblockade and waypoint tables beyond their names; faction conquest order.
- Exact objective markers (computed at runtime from sequencer/UI events, not stored as data).
- Descriptions for missions and most quests (only titles exist in the rows).
- Ability unlocks (glide, grapple, mounts) are mostly not attached to missions (knowledge entries
  such as Knowledge_Damian_ShieldGlider have no rewarding mission).
