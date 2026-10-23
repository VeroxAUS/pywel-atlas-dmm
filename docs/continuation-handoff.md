# Pywel Atlas: continuation handoff (2026-10-22, after v0.79)

For a new Claude session picking up this project. Read this file, then
`CLAUDE.md` (project rules and older history). `docs/native-save-detection.md`
is the older evidence log (detailed up to v0.59); later evidence is in this
file, in `research/traces/` and in the research scripts. `docs/handoff/` is an
older frozen transfer: read it for background only, never edit it.
`docs/tooltip-implementation-plan.md` is a separate, not-started plan for map
tooltips (written by another session the same day).

## 1. What the project is

A standalone Crimson Desert mod installed through DMM (Definitive Mod
Manager). It works out which save is loaded, reads that save file from disk
(read-only), and puts the game's own map icons on the world map and the
minimap at collectibles the save does not mark as done, removing each once the
save says it is done. An in-game panel (F9) switches each category on or off.

It ships as **two DMM items**:

1. `PywelAtlas.asi` (the mod itself; `archive/releases/PywelAtlas-vX.YY.zip`).
2. **Pywel Atlas - Shrine Icons**, a DMM file mod (`mod.json` beside `ui/`)
   that adds a world-map layout for the game's own Greymane Shrine icon to
   `ui/xml/gamemain/template/worldmapicon.thtml` and `worldmapicon.css`
   (`archive/releases/PywelAtlasShrineIcons-v0.78.zip`). Without it the game
   refuses shrine icons on the world map; the ASI then stops trying there and
   the panel row says "needs add-on" (minimap shrine pins still work).

Parts of the ASI (all compiled into one ASI by `src/pywel-atlas/build.ps1`):

- `src/save-detection/NativeSaveLoadProbe.cpp`: game-function hooks that
  detect the loaded save and the slot it was last saved to; a worker reads
  that slot and publishes the result (`src/pywel-atlas/LoadedSave.h`).
- `src/marker-bell/NativeSaveReader.cpp`: decrypts, verifies and parses the
  save (format from pycrimson, MIT). Three independent passes over the
  decoded data: the Bells' list (Bells, chests, Abyss chests, discovered
  Nexuses), the knowledge list (shrines), the field-object list (strongboxes,
  house chests, activated Nexuses). A failed pass makes only its categories
  unknown.
- `src/marker-bell/NativeMapCategoryProbe.cpp`: map-icon hooks; creates and
  removes our markers per category (`kCategories`) on two "map sides"
  (`MapSide`: world map, serviced after the world-map update hook; minimap,
  serviced after the minimap update hook). Applies the panel's choices and
  saves them to `%LOCALAPPDATA%\PywelAtlas\filters.ini` (`MarkerFilter.h`).
- `src/pywel-atlas/FilterPanel.cpp`: the in-game panel (Dear ImGui 1.92.9b,
  `src/pywel-atlas/vendor/imgui/`, MIT license in `third_party/imgui/`).
  Hooks only Windows' `dxgi.dll`. Log: `filter-panel.log`.
- `src/pywel-atlas/TeleportObserve.cpp`: watch-only logging of player moves.
- `src/pywel-atlas/TestTeleporter.cpp`: test build only (`build.ps1 -Test` →
  `PywelAtlasTest.asi`). Never in the release. v0.68: if
  `%LOCALAPPDATA%\PywelAtlas\teleport-targets.txt` has targets, only those are
  offered (the 22 built-in ones only when the file has none).
- `src/pywel-atlas-ui/build_ui_patch.py`: builds the Shrine Icons file mod
  from the user's own game install (see section 6).

Keys: F6 all markers on, F7 save-detection popup, Shift+F7 marker manual read
(unused), F8 diagnostic snapshot (also lists icon types with a world-map look),
F9 filter panel, F10 all markers off (silent; the user once hit it by
accident and saw no pins: press F6). Test build: Ctrl+Right/Left pick a
teleport target, Ctrl+Up show it, Ctrl+Down go (refuses surface↔Abyss jumps).

## 2. Rules you must keep (from the user)

- **Write code only. Never edit any .md file (this file, CLAUDE.md, the
  notes, READMEs) or write other documentation unless the user expressly
  asks.** Report results briefly in chat. (Code comments required by
  CLAUDE.md still apply.)
- **Offline first (user, 2026-10-22):** before asking the user to run the
  game, check everything you can offline: the game's packed files (UI
  templates in pack 0012, level files in 0015, static tables), disassembly of
  the executable (pefile/capstone), copied save files, existing logs. Only ask
  for an in-game run to confirm a hypothesis that cannot be settled offline,
  and bundle such checks into one run. The user wants to test as little as
  possible.
- Never write to the game's save folder. Copy slot files elsewhere to study
  them (`research/vendor/work/...`). "Manual N" = `slot(99 + N)`.
- Only explicit save records may confirm completion. Never infer from
  proximity, file age, missing records or errors. Unknown is never "not done"
  (unknown spots get no marker, and are logged).
- Keep exact hook guards (24-byte checks for game code; dxgi.dll range check
  for Windows code), exact Windows x64 argument and result forwarding,
  LastError.
- **Free rein (user, 2026-10-23):** Claude may call game functions, add hooks
  and write game memory whenever it is needed to make the mod work, without
  asking first. The user takes responsibility for that. Good practice still
  applies: verify guard bytes before calling or hooking game code, touch only
  our own verified markers where possible, and say in the report what was
  added. (Before this, only the icon create/find/remove calls, the test-only
  teleporter and the zoom-window bytes on our own markers were allowed.)
- One mod: no companion process, no Python at runtime, no desktop overlay. A
  second DMM item that only replaces game interface files is accepted (the
  Shrine Icons file mod).
- Icons: use the game's own matching icon per category so markers look
  native. Exceptions the user approved: Abyss chests use the normal chest icon
  (226) "even in the final version"; Greymane Shrines use their real icon via
  the Shrine Icons file mod. Drawing our own icon images is acceptable to the
  user only if it looks exactly native (idea kept in mind, see section 5).
- Do not add or run tests unless asked. Workflow: compile with /W4, inspect
  logs, the user runs the game. Never treat compiling as runtime confirmation.
- Git: commit or push only when the user asks. Work on `main`. Commit messages
  end with `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`.
- Brief, plain language (KISS); explain jargon. Every source file starts with
  a plain-language summary; every function has a short comment.
- Treasure chests: only chests that do not refill are tracked. Chests that
  only exist during quests stay hidden (unknown).
- Downloads need the user's OK.

## 3. Where things stand

### Confirmed in game (runtime)

- Save detection follows the loaded save and its save writes (v0.38–v0.44).
- Bell markers, native Bell icon (360), every zoom (v0.54).
- Chest markers (v0.58–v0.59): 120 chest-level + 44 cave/dungeon chests.
  Done = Bells'-list record, key 1000007, chest UUID, `_isCompleted`.
- Filter panel (v0.62–v0.66): all frame-generation modes, input hold-back,
  mouse during play, checkboxes, `filters.ini`. The user reports the menu
  cursor flicker is fine now (it also happened with the panel closed, so it
  was not the panel).
- Puzzle strongboxes and house chests (v0.68, saves `research/vendor/work/
  strongbox-test*/`): field-object record for the box UUID (all 4 words,
  4th = 0), reason 1, reset "never" (0xFFFFFFFFFFFFFFFF), state 353047760
  (puzzle boxes, stolen or not) or 1537827618 (looted itembox), 2255254665 =
  closed. Puzzle boxes get the record only when opened. The Hernand itembox
  also got a Bells'-list record with key 1000134 + `_isCompleted`. Pins
  disappeared after saving. 190 chests total (164 + 26 field-rule).
- Generic chests `gimmick_treasurebox_06` (and `_07` from the cave test)
  have a finite refill timer before and after opening → refill → not tracked
  (wagon chest save test, Manual 3/4, 2026-10-22). Types 01/05 assumed the
  same (same generic design; not tested).
- Abyss chests (v0.69–v0.70, saves `research/vendor/work/abyss-test/`): 74,
  same rule as cave chests (seen record, then `_isCompleted`). The game
  refuses its own Abyss chest icon (40) on the world map (no world layout),
  so they use the chest icon 226; pins confirmed on the Abyss map layer.
- Greymane Shrine pins (v0.77 test + Shrine Icons file mod; traces
  `research/traces/pywel-atlas-test-v0.77-shrine-icons-minimap-*.log`): all
  11 undiscovered shrines created on the world map; the found one (Nas River)
  correctly has none. Cause of the old refusal, from the game files: the
  world map's layout file has no shrine layout (the minimap's has one).
- Minimap markers (v0.77 test): the minimap's create function hands the
  request on and the icon is built a moment later, so markers are created
  with their own non-zero lookup number (`MarkerIndex`: 0x50590000 +
  category·0x100 + marker; the minimap's find function 0xdeffa0 returns
  nothing for 0) and adopted once they appear with our exact key, type and
  position. A looted chest's minimap pin disappeared at once.

### Built, not yet run in game

- **v0.78** (release integration): minimap and shrine markers in every
  build; "needs add-on" detection (3 world-map refusals and no success →
  stop world-map shrine tries, panel says so); minimap creations still being
  built count as "waiting", not "failed". Behaviour with both DMM items
  installed equals the confirmed v0.77; the add-on notice and the counting
  change are the only untested parts. The user chose not to test.
- **v0.79 (current step):** surface Abyss Nexus markers (213), see section 4.

### Known problems / open items

- READMEs in the zips still describe v0.59 (the user has not asked for
  README updates).
- `docs/native-save-detection.md` and `CLAUDE.md` have no entries after v0.59
  / v0.66 (by the user's choice); this file and the traces are the record.
- Dial strongboxes (Delesyia 1, Demeniss 2): the user could not reach them
  (story lock / falls through the world); their pins simply stay.
- Abyss-island Nexuses (53) and Abyss chest icon (40) are not native-capable
  or not evidenced yet (section 5).

### Uncommitted work (since commit 074779d)

Everything from v0.56 to v0.79: shrine work, chest research and data,
storage hooks (v0.60), filter panel (FilterPanel.cpp, MarkerFilter.h,
vendor/imgui, third_party/imgui), strongboxes, Abyss chests, minimap
markers, the Shrine Icons generator (`src/pywel-atlas-ui/`), Abyss Nexus
data/reader/markers, generated headers (`chest-links.h`, `shrine-links.h`,
`nexus-links.h`), data files (`data/*-links.json`), research scripts,
disassembly (`research/disasm/map-zoom-*.asm`, also `map-tooltip-*.asm`
from another session), traces, docs. Ask the user before committing.
Line endings: `NativeMapCategoryProbe.cpp`, `NativeSaveReader.cpp` and
`NativeSaveLoadProbe.cpp` are CRLF in git; keep them CRLF (check with
`git ls-files --eol`; Git Bash `sed -i` can silently turn them into LF).

## 4. Current step: v0.79 Abyss Nexus markers (built, not run)

`archive/releases/PywelAtlas-v0.79.zip` (+ `PywelAtlasTest-v0.79.zip`); the
Shrine Icons item is unchanged (`PywelAtlasShrineIcons-v0.78.zip`). MSVC /W4
clean for all four builds. v0.78 zips are the fallback.

- Data: `research/scripts/export_nexus_links.py` → `data/abyss-nexus-links.json`
  → (build) `src/marker-bell/prepare_nexus_links.py` → `nexus-links.h`. The 213
  objects of landmark type 1000001 ("AbyssRuins_Field", levels
  `AbyssRuins_<Her|Dem|Del|Kwe|CD>_<n>`); positions from each level file
  (object `gimmick_abyssruins_useartifact_01`, UUID 4th word 0; its `_part`
  has 4th word 1; the landmark table's own position field is garbage for
  these). All 213 pair with a MapGenie Abyss Nexus point within 80 m. Names
  like "Hernand Abyss Nexus 21".
- Save rule (offline, from the user's saves): discovered = Bells'-list record
  key 1000001 + UUID, no flags; **activated** = field-object record for that
  UUID (gimmick `abyssruins_useartifact_01`), reason 1, reset never, state
  353047760 (same "opened" state as strongboxes). In the latest saves 5
  Nexuses are discovered and 3 activated (Hernand 8, 21, 32); Hernand 16 and
  Demeniss 40 are discovered only (the game shows its fog Nexus icon 334 at
  Hernand 16). Done = activated; unexpected record → unknown (hidden).
- Markers: category 4 "Abyss Nexus", native icon type 234
  (`MapIcon_Abyss_Ruins`, template 28866, icon group 0x20; `MarkerCategory`
  gained `iconGroup`, and `IconDefinitionReady` checks it), keys
  `0x5059415400000500 + i`, world map and minimap, panel row "Abyss Nexus".
  Logs: `NEXUS_READ` (save log), F7 popup "X of 213 Abyss Nexuses activated".
- Expected with the latest test save: 210 Nexus pins; none at Hernand 8, 21,
  32.
- Open (runtime only): whether type 234 created by us draws correctly (it is
  a different icon group from the chest/Bell icons). The user does not need a
  dedicated test: on the next normal play, glance at the world map near
  Hernand, then check `native-map-categories.log` for "Abyss Nexus markers on
  the map now" and failures. If they fail, compare our `world-create ours
  type=234` lines with the game's own type-234 icons.

## 5. Planned next steps, in order

1. **Confirm v0.79** from the user's next normal play (section 4). Fix if
   needed.
2. **Commit** when the user asks (see "Uncommitted work").
3. **Constellations** (13; landmark type 1000005 `anamorphic_constellation`,
   matches MapGenie 13). No record in any save yet. Offline first: find the
   objects and positions (landmark table + level files, as for Nexuses),
   check whether the icon has a world-map layout in `worldmapicon.thtml`,
   then ask the user for one before/after save pair at one constellation to
   learn the done record.
4. **Sealed Abyss Artifacts** (141; landmark type 1000002
   `challenge_sealed_artifact`, matches MapGenie 141; world-map layout
   `MapIcon_Gimmick_SealedArtifact` exists). Same approach: offline data, then
   one before/after save pair.
5. **Abyss-island Nexuses** (53: types 1000008 `abyssruins_abyssisland` 44,
   1000114 `..._quest` 7, 1000053 `abyssruins_housing` 2). Need evidence of
   their activation record first; check the user's saves offline whenever
   they have discovered one (two 1000008 records were seen once, no field
   record). Abyss positions go to the Abyss map layer automatically.
6. **Other categories**: Spires (9), Sanctums (16), Witch Hideouts (5), Abyss
   Cressets (101). Their landmark types are not obvious in the table
   (candidates: `hexesanctuary_totem` 1000028 = 4, `puzzle_standstone`,
   `adventure_standstone`, `subinner*`); identify offline by counts and
   MapGenie pairing first. Survey script pattern: import
   `research/scripts/classify_chest_gates.py` (`row_names`, `gimmick_objects`,
   `load_save`) and count objects/records per type key.
7. **Map tooltips** (optional): `docs/tooltip-implementation-plan.md`
   (another session's plan, not started; needs the user's OK, new hooks).
8. **Drawn icons** (kept in mind, user's request): if a category's icon has
   no world-map layout and a file mod cannot fix it, drawing the game's own
   icon image at the game-projected position of a stand-in marker is an
   option, acceptable only if it looks exactly native. Show the user an
   example first. Shrine-style file mods are preferred (no drawing).
9. Optional: controller navigation in the panel (holding pad input back
   needs a hook on XInputGetState: ask first); safer teleport landings.
10. Skipped by the user's choice: chest piles (only 3 small groups within
    15 m); quest-only chests stay hidden; the Alustain chamber chest could
    show once its "seen" record exists (ask first).

## 6. Practical notes

- Build from the PowerShell tool (not Bash): `src/pywel-atlas/build.ps1`
  (release), `-Test` (test build), `src/marker-bell/build.ps1 -Mode
  Categories` and `src/save-detection/build.ps1` (standalone builds; rebuild
  them after shared-file changes). Filter with `Select-String -Pattern
  "warning|error|Built|unresolved"`. The "vswhere.exe not recognized" line is
  harmless. Both build.ps1 scripts regenerate the shrine, chest and Nexus
  headers from `data/`.
- Package: `Compress-Archive -Path dist\pywel-atlas\* -DestinationPath
  archive\releases\PywelAtlas-vX.YY.zip` (and `dist\pywel-atlas-test\*` →
  `PywelAtlasTest-vX.YY.zip`). The user deletes old zips and keeps unpacked
  install folders in `archive/releases/`; leave those folders alone.
- Shrine Icons file mod: `research/vendor/.venv/Scripts/python.exe -B
  src/pywel-atlas-ui/build_ui_patch.py` → `dist/pywel-atlas-shrine-icons/`
  and `dist/PywelAtlasShrineIcons.zip` (forward-slash entry names; do not use
  Compress-Archive for it, it writes backslashes). Rebuild after a game
  update. While the mod is mounted, the install holds our patched copy; the
  script recognises its own addition and rebuilds from the text without it.
  It refuses if another mod's shrine layout is present.
- DMM: `C:\DMM.exe` (v3.7.0), mods folder `C:\mods`, logs in
  `%LOCALAPPDATA%\com.definitive.modmanager\logs`. File mods = zip with
  `mod.json` (`{"modinfo": {"title", "author", "version", "description"}}`)
  beside game folders such as `ui/`; it injects UI xml/css in place.
- Game UI files: `ui/xml/gamemain/template/worldmapicon.thtml` / `.css`
  (418 world-map icon layouts) and `minimapicon.thtml` / `.css` (472). An
  icon type works on a map only if that map's file has a layout for its
  template name. Extracted copies: `research/vendor/work/ui-map/`.
- Version strings to bump per build: the banner in
  `NativeMapCategoryProbe.cpp` ("Pywel Atlas combined vX.YY map markers") and
  in `FilterPanel.cpp` ("... vX.YY filter panel" and the file's header line).
  Save detection reports its own version (v0.60).
- Python: build scripts use
  `C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe`
  (pefile and capstone via `research/deps`). Research with pycrimson uses
  `research/vendor/.venv/Scripts/python.exe` (`research/vendor/` is
  git-ignored). No `python` on PATH. Long inline Python in Bash heredocs can
  fail ("unexpected EOF"); write the script to the scratchpad and run it.
- Disassembly: `research/scripts/disassemble_map_zoom.py 0xRVA ...` writes
  `research/disasm/map-zoom-<rva>.asm`. Map controllers: world vtable
  0x566ff50, minimap 0x5674e00; slot 0x548 find (world 0xdb8a00 / minimap
  0xdeffa0), 0x550 create (0xdb81e0 / 0xe08d70), 0x558 remove (0xdb8a60 /
  0xe09fc0, guarded in `kMinimapRemoveGuard`). Shared create 0xdeeb60.
- Save research: `research/scripts/compare_chest_saves.py A.save B.save ...`;
  copies under `research/vendor/work/` (chest-test, cave-test, shrine-test,
  strongbox-survey, strongbox-test, strongbox-test-2, abyss-test).
- Game: `E:/SteamLibrary/steamapps/common/Crimson Desert`. Save slots in
  `%LOCALAPPDATA%\Pearl Abyss\CD\save\60062761\slotN\save.save`.
- MapGenie → game X/Z (surface, ~35 m): `x = (lng + 0.40246) / 4.1456e-5`,
  `z = (lat - 0.77890) / 4.1373e-5`. Abyss: `x = (lng + 0.9704511) /
  3.1054142e-5`, `z = (lat − 0.7620569) / 3.1054118e-5`.
- Teleport targets file currently holds only "Nas River Shrine"; earlier
  lists: `teleport-targets.full-backup.txt`, `.strongbox-test.txt`,
  `.abyss-test.txt` (all in `%LOCALAPPDATA%\PywelAtlas`). Landing is 1.5 m
  above the given height; indoor targets can land inside objects.
- Logs in `%LOCALAPPDATA%\PywelAtlas`: `native-map-categories.log` (markers;
  rewritten each session), `native-save-detection.log` (cumulative, 40+ MB;
  use the last `SESSION` block), `filter-panel.log`, `filters.ini`.
- Marker keys: Bells `0x5059415400000100 + i`, shrines `…0200`, chests
  `…0300`, Abyss chests `…0400`, Abyss Nexuses `…0500` (tag kind 0x15).
  Native types: Bell 360, shrine 186, chest 226 (also Abyss chests), Abyss
  Nexus 234 (group 0x20). Masks hold 256 markers per category.
