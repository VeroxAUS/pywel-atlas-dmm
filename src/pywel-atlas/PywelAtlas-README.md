# Pywel Atlas — combined mod v0.51 (phase 2)

One mod file, PywelAtlas.asi. The map marker now follows the save the mod
detects, not a slot picked by hand:

- **Save detection** (as in Save Detection v0.44) works out which save is
  loaded and which slot the game last saved it to, reads that slot's Bells,
  and shares the accepted result with the marker.
- **Map marker** (based on Map Proof v0.32) shows the test marker ("proof
  chest") only if its linked Bell is NOT completed in the detected save.
  - If that Bell is completed, the chest is removed and cannot be shown
    again for that save.
  - Loading a different save removes the old save's chest.
  - While the loaded save is not confirmed yet (just after loading, or if a
    read failed), F6 is withheld. Unknown never counts as "not completed".

Logs (in %LOCALAPPDATA%\PywelAtlas): native-save-detection.log and
native-map-categories.log.

## Linking the marker to a Bell

In %LOCALAPPDATA%\PywelAtlas\native-map-marker.json, the "completion" object
names the Bell:

    "completion": { "source": "bell", "id": "mg:545680" }

That example is the Calphade Bell. Known ids: Calphade mg:545680, Delesyia
mg:549762, Demeniss mg:549777, Hernand mg:543894, Pailune mg:549990,
Scholastone mg:545847, Tommaso mg:549727, Varnia mg:549675.
`{ "source": "none" }` keeps the original Hernand Bell link. The file is
read when F6 is pressed.

## Install

1. Close the game.
2. In DMM, keep the separate "Save Detection" and "Map Proof" entries
   disabled, and replace PywelAtlas v0.50 with PywelAtlas-v0.51.zip.

Close the game before replacing or disabling the ASI; live unload is
unsupported.

## Keys

| Key | Action |
| --- | --- |
| F6 | Show the proof chest for 3 minutes, if the detected save allows it |
| F7 | Save-detection checkpoint popup (loaded save, slot being read, Bells) |
| F8 | Diagnostic snapshot |
| F10 | Remove the proof chest |

F9 (pick a slot) and Shift+F7 (manual save read) are off in this build.

## Phase 2 test (link the marker to Calphade first)

1. Load "Manual 2" (before Calphade was rung). Wait a few seconds, press F6
   and open the map: the chest should show.
2. From the in-game menu, load "Manual 4" (after Calphade). The chest should
   be gone. Press F6: it should stay hidden (Calphade completed).
3. Load "Manual 2" again and press F6: the chest shows. Ring the Calphade
   Bell and let the game save (autosave or manual). The chest should then
   disappear by itself.
4. Close the game normally and tell Claude.

Nothing writes to the game's saves. Compiled with MSVC /W4. No automated
tests added or run. MinHook BSD and pycrimson licenses are included.
