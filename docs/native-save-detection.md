# Automatic loaded-save identity investigation

## Current continuation — 2026-10-21, v0.40

v0.40's save-switching run is complete (see "v0.40 runtime result" at the
end). Recomputing the boundary on every generation change removed the stale
re-formation: each selection formed only after a fresh match and stayed
retired otherwise. The death/retry/autosave run kept the selection through
death and retry and replaced it on the in-game autosave load. The selection
lifecycle is complete for diagnostics; the next step is a diagnostic Bell read
tagged with the selection serial.

Previous status (v0.39):

v0.39's normal-load/F7 run is complete; see "v0.39 runtime result" at the end.
The full-key match held, and the diagnostic selection formed once for slot 2,
account 60062761, with zero drops. The save-switching run (slot 101, title,
slot 100, slot 101) retired and re-formed correctly, except for one stale
re-formation after an unrelated cleanup; see "v0.39 runtime result: save
switching". The earlier paragraphs below are kept as history.

The confirmed v0.35 baseline is preserved in this workspace at
`research/traces/save-detection-v0.35-continue-title-confirmed.log`.
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

Under research/ (scripts/, disasm/, analysis/):

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

Preserved trace: research/traces/legacy/save-detection-v0.33-first-read-apply.log.
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

Preserved complete trace: research/traces/legacy/save-detection-v0.33-two-slot-sequence.log.
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
Full append log preserved as research/traces/save-detection-v0.35-continue-title-confirmed.log.

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
tables are retained in `research/analysis/`. Phase 24 plus the exact loaded
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
Packaged as `archive/releases/PywelAtlas-Save-Detection-Observation-v0.36.zip`.
Current source is `src/save-detection/NativeSaveLoadProbe.cpp`.

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
`research/traces/save-detection-v0.36-death-retry-autosave-confirmed.log`
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
Package: `archive/releases/PywelAtlas-Save-Detection-Observation-v0.37.zip`.
Next runtime observation: enter gameplay normally, move briefly, F7/OK once.
Do not request repetition of death/retry or explicit autosave loading.

## v0.37 runtime result: resolver is side-local

Session PID 26908, extracted to
`research/traces/save-detection-v0.37-normal-load-f7.log` (the complete session;
the game was closed and the live log unchanged afterwards). One F7 checkpoint.

- Disk load: scope13902, slot2, read/apply/outer success, `correlated=1` at
  LOAD_CHAIN. Steam root again ends `60062761`. Controller phase24.
- 105,972 ACTOR_LINK records from ~1000 distinct sources. Every valid result
  stayed on its own side: client sources (vtables `55857b0`, `5585c40`)
  returned the controller's client child `0x541c048bf40` via client manager
  `0x54211517fc0`; server sources (`5b1de20`, `5b1e2b0`) returned the loaded
  server child `0x542420f0200` via ServerUserActor `0x542421a0000`, whose `+d0`
  is that child. `nativeLinkRead` stayed 0, correctly: no record had a client
  source and a server result. The controller child resolving itself returned
  `valid=0`; another ClientChildOnlyInGameActor resolved to it.
- **The probe defeated itself:** alternating sources thrashed the thread-local
  change cache, causing `dropped=449`, which cleared the correlated candidate.
  F7 therefore showed `correlated=0`. This is a probe defect, not a user error.

Conclusion: `17ef9c0` cannot provide a client-to-server relationship.

## v0.38 static basis: tagged keys in per-side actor managers

Static analysis (`research/scripts/find_registry_globals.py`,
`find_rtti_names.py`; output in `research/analysis/registry-global-references.json`,
`rtti-user-actor-names.txt`; disassembly `acf580`, `27c0450`, `8ae390`,
`2a82590`, `464290`):

- The resolver's TLS-selected roots are written once each: `6d694d8` by
  `acf580` (root `+0x90` byte = 0) and `6d694e0` by `27c0450` (`+0x90` = 1).
  This confirms client/server root selection.
- RTTI: `ClientActorManager` vtable `55b62c8`, `ServerActorManager` `5b25988`.
  Their virtual `+0x30` are `8ae390` and `2a82590`. HYPOTHESIS (to be confirmed
  by the return-address filter at runtime): the registry at root `+0x10` is
  the respective ActorManager.
- `8ae390` requires `(key & 0x30000000) == 0x10000000`, looks up the full key
  via `464290` (entries: key at `+4`, actor at `+8`), and requires actor
  `+5e & 4`. `2a82590` accepts bit30-clear keys with any tag, or requires tag
  `0x20000000` when bit30 is set. It looks up `key & 0xfffff`.
- The earlier "+60 is not a slot" values decode as `0x90100000` and
  `0xA0100001`, consistent with client- and server-tagged actor keys.
  HYPOTHESIS: the same player shares the 20-bit index across sides.

## v0.38 observation build

Thirteen guarded hooks. Added `8ae390` (client) and `2a82590` (server): RCX
manager, RDX output wrapper, R8D key; R9 is not consumed and is forwarded
opaquely; both return the wrapper. Only calls returning to `17efaa3` (the
resolver's registry call) are sampled; all others pass straight through
without reads. Sampled calls copy the key, wrapper validity, the exact-typed
user actor, its `+d0` selected child and its `+60` DWORD. KEY_LINK lines are
change-only per side, globally.

Other changes:

- Resolver records are queued only for exact client/server child sources,
  which also log their `+60` DWORD (`sourceKey`).
- Observation epoch: load and cleanup hooks advance it on the game thread, and
  the worker advances it once per drop-count change. Every event carries it.
  Change-only caches (resolver, key lookups, controller) re-emit when it
  changes. This addresses the v0.37 limitation that unchanged associations
  were never re-emitted after invalidation.
- The boundary no longer uses the refuted resolver link or tick ordering. It
  requires: a correlated load; a current-epoch controller at phase24 with
  `+c3=1` and the controller child as client-manager selection; a current-
  epoch client key lookup whose ClientUserActor selects the controller child;
  a current-epoch server key lookup whose ServerUserActor selects the loaded
  server child; equal `key & 0xfffff` with client tag `0x10000000`; and
  unchanged drop counts. `keyIndexMatch` and the boundary remain diagnostic;
  both trusted flags stay zero.
- CHECKPOINT adds key lookup count, per-side key/epoch/user/selected child,
  `keyIndexMatch`, generation and load epoch.

Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Runtime key evidence is pending.

Reading the v0.38 trace: check `READY v0.38` with thirteen hooks and zero
drops. Check KEY_LINK records exist for both sides. They are absent if the
registry is not the ActorManager. Compare client vs server `key & 0xfffff`,
and whether user `+60` equals its own lookup key. A mismatch or absence is
evidence to inspect, not a reason to relax guards.

## v0.38 runtime result: shared user key links the sides

Session PID 30208, `research/traces/save-detection-v0.38-normal-load-f7.log`
(184 lines through the single F7; the game was still running when copied).
READY v0.38 with thirteen hooks, **zero drops throughout**.

- Disk load: scope2468, slot2, read/apply/outer success, `correlated=1`, and it
  stayed correlated at F7. Steam root ends `60062761`. One load, no cleanup,
  epoch/generation 2 throughout (load-start advanced it from 1).
- KEY_LINK (resolver call site only; three records):
  - server: key `0x90100000` -> ServerUserActor `0x273741a0000`, `+60` =
    `0x90100000`, selected child `0x273740f0200` = the loaded server child.
  - client: key `0x90100000` -> ClientUserActor `0x27305c82840`, `+60` =
    `0x90100000`, selected child `0x2731e01e880` = the controller's client child.
- **Both sides query their registry with the identical full key, and both user
  actors store that same key at `+60`.** This is a native relationship:
  controller client child <- client user (key K) = server user (key K) ->
  selected server child = the object the save wrapper loaded from slot2.
- CLIENT_BOUNDARY `matched=1` at seq11187: phase 23->24, `+c3=1`, client
  selection = controller child, all components at the current epoch, drops 0.
- Resolver `sourceKey` values: server child `0xa0100001`, another client child
  (`0x273051b8e80`, resolves to the player client child) `0xb0100002`.
  (ACTOR_LINK lines with `valid=0`/`sourceKeyRead=0` are field-begin events,
  which share that log format and carry no resolver data.)

Interpretation and corrections:

- Key layout is consistent with bit31 + a 2-bit category in bits 28-29 +
  bit20 + a 20-bit index: users `0x9.../index0`, server child `0xA.../1`,
  other client child `0xB.../2`. The earlier static reading of bits 28-29 as a
  client/server side tag was wrong: the same tag-1 key is accepted by both
  registries. Tag 1 is more likely the user-actor category (HYPOTHESIS).
- v0.38's `keyIndexMatch` compared `key & 0xfffff`, which is 0 for the user
  key. Equal zero indexes are weak evidence. The real evidence is full-key
  equality plus `+60` equal to the lookup key on both users. Tighten the check
  to that before any production use.
- `0x90100000` also appeared in v0.33 (`objectSlot=2416967680` on object
  `...1a0000`, a different process). The user key is a constant local-user
  identity, not a save or account identity. Account/slot ownership must still
  come from the correlated load chain and the storage root.

Not yet observed with v0.38: boundary clearing/re-forming across title,
Continue, death/retry or autosave load (the epoch invalidation is runtime
untested). Earlier versions' observations of those sequences remain valid for
the load/cleanup hooks themselves.

## v0.39 observation build: full-key match and diagnostic selection

- Key match: `keyIdentityMatch` requires the current-epoch client and server
  lookups to use the identical full key, with each exact-typed user actor's
  `+60` equal to that key. The masked 20-bit comparison is removed. KEY_LINK
  prints `keyMatch`.
- Worker-owned `Selection` {active, serial, generation, loadScope, slot,
  userKey, serverChild, clientChild, account, root}. It is an immutable
  snapshot. A future Bell reader would tag reads with `serial` and discard
  results whose serial is no longer active. Actor addresses are copies that
  are never dereferenced.
- Formation: the matched boundary holds in the current generation, the last
  storage init returned AL=1 with a copied root, and the root is exactly
  `<LOCALAPPDATA>\Pearl Abyss\CD\save\<digits>` (case-insensitive, `/`
  normalized, UTF-8 checked). The account folder must exist, and
  `slot<N>\save.save` must exist for the correlated load's slot. These are
  attribute queries only, never used to choose an account or slot. Failure
  logs `SELECTION withheld ... reason=` once per generation.
- Retirement: any generation change (load start, any context cleanup, queue
  drop), or a StorageEnd whose root differs or is unreadable. Later loading
  stages and phase<24 alone do not retire it (v0.36 retry evidence). Every
  formation gets a new serial, even for an identity equal to a retired one.
- CHECKPOINT adds `selectionActive/Serial/Generation/Scope/Slot/Account`;
  the popup shows the selection. Both trusted flags stay zero; nothing
  consumes the selection.

Known limits: one captured storage root per handler init; multiple-account
switching without a storage re-init is unobserved. A cleanup of an unrelated
context retires and re-forms the selection with a new serial (conservative).
Retirement/re-formation across title, Continue, retry and autosave load is
runtime-untested in v0.38/v0.39.

Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Package: `archive/releases/PywelAtlas-Save-Detection-Observation-v0.39.zip`.

## v0.39 runtime result: selection formed on a normal load

User-reported run: load a save normally, then F7. Trace:
`research/traces/save-detection-v0.39-normal-load-f7.log` (182 lines, pid
33488).

- Storage root `.../CD/save/60062761`. One load, scope 4028, requested slot 2,
  correlated. Zero drops for the whole session.
- Both KEY_LINK sides used key `0x90100000`, user `+60` was equal and both
  were in epoch 2. The server lookup (seq 5771) printed `keyMatch=0` because
  the client lookup had not happened yet. The client lookup (seq 8385)
  printed `keyMatch=1`.
- The controller reached phase 24 twice. The first time (seq 7453) came
  before any client key lookup, so `matched=0`. A field begin, client reset
  and a second phase run 1→24 followed. The second phase 24 (seq 12914)
  matched. The full-key rule correctly withheld the earlier boundary.
- `SELECTION formed serial=1 generation=2 loadScope=4028 slot=2
  account=60062761` with the server child equal to the loaded object and the
  client child equal to the controller child. No withheld or retired lines.
- The F7 CHECKPOINT agrees: `keyIdentityMatch=1 selectionActive=1
  selectionSerial=1 selectionSlot=2 selectionAccount=60062761`. Both trusted
  flags are 0.

Still runtime-untested: retirement and re-formation across title/Continue,
death/retry, autosave load and a second load in the same process.

## v0.39 runtime result: save switching

The same process (pid 33488) continued after the run above. Trace:
`research/traces/save-detection-v0.39-save-switching.log` (822 lines; the
first 182 are the normal-load run). User sequence: slot 2 loaded → in-game
load of slot 101/F7 → title/F7 → slot 100/F7 → in-game load of slot 101/F7 →
exit. Zero drops throughout.

| Step | Selection | Checkpoint |
| --- | --- | --- |
| slot 2 (earlier) | serial 1 formed, gen 2 | active, slot 2 |
| teardown | serial 1 retired at gen 4 | — |
| in-game load slot 101 | serial 2 formed, gen 7 | active, slot 101 |
| quit to title | serial 2 retired; **serial 3 formed** (gen 8); serial 3 retired at gen 9 | inactive |
| slot 100 | serial 4 formed, gen 12 | active, slot 100 |
| in-game load slot 101 | serial 4 retired; serial 5 formed, gen 17 | active, slot 101 |
| exit | serial 5 retired | — |

- Every load got a new serial with the correct slot, and the title screen
  had no active selection.
- **Bug: stale re-formation.** At the title teardown, the cleanup of an
  unrelated server object (seq 167155) raised the generation to 8.
  UpdateSelection retired serial 2, then immediately formed serial 3 from the
  cached `clientBoundaryCandidate` flag. That flag is recomputed only on key
  lookups and controller snapshots, so it still held the generation-7
  result. The next controller snapshot (seq 167156) recomputed it as
  `matched=0`, and serial 3 retired at the next cleanup. Serial 3 was live for
  about 30 ms without fresh evidence. Fix: recompute the boundary whenever the
  generation advances, before UpdateSelection runs.
- **The user key is not constant.** After the title return, new user actors
  used key `0x90100865` (previously `0x90100000`). The key is stable within one
  world session and changes when the game rebuilds its user actors. Both sides
  still matched, so the full-key rule held.
- The title-screen checkpoint showed `lastRequestedSlot=2` with no load. The
  title screen apparently reads a save without loading it (hypothesis). No
  selection formed.

## v0.40 observation build: boundary rechecked on generation change

- One change. When Correlate adopts a newer epoch, it now calls
  `RefreshBoundary` immediately. Every boundary component must carry the
  current epoch, so the cached `keyIdentityMatch`/`clientBoundaryCandidate`
  from the old generation become false before UpdateSelection runs. A new
  selection can form only after fresh key lookups and a phase-24 controller
  snapshot in the new generation. (The queue-drop path already cleared the
  candidate.)
- Version strings and README updated; comment on the user key corrected.
- Requested run: load, F7; title, F7; a different save, F7; exit. Expected:
  each retirement is followed by a formation only after a new
  `CLIENT_BOUNDARY ... matched=1`.

Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Package: `archive/releases/PywelAtlas-Save-Detection-Observation-v0.40.zip`.

## v0.40 runtime result: no stale re-formation

Trace: `research/traces/save-detection-v0.40-save-switching.log` (new process,
pid 31396). User sequence: slot 101/F7 → title/F7 → slot 100/F7 → exit. Zero
drops throughout.

- Slot 101: serial 1 formed (gen 2) after `matched=1`; checkpoint active,
  slot 101.
- Title teardown: four cleanups. Serial 1 retired at gen 4, and nothing formed
  afterwards. The title checkpoint shows `selectionActive=0
  keyIdentityMatch=0 clientBoundary=0`. In v0.39 this same teardown
  re-formed a selection.
- Slot 100: serial 2 formed (gen 7) only after a fresh `matched=1`, with new
  key `0x90100338`. Checkpoint active, slot 100.
- Exit teardown: serial 2 retired at gen 9; nothing formed afterwards.
- Every formation followed a new-generation boundary match; every retirement
  stayed retired until the next one.

The v0.39 stale case depended on timing, so seeing no stale case in one run
supports the fix but doesn't prove it on its own. The guarantee comes from the
code: every boundary component must carry the current epoch, and the boundary
is now recomputed as soon as the epoch advances.

The user key was `0x90100000` for the first world in both processes and
changed (`0x90100865`, `0x90100338`) for later worlds. That fits a per-world
counter-like identity (hypothesis).

Still runtime-untested for the selection: death/retry and autosave loads.

## v0.40 runtime result: death/retry and in-game autosave load

Trace: `research/traces/save-detection-v0.40-death-retry-autosave.log` (pid
37920). User sequence: load/F7 → death screen/F7 → retry/F7 → in-game load
of an autosave/F7 → exit. Zero drops throughout.

| Step | Native events | Selection | Checkpoint |
| --- | --- | --- | --- |
| load | load slot 2, field begins, `matched=1` | serial 1 formed, gen 2 | active, serial 1, slot 2 |
| death screen | none (phase still 24) | serial 1 kept | active, serial 1 |
| retry | field-begin pair, `matched=1` again, no load/cleanup | serial 1 kept | active, serial 1, gen 2 |
| autosave load | 4 cleanups, load slot 2, `matched=1` | serial 1 retired (gen 4); serial 2 formed, gen 7 | active, serial 2, slot 2 |
| exit | cleanups | serial 2 retired | — |

- Death/retry keeps the selection, as designed. The world and save identity
  are reused without a disk load (matching v0.36).
- The in-game autosave load retired the old selection and formed a new
  serial only after a fresh match.
- The autosave load requested slot 2, the same slot as the first load, so
  slot 2 is likely an autosave slot (hypothesis; v0.35 Continue loaded
  slot 1). The new serial still tells a future reader that a new load
  happened, even though the slot number is the same.
- The user key stayed `0x90100000` across the in-game reload (both sides).
  After the title return in the earlier run it changed, so the world rebuild
  at the title is what changes it.

Implication for the Bell reader: the selection names a slot, not a file
version. The game can rewrite `slot<N>\save.save` (autosave) while a
selection is active. A reader must copy the file to a stable snapshot, tag
results with the selection serial, and treat a newer file as a re-read of
the same selection, not a new one.

Selection lifecycle now observed across: normal load, in-game load of a
different slot, title return, load after title, death screen, retry, and
in-game autosave load. The activation/invalidation and account/slot ownership
step is complete for diagnostic purposes.

## v0.41 observation build: diagnostic Bell read tied to the selection

- Reader: `src/marker-bell/NativeSaveReader.cpp` gains `ReadBellSaveAt`
  (exact validated account folder + slot; never searches for an account;
  writes no files; returns the decoded bytes' modified time). The stable
  double read is factored into `ReadStable`, which `ReadSelectedBellSave` also
  uses (marker-bell behaviour unchanged; it still builds without warnings).
  The save-detection build compiles this file directly and ships the
  pycrimson license.
- Thread: a below-normal-priority reader thread holds one pending request and
  one result under an SRW lock, woken by an auto-reset event. The worker never
  blocks on it and keeps draining hook records.
- Tagging: requests copy {serial, slot, account, folder}. The worker accepts a
  result only if `selection.active && selection.serial == result.serial`.
  Otherwise it logs `outcome=stale` and discards the result. The accepted
  result is dropped from the summary as soon as its selection is no longer
  active.
- Triggers: a new selection serial (`selection-formed`), F7 (`f7`), and a
  slot-file last-write-time change seen by an attribute poll about every 3 s
  (`file-changed`). A failed read is retried up to 3 times through the poll
  (`retry`). The file time only triggers a read; it is never evidence of
  progress.
- Output: `BELL_REQUEST` and `BELL_READ` (outcome, coverage, recorded,
  completed, hernandCompleted, saveModified, error, activeSerial,
  `bellTrusted=0`). CHECKPOINT gains bell fields, and the popup shows the
  latest accepted result.
- Limitation: a Bell completed in game appears only after the game writes the
  slot file.

Compiled with MSVC `/W4` without warnings (both builds). No automated tests
added or run. Package:
`archive/releases/PywelAtlas-Save-Detection-Observation-v0.41.zip`.

## v0.41 runtime result: Bell read works; game saves go to another slot

Trace: `research/traces/save-detection-v0.41-bell-read.log` (pid 25276).
User sequence: load/F7 → make the game save/F7 → in-game load of another
save/F7 → exit. Zero drops. The user reported that the popup showed Hernand
Bell completed for both saves.

- Slot 2 (selection 1): `selection-formed` and both F7 reads were accepted,
  with coverage 8, recorded 1, completed 1, `hernandCompleted=1`, and save
  time 2026-10-21 19:26:45.
- Slot 100 (selection 2): `selection-formed` and F7 reads were accepted with
  the same counts, and save time 2026-09-02 19:25:43.
- No stale or failed reads. Each accepted result named the active serial;
  the slot 2 result stopped counting when selection 1 retired.
- **The game's save during step 3 went to `slot0`, not `slot2`.** A read-only
  attribute listing after the run showed slot0 modified at 21:58:01, while
  slot2 kept 19:26:45. So the file watch never fired: the loaded slot was not
  rewritten. A save made while playing a loaded slot can go to a different
  (autosave) slot (captured; why slot0 was chosen is unknown).

Implication: the selected loaded slot holds the progress as of load time, not
the session's latest save. To follow progress after an in-game save, the
probe needs native evidence of which slot the game writes for this world
(a save-write hook tied to the current generation). Picking the newest file
is not allowed (file recency is not evidence).

## Save-write static research (for v0.42)

New read-only scripts: `research/scripts/find_save_write_strings.py`,
`find_slot_path_strings.py`, `find_file_api_callers.py` and
`read_string_at.py`. Disassembly is in `research/disasm/save-load-186e450.asm`,
`-1871930`, `-2358750`, `-103be8e0` and `-cbd84d0`.

| Site | Evidence (static) |
| --- | --- |
| `0x57db790` | UTF-8 Korean "single-play game data save failed. ActorKey:%#, SlotNo:%#" |
| `0x186e450` | Sole owner of that string (two references). Its prologue spills RCX/RDX/R8D/R9 like load `0x186f570`. Signature: manager RCX, result storage RDX, slot R8D, save object R9, plus a fifth stack argument (both callers pass it at `[rsp+0x20]`). Formats a name from the slot and calls lower write routine `0x2069640` (the read routine is `0x20688a0`) twice: first for the object at `[R9+0xa0]`, then for R9. A non-zero DWORD result is stored in result storage and logged with ActorKey = `[object+0x60]` and SlotNo. Slot 3 takes an extra branch (`0x2355ec0`). |
| `0x186e450` guard | `4c 89 4c 24 20 44 89 44 24 18 48 89 54 24 10 48 89 4c 24 08 55 53 56 57` |
| Callers | `0x103be99a` in `0x103be8e0` (R8D = r13d, R9 = r15) and `0xcbd86ce` in `0xcbd84d0` (R8D = `[rdi+4]`, R9 = r13). Which one is autosave and which is manual is unknown. |
| `0x2358750` | Storage-layer file writer near Steam storage init `0x235ab00`. It builds a path, serializes, writes, `FlushFileBuffers`, closes. It is generic and has no slot argument. |
| `0x1871930` | "gamePlaySaveData[%#] commit"; an in-memory commit, not the slot write. |

Hypothesis: `0x186e450` is "save game data to slot", the counterpart of
`0x186f570`. The `+0x60` ActorKey matches the v0.38 finding that actors store
their key at `+60`. Whether R9 is the server child (the same object the load
hooks report) is unproven; v0.42 compares the copied address and vtable.

## v0.42 observation build: save-write hook retargets Bell reads

- Fourteenth guarded hook: `0x186e450` (profile regenerated by
  `prepare_save_load_profile.py`). Five arguments are forwarded, including
  the stack argument, and the result pointer and LastError are preserved.
  WriteStart/WriteEnd records carry slot, object, vtable, status and, for the
  exact server child type, its `+60` key. Writes do not advance the epoch.
- `LinkSaveWrite` (worker) links a WriteEnd only if a selection is active,
  status is 0, the slot is supported, the vtable is `0x5b1e2b0` and the
  object equals `selection.serverChild`, and the event epoch equals the
  selection generation. Otherwise it logs a reason (`no-selection`,
  `write-failed`, `unsupported-slot`, `different-object`,
  `different-generation`).
- `Selection.readSlot` starts at the loaded slot and follows linked writes.
  Bell requests use it, the file watch follows it, and a result for another
  slot is `superseded`. The popup and CHECKPOINT show the loaded slot,
  `readSlot`, linked writes, all writes and the last write slot.
- Known limit: if the file is finished after `0x186e450` returns, the
  immediate `save-write` read may see the old file; the 3 s watch re-reads.

Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Package: `archive/releases/PywelAtlas-Save-Detection-Observation-v0.42.zip`.

## v0.42 runtime result: the save hook is the slot writer

Trace: `research/traces/save-detection-v0.42-save-write.log` (pid 14680).
User sequence: load/F7 → autosave/F7 → manual save to "Manual 3"/F7 → exit.
Zero drops. A read-only attribute listing taken afterwards is used for
comparison only.

| Step | SAVE_WRITE (all linked, status 0, same server child, key `0xa0100001`, epoch 2) | Bell read |
| --- | --- | --- |
| load slot 0 | — | slot 0 accepted (Hernand completed) |
| autosave | slot 1 from caller `0xcbd86d3`, then slot 206 from caller `0x103be99f`, 47 ms apart | slot 1 request replaced by slot 206; slot 206 failed twice ("Cannot open"), no slot206 folder exists |
| manual save "Manual 3" | slot 102 from caller `0x103be99f` | slot 102 accepted (save time 22:21:20, Hernand completed) |
| exit | — | selection retired |

The file listing agrees: slot1 was modified at 22:20:40 (the autosave) and
slot102 at 22:21:20 (the manual save). No slot206 file exists.

Confirmed at runtime:
- `0x186e450` is called for every save. Its R8D is the slot written, and R9 is
  the same server child that the load produced, so the link to the selection
  works.
- "Manual N" = slot 99+N (Manual 3 → slot 102), as the existing chooser
  labels assume.
- Caller `0xcbd84d0` wrote the autosave slot. Caller `0x103be8e0` wrote both
  slot 206 and the manual slot.

Problem: an autosave also writes slot 206 (range 200–207), which has no file
in the account folder. Possibly an in-memory or "instance" slot (the
executable has `_useInstanceSaveSlot`; hypothesis). Linking it moved the
reader off the real autosave file. Fix for v0.43: link only writes to file
slots 0–3 and 100–108, and log 200–207 writes with reason `instance-slot`.

## v0.43 observation build: 200-range writes ignored

One rule change in `LinkSaveWrite`: a supported slot of 200 or above is not
linked (`reason=instance-slot`). Everything else is unchanged from v0.42.
Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Package: `archive/releases/PywelAtlas-Save-Detection-Observation-v0.43.zip`.

## v0.43 runtime result: Bell reads follow every real save

Trace: `research/traces/save-detection-v0.43-save-write.log` (pid 21968).
User sequence: load/F7 → autosave/F7 → manual save to "Manual 3"/F7 → exit.
Zero drops; no stale, superseded or failed reads.

| Step | SAVE_WRITE | Bell read |
| --- | --- | --- |
| load slot 101 (Manual 2) | — | slot 101 accepted |
| autosave | slot 2 linked (caller `0xcbd86d3`); slot 206 `instance-slot`, not linked | slot 2 accepted (save time 22:26:41) |
| further autosaves | slot 2 linked twice (22:27:08) | slot 2 accepted |
| manual save "Manual 3" | slot 102 linked (caller `0x103be99f`) | slot 102 accepted (22:27:39) |
| autosave 7 s later | slot 2 linked | slot 2 accepted (22:27:46) |
| exit | — | selection retired |

- The file listing agrees with every linked write (slot2 22:27:46, slot102
  22:27:39). Only slot 206 lacked a file, as in v0.42.
- Autosave slots rotated across runs (slot 0 at 21:58, slot 1 at 22:20, slot
  2 at 22:26–22:27). The reader followed the game's own slot number each
  time, without guessing.
- The reader always follows the latest successful write by the loaded world.
  After the manual save, a follow-up autosave moved it back to slot 2; both
  files hold that world's progress.
- Hernand stayed completed throughout; no Bell state changed during the
  run, so a change in Bell completion has not been observed end to end yet.

The selection plus save-write following now covers load, title return, retry,
in-game loads, autosave and manual save. This completes the "which save, and
where is its progress" question for diagnostics.

## v0.43 end-to-end result: a newly completed Bell is detected

Trace: `research/traces/save-detection-v0.43-calphade-end-to-end.log` (pid
21632). User-reported sequence: load Manual 2 (slot 101)/F7 → travel to
Calphade and ring its Bell → autosave → manual save to "Manual 4"/F7 → exit.
Zero drops; no stale or failed reads.

- Before: slot 101 read with recorded 1 / completed 1 (Hernand only).
- The autosave wrote slot 0 (linked); slot 206 was `instance-slot`. The
  slot 0 read gave **recorded 2 / completed 2** (save time 23:39:31), and
  two more autosaves to slot 0 read the same.
- The manual save wrote slot 103 ("Manual 4" = 99+4, linked). Its read gave
  recorded 2 / completed 2 (23:40:20). The F7 popup showed 2 completed from
  slot 103.
- This is the first end-to-end confirmation: the user completed the Calphade
  Bell in game, the game saved, and the reader saw the count rise only
  through the save file the game wrote.

Issue found: during travel, the selection retired and re-formed twice
(serials 2 and 3) without any load. Each time an unrelated context was
cleaned up (other server children `...0300` and `...0400`, client actor key
`0xb0100003`). Fresh key lookups and a phase-24 snapshot then re-matched the
same load scope 2778 and the same server child. This is correct by design,
but a re-formed selection restarts `readSlot` at the loaded slot (101). If
the game had already saved to slot 0, the reader would fall back to the
older slot 101 and show stale progress. In this run the autosave came after
serial 3, so it did not show. Fix for v0.44: when a selection re-forms with
the same load scope and server child as the one just retired (same world, no
new load), carry over its `readSlot` and linked-write count.

## v0.44 observation build: last saved slot survives same-world re-formation

- `UpdateSelection` keeps a copy of the retired record. If the new selection
  has the same load scope, server child and storage root
  (`sameWorld=1`, no load in between), `readSlot` and `linkedWrites` are
  carried over. The SELECTION formed line now prints `readSlot` and
  `sameWorld`.
- `LinkSaveWrite`: a successful file-slot write by the retired record's
  server child while no selection is active is stored on the retired record
  (`reason=linked-to-retired`). It takes effect only if the next selection
  is the same world. SAVE_WRITE now prints `selectionActive`.
- Unchanged: a new load (new scope), title return or different root starts
  from the loaded slot.

Compiled with MSVC `/W4` without warnings. No automated tests added or run.
Package: `archive/releases/PywelAtlas-Save-Detection-Observation-v0.44.zip`.

## v0.44 runtime result: carry-over path not triggered

Trace: `research/traces/save-detection-v0.44-same-world.log` (pid 35152).
User-reported: loaded and saved to "Manual 1". The log shows the load
requested slot 103 (the "Manual 4" save made in the Calphade run) and the
manual save wrote slot 100 ("Manual 1").

- Serial 1 formed on slot 103 (completed 2). The write to slot 100 was linked
  and the reader moved to slot 100 (completed 2). Two F7 reads accepted.
  Zero drops; no stale or failed reads.
- No re-formation happened before exit (one retirement only), so
  `sameWorld=1` and `linked-to-retired` were not exercised. The carry-over is
  still runtime-untested. It appears in a later log only when travel cleanups
  occur; check SELECTION formed lines for `sameWorld=1`.

## Combined mod v0.50 (phase 1): one ASI, no behaviour change

Integration plan (user-approved): phase 1 combines both parts into one ASI
with no behaviour change. Phase 2 makes the marker use save detection (F9
removed; the marker JSON names its Bell; fail closed when the selection or
read is not accepted; acting on detection needs the user's OK). Phase 3
tests with slot 101 (before Calphade) and slot 103 (after Calphade).

Phase 1 build:
- `src/pywel-atlas/PywelAtlas.cpp` owns DllMain. A startup thread calls
  `MH_Initialize` once, then starts `PywelSaveDetectionRun` and
  `PywelMapMarkerRun`.
- Both part files compile unchanged unless `PYWEL_ATLAS_COMBINED` is defined.
  With it, they skip their own `MH_Initialize` and DllMain, create and enable
  only their own hooks (per target, never `MH_ALL_HOOKS`), and on failure
  remove only their own hooks instead of `MH_Uninitialize`.
- Key split: plain F7 = save-detection checkpoint; Shift+F7 = the marker's
  former F7 (read the hand-picked slot). F6/F8/F9/F10 are unchanged.
- No hooked RVAs overlap (14 save-detection + 9 marker hooks; the marker
  also guards 3 call targets and 1 parent site). The two vendored MinHook
  copies are byte-identical; the build compiles one.
- `src/pywel-atlas/build.ps1` runs the marker's two build-time Python
  generators, compiles both parts plus `NativeMarkerDefinition.cpp` and
  `NativeSaveReader.cpp`, and outputs `dist/pywel-atlas/PywelAtlas.asi` with
  the MinHook and pycrimson licenses and README.

Compiled with MSVC `/W4` without warnings. The standalone save-detection and
marker builds also still compile without warnings, and the regenerated
marker headers are unchanged. No automated tests added or run. Package:
`archive/releases/PywelAtlas-v0.50.zip`.

## Combined v0.50 runtime result: both parts work in one ASI

Traces: `research/traces/pywel-atlas-v0.50-save-detection.log` (pid 24572)
and `research/traces/pywel-atlas-v0.50-map-marker.log`. User sequence: load →
F7 → F9 (picked slot 1) → Shift+F7 → F6 → map → F10 → exit.

- Save detection: READY v0.44 with 14 hooks; slot 2 loaded, selection formed,
  Bell read accepted (Hernand completed), and one F7 checkpoint. Zero drops.
- Map marker: all 9 hooks `MH_OK`, and live map-icon samples were logged.
  F9 stored slot 1. Shift+F7 read slot 1 (Hernand completed, so proof
  creation was blocked). F6 re-read and stayed blocked. F10 found no owned
  marker. One popup per key; plain F7 and Shift+F7 did not cross-trigger.
- No chest appeared, which is correct: both the hand-picked slot 1 and the
  detected slot 2 have Hernand completed.
- The user hand-picked slot 1 while slot 2 was loaded. This is the manual
  mismatch that phase 2 removes.

## Combined v0.51 (phase 2): the marker follows the detected save

User-approved: detection now drives marker visibility in the combined build.
The standalone builds are unchanged in behaviour.

- Reader: `NativeSaveSummary` gains `recordedMask`/`completedMask` (one bit
  per `kBellLinks` entry), plus `FindBellIndex(id)` and `BellName(index)`.
- Shared result: `src/pywel-atlas/LoadedSave.h` (`LoadedSaveBell`). The
  save-detection worker publishes it every loop under an SRW lock.
  `valid` = bellValid && selection active && bellSerial == serial &&
  bellSlot == readSlot. It also carries serial, loadScope, loadedSlot,
  readSlot and the summary. `PywelGetLoadedSaveBell` copies it.
- Marker JSON: `completion` may be `{"source":"bell","id":"mg:..."}`. The id
  must be ASCII and a Bell known to the reader. `none` keeps the Hernand link.
- Marker (combined only): F9, Shift+F7 and the 5 s manual refresh are off.
  `FollowLoadedSave` runs every loop. On a valid result it decides for the
  linked Bell: completed → scoped removal (blocked from recreation until a
  new decision); a new load scope → removal of the previous save's chest.
  Invalid results are ignored, so the last decision is kept. F6
  (`ShowMarkerFromDetectedSave`) loads the JSON (which may change the linked
  Bell), is withheld while nothing valid is published, removes instead of
  showing when completed, and otherwise requests creation and logs the slot
  and serial.
- The ASI shrank from 386,048 to 293,376 bytes because the linker drops the
  now-unused manual read and report code (strings for the slot chooser and
  `native-save-progress.json` are absent).

Compiled with MSVC `/W4` without warnings, and both standalone builds too. No
automated tests added or run. Package: `archive/releases/PywelAtlas-v0.51.zip`.
Test plan: link the runtime JSON to Calphade; Manual 2 (slot 101,
pre-Calphade) → F6 shows; load Manual 4 (slot 103) → chest removed and F6
withheld; Manual 2 → ring Calphade → after the save the chest is removed.

## Combined v0.51 runtime result: detection drives the marker end to end

With the user's approval, the user's runtime `native-map-marker.json` was
changed to `completion: {source: bell, id: mg:545680}`. The backup is
`native-map-marker.backup-before-v0.51.json` beside it. Traces:
`research/traces/pywel-atlas-v0.51-map-marker.log` and
`pywel-atlas-v0.51-save-detection.log`. The user reported it worked as
expected. Zero drops.

| Step | Detected save | Marker |
| --- | --- | --- |
| load Manual 2 (slot 101) | serial 1, Calphade completed=0 | F6 → "Calphade Bell not completed in loaded save slot 101"; chest created and read back |
| in-game load Manual 4 (slot 103) | serial 2, newLoad=1, completed=1 | removal requested (chest already absent); F6 → "withheld: Calphade Bell is explicitly completed (slot 103)" |
| in-game load Manual 2 | serial 3, newLoad=1, completed=0 | previous save's chest removed; F6 → chest created |
| travel | serials 4 and 5 re-formed with `sameWorld=1` (same scope 31109) | no change (readSlot 101 carried) |
| ring Calphade, autosave | write slot 1 linked; slot 206 ignored; read slot 1 completed=2 | "Calphade Bell is explicitly completed in the loaded save"; native removal confirmed absence |

- First runtime sight of `sameWorld=1`. The carried `readSlot` equalled the
  loaded slot here, because no save had happened yet.
- Quirk 1: at start, the linked Bell defaults to Hernand until F6 loads the
  JSON. That first decision ("Hernand completed") requested a removal with
  no chest owned, so the next F6 was skipped ("removal pending") until the
  map callback cleared it. The same happens after a new-load removal. The
  user had to press F6 twice.
- Quirk 2: the inherited v0.32 rule "game focus lost → generation off and
  removal" removed the chest when the game lost focus (twice in this run).
  That rule belongs to the 3-minute proof, not to a product marker.

## Combined v0.52: one marker per Bell, desired-state service

User choice: bundle the two quirk fixes with eight Bell markers.

- `prepare_bell_links.py` adds each Bell's `gamePosition` (from
  `data/bell-save-links.json`) to `BellLink.position` in
  `bell-proof-links.h`.
- Marker i uses private key `0x5059415400000100 + i` (kind 0x15, chest type
  226) at that Bell's exact position. `IsBellMarker` checks type, key, kind
  and position. `IsOwnMarkerKey` lets `RouteWorldContainer` route the parent
  for any own key; `IsPrivateChest` (diagnostic hooks) accepts Bell markers.
- Worker (`UpdateBellMarkers`): wanted = all Bells not in `completedMask` of a
  valid result (0 when disabled). On an invalid result, wanted is unchanged
  and creation is not allowed. It logs the shown/hidden sets and changes in
  the present set.
- Map thread (`ServiceBellMarkers`, from `ObserveWorldMapUpdate` instead of
  ServiceRemoval/ServiceCreation): for each Bell, look up its key. If absent
  → clear present, and create if wanted and allowed (at most one per update,
  verified by readback and routing). If present and created this session but
  unwanted → one native removal (needs `ChestDefinitionReady`), then fresh
  lookup. If still present after 3 s → reported as stuck, never re-issued.
  Icons not created and verified this session are never touched.
- Quirk fixes: no pending-removal flag can block creation, because removal
  with nothing present is a no-op. The 3-minute and focus-loss rules are
  compiled out of the combined build. F10 = all off, F6 = on again. The
  single JSON proof chest is not used in the combined build.

Compiled with MSVC `/W4` without warnings, and both standalone builds too. No
automated tests added or run. Package: `archive/releases/PywelAtlas-v0.52.zip`.
The user confirmed at runtime that it works. Remaining problem: markers are
hard to see depending on the main-map zoom.

## Next-phase static research (2026-10-22, three parallel read-only studies)

All static; nothing is runtime-confirmed. Full reports:

- `research/analysis/map-zoom-visibility.md`. Each icon's UI template sets
  zoom windows (`changePoint` etc., stored at icon +0x1f8/+0x20c/+0x220 with
  an enabled byte at +0x10). The projection (`d94040` → `dabae0`) hides the
  icon outside [p0,p3]. Options: (1) use an icon type whose template has no
  window; (2) clear the enabled bytes on our own verified icons only, which
  writes game memory and needs user approval; (3) clamp the scale for our
  icons. A logging build should confirm the window values and zoomT first.
- `research/analysis/player-position.md`. Recommended source: the minimap
  controller's own update `0xe13cf0` (vtable 0x5674e00, slot 0x118) writes
  the player's world xyz to controller +0x330 every update. A new guarded
  hook reads 12 bytes after the original returns. The world-map projection's
  5th argument also carries the player xyz, but only while the map is open.
  The ActorFocus icon (type 0, key changes per world session) is a
  cross-check only. Reading the actor transform directly is not recommended
  (lock plus parent-relative). Units are metres. Minimap markers use the same
  creator through the minimap controller, need minimap removal `0xe09fc0`
  (new guard), and may be created lazily.
- `research/analysis/collectible-categories.md`. `poi-data.js` has 11,342
  POIs in 117 categories; only the 8 Bells have scene UUIDs. The Bell record
  type covers discoverable landmarks. Shortlist: Abyss Nexus, small landmark
  sets (Shrine/Spire/Sanctum/Constellation/Witch Hideout), Cresset, Treasure
  Chest (save location unknown; needs a before/after save diff). The blocker
  is an asset reader (pycrimson) to build POI → UUID tables. Filter UI: in-game
  Dear ImGui panel (see CLAUDE.md).

User decision: keep the game's own matching icons (Bells use Bell icons and
so on); fix zoom visibility on our markers rather than switching icon types.

## Combined v0.53: zoom and player-position observation (logging only)

The marker behaviour is identical to v0.52. Added in the marker part
(combined build only), as log lines in `native-map-categories.log`:

- `zoom-type`: once per icon type, after `ObserveInitialize` returns. It logs
  type, category, template, the three zoom windows (icon +0x1f8/+0x20c/
  +0x220: four floats plus enabled and fade bytes), icon +0x2b0..+0x2bf, and
  record +0x60/+0x61, the size curve +0x8c..+0xa4, +0xa8, +0xb0, +0xb1,
  +0xb4..+0xb6 and +0xbc.
- `zoom-frame` / `zoom-marker`: during F8, every 250 ms from
  `ObserveWorldProjection`. It logs controller +0xaa0/+0xabc/+0xa9c/+0xae4/
  +0xbf8/+0xace, globals 0x6cab9e8/0x6caba88, the computed zoomT, and per
  present Bell marker icon +0x2b9, +0x1eb and (icon+8)+0xb4 (bit 8 = hidden).
- `position`: a new guarded watch hook on the minimap update `0xe13cf0`
  copies minimap controller +0x330 xyz and +0x569 after the original returns.
  `ObserveWorldProjection` copies its 5th/6th arguments (player xyz and
  heading). The worker logs every 2 s while moving (every 10 s when still)
  and at F8, with the nearest Bell's X/Z distance. It also logs the runtime
  settings 0x6cad108/0x6cad158/0x6cae808/0x6cde048 once. If the minimap
  guard fails, only position logging is skipped.

Compiled with MSVC `/W4` without warnings (combined and standalone marker).
No automated tests added or run. Package:
`archive/releases/PywelAtlas-v0.53.zip`.

### v0.53 runtime result (traces `research/traces/pywel-atlas-v0.53-*.log`)

User report: at the Demeniss Bell Tower the marker was visible fully zoomed
in, gone at middle zoom (a notch or two out from full zoom it was faint),
and gone fully zoomed out.

- Zoom windows (`zoom-type`, 24 types logged):
  - 226 `MapIcon_Gimmick_LevelTreasureBox` (our markers): `[0.88 0.93 1 1]`,
    enabled, fade on. Visible only when zoomT >= 0.88, fading over
    0.88..0.93.
  - 360 `MapIcon_Gimmick_Bell_01` (the game's Bell icon) and 336 Campfire:
    the same `[0.88 0.93 1 1]`. Native Bell icons vanish at the same zooms.
  - 234 `MapIcon_Abyss_Ruins`: `[0.25 0.3 0.9 1]` (hidden only near full
    zoom-out).
  - 1 `MapIcon_Pin_Marker`: window disabled (visible at every zoom).
  - Image and text sub-windows were disabled for all of these.
- zoomT (`zoom-frame`): camera distance 0.2..9.5 maps to zoomT 1..0.
  Full in = 1, the middle sample = 0.74, full out = 0. The Demeniss marker's
  window result (icon +0x2b9) was 1 at zoomT 1 and 0 at 0.74 and below,
  matching the user's view exactly. The element hidden bit stayed 0 (the
  controller's first-update flag +0xace read 1 throughout), so +0x2b9 is the
  reliable visibility signal, not bit 8.
- Size curve: type 226 has rec+0x60 = 1, max 1.0, min 0.7. Size is not the
  problem; the window is.
- Position: the minimap hook (`0xe13cf0`, MH_OK) updated every frame on the
  game thread. Walking and riding moved the position smoothly (metres; the
  Hernand Bell distance went 78 → 5.6 → 107 m). The map-view copy only
  changes while the map is open, so the minimap is the radius-filter source.

Conclusion: static research section 1 is confirmed. The fix that keeps the
native icon is turning off the zoom window on our own icons only (research
`map-zoom-visibility.md` option 2). It writes three bytes in each of our own
icon objects, so it needs the user's approval.

## Combined v0.54: native Bell icon, no zoom limit on our markers

User-approved (2026-10-22): switch the markers to the native Bell icon and
turn off the zoom window on our own markers only.

- Bell markers use type 360 (`MapIcon_Gimmick_Bell_01`). Before creating or
  removing one, `MarkerDefinitionReady(360)` requires template type 29084,
  that template name and category 0xffffffff (the same exact checks the
  chest had, now in `IconDefinitionReady`). `ResolveIndependentParent` and
  `ResolvePresentation` use type 360's own record; container selection still
  copies the pin's traced configuration (type 360's own selector is also 1).
  Keys, kind 0x15, positions, the private-key routing and the removal rules
  are unchanged. `OwnMarkerType` keeps the proof chest on 226.
- `DisableZoomWindows(icon)` writes 0 over each zoom-window enabled byte
  (icon +0x208, +0x21c, +0x230) that reads exactly 1, using
  WriteProcessMemory on our own process. It runs on the map thread only,
  right after a creation passes the exact readback (`IsBellMarker` plus the
  container routing), and again on every update for a present, verified,
  wanted marker, in case the game re-initialises it. Counts are logged as
  `zoomLimitOff` / `zoomLimitRefused`.
- Static check of the one type 360 difference: record +0xb0 = 1 (type 226
  has 0). In `d94040` (`d94262`) and `dabd10` (`dada5a`) that byte makes the
  game look up the actor whose id is at icon +0x1c0 (`64f570`) and move the
  icon to it. +0x1c0 is set to 0 in icon set-up (`dec9e5`) and only set by
  the actor listener (`decc49`), which our icons never use; d8a970 treats 0
  as "no actor". So our markers should stay at their Bell position. Static
  only: F8 `zoom-marker` lines now log `actorId` and `zoomLimitEnabled`, and
  `IsBellMarker` would stop recognising a marker whose position changed.
- Type 360 has rec+0x60 = 0, so its size is a constant 1.0 at every zoom.
- The v0.53 observation logging is kept.

Compiled with MSVC `/W4` without warnings (combined and standalone marker;
the standalone build needed a `(void)key` for the new helper). No automated
tests added or run. Package: `archive/releases/PywelAtlas-v0.54.zip`.

### v0.54 runtime result (traces `research/traces/pywel-atlas-v0.54-*.log`)

User-confirmed: every not-completed Bell shows the native Bell icon at every
zoom level. Where the game already marks a Bell (completed ones), only the
game's own icon is shown, and it still hides when zoomed out as normal.

- Save serial 1, slot 103: Calphade and Hernand completed (hidden), the
  other six shown. 6 creations, 0 failures, `zoomLimitOff=6`,
  `zoomLimitRefused=0`, no removals or stuck markers.
- F8 samples covered zoomT 1, 0.98–0.93 (the old fade band), 0.69–0.54 and 0.
  Every sample showed `zoomLimitEnabled=0` and `actorId=0` for all six
  markers. On-screen markers kept window result 1 at every zoom, so the
  game no longer hid them.
- The actor-follow risk did not occur: the ids stayed 0 and `IsBellMarker`
  (exact position) recognised every marker each update.

Zoom visibility on our own markers is solved with the native icon. Next
per CLAUDE.md: the Dear ImGui filter panel on its own, then a second
category and the radius filter (minimap position source).

## Second category: Greymane Shrines (plan, user-chosen 2026-10-22)

Proof of concept for the category filter. 12 shrines (MapGenie category
`mg-category:15097`, e.g. Nas River Shrine `mg:544080` in Hernand). The
radius filter is dropped (see CLAUDE.md).

Known already:

- Native icon: type 186 `MapIcon_Gimmick_GreyManeTemple`, template type
  28812, category 0xffffffff (older catalogue traces). Its zoom window is not
  logged yet; v0.54's `DisableZoomWindows` works on any of our own icons.
- 12 markers fit the current 31-bit masks, so no capacity rework is needed.
- Not known: whether shrines are saved in the Bell family
  (`DiscoveredLevelGimmickSceneObjectSaveData`), which info key they use, and
  what marks one "done". The early saves have no shrine record.

### Research step (static, no game run)

1. Asset reader: pycrimson (LukeFZ, MIT) is not installed and not in the
   repository. Download it into an ignored research-only folder (needs the
   user's OK, as a download). Never part of the mod.
2. Find the shrines in the game data: `levelgimmicksceneobjectinfo`
   entries and the `GreyManeTemple` levels/prefabs, with each scene-object
   UUID, info key and world position (the Bell table came from Bell
   mission `.palevel` assets the same way).
3. Match each to its MapGenie POI by position (the fitted map-grid formula
   in `research/analysis/collectible-categories.md`, under ~35 m), one to
   one. Unmatched or ambiguous ones are left out.
4. Write `data/greymane-shrine-links.json` in the Bell file's shape (poiId,
   name, uuid, typeKeys, gamePosition, asset, evidence). It stays
   unverified until the save experiment confirms the UUID and key.

### In-game save experiment (user, one session)

Use three separate manual slots so no save is overwritten. The mod stays
installed; it only reads.

1. Go near a shrine you have not found yet (Nas River Shrine in Hernand if
   it is still undiscovered). Make manual save A.
2. Walk up until the game reports it discovered. Make manual save B.
3. Do whatever finishes a shrine (pray, activate, reward). Make manual
   save C. Note what the game showed.
4. Close the game. Claude copies the three slot files read-only into the
   research folder and compares them with
   `research/scripts/survey_save_record_lists.py --detail`.

What it answers: which record appears at B and what changes at C (for
example `_isCompleted`), with the shrine's UUID and info key. Only an
explicit flag that changes at C can count as "completed"; record presence
alone never does. If nothing shrine-related appears, Greymane Shrines are
not stored like Bells and the plan switches to another small set.

### Shrine research results (static, 2026-10-22)

Tools: pycrimson (LukeFZ, MIT) cloned into the git-ignored
`research/vendor/` with a Python 3.12 venv (it targets 3.14 but imports and
lists packs). One local change: the pack language flag accepts bit 14
(mask 0x7FFF), as the old checkout did. Extracted tables live in
`research/vendor/work/` (ignored). Script: `research/scripts/find_greymane_shrines.py`
→ `research/analysis/greymane-shrine-identity.json`.

- **Shrines are faction nodes, not Bell-style landmarks.** The landmark
  table (`levelgimmicksceneobjectinfo`) has no shrine entry (it does have
  `TreasureBox`, useful later). The faction node table has exactly 12
  `Node_*GreyManeTemple` entries, each with a `..._Repair` stage and a
  `Ritual` step. Keys 1000262–1000585, table positions 1107–1118.
- The faction node table has 1,119 entries in the same order as the save's
  `FactionSaveData._factionNodeElementSaveDataList` (1,119 records). So the
  save state is most likely record 1107–1118 of that list (inference: equal
  count and order; the record has no key field). Its fields include
  `_factionState`, `_enableNode`, `_isSaveEnabled` and the operation fields.
- Each shrine also has a knowledge entry (`Knowledge_Node_<Name>_GreyManeTemple`,
  keys 1001184–1001186 and 1001998–1002006) that stores its node key. Finding
  a place probably adds that knowledge key to `KnowledgeSaveData._list`
  (inference).
- Node → knowledge → MapGenie: all 12 pair one to one. 7 match by name,
  3 differ only in spelling (Shadow's Slope, Kingshield Mountains
  Northern/Southern), and 2 differ in name and need the user's review:
  `Rivercrest` → "Riverbed Terrace Shrine" (mg:552782) and `MistLake` →
  "Lake Mistveil Shrine" (mg:553835). The user accepted both pairings on
  the reasoning (2026-10-22), not from an in-game name check. The game's own direction labels agree
  with the MapGenie positions for every pair (Dem South/West/East,
  Musket East/West, Her North/South, Cal → next to the Calphade Bell).
- **Positions not found yet.** None of these tables holds a world position.
  The lantern prefab `gimmick_graymane_templelantern_000N` (with
  `..._challenge` gimmick charts) appears in 142 world-sector level files,
  but pycrimson's reflection reader fails on the current `.palevel` format
  (a `PARC` wrapper, then a type-table mismatch), even for the Bell mission
  level it once read. MapGenie positions converted with the Bell fit are
  within about 35 m but have no height; planning only.
- Native icon: type 186 `MapIcon_Gimmick_GreyManeTemple`.

Effect on the save experiment: compare faction-node records 1107–1118 and
the knowledge list, not the Bell landmark list. A shrine may only count as
completed if one of its node fields changes explicitly at save C.

### Shrine positions from the level files (static, 2026-10-22)

The level reader works again without changing pycrimson: current `.palevel`
files are `PARC` blocks whose reflection data starts 16 bytes in, and they
need `has_shared_strings=True`. Check: the Calphade Bell mission level gives
the Bell's verified UUID and, composing parent position + rotated child
offset, exactly its verified game position (−11896.21, 713.94, −2027.17).
Script: `research/scripts/find_greymane_shrine_positions.py` →
`research/analysis/greymane-shrine-positions.json` (needs the git-ignored
`research/vendor/work/pack-files.txt` listing).

- Every shrine is one `gimmick_graymane_temple_0002` object. Its gimmick
  data has `ChangeMinimapMarker MinimapMarkerType="Gimmick_GreyManeTemple"`,
  so it is the object behind the game's own shrine icon. Exactly 12 are
  placed in the world, each about 4.5 m from a `gimmick_graymane_altar_0001`
  (which carries a chest/shelter child gimmick; 12 placed). Both are
  registered interactive gimmicks in `gimmickinfo`. Decorative pieces near
  shrines (totems, `cd_spot_altar_prayer_01`) have no gimmick parts.
- 11 temples lie 8–39 m from their MapGenie point, which fits the fitted
  formula's accuracy. This also confirms the two name reviews by position
  (Riverbed Terrace 38.8 m, Lake Mistveil 8.1 m).
- **Mismatch to review:** "Kingshield Mountains Northern Shrine" (mg:547335,
  node `Node_CatchfireGreyManeTemple`, knowledge `Kingshield_North`). MapGenie
  puts it near (−8784, −1487), where the level files have only a decorative
  Greymane totem and a prayer-altar prop, no interactive shrine. The only
  remaining temple+altar pair is at (−9903.8, 658.1, 244.3), about 2,060 m
  away, near the Bronton stable / Eldred saddlery area. Its structure is
  identical to the other 11 shrines. The game data says the 12th shrine is
  there, so MapGenie's point is the likely error, but this needs a person to
  confirm in game before it is trusted.
- th.gl map comparison (user-supplied link, 2026-10-22): th.gl ids are the
  game's knowledge keys (`greymane_shrine_<key>@z:x`), the same keys
  `find_greymane_shrines.py` linked, so all 11 checked names agree with our
  pairing (Silverwolf's page did not load). 10 of those 11 th.gl points lie
  4–20 m from our temple objects. th.gl also puts Kingshield Mountains
  Northern (key 1002001) at (−8784, −1487, height 679), agreeing with
  MapGenie, 4 m from the decorative Greymane wood totem
  `cd_ex_dpf_wood_totem_15_graymane` (−8788, 667, −1487) and 2,062 m from
  the 12th temple object. th.gl describes it as an "ordinary-looking shrine,
  easily overlooked". Still unresolved; needs an in-game check of what is
  at each spot.

## Test-only teleporter (user exception 2026-10-22): research and plan

Static research: `research/analysis/teleport.md` (script
`research/scripts/teleport_scan.py`, disassembly `research/disasm/teleport-*.asm`).
Nothing built or run.

- Best candidate: the player's movement component
  (`ClientTransformSyncActorComponent`, vtable `0x55bf248`,
  `T = [[actor+0x68]+0x1a0]`), virtual slot `0x198` = `0x9fe740`, called
  with move type 4 ("Teleport"): `(T, PackedPos*, yaw xmm2, 4, 5, 0)`, where
  PackedPos = {x, y, z offsets, int16 sectorX, sectorZ} and world X =
  sectorX*1000 + x. The game itself uses this exact shape at four places
  (unknown purpose). It locks the actor and queues the move (`0x9fca60`),
  which the game applies on its next movement update.
- Player actor: `0x64f530(&handle)` / release `0x1434880`, as the minimap
  update `0xe13cf0` already does.
- Second choice `0x9fea40` (the server "do teleport" apply, with a safe
  ground search) needs a move-session value we cannot read yet.
- Dead ends: cheat move messages are empty stubs; field move, revive and the
  yaw setter are protected (obfuscated) code.
- Unknowns: whether the in-process server accepts the jump or pulls the
  player back, whether the next save keeps it, which thread the game's own
  teleports run on, and what map fast travel actually reaches.

### Plan (needs the user's OK at each phase)

Phase 1, logging only (no calls, nothing moves). Same combined mod plus
watch-only guarded hooks on `0x9fca60` (filtered to the player's component
or move type 4, so it stays cheap), `0x9fe740`, `0x9fe840`, `0xb61640`,
`0x9fea40`, and entry-only hooks on the field-move, revive-point and
forced-move handlers (`0xb87360`, `0xb882a0`, `0xbcc190`, `0xb619c0`). Each
logs arguments as copies, the return address and the thread, next to the
minimap thread and player position. If a guard fails, only that hook is
skipped. User run: fast travel near and far on the map, try it mounted, die
and revive at a revive point, use any door/gimmick teleport nearby, quit.
This answers which path the game uses, on which thread, and whether
positions are absolute.

Phase 2, the test build (only after phase 1 and the user's OK). A separate
`PywelAtlasTest.asi` from the same sources with `PYWEL_ATLAS_TELEPORT`
defined; the release build never contains it.
- Targets: the 8 Bells, the 12 shrines, both Kingshield Northern spots, plus
  an optional `%LOCALAPPDATA%\PywelAtlas\teleport-targets.json` (name, x, y,
  z). Hotkeys: Ctrl+PageUp / Ctrl+PageDown pick a target (named in the log
  and a short popup), Ctrl+End teleports.
- The call runs on the game thread phase 1 confirms (expected: inside the
  minimap update hook, after the original returns, while the player handle
  is held), using approach 1 with the current heading and the target height
  plus 1.5 m. It checks the guards, the component vtable and slot first, and
  refuses across the Abyss altitude threshold.
- After 2 s it reads the minimap position and logs whether the player
  arrived, stayed or was pulled back.
- First test: a short hop (about 100 m) on a test save, then farther jumps
  with a pause for terrain to load. On foot only, not in combat or a
  cutscene; the user checks this, since the mod cannot yet tell.

### Combined v0.55: teleport observation (phase 1, logging only, user-approved)

New part `src/pywel-atlas/TeleportObserve.cpp`, started by `PywelAtlas.cpp`
after the shared MinHook init; log `teleport-observe.log`. It moves nothing
and calls no game function. Guarded watch hooks (each skipped alone if its
24-byte guard fails):

- `0x9fca60` queued set-position, 7 arguments (rcx, rdx, r8b, r9b, then
  stack: velocity pointer, a6, a7; checked in the disassembly: reads at
  entry+0x28/0x30/0x38). Every call is counted per (caller, move type);
  only move type 4 is logged in full.
- `0x9fe740` slot 0x198 (yaw float in xmm2, two stack bytes) and `0x9fe840`
  slot 0x1a0 (rotation pointer, two stack bytes): every call logged.
- `0x9fea40` teleport apply (4 register arguments): position, 8-byte move
  session, result.
- Message handlers `0xb61640`, `0xb87360`, `0xb882a0`, `0xbcc190`,
  `0xb619c0` (rcx, rdx, r8 used; r9 passed through): entry with the first
  0x40 message bytes, and exit with the result.
- Each event logs thread, return address (RVA) and the minimap player
  position and thread, read from the marker part through the new
  `PywelGetMinimapPlayer` (non-blocking copy). Positions are decoded from
  the packed form (sector*1000 + offset).

Compiled with MSVC `/W4` without warnings (combined and standalone marker).
No automated tests added or run. Package:
`archive/releases/PywelAtlas-v0.55.zip`. Runtime pending.

### v0.55 runtime result (trace `research/traces/pywel-atlas-v0.55-teleport-observe.log`)

User steps: discovered two Abyss Nexus points near Calphade (Southern Guard
Post, then one to the west), fast travelled back to Southern Guard Post,
then to the Hernand Abyss Nexus, then mounted back to Southern Guard Post,
then died and revived at a revive point, saved to the last manual slot and
quit normally. All nine hooks installed (MH_OK).

- Every player move (both fast travels, the mounted one and the revive)
  went through the queued move request `0x9fca60`, move type 4, on the
  player's component (one fixed address all session), on the minimap thread
  (32276). Each was called first from `0x77be7f` (inside `0x77b2f0`, a
  state of the warp sequence object driven by `0x7797f0`, which sets state
  0xa → 0xb), then again 2–5 s later from `0x8c8f703` with the same target,
  after loading. The minimap position matched the target right after.
  Targets: Southern Guard Post (−11793.24, 688.74, −2462.82), Hernand Nexus
  (−10626.43, 621.21, −3813.26), revive point (−11778.63, 687.33, −2457.02).
- Mounted fast travel worked (a `MoveForce` handler ran first).
- Slot `0x198` (`0x9fe740`, caller `0x175a5cf`) only placed NPCs, on three
  other threads. `0x9fea40` and the DoTeleportAck/RevivePoint handlers never
  ran. `0xb882a0` runs every frame (routine traffic, not a field move).
- Static follow-up: `0x8c8f660` is the game's "set actor world position"
  helper, `(actor, const float3* world, moveType r8b, flag r9b)`. It packs
  the position and calls `0x9fca60` on `[[actor+0x68]+0x1a0]`. It is reached
  through the jump `0x507140`, which the game calls from 15 places with move
  type 4, always as: lock with `0x393650(&lock, [actor+8], 1)`, call
  `0x507140(actor, &xyz, 4, 0)`, then the inlined unlock (`[obj vtable+0x20](obj, 0)`,
  then drop the reference). Two of those calls are inside the warp state
  itself (`0x77b90d`, `0x77b9a9`).
- Events from before the minimap first ran show minimapThread 0 (no copy
  yet), not a different thread.

Updated phase 2 design (needs the user's OK): on the minimap thread, inside
the existing minimap hook after the original returns, get the player with
`0x64f530` (release `0x1434880`), copy the game's exact lock / `0x507140(actor,
&xyz, 4, 0)` / unlock pattern, then after about 3 s apply the same target
once more (the game re-applies after loading). This uses the same path as
the game's own fast travel and revive, minus the loading screen, so long
jumps may still arrive before the ground loads.

### Test teleporter build (phase 2, user-approved, built, runtime pending)

`PywelAtlasTest.asi` from `build.ps1 -Test` (defines `PYWEL_ATLAS_TELEPORT`,
adds `src/pywel-atlas/TestTeleporter.cpp`; output `dist/pywel-atlas-test/`,
package `archive/releases/PywelAtlasTest-v0.55.zip`). The release build was
checked not to contain it.

- Targets: `src/pywel-atlas/teleport-targets.h`, generated by
  `prepare_teleport_targets.py` (2 nexus landings from the v0.55 log, 8
  Bells, 12 shrine temples, the th.gl Kingshield Northern point with the
  nearby totem's ground height 667.3 instead of th.gl's 679).
- Keys (game window in front): Ctrl+Right/Left choose (popup after
  cycling pauses), Ctrl+Up shows, Ctrl+Down teleports (PageDown/PageUp/Home/End
  also work; the user has no End key). Log `teleporter.log`.
- The worker checks the build and guards of `0x64f530`, `0x1434880`,
  `0x393650`, `0x507140` (jump), `0x8c8f660` and `0x9fca60`; any mismatch
  leaves the teleporter off.
- The move runs in the minimap hook after the original returns (the thread
  the game's own teleports used): player handle via `0x64f530`, check
  `[[actor+0x68]+0x1a0]` has vtable `0x55bf248`, lock `0x393650(&lock,
  [actor+8], 1)`, `0x507140(actor, &xyz, 4, 0)` with xyz = target + 1.5 m
  height, the game's inlined unlock copied step by step, handle type pointer
  `0x5725e48` set and `0x1434880` release. The same move is applied again
  3 s later; 2 s after that the minimap position is logged as ARRIVED
  (within 10 m) or NOT THERE.
- Refuses a first move whose height is on the other side of the Abyss
  altitude threshold `[0x6cde048]` from the player (or when the player
  position is unknown). A request the minimap thread does not pick up
  within 5 s is dropped.
- Compiled with MSVC `/W4` without warnings (test, release and standalone
  marker). No automated tests added or run.

### Test teleporter runtime result (traces `research/traces/pywel-atlas-test-v0.55-*.log`)

User-confirmed working. All guards matched. Three jumps, every one ARRIVED
(checked 2 s after the second apply), all on the minimap thread:
Hernand Abyss Nexus → Hernand Bell (79 m, 0.0 m off), → game-file
"Kingshield Northern" temple (4,121 m, 3.4 m off), → th.gl Kingshield
Northern point (1,906 m, 0.0 m off). No fall-through or pull-back. The user
reported a few landings stuck inside geometry (terrain, and inside the
Hernand Bell tower, since a Bell target is the bell object itself); accepted
as fine for testing. A possible later fix: land at a nearby open spot or
higher above object targets.

Kingshield Mountains Northern Shrine resolved by the user in game: the
th.gl / MapGenie point (−8784, −1487) is the shrine; the 12th
`gimmick_graymane_temple_0002` at (−9904, 658, 244) is in Pailune city and
the user judged it a shrine-looking structure, not this collectible. So 11
shrines are temple objects and this one is not (only a Greymane wood totem
in the level files). `find_greymane_shrine_positions.py` now excludes that
temple (`NOT_A_SHRINE`) and places Kingshield Northern from the user check
(`USER_CONFIRMED`, height 667.79 where the player stood). The test build's
target list is regenerated (22 targets; no separate th.gl entry).

### Shrine save test (plan, 2026-10-22)

Goal: find which save records change when one Greymane Shrine is (B)
discovered and (C) finished, so the shrine category has an explicit
completion source like the Bell's `_isCompleted`. Use the test build (it
contains the normal mod) and a test save.

User steps:
1. Pick a shrine not yet discovered. Good starts: Nas River (330 m from the
   Hernand Abyss Nexus target) or Deepfog Basin (541 m from the Southern
   Guard Post Nexus target). Teleport to that nexus target, not onto the
   shrine (landing on it may count as discovering it).
2. Manual save A (an unused slot, not the last manual slot the user keeps
   for repeats).
3. Walk to the shrine until the game says it is discovered. Manual save B
   in a second slot.
4. Do whatever finishes it (pray, ritual, repair, reward). Manual save C in
   a third slot. Note what the game showed.
5. Quit normally and tell Claude the shrine and the three slot names.

Claude afterwards (read-only):
- Copy the three slot files out of the save folder into the ignored
  `research/vendor/work/` (reading only), then decode them with the
  existing reader logic.
- Extend `research/scripts/survey_save_record_lists.py` with a shrine view:
  `FactionSaveData._factionNodeElementSaveDataList` records 1107–1118 (all
  fields), `KnowledgeSaveData._list` entries for the 12 shrine knowledge
  keys (1001184–1001186, 1001998–1002006), the discovered-landmark list,
  and alert history. Then diff A→B→C.
- Also confirm that the save's node list order matches the table order
  (records 1107–1118 should be the shrines; a check by a value only shrines
  have, if one exists).
- Result: the exact field (node index, field name, value change) that marks
  "discovered" and "completed". Only an explicit change at C may count as
  completed; record presence or knowledge alone never does.

### Shrine save test result (2026-10-22)

User run: Nas River Shrine; manual saves 6/7/8 = slots 105 (A, before),
106 (B, discovered), 107 (C). The user found nothing to do at the shrine
(no prompt, nothing "ticked"). Copies were decoded with pycrimson
(`SaveFile` + `ReflectionParser`, works on whole saves); script
`research/scripts/compare_shrine_saves.py` compares by key.

- A → B: knowledge 1002002 `Knowledge_Node_NasRiver_GreyManeTemple` added at
  level 2, with a "knowledge learned" alert (type 0, level 2). Also
  Greystone Manor knowledge 1002116 went level 1 → 2 (passed on the way).
- B → C: nothing shrine-related (Navet and Egg knowledge at level 1, and
  an unrelated mission 4294966887 2 → 5).
- The 12 shrine faction-node records (list positions 1107–1118; confirmed
  the list follows the table order: each record's `_ownerFactionKey` is its
  node key) are unchanged in A, B and C, all `_factionState` 2.
- The user named the related challenge "Well-Informed Greymane". In the
  English strings (`quest.paloc`; the current string files are a 32-byte
  `paloc` header + LZ4 block, which pycrimson does not read yet) it is the
  title of mission 1001044 in `missioninfo` (internal name reused:
  `Challenge_SealedArtifact_ChallengeAndChange_II`). It is state 2 in all
  three saves (likely "in progress"); the save holds no per-shrine counter
  for it.

Conclusion: the only per-shrine record the game writes is the shrine's
knowledge entry, at level 2, when it is discovered. It is explicit and
keyed (no proximity inference). It most likely is what the challenge
counts, but that is inferred until the challenge screen confirms Nas River
counts. A Greymane Shrine marker could use "knowledge key present at level
≥ 2" as its completion source; level 1 or missing stays "not found".
Needs the user's decision.

### Challenge check setup (2026-10-22)

- The user believes the "Well-Informed Greymane" challenge starts by picking
  up a particular Sealed Abyss Artifact. th.gl: "Well-Informed Greymane",
  Sealed Abyss Artifact, description "Visit all Greymane Shrines", shown
  as (−5587, −5123, 521). th.gl's coordinate order is inconsistent between
  pages (link `@a:b`); the level files settle it: X −5586.68, Z −5123.13
  has objects at height ~520 including a Greymane temple lantern, the other
  order has none. No placed artifact object was found (likely spawned).
- The test teleporter now also reads `%LOCALAPPDATA%\PywelAtlas\teleport-targets.txt`
  (`name; X; Z; height`, re-read on every target change; up to 128 targets
  in all). Outcomes now carry their own target name and position. The file
  was created with this artifact (with the user's request). Rebuilt
  `/W4` clean, repackaged `PywelAtlasTest-v0.55.zip`.

### Challenge check result (2026-10-22)

User loaded manual 8 (slot 107), teleported to the artifact (file target),
picked it up and saved to manual 5 (slot 104). The challenge screen showed
"1 of 12" but does not list which shrines count.

- 107 → 104: one new inventory item (key 1002021, the artifact); some
  unrelated knowledge at level 1 and one node (Windrose Farm) at level 2;
  the rolling missions 4294966596 → 5 and 4294966595 new (the same pattern
  as 4294966887/86 earlier, not shrine-related). Mission 1001044
  ("Well-Informed Greymane") is unchanged: state 2, same tags. No
  challenge/achievement record type exists in the save. The 12 shrine
  nodes are unchanged.
- So the challenge stores no counter; "1 of 12" is computed. The only
  shrine record in the save is Nas River's knowledge (level 2), and the
  count matches it. Strong support (still inferred, one data point) that
  the challenge counts the shrine knowledge entries, the same record a
  shrine marker would use.
- Copies of slots 104–107 are kept in the ignored `research/vendor/work/shrine-test/`.

### Second shrine confirms the rule (2026-10-22)

User loaded manual 5 (slot 104, challenge 1 of 12), teleported to the
Southern Guard Post Nexus target, walked ~540 m to Deepfog Basin Shrine until
the game said it was discovered; the challenge screen updated (2 of 12);
saved to manual 1 (slot 100). 104 → 100: the only change in the whole
comparison is knowledge 1002006 `Knowledge_Node_Deepfog_GreyManeTemple`
added at level 2 (plus its learned alert). Shrine nodes unchanged.

Confirmed (two shrines, user-observed challenge count): a Greymane Shrine
is "found" exactly when its knowledge entry is present at level 2, and the
"Well-Informed Greymane" challenge counts these entries. This is the
explicit save record for the shrine category's completion.

### Greymane Shrine markers: plan (2026-10-22, user-approved; built as v0.56)

Evidence for the plan: after Deepfog Basin was discovered, the game created
its own icon type 186 `MapIcon_Gimmick_GreyManeTemple` (template 28812,
category 0xffffffff, tag kind 0xc) at (−12073.88, 716.11, −1999.97), exactly
the temple position from the level files (trace
`research/traces/pywel-atlas-test-v0.55-deepfog-map-marker.log`). So the
game shows a shrine icon only after discovery; our markers cover exactly
the undiscovered ones and never stack on the game's own icon.

1. Data: `data/greymane-shrine-links.json` (12 rows: poiId, name, node key,
   knowledge key, gamePosition, positionSource, evidence), made from
   `research/analysis/greymane-shrine-positions.json` by a script, then a
   generator `src/marker-bell/prepare_shrine_links.py` → `shrine-links.h`
   (like the Bell table).
2. Save reader (`NativeSaveReader.cpp`): a second, independent pass over the
   single `KnowledgeSaveData` object and its `_list` of
   `KnowledgeElementSaveData`, capturing `_key` and `_level` with exact
   shape checks. Found = shrine knowledge key present at level ≥ 2.
   `NativeSaveSummary` gains `shrinesValid`, `shrineFoundMask` and
   `shrineSeenMask` (level 1, kept for diagnostics only). If this pass fails,
   shrines are "unknown" (no new shrine markers) and Bells are unaffected.
3. Save detection publishes the same summary (no change to its selection
   or slot logic).
4. Markers (`NativeMapCategoryProbe.cpp`): generalise the Bell marker code
   into a small per-category table (name, icon type, template id/name,
   private key block, positions, wanted/present masks). Shrines: keys
   `0x5059415400000200 + i`, type 186 with exact definition checks, the
   same zoom-limit-off, reconcile, removal and "unknown never means not
   found" rules as Bells. F10/F6 still switch all markers until the ImGui
   panel exists.
5. Logging: type 186's definition once (container selector, record +0xb0
   actor-follow branch, zoom window), and per shrine marker the same F8
   fields as Bells (window result, zoom limit, actor id).
6. Test (release-style build, or the test build with the teleporter): load a
   save with Nas River and Deepfog found → 10 shrine markers, none at those
   two (the game's own icons show there). Discover a third shrine and save →
   its marker disappears. Check zoom-out visibility as for Bells.

## Combined v0.56: Greymane Shrine markers (built, runtime pending)

Built from the plan above (user-approved 2026-10-22). Release
`archive/releases/PywelAtlas-v0.56.zip`, test build with the teleporter
`PywelAtlasTest-v0.56.zip`. MSVC /W4 clean for the release, test and both
standalone builds. Not run in game yet.

- Data: `research/scripts/export_shrine_links.py` writes
  `data/greymane-shrine-links.json` (12 rows: poiId, name, nodeKey,
  knowledgeKey, gamePosition, positionSource) from the research output;
  `src/marker-bell/prepare_shrine_links.py` turns it into `shrine-links.h`
  (run by both build scripts).
- Save reader (`NativeSaveReader.cpp`): the parser gained a `Pass` (Bells or
  Knowledge). After the unchanged Bell parse, `FillShrines` runs a second,
  complete parse of the same decoded bytes that descends only into the one
  `KnowledgeSaveData` object and captures `_key` (`KnowledgeKey`, 4 bytes) and
  `_level` (`TLevel`, 4 bytes, at most 1000) of each `_list` entry, which must
  be exactly `KnowledgeElementSaveData`. Static check on a test save copy:
  all property kinds inside that container are ones the parser supports
  (0, 2, 6). Found = level ≥ 2; seen = any level. A failure sets
  `shrinesValid=0` and `shrineError`, never throws, and leaves the Bell
  result untouched. New `NativeSaveSummary` fields: `shrinesValid`,
  `shrineCoverage`, `shrinesFound`, `shrineFoundMask`, `shrineSeenMask`,
  `shrineError`.
- Save detection: no selection or slot change. It logs `SHRINE_READ` after each
  successful `BELL_READ`, adds "N of 12 Greymane Shrines found" (or
  "unknown") to the F7 popup, and publishes the same summary to the markers.
- Markers (`NativeMapCategoryProbe.cpp`): the Bell-only code became a table
  `kCategories` (label, native type, template id/name, key block, count).
  Bells: type 360, keys `0x5059415400000100 + i`. Shrines: type 186, template
  28812 `MapIcon_Gimmick_GreyManeTemple`, category 0xffffffff, keys
  `0x5059415400000200 + i`. Wanted / create-allowed / present / stuck masks
  are per category; at most one creation per map update across all
  categories. Shrines are "valid" only when the save read is accepted AND the
  shrine pass succeeded; otherwise existing shrine markers stay and none are
  created (logged once per read as "result unknown"). Same exact identity
  checks, zoom-limit-off and native removal as Bells. F10/F6 switch all.
- Logging: per-category "Detected save ... show [...]; done (hidden) [...]"
  and "markers on the map now"; F8 zoom-marker lines carry the type; the F8
  definition dump now includes type 186 (container selector, +0xb0 branch);
  the first type-186 icon logs its zoom windows (zoom-type line).
- Known limit: `MarkerDefinitionReady` reads only the already-loaded icon
  definition and never asks the game to load it. If type 186 is not loaded
  (possibly on a save with no shrine found yet), shrine creation is refused
  and counted as failures. The test save has two shrines found.

### v0.56 runtime result (2026-10-22): shrine markers not created

User: Bell markers fine; F7 popup "2 of 12" shrines (correct); no shrine
markers on the map. Traces `research/traces/pywel-atlas-v0.56-shrine-markers-map.log`
and `pywel-atlas-v0.56-shrine-reads.log`:

- Save side correct: every `SHRINE_READ` valid=1 found=2 foundMask=0x880
  (Nas River, Deepfog Basin); marker log "show [10 shrines]; done (hidden)
  [Nas River, Deepfog Basin]".
- Type 186 definition matched (F8 dump: containerSelector=1, +0xb0 branch=1,
  catalogue template 28812 `MapIcon_Gimmick_GreyManeTemple`).
- The one creation sample (Riverbed Terrace, index 0) shows
  `containerRouted=1 initObserved=0 iconVerified=0`: the world icon
  constructor `0xdb3bd0` was entered but never reached the common
  initialization (`0xdb4420` → `0xd8a970`), so no icon exists.
- The game created no type-186 icon of its own in this session's log.
- Definition difference: record +0x30 (WORD) is 0x16f6 for Bell 360 and
  0x16fc for chest 226, but 0xffff for shrine 186.
- Static reading of `0xdb3bd0` (research/disasm/map-zoom-db3bd0.asm): it builds
  a UI element from the template name (11th argument) via `0x3d2f5b0`; if the
  element's widget component (+0xd8, or +0xa0 → +0x58) is missing, or the
  element is still loading (+0xa0 → +8 non-zero), it either queues the element
  on controller +0x570 (when controller +0xaf7 is set) or destroys it, and
  returns 0 without initializing. Most likely the shrine's UI template is not
  loaded/ready when we create, unlike the Bell's. Not yet confirmed.
- Design flaw found: a marker that always fails is retried first on every
  update and uses the single creation slot, so the other 9 shrines were never
  tried (one sample only, index 0).

## Combined v0.57: why shrine icon creation is refused (user-approved, built, runtime pending)

`archive/releases/PywelAtlas-v0.57.zip` / `PywelAtlasTest-v0.57.zip`; MSVC /W4
clean for all four builds.

- Observation (no game change): `RouteWorldContainer` (hook on the world icon
  constructor `0xdb3bd0`) now keeps its return value and, for watched
  creations, logs a `world-create` line: ours/game, type, tag, the text at the
  template-name argument (bounded 16-byte copies), presentation present,
  slot7/scalar/slot9 raw, optional 12/13 present, final flag, controller
  +0xaf7, the waiting-list count at controller +0x578 before and after, and
  whether an icon was returned. Watched: our markers (first 3 tries each), the
  game's own type 186 (first 32) and type 360 (first 4).
- Fix: `ServiceMarkers` gives each marker a 5 s retry delay after a failed
  creation, so a failing marker no longer takes every update's creation slot.
  The worker logs "markers whose last creation failed" per category.
- What the run should answer: is our template text the same as the game's own
  shrine creation; did the constructor park our element (waiting count up) or
  throw it away; and do our markers succeed once the game has shown its own
  shrine icon (template loaded).

### v0.57 first run (2026-10-22): inconclusive, save never confirmed

Traces `research/traces/pywel-atlas-v0.57-no-selection-*.log`. User: no
shrine markers, only the game's own icons at Nas River and Deepfog Basin.
But the marker log has no "Detected save" line and no `world-create ours`
line: save detection logged `SELECTION withheld generation=2 loadScope=1650
slot=100 reason=storage-root-unavailable`. In every earlier session the
Steam save-storage start-up hook (`ef62160`, `stage=storage-end`) fired about
0.7 s after `SESSION`; in this session it never appears, so the game started
its save storage before our hook was installed (start-up timing race; not
caused by v0.57). Without the storage root no selection forms, so no marker
of any category may be created. The two game Bell creations were logged as
expected (`world-create game type=360 ... template=MapIcon_Gimmick_Bell_01
created=1 waiting=0->0`). Next: repeat the v0.57 run. Possible later fix
(needs the user's OK): recover the storage root when the start-up hook was
missed.

### Fix plan: save folder when the start-up hook is missed (2026-10-22, needs the user's OK)

Problem (v0.57 first run): the game started its Steam save storage before our
start-up hook (`ef62160`, slot 1 of the storage object, vtable `59840c0`) was
installed, so no save folder ("storage root") was copied and no selection
formed. Rare (one session in all logs) but it silently disables every marker.

Static research (read-only, this date):
- The storage object is created once at start-up. Its owner is reached as
  top object +0x108 → +0x50 → +0x10 (`0xacd9e0` → `0xa032470` → `0xef510a0`),
  but the +0x108 object's constructor (`0x186deb0`) jumps straight into the
  game's protected (scrambled) code. Following that chain from a fixed global
  would be slow and fragile, so it is not used.
- The storage object's own methods (vtable `59840c0`): slot 1 start-up
  (`ef62160`, hooked today), slots 3–8 all build "<root>/<file>" paths with
  the format `%#/%#` (`0x5578e3c`) from the same root at +0x20 / +0x128:
  slot 3 `0x2356e20` (path, then `0x2358a20`), slot 4 `0x2356f40` → `0xef601b0`
  and slot 5 `0x23571d0` (both log "[SaveData] restore failed"; read/recover),
  slot 6 `0x2357c60` (writes the request's buffer), slot 7 `0x2358ef0`
  (`_new` / `_backup` / `_delete` files), slot 8 `0x2359ff0`.
- Slots 3–6 have the same exact shape: `BYTE method(void* storage, void* request)`.
  Only RCX and RDX are read (R8/R9 are written before use), no float or stack
  arguments, result in AL. The request's file name is at request +0x28 (or the
  heap pointer at +0xb0).

Plan (v0.58):
1. Four watch-only hooks on slots 3–6 (`0x2356e20`, `0xef601b0`, `0x23571d0`,
   `0x2357c60`), each with 24-byte guards checked against the installed
   executable. Each forwards both arguments unchanged, keeps LastError, and
   returns the original result. No game function is called by us.
2. On entry, and only when RCX has exactly vtable `59840c0`, copy the root
   with the existing `CopyStorageRoot` (bounded, while the object is live) and
   queue a `STORAGE_USE` event (method slot, root copied). Logged when the root
   or generation changes, not on every call.
3. Selection: the start-up record stays the first choice. When it is missing
   or unreadable, a `STORAGE_USE` root seen in the current session is accepted
   as the same evidence, after the same `ValidateAccountRoot` checks (account
   folder digits, slot folder). If both exist and differ, the selection is
   withheld ("storage-root-conflict"). The log says which source was used
   (`rootSource=startup|use`).
4. Never guess the account from the folder listing; nothing is written to the
   game or its saves.

Test: ordinary runs should show `STORAGE_USE` firing during a load with the
same root as the start-up record (the real confirmation, since the race cannot
be forced). If the race happens again, the selection should still form with
`rootSource=use`. Open question for the run: which of slots 3–6 run on load
(static reading says the read/recover slots 4/5 should).

## Third category: Treasure chests (research, 2026-10-22)

Greymane Shrine markers are paused (user, 2026-10-22): the game refuses to
create the shrine icon (v0.56/v0.57 above). Chests were chosen next because
our own markers already use the chest icon (type 226), which works. User
rule: only chests that do NOT refill are tracked.

### Static findings (read-only)

- Two kinds of chest exist in the game files:
  - furniture chests in houses (`dff_chest_*`, `box_chest_*`,
    `treasurebox_cabinet_*`, `in_dff_chest_*`). In the test saves they appear
    in `FieldSaveData._fieldGimmickSaveDataList` (reason 1, with a
    `_resetTimeSecondsOfDays` refill timer; their `_cover` parts reason 4).
    They refill, so they are not trackable;
  - special treasure boxes: prefabs under
    `object/cd_gimmick/00_common/treasurebox/` (`gimmick_treasurebox_01/05/06/07`,
    puzzle `padlock_safe_0N`, `jigsaw_safe_0N`, `musicbox_01`, `onetouchdrawing_01`,
    `safe_01`) plus `gimmick_dungeon_chest_01` and `gimmick_temple_chest_01`.
    These match MapGenie's "Treasure Chest" category (251 points, named
    "Treasure Chest" or "Strongbox").
- The level-gimmick table (`levelgimmicksceneobjectinfo`, the Bells' table)
  has chest entries: `TreasureBox` 1000007, `TreasureBox_Sector` 1000134,
  `Ocean_TreasureBox` 1000176, `Religion_Box` 1000101 (Bells: `Quest_Bell*`
  1000115–1000119). So chests may be recorded in the Bells' save list
  (`DiscoveredLevelGimmickSceneObjectSaveData`) once found or opened. Not
  confirmed: the test saves have opened no special chest (user), so the
  absence of chest records there says nothing.
- Placements (`research/scripts/find_treasure_chests.py` →
  `research/analysis/treasure-chest-placements.json`; level list from the
  research-only scan `research/vendor/work/scan_chest_levels.py`): 275 special
  chest objects in 178 spots (chests within 15 m grouped; some caves hold piles
  of up to ~10 `treasurebox_07`). Only 63 spots / 50 MapGenie points pair
  within 80 m. The puzzle strongboxes pair within 10–17 m. All 54 Abyss points
  are unmatched (the MapGenie→game formula is fitted to Pywel only).
- Many well-known chests have no special-chest object nearby, for example the
  Church of Calphade tower chest (`mg:545827`, about 16 m from the Calphade
  Bell): only crates, barrels and a toolbox lie within 40 m in the sector
  levels. They are placed some other way (an interior/mission level, or
  spawned by a quest or event); one MapGenie chest says "requires quest
  progression for chest to spawn".
- Whether special chests refill is unknown (static data shows no timer for
  them; furniture chests have one).

### In-game save test plan (needs the user)

Goal: find which save record changes when a special chest is opened, whether it
names the chest's UUID, and whether it carries a refill timer. Use the test
build (teleporter) and test saves; copies are read outside the save folder.

Chest A, a matched puzzle strongbox: `mg:544444` "Strongbox", Hernand, the
Count's bed chambers on the upper floor (puzzle: rotate the wheel until the
owl picture is complete). Level object `gimmick_treasurebox_padlock_safe_06`
at (−10711.8, 621.6, −3897.2), about 85 m from teleport target "Hernand Abyss
Nexus".
Chest B, an unmatched chest: `mg:545827`, Church of Calphade tower, one floor
below the Calphade Bell (climb in through the broken window on the north
side); teleport target "Calphade Bell".

1. Load a test save, go next to chest A without opening it, and save to a free
   manual slot (A0).
2. Open chest A, take the loot, save to another manual slot (A1).
3. Teleport to the Calphade Bell, go to chest B without opening it, save (B0);
   open it, save (B1).
4. Refill check: wait or sleep at least one in-game day, look at chest A or B
   again (closed again = refills), save (R).
5. Tell Claude the slot numbers and what you saw. Claude copies the slots out
   of the save folder and compares A0→A1, B0→B1 and A1→R key by key (the
   shrine comparison tool, extended to the level-gimmick and field-gimmick
   lists).

### Chest save test result (2026-10-22)

User run (test build, teleporter): A0 = Manual 1 (slot 100), A1 = Manual 2
(101), B0 = Manual 3 (102), B1 = Manual 4 (103), R = Manual 5 (104). Copies in
`research/vendor/work/chest-test/` (ignored); compared with
`research/scripts/compare_chest_saves.py`.
User notes: chest A was a lockpick (padlock) strongbox, south of the owl-picture
one MapGenie describes; it opened and its item had to be stolen (user correction: it was looted, by stealing). Chest B looted. The
refill check (about 12 in-game hours of sleep) showed the safe still open with
no new loot.

- Chest A (`gimmick_treasurebox_padlock_safe_06`, UUID
  [1001162890, 3947892908, 3021822454, 0], level
  `sector_-42_-16_indoor_1_26`, (−10711.8, 621.6, −3897.2), the object paired
  with `mg:544444`): A0→A1 added a `FieldSaveData._fieldGimmickSaveDataList`
  record for exactly that UUID: reason 1, `_resetTimeSecondsOfDays` =
  18446744073709551615 (the largest value, "never"; furniture chests have
  finite timers), `_initStateNameHash` 353047760, plus reason-4 records for its
  door and lock parts. No Bells'-list record. No record existed before opening.
- Chest B (Church of Calphade tower, `mg:545827`): the game object is
  `itembox_06`, UUID [2163388933, 4279242571, 2832474592, 0], in the dedicated
  level `TreasureBoxHernand`. Its field record existed already in A0 (reason 1,
  reset "never", state hash 2255254665, the common initial value).
  - A1→B0 (walked up, not opened): a Bells'-list record appeared,
    `DiscoveredLevelGimmickSceneObjectSaveData`, key 1000007 (`TreasureBox`),
    that UUID, no `_isCompleted`.
  - B0→B1 (opened, looted): that record gained `_isCompleted = True`; the
    field record's state hash became 1537827618 and gained `_leftDropRollCount`.
  - B1→R (12 h): unchanged. Not refilled.
- Rules (evidence from one chest each):
  - chests in the dedicated chest levels: done = Bells'-list record with that
    UUID, key 1000007, `_isCompleted = True`. The same rule and reader as Bells;
    present without the flag = seen, not opened;
  - other special chests (puzzle strongboxes in sector/indoor levels): a field
    record for that UUID with reason 1 and reset "never" appeared on opening.
    Opened and looted (stolen) gave state hash 353047760 and no
    `_leftDropRollCount` (chest B, looted normally, gained one); from one
    sample each. Whether an opened-but-not-looted box differs is untested.
  - Neither carries a refill timer, so both kinds count as non-refilling.
- Placements updated (`find_treasure_chests.py` now also reads the six chest
  levels `treasurebox`, `treasureboxcrimsondesert`, `-delesyia`, `-demeniss`,
  `-hernand`, `-kweiden` and the `gimmick_itembox_*` prefabs): 422 chest objects
  in 321 spots; 159 of 251 MapGenie points pair within 80 m (119 matched spots
  use the Bells'-list rule, 83 the field rule). Unpaired: the 54 Abyss points
  (no coordinate formula) and about 38 surface points. Open: itembox objects
  outside the six chest levels were only found where the earlier scan already
  listed the level; a rescan for `gimmick_itembox_` would complete the list.

## Combined v0.58: treasure chest markers (built, runtime pending)

`archive/releases/PywelAtlas-v0.58.zip` / `PywelAtlasTest-v0.58.zip`; MSVC /W4
clean for the release, test and both standalone builds. Not run in game yet.

- Data: `research/scripts/export_chest_links.py` writes
  `data/treasure-chest-links.json` (the 120 chests of the six dedicated chest
  levels: name like "Hernand chest 8", UUID, game position, level, prefab,
  paired MapGenie id); `src/marker-bell/prepare_chest_links.py` turns it into
  `chest-links.h` (`kChestInfoKey` = 1000007). Both build scripts run it.
  None of these 120 chests is within 20 m of another, so no pile handling is
  needed yet.
- Save reader: the Bell pass's `Match` also matches records with key 1000007
  against the chest UUIDs (seen; opened = `_isCompleted`). `NativeSaveSummary`
  gains `chestCoverage`, `chestsOpened`, `chestSeenMask[8]`,
  `chestOpenedMask[8]` (256 bits). Same validity as Bells (one pass).
- Save detection logs `CHEST_READ` (coverage, seen, opened) and the F7 popup
  adds "N of 120 chests opened".
- Markers: category 2 "Chest", type 226, template 28852
  `MapIcon_Gimmick_LevelTreasureBox`, keys `0x5059415400000300 + i`. Masks are
  now `MarkerMask` (8 × 32 bits, up to 256 markers per category), shared as
  `[category][8]` LONG words with per-word Interlocked access.
  `ServiceMarkers` checks a rotating slice of 32 markers per map update (still
  at most one creation per update). Log lines show counts and truncate long
  name lists. The F8 zoom record keeps only the first 32 markers per
  category. The shrine category is paused (`shown = false`): never wanted or
  created. World-create logging records only the first try per chest.
- Test-build teleport target added to the user's runtime file:
  "Chest C - Lioncrest Manor bedroom chest" ("Hernand chest 24", `mg:547548`).
- Risks to watch: whether type 226's definition is loaded (it was in earlier
  sessions; if not, chest creations fail and are logged); chests whose level
  only loads after quest progress still get a marker (see
  `docs/quest-dependent-chests-handoff.md`).

## Which chests depend on quest progress (static research, 2026-10-22)

Question from `docs/quest-dependent-chests-handoff.md`. Script:
`research/scripts/classify_chest_gates.py` (read-only) writes
`research/analysis/chest-gate-classification.json`.

Evidence (game data and the user's save copies):

- The game's level tree, `leveldata/rootlevel/sceneobjectphase/mergedphasegroups.dat`
  (pack 0015), gives every level a parent chain. The 422 placed chests fall
  into: terrain (sectors, `cd_cave`, `cd_dungeon` under `world_use_terrain`)
  276; the six chest levels (`gamedatalevel/contents/treasurebox`) 120;
  faction or main-quest levels (`gamedatalevel/faction/...`, `.../main/...`)
  6; Abyss phase level `abyssisland_0003_phase00_00` 5; story/build phase
  levels (`velluavillage_before/...phase00_00...`, `akapen_phase/grace_build/
  grace_build_0001_phase00_00`) 3; not in the tree 12
  (`castlegrant_node_crim_fortmanub_0001_phase00_00` 10, `world_region_01` 1,
  `sector_-42_-16_indoor_1_41` 1).
- Levels are referenced by a 32-bit Jenkins hash of their CamelCase name
  (pycrimson `calculate_checksum`; e.g. `Mission_Friendly_Legendary_Black_Lion`
  = 0xcb04a9d4). No static table, sequencer (`.paseq`/`.pastage`/`.paseqc`,
  ~15,800 files) or group level file names a load rule for any chest level,
  by name or by hash. Group level files hold only bounds. The level files'
  `sceneobjectphase/levelinfos/*.levelinfo` list object UUIDs and parents per
  phase, not conditions.
- `levelgimmicksceneobjectinfo_misc` is the game's list of objects the save's
  Bells' list can track: type key, gimmick key, level, parent chain, UUID
  (three u32 at +8 after the chain). It has 239 `TreasureBox` (1000007)
  objects: 147 match placed chests (all 120 chest-level chests, plus 24
  waterfall-cave and 3 Abyss chests); 92 were missed by the level scan (71 in
  Abyss levels, 19 caves, 1 dungeon, 1 in main-quest level `MeetAlustain`).
  95 chest-level and 21 cave chests are also `RestoreStockTargetItem`
  (1000167); meaning untested (chest B, one of them, did not refill).
- Exact name links: only `mission_friendly_legendary_black_lion` has a mission
  (1001701) and a parent quest (`Quest_Node_Her_Friendly_Legendary`, 1000322)
  of the same name. The Bell levels follow the same pattern
  (`Mission_PororinVillage_Bell_All_Hernand` = mission 1000186, state 5 in
  chest-test slot 104), and Bells are present before and after that mission
  completes, so "mission-named level" does not by itself mean "present only
  while the mission is active" [inference].
- Hypothesis 5 is refuted: in chest-test slots 100/104 and shrine-test slot
  107, only the test chests have any record; the other ~420 placed chests
  have neither a Bells'-list nor a field record. The save does not list
  chests that exist.
- No save field records which level phase is active
  (`_activatedContentsPhaseGamePlayTriggerInfoKeyList` empty,
  `SubLevelSaveData` holds two experience entries,
  `_fieldLevelModifiedSaveDataList` holds level hashes with times).

Not settled: the rule that loads faction/main/phase levels. Until a save test
links one, these 26 chests (6 quest/faction, 5 Abyss phase, 3 story/build
phase, 10 castle-grant phase, 2 other) stay "unknown" and get no marker. The
120 chest-level chests sit in an always-on content group (structure, not yet
a runtime test).

### Offline follow-up (2026-10-22, no in-game test)

- `RestoreStockTargetItem` is not a refill timer [evidence + inference]: the
  executable's field list for `LevelGimmickSceneObjectInfo` has
  `_isRestoreStockTargetItem` next to `_checkGameLevelLoadState`,
  `_showIconConditionType` and `_checkBlockCondition`; the only other "Stock"
  fields are shop fields (`_buyableStockCount`, `_isStockBuyable`). No save
  copy holds a 1000167 record, even after chest B (both types) was opened. Its
  purpose is unknown; the one sample did not refill. `_checkGameLevelLoadState`
  suggests the game itself ties a gimmick's map icon to its level being loaded
  [inference].
- The game list gives each object's world position (three floats at +48 after
  the chain; matched 263 placed chests). With it, an Abyss MapGenie formula
  was fitted: x = (lng + 0.9704511) / 3.1054142e-5,
  z = (lat − 0.7620569) / 3.1054118e-5 (same scale on both axes). All 54 Abyss
  chest points pair one-to-one with Abyss TreasureBox objects, median ~2.5 m,
  worst 35 m. 18 more surface points pair with missed cave/dungeon
  TreasureBox objects. MapGenie coverage: 231 of 251 points now pair with a
  game object (was 159); 20 unpaired, listed in
  `chest-gate-classification.json`.
- All 239 TreasureBox objects (Bells' save rule, key 1000007): 120 chest
  levels, 74 Abyss, 44 terrain caves/dungeons, 1 main-quest level. 228 have a
  MapGenie point within 80 m.
- `mg:543899` (Hernand Castle alchemist's room, "found during the main
  quest") is the TreasureBox in `MeetAlustain_Alustain_Chamber_Gimmick`
  (group `Quest_MeetAlustain_Alchemist` under `Main`), 26 m from the point. So
  it is a quest-level chest, not a chest-level one [inference from position and
  MapGenie text]. In all three save copies the related main quest
  `Quest_MeetAlustain_Alchemist_CrowWing` (1000509) is in progress (state 2).
- Abyss phases: only `AbyssIsland_0003` (3 TreasureBoxes, 2 more chests) has a
  real alternate phase level (`_Phase00_01`). The other 71 Abyss TreasureBoxes
  have one version each. 21 sit under `AbyssIsland_Quest` (Abyss cores),
  meaning untested.
- Faction-node chests: `Node_Kwe_StellenManor` (1000466),
  `Node_Dem_WindmereManor_Byron` (1000487) and `Node_Her_SpiderCastle`
  (1000060) are faction nodes; their `FactionNodeElementSaveData` (keyed by
  `_ownerFactionKey`) shows `_factionState` 2, 0 (blocked) and 2 in all three
  copies. `conditioninfo` 1010001 reads
  `GetFactionNodeState(Node_Kwe_StellenManor)==Normal`. The state numbering is
  unknown, so these stay unknown.
- No table names `SplitHorn_Boss_Ibano_*`, `grace_Build_0001_Phase00_00` or
  `VelluaVillage_0001_Phase00_00_sub_2_3` as a load target.

## v0.58 runtime result (2026-10-22): chest markers work end to end

Traces `research/traces/pywel-atlas-v0.58-chest-markers-map.log` and
`...-save-detection.log` (last session only). Test build, Manual 5 (slot 104).

User: F7 said "1 of 120 chests opened"; chest icons all over the map, but
Hernand looked like it was missing some. Teleported to Chest C (landed in the
roof, climbed down), looted it and saved; its icon "changed to an open one".
F8 with the map open, normal exit.

Logs (captured):
- `SELECTION formed serial=1 ... slot=104`, `BELL_READ ... accepted`,
  `CHEST_READ serial=1 slot=104 coverage=120 seen=1 opened=1`. The save went to
  slot 100 (Manual 1): `SAVE_WRITE ... slot=100 linked=1`, then `CHEST_READ
  slot=100 seen=2 opened=2`. All `drops=0`.
- Marker log: `Chests: show 119 ...; done (hidden) 1 [Hernand chest 8]`;
  markers rose 32 per update slice to `Chest markers on the map now: 119`;
  125 creations (6 Bells, 119 chests), `failures=0`, `zoomLimitOff=125`,
  `zoomLimitRefused=0`; every `world-create ours` line has `created=1`. After
  the save: `done (hidden) 2 [Hernand chest 8, Hernand chest 24]`,
  `removals=1`, 118 on the map.
- The "open" icon is the game's own: type 227
  `MapIcon_Gimmick_LevelTreasureBoxOpened` (zoom window `[0.88 0.93 1 1]`).
  The game drew one at Hernand chest 8's exact position (Calphade, opened
  earlier). So after we remove our marker, the game shows its own opened
  chest icon there (Chest C's own type-227 creation is not in the log; the
  snapshot was already full) [inference for Chest C].

Why Hernand looks sparse (static, this date): MapGenie lists 55 Hernand chests;
we mark 27 (Hernand has 28 chest-level chests). The rest: 16 MapGenie-paired
cave/dungeon TreasureBoxes (same game list and save type 1000007 as ours, in
the always-on terrain group, under `CD_Cave_Her`), 5 field-rule puzzle boxes,
2 in quest or phase levels, 5 unpaired. Across all regions the game's TreasureBox list has 44
such cave/dungeon chests (Hernand 17, Demeniss 12, Delesyia 6, Crimson Desert
5, Pailune 4); 24 of them are in `treasure-chest-placements.json` labelled
`saveRule: field` only because they are outside the six chest levels. That
label is probably wrong (they are in the Bells' list table), but their save
record is untested.

## Quest-gating review against v0.58 and chest plan (2026-10-22, needs the user's OK)

Check against v0.58: all 120 chest-level chests (always-on content group)
got markers and the opened one was hidden by its save record, so the static
"always there" class holds in game for marker purposes. Nothing in v0.58
touched the gated or unknown chests (no markers by design).

What the findings mean for markers:
1. Always there, marked now: 120 chest-level chests. Done = Bells'-list record,
   key 1000007, `_isCompleted` (confirmed twice: chest B, Chest C).
2. Always there, not marked yet: 44 cave/dungeon TreasureBoxes in the terrain
   group (Hernand 17). They are in the same game list with the same type
   1000007, so the same record is expected, but no save sample exists yet.
3. Abyss: 74 TreasureBoxes (71 with one version; 21 under `AbyssIsland_Quest`,
   meaning untested; 3 in `AbyssIsland_0003` with an alternate phase). They
   need the game's Abyss chest icons (type 40 `MapIcon_AbyssTreasureBox`, 41
   opened) and a check that our markers work on the Abyss map layer.
4. Depend on quest progress, unknown: 26 placed chests in quest, faction,
   story or castle-grant phase levels, plus the TreasureBox in the main-quest
   level `MeetAlustain_Alustain_Chamber_Gimmick`. The save does not record
   which levels are active, and no table names their load rule. Faction-node
   states are readable but their numbering is unknown. Only the Alustain chest
   is in the TreasureBox list, so only it could give a "seen" record (the
   record the game writes when the player comes near, as chest B showed).
   They stay hidden.

Proposal:
- Save test (user, test build, short): one Hernand cave chest, e.g. Echoing
  Tunnel (`CD_Waterfall_Cave_0004`, (−11516.5, 610.2, −5196.0), `mg:550227`
  10.7 m). Save before opening (C0) and after looting (C1); Claude compares
  copies. Expected: a Bells'-list record, key 1000007, with that UUID and
  `_isCompleted = True`.
- v0.59 (after the test confirms it): add the 44 cave/dungeon chests to the
  Chest category (positions from the game list, names by region and cave, same
  rule and type-226 icon), 164 chests in all, under the 256 limit. Correct the
  `saveRule` label of those 24 placement entries.
- Gated chests stay hidden. Optional: show the Alustain chest only once its
  "seen" record exists (an explicit save record), until it is opened.
- Abyss chests: a separate later step (native Abyss icon, map layer check).

### Missed puzzle strongboxes: the owl box (2026-10-22, static)

User report: the Count's owl strongbox in Hernand (`mg:544444`, "rotate the
wheel until the owl picture is complete") had no icon. Expected for v0.58
(puzzle strongboxes use the field save rule and are not marked yet), but it
was also missing from the research data:
- The level search (`research/vendor/work/scan_chest_levels.py`) only looked
  for a fixed list of box names and missed four puzzle-box families:
  `fitnumber_safe`, `dial_safe`, `jigsaw_move_safe` and `allbutton`, plus
  itemboxes outside the six chest levels. The owl box is
  `gimmick_treasurebox_fitnumber_safe_04`, UUID [1001163168, 3947892908,
  3021822454], level `sector_-42_-16_indoor_1_30`, (−10700.3, 621.3, −3880.3).
- The padlock safe opened in the chest save test (chest A, `padlock_safe_06`)
  is MapGenie's other strongbox in that manor, `mg:546900` ("rotate the dials
  below the pins"). Nearest-point pairing gave it the owl point (10 m vs
  18 m); with ~35 m MapGenie accuracy, two boxes in one house cannot be told
  apart by distance.
- Fix: the search pattern now includes those families and
  `gimmick_itembox_*`; 87 more levels were added to `chest-levels.txt`;
  `find_treasure_chests.py` skips loose `_part` pieces. Regenerated:
  564 chest objects (was 422), 455 spots; all 239 TreasureBox-list objects
  are now placed; MapGenie pairs 242 of 251 points (was 231).
  `data/treasure-chest-links.json` (the 120 marked chests) is unchanged.
- New objects found: about 17 surface puzzle strongboxes and itemboxes
  outside the chest levels (Hernand 4: the owl box, a `jigsaw_move_safe` at
  `mg:544510`, the Baron's bedchamber itembox in Lioncrest Manor `mg:547533`;
  Demeniss 10; Delesyia 1; Pailune 2), 21 cave itemboxes already known from
  the TreasureBox list, 71 Abyss TreasureBoxes, and 34
  `itembox_reminiscence_01` in level `reminiscence_her` (a flashback level
  under the content group; meaning unknown, no marker).

Hernand, all 55 MapGenie chest points: 29 marked; 13 in caves, sewers or
dungeons (TreasureBox list, save type 1000007, not marked yet); about 9
puzzle strongboxes and itemboxes in manors and Hernand Castle (field rule,
not marked yet: the owl box, padlock safes, two music boxes in the castle,
the Baron's itembox); 2 in quest levels (Arboria Castle padlock safe in
`quest_node_her_spidercastle`, Torchlight Cabin temple chest in
`mission_friendly_legendary_black_lion`); 1 with no object within 50 m
(`mg:556288`, a cabin on The Singing Catfish, probably a ship level).
Gate classes now: 266 field-rule chests in terrain, 34 reminiscence, 12 not
in the level tree, 7 quest/faction, 3 story/build phase, 2 Abyss, 1 other.

### Cave chest save test (plan, user-approved 2026-10-22)

Goal: confirm that the 44 cave/dungeon TreasureBoxes use the same save record
as the chest-level chests before v0.59 marks them. Echoing Tunnel, Hernand
(`mg:550227`, MapGenie "Chest x2"), level `cd_waterfall_cave_0004`:
- chest D, `gimmick_itembox_a_0004`, UUID [2226913500, 1450446906,
  2909694524], (−11516.5, 610.2, −5196.0), types 1000007 + 1000167. Expected:
  a Bells'-list record, key 1000007, seen on approach, `_isCompleted` when
  opened;
- chest E, `gimmick_treasurebox_07`, UUID [1484827400, 1591218232,
  3740195795], (−11503.8, 610.2, −5185.5), not in the chest list. Expected
  (as chest A): a field record, reason 1, reset "never", on opening.
Teleport target "Chest D - Echoing Tunnel cave chest" added to the user's
runtime file. Steps: D0 = save next to both chests, unopened; D1 = after
opening and looting chest D; D2 = after opening and looting chest E. Copies go
to `research/vendor/work/cave-test/`, compared with `compare_chest_saves.py`.

### Cave chest save test result (2026-10-22)

User run (test build): D0 = Manual 2 (slot 101), D1 = Manual 3 (102), D2 =
Manual 4 (103). Copies in `research/vendor/work/cave-test/` (ignored);
compared with `compare_chest_saves.py`. The user opened one of the two
generic chests next to chest D (not sure which counted as "chest E"); the
save shows which.
- Chest D (cave itembox, game chest list): D0 already had the Bells'-list
  record (key 1000007, that UUID, no flag: seen); D0→D1 set `_isCompleted =
  True`. Its field record (reason 1, reset "never") existed from D0 and
  changed state hash 2255254665 → 1537827618 with `_leftDropRollCount` 0, as
  chest B. **Same rule as the chest-level chests, confirmed.**
- The two generic chests (`treasurebox_07`, gimmick key 16040007, origin UUID
  [1484827400, 1591218232, 3740195795] with fourth word 82 and 86, same
  position): both had field records already in D0, reason 1 with a finite
  `_resetTimeSecondsOfDays` 1252289 (not "never"); their cover parts are
  reason 4. D1→D2: chest 82 changed state hash to 1537827618 with
  `_leftDropRollCount` 0; chest 86 unchanged (not opened). So the user opened
  chest 82. The finite timer marks these as refilling chests, like furniture
  chests [inference from the timer; no refill observed]. Under the user's
  rule they are not tracked. This matters for the field-rule step: all 145
  `treasurebox_07` objects probably refill, while the puzzle strongbox
  (chest A, `padlock_safe_06`) had reset "never". A field record existing
  does not mean opened (these existed before opening); chest A's record
  appeared only on opening.

## Combined v0.59: cave chest markers (built, runtime pending)

`archive/releases/PywelAtlas-v0.59.zip` / `PywelAtlasTest-v0.59.zip`; MSVC /W4
clean for the release, test and both standalone builds. Not run in game yet.
v0.58 zips kept as the last runtime-confirmed fallback.
- `export_chest_links.py` appends the 44 cave/dungeon TreasureBoxes (game
  chest list, terrain group) after the 120 chest-level chests, so existing
  marker keys keep their numbers: 164 chests (Hernand 19, Demeniss 10,
  Delesyia 6, Crimson Desert 5, Kweiden 4 cave chests), names like "Hernand
  cave chest 6", plus a `place` field (MapGenie cave name, e.g. Echoing
  Tunnel = Hernand cave chest 6). Positions from the level files.
- No code logic changed: the reader, masks and markers are sized from the
  chest table (`kChestLinks`); banner, comments and READMEs updated.
- Expected test (Manual 4, slot 103 copy checked offline): opened = Hernand
  chest 8, Hernand chest 24, Hernand cave chest 6, so F7 should say "3 of 164
  chests opened" and 161 chest markers appear.
- Still hidden: quest/faction/phase chests (unknown), Abyss chests, puzzle
  strongboxes (field rule, next), reminiscence-level itemboxes, and the
  refilling `treasurebox_07` chests.
