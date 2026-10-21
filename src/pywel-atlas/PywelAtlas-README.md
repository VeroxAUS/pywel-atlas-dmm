# Pywel Atlas — combined mod v0.50 (phase 1)

One mod file, PywelAtlas.asi, that joins the two earlier parts without
changing what either does:

- **Save detection** (same as Save Detection v0.44): works out which save is
  loaded and which slot the game last saved it to, and reads its Bells.
  Log: %LOCALAPPDATA%\PywelAtlas\native-save-detection.log
- **Map marker** (same as Map Proof v0.32): shows and removes the test map
  marker ("proof chest"), linked to the Hernand Bell through a save slot you
  choose by hand. Log: %LOCALAPPDATA%\PywelAtlas\native-map-categories.log

The two parts do not talk to each other yet (that is phase 2).

## Install

1. Close the game.
2. In DMM, disable the separate "Save Detection" and "Map Proof" entries.
   Never run them together with this one: the same hooks would be installed
   twice.
3. Add PywelAtlas-v0.50.zip in DMM and enable it.

Close the game before replacing or disabling the ASI; live unload is
unsupported.

## Keys

| Key | Part | Action |
| --- | --- | --- |
| F7 | Save detection | Checkpoint popup (loaded save, slot being read, Bells) |
| Shift+F7 | Map marker | Read the hand-picked slot and enable the Bell link (was plain F7) |
| F6 | Map marker | Show the proof chest for 3 minutes |
| F8 | Map marker | Diagnostic snapshot |
| F9 | Map marker | Choose a save slot by hand |
| F10 | Map marker | Remove the proof chest |

## Phase 1 test

1. Load a save. Press F7: the save-detection popup should look as before.
2. Press F9 and pick the save you loaded, then Shift+F7: the map-marker popup
   should appear as before.
3. Press F6, open the map: the proof chest shows (if Hernand is not
   completed in that save) or is withheld (if it is).
4. Press F10, then close the game normally and tell Claude.

How it is joined: PywelAtlas.cpp initializes MinHook once and starts both
parts' workers. Each part checks the game version and its own guard bytes,
then creates and switches on only its own hooks (14 + 9). Nothing writes to
the game's saves.

Compiled with MSVC /W4. No automated tests added or run. MinHook BSD and
pycrimson licenses are included.
