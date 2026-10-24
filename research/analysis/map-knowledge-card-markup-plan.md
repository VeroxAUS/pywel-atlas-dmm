# Knowledge card description markup: logging step plan (v0.96)

Goal: find the one call that receives the whole description markup of the
world map's knowledge card (for example "A mysterious chest hidden from prying
eyes.<br/>It may hold ..."), so that a later build can pass our own markup
there. The game then builds as many lines as we need, with real line breaks
(review section 9.3, option 1).

**Observe only.** Each hook calls the original with the same four register
arguments, returns its RAX, restores `GetLastError`, and logs through
`QueueObservation` within the existing card budget (`cardLinesLeft`).
Nothing on screen changes. The code goes in `MapKnowledgeCard.h`, next to the
v0.89-v0.94 card hooks, installed by `InstallCardHooks` (a guard mismatch
only skips that hook).

## 1. Hooks (guard bytes read from the exe with pefile, 2026-10-24)

| RVA | What it is (static) | Signature | 24 guard bytes |
| --- | --- | --- | --- |
| `0x647cb0` | Text formatter step 1: parses a source text (placeholders, markup) for an element into a segment list. The card layout calls it before `0x646700` (`0xf09e70` lines ~2201, 2396, 2471). 32 callers. | `char (void* context, const char* text, void* segments, void* element)` | `4c 89 4c 24 20 4c 89 44 24 18 48 89 4c 24 08 55 53 56 57 41 54 41 55 41` |
| `0x3ed7f90` | Sets an element's content from markup (`flag` 1 = parse). Called by the formatter's step 2 `0x646700` with `flag` 0, and by the info-line builder `0xf102a0` with 1. 26 callers. | `void (void* element, const char* markup, BYTE flag)` | `48 89 5c 24 10 48 89 74 24 18 55 57 41 54 41 56 41 57 48 8d ac 24 a0 f6` |

Not hooked (for reference): `0x646700` (formatter step 2, renders the
segments; guard `4c 89 44 24 18 48 89 4c 24 08 55 53 56 57 41 54 41 55 41 56 41 57 48 8d`),
`0x3eefde0` / `0x3eef440` (the markup tree walker and the per-text-node
element maker: they only see pieces, after parsing), and `0x3d2ce00`
(template instancing, 10 KB; it makes elements from a template, not from
description text).

Both hooked functions run for all UI, so the fast path is the same as the
`0x3ed4e00` hook: return straight to the original unless `cardLayoutBox`
(the thread-local "inside the card layout" mark set by the `0xf09e70` hook)
is set on this thread. No game memory is read outside the card layout.

## 2. What each hook logs (only inside a card layout pass)

```
card format text caller=0x<ret> element=<ptr> role=<title|free-line|description|description-wrap|e398|e3a0|other> ours=<marker|-> text="<first 300 bytes>"
card markup caller=0x<ret> element=<ptr> role=<...> flag=<0|1> ours=<marker|-> text="<first 300 bytes>"
```

- `caller` is the return address minus the image base. It tells apart the
  layout's call sites (`0xf09e70`) and the formatter (`0x646700` → `0x3ed7f90`).
- `role` uses the same box element table as the v0.89 `card text` lines.
- `ours` names our marker when the pass lays out one of our cards
  (`chestLayoutIndex`), else `-`.
- Texts are copied with `Read` (up to 300 bytes, retried shorter near the
  end of readable memory) and cut by `_snprintf_s(_TRUNCATE)` to fit the
  400-byte log line.
- The existing `card layout enter/leave` and `card text` lines stay, so the
  new lines appear in order between them.

## 3. The run (one session)

1. Install the v0.96 ZIP (game closed) with the v0.78 UI add-on.
2. Open the world map. Hover one of the game's own discovered Abyss Nexus
   icons until its card opens.
3. Hover one of our chest markers until its card opens, then one Sealed Abyss
   Artifact marker.
4. Press F8, close the game, say "done".

## 4. What the run decides

- If a `card format text` or `card markup` line carries the whole description
  with its `<br/>` (expected: "A mysterious chest hidden from prying
  eyes.<br/>It may hold ..." for our chest card), that call is the swap
  point. v0.97 then passes our markup there for our cards only (same
  `chestLayoutIndex` state) and drops the paragraph swaps in `0x3ed4e00`.
  The title swap stays.
- If neither carries it, the description reaches the tree walker another
  way. The next candidates are the description element's own setter around
  `box+0x118` and `0x3eefde0`'s callers `0x3eea4a0` / `0x3eef960`.
