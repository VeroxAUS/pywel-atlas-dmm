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
