# What is available per content type (2026-10-27)

| Content | Order | Position | Region | Reward | Gates / unlocks | Missing |
|---|---|---|---|---|---|---|
| Main story (41 chapter quests) | Yes, save-validated DAG (26 layers) | Few (stage XYZ for part of them; most stages have none) | Via stage position or name only | Mission rewards decoded for their missions (items, knowledge, XP) | Successor conditions (e.g. 3 quests needed) | Giver/objective positions (nested records) |
| Steps inside quests (missions) | Parent/child/next links + start conditions, 94% consistent | 64 of 6864 missions via stages | nearest faction node region | 1623 missions with rewards: Item 1542, Knowledge 1067, SubLevelExp 483, Mercenary 54, variable changes 8 | start condition terms: CompleteSubMission 401, Knowledge 133 (99 resolved to the mission that rewards it), CompleteQuest 49, CompleteMission 47 | positions; recommended level not found |
| Side missions (3862 plain) | Partial (1244 have a start condition) | few | name prefix | as above | as above | positions |
| Challenges (Abyss, Sealed Artifact) | Partial (sub-mission chains, cross links) | 1 | by name | 331 challenge missions with rewards (AbyssGate/Transmitter knowledge, artifacts, items) | AbyssGate knowledge rewards from Challenge_Discover_* | positions: use the existing Abyss data in the mod |
| Faction nodes / quests | No order (adjacency, free choice) | Yes: 1119 nodes with XYZ; 444 of 496 Quest_Node quests mapped | node name region (Her, Dem, Del, Kwe, Crim) | not decoded (DropSet_Reblockade_* names seen) | none found | conquest order, rewards |

Region code guess: Her=Hernand, Dem=Demeniss, Del=Delesyia (high), Kwe (medium), Crim (low).
Stage rows: 43478 of 52082 have a plausible XYZ (stage_pos), but only 353 quests and 64 missions
resolve to one (most stages are scripted sequences without a position).
Access rewards found: AbyssGate (17) and AbyssTransmitter (39) knowledge on Challenge_Discover_*,
Knowledge_Paper_AbyssTeleport (Mission_SplitHorn_Boss_Battle_0), Knowledge_Dimension_Wyvern
(Mission_Caliburn_Boss_MyurdinUmbra_Battle_0), airship knowledge (Mission_MarniDragon_Boss_MonsterWave_2),
Interaction_Unlock (Mission_Intro_Abyss_Tutorial_0), BaseCamp level variables (GreyWolf camp missions).
No glider/grapple/mount-unlock keywords found in mission rewards (abilities likely come through
skill/knowledge tables or the story scripts).
