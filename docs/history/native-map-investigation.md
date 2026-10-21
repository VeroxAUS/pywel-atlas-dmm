# Native map integration â€” current findings

## Current result

Native personal pin placement, reversible position/shape/colour changes and a
chest glyph on the Pywel map were confirmed. The v0.16 private-key display still
consumed a personal-pin slot in the user's check. It is not an independent
collectible layer and should not be scaled as one. Version 0.17 makes no marker
changes; it observes native categories to locate a non-personal-pin path.
Active-save identity, independent lifecycle and completion-driven hiding remain
unimplemented. Completed collectibles should disappear from view.
The sections below are chronological research history. Early failed candidates
are retained as history and do not describe the current working proof.

## Initial v0.2 investigation

The Bell's discovered/completed state did not affect the initial diagnostic.
The user confirmed that the first three placements were right-click navigation
destinations. Those initial coordinate-copy candidates captured no samples.

## What the in-game run established

| Stage             | Observation                                        |
| ----------------- | -------------------------------------------------- |
| DMM loading       | The ASI loaded and wrote its log                   |
| Build checks      | Installed executable matched the supported profile |
| Hook setup        | All five candidates returned `MH_OK`               |
| Keyboard input    | All three F8 snapshots were recorded               |
| Coordinate copies | All five counters remained zero in every snapshot  |

This means the instrumented candidate instructions did not produce captured
samples during those placements. It does **not** establish that native map
integration is impossible, or that a custom marker can already be created.

Version 0.1 had failed during hook preparation. Version 0.2 resolved that setup
failure by moving the hook beyond the VEX instructions unsupported by the
library's instruction decoder, but the instrumented paths did not run.

## Current research direction

Read-only inspection of this executable located the runtime type information
and virtual method table for `UIGamePlayControlRootWorldMap`, separately from
the five generic coordinate-copy candidates. A method on that class references
`MapIcon_PathFinderDestination`, `MapIcon_Pin_Marker`, and other native map icon
templates. This is evidence for the controller's identity, not a verified API
for creating custom markers.

Research details for Steam build **25474236**:

- World-map controller vtable RVA: `0x566ff50`.
- World-map controller method referencing the icon templates: `0xda18f0`.
- Minimap controller vtable RVA: `0x5674e00`.
- Static disassembly and intermediate reports remain in `work/map-mod-research/`.

These addresses are build-specific research notes. They must not be called as
functions based on guessed signatures, or treated as stable supported APIs.

## Next milestone

Identify and validate the native marker creation/update function, the lifetime
of its owning controller, and whether its coordinates are absolute or relative
to the world origin. Then place one destination at Hernand Bell. A separate
collectible layer and completion-driven visibility remain subsequent work.

## Current trace: step 1

The selector `selector-keyguide-find-path` is bound to a controller list at
`this+0x680`. The action handler at `0xdbaba0` checks that list and calls
`0xdc32e0`. That function selects an icon position or computes a map position,
then passes a pointer to three floats in R8 to `0xdef810` at `0xdc352a`.
The expected return address for that call is `0xdc352f`.

The saved-pin selector is bound separately at `this+0x6e0`. Its action branch
calls `0xd91ef0`. This trace links actual UI controls to specific native code;
it does not establish a callable marker creation API or a stable coordinate ABI.

## Observe a real destination: step 2

Version 0.3 watches these three function entries. The destination hand-off
captures the incoming three-float argument and return address. The other two
only count calls. Calls are logged automatically as well as on F8.

Observe a baseline, then three distinct right-click destinations. We need
hand-off samples that correlate with those placements before using the values
for marker placement. Compilation alone does not establish that result.

## Step 2 runtime result: confirmed hand-off

The v0.3 log recorded the baseline and all three requested placements. Each
placement incremented the Find path counter and reached the destination hand-off
from caller RVA `0xdc352f`, matching the statically traced call.

| Placement          | Incoming XYZ                                |
| ------------------ | ------------------------------------------- |
| Hernand Bell       | `(-10702.497070, 631.127319, -3833.858887)` |
| Second destination | `(-10532.695312, 0, -3398.297119)`          |
| Third destination  | `(-9176.041992, 0, -4902.740234)`           |

The Bell values match the mapped game scene position at float precision. Ground
clicks supplied Y=0, so ground destinations do not establish terrain elevation.
Background hand-offs also occurred from other callers; they must be excluded
from a controlled replacement.

## Step 3 build: one-shot ground destination redirect

Version 0.4 uses F9 to arm a 30-second, one-shot replacement of a ground click
with the Bell coordinates. It requires caller `0xdc352f`, XYZ pointer
`RBP-0x41`, identity pointer `RBP-0x19`, identity value `-1`, and identity kind
`0x15`, matching the traced unbound ground case. It changes only that call's
owned scratch floats and leaves marker creation to the game's original call.

It does not invoke game functions from the worker or teleport the character.
The armed state is consumed atomically and cancels on F10, Escape, focus loss,
or timeout. It has compiled; placement, pan/zoom persistence, and minimap display
still require the next in-game observation.

This replaces a navigation destination. It does not yet establish an independent
collectible marker layer or completion-driven visibility.

## Installed probe

Replace the older probe with v0.8 from
`outputs/mods/PywelAtlas-Native-Map-Probe.zip` while the game is closed. The
packaged README contains the observation walkthrough. The companion app is
independent of this experiment.

## Save persistence: second manual slot

The user saved the experimental Bell pin to Manual save 2 (`slot101`). A stable,
read-only decode of that file contains exactly one `_pinMarkerDataList` entry:

```text
type: PinMarkerIconSaveData
position: [-10702.4970703125, 631.1273193359375, -3833.85888671875]
shapeIndex: 4
colorIndex: 14
```

The position matches the experimental native Bell placement at float precision.
The trace-pin list is empty. The same save contains Hernand Bell scene UUID
`[1601869702,1450446765,1450142268,0]`, type key `1000119`, with
`_isCompleted=true`. This confirms persistence and the availability of an explicit
completion signal together in the selected save. It does not prove reloading
behaviour; that has not been requested or observed in this step.

The decoded pin record did not include an identifier. Later schema inspection
found `_uiIconKey: uint64` alongside position and style. Its earlier absence
does not establish that there is no saved key. It may be an omitted default,
but the default's meaning has not been verified. Do not treat its list
index, position, shape, or colour as a stable ownership ID. An ownership record
must tie an explicitly created experiment pin to the selected save and its
runtime pin identity before completion can control that pin. Ambiguous matches
must leave pins unchanged. A user's ordinary pin at a collectible location must
not be adopted or removed automatically.

### Remaining completion integration

1. Establish a runtime ownership link for the experiment pin and how it is
   re-established when a save is loaded. Keep it scoped to the selected save.
2. Identify a visual hide/update path for the owned marker, independently from
   the saved pin data, and preserve unrelated user pins and navigation.
3. Feed the explicit Bell completion flag through that ownership link. This save
   already has the Bell completed, so the expected completed state is hidden or
   visibly completed once that path exists.

No pin hiding, deletion, save modification, or automatic completion integration
was performed during this save inspection. Version 0.8 is now the latest build.

## Step 3 runtime result: successful native destination placement

The v0.4 log recorded exactly one applied redirect followed by normal destination
placement. The user confirmed all requested behaviour: Bell placement, map
pan/zoom and reopen checks, minimap display, and subsequent normal navigation.
This establishes the controlled native destination experiment on this build.

## Step 4: ordinary pin alongside navigation â€” confirmed

The v0.5 log recorded one applied pin redirect through caller `0xd92157`.
The user confirmed that the Bell pin remains while navigating elsewhere, stays
correctly positioned through pan/zoom and map reopen, and appears on the minimap.
This establishes coexistence with navigation using the ordinary native pin system.
It does not establish a dedicated collectible layer or scalable marker capacity.

### Implementation record

The saved-pin action calls `0xb84320`, passing an eight-byte pin identity through
R8 and a twelve-byte XYZ position through R9. Static inspection shows those
arguments being serialized separately. Two feature-mode branches in the same
action call it, with return addresses `0xd92157` and `0xd922d6`.

Version 0.5 adds this hand-off to the build profile and observations. F7 arms one
new-pin position replacement, requiring one of those callers, XYZ scratch at
`RBP-0x59`, ID scratch at `RBP-0x61` or `RBP-0x79`, and an unassigned ID of -1.
It substitutes the Bell position, leaving native pin creation to the original
game call. F9 retains the proven destination experiment; arming one mode cancels
the other. The pin placement and requested display checks are now user-confirmed.

The next observation is whether a created Bell pin remains while a separate
navigation destination is changed. This deliberately uses an ordinary game pin
slot, obeying native capacity and persistence. It does not establish a dedicated
collectible layer or support for thousands of markers. Game-created pins remain
the user's game data and must be removed through normal pin controls if desired.

## Pin identity investigation: v0.6

Inspection of the save's reflection type table found these fields on
`PinMarkerIconSaveData`: `_uiIconKey` (uint64), `_iconPosition` (float3),
`_shapeIndex` (uint8), and `_colorIndex` (uint8). The decoded record in Manual
save 2 omits the key. This corrects the earlier interpretation; an omitted
property is not evidence that the schema has no persistent identifier.

RTTI identifies `TrocTrCreateOrChangePinMarkerAck` with vtable `0x560a9f0` and
handler `0xb9d9d0`. The handler decodes 24-byte records containing an eight-byte
key, twelve-byte position, shape and colour, then calls `0x495460` at `0xb9ddce`
(return `0xb9ddd3`). That function searches the current group vector by key.
The branch at `0x4955a9` is reached when the key was not present and is about
to be appended. Existing-key style updates take a separate branch.

Version 0.6 observes that insertion point, copying the incoming record from
R15. The parent function's traced stack frame places its caller at current
RSP+0xf8 and the saved group byte at RSP+0x110 before the probe's pushes.
The probe preserves scratch registers, flags and the displaced instructions.

A candidate receipt requires a fresh insertion from the acknowledgement caller,
an explicit applied F7 serial, the Bell position, and exactly one insertion
observed in that worker interval, within ten seconds of observing the placement.
The receipt stores its key as a decimal string, including zero, and marks save
profile and reload persistence as unverified. It authorizes no marker changes.
This is a controlled correlation experiment, not a general concurrent ownership
protocol; ambiguous observations do not produce a receipt.

The build compiled without warnings. Its acknowledgement capture remains to be
observed in game. The next pass creates one additional experimental Bell pin
after loading Manual save 2, then saves to that slot again. Compare the receipt
with `_uiIconKey` before requesting a separate reload check.

### v0.6 creation and save result

The user reported visual ambiguity from overlapping pins and repeated the
placement. The log captured an F7 insertion with key 1 and another with key 2.
The latest receipt is key `"2"`, placement serial 2, ordinary-pin group 0,
shape 4 and colour 14. Manual save 2 now contains three pins at the exact Bell
position with that style: the original record omitting its key, plus explicit
`_uiIconKey: 1` and `_uiIconKey: 2` records. Thus the latest receipt matches a
specific saved key, without distinguishing pins by position alone.

The log also shows key 2 being inserted at a different position before its
later Bell insertion. This demonstrates that a key must not be treated as
globally unique or as permanent ownership after deletion/replacement. Scope
ownership to the selected save and the explicit creation history; invalidate
it on removal or conflicting changes instead of adopting a later reused key.

Reload persistence remains unverified. The next observation needs no new build
or new pin: load Manual save 2 again and take an F8 snapshot. Verify the loaded
insertion records, key, group, coordinates and style against the saved record
and receipt. The current plugin's candidate receipt is not used to change pins.

Overlapping markers are poor placement feedback. Repeated F7 placement can
create more saved pins even when the map appears unchanged. Further placements
are unnecessary for this check; three experiment pins are present in the save.

### Reload result and selected-save verification

After the user loaded Manual save 2 again, insertion count advanced from 5 to 8
without another F7 placement. The latest inserted record again had key 2,
ordinary group 0, the same Bell XYZ, shape 4 and colour 14, from the same native
acknowledgement caller. The following F8 snapshot retained those values. The
three insertions were grouped by the worker, so this log does not individually
report the other two reloaded keys.

This confirms key 2's identity across this observed reload. It does not establish
global uniqueness, arbitrary-save identity, or automatic loaded-slot detection.

`outputs/tools/native-map/verify_pin_link.py` now checks a receipt against an
explicitly selected stable save copy. It requires one explicit matching key,
matching position and style, then reads the Bell's scene UUID and explicit
completion flag. The current Manual save 2 result is a saved-pin match for key 2
and `completionConfirmed=true`. The output deliberately sets
`loadedSaveDetected=false` and `automaticGameChangesEnabled=false`.

### Display path research

After pin-list insertion/update, native apply at `0x495460` calls `0x4a47e0`
at `0x4956ad` with the key, XYZ, shape, colour and group. The callee queues or
forwards those display values separately after the pin-list write. This is a
candidate point for a visual completed-state preview without changing the saved
pin record. Its presentation effects and scope still require validation; no
new display hook or automatic marker change was installed in this step.

## v0.7: manually enabled completed-style display preview

The new `NativeMapPreview.cpp` build instruments only `0x4a47e0`. It matches
caller `0x4956b2`, key 2, exact Bell float position, original shape 4/colour 14
and ordinary group 0. Matching calls are counted even when the preview is off.
Only when explicitly enabled with F6 are the by-value shape argument in R9 and
colour byte at entry RSP+0x28 changed to display indices 0/0. The key, position
and saved pin-list records are not written by this hook.

The original pin apply function updates its pin-list records before calling
this presentation function. The new hook therefore targets presentation
arguments rather than changing the incoming saved pin data. Whether any later
game behaviour persists display state is not assumed; validate that separately
before claiming saved style is unaffected end-to-end.

F10, focus loss or a three-minute timeout disable further styling. Existing
queued UI state refreshes when the game sends normal presentation updates;
reloading Manual save 2 is the specified restoration procedure. A separate
non-activating Windows status toast reports activation and observed application.
It is not part of the game's marker renderer.

The target binding is generated from the selected-save verification. Loaded-save
detection and key-reuse/removal handling remain unimplemented, so this build is
strictly a manual preview scoped by the user's loading of Manual save 2. There
is no automatic completion styling. Earlier placement hotkeys are inactive.

Build completed without warnings. No automated tests were added or run, and
the new hook has not yet been observed in game. Next: enable F6, reload Manual
save 2, inspect both maps and navigation, then disable with F10 and reload the
same save to check restoration. Overlapping Bell pins can obscure a restyled
glyph; use the counters and user observation together, not either alone.

## v0.7 result and v0.8 overlap isolation

The v0.7 log shows `matched=2`, `styled=1` while enabled. The user reported no
visible shape/colour change on either map. Thus the argument substitution ran,
but a visible completed-style glyph was not established. The final logged
disabled snapshot still had matched=2; a fresh normal presentation was not
captured there, so restoration is not proven by that snapshot alone.

Version 0.8 adds a display-only X offset of +200, using the caller's UI scratch
buffer. Before writing, R8 must equal thunk RSP+0x70, corresponding to the native
caller RSP+0x50 buffer. The original key, Bell XYZ, group and style guards remain.
The native pin-list position is not addressed by the hook. Extra diagnostics
count the key match before this guard and record the actual scratch offset.

The new X is -10502.4970703125, leaving the two other overlapping pin displays
at the Bell. This is an isolation experiment, not a change in POI coordinates
or proof of downstream persistence behaviour. It compiled without warnings;
the visible offset and its restoration remain to be observed in game.

## v0.8 result and v0.9 subscriber-dispatch preview

The user saw no pin east of the Bell on either map. The v0.8 log recorded
keySeen=2, matched=2, styled=1 and scratchOffset=0x70, so the temporary-buffer
guard passed and the write ran. This does not establish that the changed
presentation reached a visible map glyph.

Static tracing found the later subscriber dispatcher at RVA 0x4a9d00, called
by the direct path (return 0x4a4835) and queued path (return 0x7ec21a). Its
arguments include a listener vector, key pointer, XYZ pointer, and pointers to
shape, colour and group bytes. Listener entries are 32 bytes with callback at
+8. The dispatcher copies values to each native callback or script dispatch.

Version 0.9 intercepts that dispatcher. It retains the key, exact XYZ, original
style/group and caller guards. While manually enabled it substitutes XYZ and
style pointers with a pinned module-lifetime payload; it does not write the
original queued/source records. It records total calls, key matches, full
matches, changed presentations, subscriber count and two callback addresses.
F6/F8/F10 and the three-minute/focus-loss boundaries remain as documented.

The build has not yet been observed in game. The next check uses the existing
Manual save 2 pins: enable, reload, inspect both maps, capture F8 while ON, then
disable and reload. If still invisible, trace the recorded subscriber callbacks
instead of repeating placement or assuming a renderer was reached. Active-save
detection, key reuse invalidation and automatic completion remain unimplemented.

## v0.9 result and v0.10 existing-icon observation

The user reported no offset after the full v0.9 sequence. The preserved log at
work/map-mod-research/display-v0.9-observation.log recorded enabled=1, total=9,
keySeen=3, matched=3, styled=1, listeners=2, queued caller 0x7ec21a and callback
RVA 0xe016b0 for both listener entries. This establishes a matched dispatcher
invocation, not a visible icon update or execution of every subscriber.

Static disassembly shows callback 0xe016b0 forwards to 0xdf88c0. That routine
calls 0xdeeb60 with the incoming XYZ, then invokes virtual slot 0x548 to look up
the icon. World-map slot 0x548 resolves to 0xdb8a00; minimap resolves to shared
lookup 0xdeffa0. Slot 0x550 (creation) resolves to 0xdb81e0 for world map and
0xe08d70 for minimap. The world creation function queries slot 0x548 and exits
if an icon already exists. Existing-icon reuse is a plausible explanation for
the failed offset; it is not yet confirmed as the actual runtime cause.

Version 0.10 replaces the active preview with an observation-only build. It
intercepts 0xe016b0, 0xdb8a00 and 0xdeffa0 using normal x64 C++ signatures.
Only key 2/group 0 callback activity is recorded. A thread-local synchronous
capture associates nested lookups with that callback, restoring previous state
on normal return. Native arguments/results are unchanged. Lookups record the
controller vtable, returned-icon presence and first exact Bell float3 occurrence
within [0,0x120) of known world/minimap icon objects. The range is below the
callback's established +0x118 pointer access; no unbounded memory search is used.
Absence of a match cannot identify the actual position field. Unknown controller
vtables are logged without reading icon fields.

Native threads use a nonblocking bounded capture buffer; a worker writes logs.
Dropped diagnostics are counted. Entry bytes, executable timestamp and image
size are checked before hooks are created; profile generation additionally
requires the known full executable SHA256. The module stays pinned until exit.
The package still requires game closure before DMM replacement. Preview and
Ownership source remain available as explicit build modes; Inspect is default.

Compiled without warnings; no automated tests added or run. Runtime results are
pending. Next check: load Manual save 2, open both region views and minimap, press
F8, then inspect native-map-inspect.log before another launch. No F6/F10 or
additional pins/saves are needed. If existing icons are confirmed, trace their
position-refresh method before attempting another presentation change.

## v0.10 startup failure and v0.11 compatibility correction

The user's check completed, but native-map-inspect.log contained only its v0.10
startup line and MH_ERROR_UNSUPPORTED_FUNCTION. No observation hooks were enabled
and no map activity was captured. The log is preserved under work/map-mod-research/
inspection-v0.10-startup.log. This result says nothing about existing-icon reuse.

MinHook's trampoline builder decodes an instruction before checking whether it
has copied the required five-byte prologue. Callback 0xe016b0 has eight bytes of
ordinary prologue followed by a VEX vmovsd at +8, which its HDE decoder does not
support. Version 0.11 hooks the wrapper's direct callee 0xdf88c0 instead. Static
tracing shows the wrapper forwards the same key, copied float3, shape, colour
and group using the same ABI. Its callee starts with a five-byte store followed
by ordinary push instructions, avoiding this decoder limitation. The world and
shared lookup entries also have ordinary instructions after their first five
bytes. Each hook-creation result now logs its RVA and status before activation.

The observation-only boundaries and user sequence are unchanged: close game,
replace probe in DMM, load Manual save 2, open both map views and minimap, then
F8. No F6, F10, new pin or new save is needed. Compiled without warnings; no
automated tests added or run. Successful in-game activation remains to be seen.

## v0.11 confirmed icon lookup and v0.12 direct-callback preview

The preserved inspection-v0.11-observation.log shows all three observation hooks
created with MH_OK, callbacks=2, lookups=6 and dropped=0. Key 2/group 0 reached
controller vtables 0x566ff50 (world) and 0x5674e00 (minimap). Each callback had
an initial lookup returning null followed by a lookup returning an icon. Thus
this capture demonstrates creation followed by retrieval; it does not establish
that existing-icon reuse caused the earlier failed previews. Both returned
icons contained the exact Bell float3 at decimal offset 224 (0xe0).

Read-only static tracing found icon initialization at 0xd8a970 copying packed
input XYZ (+0x1c/+0x24) to icon +0xe0/+0xe8. Map projection at 0xd94040 and
other map routines read X/Z from those fields. Research output is under
work/map-mod-research/icon-position-references.asm and icon-initialization.asm.

Version 0.12 retains the three compatible hooks, adding manual F6 activation
at the direct callback 0xdf88c0. For key 2/group 0, known controller, exact Bell
XYZ and original style 4/14, it forwards an immutable module-lifetime XYZ with
X +200. Style is unchanged to isolate coordinate behaviour. The original
callback is called once; its source buffer and returned icon are not written
by our hook. Native construction from the changed input may have downstream
behaviour that still needs validation. No saving is requested in the check.

The capture now records effective callback XYZ and actual icon XYZ at +0xe0.
Readback mask bit 1 is world and bit 2 is minimap, set only if an active preview
lookup returns an icon containing exact preview coordinates. Mask 3 verifies
both objects received that input, but cannot by itself prove visible movement.
F6 expires after three minutes; F10/focus loss disable future substitutions.
Reloading the same save after disabling refreshes normal icon state. No cached
icon pointers are retained and no UI objects are accessed from the worker.

Compiled without warnings; no automated tests added or run. Next user check:
replace via DMM with game closed; load Manual save 2; F6; reload; inspect world
map and minimap; F8 while enabled; F10; reload; F8. No new pins or saves needed.
If readback is confirmed but the glyph does not move, trace projection/culling
from these known objects. If readback stays original, inspect construction
inputs before another visible-change attempt. Active-save detection and key
reuse/removal protection remain unimplemented, so this is a controlled proof.

## v0.12 visual success and v0.13 appearance preview

The user confirmed the eastward pin appeared after F6/reload and disappeared
after disabling/reloading. The preserved preview-v0.12-confirmed.log recorded
readbackMask=3, applied=4 and no dropped captures while ON. Both controller
objects read back X=-10502.4970703125. After OFF/reload, both read back the
original X=-10702.4970703125, with style 4/14. Thus the callback substitution
has a visible effect and normal rebuild restores the original presentation.
This does not establish broader persistence safety or a new collectible layer.

Version 0.13 keeps that identifying offset and changes only the preview's
forwarded shape/colour to 0/0 at the same guarded callback. It retains key 2,
group 0, exact original XYZ/style and known-controller guards, manual F6,
three-minute expiry, focus-loss/F10 disable and icon coordinate readback.
Captures now log the effective forwarded style. Particular glyph/colour names
are not assumed; those native indices still need the user's visual observation.
No saved-pin or returned-icon fields are written by the probe. Actual native
palette selection happens downstream, so argument logs do not prove appearance.

Compiled without warnings; no automated tests added or run. Next: replace via
DMM with game closed, repeat F6/reload, compare the separated pin's appearance
with the original Bell pins, F8, then F10/reload/F8 for restoration. No new pins
or saves needed. After style confirmation, remove the offset and connect explicit
save completion. Active-save identity and key reuse/removal handling remain
required before unattended automatic styling. Ordinary pin capacity is unchanged.

## v0.13 confirmed style and v0.14 native chest class proof

The user confirmed the separated pin had a different shape and colour. They then
chose hiding completed collectibles instead of restyling them, and approved
pursuing native category icons such as chests. The completion-feed/style work
was not implemented before this change of direction. It remains pending as
completion-driven hiding with proper active-save and ownership handling.

Extracted native stylesheets define worldmap-icon-gimmick-level-treasurebox
(worldmapicon.css line 610) and minimap-icon-gimmick-level-treasurebox
(minimapicon.css line 483), with existing native chest texture IDs. The active
component MapIcon_Gimmick_LevelTreasureBox also occurs in both map templates.
The older MapIcon_TreasureBox world component is commented out; the proof uses
the active level-gimmick chest classes rather than relying on that component.

The pin callback at 0xdf88c0 queries the shape-class function 0xdec5b0 with shape
in ECX and group in EDX, obtaining a pointer to a cached DWORD class identifier.
Native calls to name registration at 0x12becb0 pass output DWORD*, UTF-8 text,
mode 1 and flags 0x2ffff. Those four argument positions and output writes were
traced in native call sites and the name-registration body. Version 0.14 adds
an entry guard for this call and a hook on the shape-class lookup. Its entry is
a direct jump into protected game code; the native body is not rewritten or
reimplemented. MinHook's original trampoline follows that native jump.

While the exact proof callback is active and manually enabled, the plugin
registers the matching map's chest class on the native callback thread, using
a module-lifetime cached class identifier. It substitutes the shape-class
lookup result only within that callback's thread-local capture and for original
shape 4/group 0. Other calls return the original lookup result. Colour remains
14 and the proven +200 X offset is retained to isolate the glyph. The shape
class result and callback source buffers are not written; no global CSS or
native texture assets are replaced or distributed. Callback nesting restores
the prior thread-local context. F8 counts chest-class substitutions separately
from coordinate readback; neither count proves visual appearance.

Five native contexts are checked before four hooks are created; the fifth is
the guarded native name-registration function, not a hook. Known build hash is
required at profile generation. Compiled without warnings; no automated tests
added or run. Runtime chest appearance is pending.

Next user sequence: replace through DMM with game closed; load Manual save 2;
F6; reload; inspect chest-shaped glyph east of Bell on world map and minimap;
F8; F10; reload; F8. This remains a visual Bell-location experiment, not a real
chest POI. After confirmation, investigate independent marker creation at a
real verified collectible location and its category, before scaling beyond
ordinary pins. Completed markers should be hidden while retaining ownership;
this build does not yet hide them or infer chest completion.

## v0.14 no visible chest and v0.15 scoped stylesheet companion

The user saw the prior pin rather than a chest. The preserved v0.14 log recorded
four MH_OK hook creations, valid registered chest IDs (world 0x154d9, minimap
0x154da), applied=4, coordinate readbackMask=3 and chestClassCalls=4. Thus the
class-return substitution ran. Class-list membership and actual CSS resolution
were not observed, so native chest-class acceptance was not established.

Read-only archive extraction found shared PinMarkerIcon.css, linked after the
map-specific stylesheet by both native templates. Its single-class
.pin-marker-icon-texture rule sets the normal user-marker background-image;
its compound shapeNN rules select ordinary shapes. The later default rule can
outrank/equal-priority the substituted single-class chest rule. This is a
plausible cascade explanation, not yet the proven cause of the failed glyph.
The native base CSS is preserved as a research input with SHA256
968b68a9aa9254abfecf2ef5b171f2c01adc4be089683b7ace01cf0be3964463.

Version 0.15 returns a unique class, pywel-atlas-chest-proof, instead of the
native chest class. A separate DMM styles package appends two compound rules
to the preserved base PinMarkerIcon.css: world pin texture plus our class uses
cd_Icon_worldmap_treasurebox_00; minimap pin texture plus our class uses
cd_Icon_map_treasurebox. Existing original rules and their order are retained.
No unrelated pin receives our class and no chest image asset is redistributed.
The style builder requires the original CSS hash, keeps it byte-for-byte, and
writes only to outputs/mods. Maintained custom CSS is formatted with Prettier;
the generated original game stylesheet remains separate from maintained source.

DMM's author documentation describes file replacement CSS and files/ layouts:
https://www.nexusmods.com/crimsondesert/mods/633?tab=description
The companion ZIP uses files/ui/xml/gamemain/template/pinmarkericon.css plus
modinfo.json. It is intentionally separate from the ASI ZIP to avoid mixed
package-type detection. Import/mount compatibility still needs user observation.
No direct installed-game modification was performed by our scripts.

A fifth hook observes native class-list append at 0x35ca0a0. Disassembly shows
it adds a DWORD class ID if absent and returns true, otherwise false. The
observer calls the original once and checks its vector for our exact ID within
a bounded count of 256. classAppliedMask world/minimap bits record membership;
they do not establish loaded stylesheet rules or resolved texture. Six entry
contexts are guarded; five hooks are installed and the sixth guards the native
name-registration call. The scope/activation/offset/restoration remain unchanged.

Compiled without warnings; no automated tests added or run. Next: close game,
replace ASI, separately enable/mount the new styles mod, then run the familiar
F6/reload/inspect/F8/F10/reload/F8 sequence. Report DMM import/mount errors before
proceeding. If classAppliedMask=3 but no chest, check mounted CSS and texture
resolution; if class membership is absent, trace selector/style application
before another texture change. Independent markers and completion hiding remain
pending; no completion or loaded-save identity inference was added.

## v0.15 chest success and v0.16 separate display identity

The user confirmed a chest glyph east of the Bell on the Pywel map layer, absent
on Abyss. This is consistent with desired region-specific display, not proof of
a general automatic region resolver. The preserved v0.15 log records five MH_OK
hooks, readbackMask=3, chestClassCalls=4 and classAppliedMask=3, with no dropped
captures. Native controller readback/membership succeeded for both world map
and minimap; the user's visual report did not separately establish HUD minimap
visibility. Coordinate and class restoration OFF/reload were captured.

Version 0.16 changes from conversion of a saved pin to an additional private-key
draw. It forwards original key 2 with its original coordinates/style, then uses
the exact native type and 16-byte tag observed in the callback's lookups. These
must be the supported type 1/tag kind 0x15/key 2 before generating anything. A
private positive uint64 key, 0x5059415400000001, replaces only the tag's key for
a preflight lookup. Native world/shared lookup functions are called with index
0, on the original callback thread, while the live controller is in scope. If
any icon already exists, generation is skipped without adoption or modification.

When absent, the probe calls the known presentation function 0xdf88c0 through
its original trampoline with the private key, east-of-Bell XYZ and original
4/14 style. A separate thread-local capture enables the already proven scoped
chest class only during this synthetic draw, then restores the prior capture.
The normal saved-pin serializer at 0xb84320, model apply at 0x495460 and any
pin deletion path are not called by the probe. No saved-pin position/style is
substituted now. Readback logs distinguish original key 2 from the private key.

This demonstrates an intended separate display identity, not yet a verified
independent collectible layer. The bootstrap still requires the linked Bell
callback, the renderer still uses the ordinary pin presentation template, and
normal context-menu actions are unintegrated. Capacity, persistence, region
routing and UI refresh lifecycle require observation before scalability claims.
No cached UI-object pointers are retained across callbacks. Native tag/type
layout is carried from observed calls rather than guessed from save timestamps.

F6 still enables generation for three minutes; F10/focus loss/expiry disables
future generation. OFF/reload is the cleanup procedure for transient icons.
No game save access occurs in the ASI. The user is instructed not to save or
edit/move/delete the experimental chest during this proof. Native downstream
persistence remains unproven. The existing v0.15 CSS package is unchanged and
remains required; only the ASI ZIP needs replacement.

Compiled without warnings; no automated tests added or run. Next user sequence:
load Manual save 2, note personal-pin count; F6/reload; verify original Bell pins
plus extra chest, compare count, inspect HUD minimap; F8; F10/reload/F8. If the
private key receives an icon and the count remains unchanged, next trace the
controller refresh lifecycle without the Bell bootstrap and choose one real
verified collectible location. Completed collectibles should be hidden; actual
completion matching and active-save identity are still pending.

## v0.16 personal-slot failure and v0.17 non-pin category research

The user reported that the extra chest consumes a personal-pin slot. Its native
private identifier therefore did not establish independent capacity. The
preserved preview-v0.16-personal-slot.log recorded creationAttempts=2,
occupiedKey=2, readbackMask=3 and classAppliedMask=3, with no dropped captures.
This confirms creation/readback/class membership but does not establish a saved
pin record was inserted or persisted. The user-observed slot cost is sufficient
to reject the current path as a general collectible layer. No limit increase,
count adjustment or further synthetic creation was implemented.

The old path passed tag kind 0x15 through the personal-pin callback. Native map
pin actions inspect category values at type-info+0x2c (including checks for
0x25/0x66). Those checks do not alone identify the pin-count implementation.
Static template-reference scanning found the direct MapIcon_Pin_Marker string
in initialization; chest component names were absent as direct ASCII executable
strings. Actual chest/gimmick category registration must still be traced rather
than choosing a guessed numeric type or assuming a chest texture changes type.

Version 0.17 is a separate observation-only source. It hooks shared creation
0xdeeb60 and the already-native type lookup 0x537250. The creation signature is
traced as controller, type pointer, tag pointer, index pointer, opaque scalar
pointer, XYZ pointer, opaque appearance pointer, byte flag, opaque data pointer,
byte final flag. The original is called once, with all arguments and RAX result
passed through. A thread-local sample receives type-info+0x2c only when native
code itself calls the type lookup for the matching type. Fixed-size self-process
reads are checked. Native controller vtables remain restricted to the two known
map classes; no marker or game state is written and no save file is accessed.

A worker drains bounded, deduplicated samples of native category/type, raw tag
and optional coordinates. This is not a completion or ownership detector.
Deduplication caps at 256 signatures; queue contention/overflow are counted.
Two exact-build entry contexts are guarded. F8 snapshots counts; F6/F10 preview
controls are inactive and there is no extra chest. Categories is now the default
build mode; older experiments are explicit modes only.

Compiled without warnings; no automated tests added or run. Next user sequence:
replace ASI with game closed, load Manual save 2, open/pan/zoom Pywel map, return
to HUD minimap, F8. No new pins or saves. Use observed non-pin categories to trace
actual chest/gimmick lifecycle before another placement attempt. If the shared
creation path exposes only personal pins, follow the separate non-pin template
creation path rather than forcing another numeric category through it.

## v0.17 multi-category capture and v0.18 native template names

The user's v0.17 capture is preserved in categories-v0.17-observation.log. Both
hooks initialized with MH_OK. F8 recorded creates=594, sampled=594 and dropped=0.
Samples included personal pins at native type 1/category 0x25/tag byte 8 0x15,
and types 0, 44, 185, 234, 336, 360, 453, 456, 529 and 534 with different raw
category/tag combinations. Types 336 and 360 had category 0xffffffff, which must
remain unresolved rather than be classified as chests. Coordinates alone are
not used to establish collectible identity, completion or category meaning.
No capacity-independence claim follows merely from a different category value.

Static tracing of shared creation 0xdeeb60 shows it gets a secondary type from
icon-info+0x20, calls record lookup 0x388e00, reads record+0x18 into RCX and then
[RCX] into R13, subsequently passing that component-name buffer to native UI
creation. The next diagnostic observes these actual lookups rather than calling
helpers for extra guessed types. Version 0.18 adds an unchanged-argument/result
hook at 0x388e00 and associates matching secondary keys with the existing
thread-local creation sample. Both pointer reads are checked with self-process
ReadProcessMemory, and the string read is bounded to 127 printable identifier
characters. Missing/invalid names remain unknown. No arbitrary pointers are
followed, no marker is created, and no native function is called solely to
probe a type that the game did not request.

Deduplication now includes template name/secondary-key status so a later
unknown-to-known transition is not discarded. F8 adds named-call count. Template
names and actual categories still require association with known native UI
components before selecting a creation route. The generated category profile
contains three guarded sites, all with compatible native entry prologues.

Compiled without warnings; no automated tests added or run. Next user sequence:
replace ASI with game closed, load Manual save 2, open/pan/zoom Pywel, return to
HUD minimap, F8, report before another launch. No F6/F10 or new pins/saves. Once
names identify a chest/gimmick route, trace its lifecycle and personal-pin
independence before another draw. Completion hiding remains the intended policy,
with actual completion mapping and active-save identity still required.

## v0.18 confirmed names and v0.19 cached definition snapshot

The preserved categories-v0.18-named.log recorded three MH_OK hooks and
creates=600, sampled=600, dropped=0, named=588. Confirmed associations include:

| Native type | Raw category | Secondary type | Actual component name    |
| ----------- | ------------ | -------------- | ------------------------ |
| 1           | 0x25         | 28651          | MapIcon_Pin_Marker       |
| 360         | 0xffffffff   | 29084          | MapIcon_Gimmick_Bell_01  |
| 336         | 0xffffffff   | 29058          | MapIcon_Gimmick_Campfire |
| 234         | 0x20         | 28866          | MapIcon_Abyss_Ruins      |
| 453         | 0x1a         | 29177          | MapIcon_UnknownShopIcon  |
| 456         | 0x19         | 29182          | MapIcon_QuestShopIcon    |
| 529         | 0x5a         | 29231          | MapIcon_StageFog         |

Other names include ActorFocus, a hired horse and an interaction dialog icon.
Type 534's active call did not resolve a name through the matched path. No
LevelTreasureBox or other chest template appeared in these samples. A native
Bell/campfire template is established by its name, not by coordinate proximity;
no discovery/completion inference or active-save identity is derived from this.

Static type lookups expose cached record tables: both read count at +8, pointer
array at +0x58 and fetch entry by key. Profile generation now checks the exact
48 8b 1d RIP-relative loads at 0x537265 and 0x388e15, deriving table globals
0x6d6e418 and 0x6d69a80. Version 0.19's F8 worker reads only existing cache
entries (up to supported bounds 4096/65536), maps secondary keys to already
cached template names, and logs Gimmick/Treasure/Pin_Marker definitions. It
never invokes the lazy lookup functions to populate missing keys. All reads
use checked self-process memory reads. The worker touches metadata only, not
controller or scene objects. Table headers are rechecked; per-entry concurrent
loads can still make this a partial observation rather than an atomic catalogue.

This may identify a chest type without a scene chest already visible, but no
availability is assumed. Cached definitions do not imply a spawned/discovered
marker, native pin-count independence or safe creation. No marker generation,
limit adjustment, completion inference or save access was added. The original
three observation hooks still forward arguments/results unchanged.

Compiled without warnings; no automated tests added or run. Next user sequence:
replace ASI with game closed; load Manual save 2; open Pywel and F8 when icons
load; report before relaunch. No F6/F10, new pins or saves. If a chest definition
is cached, trace its non-pin identity/creation/removal lifecycle before another
draw; otherwise observe a genuine native chest/gimmick loading. Do not choose
neighboring numeric IDs solely from the observed Bell/campfire key ordering.

## v0.19 chest definitions found and v0.20 typed creation proof

The preserved categories-v0.19-chest-definitions.log reports types=2027,
cached=2027, named=2027, relevant=263 and headersStable=1. The live creation
capture had creates=610, sampled=610, dropped=0, named=598. Confirmed metadata:

| Native type | Raw category | Secondary type | Component                                            |
| ----------- | ------------ | -------------- | ---------------------------------------------------- |
| 36          | 0x0c         | 28684          | MapIcon_TreasureBox (older commented world template) |
| 226 / 228   | 0xffffffff   | 28852          | MapIcon_Gimmick_LevelTreasureBox                     |
| 227 / 229   | 0xffffffff   | 28855          | MapIcon_Gimmick_LevelTreasureBoxOpened               |
| 1           | 0x25         | 28651          | MapIcon_Pin_Marker                                   |
| 2           | 0x66         | 28652          | MapIcon_Pin_Marker_Trace                             |

These are metadata associations, not spawned/completed markers. Type 226 is
chosen from the observed active LevelTreasureBox template, not guessed from
neighboring keys or the old commented TreasureBox component. Raw category
0xffffffff remains a sentinel and is not treated as a completion/visibility flag.

Static personal-category gate tracing found explicit checks at 0xd91f8f,
0xdb5c5a, 0xdb5eeb, 0xdb7ec9, 0xdb9738 and 0xdee9f2. Native world update/removal
branches call 0xd92930 only for categories 0x25/0x66. This supports trying the
actual chest type but does not establish the entire allowance/count mechanism.
Additional post-creation registration code uses configured type lists. No count
or cap modification is justified or implemented from these observations.

Version 0.20 keeps the three observational hooks and manually enables a typed
creation proof. After an original exact linked Bell-pin event completes unchanged,
it validates cached type 226, secondary 28852, raw category 0xffffffff and exact
MapIcon_Gimmick_LevelTreasureBox name. It queries the live controller for that
type with a private numeric tag key 0x5059415400000002/kind 0x15 and index 0.
Any existing icon prevents creation, without adoption or overwrite. The numeric
tag scheme remains a deliberate unproven part of this experiment; no fictitious
scene-object UUID or actual Bell gimmick identity is used for the chest.

When absent, the original generic 0xdeeb60 is called with type 226, private tag,
index 0, known east-of-Bell XYZ and the source callback's optional presentation
arguments synchronously on the same native thread. Opaque arguments are not
retained or fabricated. Their suitability for a general collectible layer is
unproven. A thread-local synthetic sample records native type/category/template
lookups; recursive generation is prevented. Every original event is still
forwarded once. After creation, guarded native lookup functions check actual
icon type at +0xde, tag at +0xc8 and XYZ at +0xe0. Matching world/minimap objects
set readback bits. No CSS class substitution or UI property write is performed.

The profile now guards five entries: three observed functions and two lookup
calls. F6 enables three minutes of generation; F10/focus loss/expiry disables
further creation. OFF/reload clears the transient display. No saved-pin
serializer/model insertion/deletion or save access is invoked by the probe;
end-to-end native persistence and interactions remain unproven. Do not save,
select or edit the experimental chest. Existing normal Bell pins stay unchanged.
The source still bootstraps from the Bell-pin callback; independent lifecycle
and capacity cannot be claimed until observation.

Compiled without warnings; no automated tests added or run. Next user sequence:
replace ASI with game closed; load Manual save 2 and note pin count; F6/reload;
check extra chest and HUD minimap plus unchanged personal count; F8; F10/reload/F8.
If type 226 still costs a personal slot, investigate the numeric identity or
replace the presentation path rather than increasing the limit or counter.
If independent, trace explicit UI lifecycle/removal before real collectible
placement. Active-save identity and completion-driven hiding remain pending.

## v0.20 invisible objects and v0.21 visibility observation

The user saw no extra chest on the Pywel map. Their personal count was unchanged;
no minimap visual check was attempted. Preserved log:
work/map-mod-research/categories-v0.20-invisible-chest.log.
Generation ran twice, definitionRejected=0, occupied=0, readbackMask=3. Both
controller samples verified type 226, the private numeric tag and exact test XYZ
with MapIcon_Gimmick_LevelTreasureBox. Thus native object creation succeeded,
while rendering failed. Capacity independence remains unproven.

Static tracing of 0xdeca40 shows the three bytes at icon+0x1e8 are a 24-bit
suppression mask. DL chooses the bit; R8B sets or clears it. A zero/nonzero
transition calls icon virtual +0x20/+0x28 respectively. World updater 0xdb5510
also clears bit 20 directly near 0xdb71b7; helper events alone are incomplete.
No suppression bit is cleared by this probe.

Version 0.21 keeps the creation attempt unchanged. Immediate creation samples
read suppression bytes, control-pointer presence and original creation flags.
An additional guarded hook on 0xdeca40 records private-chest bit operations,
caller RVAs and before/after bytes, forwarding all arguments and the original
return value. Identity is checked before and after the native callback. No
object/controller pointer crosses to the worker. Events use a bounded separate
queue and deduplication under the existing lock; failed queue attempts are
counted. Native lookup captures original marker states for comparison.

The generated profile has six guards: creator/type/template, two lookup-only
entries, and the suppression helper. Four functions are hooked. The profile
generator still requires the complete known EXE SHA. Compiled without warnings;
no automated tests added or run. Runtime observations pending.

Next sequence: game closed, replace DMM ASI; load Manual 2; F6/reload; open
Pywel/F8 even if invisible; close map/wait a few seconds/F8; F10/reload. No new
pins or saves, no capacity/minimap check needed. Then correlate suppression
callers with static predicates, or investigate template/projection/lifecycle
if masks are zero. Do not claim the visibility issue fixed until observed.

## v0.21 first runtime capture: no creation attempt

Preserved log: work/map-mod-research/categories-v0.21-no-generation.log.
All four hooks installed MH_OK. Two ON messages are followed by OFF; both F8
snapshots show enabled=0, generated=0, occupied=0, definitionRejected=0 and
readbackMask=0. No observations were dropped. This run never attempted private
chest creation and therefore supplies no chest visibility evidence. The log
does not record the OFF reason or timestamps, so focus loss, timeout or F10
cannot be distinguished. Repeated F6 resets the timer/readback mask and enables
rather than toggling; it does not itself disable generation. Ordinary marker
samples are deduplicated without the key, so the first key-0 row cannot prove
key 2 was absent.

Next capture uses the existing v0.21 build, no reinstall: F6 then immediate F8,
reload Manual 2 without leaving game focus, open Pywel/F8, close map/F8, then
F10/reload. Read the resulting log before changing any visibility behaviour.

## v0.21 armed capture and v0.22 definition comparison

Preserved log: work/map-mod-research/categories-v0.21-active-capture.log.
The repeated sequence succeeded: enabled=1, generated=2, occupied=2,
definitionRejected=0, readbackMask=3, dropped=0. The user confirmed no Pywel chest
appeared. World immediate suppression=000000; minimap=000002. Native helper
events: return RVA e09c0b clears bit 13; e09c35 sets bit 17; dba72e clears bit 0.
The world result does not rule out subsequent direct suppression writes, wrong
container or positioning failure. An unchanged pin count still proves nothing
about invisible-object capacity.

Static e09c30 sets bit 17 after df2cf0 returns false. That function includes
spatial-grid/range registration, so this is not proof of a tag/identity failure.
World creation db8371 selects a container by metadata byte +0x2a. Metadata +0xb7
and altitude can select another container. World position updater d94262 branches
on metadata +0xb0, with one path resolving +0x1c0 via 64f570 before projection;
other path starts from stored XYZ at d9465d. Equal template names for chest types
226/228 do not establish equal behaviour in these fields.

Version 0.22 extends the existing OFF/F8 catalogue with bounded raw cached
metadata +0x20..+0xbf for types 1, 226..229 and 360, plus numeric field labels
containerSelector/projectionBranch/altitudeBranch. It makes no metadata changes
and calls no missing-record loader. No additional hook or creation variant is
introduced. OFF logs now identify focus loss/F10/timeout. Compiled without
warnings; no automated tests added or run.

Next user step: close game/replace DMM ASI; load Manual 2; F8 with generation
left OFF. No F6, reload sequence, saving, pin placement or visual check needed.
Compare actual fields and trace relevant predicates before changing creation.

## v0.22 definitions and v0.23 scoped world container route

Preserved categories-v0.22-definition-capture.log: no generation, all four hooks
MH_OK, 612 calls/600 named, zero drops; 2027 cached/named, headersStable=1.
Fields (container +2a, projection +b0, altitude +b7): type 1 = 1/0/1;
226/227 = 0/0/1; 228/229 = 3/0/1; Bell 360 = 1/1/1. Both closed chest variants
start with supplied XYZ in the traced world position updater. They do not use
the Bell's scene-following projection branch. Container mismatch is a candidate,
not an established cause. UI markup has multiple native icon layers (UnderFog,
OverFog, OverFogTemp, OverAbyssFog, Always); no selector-to-name mapping is assumed.

Version 0.23 keeps native type 226 but changes only its synthetic world call's
parent. A fifth hook at db3bd0 captures the actual native container for the exact
live key-2 Bell pin. The source must subsequently yield a control pointer.
During a synchronous guarded synthetic call only, the sixth constructor argument
is replaced by that borrowed parent. This leaves shared definitions, normal
markers, native type/category/template and all other constructor arguments
unchanged. Context pointers stay thread-local only within the callback and
are restored on return. Nested creation contexts cannot adopt another parent's
capture. No worker stores object/controller/container pointers.

The fourteen-argument ABI is traced at db84a4..db84ed: controller, type, tag,
index, XYZ, container, unused slot7, stack scalar float, unused slot9, presentation
pointer, template name, optional12/13, final BYTE. The callee reads the sixth
at rbp+6f and scalar at rbp+7f (rbp = entry RSP - 0x3f). Final BYTE is +af.
Unused argument slots are forwarded, never interpreted. Original return is
preserved. The profile now guards seven entries (five hooks, two lookup-only).
Minimap extra creation is withheld to isolate world rendering. Diagnostic rows
add containerRouted; expected readbackMask is now 1, not 3. No suppression bits,
capacity counter/limit, shared metadata or saves are changed. Native persistence
and interactions remain unproven. No real collectible coordinates are used.

Compiled without warnings; no automated tests added or run. Runtime result
pending. Next: replace DMM ASI with game closed; load Manual 2/note pin count;
F6/reload; Pywel/F8/check chest and count if visible; F10/reload/check cleanup.
If visible, capacity and explicit lifecycle follow. If invisible, inspect child
binding, later positioning and native registration before broadening any route.

## v0.23 routed but invisible; v0.24 initializer observation

Preserved categories-v0.23-routed-invisible.log. All five hooks MH_OK.
Generation remained enabled through snapshot: generated=1, occupied=1,
definitionRejected=0, readbackMask=1, dropped=0. The synthetic world sample
had containerRouted=1, iconVerified=1 and suppression=000000. User confirmed
no chest appeared. F10 disabled generation. The container route ran, but it
alone did not fix rendering. Pin-capacity independence remains unproven.

Further static tracing: db4420 invokes the icon's initialization virtual +538
at db44e4 and checks its BYTE result. Common initializer d8a970 writes identity
and XYZ early, then performs child/attribute binding. It resolves BaseIcon
(+118) at d8aaa1..d8aab0, with a false-return branch if absent at d8aaba.
Additional parsing checks also return false. Existing object readback does not
prove this full procedure succeeded. Native size values are stored at +104.

Correction to earlier diagnostics: +110 is copied from the presentation
argument (d8aa0e..d8aa12), not a UI control pointer. The prior controlPresent
label was misleading. Version 0.24 renames it presentationPresent, preserving
the original source gate. Actual UI root +8 and BaseIcon child +118 now receive
separate presence fields; two size floats +104 are copied with read validity.

Version 0.24 retains v0.23 creation/routing and adds a pass-through initializer
observer (BYTE return, object/descriptor/BYTE arguments). It records native
result only when post-call type/tag matches the synchronous sample. Copied
state stays bounded; no live pointers cross to worker. Init failure is never
changed to success. The generated profile has eight guards: six hooks, two
lookup-only entries. Build compiled without warnings; no automated tests added
or run. Runtime initializer result remains pending.

Next user sequence: replace ASI with game closed; Manual 2; F6/reload; Pywel/F8
even if absent; F10/reload. No minimap or capacity visual check needed. If init
fails, trace its binding failure rather than changing more display parameters;
if it succeeds, follow later projection and UI visibility state.

## v0.24 initialization succeeds; v0.25 observes later world updates

Preserved categories-v0.24-initialized-invisible.log. All six hooks MH_OK;
generated=1, occupied=1, definitionRejected=0, readbackMask=1, dropped=0.
User confirmed no chest. Synthetic row: containerRouted=1, initObserved=1,
initResult=1, rootPresent=1, baseIconPresent=1, sizeKnown=1, size=(0,0),
suppression=000000. Working Bell/pin samples also have size=(0,0), so this field
alone is not an explanation. UI initialization succeeds, unlike the prior
failure hypothesis. No rendering fix or personal-slot independence is proven.

Static world updater d94040 has six arguments: controller, BYTE flag, layer,
opaque data, opaque stack pointer, float value. RBP = entry RSP - 0x968; +990
is the fifth arg, +998 the sixth. No incoming argument beyond those appears.
The updater performs direct suppression writes outside deca40, so the earlier
helper observer cannot establish later mask state. It reads stored X/Z at
d9465d/d9466a then calls d91820 at d94692 before subsequent presentation logic.
Scale helper d91820 takes object in RCX, float in XMM1, mode in R8B, float in
XMM3 and returns float XMM0. It uses native metadata and zoom; no return value
is modified by the new hook.

Version 0.25 retains creation/container routing and adds pass-through observers
for both functions. F8 opens a two-second capture window. Scale events matching
the exact private identity record phase=1/calculatedScale. Post-world-update
lookup matching the same identity records phase=2 with copied current root,
BaseIcon and suppression state. Phase 2 proves lookup/state after an update,
not that that particular layer update visited the icon. Scale count is separate
visitation evidence. Each phase is throttled to 100ms and deduplicated. Private
scale identity reads occur only within capture windows. The worker retains no
live pointers. It logs cumulative projection calls and private scale calls after
the window expires. Missing samples do not by themselves establish deletion.

The profile now has ten exact entry guards: eight hooks plus two lookup-only
entries. Compiled without warnings; no automated tests added or run. Next:
replace ASI with game closed; Manual 2; F6/reload; Pywel/Bell/F8/leave map open
three seconds; zoom in/F8/leave open three seconds; F10/reload/report. No saves,
new pins, minimap or capacity checks. If scale absent while updates run, trace
layer registration; otherwise compare zoom-dependent scale and late masks.

## v0.25 visible chest confirmed after zoom; reload cleanup confirmed

Preserved log: work/map-mod-research/categories-v0.25-visible-chest.log.
All eight hooks MH_OK. Generation snapshot: generated=1, occupied=1,
definitionRejected=0, readbackMask=1, dropped=0. The creation row retains
containerRouted=1, initResult=1, rootPresent=1 and baseIconPresent=1.
Phase 2 observes zero suppression after a native world update. Phase 1 reaches
the private chest's native scale calculation and returns 1.0. Capture summaries:
worldProjectionCalls=1068/privateScaleCalls=60, then 3096/114 (cumulative).
Deduplication omits repeated identical state; these rows cannot alone attribute
visibility to a particular zoom transition.

The user explicitly confirmed that the chest first appeared ONLY AFTER zooming
in, and that F10/reloading Manual 2 removed it while preserving original Bell
pins. This establishes visible native chest-type presentation and reload cleanup
in that sequence. It does not establish a zoom-independent fix, unchanged pin
capacity, absence of persistence under saving, or direct removal without reload.
Version 0.25 adds observers rather than a rendering change; no causal explanation
for the prior invisible runs is established. Preserve the working binary while
checking capacity at the same zoom before stripping diagnostics or broadening.

Next user step requires no rebuild/reinstall/restart: with generation OFF and
Manual 2 loaded, record displayed personal-pin count; F6/reload/zoom in until
chest visible; F8/wait three seconds/record count; F10/reload/record restored
count. Do not create new pins or save. Unchanged displayed counts would be
initial evidence of separate capacity accounting, not proof of all native
pin-limit behaviours. Subsequent work should trace explicit private-marker
removal on the UI thread, then map-layer switching and lifecycle, before real
collectible completion links.

Static removal follow-up: db8a60 signature receives controller, WORD type by
value, tag pointer and DWORD index by value. It first may call virtual +560
with an extra false flag, then looks up the object and updates native registries.
Near db9738 it calls d92930 only for categories 0x25/0x66. This is research
context, not authorization to invoke removal blindly or a proof of save safety.
No removal code was added or called in this turn.

## v0.25 displayed count unchanged; v0.26 direct-removal experiment

Preserved categories-v0.25-count-three.log. The user reported the chest was
already visible on opening the map after the first reload (no zoom required),
with 3 personal pins. F10/reloading cleared the chest and count stayed 3.
Combined with the prior explicit cleanup check, this is evidence for separate
displayed personal-pin accounting, not every native pin-capacity rule or stable
visibility across zooms. No new pin was created during this check. The working
v0.25 package is archived under work/superseded/PywelAtlas-Native-Map-Probe-v0.25-visible.zip.

Static native removal db8a60 receives controller, WORD type by value, tag pointer,
DWORD index by value. It may defer via virtual +560, then looks up the icon,
updates native registries, detaches the UI element, and updates category counts
only for 0x25/0x66 near db9738. Category 0xffffffff skips that personal count call.
This trace supports a scoped UI-removal experiment, not claims about all broader
native persistence or save safety. The probe performs no direct save I/O.

Version 0.26 adds a guard (not hook) for db8a60 and services removal after the
original supported world projection callback returns. The worker only disables
generation and requests cleanup. No cached controller/object pointer is used.
A nonblocking atomic gate avoids servicing recursively/concurrently. Ownership
is granted only after the probe's own routed creation and exact readback, never
by finding a preoccupied key. Before removal it requires ownership, exact native
type/tag/XYZ and the still-known cached definition. No identity match means no
native removal call. Typed absence before calling is separately reported.

The native removal entry is called once. No old object memory is read afterward;
a fresh typed lookup checks absence. If deferred, subsequent UI callbacks poll
for three seconds without repeated native calls. Failure reports a reload
fallback; no force-unlink/free or counter hack is attempted. In-flight creation
racing stop requeues removal after readback. F10 queues cleanup even if generation
is already OFF; focus loss and timeout also queue it. F6 cannot rearm while a
request is pending. An already absent or unowned marker does not trigger removal.
No completion state or saved pin record is altered by the probe.

F8 logs lifecycle owned/request/attempts/confirmedAbsent/alreadyAbsent/rejected/
outcome, alongside existing projection capture. Outcomes distinguish pending,
call/wait, post-call absence, already absent, no ownership, identity rejection
and timeout. Counters are observations; visible removal needs user confirmation.
Eight hooks remain; eleven entries are guarded (three native-call guards).
Compiled without warnings; no automated tests added or run. Runtime removal
pending. Next user sequence: replace ASI with game closed; Manual 2/F6/reload;
visible chest/F8; F10 while map remains open/wait three seconds WITHOUT reload;
F8; close/reopen map; F10 again/wait/F8. Verify original three pins and count
remain. If it remains, F8 before reload fallback. Then layer/reload lifecycle
and independent creation follow, before real collectible completion links.

## v0.26 direct removal confirmed without reload

Preserved categories-v0.26-direct-removal-confirmed.log. All eight hooks MH_OK;
1748 sampled creation calls, zero drops. Before removal: generated=1, occupied=1,
readbackMask=1; lifecycle owned=1/request=0/attempts=0. The user saw the chest
after zooming in. Its native scale sample was 1.0 with zero post-update
suppression. F10 requested cleanup, then outcome=3 confirmed typed absence.
Afterward: owned=0, request=0, attempts=1, confirmedAbsent=1, alreadyAbsent=0,
rejected=0. The user explicitly confirmed F10 removed the visible chest without
reloading, and it stayed gone after closing/reopening the map. Thus both visible
removal and scoped native lookup absence were observed, after one removal call.
The user did not give a fresh personal-pin count in this report; prior v0.25
visible/cleared counts were 3. No save persistence or completion is inferred.

Next uses the existing v0.26 binary, with no reinstall or source change:
F6/reload Manual 2; Pywel/show chest/F8; switch Abyss/F8 without F10; switch
Pywel/check exactly one chest/F8; switch Abyss/F10/wait three seconds/F8;
return Pywel/check absence and original three pins/F8. Keep focus, within three
minutes, do not save or create pins. This checks layer isolation, return to
Pywel without duplication, and removal while viewing the other layer. Failure
would motivate explicit layer lifecycle handling; none is assumed implemented.
Only after these checks should creation be separated from the Bell callback.

## v0.26 layer switching confirmed; v0.27 independent creation

Preserved categories-v0.26-layer-switching-confirmed.log. The user explicitly
confirmed all requested layer checks: visible on Pywel, absent on Abyss, one
chest on returning to Pywel, removal while viewing Abyss, and absence with the
three personal pins intact on returning to Pywel. The latest capture increments
generated to 2, attempts to 2 and confirmedAbsent to 2; owned/request return to
zero, no rejected removals, zero dropped samples. Do not infer completion/save
persistence or all category rules. Working v0.26 package is archived under
work/superseded/PywelAtlas-Native-Map-Probe-v0.26-lifecycle.zip.

Version 0.27 removes the Bell trigger entirely. ObserveCreate only observes
original events; IsBellPinSample, observedPinContainer and TryCreateChest are
removed. F6 queues one independent request. After a supported world update,
creation waits until its current layer pointer matches a freshly resolved
parent. Native cached definition 1 provides known selector=1/altitudeBranch=1;
no saved pin is accessed. The same alternate-container comparison as db83ae
uses the live threshold referenced by its guarded RIP instruction (the data
is not assumed file-backed or a constant guessed region boundary). Parent
comes from live controller+398 and its vtable is bounded to the image.

Chest definition validation remains exact. The native presentation provider
at cached chest record+68 is resolved and its virtual method +8 is called on
the UI thread with DWORD zero, as traced at df89d8..df89e6 and d8aa2e..d8aa3f.
The method must be committed executable memory inside this image. No opaque
pin argument is retained. A 0x28-byte zero-initialized empty property collection
matches df893a..df894b before its optional allocation. No element/vtable/scene
identity is invented. Native generic creation receives scalar=0, flag=0,
finalFlag=1 and that empty list synchronously. Its altered optional-property
behaviour is experimental, not assumed equivalent to the prior Bell callback.
The exact synthetic constructor route changes only its parent as before.

A CAS request state prevents nested creation. One completed attempt clears the
request; an occupied key prevents creation/adoption. Parent mismatch waits for
the target layer; rejected metadata/provider stops the request with an outcome.
Stop races are handled by the prior post-readback removal requeue. F10/removal
remains scoped to session-created/read-back exact private identity. The private
marker's independent layer behaviour still needs observation after this change.
No native saved-pin serializer/insertion or save access is introduced.

Further label correction: db4420 sets descriptor+28 to its first controller
argument at db4471, and common init copies descriptor+28 to icon+110. Thus it
is an owning controller pointer, not the presentation field as v0.24 had called
it. New label ownerControllerPresent replaces presentationPresent. Root/BaseIcon
fields are unchanged; neither old label was proof of bound UI. No pointer from
this diagnostic is retained. Source comments and current docs are corrected.

Generated profile includes the native altitude reference RVA and a 24-byte
instruction guard at db83ae: twelve guarded sites, eight hooks. Compiled without
warnings; no automated tests added or run. Runtime result pending. Next sequence:
install with game closed; load Manual 2 once; map open/F6/wait/F8; F10/wait/F8;
F6/wait/F8 to recreate; F10/wait/F8. No reload after F6 or F10, no saved-pin edits,
no saving. Then independent layer/reload lifecycle, local marker definitions
and explicit completion matching follow. No category completion is inferred.

## v0.27 first cycle works; v0.28 enclosing map-update scheduling

Preserved categories-v0.27-second-create-pending.log. The user confirmed first
independent creation/removal without reload worked, but second F6 did not
recreate it. Log: first generated=1/occupied=0/readbackMask=1, initialization and
route succeeded; F10 gives attempts=1/confirmedAbsent=1/owned=0. Second F6 logs
ON and independent outcome=0, followed eventually by F10/no-owned-marker.
No second creation attempt, occupied key or definition rejection is recorded.
There is no F8 snapshot between the second F6 and stop; the exact idle condition
is unproven. First capture had privateScaleCalls=0 despite reported visibility;
that counter alone cannot diagnose rendering outside capture windows.

Static caller tracing finds dabd10 is the enclosing native map update, owning
the container loop (+398 array, +3a0 count) that calls d94040 near dadb87. It
uses RCX/controller and scalar XMM1; input float participates in scalar animation
math. It clears controller+ace at dadc12 after the loop. Creation inside a
per-layer callback can set an invalidation flag that the enclosing finalizer
subsequently clears. This is a traced scheduling hazard, not a proven sole
cause of the observed second pending request.

Version 0.28 adds a pass-through dabd10 hook and services removal then creation
after the entire native update returns. Services are removed from the per-layer
projection observer. The obsolete layer-matching parameter/branch is removed.
Original callbacks/results are preserved. No controller/element pointer is
stored on the worker. The independent parent resolver now validates selector
against live container count (+3a0), bounded to 16. Missing UI parents remain
rejected. Creation still requires a live enclosing update, so a closed/unupdated
map can leave a request pending. F8 now logs worldMapUpdateCalls for diagnosis.

The native profile has thirteen exact guards, nine hooks; mapping hook indices
to sites is now explicit so the additional hook cannot target a guarded call
entry accidentally. Existing independent metadata/provider resolution, empty
property list, private identity, readback ownership, guarded removal and race
handling are retained. No saved-pin or save I/O is introduced. Prior v0.27 ZIP
archived under work/superseded/PywelAtlas-Native-Map-Probe-v0.27-first-cycle.zip.
Compiled without warnings; no automated tests added or run. Runtime repeatability
pending. Next: install with game closed, load Manual 2 once/map open, repeat
F6/wait/F8 then F10/wait/F8 three times without reload/map close. Check one
chest per cycle, removal and count 3; if failure, F8 before stop while map remains
open. Then independent layer/reload lifecycle and local collectible definitions.

## v0.28 three independent create/remove cycles confirmed

Preserved categories-v0.28-three-cycles-confirmed.log. All nine hooks MH_OK.
User confirmed each of three F6 presses created the chest and each F10 removed
it without reload. The enclosing-update counter advanced across all snapshots:
649/930, 1470/1728, 1944/2190. generated progressed 1/2/3, removal attempts and
confirmedAbsent progressed 1/2/3, occupied=0 and definitionRejected=0 throughout.
Final lifecycle owned=0/request=0/attempts=3/confirmedAbsent=3/rejected=0.
Zero observations dropped. This establishes repeatability for these three UI
cycles with the enclosing map-update service, not every idle/reload condition.
Prior v0.27's second-request failure did not recur. Current working ZIP archived
under work/superseded/PywelAtlas-Native-Map-Probe-v0.28-three-cycles.zip.

Next uses installed v0.28, no new binary: F6 on Pywel/one chest; Abyss/no chest;
Pywel/one chest; Abyss/F10/wait/F8; Pywel/check gone/original pins; reload Manual
2 while OFF/check absent; F6 without another reload/wait/F8/check one chest;
F10/wait/F8 cleanup. No saving, pin changes or automatic completion inference.
This rechecks region isolation for independent rather than borrowed inputs and
whether creation resolves fresh controller/container data after a save reload.
Automatic recreation while enabled through reload is not implemented or claimed.
After these checks, local marker definitions and explicit save-completion linking
can replace the single fixed-position proof, keeping progress per selected slot.

## v0.28 independent layer/post-reload checks confirmed; v0.29 local definition

Preserved categories-v0.28-layer-reload-confirmed.log. User confirmed expected
layer and post-reload creation results. Log extends totals to generated=5,
attempts=5, confirmedAbsent=5, occupied=0, definitionRejected=0 and final owned=0.
The three-cycle archive is retained under work/superseded. The fixed native
lifecycle is sufficiently repeatable for the next single-record input proof;
no completion, persistence under game saving or arbitrary-category behaviour
is established.

Version 0.29 introduces readable outputs/data/native-map-marker.json and a
separate NativeMarkerDefinition.cpp/.h worker-side loader using Windows JSON.
Build embeds the JSON template into generated marker-default.h; the first F6
creates %LOCALAPPDATA%/PywelAtlas/native-map-marker.json only when absent.
CREATE_NEW preserves existing user input, including malformed files. Existing
runtime definitions are application data and must survive cleanup/upgrades.
Read is bounded to 64 KiB with write/delete sharing denied, then handle closes
before parsing. UTF-8 BOM is accepted. Fields are validated for exact schema/id/
region/icon/completion source, boolean enabled, bounded printable name and
finite coordinates within +/-1,000,000. This is an arithmetic guard, not world
boundary evidence. Windows JSON is a system component, no new bundled license.

A copied staged definition passes to the UI through a separate lock, never with
file I/O or game pointers. Active values are committed only when the private
key is empty; existing markers keep their original coordinates for removal.
IsPrivateChest uses a copied active definition. Constructor routing checks the
synchronous sample's intended coordinates. Parent altitude selection takes the
candidate Y. Invalid input retains state with a log reason. enabled=false on F6
disables generation and requests scoped cleanup. Original source has no fixed
proof coordinates; the template owns them. Diagnostic names are logged, not
native tooltip labels. Completion source none is mandatory; no discovery is
inferred. Marker collections/actual POIs and explicit per-slot completion links
remain the next stage.

Nine hooks/thirteen guarded sites unchanged. Build now generates the template
header and compiles the definition module, linking runtimeobject.lib. JSON was
formatted using cached Prettier per .prettierrc.json. Compiled without warnings;
no automated tests added or run. Runtime loading pending. Next: install with
game closed; load Manual 2 once; F6/wait/F8/default point; F10/wait; edit runtime
JSON X only from -10502.4970703125 to -10402.4970703125/save file; game F6/wait/F8;
check +100 X shift and personal count 3; F10/wait/F8. No game saves, new pins or
reloads. The edited runtime file remains user data. See native-marker-definitions.md.

## Standalone product decision; v0.30 native Bell save-reading proof

User selected a single in-game mod, with no companion/helper program required.
Fallback, if native integration is not dependable, is one overlay app handling
both progress and marker display. The hybrid companion-feeding-mod option was
rejected. Existing native marker tests never required the companion app. Asking
the user to close a companion they were not running was unnecessary; instructions
now only ask to install the new ASI and press F7 in the game.

Version 0.29 local coordinate movement was user-confirmed and logged exact old
and new XYZ. That log also had dropped diagnostics: adding natural actor XYZ to
seen-sample identity expanded the dedup set. The pending fix now compares XYZ
only for generated samples, preserving changed marker positions without keeping
every moving native actor sample. No gameplay behaviour depends on these logs.
Working v0.29 ZIP archived under work/superseded/PywelAtlas-Native-Map-Probe-v0.29-data-confirmed.zip.

Version 0.30 adds NativeSaveReader.cpp/.h. F7 on the worker explicitly probes
Manual 2 (slot101) under the sole numeric Steam-account directory, rejecting
multiple accounts rather than inferring an active slot. The module opens the
save GENERIC_READ only with read/write/delete sharing, compares two full byte
reads and timestamps, retries up to four times, then retains a stable encrypted
copy under mod AppData. All decode operates on copied bytes; no source writes.
No Python interpreter, companion, external process or loopback API is used.

The native decoder accepts envelope version 2/header128, bounds encrypted/plain
sizes to 32/128 MiB, implements the original 64-bit-counter ChaCha20 ABI used by
the existing cryptography reader, verifies HMAC-SHA256 via Windows BCrypt, and
expands a bounded overlapping-match LZ4 block. Format interpretation/key derivation
is adapted from bundled pycrimson MIT source, whose license is added to the ZIP.
The independent LZ4 decoder follows the primary published format specification.

Selective reflection reads metadata 3â€“4/serialization 11â€“15, bounds type/property/
object/array counts, strings, recursion and offsets. It finds exactly one Bell
container/list, skips unrelated top-level payloads using the object table, and
parses nested records with size checks. Completion requires exact verified UUID,
allowed type key and explicit _isCompleted=true. Eight existing verified links
are embedded by prepare_bell_links.py. Unsupported property/version/representation
fails without a confirmation; no proximity or missing-record inference is used.

Success writes native-save-progress.json with profile, timestamps, explicit
loadedSaveDetected=false and per-Bell states, then displays a short diagnostic
MessageBox owned by the game process. This is temporary reporting UI, not the
final in-game selector. Failure logs/shows its exact stage; a prior successful
report is preserved and is not interpreted as fresh completion. No automatic
refresh or completion-based marker change is enabled in this proof. Existing
F6/F10 and marker JSON input remain intact.

Build now embeds Bell links, compiles native reader and links Windows bcrypt.
Nine hooks/thirteen entry guards are unchanged. The warning from implicit wide
account conversion was fixed using already-validated ASCII digits. Compiled
without warnings; no automated tests added or run. Runtime native save result
pending. Next user step is only game restart/DMM v0.30/F7; Manual 2 is selected
explicitly and no new save/pin/marker cycle is needed. Then inspect report and
bind one verified completion to owned marker visibility, followed by slot/stale
state handling and expanded verified categories. See native-architecture.md.

## v0.30 confirmed; v0.31 visibility connection

The user confirmed native Manual save 2 reading: Bells recorded 1 of 8,
explicitly completed 1, Hernand Bell Save confirmed. Native parsing no longer
needs a preliminary runtime check. Creation/removal and data loading were
already proven independently.

v0.31 now enables an explicit session link when F7 succeeds: the existing
synthetic chest is gated by Hernand Bell completion. F7 completion queues scoped
removal, and linked F6 always reads fresh snapshot bytes before allowing creation.
Unknown/error cannot authorize completion removal; failed F6 withholds creation.
The proof does not modify JSON, save files, personal progress, built-in icons
or native personal pins. It does not continuously watch or detect the loaded
slot. Restart resets the experimental link. These limits are explicit in the
packaged README and dialog.

Next user check: F6 visible chest, F7 confirmed/removal, then F6 remains hidden.
After confirmation, add explicit slot selection and refresh/state handling,
then real marker collections. v0.30 ZIP archived in work/superseded. v0.31
compiled without warnings; no automated tests added or run.

## v0.31 confirmed; v0.32 explicit selection and refresh

User confirmed completed Bell removes the proof chest and blocks subsequent F6.
Archived v0.31 visibility-confirmed ZIP under work/superseded. v0.32 replaces
hardcoded slot101 with explicit F9 selection among existing slot000â€“999 files.
Shows local modified timestamp; known manual100/101 labels only. Yes selects,
No cycles, Cancel retains. Selection persists in local native-save-selection.ini.
Account ambiguity still rejects. Slot changes clear the link and request old
owned-object cleanup; F7 enables selected-slot tracking again. Selection/reads
serialize on the worker; no asynchronous result can apply to another selection.

Five-second refresh reads stable copied bytes while the session link is enabled.
New explicit completion requests scoped removal; it never automatically creates
markers. Linked F6 still requires a fresh successful read, updating the current
completion transition state. Failures make no completion decision and cannot
consume the previous JSON report as input. F10/focus/three-minute proof lifecycle
is retained. No loaded-slot detection or game save writes. Reader snapshots now
use selected profile/slot names; report includes selectedSlot rather than a
hardcoded slotLabel. Slot settings/snapshots remain preserved local user data.

Categories compiled without warnings. No automated tests added or run. Next
runtime observation checks F9 selection and known completed-slot F7/F6; an actual
save completion transition is still needed to demonstrate the timer in game.

## v0.33 automatic save identity investigation

User prioritized automatic loaded-save detection and skipped v0.32's manual
selection check. Preserved the marker builds. New isolated SaveLoad build uses
NativeSaveLoadProbe.cpp, two guarded pass-through detours and worker-only F7
summaries. Package PywelAtlas-Save-Detection-Observation-v0.33.zip replaces other Atlas ASIs
for this observation; no marker hooks or save parser run in this build.

Found native Start/End Load SaveSlot strings at 57db770/57db620, both referenced
by 186f570. ABI: manager, result storage, requested slot R8D, save object R9.
Zero native result follows success; valid numeric ranges explicitly checked.
Direct callers include 2c17520 (latest-timestamp slot preparation), 2c3e030
(explicit argument slot path), and 1042aaf0 (2940ee0 jump thunk). The latter
calls the native reader then 2941020 on read success. Observe that later apply
candidate as a second hook; RCX wrapper +8 identifies the save object. Result
pointer and copied object +60 field are logged but not considered loaded state.

No game functions are invoked independently. Callbacks preserve args/results,
copy bounded values, enqueue nonblocking and preserve LastError. Worker alone
logs append-only native-save-detection.log and displays summaries. No worker
dereference of diagnostic addresses, no account guess, no newest-file shortcut,
no selected-slot write and no completion/marker changes. Timestamp/image and
24-byte entry guards apply before installing either hook. The module is pinned
for process lifetime; never unload ASI live.

Compiled without warnings; no automated tests added/run. Runtime sequence:
load Manual 2/F7, browse Manual 1 without loading/F7, load Manual 1/F7, reload
Manual 2/F7. Need inspect actual events before claiming identity. Continue,
death/autosave reloads, failure paths, title transitions, account identity and
world-ready boundary remain outstanding. Full evidence in native-save-detection.md.

## v0.34 notification fix after first runtime trace

v0.33 recorded slot1 preparation, successful slot101 reads from 2c3e1d3 and
1042abf8, and a successful apply return from 1042ac11 on the second object.
First checkpoint reads=3, applies=1, sameObject=1, dropped=0. Log stopped there.
User confirms the dialog existed behind the game. Modal MessageBoxW on the
logging worker likely prevented later draining. Preserved that log in work.
The copied object +60 values were unrelated large numbers, not usable slot IDs.

v0.34 records F7 first and uses a separate notification thread to show a copied
confirmation with MB_TOPMOST|MB_SETFOREGROUND, as explicitly requested by user.
The logger never waits for dismissal. No owner HWND is passed, so the game
window is not disabled. Interlocked popup ownership prevents duplicates, while
all F7 presses still log checkpoints. No game pointers reach notification thread.
A briefly considered silent-only build was not delivered and is superseded.
Hook ABI/targets remain unchanged. Compiled without warnings; no tests added/run.
Fresh two-slot/menu-browsing sequence still needed to evaluate detection.

## v0.35 expanded lifecycle observation

Continued from the confirmed 101/100/101 trace. Added scoped observation of outer
wrapper 1042aaf0, context cleanup 206b750 and Steam storage initialization
ef62160 to read/apply hooks. Correlation requires matching scope/object/slot and
successful read/apply/outer return without capture drops. Cleanup can invalidate
the candidate; it never dereferences the context after original cleanup returns.
Steam root copying checks handler vtable 59840c0 and copies bounded byte string
+20 / heap +128 while live. This is account-path evidence only, not selection.
Removed invalid +60 sampling; raw vtable and entity lifecycle bits are research
values, not world readiness. Details in native-save-detection.md.

All five entry guards match the installed executable before hooks are installed.
Built without warnings; no tests added/run. No save parser, marker changes,
independent load calls or trusted automatic selection in the observation build.
Next requested sequence is initial title -> Continue -> title -> Continue, F7
at each settled stage, with foreground/topmost confirmations. Previous manual
sequence need not be repeated. Package v0.35 retains the distinct observation
ASI filename and preserves superseded ZIPs under work.
