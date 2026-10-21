# Diagnostic loaded-save selection — v0.39

The v0.36 death/retry/autosave, v0.37 and v0.38 normal-load runs are complete
and preserved. Do not repeat them.

## Observation

1. Close the game and replace the Save Detection observation entry in DMM with
   PywelAtlas-Save-Detection-Observation-v0.39.zip. Keep other Atlas ASIs disabled.
2. Launch, load your game normally, and move around briefly.
3. Press F7, dismiss OK, and tell Claude the checkpoint is recorded.

Close the game before replacing/disabling the ASI; live unload is unsupported.

## Purpose

v0.38 showed both side-specific actor managers queried with the identical
full user key (0x90100000), both user actors storing it at +60, the client
user selecting the loading controller's child and the server user selecting
the child loaded from the save slot. v0.39:

- Requires full-key equality plus each user's +60 equal to its lookup key.
  The masked 20-bit index check is removed: it is 0 for this key and would
  match unrelated keys. The key is a constant local-user identity, not a save
  identity.
- Adds a worker-owned diagnostic selection {serial, generation, load scope,
  slot, account, user key, root}. It forms only when the matched boundary
  holds in the current generation and the game's captured Steam storage root
  is exactly <LOCALAPPDATA>\Pearl Abyss\CD\save\<digits>, with
  slot<N>\save.save present (attribute queries only; nothing is opened).
- Retires the selection on any generation change (load start, context
  cleanup, queue drop) or a storage re-initialization with a different root.
  Death/retry and later loading stages alone do not retire it, because v0.36
  showed retry reusing the loaded world without a disk load or cleanup.

Log lines: SELECTION formed / withheld / retired; CHECKPOINT adds selection
fields; the popup shows the diagnostic account and slot.

This remains diagnostic. Nothing consumes the selection: no Bell reads,
marker changes or save writes. Both trusted-state flags remain zero.

F7 foreground/topmost confirmations and append-only logging are retained.
Log: C:\Users\Thomas\AppData\Local\PywelAtlas\native-save-detection.log
Thirteen guarded hooks preserve consumed arguments/results and LastError.
No native getter is invoked by the probe. Worker and dialog threads never
dereference captured game pointers.

Compiled with MSVC /W4 without warnings. No automated tests added or run.
Runtime selection evidence is pending. MinHook BSD license is included.
