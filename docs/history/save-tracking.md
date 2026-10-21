# Save tracking · Bells

## Use it

1. Load your save in Crimson Desert.
2. Open **Pywel Atlas.exe** from the parent folder. The desktop app starts and upgrades tracking automatically.
3. Open **Save progress**, directly below the Pywel / Abyss buttons in the left sidebar.
4. Choose the slot you loaded. The app does not assume that the newest file is your currently loaded save.
5. Choose **Show bells on map**, or click any bell in the progress panel to inspect it.

The app checks the selected slot every five seconds. Changes appear after the game writes that slot. Loading another slot in-game requires choosing that slot in the app too. The list uses Autosave 1–3 and Manual save 1–9, with the saved title and last-modified time. Internal folder IDs remain unchanged, so renaming the display preserves your selected slot and progress.

## What is supported

The first category is **Bell**, covering the eight bells in the bundled MapGenie dataset: Hernand, Calphade, Scholastone, Varnia, Tommaso, Delesyia, Demeniss, and Pailune.

The game asset mission `mission_pororinvillage_bell_all_tashkalp` corresponds to the map's **Tommaso Bell**. The link is recorded explicitly; no fuzzy name matching is used at runtime.

`data/bell-save-links.json` records exact scene-object UUIDs extracted from the installed bell mission assets, their corresponding map IDs, their game positions, and the relevant Bell type keys. The mapping uses each bell's main object, excluding separate bell mechanism parts.

The save reader examines `DiscoveredLevelGimmickSceneObjectSaveData._discoveredLevelGimmickSceneObjectSaveDataList`. A bell becomes **Save confirmed · Found** only when its exact UUID, an allowed Bell type key, and `_isCompleted: true` agree. An existing record without explicit completion is shown as **Discovered · completion unconfirmed**. A missing record is **No completed record**; it does not assert that the bell is inaccessible or that its location has never been seen.

Hernand Bell's exact UUID and explicit completion flag were present in the four inspected existing saves. Its level object also carries the alias `Hernand_Bell`. The remaining seven links come from the corresponding mission objects and map location checks; their future state transitions have not yet been observed in this player's saves.

## Progress and profiles

Save-confirmed progress participates in the existing **Found only / Not found** filters and marker styling. A save confirmation is read-only in the map. The app never edits the game's progress.

Manual marks are stored separately for each selected slot. **Manual progress only** restores the original browser's existing global manual progress. Switching slots replaces the active save confirmation set; confirmations from another slot are not merged into it.

When the bridge disconnects or a save cannot be read, the last successful result remains available and is labelled **cached**. A failed read never clears a confirmed result. Browser backups include the selected slot, cached confirmation snapshots, and manual marks per slot. They do not include the encrypted save file.

Profiles currently identify the account folder and slot folder. Overwriting the same slot with a different playthrough replaces its save-derived progress, but any manual marks already associated with that slot remain. Automatic loaded-slot/playthrough identification is not implemented.

## Read-only save handling

The bridge reads `%LOCALAPPDATA%\Pearl Abyss\CD\save\<account>\slot*\save.save`. It takes two matching reads and checks file size/modification time before copying the selected save into `%LOCALAPPDATA%\PywelAtlas\save-tracker\snapshots\`. Decryption and deserialization operate on that copy in memory. It verifies the save's authentication code through pycrimson. It never writes to the game's save directory.

The local bridge exposes `/saves` and `/save-progress?profile=<account>:<slot>`. Only slots inside the known game save directory are accepted; the endpoint cannot read arbitrary paths. The progress cache also checks the encrypted file's SHA-256 so a changed file is detected even when its timestamp is preserved.

Diagnostic progress summaries and encrypted working copies stay under `%LOCALAPPDATA%\PywelAtlas\save-tracker\`. They are local files, with no upload or external service involved. `data/bell-save-links.json` contains game object identifiers, not personal save contents.

## Libraries and attribution

Save decryption and reflection parsing use [LukeFZ's pycrimson](https://github.com/LukeFZ/pycrimson), with thanks and credit to LukeFZ for the implementation. Its MIT license is bundled in `vendor/python/pycrimson-LICENSE.txt`. The bundled source retains the existing local compatibility change accepting pack language mask `0x7FFF`; save parsing is unchanged.

The prototype also bundles [bier / Binaryhelper](https://github.com/K0lb3/Binaryhelper) and [python-lz4](https://github.com/python-lz4/python-lz4), with their licenses. The bundled LZ4 native extension targets 64-bit Windows Python 3.12. The existing Codex Python 3.12 runtime supplies `cryptography`. This folder is not yet a self-contained Windows installer.

Future game updates may change save schemas or scene identifiers. Unsupported schemas produce an explanation and retain the previous successful snapshot.

Save-folder naming reference: [crimson-mount-repair save slot documentation](https://github.com/Atomic-Flip/crimson-mount-repair#1-find-your-save-file). Folders slot0–slot2 are autosaves; slot100–slot108 correspond to manual saves 1–9.
