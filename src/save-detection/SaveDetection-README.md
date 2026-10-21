# Diagnostic loaded-save selection — v0.40

The v0.36 death/retry/autosave, v0.37 and v0.38 normal-load and v0.39
normal-load and save-switching runs are complete and preserved. Do not
repeat them.

## Observation

1. Close the game and replace the Save Detection observation entry in DMM with
   PywelAtlas-Save-Detection-Observation-v0.40.zip. Keep other Atlas ASIs disabled.
2. Launch, load a save, move briefly, press F7 and dismiss OK.
3. Quit to the title screen, press F7 and dismiss OK.
4. Load a different save, move briefly, press F7 and dismiss OK.
5. Close the game normally and tell Claude it is done.

Close the game before replacing/disabling the ASI; live unload is unsupported.

## Purpose

v0.39 formed one selection per load with the correct slot and none at the
title screen. In the title teardown, though, an unrelated cleanup advanced the
generation and the selection was re-formed at once from the boundary result
cached from the previous generation. That result is recomputed only on key
lookups and controller snapshots. v0.40 recomputes the boundary whenever the
generation advances, so old evidence stops counting before the selection is
re-evaluated.

Expected: after any cleanup or load start, a "SELECTION retired" line with no
"SELECTION formed" until a new CLIENT_BOUNDARY ... matched=1.

Everything else is unchanged from v0.39:

- Full-key equality plus each user's +60 equal to its lookup key. The key is
  a local-user identity, not a save identity, and it changes when the world
  is rebuilt after a title return.
- A worker-owned diagnostic selection {serial, generation, load scope, slot,
  account, user key, root}. It forms only when the matched boundary holds in
  the current generation and the game's captured Steam storage root is exactly
  <LOCALAPPDATA>\Pearl Abyss\CD\save\<digits>, with slot<N>\save.save present
  (attribute queries only; nothing is opened).
- The selection retires on any generation change (load start, context
  cleanup, queue drop) or a storage re-initialization with a different root.

This remains diagnostic. Nothing consumes the selection: no Bell reads,
marker changes or save writes. Both trusted-state flags remain zero.

F7 foreground/topmost confirmations and append-only logging are retained.
Log: C:\Users\Thomas\AppData\Local\PywelAtlas\native-save-detection.log
Thirteen guarded hooks preserve consumed arguments/results and LastError.
No native getter is invoked by the probe. Worker and dialog threads never
dereference captured game pointers.

Compiled with MSVC /W4 without warnings. No automated tests added or run.
Runtime evidence for v0.40 is pending. MinHook BSD license is included.
