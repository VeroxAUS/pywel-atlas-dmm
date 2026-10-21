# Native actor-link observation — v0.37

The v0.36 death/retry/autosave run is complete and preserved. Do not repeat it.

## One new observation

1. Close the game and replace the Save Detection observation entry in DMM with
   PywelAtlas-Save-Detection-Observation-v0.37.zip. Keep other Atlas ASIs disabled.
2. Launch, load your game normally, and move around briefly.
3. Press F7, dismiss OK, and tell Codex the checkpoint is recorded.

No deliberate death, autosave selection, or title/Continue sequence is needed.
Close the game before replacing/disabling the ASI; live unload is unsupported.

## Purpose

v0.36 compared ClientChildOnlyInGameActor with ServerChildOnlyInGameActor by
address. These are distinct objects. v0.37 observes the game's existing actor
resolver at RVA 17ef9c0: component context -> native actor registry -> reference
wrapper. The observed returned world actor's manager and selected server child
are copied as diagnostic evidence. Exact manager and child vtables plus a
reciprocal child-owner check gate any nativeLinkRead=1 result.

The shared child getters justify reading the client child's c3/a0 fields too;
ClientUserActor (55b59f0) is now distinguished from ServerUserActor (5b257a8).
Field-ready callbacks additionally record their native fourth actor argument.
No timing, raw entity-ID equality, or relaxed pointer match can assert a link.

An observed link may arrive after the controller snapshot; summary matching
handles either order and requires both observations after the current native
load. An unsuccessful lookup remains visible. The new resolver does not have
to be called by every loading path; its absence is an observation to inspect,
not permission to guess a relationship.

This remains diagnostic. A phase-24 match does not distinguish death from
controllable gameplay. No Bell reader, automatic account/slot consumption, or
marker changes are enabled. Both trusted-state flags remain zero.

F7 foreground/topmost confirmations and append-only logging are retained.
Log: C:\Users\Thomas\AppData\Local\PywelAtlas\native-save-detection.log
Eleven guarded hooks preserve consumed arguments/results and LastError.
No additional native getter is invoked by the probe. Worker and dialog threads
never dereference captured game pointers. Repeated resolver/controller values
are omitted; actual queue drops are counted separately.

Compiled with MSVC /W4 without warnings. No automated tests added or run.
Runtime actor-link evidence is pending. MinHook BSD license is included.
