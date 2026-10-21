# Pywel Atlas — combined mod v0.52

One mod file, PywelAtlas.asi. It now shows **one map marker at each of the
8 known Bells** and hides each one automatically once the detected save
records that Bell as completed.

- **Save detection** (as in Save Detection v0.44) works out which save is
  loaded and which slot the game last saved it to, reads that slot's Bells,
  and shares the accepted result with the markers.
- **Bell markers** are shown on the world map at each Bell whose save record
  is not completed. After the game saves a newly completed Bell, its marker
  is removed. Loading another save updates the markers to that save.
  - Markers appear without pressing anything once the save is confirmed
    (open the world map to see them).
  - While the loaded save is not confirmed yet (just after loading, or if a
    read failed), existing markers stay but no new ones appear. Unknown
    never counts as "not completed".
  - There is no time limit, and switching away from the game does not remove
    them (both were rules of the earlier 3-minute test chest).
  - The markers currently use the treasure-chest map icon.

Known Bells: Calphade, Delesyia, Demeniss, Hernand, Pailune, Scholastone,
Tommaso, Varnia. The single test chest from native-map-marker.json is not
used in this build.

Logs (in %LOCALAPPDATA%\PywelAtlas): native-save-detection.log and
native-map-categories.log.

## Install

1. Close the game.
2. In DMM, keep the separate "Save Detection" and "Map Proof" entries
   disabled, and replace PywelAtlas v0.51 with PywelAtlas-v0.52.zip.

Close the game before replacing or disabling the ASI; live unload is
unsupported.

## Keys

| Key | Action |
| --- | --- |
| F6 | Turn the Bell markers back on (after F10) |
| F7 | Save-detection checkpoint popup (loaded save, slot being read, Bells) |
| F8 | Diagnostic snapshot |
| F10 | Turn all Bell markers off |

## v0.52 test

1. Load "Manual 2" (only Hernand completed). Wait a few seconds, open the
   world map: markers at the 7 other Bells, none at Hernand.
2. Switch away from the game (Alt+Tab) and back. The markers should stay.
3. Press F10 once: all markers go. Press F6 once: they come back.
4. From the in-game menu, load "Manual 4" (Hernand and Calphade completed).
   Open the map: the Calphade marker is gone; 6 remain.
5. Close the game normally and tell Claude.

Nothing writes to the game's saves. Compiled with MSVC /W4. No automated
tests added or run. MinHook BSD and pycrimson licenses are included.
