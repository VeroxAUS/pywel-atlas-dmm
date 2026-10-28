# Decode verdict (2026-10-27)

Layouts recovered from the exe (see layout-notes.md): missioninfo exact (6864/6864 rows),
questinfo prefix (1097/1098; exact tail check on 961), factionnode prefix (1119/1119).

| Content | Ordered from data now? | Evidence |
|---|---|---|
| Main story (41 chapter quests) | Yes, quest level | questinfo before/after lists: 26 layers, no cycles, 48 of 50 testable edges hold in the saves (2 contradicted, both in the edited save) |
| Main story steps inside a quest | Partly | mission parent/child/next links + start conditions (mission_graph.py); 94% of decidable start conditions hold |
| Side missions (3862 plain Mission_*) | Partly | 1244 missions have a start condition; 446 contain Complete* terms; 766 true / 50 false / 1447 unknown (non-quest terms: knowledge, friendship, items) |
| Challenges (Abyss, Sealed Artifact) | Partly | sub-mission chains (CompleteSubMission) plus cross links to quests/missions; same 94% rule |
| Faction nodes (496 Quest_Node, 43 Quest_Faction) | No | only 64 / 0 in the quest graph; node links (736) are adjacency, not gates (parent first 41 vs 41 after = chance); conquest order is mostly free choice |

Location data: factionnode rows hold x,y,z (1119 nodes, x -13122..0, z -7012..3557, same world
units as the mod). 444 of 496 Quest_Node quests and 178 node missions map to a node position by
name (quest-locations-from-nodes.json, faction-node-positions.json). No decoded quest-giver or
objective positions for story quests yet (they live in stage/dialog records). Mission start
stage lists (list28) point into stageinfo, not decoded.

Not decoded: nested stage/dialog records of the 136 big quest rows, rewards, recommended level,
ability/mount/fast-travel gates, stageinfo positions, faction operation unlocks.
Save fact: _branchedTime = when a mission became active (equals the previous mission's
completion time in chains), useful as extra validation.
