# Native marker definitions

Version 0.29 loads one local proof definition on F6. This separates marker data
from compiled native code. It is not a collectible database or save-completion
integration yet. The name is currently used in diagnostics, not a custom native
tooltip. Only the tested Pywel chest appearance is supported.

## Files

- Runtime definition: `%LOCALAPPDATA%\PywelAtlas\native-map-marker.json`.
- Template: `outputs/data/native-map-marker.json`.
- Log: `%LOCALAPPDATA%\PywelAtlas\native-map-categories.log`.

The mod creates the runtime file from its embedded template on the first F6
only if no file exists. Existing files are never reset on startup, upgrade,
parse failure or default changes. Editing the output template affects future
builds, not an already installed ASI. Edit the runtime file to change the active
installation. This file is application data; preserve it during cleanup.

## Supported fields

| Field | Behaviour |
| --- | --- |
| `schemaVersion` | Must be numeric 1. |
| `id` | Must be `atlas-chest-proof`; the one private native identity is reserved. |
| `name` | Nonempty, no control characters, at most 127 UTF-8 bytes; diagnostic label. |
| `region` | Must be `pywel`; other region paths are not implemented in this loader. |
| `icon` | Must be `chest`; it uses validated native type 226. |
| `enabled` | Boolean. False prevents creation and requests removal on F6. |
| `position.x/y/z` | Game coordinates, X/Z horizontal and Y altitude. Finite values within +/-1,000,000. This limit protects projection arithmetic; it is not a verified world boundary. |
| `completion.source` | Must be `none`. Completion is never inferred from proximity, visibility or this flag. |

The default point is 200 game units along +X from Hernand Bell. It is a visual
proof location, not a real collectible. Coordinates must come from a verified
mapping before importing actual POIs. Keep Y unchanged during this check;
native parent selection includes altitude-dependent behaviour.

## Applying edits

1. Finish saving valid UTF-8 JSON, then return game focus and press F6.
2. If a previous marker exists, remove it with F10 first. A changed definition
   does not overwrite or move an existing native object with the same key.
3. F6 loads the latest file on the worker. Invalid input logs a reason and
   retains existing state; it never replaces the file with defaults.
4. F10 removes only the marker owned by this mod session. Its active coordinates
   remain those used at creation even if the file was edited afterward.

Focus loss also requests cleanup, so switching to an editor may remove a
currently visible proof marker. Return to the game and press F6 after saving.
Changes are not continuously watched. The three-minute generation timeout stays.

The reader bounds input to 64 KiB and uses Windows' JSON runtime. During the
short read, write/delete sharing is denied to avoid half-edited data. File I/O,
UTF-8 decoding and JSON validation run on the worker. Native callbacks receive
copied definitions through a short-lived lock; no disk lock is held during UI
work. The active definition is committed only after the private-key lookup is
empty, so edits cannot change an existing marker's removal identity.

## Next runtime check

Install v0.29 with the game closed, load Manual 2 once, open Pywel/F6/wait/F8.
The default chest should appear at the prior proof position. F10/wait removes it.
Open the runtime JSON, change **only X** from `-10502.4970703125` to
`-10402.4970703125`, and save. Return to the game/F6/wait/F8. The chest should now
be 100 game units farther along +X, without a rebuild or save reload. Finish
with F10/wait/F8. The log should identify the loaded name and exact new XYZ.
Do not save the game or edit personal pins. Runtime data loading is pending.

Once data loading is confirmed, expand to a versioned marker collection and
explicit completion links, with progress separated per selected save slot.
Unknown completion must remain distinct from confirmed unfinished/finished.
