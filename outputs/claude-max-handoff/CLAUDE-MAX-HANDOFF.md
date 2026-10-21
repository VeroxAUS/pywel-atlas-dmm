# Pywel Atlas: complete native-mod handoff for Claude Max

Prepared 21 October 2026, Australia/Sydney. This document describes the actual
checkpoint at handoff. Source, exact guards, disassemblies, research scripts,
confirmed traces, licenses and distributables accompany it. Read the evidence
levels carefully: compiled code, static analysis, runtime logs and user-confirmed
visual behaviour are different kinds of evidence.

## 1. Objective and non-negotiable product direction

Build **one standalone in-game Crimson Desert mod installed through DMM**. It
should eventually own collectible definitions, account/save identity, read-only
completion tracking, settings and native map/minimap markers. The user does not
want a required companion process, background bridge, Python runtime, browser
tracker, or separate overlay as the main architecture. Earlier desktop work is
a fallback and reference, not the current product. Do not reopen that decision.

The immediate engineering problem is automatic identification of the **actually
loaded account and save slot**, plus a defensible activation/invalidation boundary,
before connecting that identity to the native Bell reader that already works.

Do not recreate map rendering, save parsing or slot hooks from scratch. Preserve
the working proof and improve the identified gap. Do not promise all collectibles
or minimap/Abyss support from the current single synthetic-chest proof.

User preference: act independently on concrete engineering work; keep updates
short, use focused reads and filtered logs, avoid long speculative reasoning,
and do not spend 15 minutes on an inconclusive status report. The user specifically
asked to optimize token usage. This detailed document is intentionally extensive
because the user explicitly requested a full transfer to Claude.

## 2. Exact current stopping point

- **Confirmed marker/Bell baseline: v0.31.** Native Bell reading succeeds inside
  the game. Hernand Bell completion removes the synthetic proof chest and blocks
  recreation. No companion is involved.
- **Later marker source: v0.32.** It adds explicit F9 slot selection and periodic
  refresh. Those additions were not manually confirmed; the user chose automatic
  loaded-save detection first. The copied `NativeMapCategoryProbe.cpp` identifies
  itself as v0.32; do not call that exact source a pristine v0.31 snapshot.
- **Confirmed automatic-detection research: v0.35 and v0.36.** Slot reads,
  read/apply/outer-load correlation, cleanup and Steam-root capture work. Death,
  retry and explicit autosave loading have been observed once in v0.36.
- **Newest built observation package: v0.37.** It adds a native actor-resolver
  observer to investigate the client/server actor relationship. It compiles
  without warnings with MSVC `/W4`. Its actor-link result is **not runtime proven**.
- At handoff, the live append log's newest SESSION header is **v0.36**, PID 35148,
  tick 20534796. No v0.37 session was present when checked. The user has not reported
  completing v0.37. Do not claim it is installed or validated.
- All `automaticLoadedSaveTrusted`, `worldReadyTrusted`, `accountTrusted` indicators
  remain zero/false. No automatic account/slot identity has been connected to
  marker state or the Bell reader.

The latest instruction already given to the user was: close game; replace
v0.36 with v0.37 in DMM; launch and load normally; move briefly; press **F7 → OK**;
report done. Only this short actor-link observation is pending. There is no
request to repeat death, retry, autosave selection, manual-slot or title checks.

## 3. Location map and bundle layout

Original marker/Bell/desktop workspace:

```text
C:\Users\Thomas\Documents\Codex\2026-10-20\i-want-to-make-a-companion
```

Current save-detection continuation workspace:

```text
C:\Users\Thomas\Documents\Codex\2026-10-21\1-progress-building-one-standalone-dmm
```

Installed game executable, inspected read-only:

```text
E:\SteamLibrary\steamapps\common\Crimson Desert\bin64\CrimsonDesert.exe
```

Actual runtime mod-data directory:

```text
C:\Users\Thomas\AppData\Local\PywelAtlas
```

Captured Steam save-account directory:

```text
C:\Users\Thomas\AppData\Local\Pearl Abyss\CD\save\60062761
```

Bundle structure relative to this document:

```text
START-HERE.md                       Pasteable Claude starting prompt and read order
CLAUDE-MAX-HANDOFF.md                This document
CURRENT-SAVE-DETECTION-NOTES.md      Current detailed ledger copied verbatim
HISTORICAL-NATIVE-OFFSETS.md          Full older map/save offset ledger; stale status warnings apply
OFFSET-LITERALS.md                   Exhaustive hex-literal source-line index for native project files
MANIFEST-SHA256.csv                  Relative path, size and SHA-256 for every other bundle file
current/
  outputs/tools/native-map/         Current v0.37 source, build script, profile, MinHook
  outputs/docs/                     Current native-save-detection.md
  outputs/mods/                     v0.36 and v0.37 observation ZIPs
  work/map-mod-research/            Current scripts, .asm, RTTI, traces, Python analysis deps
previous/
  AGENTS.md                        Original project working constraints
  outputs/tools/native-map/         v0.32 marker/Bell source plus v0.35 probe source
  outputs/docs/                     Earlier full project ledgers, architecture, tracking docs
  outputs/data/                    Bell links, marker template, POI dataset and import template
  outputs/mods/                    v0.35 observation ZIP and later v0.32 marker proof ZIP
  outputs/vendor/python/           License/README files required by older Categories build
  work/map-mod-research/            Earlier top-level scripts, disassemblies and proof logs
  work/superseded/                  Confirmed v0.30/v0.31 binary ZIPs
```

`current/` and `previous/` preserve workspace-relative build layout. The current
SaveLoad build is self-contained under `current/`. On another machine update
the Python/Visual Studio/game-executable paths before research/building. The
Windows x64 analysis dependencies are included, but no Python interpreter or
Visual Studio installation is bundled.

The game executable, raw game-save snapshots, private user settings, full desktop
application and game asset archives are not bundled.
This is a native engineering transfer, not a backup of all user data. Runtime
logs contain account-path evidence and transient process addresses; they are
included because they are the evidence for this investigation.

## 4. Operating constraints

1. Never open game saves for writing. Parse stable copies only. Preserve the
   user's existing saves, manual marks, runtime marker JSON, settings and logs.
2. Do not infer completion from proximity, file recency, absent records, parse
   failures or a missed capture. Only an exact supported identity plus explicit
   completion can authorize completion-driven marker removal.
3. Separate save-confirmed progress from manual progress and scope it per
   account/slot. Do not merge state from a prior loaded save.
4. Build observation ASIs separately from marker ASIs until integration is
   justified. Keep other Atlas ASIs disabled during observation runs; they can
   collide on hook sites and hotkeys.
5. Preserve consumed register and stack arguments, native return values,
   LastError and the Windows x64 ABI. The elapsed-time float matters in the
   loading-controller hook; two transition paths have six arguments.
6. Capture bounded values synchronously while native references are live.
   Workers/dialog threads must never dereference saved game pointers. Cleanup
   may free an object; never resample it after original cleanup returns.
7. Installed hooks are process-lifetime. The probe pins its DLL with
   `GetModuleHandleExW(FROM_ADDRESS | PIN)`. Close the game before replacing or
   disabling the ASI. Do not live-unload it.
8. Recheck executable identity and exact guard bytes. Fail closed on mismatch.
   Do not regenerate guards merely to suppress an incompatibility warning.
9. The original AGENTS.md says **do not add or run tests unless the user asks
   for testing/verification**. Prior work used compilation, static inspection
   and user-run in-game observations. Do not describe automated tests as run.
10. Foreground confirmations are an explicit user preference. Keep the independent
    foreground/topmost dialog thread so notification cannot stall log draining.

## 5. Executable identity and address conventions

```text
Platform:              Windows x64, Steam installation
PE TimeDateStamp:      1790086912 decimal
SizeOfImage:           389722112 decimal
SHA-256, rechecked:    57da440d72f4db974f25fef047cf84c4dadd999a88cb2a3c5af4c9bd67fde1e7
```

All function/global/vtable offsets in the engineering tables are **RVAs**.
Runtime VA = actual `CrimsonDesert.exe` module base + RVA. Do not use the observed
heap addresses as persistent addresses. Disassembly lines label the instruction
with an RVA, but Capstone operand targets often include preferred image base
`0x140000000`, e.g. operand `0x14186f570` means RVA `0x186f570`.

`object + offset` and `vtable + offset` are byte offsets in structures, not RVAs.
Type IDs, categories, enum values, slot IDs, private marker keys, UUID words,
hex floating-point bits and emitted guard bytes are not addresses. The exhaustive
literal index deliberately includes all of these; it is a source index, not an
assertion that every hex literal is an RVA.

## 6. Completed observations: do not repeat

### v0.30 and v0.31: native Bell completion and marker control

v0.30 read Manual save 2 (`slot101`) entirely within the ASI and confirmed one
recorded/completed Bell, Hernand. v0.31 bound the synthetic proof chest to that
completion. User confirmed F7 removed it, then F6 did not recreate it. Prior
independent chest create/remove/layer/reload proofs are in the marker ledger.

v0.31 confirmed binary:
`previous/work/superseded/PywelAtlas-Native-Map-Probe-v0.31-visibility-confirmed.zip`.
Its binary is the rollback reference. The available later category source is
v0.32, including extra unconfirmed selector/refresh behaviour.

### v0.33: manual slot loads captured

Actual native manual-load order was **101 → 100 → 101**. Each read/apply pair
returned success. The apply object matched the read object from the scoped
wrapper. There was only one F7 checkpoint; browsing-versus-loading was not
independently timestamped. Initially only the first portion of the append log
was inspected, but later records showed the complete sequence. Do not ask for
that sequence again because an earlier summary was incomplete.

Preserved logs in `previous/work/map-mod-research/`:
`save-detection-v0.33-first-read-apply.log` and
`save-detection-v0.33-two-slot-sequence.log`.

A hidden modal dialog caused an early investigation concern. v0.34/35 moved
confirmations to a dedicated thread with `MB_TOPMOST | MB_SETFOREGROUND`, no
owner HWND. The user confirmed that the later popups appear in front.

### v0.35: title → Continue → title → Continue confirmed

Four F7 checkpoints: `correlated=0,1,0,1`, drops zero throughout. Both Continue
loads requested **slot1**. Scopes 4 and 13 had matching read/apply/outer-load
success on their respective objects. Return to title cleaned up the previous
loaded object and cleared the diagnostic candidate. Title preparation reads
did not promote a candidate.

Steam storage initialization returned AL=1 and copied:
`C:/Users/Thomas/AppData/Local/Pearl Abyss/CD/save/60062761`.

Trace: `current/work/map-mod-research/save-detection-v0.35-continue-title-confirmed.log`.
It includes earlier append history; select the v0.35 SESSION header, not the
first SESSION in that file. User saw and dismissed all four confirmations.

### v0.36: gameplay → death screen → retry gameplay → explicit autosave load

The user completed all four requested steps and confirmed every popup.
Full extracted session:
`current/work/map-mod-research/save-detection-v0.36-death-retry-autosave-confirmed.log`.
PID 35148, session start tick 20534796; 99,360 bytes when extracted. Four F7
checkpoints, zero queue drops throughout.

| Checkpoint, in user-confirmed order | Read completions | Apply completions | Outer loads | Cleanups | Phase | Correlated | Boundary |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| Initial controllable gameplay | 3 | 1 | 1 | 0 | 24 | 1 | 0 |
| Death screen before retry | 3 | 1 | 1 | 0 | 24 | 1 | 0 |
| Controllable gameplay after retry | 3 | 1 | 1 | 0 | 24 | 1 | 0 |
| Controllable gameplay after explicit autosave load | 5 | 2 | 2 | 4 | 24 | 1 | 0 |

First disk load: slot2, scope1723, server child `0x3cfd40f0200`, server user
`0x3cfd41a0000`. Controller's client child was `0x3cf7ca81a40`.

The observed retry added field-ready calls and a loading-controller cycle but
**no new native disk read/apply/outer-load and no matching server-child cleanup**.
Evidence supports in-memory/world reuse for this particular retry. It does not
establish that every revive/retry mode behaves identically. Do not invent a
fresh disk-slot identity for it.

Explicit autosave loading cleaned up the original server child and created
`0x3cfd40f0400`, scope13514, again slot2, all three native results zero. Its client
child was `0x3d03c70c940`. Steam root again ended `60062761`. The user did not
supply the UI autosave label/time or retry button wording; do not manufacture
those details. Numeric slot2 is the native observed identifier.

**Why boundary stayed zero:** the controller observes a client child with vtable
`0x5585c40`; the save wrapper loads a server child with vtable `0x5b1e2b0`. These
are legitimately different objects. v0.36's direct equality assumption cannot
work. The exact type guard withheld `+c3/+a0` reads on the client object, correctly
preventing a false positive. Do not remove guards just to make `matched=1`.

**Why phase24 alone is inadequate:** it was present on the death-screen checkpoint
with unchanged load state. It means the controller's loading sequence completed,
not that the player is alive or controllable. Death handling may be separate from
loaded-world identity. Whether to suspend markers at death is a policy/lifecycle
decision still to establish, not a reason to fabricate a save unload.

## 7. Exact current eleven-hook ABI table

These are the pass-through declarations used in v0.37. Some parameter names
remain deliberately opaque; a descriptive C++ name is not a recovered game symbol.

| Index | Hook RVA | Callback | Native ABI/result |
| ---: | --- | --- | --- |
| 0 | `0x186f570` | `ObserveRead` | RCX manager; RDX result storage; R8D slot; R9 save object; returns result pointer, DWORD 0 success. |
| 1 | `0x2941020` | `ObserveApply` | RCX wrapper with child at +8; RDX result; opaque R8/R9 forwarded; returns result pointer, DWORD 0 success. |
| 2 | `0x1042aaf0` | `ObserveLoad` | RCX wrapper; RDX result; R8 context; R9D slot; returns result pointer, DWORD 0 success. |
| 3 | `0x206b750` | `ObserveCleanup` | RCX manager; RDX object; opaque R8/R9 forwarded; return register forwarded as uintptr_t, no success code interpreted. |
| 4 | `0xef62160` | `ObserveStorage` | RCX Steam handler; RDX context; opaque R8/R9; returns BYTE/AL boolean, 1 success. |
| 5 | `0x219d7f0` | `ObserveFieldBegin` | RCX component; RDX result; R8 context; R9 actor; fifth stack BYTE; sixth stack pointer-sized value; returns result pointer. Descriptive stage name only: not proof of a load-start semantic. |
| 6 | `0x77a220` | `ObserveClientReset` | RCX loading controller; RDX child; opaque R8/R9; BYTE/AL result. Early phase-2 reset, not final completion. |
| 7 | `0x28f82a0` | `ObserveFieldTransition` | RCX child; RDX result; R8/R9 opaque; fifth and sixth stack BYTEs; returns result pointer. **Must forward both stack arguments.** |
| 8 | `0x294d5b0` | `ObserveFieldReload` | RCX component/wrapper, child at +8; RDX result; R8/R9 opaque; returns result pointer. |
| 9 | `0x7797f0` | `ObserveControllerUpdate` | RCX controller; **XMM1 float elapsed**; opaque R8/R9; declared void in current probe. Do not replace float with integer-only forwarding. |
| 10 | `0x17ef9c0` | `ObserveResolveActor` | RCX source actor; RDX output reference wrapper; opaque R8/R9 forwarded; returns reference-wrapper pointer. **Not a DWORD result code.** |

The profile array, callbacks array and original-function array must remain in the
same order; a static_assert checks counts, not semantic order. Exact 24-byte guards
for all eleven sites are in the appended guard appendix and the copied header.

Windows x64 stack arguments five/six are at entry RSP+0x28 / RSP+0x30. Internal
RBP-relative disassembly accesses must be converted using each function's own
prologue. For `219d7f0`, its fifth/sixth arguments appear at RBP+0x50/+0x58.
For `28f82a0`, the fifth/sixth bytes are at RBP+0x310/+0x318; RBP+0x300/+0x308
are saved register arguments, not extra stack parameters. These details caused
an ABI review correction during v0.36 implementation; the delivered v0.36/v0.37
source forwards the extra bytes.

## 8. Save-load offsets, callers and supported slots

| RVA | Meaning/evidence |
| --- | --- |
| `0x57db770`, `0x57db620` | Start/End Load SaveSlot strings, owned by `186f570`. |
| `0x186f5d7`–`0x186f64a` | Native accepted slot ranges: 0–3, 100–108, 200–207. Do not assign UI labels to every range. |
| `0x186f78a` | Call to lower reader `20688a0`, slot as fifth argument. |
| `0x186f898` | Reader writes zero to result storage on success end path. |
| `0x20688a0` | Lower file-read routine; not currently hooked. |
| `0x2c17520` | Continue/title preparation scanning owner. |
| `0x2c17881` / `0x2c17886` | Reader call / actual return address observed in preparation path. |
| `0x2c3e030` | Slot-load/context-construction owner. |
| `0x2c3e1ce` / `0x2c3e1d3` | Direct reader call / observed return address. |
| `0x2c3e4ad` / `0x2c3e4b2` | Outer-load thunk call / observed return. |
| `0x2940ee0` | Jump thunk to `1042aaf0`; actual hook is target, not thunk padding. |
| `0x1042abf3` / `0x1042abf8` | Scoped reader call / observed return inside outer wrapper. |
| `0x1042ac11` | Observed apply-return address inside wrapper. Consult full `1042aaf0` disassembly for exact call instruction. |
| `0x29415e0` → `0x10430980` | Apply-related notification/update route; not itself proven activation. |
| `0x14369b0` | Lifecycle cleanup dispatcher, calls object's virtual +0xa0 then +0x88. |
| `0x14369c6` | Observed server-object cleanup caller return. |
| `0x4fa461` | Observed client-object cleanup caller return. |
| `0x235ab00` → `0xef62160` | Steam storage initialization thunk/implementation. |
| `0xef51131` | Observed storage-init return address. |

Known UI mapping from manual runtime observations: Manual 1 = slot100, Manual 2
= slot101. Continue selected slot1 in v0.35 and initial gameplay/explicit autosave
selected slot2 in v0.36. Do not assume Continue always means slot1. Do not select
the newest file as loaded save. Slot0–slot2 are described as autosaves in older
external documentation, but native accepted range also includes slot3; retain
raw slot identifiers unless the current path/UI mapping is independently known.

The object WORD/DWORD at **+0x60 is not a save slot**. Earlier diagnostics saw
2416967680 and 2685403137. That field was removed from state decisions. It may
serve another entity identity purpose; no cross-side matching is authorized by
that speculation.

## 9. Object layouts, RTTI and late loading boundary

| Object/layout | Byte offset or RVA | Established meaning and limits |
| --- | --- | --- |
| Server child vtable | RVA `0x5b1e2b0` | `ServerChildOnlyInGameActor`, loaded by save wrapper. |
| Client child vtable | RVA `0x5585c40` | `ClientChildOnlyInGameActor`, observed by loading controller. |
| Server user vtable | RVA `0x5b257a8` | `ServerUserActor`; exact guard for server manager reads. |
| Client user vtable | RVA `0x55b59f0` | `ClientUserActor`; separate exact guard added in v0.37. |
| Actor | `+0x5e`, WORD | Generic lifecycle state: 1 initially, 0x10 after apply, 0x40 during cleanup in observed paths. Not gameplay readiness. |
| Child actor | `+0x68` pointer | Component table; `table+0x1a0` involved in actor resolver/field state. Not a universal table API. |
| Child actor | `+0xa0` pointer | Owning user/manager route used by native getters. Client and server managers differ. |
| Child actor | `+0xc3`, BYTE | Field-loading handshake byte. Early client reset clears it; ready calls set it; phase23 waits for nonzero. Not an alive flag or slot. |
| User manager | `+0xd0` pointer | Selected child; first eligible child attachment sets it; cleanup clears it on equality. Too early to mean gameplay active. |
| User manager | `+0xd8` pointer | Separate active/world-actor reference returned by `206ae30`, assigned by `206aec0`. Do not confuse with selected-child +d0. |
| Loading controller | `+0xb8` pointer, then component `+0x50` pointer | Controller's current client child. Validate exact child type before interpreting its layout. |
| Loading controller | `+0x15c`, BYTE | Loading phase, observed phase24 after completion sequence. |
| Reference wrapper | `+8` pointer | Returned referenced object in the getter wrappers analyzed here. |
| Reference wrapper | `+0x10`, BYTE | Native validity flag; v0.37 requires exactly 1 for proposed link. |
| Reference wrapper | `+0x11` and `+0x18` | Other wrapper ownership/lifetime fields used natively. Observer does not mutate them or construct wrappers. |
| Component owner | `+8` pointer | Child actor owned by component at `219d7f0` and component callers. |
| Resolver context | `+0x180`, DWORD | Native registry lookup key loaded by `17ef9c0`; **not a save slot**. |

Native generic lifecycle functions:

- `1436a20`: changes +5e 1→2.
- `1436a30`: changes 2→4.
- `1436a40`: changes 4→8.
- `1436a50`: changes 8→0x10.
- `1436a60`: writes 0x20.
- Server virtual +0x78 thunk `28f2c20` → `103789e0` changes 8→0x10 and counters.
  Apply calls it before returning, proving that state0x10 is too early.
- Server virtual +0x88 thunk `28f2cc0` → `1037f8a0` handles cleanup/reset counters.
- Server virtual +0xa0 thunk `28f2e70` → `10382b60` calls `2068600`, `17eabd0`,
  then manager cleanup if an owner exists.
- Server virtual +0x70 thunk `28f2be0` → `103763a0`; historical static clue only.
- `206b2d0`, code `206b3f3`–`206b413`: attaches first eligible child to manager+d0.
- `206b750`, code `206b837`–`206b84a`: clears manager+d0 on matching child cleanup.

Field-loading condition and controller:

- `595a078` is the RTTI-derived vtable for
  `ConditionData_IsEnterToFieldLoadingComplete`.
- Its virtual +0xa8 resolves to `22a8d40`. It follows actor context via `17ef9c0`,
  then `17ee020`, reads selected child's +c3, and returns a condition enum-like
  byte (missing context returns2, existing value tested then logical-not).
  **Numeric condition-enum success/failure labels are not fully established.**
- `17ee020` follows world actor+a0 → manager+d0; native checks virtual+c0 with
  EDX=4/R8D=0x10 before returning a validity wrapper.
- `77a220`, clear instruction `77a293`: clears child's+c3 near **phase2**.
  Native caller is `7797f0`, call `779992`, return `779997`.
- Controller `7797f0` handles phases1–23 and multiple asynchronous gates.
- Phase23 code `77a0df`–`77a13a`: optional once-only `b7e700` call; reads+c3 at
  `77a111`; remains pending if zero; writes controller phase24 at `77a13a` after
  the ready gate. Null child can also advance to24, so non-null/type/link checks
  are mandatory for save identity.
- Callback dispatches follow at `77a152`, `77a175` and related paths. They are
  not currently hooked as universal gameplay activation signals.
- `219d7f0`, write at `219d95c`: component owner's+c3=1.
- `28f82a0`, clear at `28f9242`; also calls `2bc4950` at `28f921f`.
- `294d5b0`, clear at `294db84`.
- `2bc4950`, clear at `2bc4bc1`.

`worldReadyTrusted` was intentionally never promoted from any of these raw values.

## 10. Native actor resolver: v0.37's exact hypothesis

The current relationship investigation is **not complete**. The code observes a
real native lookup rather than inventing a cross-side ID. Its routing may still
remain on the client side depending on the returned context and TLS; the new
runtime trace must answer that question.

`17ef9c0` performs this sequence:

```text
RCX source actor
  actor+68 -> component table
  componentTable+1a0 -> component
  component virtual+140 -> checked context reference wrapper
  if wrapper validity is false: return invalid wrapper
  select native registry root using GS:[58]/TLS byte +1ec
  select between two RIP-relative roots
  registry root+10 -> registry object
  context object+180 (DWORD) -> R8D lookup key
  registry virtual+30 -> checked user reference wrapper
  if wrapper validity is false: return invalid wrapper
  206ae30(user, caller output wrapper)
    user+d8 -> returned world actor reference
```

Key instruction locations: `17ef9e7`–`17ef9f9` for component dispatch;
`17efa66`–`17efa82` for TLS root selection; `17efa8a` for registry object;
`17efa95` for +180 key; `17efaa0` for virtual+30 call; `17efb17`–`17efb1e` for
the `206ae30` call. Exact RIP displacements are in the disassembly, not a portable
global pointer to cache. The two computed global RVAs should be derived from the
guarded instruction if needed; current observer does not directly traverse them.

`206ae30` reads manager+d8 and constructs native checked reference storage.
`206aec0` writes manager+d8 at `206af13`; it is a separate world-actor selection
path from +d0 child attachment.

The proposed second half, already used by native `17ee020`, is:

```text
returned world actor+a0 -> owner manager
manager+d0 -> selected child
```

v0.37 only sets diagnostic `nativeLinkRead=1` when all of these copied checks pass:

1. Input source vtable is exactly client child `5585c40`.
2. Native output wrapper fields are readable and validity byte is1.
3. Returned world-actor pointer has an in-image vtable pointer.
4. Copied returned actor+a0 points to an exact `ServerUserActor` (`5b257a8`).
5. Copied manager+d0 points to an exact server child (`5b1e2b0`).
6. That server child's+a0 points back to the same server manager.

The candidate owner read from the returned world actor is diagnostic and bounded;
its exact returned concrete class is not established. No game getter is invoked
independently, no native wrapper is released/retained by the observer, and no
progress change follows from this.

Additional explicit native relation: field-ready `219d7f0` receives fourth actor
argument R9 through `206ae30` in both callers:

- Server caller `2bcaf00`: owner+a0 passed to `206ae30` at `2bcaf99`; result+8
  passed as R9 at `2bcb0bb`; call `2bcb0ca`, return `2bcb0cf`.
- Client caller `9ceac50`: owner+a0 passed to `206ae30` at `9ceacea`; result+8
  passed as R9 at `9cead08`; call `9cead20`, return `9cead25`.

v0.37 records that R9 pointer/vtable on field-ready events too. Equal timestamps
between these sides are not proof of shared identity. The source names
`ObserveFieldBegin` and stage `field-begin-*` are descriptive legacy labels even
though this function sets the ready-handshake byte; do not infer semantics from
the label alone.

## 11. Probe state, queues, logging and candidate decisions

Only `NativeSaveLoadProbe.cpp` owns current observation state. No save parser,
marker hooks, persistent detected-slot storage, or external process is in it.

Hooks use bounded `ReadProcessMemory(GetCurrentProcess(), ...)` snapshots. `Begin`
captures stage, LONG sequence, thread, GetTickCount64 tick, caller RVA, object,
requested slot, TLS scope/slot, captured drop count, vtable and +5e bits.
`CaptureFieldState` now allows only exact client/server child vtables, reads+c3
and+a0, and permits+d0 only for exact client/server user vtables.

The queue is 128 `Event` records protected by a try-acquired exclusive SRW lock.
Contention or capacity increments a drop counter rather than blocking a loading
thread. Worker draining copies records and releases the lock before formatting,
file writes or dialogs. Worker sleeps30ms. Log lines are append-only, flushed by
the worker. This is diagnostic overhead, not production telemetry.

The per-thread load scope is the outer-load sequence ID. Nested calls restore the
prior scope and slot. Sixteen worker-owned correlation records track scope,
initial drops, object, slot, successful read, successful apply and rejection.
Promotion requires supported slot, same scope/object/slot, read success preceding
apply success, outer success and unchanged captured drop count. Cleanup of last
load object clears its candidate. Capacity overflow withholds correlation.

The native resolver has a change-only thread-local cache: source actor, returned
peer, resolved child, wrapper validity. Controller snapshots are change-only by
controller address, child address, phase, handshake byte, or within-call phase
change. Sequence IDs can therefore skip while **dropped=0**. Never calculate
loss from sequence-number gaps.

v0.36 logged many repeated early reset calls while a native guard returned0.
Use filtered summaries first to avoid reading hundreds of repetitive lines.

Current `RefreshBoundary` requires: correlated load; controller phase24;
controller snapshot timestamp at/after last load; native link source equals
controller client child; resolved server child equals last loaded server child;
link timestamp at/after last load; equal captured drop counts; client+c3=1;
client manager selected-child equals controller child. It is recomputed on
controller changes and actor-link changes so arrival order is not assumed.

New load/matching cleanup clears last actor link. New loading/transition stages
clear boundary candidate. Observed queue-drop changes clear candidates. These
are diagnostic mechanisms, not a finished concurrency-safe production state machine.

Log format families:

```text
SESSION ... v0.37 pid=... tick=... automaticLoadedSaveTrusted=0
READY ...
stage=read-start/read-end/apply-start/apply-end/load-start/load-end ...
stage=cleanup-start/cleanup-end/storage-start/storage-end ...
stage=field-begin-start/field-begin-end/client-reset-start/client-reset-end ...
stage=field-transition-start/field-transition-end/field-reload-start/field-reload-end ...
stage=controller-snapshot/actor-link ...
LOAD_CHAIN scope=... slot=... correlated=... worldReadyTrusted=0 accountTrusted=0
STORAGE_ROOT copied=... booleanResult=... root=...
FIELD_STATE seq=... fieldFlagRead=... fieldFlag=... manager=... selectedChild=...
CONTROLLER seq=... controller=... phaseRead=... before=... after=... object=...
ACTOR_LINK seq=... source=... sourceVtable=... peer=... peerVtable=... valid=...
  manager=... serverChild=... nativeLinkRead=... drops=...
CLIENT_BOUNDARY seq=... loadScope=... slot=... matched=...
CHECKPOINT F7 ... actorLinkCount=... nativeLinkRead=... controllerPhase=...
```

`actorLinkCount` counts emitted change records, not every native lookup call.
`nativeLinkRead` is last captured diagnostic association, not an account/slot trust
flag. `sameObject` compares latest read/apply as a convenience; full load scopes
and complete chronological events are the authoritative correlation evidence.

F7 is foreground-process gated and edge-triggered. It writes the checkpoint first,
then copies text into a protected popup buffer and creates a notification thread.
Only one popup at a time; extra F7 presses can log without another dialog. Popup
flags: `MB_OK | MB_ICONINFORMATION | MB_TOPMOST | MB_SETFOREGROUND`, no owner HWND.
The popup must never run synchronously on the logging worker again.

## 12. Specific v0.37 review items before production use

These are unresolved limitations/potential failure modes, not confirmed crashes:

- The lookup may never run with the exact controller child input on a given load,
  or may resolve a client manager rather than server manager. A zero link count
  or nativeLinkRead0 is useful evidence; it does not justify relaxing the guards.
- Summary stores only **one last actor link**. Unrelated source queries can
  overwrite a relevant association. A bounded association table tied to load
  generations would be a better production design if runtime proves the route.
- Change-only resolver caches are not keyed by load generation or drop epoch.
  An unchanged query might not be reemitted after worker invalidation. Review
  this if a valid relationship appears once but then cannot be reconstructed.
- Millisecond tick comparisons are not causal ordering. A production design
  needs explicit generations/identity lineage, not timestamps alone.
- RefreshBoundary can reconsider a prior controller snapshot after a later
  resolver event. It has no full invalidation epoch spanning retries/transitions;
  audit stale resurrection before wiring anything to progress.
- Cleanup rejects the last summarized load candidate, but the correlation table
  is not a fully audited concurrent lifetime model for cleanup during an active
  outer-load scope. Address reuse and overlapping/nested loads require care.
- The new resolver first reads returned actor+a0 as a diagnostic common-layout
  candidate, then exact-checks manager/child. The returned concrete class is not
  itself exact-guarded. Establish it before making that traversal trusted.
- Phase24 remains valid on death. Do not rename the matching flag `alive` or
  `controllable`; keep save identity and player-control state separate.
- Captured root is not yet authenticated/bound to every read scope or handler
  lifetime. Multiple accounts/handler changes need explicit validation.
- Current source reads post-call fields with bounded self-process reads; a
  successful read does not by itself establish lifetime ownership. In particular
  any future pointer retention must acquire a real native lifetime contract.
- Current profile checks only timestamp/image size and site bytes at runtime,
  not full executable SHA-256. SHA is documentation/research provenance.
- MinHook is initialized/enabled at process level. Other simultaneous Atlas ASIs
  were intentionally disabled during observations; combining hooks should be
  engineered deliberately, not accomplished by enabling multiple probes.

No item above authorizes a speculative rewrite. Inspect the shortest relevant
trace/source first, preserve proven behaviour, and fix only what evidence requires.

## 13. Native Bell reader: implementation and integration seam

Files in `previous/outputs/tools/native-map/`:

- `NativeSaveReader.cpp` / `.h`: bounded native read-only parser.
- `bell-proof-links.h`: generated exact eight-Bell identity table.
- `prepare_bell_links.py`: regenerates table from copied `outputs/data/bell-save-links.json`.
- `NativeMapCategoryProbe.cpp`: later v0.32 synthetic marker consumer.

Public interface:

```cpp
struct NativeSaveSummary {
    char profile[64];
    unsigned coverage;
    unsigned recorded;
    unsigned completed;
    bool hernandCompleted;
};
bool ReadSelectedBellSave(const wchar_t* runtimeDirectory, unsigned slot,
    NativeSaveSummary& summary, char (&error)[256]);
bool ChooseNativeSaveSlot(const wchar_t* runtimeDirectory, unsigned& slot,
    char (&error)[256]);
unsigned LoadNativeSaveSlot(const wchar_t* runtimeDirectory);
```

Important limitation: **the reader currently takes a slot, not a detected account**.
`SavePath` enumerates `%LOCALAPPDATA%\Pearl Abyss\CD\save`, accepts numeric directory
names only, and requires exactly one account. It constructs
`<root>\<account>\slot<slot>\save.save`, profile `ACCOUNT:slotNNN`. It does not
consume the captured native Steam root. That API/path selection must be extended
carefully when automatic identity is actually ready; changing the slot alone
does not implement detected-account binding.

Reader slot range is <=999; hook accepted-slot ranges are narrower. Persisted
explicit selection defaults to101. These are different validation layers.

Stable read: maximum encrypted size32MiB, minimum128 bytes; source opened
GENERIC_READ with READ/WRITE/DELETE sharing. Up to four attempts compare two full
byte arrays and modification timestamps separated by120ms. Decode only equal
copies. This is a saved-on-disk progress reader, not a reader of unsaved live
quest state. The game may update completion only when it next writes a save.

Save envelope:

| Byte position | Width | Meaning |
| --- | --- | --- |
| 0 | 4 | ASCII SAVE magic |
| 4 | 2 | little-endian version, supported2 |
| 6 | 2 | header size, supported128 |
| 8 | 10 | skipped header data |
| 18 | 4 | expanded length, bounded <=128MiB |
| 22 | 4 | compressed length, must equal file length minus128 |
| 26 | 16 | nonce |
| 42 | 32 | authentication signature |
| 128 | remaining | encrypted payload |

The implementation uses the existing ChaCha20/decryption, BCrypt HMAC-SHA256
authentication and bounded LZ4 decoder. The format-derived key material and
algorithm details are retained in the copied source; do not replace with a
guessed implementation. Authenticate before decompression/reflection. Equal
compressed/expanded length bypasses LZ4 expansion.

Reflection supports header0xffff, metadata versions3–4, serialization versions
11–15; nesting <=64, visited objects <=1,000,000, bounded collections/strings and
object offsets. Read exact version checks from source. Requires a unique
`DiscoveredLevelGimmickSceneObjectSaveData` container and property
`_discoveredLevelGimmickSceneObjectSaveDataList`.

Completion evidence requires all three:

- `_sceneObjectUuid` is the exact mapped uint4/16-byte UUID.
- `_levelGimmickSceneObjectInfoKey` is one of that Bell's mapped uint32 keys.
- `_isCompleted` is valid bool/1 byte and explicitly true.

Recorded-but-not-completed and missing records remain unconfirmed; neither
becomes confirmed unfinished or completed by inference. Unknown/missing schemas
produce errors, not marker removal. Hernand consumes POI `mg:543894`.

Hernand UUID words: `[1601869702,1450446765,1450142268,0]`.
Allowed Bell keys: `[1000115,1000116,1000117,1000118,1000119]`.
All eight exact links are included in the Bell-link appendix and JSON/header.

Only local mod data is written: encrypted stable copy
`native-save-proof-ACCOUNT-slotNNN.save` and `native-save-progress.json` via
temporary file + flush + MoveFileEx(REPLACE_EXISTING|WRITE_THROUGH). Report
currently hardcodes `loadedSaveDetected:false`. It contains profile, selectedSlot,
read/save times and per-Bell states. A failed read may leave a previous report
on disk; consumers must not treat it as fresh. The marker proof uses the current
function result, not reloading old JSON as current input.

Native format interpretation derives from LukeFZ/pycrimson, MIT, with license
included. Runtime parser is C++, no Python process. Do not remove attribution.

## 14. Existing marker implementation and all critical map offsets

The full historical map offset ledger is included verbatim as
`HISTORICAL-NATIVE-OFFSETS.md`. It contains both successful and superseded
experiments. The following are the current proof's important interfaces; copied
`category-profile.h` contains exact guards and generated constants.

| RVA/value/field | Meaning |
| --- | --- |
| `0x566ff50` | World-map controller vtable. |
| `0x5674e00` | Minimap controller vtable, separate path. |
| `0xdeeb60` | Shared icon creation; ten-argument ABI, copied source is authoritative. |
| `0xdf88c0` | Shared map/minimap display update route; useful historical creation caller. |
| `0x537250` | Icon-type definition lookup. |
| `0x388e00` | Template record lookup. |
| `0x6d6e418` | Global icon-type table pointer RVA. |
| `0x6d69a80` | Global template table pointer RVA. |
| `0x6cde048` | Parent altitude threshold global RVA. |
| `0xdb8a00` | World icon lookup. |
| `0xdeffa0` | Minimap/shared icon lookup implementation. |
| vtable `+0x548` | Lookup virtual slot. |
| vtable `+0x550` | Creation virtual slot. |
| `0xdb81e0` | World icon constructor; fourteen-argument ABI in source. |
| `0xe08d70` | Minimap creation implementation, not broad current-proof validation. |
| `0xdb8a60` | World icon removal: controller, WORD type, tag pointer, DWORD index. |
| `0xdabd10` | Enclosing world-map update hook used to schedule scoped create/remove. |
| `0xdb83ae` | Altitude/parent-container choice instruction guard. |
| `0xdb8371`, `0xdb84a4`–`0xdb84ed` | Constructor/stack/parent-selection research sites. |
| `0xdeca40` | Three-byte visibility/suppression helper. |
| `0xd8a970` | Icon initialization copying source position to icon+e0. |
| `0xdb3bd0` | Scale-related hook; see source for exact float ABI. |
| `0xd94040`, `0xd91820` | Position/projection update routines. |
| controller `+0x398`, `+0x3a0` | Fresh native parent/container and count access, type-specific. |
| icon `+0xc8` | Private tag pointer/readback. |
| icon `+0xde` | Type field/readback. |
| icon `+0xe0` | XYZ float3. X/Z horizontal, Y altitude. |
| icon `+0x1e8`–`+0x1ea` | 24-bit visibility/suppression mask. |
| template `+0x18`, icon-info `+0x20`, type-info `+0x2c` | Type/template/category access; follow exact native types. |
| type226; secondary28852 | Current closed treasure-box appearance. |
| type227/229; secondary28855 | Opened treasure-box variants, not completion evidence. |
| type360 | `MapIcon_Gimmick_Bell_01`; type data, not currently a complete custom Bell route. |
| `0xffffffff` category | Sentinel used by private/native appearance; not an address. |
| `0x25`, `0x66` categories | Personal pin/trace categories avoided by private proof. |
| `0x5059415400000002` | Mod-owned stable synthetic chest key, not a memory address. |
| tag kind0x15, index0 | Private numeric tag/index. NumericTag is16 bytes. |

The custom marker is a synthetic chest near Hernand, not a real new collectible.
It uses private ownership/type/tag/index checks and does not use saved personal
pin serialization. User confirmed no personal-pin count consumed. Create/remove
operations are scheduled against a fresh UI-owned map update/container; never
run arbitrary UI/game creation from the save reader worker.

Hernand world XYZ:
`[-10702.4970703125,631.1273193359375,-3833.85888671875]`.
Initial proof position: X+200, same Y/Z; local JSON can move it. The generated
Bell float bit patterns in category profile are
`[0xc62739fd,0x441dc826,0xc56f9dbe]`. Do not confuse a historical display-only X+200
experiment with a universal coordinate correction.

Runtime marker JSON is `%LOCALAPPDATA%\PywelAtlas\native-map-marker.json`.
Created from embedded defaults only if absent; never overwrite user edits on
upgrade/error. Current schema1, reserved id `atlas-chest-proof`, region `pywel`,
icon `chest`, boolean enabled, finite XYZ within +/-1,000,000, completion.source
`none`. The parser's source field does not itself imply save completion.

Marker hotkeys are **different from observation-only builds**:

- F6: load definition/request creation; if Bell link enabled, read current selected
  save first and block creation on completion/read failure.
- F7: native Bell read and enable session link; explicit completion requests
  scoped removal. This is not merely a logging checkpoint in marker source.
- F8: report/capture diagnostics.
- F9: v0.32 existing-save selector, local persisted explicit selection; unconfirmed.
- F10: remove only owned proof marker; focus loss/three-minute timeout also
  request scoped cleanup. Automatic refresh does not automatically create markers.

The worker serializes v0.32 selection and save reads, refreshes every5 seconds
after F7, and disables old linkage/removes old owned marker on a changed selection.
Preserve that stale-state discipline when replacing explicit selection with
automatic identity. v0.31 removal/recreation blocking is confirmed; v0.32 added
selection/refresh is not separately runtime confirmed.

## 15. Build, regenerate guards and package

Current observation build uses bundled MinHook source and installed MSVC:

```powershell
$currentRoot = 'C:\Users\Thomas\Documents\Codex\2026-10-21\1-progress-building-one-standalone-dmm'
Set-Location -LiteralPath $currentRoot
& '.\outputs\tools\native-map\build.ps1' -Mode SaveLoad
```

If working from the extracted transfer bundle, use its `current` directory as
root instead. Script resolves workspace as three levels above native-map.

```text
vcvars64.bat:
C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Auxiliary/Build/vcvars64.bat
Analysis Python currently used:
C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe
Build intermediates:
<current root>/work/native-map-build
ASI output:
<current root>/outputs/mods/native-save-detection/PywelAtlasSaveDetectionProbe.asi
```

C compilation: `/nologo /O2 /MT /TC /c` on MinHook buffer.c, hook.c, trampoline.c,
hde/hde64.c. C++ compilation: `/nologo /O2 /MT /std:c++17 /EHsc /W4 /LD`.
Link libraries currently retained: shell32, user32, gdi32, runtimeobject, bcrypt.
Source ASI module name remains `PywelAtlasSaveDetectionProbe.asi`; marker module
is `PywelAtlasMapProbe.asi`. Distinct module names keep independent DMM entries.
The current SaveLoad-only build script does not build Categories mode.

To inspect/revalidate the installed executable and regenerate the current profile:

```powershell
$analysisPython = 'C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe'
& $analysisPython -B '.\work\map-mod-research\prepare_save_load_profile.py'
& $analysisPython -B '.\work\map-mod-research\disassemble_save_load.py' 0x17ef9c0 0x206ae30
```

These scripts inspect the on-disk PE only. They prepend `work/map-mod-research/deps`
for pefile/capstone. Disassembler uses PE exception/unwind function bounds when
available, otherwise a small fallback; thunk padding may decode as nonsense.
Follow the first real JMP target instead of treating padding as executable flow.

Other current tools: `find_save_load_references.py` for direct-call/RIP references;
`inspect_actor_links.py`, `inspect_actor_link_rtti.py` for exact RTTI tables;
`find_field_loading_writes.py` for decoded+c3 writes; `find_context_assignment.py`
and `find_context_d8.py` for bounded region references. These do not alter game
state. Earlier scripts and disassemblies remain under `previous/work/...`.

Package the three root files only, keeping license/README beside ASI:

```powershell
Compress-Archive -LiteralPath `
  'outputs/mods/native-save-detection/PywelAtlasSaveDetectionProbe.asi', `
  'outputs/mods/native-save-detection/SaveDetection-MinHook-LICENSE.txt', `
  'outputs/mods/native-save-detection/SaveDetection-README.md' `
  -DestinationPath 'outputs/mods/PywelAtlas-Save-Detection-Observation-v0.37.zip' -Force
```

For a changed version, update the source SESSION/READY strings, README, notes and
ZIP name consistently. Compile the final source again before packaging. Do not
claim installation or runtime validation from successful compilation.

The older marker build remains under `previous/outputs/tools/native-map/build.ps1
-Mode Categories`; it regenerates marker defaults and Bell identities from the
copied data JSON, compiles three native application sources and copies the MIT
license from previous/outputs/vendor/python. Its build script hardcodes the same
machine-specific Python/MSVC paths. Keep marker/observation build roots separate.

## 16. Read the live trace efficiently

Actual log:
`C:\Users\Thomas\AppData\Local\PywelAtlas\native-save-detection.log`.
Codex's execution sandbox can redirect `$env:LOCALAPPDATA` to a package sandbox
directory. That happened during this chat; the first attempted path did not exist.
Use the explicit actual path above or a verified shell known-folder result, not
an unexamined sandbox environment variable. The in-game mod uses SHGetFolderPathW.

First inspect headers/checkpoints/associations, not the entire noisy log:

```powershell
$tracePath = 'C:\Users\Thomas\AppData\Local\PywelAtlas\native-save-detection.log'
Select-String -LiteralPath $tracePath -Pattern `
  '^SESSION','^CHECKPOINT','^LOAD_CHAIN','^ACTOR_LINK','^STORAGE_ROOT'
```

Then extract the latest **matching version session**, preserving everything
through the current end, before detailed analysis. Do not delete/truncate the
live log. Every appended session has independent counters and pointer addresses.
Do not mix a v0.35 successful root with a v0.37 failed root capture, or compare
pointer values from different game processes as if they were stable identities.

When the pending v0.37 F7 is reported complete, inspect whether:

1. A v0.37 SESSION and READY exist and all eleven sites installed.
2. The expected fresh native load correlated, with supported slot and zero drops.
3. ACTOR_LINK records have exact client-child source and native valid wrapper.
4. Candidate manager is actually ServerUserActor, selected server child is the
   loaded child, and reciprocal ownership holds.
5. The relevant source equals the controller's current client child.
6. The association is after the current load, rather than stale across a restart.
7. Handshake/phase snapshots and F7 describe the same lifecycle generation.
8. A zero match is explained by actual missing/failed association or a cache/
   correlation limitation, not blamed on the user's completed steps.

If the resolver is not called or returns client-side objects, inspect the native
registry/TLS context and real returned type, and choose another observed native
relationship. Do not invoke loading/game functions experimentally just to create
a link. Do not guess that entity+60 or context+180 equals a slot or that low bits
can be masked to connect sides without evidence.

## 17. Intended implementation after the missing evidence

This is the direction to work toward, **not a claim that it already exists**:

1. Establish the actual native association and a load-generation/lifetime model.
2. Separate loaded save/world identity from transient death/menu/player-control
   state. The observed retry reused identity; a death screen did not unload it.
3. Bind the copied Steam account root to current storage lifecycle; validate
   exact account/slot paths under the known game-save root, including multiple
   account cases, without using newest-file heuristics.
4. Produce an immutable worker-owned selection `{generation, account, slot,
   source root, activation evidence}`. Game callbacks only publish bounded
   events. Clear stale worker progress at real identity changes.
5. Extend the existing Bell reader to use validated explicit account/slot rather
   than sole-account enumeration. Preserve read-only stable-copy/authentication
   and unsupported-schema behaviour.
6. Tag each asynchronous read result with its selection generation. If account,
   slot, storage context or load generation changes, discard old results.
7. Feed only explicit current-save Bell completion into the existing owned-marker
   creation/removal request path. Do not perform map mutations on a file worker.
8. Retain explicit selection as fallback if automatic evidence is unavailable;
   show uncertainty honestly. A fallback selection is not automatically detected.
9. Integrate into one ASI deliberately, with shared hook ownership and a single
   lifetime/state model. Do not enable the proof ASIs together as integration.
10. Only then expand beyond the synthetic chest/Hernand proof to real Bell
    markers, other verified collectible categories and separately verified
    minimap/Abyss/layer behaviour.

Do not request a long new manual sequence before completing the corresponding
code/static work. Do not ask the user to repeat completed observations merely
because an earlier probe assumption was wrong. The next pending v0.37 check is
already short and concrete.

## 18. Authority order and stale-document warnings

Prefer the current source/guard header plus this handoff and current runtime
trace interpretation. Next read `CURRENT-SAVE-DETECTION-NOTES.md`, then the
specific source/disassembly relevant to the question. Older architecture,
offset and README files contain useful exact implementation history but their
status sections can be stale: references to v0.33/five hooks, account unresolved,
RTTI unnamed, or death/autosave untested have been superseded as explained here.

Some historical Markdown has mojibake in punctuation. Do not silently turn a
garbled range into a new offset. Current tables/source and copied disassembly
give exact hex values. `HISTORICAL-NATIVE-OFFSETS.md` also incorrectly labels
some call instruction RVAs as “return”; use the call/return pairs in section8
and actual log `callerRva` when precision matters.

All local workspace files are available on the same Windows machine. If Claude
has only chat/file attachments and no local execution connector, upload this
handoff plus the transfer ZIP; do not claim it can directly inspect a C: path.
If Claude has filesystem/terminal access, point it at the extracted bundle or
the original current workspace. Do not submit raw saves or the game executable
merely to get it started.

The appendices and literal index follow or accompany this document so exact
bytes, Bell identity words and all source offsets transfer without relying on
conversation memory.

## Appendix A. Verbatim v0.37 entry guards

Exact copied source; keep array order aligned with callbacks.

```cpp
// Generated from the installed executable; fail closed on changed entries.
#pragma once
constexpr DWORD kLoadTimestamp = 1790086912u;
constexpr DWORD kLoadImageSize = 389722112u;
struct SaveLoadSite { uintptr_t rva; BYTE bytes[24]; };
constexpr SaveLoadSite kSaveLoadSites[] = {
    {0x186f570, {
        0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x74,
        0x24, 0x10, 0x48, 0x89, 0x7c, 0x24, 0x20, 0x44,
        0x89, 0x44, 0x24, 0x18, 0x55, 0x41, 0x54, 0x41,
    }},
    {0x2941020, {
        0x48, 0x89, 0x5c, 0x24, 0x08, 0x44, 0x89, 0x4c,
        0x24, 0x20, 0x4c, 0x89, 0x44, 0x24, 0x18, 0x55,
        0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56,
    }},
    {0x1042aaf0, {
        0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x6c,
        0x24, 0x18, 0x56, 0x57, 0x41, 0x54, 0x41, 0x56,
        0x41, 0x57, 0x48, 0x83, 0xec, 0x20, 0x45, 0x89,
    }},
    {0x206b750, {
        0x48, 0x89, 0x5c, 0x24, 0x20, 0x44, 0x88, 0x44,
        0x24, 0x18, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41,
        0x55, 0x41, 0x56, 0x41, 0x57, 0x48, 0x8b, 0xec,
    }},
    {0xef62160, {
        0x48, 0x89, 0x5c, 0x24, 0x20, 0x48, 0x89, 0x54,
        0x24, 0x10, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41,
        0x55, 0x41, 0x56, 0x41, 0x57, 0x48, 0x83, 0xec,
    }},
    {0x219d7f0, {
        0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x74,
        0x24, 0x18, 0x48, 0x89, 0x7c, 0x24, 0x20, 0x55,
        0x41, 0x54, 0x41, 0x55, 0x41, 0x56, 0x41, 0x57,
    }},
    {0x77a220, {
        0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x6c,
        0x24, 0x10, 0x48, 0x89, 0x74, 0x24, 0x18, 0x57,
        0x48, 0x83, 0xec, 0x60, 0x48, 0x8b, 0xf2, 0x48,
    }},
    {0x28f82a0, {
        0x48, 0x8b, 0xc4, 0x48, 0x89, 0x58, 0x08, 0x4c,
        0x89, 0x48, 0x20, 0x4c, 0x89, 0x40, 0x18, 0x55,
        0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56,
    }},
    {0x294d5b0, {
        0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x74,
        0x24, 0x18, 0x48, 0x89, 0x7c, 0x24, 0x20, 0x55,
        0x41, 0x54, 0x41, 0x55, 0x41, 0x56, 0x41, 0x57,
    }},
    {0x7797f0, {
        0x48, 0x8b, 0xc4, 0x48, 0x89, 0x58, 0x10, 0x55,
        0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56,
        0x41, 0x57, 0x48, 0x8d, 0xa8, 0x38, 0xff, 0xff,
    }},
    {0x17ef9c0, {
        0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x74,
        0x24, 0x18, 0x48, 0x89, 0x7c, 0x24, 0x20, 0x48,
        0x89, 0x54, 0x24, 0x10, 0x55, 0x48, 0x8b, 0xec,
    }},
};

```

## Appendix B. Verbatim current hook declarations

```cpp
using ReadSave = void* (*)(void*, void*, unsigned, void*);
using ApplySave = void* (*)(void*, void*, uintptr_t, uintptr_t);
using LoadSave = void* (*)(void*, void*, uintptr_t, unsigned);
using CleanupContext = uintptr_t (*)(void*, void*, uintptr_t, uintptr_t);
using InitializeStorage = BYTE (*)(void*, void*, uintptr_t, uintptr_t);
using BeginFieldLoad = void* (*)(void*, void*, uintptr_t, uintptr_t, BYTE, uintptr_t);
using TransitionFieldSix = void* (*)(void*, void*, uintptr_t, uintptr_t, BYTE, BYTE);
using TransitionField = void* (*)(void*, void*, uintptr_t, uintptr_t);
using ResetClientLoading = BYTE (*)(void*, void*, uintptr_t, uintptr_t);
using UpdateLoadingController = void (*)(void*, float, uintptr_t, uintptr_t);
using ResolveGameplayActor = void* (*)(void*, void*, uintptr_t, uintptr_t);
```

## Appendix C. Verbatim eight-Bell identity table

```cpp
// Generated from verified outputs/data/bell-save-links.json.
#pragma once
struct BellLink { const char* id; const char* name; uint32_t uuid[4]; uint32_t keys[5]; };
constexpr BellLink kBellLinks[] = {
    {"mg:545680", "Calphade Bell", {198322616u, 1450447108u, 1461444668u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:549762", "Delesyia Bell", {237711481u, 1450447108u, 1461444668u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:549777", "Demeniss Bell", {1762851470u, 1450447103u, 3472670780u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:543894", "Hernand Bell", {1601869702u, 1450446765u, 1450142268u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:549990", "Pailune Bell", {1628590903u, 4279242700u, 164962784u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:545847", "Scholastone Bell", {222227931u, 1450447108u, 1461444668u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:549727", "Tommaso Bell", {1834274304u, 4279242700u, 164962784u, 0u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
    {"mg:549675", "Varnia Bell", {196626156u, 1450447106u, 1461444668u, 1u}, {1000115u, 1000116u, 1000117u, 1000118u, 1000119u}},
};

```

## Appendix D. Resolver TLS globals calculated from instructions

| Instruction | Next RVA | Displacement | Effective global RVA |
| --- | --- | --- | --- |
| 0x17efa77 MOV | 0x17efa7e | +0x5579a5a | `0x6d694d8` |
| 0x17efa82 CMOVNE | 0x17efa8a | +0x5579a56 | `0x6d694e0` |

These are native registry-root pointer globals selected through TLS byte+0x1ec. They are static lookup provenance, not a proven client-to-server binding by themselves. The current observer hooks the getter instead of traversing these globals directly.
