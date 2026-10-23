# Knowledge card for chests: phase-0 logging build plan (v0.89)

Goal: one game run that tells us exactly how the game fills the world map's
knowledge card, so we know where to swap in our own chest text (route B2 in
`map-knowledge-card-review.md`). **Observe only**: every hook calls the
original, returns its result unchanged and restores `GetLastError`. No game
memory is written and no game function is called except the originals.

All new code goes in `src/marker-bell/MapTooltips.h` (same unnamed namespace,
same `Read` / `QueueObservation` / line-budget style as the v0.84 tooltip
observation). Built in both release and test builds. Line budget: a separate
`cardLinesLeft = 600` so card lines do not eat the tooltip budget.

## Words

- view: the world map view/controller. Our `tooltipController`; it holds the
  focused icon at `+0x5c0`.
- box: the knowledge card component, `*(view + 0x5e8)`.
- icon: a map icon object (`UIGamePlayControlCommon_WorldMapIcon`).

## 1. New hooks (guard bytes read from the exe with pefile, 2026-10-24)

| RVA | What it is | Signature (traced) | Guard bytes to compare |
| --- | --- | --- | --- |
| `0xdba0e0` | Fill the knowledge card for a gimmick icon (kind 0x0e path) | `void (view, icon, const float* position)` | 24 bytes: `48 89 5c 24 18 55 56 57 41 54 41 55 41 56 41 57 48 8d 6c 24 b0 48 81 ec` |
| `0xf12770` | Card: set knowledge key (`box+0x160`), clear the other fields, mark for refresh | `void (box, const WORD* key)` | 24 bytes: `48 89 5c 24 08 57 48 83 ec 20 0f b7 02 bf ff ff 00 00 66 89 81 60 01 00` |
| `0xf09e70` | Card refresh/layout (22 KB; sets title, description, free line) | `void (box, uintptr_t a2, BYTE a3)` (a2/a3 opaque) | 24 bytes: `48 89 5c 24 10 44 88 44 24 18 48 89 4c 24 08 55 56 57 41 54 41 55 41 56` |
| `0x3ed4e00` | Generic UI "set element text" (487 callers) | `void (element, const char* text, BYTE flag)` | 24 bytes: `48 85 d2 0f 84 21 06 00 00 44 88 44 24 18 48 89 54 24 10 48 89 4c 24 08` (starts with `test rdx,rdx; je rel32`; MinHook relocates the `je`) |

Not hooked (5-byte `jmp` stubs into the protected region; their bodies are
not readable as normal code): `0xd8c400` (has detailed tooltip:
`e9 0b 40 d2 09`), `0xdba3f0` (show box: `e9 0b 30 d3 09`), `0xf10100`
(`e9 bb 37 f9 09`). We read their inputs instead.

Callers: `0xdba0e0` has one caller (`0xdae3a0`, the focus update).
`0xf12770` has three (`0xdb9ca0`, `0xdba0e0`, one more). `0xf09e70` is
called by `0xf07880`, `0xf07a40` and `0xf124a0`.

## 2. What each hook logs

**Focus change** (extend `ObserveTooltipFocus`, map thread, read-only): for
the newly focused icon, ours or native, log:
`type (+0xde)`, tag key `+0xc8` (8 bytes), tag kind `+0xd0` (byte),
`+0xd8` (int), `+0xdc` (short), `+0x28c` (int), `+0x2b5`, `+0x2b6`, `+0x2b7`
(bytes). Type record fields are not read (the lookup `0x537250` is a game
call); `+0x2c` is already known per category from `kCategories`.
Expected: native Nexus/Bell: kind `0x0e`, `+0x2b7 = 1`. Ours: kind `0x15`,
`+0x2b7 = 0`.

**`0xdba0e0`** (map thread): before the original, log the icon (ours or not,
type, tag key/kind), `position[1]` and the box pointer `*(view+0x5e8)`.
After it: `box+0x160` (the knowledge key it chose), and the first 120 bytes
of the free text at `box+0x3d8` (read the string object's data pointer
through `Read`; if its layout is unclear, log the raw 16 bytes).

**`0xf12770`**: log the caller (`_ReturnAddress() - imageBase`), the box and
the key value `*key`. Skip lines whose box is not `*(view+0x5e8)` (other
boxes share the component class).

**`0xf09e70`**: set a thread-local "inside card layout" flag to the box
pointer for the duration of the original call (save the old value and
restore it, so nesting is safe). Log enter (box, `box+0x160`) and leave.

**`0x3ed4e00`**: if the thread-local flag is set (inside a card layout), OR
`element` equals one of the box's known elements (`box+0xf0` title,
`+0x110` free-text element, `+0x118` description, `+0x120` description
wrap, `+0x398` and `+0x3a0`, read fresh on each call through `Read`), log:
the role (which offset matched, or `other`), the caller return address, the
flag argument, and the first 120 bytes of `text` (via `DescribeTooltipText`
with a larger buffer). Not inside the card and not a box element: return
immediately after the original (no reads), because this function has 487
callers and runs for every UI text.

Line format examples:

```
card focus type=234 ours=no tag=(0x1f,0x0e) d8=-1 dc=-1 28c=-1 2b5=0 2b6=0 2b7=1
card fill-gimmick icon=native type=234 tag=(0x1f,0x0e) y=812.4 box=0x... key=0x1a2 free=""
card set-key caller=0xdba2e3 box=0x... key=0x1a2
card layout enter box=0x... key=0x1a2
card text role=title caller=0xf0a2b3 flag=0 text="Abyss Nexus"
card text role=other caller=0xf10521 flag=0 text="Nexus imbued with the energy ..."
card layout leave box=0x...
```

## 3. Run instructions for the user

1. Install the v0.89 ZIP through DMM (game closed).
2. Open the world map. Hover one of the game's own discovered Abyss Nexus
   icons until its card opens (about one second). Move away.
3. Hover two of our chest markers (label only; nothing new is expected).
4. Optional: hover one Bell (the game's own Bell icon).
5. Press F8, close the game, say "done".

## 4. What the run decides

- Which element shows the title, and which function writes the description
  text (the role and caller of each `card text` line). B2 would then hook
  exactly those writes (or `0x3ed4e00` filtered to those elements while our
  chest card is shown) and substitute our item name, type and description.
- Whether the free text line (`+0x3d8` → element `+0x110`) is displayed, which
  is the B1 fallback.
- Which knowledge key the Nexus card uses, as a candidate neutral key K for
  showing a card at all for our chests.
- That nothing in this build runs off the map/UI thread (log the thread id
  check like the tooltip lines).

## 5. Risks of the logging build itself

- `0x3ed4e00` is hot. Keep the fast path to one thread-local read and a few
  pointer compares; no `Read` calls unless a match is likely.
- `0xf09e70` is large and may be re-entered; the thread-local flag is saved
  and restored, not just cleared.
- Every hook checks its guard bytes first; a mismatch only disables the card
  logging (log line), never the markers or the labels.
