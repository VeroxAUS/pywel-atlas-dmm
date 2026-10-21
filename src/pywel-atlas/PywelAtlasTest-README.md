# Pywel Atlas TEST build — teleporter

PywelAtlasTest.asi is the normal Pywel Atlas mod (v0.55: Bell markers, save
detection, teleport logging) **plus a test-only teleporter**. It exists to
speed up collectible checks. It is not the release mod.

**Use test saves only.** The game autosaves wherever you land.

## Install

1. Close the game.
2. In DMM, disable the normal PywelAtlas entry and install
   PywelAtlasTest-v0.55.zip instead. Never run both at once.
3. To go back, close the game and swap them again.

## Keys (only while the game window is in front)

| Key | Action |
| --- | --- |
| Ctrl+Right / Ctrl+Left | Next / previous target (a popup names it) |
| Ctrl+Up | Show the current target again |
| Ctrl+Down | Teleport to the current target |

On a full-size keyboard Ctrl+PageDown / PageUp / Home / End also work.

The normal keys (F6, F7, F8, F10) still work as in PywelAtlas v0.55.

## Targets (22)

1–2: Southern Guard Post Nexus and Hernand Abyss Nexus (spots the game itself
used for fast travel). 3–10: the 8 Bells. 11–22: the 12 Greymane Shrines
(17 is Kingshield Mountains Northern, at the spot confirmed in game).

## How it works and its limits

- It uses the same game function the game uses for fast travel and revive,
  then applies the same position again 3 seconds later, as the game does.
  You land 1.5 m above the target.
- There is no loading screen, so on a long jump you may arrive before the
  ground has loaded and fall. Start with short hops.
- It refuses a jump between the surface and the Abyss layer.
- Teleport on foot, not mounted, gliding, climbing, in combat or a cutscene.
- Results are written to `%LOCALAPPDATA%\PywelAtlas\teleporter.log`
  ("ARRIVED" or "NOT THERE").

## First test

1. Load a test save near Hernand (or fast travel to Hernand Abyss Nexus).
2. Ctrl+Right until the popup says "Hernand Bell" (about 80 m from the
   nexus), close the popup, press Ctrl+Down. Wait 5 seconds.
3. Note whether you moved, whether you stayed there, and anything odd.
4. If that worked: try a longer jump, e.g. another shrine.
5. Close the game normally and tell Claude what happened.

MinHook BSD and pycrimson licenses are included.
