# Pywel Atlas handoff

Version: **0.29.1** (`kModVersion` in `src/pywel-atlas/PywelAtlas.cpp`). Branch: `test` (never `main`).
Rules for the repo are in `CLAUDE.md`. There is no `PROJECT-NOTES.md` in this checkout.

## Build and package

- Dev build: `.\src\pywel-atlas\build.ps1` -> `dist/pywel-atlas/PywelAtlas.asi`
- Test build (teleporter): `.\src\pywel-atlas\build.ps1 -Test` -> `dist/pywel-atlas-test/`
- Release build (no debug keys, runs `check_release.py`): `.\src\pywel-atlas\build.ps1 -Release` -> `dist/pywel-atlas-release/`
- Needs Visual Studio 2022 C++ tools. `build/`, `dist/`, `archive/releases/` and zips are git-ignored.
- Existing release files: `archive/releases/PywelAtlas-0.29.1.zip`, `PywelAtlasTest-0.29.1.zip`, `PywelAtlasShrineIcons-0.11.1.zip`.
- Marker data is regenerated from `data/*-links.json` by the `prepare_*.py` scripts in `src/marker-bell/` at build time.

## Built (by feature)

| Feature | Markers | Save rule |
| --- | --- | --- |
| Sanctum Cores | 16 | Witch mission state 5 (cleansed) = done |
| Kuku Pot Items | 11 | field record + own uuid in disabled list = taken |
| Eggs (own category) | 10 | field record + own uuid in disabled list = taken |
| Memory Fragments | 254 | knowledge entry present |
| Hidden Treasure Map pieces | 12 | knowledge entry present |
| Legendary Animals | 24 (with patrol paths) | mission state 5 |
| Acria Sword second copy | loose Unique Gear ground item | data in `data/unique-gear-links.json` |
| Hillside Manor padlock strongbox | Treasure Chest row 191 | data in `data/treasure-chest-links.json` |

- 0.29.0: release logging (`ReleaseLog.cpp`: previous-session log kept, header, recent events, crash record + minidump, Support-tab bug report), map tooltips/knowledge card work, new categories above.
- 0.29.1 fixes: legendary animals, treasure map card, release logging (`PywelReleaseNote`, `PywelReleaseDetail`, Detailed log option).
- The MarkerState default-array fix is in the 0.29.1 source commit.

## Built but UNTESTED in game (for the big test pass)

Sanctum Cores, Kuku Pot Items, Eggs, the Acria Sword second copy, Hillside Manor strongbox (row 191), and the 0.29.1 fixes (legendary animals, treasure map card, release logging). Nothing here was run or built in the session that wrote this handoff, so none of it is runtime-confirmed. Check that `archive/releases/PywelAtlas-0.29.1.zip` matches the committed source before testing.

## Open items

- Random Power Cores and Abyss Transporters: no placed object found, so no markers.
- Faith/Oblation done flag: needs a save taken after cleansing them.
- Skipped: 27 Abyss Cell No. 0 (Thomas's choice; no save rule).
- Map tooltips design C (blue cooldown line, italic lore, ACTIVE/PASSIVE bars, item type and Defense on one line): feasibility check not done, no code changed.

## Repo notes for this push

- The local commits "Add second Acria Sword as a loose Unique Gear ground item" and "Add Hillside Manor padlock strongbox as Treasure Chest row 191" were not in this checkout; their data changes are inside the "Update chest and unique gear data" commit.
- Left untracked on purpose: `archive/pre-0.28.0-commit-backup/` (76 MB backup) and `research/scratch/`.
