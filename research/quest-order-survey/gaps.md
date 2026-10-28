# Draft guide skeleton: gaps (2026-10-27)

Built by `build_skeleton.py` -> `draft-guide-skeleton.json`.

## What the skeleton has
- 14 chapters (group 1000..1013) with 41 chapter quests from the tables (key, name,
  English title, state in the full save), plus the journal order ConsolePulse
  publishes per chapter (version 2.01 page; hand-copied).
- 539 faction quests (496 `Quest_Node_*`, 43 `Quest_Faction_*`) and 1131 top-level
  side missions (plain `Mission_*` that are not numbered sub-missions) grouped by
  the region code or content name in the row name.
- Prerequisites: 26 of 1711 entries got a candidate condition, 19 of them name at
  least one required quest/mission. Candidate = a number in the row equals a
  condition key and that condition text names the owner. Low recall, fairly high
  precision.

## Region code guess
| Code | Region | Confidence |
|---|---|---|
| Her | Hernand (HernandCastle, DemenissCastle names back the first three) | high |
| Dem | Demeniss | high |
| Del | Delesyia | high |
| Kwe | Kweiden? (Vatnholl, Askelund, Steinnfell forts) | medium, name unconfirmed |
| Crim | eastern desert / Crimson (Howlsands, power station) | low |
| Cal, Neut, Tus | Calphade? / neutral / unknown | low or none |
Other groups are content names (HernandCastle 86, DemenissCastle 83, GreymaneCamp 77,
Varnia 43, Pailune 41, DelesyiaCastle 40, Legendanimal 24, Pororin Village 23...),
not regions.

## Gaps per group
- Main story: the tables hold only 41 chapter quests; ConsolePulse lists 165 more
  journal entries (steps/sub-quests, probably missions under each quest). Links
  quest -> missions are undecoded, so within-chapter order comes only from the web
  list. Parallel branches (Ch.2 notice-board, Ch.7 liberations, Ch.9 trials, Ch.11
  keys, Epilogue farewells) are stated in prose, not machine-readable.
- Faction nodes / faction quests: no unlock order, no level, no reward, no giver
  position decoded. Node positions are in `factionnode` (floats), not joined yet.
- Side missions: 1131 rows with no type split (story vs side vs tutorial), no
  region for content-named groups, no location.
- Prerequisites: 1685 of 1711 entries have none. Needs the row field layout
  (Ghidra) or a two-save diff.
- Save states: 1/3/4 meanings unconfirmed; state 2 = "known, not done", so
  "available" cannot be read from a save.
- Not covered: Abyss, Sealed Artifact, other challenges, shops, schedules (excluded
  on purpose), YouTube and other guides, any completion-order data.
