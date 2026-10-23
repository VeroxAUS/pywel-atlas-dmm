# Map tooltips: Ghidra review of the 2026-10-22 plan

Written 2026-10-24 from the Ghidra decompile (`D:\Modding\pywel-atlas-ghidra\export`).
It checks every static claim in `docs/tooltip-implementation-plan.md` and adds
what that plan left open. The plan stays the implementation guide; this note
says which parts are confirmed, which change, and what Phase 0 must still log.
All addresses are RVAs for build timestamp `1790086912`.

Evidence marks: **confirmed** = read in the decompile this time;
**changed** = the plan said something else; **runtime** = still needs the game.

## 1. Verdict in one paragraph

The plan's mechanism holds. The getter `0x3edd6b0`, its nine call sites in seven
functions, the show path, the three hide paths, the string copy and the guard
bytes all match the decompile and the live executable. The one risk the plan
could not settle (do our icons get focus at all?) is now mostly answered: the
focus picker filters on nothing that differs between our markers and the game's
own icons of the same type, with one exception, the picker's own copy of the
zoom window, which Phase 0 must observe. The hook target runs inside the
world-map controller's per-frame work, so it should be on the map thread we
already hook; Phase 0 confirms the thread id as the plan says.

## 2. Claim-by-claim check

| Plan item | Result |
| --- | --- |
| 2.3 getter `0x3edd6b0`: template `element+0xa0` (skip when its `+8` is set), own attributes `element+0xe0`, then template attributes `+0x68`, name global `0x6d67038`, attribute lookup `0x4743a0`, returns `char*` or 0 | **confirmed** exactly |
| 2.3 guard bytes (24) | **confirmed** against `CrimsonDesert.exe` with the vendored `pefile` |
| 2.2 "has detailed tooltip" `0xd8c400` | **confirmed**. Ghidra inlines the `jmp` target, so `0xaab0410` is not a separate function in the export; look at `0xd8c400` |
| 2.2 show path inside `0xdae3a0`: `0xdba3f0(view, label)`, `0x3d5f80(label+0xd0, text)`, `0xf03800(label)`, `0xdcf090(view, 0)` | **confirmed**. The label is `controller[0xbc]` = `+0x5e0`. The getter is called twice in a row (test, then fetch). The hover timer `controller[0x157]` is zeroed first, so plain labels show at once, with no hover delay |
| 2.2 hide on focus loss (`0xdae66b`) | **confirmed**: `if (hasDetailed(old) \|\| (text(old->element) && *text)) hideBoxes(controller, 0)` |
| 2.4 hide callers `0xdaad10`, `0xda84b0`, `0xdb8a60` | **confirmed**, all three have the identical shape above, then clear `controller[0xb8]` (focused icon) |
| 2.4 `0xdb5510` "purpose unknown" | **changed**: it is the icon's element setup, called from `0xdaa150`, `0xdb3340` and `0xdb3bd0` (the creation function we hook). It reads the attribute once when the icon is set up and uses it as a key into a hash table on the controller (`+0x178/+0x188/+0x190`), likely a text-id lookup. For our icons this call happens before `ServiceMarkers` stores the element, so the hook returns the original 0 there anyway. Keep it unchanged |
| 2.4 `0x3ea30e0` generic | **confirmed** unrelated: it builds combobox option text (`.cpp-combobox-option-text`) and writes a tooltip when none exists. Never touch |
| 2.4 `0x3f1f9c0` generic | **confirmed**: the general UI mouse tooltip. It copies the text into its own string, measures it with the font and positions a box. If our map elements ever reach it, our text would show in a second, generic box. Return the original there, as planned |
| 2.1 five tooltip boxes at `+0x5d0..+0x5f0` | **confirmed** through `0xdba3f0`, which hides every box except the one passed |
| 2.1 the "view" object | **changed, naming only**: it is the world-map controller itself, class `pa::uiCommonScript::UIGamePlayControlRootWorldMap`, vtable `0x566ff50`, the same object our hooks already receive as `controller`. `0xdae3a0` is called only from `0xda8f60`, which is vtable slot 35 (`+0x118`) of that class |
| 3.1 text pointer lifetime | **confirmed** safe: `0x3d5f80` and `0x3f1f9c0` copy the text (strlen + `strncpy_s`); `0xdb5510` keeps the pointer only on its stack. Static constants in the DLL are still the simplest choice |
| 2.3 text format | **confirmed** NUL-terminated byte string. The label's CSS has `white-space: normal`, `width: auto`, `height: auto`; whether a `\n` breaks a line is **runtime** (the game's own HTML engine). Fallback stays `" - "` |

## 3. New: how the map decides which icon has focus

Risk 1 in the plan ("our markers never get focus") was unread. Both pickers are now read.

### 3.1 Mouse picker `0xdadcd0` (used when `0x6cae678` is non-zero, the mouse-cursor mode)

1. Candidates come from a quadtree on the controller (`+0x408`, cells of 0x38
   bytes, recursive `0xdb7890`), gathered for the cell under the cursor
   position (`controller+0xa90/+0xa94`).
2. Each candidate is a **picker entry**, not the icon. Entry layout seen:
   `+0x10` icon type (short), `+0x28` the icon, `+0x30/+0x38` map position,
   `+0x4c` skip flag, `+0x50` four floats (a zoom window), `+0x60` "window
   applies" flag.
3. Entry filters: skip flag clear; type not one of seven reserved types read
   from the UI config object (`...+0x270` fields `+0xae, +0xb2, +0x130,
   +0x136, +0x138, +0x13e, +0x142`: player, party and similar); type record
   `+0x2c` (category) not `0x2c` or `0x50`.
4. Hit test: cursor distance < `0x6cab858 * icon+0x280 (scale) * zoom`, with
   adjustments for `icon+0x2b8` (uses `+0x284` scale and record `+0x8c/+0xa4`
   when outside its zoom window `icon+0x1f8..+0x204`), and for `icon+0x2b5`
   (a vertical threshold).
5. If entry `+0x60` is set, the cursor zoom must lie inside the entry's own
   window at `+0x50` (with a small fade tolerance); if it is clear, no zoom
   check.
6. Then: layer class = type record `+0x2a` (0..2), or 3 when record `+0xb7` is
   set and `icon+0xe4` ≥ `0x6cde048`. The class byte in the controller's
   layer table (`controller+0x468`, the same table v0.80 found; set by
   `0xdcf100`) must be non-zero, and the 8 bytes at `icon+0x258` must be 0.
7. The winner is the entry with the lowest score `record+0x5c * 100000` plus
   distance; the icon goes to `controller[0xb8]`, the entry to
   `controller[0xb9]`.

### 3.2 Controller picker `0xd95eb0` (per layer, when the mouse mode is off)

Works on the icons directly. Needs `icon+0x2ba == 0`, `icon+0x1d5 == 0`,
either (`template+0xb0 & 0x60 == 0x40` and `icon+0x2b9 != 0`) or
`icon+0x2bc != 0`, record `+0xab == 0`, the same layer table check, and
`icon[0x4b] == 0` (`+0x258`, as above). Distance and zoom-window handling
mirror the mouse picker, using the icon's own windows at `+0x1f8/+0x204`.

### 3.3 What this means for our markers

- Nothing in either picker reads a field we set differently from the game's
  own chest or Bell icons: same type, same record, same template, same layer
  class. If a native chest icon can be hovered, ours can.
- `icon+0x258` is not something we write; Phase 0 should dump it for one of
  our icons (F8) in case the game leaves it non-zero on icons it did not
  create through its normal data path.
- The one real difference: v0.54's `DisableZoomWindows` clears the enabled
  bytes on the **icon** (`+0x208, +0x21c, +0x230`). The mouse picker uses the
  **entry's** window (`+0x50/+0x60`). If the entry is a copy taken when the
  icon was created, our markers draw at every zoom but can only be hovered
  inside the type's native window (near full zoom-in for Bells and chests).
  The entry builder was not found in this pass (it is not in the map chunk
  under an obvious pattern). Phase 0 answers this directly: log the zoom
  level with every show call for our elements. If hover only arrives near
  full zoom, the fix is one more memory write on our own entry
  (`entry+0x60 = 0`), found at runtime through `controller[0xb9]` once any
  of our icons has had focus, or by walking the quadtree from
  `controller+0x408`.

## 4. Changes to the plan

1. Rename "view" to "controller" in the code; it is the object we already
   have in `ObserveWorldMapUpdate`, so `mapController` needs no new capture,
   only the last value seen on the map thread.
2. Phase 0 log line per show call for our elements: add the current zoom
   (`controller+0xaa0`) and `icon+0x258`. Add one F8 dump of
   `controller[0xb9]` (the focused entry) with its `+0x50..+0x60` bytes.
3. `0xdb5510` moves from "unknown" to "icon setup, leave alone". Its return
   address `0xdb5585` joins the "Other" group with a known reason.
4. Everything else in the plan (element table, hide rule, `removingElement`,
   LastError, guard-fail = feature off) stands as written.

## 5. Open runtime questions (Phase 0 and 1)

- Thread id of the hook versus the map update thread (plan 4.1).
- Do show calls arrive for our elements at low zoom (section 3.3)?
- Does `\n` break a line in the plain label?
- Does the game ever clear our table entry before asking the hide callers
  (map rebuild on load with the map open, plan risk 2)?

## 6. Ghidra commands used

```
python -B research/scripts/ghidra_lookup.py func 0x3edd6b0
python -B research/scripts/ghidra_lookup.py callers 0x3edd6b0
python -B research/scripts/ghidra_lookup.py func 0xdae3a0      # show path, lines ~168 and ~389
python -B research/scripts/ghidra_lookup.py func 0xdadcd0      # mouse focus picker
python -B research/scripts/ghidra_lookup.py func 0xd95eb0      # controller focus picker
python -B research/scripts/ghidra_lookup.py vftable 0x566ff50  # world-map controller class
```
