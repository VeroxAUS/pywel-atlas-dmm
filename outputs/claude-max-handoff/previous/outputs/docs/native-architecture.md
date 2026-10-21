# Native mod direction and save-reading proof

## Active investigation â€” v0.33

The user chose to investigate automatic loaded-save identity before checking
v0.32 selection. The two-slot native read/apply sequence is recorded. A separate
observation-only ASI now correlates the outer load scope and observes cleanup
and Steam storage initialization; it has no marker/progress effect. v0.31 remains the confirmed marker
baseline. See native-save-detection.md for static evidence, uncertainties and the
controlled loading sequence. Neither a disk read nor a zero apply result alone
is trusted as full world activation. Account identity is still unresolved.

## Current status â€” v0.32

The user confirmed v0.31: F7 removed the proof chest and a later F6 kept it
hidden. Both native reading and completion-driven marker visibility are proven.
v0.32 adds F9 selection of existing saves with timestamps, persisted locally,
and five-second worker refresh after F7. A selection change clears the session
link and requests old-marker cleanup; F7 explicitly enables the new selection.
The worker serializes selection and reads, so a read cannot return against a
newer slot. Only explicit completion can authorize completion removal. Failed
reads do not use prior reports as current input. No background process or save
write is involved. Selection/refresh await runtime confirmation; loaded-slot
detection and automatic marker creation remain unimplemented.

The sections below retain the sequence of earlier proofs and decisions.

## Chosen product

The user selected a standalone in-game mod as the preferred product: one bundle
that owns collectible data, save progress, settings and native map/minimap
markers. No companion or background helper program should be required.

If native integration cannot be made dependable, the fallback is a single overlay
application owning both progress and display. A background companion feeding an
in-game mod is not the selected architecture. Preserve existing app/user data
while native feasibility is established; the desktop prototype remains fallback.

## What is already proven

- Independent native chest creation/removal, including repeated cycles.
- Pywel/Abyss layer isolation and creation again after a save reload.
- Unchanged displayed personal-pin count in the scoped proof.
- Loading marker coordinates from local JSON without rebuilding.

These observations do not establish save-driven visibility. The previous Python
save reader was part of the original desktop app. Native map tests did not use
it. No companion application was needed for those marker tests.

## v0.30 new proof

NativeSaveReader.cpp ports the supported read-only Bell path into C++ inside
the mod. F7 takes a stable snapshot of explicitly selected diagnostic Manual
save 2 and reports the result in a game-process-owned diagnostic dialog. It
launches no external process and reads no companion report. No marker is hidden
from that result yet. Final save selection/in-game settings UI remains pending.

The save envelope is authenticated before decompression/reflection. Bounds apply
to encrypted/plain lengths, collections, strings, object offsets/depth and output.
Reflection parsing is scoped to the unique supported Bell discovery list. Only
verified UUID/type-key matches with explicit completion true can confirm Found.
No absence/proximity inference is permitted. Failed parsing cannot authorize
completion or marker deletion. Unknown states remain distinct from completed.

The current proof supports only save version 2 and modern reflection metadata
3â€“4/serialization 11â€“15. Account selection requires exactly one numeric Steam
account directory; the requested slot is explicitly slot101 (Manual save 2),
not inferred as loaded. The next integration must preserve per-selected-slot
ownership and clear/reject stale data on slot changes. No game save writes.

Native encrypted snapshot/report/log live under %LOCALAPPDATA%\PywelAtlas.
The report includes profile, save/read times and loadedSaveDetected=false. A
failed read preserves a previous successful diagnostic report; it is not treated
as fresh state. No automatic watching is enabled until the single read is proven.

Format interpretation is adapted from the bundled LukeFZ/pycrimson MIT source.
Native HMAC uses Windows BCrypt. The bounded LZ4 decoder follows the
[published block format](https://github.com/lz4/lz4/blob/dev/doc/lz4_Block_format.md).
No third-party compressor code was copied for that decoder. Generator Python
is a build-time tool only. The distributed ASI uses Windows system libraries.

## Immediate next steps

1. User runs v0.30/F7 in the game and confirms Hernand Bell reads Save confirmed.
2. Inspect the native report/log and handle any supported-format mismatch.
3. Bind one explicit completion result to mod-owned marker visibility, without
   changing native personal pins, existing built-in icons or saved records.
4. Add save-slot selection, stale-state handling and continuous read-only refresh.
5. Expand local marker collections and categories using verified identity links.

Current native save parsing is compiled, not yet runtime-confirmed. No automated
tests were added or run. A reader error alone should be diagnosed from its exact
stage before any feasibility conclusion is claimed.

## Confirmed result and current v0.31 step

The user confirmed v0.30 native reading in Manual save 2: one recorded Bell,
one explicit completion, Hernand Bell Save confirmed. The preliminary reader
check above is complete.

v0.31 adds an explicit session proof link on successful F7: the synthetic chest
uses Hernand Bell completion from Manual save 2 to request scoped removal.
Each subsequent F6 takes a fresh snapshot and blocks creation on confirmation.
Failure cannot authorize completion removal or consume an old report as current
state. Unconfirmed permits display but does not assert undiscovered status.
The unlinked initial F6 remains available to demonstrate visible-to-hidden
transition; JSON is unchanged. Restart resets this experimental binding.

The next user action is the packaged F6/F7/F6 sequence. Once confirmed, proceed
to explicit save selection and automatic refresh/state handling before scaling
verified categories. No continuous watcher or loaded-slot detection exists yet.
