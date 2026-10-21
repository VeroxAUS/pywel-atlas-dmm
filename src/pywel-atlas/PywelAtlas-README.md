# Pywel Atlas — combined mod v0.54

One mod file, PywelAtlas.asi. It shows **one map marker at each of the 8
known Bells** and hides each one automatically once the detected save
records that Bell as completed.

New in v0.54:

- The markers use the game's own **Bell map icon**, so they look native.
- The markers stay visible at **every map zoom**. The game normally shows
  this icon only when zoomed in. The mod switches that zoom limit off on its
  own markers only (a small change inside each of our own map icons). The
  game's own Bell icons and every other icon are untouched.
- The v0.53 logging is kept (zoom values on F8, player position from the
  minimap), plus whether each marker's zoom limit is off.

How it works:

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
    them.

Known Bells: Calphade, Delesyia, Demeniss, Hernand, Pailune, Scholastone,
Tommaso, Varnia. The single test chest from native-map-marker.json is not
used in this build.

Logs (in %LOCALAPPDATA%\PywelAtlas): native-save-detection.log and
native-map-categories.log.

## Install

1. Close the game.
2. In DMM, keep the separate "Save Detection" and "Map Proof" entries
   disabled, and replace PywelAtlas v0.53 with PywelAtlas-v0.54.zip.

Close the game before replacing or disabling the ASI; live unload is
unsupported.

## Keys

| Key | Action |
| --- | --- |
| F6 | Turn the Bell markers back on (after F10) |
| F7 | Save-detection checkpoint popup (loaded save, slot being read, Bells) |
| F8 | Diagnostic snapshot |
| F10 | Turn all Bell markers off |

## v0.54 test (one session)

1. Load a save where some Bells are not completed. Open the world map.
2. Check the markers now show the Bell icon. Near a Bell the game already
   marks, note whether you see one icon or two on top of each other.
3. Zoom fully IN, press F8. Zoom to the MIDDLE, press F8. Zoom fully OUT,
   press F8. Note at each: markers visible, faint or gone?
4. Close the map, then reopen it once and check the markers are still there.
5. Close the game normally and tell Claude what you saw.

Nothing writes to the game's saves. Compiled with MSVC /W4. No automated
tests added or run. MinHook BSD and pycrimson licenses are included.
