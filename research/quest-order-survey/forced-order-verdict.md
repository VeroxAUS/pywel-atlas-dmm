# Three-save forced-order test (2026-10-27)

Script: `forced_order.py` -> `forced-order.json`. Missions only (the saves hold few timed quests).
Items must be completed with a time in every compared save. Groups = first two name tokens (88).

| | A+B+C | B+C only |
|---|---|---|
| missions completed in all | 1448 | 1454 |
| pairs within a group | 40566 | 40637 |
| pairs ordered the same everywhere | 28029 (69%) | 32339 (80%) |
| close pairs (<=1% of A's time span) | 10046 | 6349 |
| close pairs ordered the same | 8124 (81%) | 5704 (90%) |
| estimated forced share of close pairs (2*agree-1 style correction) | ~0.75 | ~0.80 |
| missions in at least one close unanimous pair | 1286 | 1231 |

Caution: all-pairs agreement of 69% / 80% is about what progress alone produces, so it is
not evidence of forcing; only the close-pair rate is informative. Pairs of different
stems (not just `X_0` before `X_1`) are 6919 of 8124 and ordered the same 79% (A+B+C).
This is NOT explained by mission key order (only 36-41% ascend).

## Decoded unlock edges vs the saves
919 edges (mission needs mission, `CompleteSubMission(Y,n)` read as row `Y_n`).
- Prerequisite finished first: A 317 of 899 (35%), B 138 of 298 (46%), C 22 of 38 (58%).
- Edges that hold in every save they appear in: 287; contradicted in at least one: 613;
  untestable: 19 (A+B+C). B+C: 141 / 166 / 612.
- Close unanimous pairs confirmed by a decoded edge: 0. All 8124 (A+B+C) have no edge.
Example contradiction: `Challenge_AbyssRuins_Kwe_0026_0` (unlock needs
`Mission_JiJeongTemple_Normal_Training_2`) was completed at 4.2M in A, the prerequisite at 13.1M.
So the +39 condition is not a hard "must be done first" gate; it behaves like a visibility
or notification condition. Do not use it as an ordering rule.

## Verdict
Not enough yet for a trustworthy prerequisite layer.
- Decoded edges: ~chance as order constraints (35-58% prerequisite-first).
- Saves: strong repeatable order between nearby missions (about 3 in 4 of close pairs), but it
  gives sequences (what players tend to do right after what), not stated prerequisites, and
  none of it is confirmed by decoded data.
- Roughly: of 1448 missions common to all three saves, about 1286 (89%) sit in at least one
  consistently ordered neighbouring pair, which could seed "usually after X" hints; the remaining
  free choice is the broad ordering across regions (about 20-30% of far pairs flip between players).
- Trustworthy "do after X" rules would need the real gate (quest/stage/dialog logic) or more
  saves from distinct players. Treat the output as a suggested order, not a lock.
