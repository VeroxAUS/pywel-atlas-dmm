# Diagnostic loaded-save Bell read that follows game saves — v0.44

The v0.36–v0.43 observation runs are complete and preserved, including the
Calphade end-to-end check. Do not repeat them.

v0.44 fixes one gap found in the Calphade run. Travelling can unload
unrelated objects, which makes the selection retire and re-form for the same
loaded world. v0.43 then went back to reading the slot that was loaded,
forgetting the slot the game had saved to since. v0.44 keeps the last-saved
slot when the new selection has the same load scope, server child and
storage root (no load in between). A save made in the short gap between
retirement and re-formation is also kept (reason "linked-to-retired").

Earlier, v0.43 changed one rule from v0.42: in v0.42 every autosave also wrote slot
206 (range 200–207) about 50 ms after the real autosave slot, and no slot206
file exists. Following it moved the reader off the real autosave. v0.43 links
only writes to save-file slots 0–3 (autosave) and 100–108 (manual); 200–207
writes are logged with reason "instance-slot" and ignored.

## Observation

1. Close the game and replace the Save Detection observation entry in DMM with
   PywelAtlas-Save-Detection-Observation-v0.44.zip. Keep other Atlas ASIs disabled.
2. Load a save. Move briefly, wait a few seconds, press F7 and dismiss OK.
3. Trigger an autosave (for example sleep, or wait for the autosave icon).
   Wait a few seconds, press F7 and dismiss OK.
4. Make a manual save into a manual slot. Wait a few seconds, press F7 and
   dismiss OK.
5. Close the game normally and tell Claude which manual slot you saved to.

Close the game before replacing/disabling the ASI; live unload is unsupported.

## Purpose

v0.41 read Bells from the loaded slot, but an in-game save went to slot0, not
the loaded slot 2, so the reader kept reading an old file. v0.42 adds one
observation hook on the game's own "save game data to slot" function
(186e450, the counterpart of the load read 186f570):

- Each completed save logs a SAVE_WRITE line: the slot written, the result
  (0 = success), the saved object and its key, and whether it was linked.
- A save is linked to the current selection only if it succeeded, for a
  save-file slot (0–3 or 100–108), by the exact server child object that the selection's
  load produced, with no load or cleanup in between.
- A linked save moves the Bell reads to the slot just written and reads it
  at once. The popup shows the loaded slot, the slot being read, and the
  linked save count.
- A result read from the previous slot after the move is logged as
  "superseded" and discarded. The file watch now follows the slot being read.

Limitation: if the game finishes writing the file after its save function
returns, the immediate read may still see the previous file. The file watch
(about every 3 s) then re-reads it.

This remains diagnostic: no marker changes or save writes. All trusted flags
(including bellTrusted) remain zero.

F7 foreground/topmost confirmations and append-only logging are retained.
Log: C:\Users\Thomas\AppData\Local\PywelAtlas\native-save-detection.log
Fourteen guarded hooks preserve consumed arguments/results and LastError.
No native getter is invoked by the probe. Worker, reader and dialog threads
never dereference captured game pointers.

Compiled with MSVC /W4 without warnings. No automated tests added or run.
Runtime evidence for v0.44 is pending. MinHook BSD and pycrimson licenses are
included.
