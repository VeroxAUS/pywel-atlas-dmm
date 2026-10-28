# Quest locations from the game files (2026-10-27)

Why the quest tables hold no positions: quest/mission stages are scripted. A stage row names
a sequencer script (e.g. cd_seq_quest_greywolf_camp_1300); the positions live in that
script's files in the game install (read-only): path files `gamedata/road/rootlevel/
sequencer/<script>.road` (1686 files, 1180 decoded) and timeline files
`sequencer/**/<script>.paseq` (about half of the 7525 stage scripts ship one).

Sources, best first (sequencer_positions.py, sequencer_scan.py, merged-*.json):
1. faction node by name (exact node XYZ)           444 quests, 178 node missions
2. sequencer road files (NPC routes, decoded)      141 quests, 468 missions
3. .paseq byte scan for world-position floats      heuristic, may pick up camera points
4. stage row XYZ                                   353 quests, 64 missions
Merged: 599 of 694 player quests (86%) incl. 40 of 41 main-chapter quests, 471 Quest_Node,
39 Quest_Faction; 2025 of 6864 missions (1928 plain Mission_*, 12 Challenge_*).

Accuracy (distance in map units): node vs road median 449 (33/63 within 500); node vs paseq
scan median 490 (123/241 within 500); node vs stage XYZ median 89. Road vs paseq scan disagree a
lot (median 4-5 km), so the scan is region-level at best; treat as a hint, not a marker.
Not found: a labelled quest-giver or objective position (the 'CreateMissionTarget' /
'MoveToMissionWorldPosition' events are inside the undecoded .paseq timeline format).

Route 2 (runtime, NOT approved, not built): the game creates MissionTarget objects with a world
position for active objectives (exe strings CreateMissionTarget, DestroyMissionTarget,
MoveToMissionWorldPosition, UpdateQuestIcon). A mod hook logging those, or a read of the map's
quest-marker list while a quest is active, would give exact objective positions per quest the
player activates; needs the game running and approval for any hook.

## Update: exact anchors from .paseq (paseq_anchors.py)
The .paseq timelines parse with the repo's reflection reader started at offset 16 with
shared strings on (no PARC tag). The root object's _sequencerTransform = scale xyz,
rotation quaternion xyzw, position xyz: the last three are the script's exact world anchor.
All 2504 referenced scripts parsed (2501 with an anchor, 1832 spawn named characters:
ActorTrackNodeData_SpawnCharacter._spawnCharacterKey -> characterinfo name).
Results (exact-*.json): 468 quests (391 of 694 player quests, 40 of 41 main-chapter, 264 Quest_Node,
39 Quest_Faction), 1910 missions (1814 plain, 12 challenge); NPC names for 446 quests.
Accuracy of the per-quest median anchor: vs faction node median 433 (131/241 within 500),
vs stage XYZ median 233 (52/76 within 500), vs road files median 508. A quest spans several scripts,
so its anchor is a scene centre, not the single objective marker.
