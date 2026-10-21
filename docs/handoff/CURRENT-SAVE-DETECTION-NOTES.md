# Automatic loaded-save identity investigation

## Current continuation — 2026-10-21, v0.37

The confirmed v0.35 baseline is preserved in this workspace at
`work/map-mod-research/save-detection-v0.35-continue-title-confirmed.log`.
It contains the earlier append history plus the v0.35 session; select by its
SESSION header when analyzing it. Four checkpoints, candidate off/on/off/on,
zero drops, both Continue loads slot1, root ending `60062761` are complete.
Do not repeat manual 101/100/101 or Continue/title observations.

v0.36 source and a compiled DMM ZIP are now under this workspace's outputs.
It adds native loading-controller phase snapshots and field/reload observations.
Its runtime sequence is gameplay/F7 -> death screen/F7 -> retry gameplay/F7 ->
explicit autosave load/gameplay/F7. See the packaged SaveDetection-README.md.
The v0.36 runtime result is now captured; see the final section. No
reader/marker integration was made.

v0.37 now observes the native actor resolver to investigate the client/server
link exposed by v0.36. Compiled ZIP is available; runtime linking is pending.
Only a normal gameplay load and one F7 checkpoint are requested. Completed
death/retry, autosave, manual-slot and Continue/title sequences remain complete.

The historical sections below describe earlier versions; the v0.36 section at
the end is the current research and next decision. Earlier build/source and
v0.33 artifacts remain in the original 2026-10-20 workspace.

## Scope and status

v0.31 is user-confirmed: native reading of Hernand Bell completion removes the
proof marker and blocks recreation. The user chose automatic loaded-save
identity as the next investigation, skipping v0.32's manual selection check.

v0.34 is the current observation ASI, compiled without warnings. v0.33 captured
a successful slot101 read and same-object apply return, but its hidden F7 modal
dialog likely blocked the worker. The rest of that sequence is inconclusive.
v0.34 moves confirmation to a separate thread with foreground/topmost flags
and awaits a fresh trace. The logger never waits for dialog dismissal. It neither changes selected progress nor affects markers.
Do not call a decoded slot an activated gameplay save until evidence supports it.

## Static evidence in the installed Steam executable

Source: E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe.
PE timestamp 1790086912; image size 389722112. All addresses below are RVAs.

| Site                                 | Evidence                                                                                                                                          |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------- |
| 0x57db770 / 0x57db620                | Start Load SaveSlot / End Load SaveSlot strings                                                                                                   |
| 0x186f570                            | Sole RIP-relative owner of both strings; receives manager RCX, result storage RDX, slot R8D, save object R9; returns result pointer               |
| 0x186f5d7ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“0x186f64a | Validates slots 0ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“3, 100ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“108, 200ÃƒÂ¢Ã¢â€šÂ¬Ã¢â‚¬Å“207                                                          |
| 0x186f78a                            | Calls lower read routine 0x20688a0, fifth argument is the slot; result DWORD branches to success when zero                                        |
| 0x186f898                            | Writes zero to result storage on the end-load path                                                                                                |
| 0x2c17881                            | Caller in 0x2c17520; scans slot records and selects a latest timestamp candidate, consistent with Continue preparation; exact UI binding unproven |
| 0x2c3e1ce                            | Caller in 0x2c3e030; slot read from argument data; continues through context construction and apply dispatch                                      |
| 0x2940ee0                            | Jump thunk to 0x1042aaf0                                                                                                                          |
| 0x1042abf3                           | That wrapper calls 0x186f570 with slot R9D from its own entry, then calls 0x2941020 on read success                                               |
| 0x2941020                            | Later apply candidate: wrapper RCX has save object at +8; native result storage RDX; returns result pointer; zero on final success branch         |

The apply wrapper can cause another native read, so multiple read completions
per actual load are plausible and must not be deduplicated into assumptions.
The +0x60 field produced 2416967680 and 2685403137 in the observed objects.
It is not a valid slot identifier there. Raw sampling remains diagnostic only;
F7 checkpoints and state decisions exclude it.
There is no identified world-ready signal or Steam account binding yet.

## Diagnostic design

NativeSaveLoadProbe.cpp hooks only read 0x186f570 and apply 0x2941020. Guarded
24-byte contexts are generated in save-load-profile.h. Calls preserve opaque
arguments, result pointers and LastError. Capture start/end phases with sequence,
thread, ticks, caller RVA, object address, requested slot, copied +0x60 field
and result code/readability. No stored pointer is dereferenced by the worker.
A bounded queue and drop counter prevent file/dialog work on loading threads.

F7 records a worker-owned checkpoint and requests foreground confirmation; the append-only log
contains chronological events and checkpoint counters. Last-event comparisons
are only a convenience: concurrent loads, address reuse or failed attempts can
make them misleading. Inspect the full trace before deriving any trusted state.

The installed probe cannot parse a save, create/remove markers, persist detected
slots or import progress. It launches no external process. MinHook hooks are
process-lifetime and must not be unloaded live. Existing marker ASI must be
disabled while this ASI is enabled. The observation binary is now named
PywelAtlasSaveDetectionProbe.asi so DMM can retain both independent entries.
Its README and license also have distinct SaveDetection names in the package.

## Research artifacts

Under work/map-mod-research:

- inspect_save_load.py and save-load-strings.json: executable ASCII name survey.
- find_save_load_references.py: candidate RIP/direct-call references.
- disassemble_save_load.py: focused unwind-bounded disassembly.
- listener-186f570.asm and save-load-*.asm: static call/branch evidence.
- prepare_save_load_profile.py: generation of supported-entry bytes.

These scripts inspect files only. None was used to invoke gameplay functions or
alter the game's save files. Large generated research data stays outside source.

## Next observation and decision

User sequence: explicitly load Manual 2 -> F7; browse Manual 1 without loading
-> F7; load Manual 1 -> F7; reload Manual 2 -> F7. Observe after character control
returns. Expected requested identity sequence is 101, unchanged by browse, 100,
101; actual read/apply events remain the evidence, not the expectation.

If supported, trace a world-activation/load-success boundary and account identity
next, then cover Continue, autosave/death reload and failure/title transitions.
Only after those are established should slot changes clear old progress and
switch the marker reader automatically. Keep explicit selection as fallback.
Newest-file timestamps alone must not be used as loaded-save identity.

## v0.33 observed trace and modal UI correction

Preserved trace: work/map-mod-research/save-detection-v0.33-first-read-apply.log.
The native reader first saw slot1 from caller 2c17886, then slot101 from
2c3e1d3, then slot101 on a different object from 1042abf8. All returned zero.
Apply 2941020 returned zero for that second object from 1042ac11. First F7
checkpoint: reads=3, applies=1, sameObject=1, dropped=0. No further events
were written. This confirms interception of a candidate path, not the full
two-slot/menu-browsing sequence or world-ready state.

User reports the dialog existed behind the main game window. The modal call
immediately after that checkpoint could block the worker while callbacks kept
queuing events. v0.34 moves MessageBoxW onto a dedicated notification thread, using
MB_TOPMOST | MB_SETFOREGROUND. A dialog can no longer prevent draining. No hook ABI or marker behavior was changed.
F7 records last requested slot/read/apply status before requesting confirmation.
A single interlocked ownership flag protects copied text and prevents duplicate
popups. No owner HWND is supplied, avoiding disabled gameplay while the dialog
awaits dismissal. No notification thread accesses game object pointers.

The user specifically prefers visible confirmation. This supersedes the brief
log-only v0.34 plan, which was not delivered. Windows flag semantics follow
[MessageBoxW documentation](https://learn.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-messageboxw).

## Later inspection: two-slot sequence was captured

A later read of the same v0.33 session log revealed events after the first F7:
slot100 read returns from 2c3e1d3 and 1042abf8, apply return from 1042ac11,
then the same pattern for slot101. Every observed read/apply return code was
readable and zero. The apply object's address matched the immediately preceding
1042abf8 read for all three manual loads (101,100,101). Therefore the requested
two-slot loading sequence is present; do not ask the user to repeat it simply
because the earlier inspection only saw the first checkpoint.

Only one F7 checkpoint exists. The log header is v0.33, with no v0.34 session.
Thus browsing-versus-loading has no separate checkpoint boundary, and v0.34's
foreground notification behavior is unobserved. The absence of extra read/apply
events between actual loads is consistent with browsing having no effect but
does not independently timestamp that action. Full automatic detection remains
pending activation/account and alternative-load-path work.

Preserved complete trace: work/map-mod-research/save-detection-v0.33-two-slot-sequence.log.
Next research should correlate successful read identity with apply, then resolve
activation/account and Continue/death/reload paths; retain this baseline evidence.

## v0.35 scoped load, cleanup and account-path research

Manual 101 -> 100 -> 101 reads/apply are already preserved; no repeat requested.
Static analysis traced the outer 2940ee0 thunk to 1042aaf0: wrapper RCX contains
save object at +8, result storage RDX, opaque context R8, requested slot R9D.
It calls 186f570 then 2941020 only on read success, returning native result
storage. v0.35 observes this full function as a third hook. Thread-local scope
ID and slot are restored after nested calls. Worker correlation requires same
scope/object/slot, supported slot, successful read before successful apply,
outer success, and unchanged diagnostic drop count. A bounded 16-entry worker
record table avoids pairing reused addresses or unrelated reads. The resulting
candidate is diagnostic only; worldReadyTrusted/accountTrusted remain false.

Fourth hook: 206b750 context cleanup. Static code removes a context from manager
components and clears manager +d0 if it matches that context. Observe start/end;
retain pre-call object snapshot only, since native cleanup can free it. Matching
last-load cleanup clears the worker candidate. This is not yet proven to cover
all title/death transitions and is not a general world-ready/active pointer.

Fifth hook: Steam storage initialization 235ab00 -> ef62160. It formats the
handler root into a byte string at +20, heap pointer +128, then tests filesystem
availability and returns bool AL. Native handler RTTI vtable is 59840c0.
Only that exact vtable authorizes copying a bounded non-control root string
while the handler is live. This records possible account-path evidence; it
never selects an account or parses arbitrary userdata. Hook forwards the
original function and does not invoke any storage/game functions independently.

Removed invalid +60 slot sampling. Log raw object vtable RVA and entity +5e
lifecycle bits instead, without assigning world-ready semantics. Context state
progression inside 2941020 is generic entity initialization; do not equate bit
values to gameplay readiness without further trace evidence. The thunk
29415e0 -> 10430980 sends notifications/updates components, not a proven active
save pointer. Further evidence required before using it as an activation signal.

New research scripts: inspect_save_rtti.py/save-load-vtables.json, plus focused
save-load disassemblies. Five site guards are generated in save-load-profile.h.
v0.35 compiled without warnings. No tests added/run. The next user sequence is
title/F7 -> Continue/gameplay/F7 -> return title/F7 -> Continue/gameplay/F7.
It exercises alternative loading and cleanup rather than repeating manual slots.
F7 foreground/topmost notifications run independently from the logging worker.

## v0.35 runtime confirmed: Continue/title/Continue

User completed all four stages and confirms foreground notifications appeared
and were dismissed each time. Latest v0.35 log has four F7 checkpoints with
correlated=0,1,0,1 and dropped=0 throughout. Both Continue loads used slot1.
Each outer scope (4 and 13) captured matching read/apply/load with zero results;
gameplay object's raw lifecycle bits changed 1 -> 0x10. Returning to title
triggered cleanup of the matching last-load object and cleared the candidate.
A title-screen preparation read occurred without promoting a candidate.

Steam storage initialization returned boolean1 and copied root
C:/Users/Thomas/AppData/Local/Pearl Abyss/CD/save/60062761. This confirms root
capture for this session; validated account/slot consumption is not wired yet.
Full append log preserved as work/map-mod-research/save-detection-v0.35-continue-title-confirmed.log.

Next engineering step: establish an actual world-activation/invalidation boundary
and cover death/retry and explicit autosave reload before connecting the native
storage account + correlated slot to ReadSelectedBellSave. Do not repeat the
confirmed manual 101/100/101 or Continue/title sequence. Current observation
has no marker effects; v0.31 remains the confirmed Bell visibility baseline.

## v0.36 static boundary research and observation build

This continuation uses only the installed PE and existing trace, without
repeating user observations or invoking game functions independently.

RTTI resolves runtime vtable `5b1e2b0` to `ServerChildOnlyInGameActor` and
`5b257a8` to `ServerUserActor`. The former's virtual `+78` thunk at `28f2c20`
leads to `103789e0`, which changes `+5e` from 8 to 0x10. It is called by
`2941020` before apply returns: this lifecycle value cannot establish the
later player-control boundary. `206b2d0` sets user actor `+d0` to its first
eligible child during attachment; this pointer alone is also insufficient.

Stronger static evidence:

| Site (RVA) | Evidence |
| --- | --- |
| `595a078` | RTTI vtable for `ConditionData_IsEnterToFieldLoadingComplete`; virtual `+a8` points to `22a8d40`. |
| `22a8d40` | Follows actor context through `17ef9c0`, then `17ee020`; reads selected child's byte `+c3`. Missing context returns 2; otherwise the byte is tested and the logical-not value is returned. Do not assume numeric condition-enum labels without more evidence. |
| `17ee020` | Follows actor `+a0`, then manager `+d0`, checking native lifecycle compatibility before returning the child in reference-wrapper storage. |
| `219d7f0` | Component RCX owns actor at `+8`; writes its `+c3=1`, returns DWORD result storage. Consumes six arguments, including fifth-byte flag and sixth pointer. Name remains descriptive, not proof of a load-start semantic. |
| `77a220` | Client controller RCX, child RDX, boolean AL result. Clears child `+c3` when its initial guard permits. Caller `7797f0` invokes it in phase 2, so this is an early reset, not loading completion. |
| `7797f0` | Per-frame controller update; RCX controller, XMM1 elapsed float. Reads controller `+15c` phase and obtains child via controller `+b8`, component `+50`. Runs phases 1 through 23 with multiple asynchronous gates. |
| `77a0df`–`77a13a` | Phase 23: if a child exists, calls `b7e700` once, then waits while child `+c3==0`. Once nonzero (or if no child), changes phase to 24 and invokes completion callbacks. Null-child path means phase 24 alone cannot identify active gameplay. |
| `28f82a0` | Field transition path with four register arguments and **two additional stack-byte arguments**; includes `+c3` clears and calls `2bc4950`. |
| `294d5b0` | Additional four-argument field/reload path with child at component `+8`; clears `+c3`. |

Focused disassemblies, field-byte writer references, caller references and RTTI
tables are retained in `work/map-mod-research/`. Phase 24 plus the exact loaded
object, selected-child equality, byte `+c3=1` and zero intervening record drops
is a new **diagnostic candidate**, not established gameplay activation. The
native null-child completion path is explicitly excluded from that match.

Implementation: ten guarded hooks. The existing five remain; new hooks observe
`219d7f0`, `77a220`, `28f82a0`, `294d5b0`, and `7797f0`. Controller snapshots
are queued only on changed phase/object/field byte, including within-call phase
changes. Unchanged frame snapshots are suppressed, so sequence gaps are not
queue drops. Actual drop count is recorded and invalidates summary candidates.
No worker dereferences retained addresses. Exact actor/manager vtables gate
new field reads. Cleanup retains pre-call data only. Foreground/topmost F7
notifications remain on the separate thread.

New trace fields: `CONTROLLER`, `FIELD_STATE`, `CLIENT_BOUNDARY`, and F7
`controllerPhase/clientBoundary/clientResetCount/fieldBeginCount/fieldTransitionCount/fieldReloadCount`.
The original read/apply/load scope and slot records remain the disk identity
evidence. A matching later pointer does not prove that an in-memory retry read
the same slot again. A death screen may retain the world; whether it needs its
own invalidation signal is still unresolved. Both trusted-state flags stay 0.

Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Packaged as `outputs/mods/PywelAtlas-Save-Detection-Observation-v0.36.zip`.
Current source is `outputs/tools/native-map/NativeSaveLoadProbe.cpp`.

Next: inspect the four new checkpoints and all surrounding events. Establish
whether the phase-24/object/field-byte match occurs after the load and by player
control, what death/retry invalidates or reuses, and whether explicit autosave
loading produces a fresh native slot chain. If phase 24 is absent or earlier
than control, trace the actual later signal rather than promoting it. Only
after those runtime facts should detected account/slot be connected to the
existing `ReadSelectedBellSave` baseline in the original workspace.

## v0.36 runtime confirmed: death/retry and explicit autosave load

User completed the four requested stages and confirmed all foreground dialogs.
Latest session: PID 35148, start tick 20534796. Complete session preserved as
`work/map-mod-research/save-detection-v0.36-death-retry-autosave-confirmed.log`
(99,360 bytes at capture). Exactly four F7 checkpoints; zero dropped records.

| User checkpoint | Reads / applies / loads | Phase | Correlated | Boundary match |
| --- | --- | --- | --- | --- |
| Initial controllable gameplay | 3 / 1 / 1 | 24 | 1 | 0 |
| Death screen before retry | 3 / 1 / 1 | 24 | 1 | 0 |
| Controllable gameplay after retry | 3 / 1 / 1 | 24 | 1 | 0 |
| Controllable gameplay after explicit autosave load | 5 / 2 / 2 | 24 | 1 | 0 |

Initial native disk load used slot2, scope1723, object `3cfd40f0200`.
Retry produced another field-loading/controller cycle and field-ready calls,
but no additional native disk read/apply/load and no cleanup of that loaded
server object. Treat this observed retry as world reuse/in-memory restoration;
do not invent a newly loaded disk slot. This does not establish every retry mode.

Explicit autosave loading cleaned up the original loaded object, then created
object `3cfd40f0400` in scope13514. Matching read/apply/load all returned zero,
again for slot2. Steam root capture again succeeded for account path `60062761`.
User did not supply the autosave's displayed label/time; native slot2 is the
observed identifier, not an inferred UI label.

The boundary mismatch exposed a probe assumption: loading-controller snapshots
refer to a different actor (vtable `5585c40`) from the save-load server actor
(vtable `5b1e2b0`). Initial/retry controller object was `3cf7ca81a40`; after
autosave it was `3d03c70c940`. Thus direct address equality cannot connect this
controller boundary to the save actor. The exact-layout guard correctly withheld
field reads and all `clientBoundary` matches. Do not remove the guard or accept
phase24 alone to make the indicator pass.

Phase24 was also present on the death screen, with the same summary as initial
gameplay. It is evidence of a completed loading sequence, not evidence that the
player is alive/controllable. Server field-ready calls set `+c3` from 0 to 1
near phase23->24; corresponding calls occur on the other actor as well. The
observations support a paired actor lifecycle but do not prove its identity link.

Next engineering work is to establish the native relationship between these
two actor objects and decide separately how death suspends marker consumption.
Keep the successful slot2/autosave and retry trace; do not request another run
of these completed sequences merely because the boundary match stayed zero.
Automatic identity-to-Bell-reader integration remains withheld until that
relationship and activation/invalidation policy are grounded in evidence.

## v0.37 native actor-link investigation

RTTI establishes `5585c40` as `ClientChildOnlyInGameActor`, `5b1e2b0` as
`ServerChildOnlyInGameActor`, and `55b59f0` as `ClientUserActor`. The client
manager must not be mistaken for the server manager at `5b257a8`.

The game's existing lookup at `17ef9c0` provides a more grounded lead than raw
address/identity comparisons. It obtains actor component `+68,+1a0`, calls its
virtual `+140`, checks the returned reference validity, takes that context's
DWORD `+180` into a native registry virtual `+30`, checks validity again, and
calls `206ae30` on the result. That getter returns manager `+d8` in a checked
reference wrapper. Separately, native `17ee020` follows a world actor `+a0`
to manager `+d0` to obtain its selected child. These form a candidate native
route to a loaded server child; whether the observed client input resolves
through the server manager on this loading path is still a runtime question.

`219d7f0`'s fourth actor argument is supplied through `206ae30` in both server
caller `2bcaf00` and client caller `9ceac50`. This is an additional explicit
relationship to record. Do not infer that those fourth arguments are equal
or that identical timestamps establish client/server pairing.

v0.37 adds one pass-through resolver hook (eleven total), copying the native
returned wrapper while it remains live. It logs source, returned actor/vtable,
wrapper validity, candidate owner and selected server child. `nativeLinkRead`
requires an exact client-child input, native valid wrapper, exact server-user
manager, exact server-child target, and reciprocal target owner. It never
calls the getter independently. All of this remains diagnostic; raw candidate
owner reads do not themselves authorize a state change.

The two confirmed child vtables now permit shared `+c3/+a0` diagnostic reads,
with separate exact client/server manager guards. Field-ready observations
also copy the native fourth actor argument. Controller and resolver repeated
values are suppressed. Matching is recomputed whichever arrives last, requires
observations at/after the current load and an unchanged drop count, and is
cleared on a new load or matching cleanup. Phase24 is still not an alive or
player-control signal. No account/slot-to-Bell integration is enabled.

Research files: `actor-link-layouts.txt`, `actor-link-vtables.json`, and focused
disassemblies for `17ef9c0`, `206ae30`, `206aec0`, `9ceac50`, `2bcaf00`.
Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Package: `outputs/mods/PywelAtlas-Save-Detection-Observation-v0.37.zip`.
Next runtime observation: enter gameplay normally, move briefly, F7/OK once.
Do not request repetition of death/retry or explicit autosave loading.
