# Pywel Atlas — combined mod v0.59

One mod file, PywelAtlas.asi. It shows **one map marker at each of the 8
known Bells and each of 164 treasure chests**, and hides each one
automatically once the detected save records it as done.

New in v0.59: **cave chests**

- 44 more chest markers: the chests in caves, sewers and dungeons that the
  game keeps in the same chest list as the chest-level chests (19 in
  Hernand, 10 in Demeniss, 6 in Delesyia, 5 in the Crimson Desert, 4 in
  Kweiden). They are saved the same way (checked in game with the Echoing
  Tunnel chest), so the same rule hides them once opened.
- Still not shown: puzzle strongboxes in houses (for example the Count's owl
  box in Hernand; saved differently, planned next), chests that only exist
  during certain quests, and the Abyss chests.

From v0.58: **treasure chests**

- One chest-icon marker at each chest of the game's dedicated chest levels
  (120 chests across Hernand, Demeniss, Delesyia, Kweiden and the Crimson
  Desert) that the save does not record as opened. These chests are saved
  like Bells: opening one marks its record as completed (checked in game with
  the Church of Calphade tower chest), and they do not refill.
- The marker limit is raised from 31 to 256 per category. The mod now checks
  32 markers per map update in turn, so many markers stay light on the game.
- Greymane Shrine markers are paused: the game refused to build our shrine
  icon (v0.56/v0.57). The save still reports shrines in the F7 popup.

From v0.57: a marker whose creation fails waits 5 seconds before trying
again, so it never blocks the others.

From v0.54/v0.55:

- Markers use the game's own icons and stay visible at **every map zoom**.
  The zoom limit is switched off on our own markers only; the game's own
  icons are untouched.
- v0.55 logging of the game's own player-move functions is kept
  (`teleport-observe.log`). It moves nothing.

How it works:

- **Save detection** works out which save is loaded and which slot the game
  last saved it to, reads that slot, and shares the accepted result with
  the markers.
- **Markers** are shown on the world map at each Bell / chest the save does
  not mark as done. After the game saves a newly completed Bell or a newly
  opened chest, its marker is removed. Loading another save updates the
  markers to that save.
  - Markers appear without pressing anything once the save is confirmed
    (open the world map to see them; 164 chests take a few seconds).
  - While the loaded save is not confirmed yet (just after loading, or if a
    read failed), existing markers stay but no new ones appear. Unknown
    never counts as "not done".
  - There is no time limit, and switching away from the game does not remove
    them.

Known Bells: Calphade, Delesyia, Demeniss, Hernand, Pailune, Scholastone,
Tommaso, Varnia. Chest list: `data/treasure-chest-links.json` in the source.

Logs (in %LOCALAPPDATA%\PywelAtlas): native-save-detection.log,
native-map-categories.log and teleport-observe.log.

## Install

1. Close the game.
2. In DMM, keep the separate "Save Detection" and "Map Proof" entries
   disabled, and replace PywelAtlas v0.58 with PywelAtlas-v0.59.zip.
   Never run it together with PywelAtlasTest.

Close the game before replacing or disabling the ASI; live unload is
unsupported.

## Keys

| Key | Action |
| --- | --- |
| F6 | Turn all markers back on (after F10) |
| F7 | Save-detection checkpoint popup (loaded save, slot being read, Bells, shrines, chests) |
| F8 | Diagnostic snapshot |
| F10 | Turn all markers off |

A per-category on/off filter comes later as an in-game panel.

## v0.59 test (one session, about 5 minutes)

1. Load Manual 4 (the last cave test save: the Calphade tower chest, Chest C
   in Lioncrest Manor and the Echoing Tunnel chest are opened there).
2. Press F7: the popup should say "3 of 164 chests opened".
3. Open the world map and wait about 10 seconds. Expected: new chest icons
   at caves (for example Blade Cavern, Shadowheart Grotto, Cloudmist Cave
   near Hernand), none at the Echoing Tunnel, Lioncrest Manor or the Church
   of Calphade tower. Zoom fully in and out.
4. Press F8 once with the map open, close the game normally and tell Claude
   what you saw.

Nothing writes to the game's saves. Compiled with MSVC /W4. No automated
tests added or run. MinHook BSD and pycrimson licenses are included.
