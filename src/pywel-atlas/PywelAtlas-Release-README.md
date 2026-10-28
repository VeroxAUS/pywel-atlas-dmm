# Pywel Atlas

An in-game collectible tracker for Crimson Desert. It puts a map marker on
every collectible you have not found yet, on the world map and the minimap,
and removes each marker by itself once your save records it as done.

## What it shows

- Bells, treasure chests (chest levels, caves, dungeons, puzzle strongboxes
  and house chests) and Abyss chests
- Greymane Shrines
- Abyss Nexuses (surface and Abyss islands)
- Sealed Abyss Artifacts and Abyss Cressets
- Constellations
- Unique gear (one-of-a-kind items)

Markers use the game's own icons and stay visible at every map zoom.
Hovering a marker shows its name, and chests show what is inside. Some
markers open the map's information card with more detail. A small arrow
shows when a nearby marker is far above or below you.

The mod only reads your save to see what is done. It never writes to your
saves.

## Install

1. Close the game.
2. Add `PywelAtlas-v0.NNN.zip` in DMM (Crimson Desert mod manager).
3. Also add the **Pywel Atlas Shrine Icons** file mod
   (`PywelAtlasShrineIcons-v0.NN.zip`). It provides the shrine and
   Constellation icons, the even marker sizes, the height arrows and the
   route line's look.
4. Start the game and load your save. The markers appear by themselves once
   the save is read (open the map to see them).

To update, close the game and replace the old zips with the new ones in DMM.

## Keys

| Key | Action |
| --- | --- |
| F9 | Open or close the Pywel Atlas panel |
| Shift+F9 | Make the completion widget compact or expanded |
| F6 | Turn all markers on |
| F10 | Turn all markers off |
| (none) | Skip the next route stop (set a key in the panel if you want one) |
| Esc | Close the panel |

Every key can be changed on the panel's **Hotkeys** tab. Your keys are saved
in `keybinds.ini`. Pywel Atlas uses keyboard and mouse only.

## The panel (F9)

- **Filters:** choose which collectible types are shown.
- **Route:** turn on a route line through the nearest collectibles you
  still need, on the world map and the minimap.
- **Completion:** how many of each type you have collected, per region, and
  the always-on completion widget.
- **Hotkeys:** change the keys above.
- **Support:** the mod and game versions, **Create bug report**, and
  **Open log folder**.

Your choices are saved automatically in `filters.ini`.

## Files

All in `%LOCALAPPDATA%\PywelAtlas`:

- `filters.ini` and `keybinds.ini`: your panel choices and keys.
- `pywel-atlas.log`: a short log of the current session (versions,
  start-up, save reads, marker counts and errors).
  `pywel-atlas.previous.log` is the session before, kept so the log of a
  session that crashed survives a restart.
- `PywelAtlas-bug-report-<date>-<time>.txt`: made by **Create bug report**
  on the panel's Support tab. It holds the logs and settings, never a save
  file. If something does not work, please attach it to your bug report.
- `pywel-atlas-crash-<date>-<time>.dmp`: written only if Pywel Atlas itself
  crashes the game. Please attach it too. The newest 3 are kept.

## Licenses

Pywel Atlas uses MinHook (BSD), Dear ImGui (MIT) and data from pycrimson.
Their licenses are included next to the mod file.
