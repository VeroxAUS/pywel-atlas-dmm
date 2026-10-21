# Native offset handoff — Crimson Desert

This is the working index for the next investigator. The full chronological ledger of map and marker findings is [native-map-investigation.md](native-map-investigation.md); the loaded-save trace and current runtime evidence are in [native-save-detection.md](native-save-detection.md). Those two documents contain the complete historical RVA trail, including superseded probes. This handoff groups the offsets that matter and labels evidence quality so old experiments are not mistaken for current interfaces.

## Build identity and address conventions

All game RVAs below are for the installed Steam executable `CrimsonDesert.exe`, PE timestamp `1790086912`, image size `389722112`, SHA-256 `57da440d72f4db974f25fef047cf84c4dadd999a88cb2a3c5af4c9bd67fde1e7`. Runtime address = module base + RVA. These offsets are build-specific and must be revalidated against the executable before hooking. “Object + offset” means a byte offset within the indicated native object, not an RVA.

Game coordinate convention established by the marker/save work: X and Z are horizontal map axes; Y is altitude. The player tracker separately reads a position vector through a verified physics-instruction capture fallback; its signatures and build checks are documented in `outputs/docs/player-tracking.md` and `outputs/tools/player_bridge.py`.

## Save loading, lifecycle and account path

| Offset | Kind | What it does / evidence | Use and limits |
|---|---|---|---|
| `0x57db770`, `0x57db620` | string RVAs | “Start Load SaveSlot” / “End Load SaveSlot” labels referenced by the reader | Static labels used to locate the reader; not hook sites. |
| `0x186f570` | function RVA | Native save reader. ABI: RCX manager, RDX result storage, R8D requested slot, R9 save object. Validates slot ranges and calls lower read at `0x20688a0`; DWORD zero is success. | Hooked observation point; reliable requested slot for a read, but preparation reads also occur and do not alone mean that save is active. |
| `0x186f5d7–0x186f64a` | code range | Validates numeric slots `0–3`, `100–108`, `200–207`. | Static evidence of accepted values, not a user-facing slot mapping for every range. |
| `0x186f78a` | call site | Calls `0x20688a0`, passing requested slot as fifth argument. | Useful if a later probe needs the lower file-read boundary. |
| `0x186f898` | code location | Writes zero into result storage on the reader end path. | Reader result semantics. |
| `0x20688a0` | function RVA | Lower save file read routine. | Not currently hooked; investigate only if the current reader hook misses a real load path. |
| `0x2c17881` (return) / owner `0x2c17520` | caller RVA / function | Scans slot records and chooses a latest-timestamp candidate, consistent with Continue/title preparation. | Observed slot `1` preparation. Not trustworthy as loaded-slot identity. |
| `0x2c3e1ce` (return) / owner `0x2c3e030` | caller RVA / function | Explicit slot read path, followed by context construction and apply dispatch. | Observed manual slot loads `101 → 100 → 101`; browsing a slot is not proven to call this. |
| `0x2940ee0` | thunk RVA | Jump thunk to `0x1042aaf0`. | Entry into outer read/apply wrapper. |
| `0x1042aaf0` | function RVA | Outer load wrapper. RCX wrapper contains save object at `+8`; RDX result storage; R8 opaque context; R9D requested slot. Calls reader, then apply on reader success. | Currently the strongest scoped load correlation boundary. v0.35 hook requires same scope/object/slot, successful read+apply+outer return and no capture drops. Candidate remains diagnostic, not trusted active-save state. |
| `0x1042abf3` / `0x1042ac11` (returns) | call-return RVAs | Reader call / apply call return points within outer wrapper. | Logged for correlation and provenance. |
| `0x2941020` | function RVA | Applies deserialized data to save object. RCX wrapper has object at `+8`, RDX result storage. Entity lifecycle byte transitions during initialization. DWORD zero is final success. | Hooked; successful apply establishes load processing, but generic entity initialization does not prove playable world readiness. |
| `0x206b750` | function RVA | Context cleanup; removes context from manager components and clears manager `+0xd0` when equal. May destroy the object. | Hook logs pre-call object only. Never read object after original cleanup. Matching cleanup cleared v0.35 diagnostic candidate on return to title. Coverage of death/retry/other transitions is unproven. |
| `0xef62160` | function RVA | Steam save-storage initialization, reached through `0x235ab00`; returns BOOL in AL (`1` success). | Hooked to copy candidate root while handler is live. Root capture is confirmed; account selection/use is not yet wired. |
| `0x59840c0` | vtable RVA | Runtime RTTI/vtable for `GamePlaySaveDataFileHandler_Steam`. | Exact type guard before reading the storage root. Do not substitute the nearby base class vtable `0x5984168`. |
| `0x5b1e2b0`, `0x5b257a8` | runtime vtable RVAs | Observed on gameplay load object and title preparation object respectively. | Runtime observations only. Their RTTI/type and semantics still need resolving. |
| handler `+0x20` | object byte offset | Inline storage-root byte string (bounded by `0x108` bytes). | Read only after exact Steam handler vtable check; validate termination/control bytes. |
| handler `+0x128` | object byte offset | Optional heap pointer to storage-root string; copied with a 512-byte cap. | Same lifetime/type guard as above. |
| handler `+0x134` | object byte offset | Storage-root string length/capacity-related field observed in disassembly. | Not currently needed to identify the root; clarify exact field semantics before relying on it. |
| game entity `+0x5e` | object byte offset | WORD lifecycle bits sampled at hook entry/return. Gameplay object changed `1 → 0x10`; cleanup object showed `0x40`. | Raw diagnostic only. No bit has been named “world ready” or “active save”. |
| manager `+0xd0` | object byte offset | Cleanup clears this pointer when it equals the context being removed. | Strong candidate manager-current-context pointer, but not yet traced through load activation or alternative flows. |
| outer wrapper `+8` | wrapper byte offset | Pointer to the save entity/context passed to apply. | Confirmed by disassembly and v0.35 correlation. Valid only within the function/callback lifetime. |

v0.35 user-confirmed runtime: four checkpoints title → Continue/gameplay → title → Continue/gameplay; correlation was `0,1,0,1`; capture drops `0`; both loads requested slot `1`; cleanup of the prior matching object cleared the candidate; Steam root copied as `.../save/60062761`. Foreground confirmations were seen and dismissed. This did **not** test death/retry or explicit autosave reload. Full trace: `work/map-mod-research/save-detection-v0.35-continue-title-confirmed.log`.

Do not use object `+0x60` as slot identity. It previously produced unrelated large values. Do not infer loaded slot from newest file time. Automatic trust flags remain false.

## World map and minimap marker pipeline

| Offset | Kind | What it does / evidence | Use and limits |
|---|---|---|---|
| `0x566ff50` | vtable RVA | World-map controller vtable. | Type guard in native map probes. |
| `0x5674e00` | vtable RVA | Minimap controller vtable. | Type guard; differs from world map. |
| `0xda18f0` | function RVA | World-map controller method referencing icon templates. | Static research clue. |
| controller `+0x680` | controller offset | Action binding/list for right-click navigation destination. | Handler at `0xdbaba0` checks this and enters `0xdc32e0`; do not confuse with saved pin controls. |
| `0xdbaba0` | function RVA | Navigation destination action handler. | Leads to ground-position resolution. |
| `0xdc32e0` | function RVA | Selects icon position or computes map position, then submits float3. | Native destination path; user tested right-click navigation destination. |
| `0xdef810` (call at `0xdc352a`, return `0xdc352f`) | function/call/return RVAs | Receives XYZ pointer for the ground destination path. | Successful early marker redirection proof; captured Bell coords. |
| controller `+0x6e0` | controller offset | Saved personal-pin selector binding. | Separate from destination action; branch calls `0xd91ef0`. |
| `0xd91ef0` | function RVA | Saved pin action path. | Historical redirect experiments; not the final private-marker display mechanism. |
| `0xb84320` | function RVA | Personal-pin saved serializer/action path; key passed as 8 bytes. | Research showed this is a personal pin route; avoid for private collectible marker because it consumes personal-pin capacity. |
| `0xb9d9d0` | function RVA | `TrocTrCreateOrChangePinMarkerAck` response handler (RTTI vtable `0x560a9f0`); decodes key, XYZ, shape, colour. | Demonstrated how saved pin records update the pin group. Historical research only. |
| `0x495460` | function RVA | Searches/updates pin group by key; called from response handler and apply path. | Personal pin model path. |
| `0x4a47e0` (call at `0x4956ad`, return `0x4956b2`) | function/call/return RVAs | Applies/queues native display update with key, XYZ, style and group. | Display preview hook. Proven call path, but not the eventual successful custom marker path. |
| `0x4a9d00` | function RVA | Subscriber dispatcher for immediate/queued display updates. | Static traced. Queued caller return `0x7ec21a`; direct return `0x4a4835`. |
| `0xe016b0` → `0xdf88c0` | callback/function RVAs | Subscriber callback forwards to shared display function. | v0.9 listener callback observed; no visible offset until later direct update route was understood. |
| `0xdf88c0` | function RVA | Shared map/minimap icon presentation/update function; uses virtual slot `0x548` for lookup, `0x550` for creation. | Used by later native creation/display probe. |
| virtual slot `0x548` | vtable byte offset | Icon lookup virtual. World implementation `0xdb8a00`, minimap implementation/shared route `0xdeffa0`. | Runtime dispatch semantics established. |
| `0xdb8a00`, `0xdeffa0` | function RVAs | World-map and minimap icon lookup implementations. | Used to identify/read icon instances. |
| virtual slot `0x550` | vtable byte offset | Icon creation virtual. World implementation `0xdb81e0`; minimap implementation `0xe08d70`. | Static function mapping; world creation path was more directly proven. |
| `0xdb81e0`, `0xe08d70` | function RVAs | World and minimap creation implementations. | Candidate paths; minimap support needs separate verification for the current private type. |
| icon `+0xe0` | object byte offset | Float3 world XYZ in observed icon object. | Exact Bell position readback confirmed on world-map and minimap callback paths. `+0xe8` also participates in copied position/adjacent fields per initialization trace; keep the exact float3 at `+0xe0` as the confirmed field. |
| `0xd8a970` | function RVA | Initializes icon position by copying packed input XYZ (`+0x1c/+0x24` source layout) into icon `+0xe0/+0xe8`. | Static field-copy evidence. |
| `0xd94040`, `0xd91820` | function RVAs | Map projection / position update routines. | Relevant if calibrating placement or diagnosing post-creation repositioning. |
| `0xdec5b0` | function RVA | Maps shape to class/type information. | Used to resolve chest glyph class. |
| `0x12becb0` | function RVA | Registers native UTF-8 class/name; args include output DWORD*, name, mode `1`, flags `0x2ffff`. | Custom class name registration used in chest proof. |
| `0x35ca0a0` | function RVA | Appends native class list entry. | Observed during class registration. |
| `0xdeeb60` | function RVA | Shared map icon creation. Ten-argument ABI includes controller, type, tag, index, opaque scalar pointer, XYZ pointer, appearance pointer, byte flag and opaque data pointer. | Current private marker path. Creation is scoped to enclosing world-map update and fresh controller/container. |
| `0x537250` | function RVA | Native icon-type lookup. | Used to resolve cached icon type definitions. |
| `0x388e00` | function RVA | Looks up an icon/template record; record `+0x18` participates in secondary type identity. | Used to identify native chest templates. |
| icon-info `+0x20` | record byte offset | Secondary type used by shared creation lookup. | Evidence from `0xdeeb60` disassembly. |
| record `+0x18` | record byte offset | Value passed from matching record into creation/type resolution. | Validate table ownership and type before using. |
| type-info `+0x2c` | record byte offset | Category value (e.g. personal-pin categories `0x25/0x66`; native built-ins may use `0xffffffff`). | Category alone is not completion state or visibility. |
| `0x6d6e418`, `0x6d69a80` | global pointer RVAs | Icon-type and template-table pointer globals, derived from instructions at `0x537265` and `0x388e15`. | Read-only definition inspection; counts at table `+8`, data pointer at `+0x10` per notes. |
| table `+8`, `+0x10`, `+0x58` | table byte offsets | Cached-table count, data pointer, and array/record access as described by type-specific traces. | Do not apply one table’s layout to another without confirming table type. |
| `0xdabd10` | function RVA | Enclosing world-map update site used to schedule creation/removal safely. | Current probe defers scoped operations until this update has returned. |
| controller `+0x398`, `+0x3a0` | controller byte offsets | Fresh parent/controller container pointer and bounded count/container access for map-owned icons. | Current private-marker route validates the fresh parent container and count before creation/removal; details/provenance in chronological ledger. |
| icon `+0xc8`, `+0xde`, `+0xe0` | object byte offsets | Private tag pointer, type byte/word field, and XYZ field respectively, observed in created icon. | Runtime category probe confirms exact generated type/tag/position readback. Never retain a game object pointer on worker thread. |
| tag kind `0x15`, index `0` | values | Private tag discriminator/index for synthetic marker. | Private marker metadata, not an address. |
| private key `0x5059415400000002` | value | Stable mod-owned chest-proof key used to distinguish this object. | Not a game memory address; scoped identity for ownership/removal. |
| chest type `226`, secondary `28852` | values | Native `MapIcon_Gimmick_LevelTreasureBox`; opened type `227/229`, secondary `28855`. | Current chest glyph type lookup evidence. Older world-template notes mention type `36`, secondary `28684`, but that template is commented/older and should not be used in current route. |
| chest class IDs `0x154d9`, `0x154da` | runtime values | Registered world-map and minimap chest class IDs in v0.14. | One old class preview path; subsequent private marker route uses cached type/template construction. Do not assume these are final display IDs. |
| `0xdeca40` | function RVA | Changes three suppression bytes at icon `+0x1e8` (24-bit mask); calls icon virtual `+0x20/+0x28`. | Visibility lifecycle observation; helper callbacks do not cover all direct writes. |
| icon `+0x1e8..+0x1ea` | object byte offsets | Three bytes treated as a 24-bit visibility/suppression bitfield. | Observed behavior: updater directly clears bit 20 near `0xdb71b7`; capture transitions varied by event. Exact semantic names for every bit remain uncertain. |
| `0xdb5510`, `0xdb71b7` | function/code RVAs | World updater; direct clear of bit 20 near `0xdb71b7`. | Relevant to why icon creation alone may not make it visible. |
| `0xdb8a60` | function RVA | Native icon removal by controller, WORD type, tag pointer, DWORD index. | Current private marker cleanup route; only removes owned scoped object. |
| `0xdb83ae`, `0xdb8371`, `0xdb84a4–0xdb84ed` | function/site RVAs | Altitude/container-selection logic and constructor stack arguments. | Parent altitude/container selection can affect layer visibility. Exact semantics retained in ledger; required when adding Abyss-specific support. |
| `0x64f570` | function RVA | Resolves a metadata pointer (`+0x1c0`) used by one container/projection route. | Static path; not a general coordinate API. |
| metadata `+0x2a`, `+0xb0`, `+0xb7`, `+0x1c0` | metadata byte offsets | Type/container-selection fields, presence flag and resolved metadata pointer described around v0.27. | Names/meaning must be revisited in the ledger before reuse; type-specific, not universal struct offsets. |
| updater return sites `0xe09c0b`, `0xe09c35`, `0xdba72e` | return RVAs | Observed suppression events: clear bit 13, set bit 17, clear bit 0 respectively. | Observed transitions only; exact gameplay semantics not established. |
| `0xd92930` | function RVA | Personal-marker count/update branch called for categories `0x25` and `0x66`. | Supports that private chest category `0xffffffff` avoids personal pin count. Not itself proof of no serialization. User runtime confirmed displayed personal-pin count unchanged. |
| category gate sites `0xd91f8f`, `0xdb5c5a`, `0xdb5eeb`, `0xdb7ec9`, `0xdb9738`, `0xdee9f2` | code RVAs | Static checks for personal categories `0x25/0x66`. | Diagnostic context only; do not label unknown category values as collectible state. |

The private chest route is user-confirmed: Pywel only; does not consume a personal pin slot; F6/F10 repeatedly create/remove it; JSON coordinates move it; completed Hernand Bell causes removal and blocks recreation. A first successful visual marker appeared after zoom in an earlier route; current scoped create/remove behavior is confirmed. Abyss icon-layer behavior is not confirmed for the current route.

## Pin and icon data values (not addresses)

These values frequently appear beside RVAs but are enum/type/data IDs, not offsets:

| Value | Meaning / caution |
|---|---|
| Native pin type `1`, category `0x25`, tag byte `0x15` | Ordinary personal marker. |
| Trace pin type `2`, category `0x66` | Personal trace marker. |
| Type `360`, name `MapIcon_Gimmick_Bell_01`; type `336`, campfire | Cached native type data; category `0xffffffff` sentinel. |
| Type `234`, `MapIcon_Abyss_Ruins`, category `0x20` | Existing Abyss icon type. |
| Type `453` / `456` | Shop icon types shown in ledger (unknown shop / quest shop). |
| Type `529` | `MapIcon_StageFog`. |
| Chest type `226/228` | Closed treasure box current pair; `227/229` opened pair; pairings by region/type must be checked in source. |
| Bell XYZ `[-10702.4970703125, 631.1273193359375, -3833.85888671875]` | Hernand Bell location, with axis convention above. Synthetic proof chest historically at X+200, then user-editable JSON coordinates. |
| Display preview X+200 | Temporary display-only offset used to isolate a glyph during old preview experiments; not a game coordinate correction and not active marker placement. |

## Probe and UI stack offsets that are not game offsets

The hook capture structures also have C++ `offsetof` values asserted in `NativeMapProbe.cpp` and `NativeMapPreview.cpp` (e.g. `Capture.guard=16`, `caller=24`, `pinKey=32`, `placementSerial=44`; `DisplayState.caller=16`, `key=24`, `position=32`, `group=52`, `previewX=56`, `lastCaller=64`, `queuedCaller=96`, `previewPosition=104`, `previewShape=116`, `dispatchCalls=120`). These describe our probe's own memory layout, **not game structures**. Stack scratch values such as `RBP-0x41`, `RBP-0x19`, `RSP+0x28`, and thunk scratch `+0x70` are call-site-specific and only valid with the exact guarded calling path. They are preserved in the chronological ledger for historical hooks.

## What to probe next

In priority order:

1. **Active world / playable boundary.** Resolve RTTI and vtables `0x5b1e2b0` (gameplay object) and `0x5b257a8` (title preparation object). Trace manager `+0xd0` writes/reads around successful Continue and title cleanup. Identify a world/session state transition correlated with player control and invalidated on title, without assigning meaning to lifecycle `+0x5e` bits from a single pair of captures. Prefer a pointer or state that survives while gameplay is active and clears on title.
2. **Death, retry, reload.** Reuse the existing v0.35 five-hook ASI if its log can distinguish `0x1042aaf0` load scope, `0x206b750` cleanup and storage root; capture a death/retry or explicit autosave reload checkpoint and inspect all events. Add a hook only when evidence shows an uncovered path. Do not repeat Continue/title; it already passed.
3. **Account + slot identity.** Determine when/how the Steam root handler is initialized relative to each read. Validate normalized root against the stable save root and bind it to the *same correlated outer load scope*. Then prove requested slot for Continue, explicit manual load and autosave paths. Keep `automaticLoadedSaveTrusted=false` until these relationships are observed.
4. **Current-save handoff to the Bell reader.** Only after active boundary and account/slot agreement are established, call the existing read-only `ReadSelectedBellSave` on stable copies for the matched root/slot. Clear stale progress immediately when the active context is invalidated or identity changes. Preserve the no-write rule for game saves.
5. **Marker lifetime and real categories.** After selection is trustworthy, apply confirmed completion to existing private-marker ownership/removal. Expand from Bell only with exact save UUID/type/completion evidence. Then inspect the icon refresh and layer/container route for Abyss; `0xdb83ae` altitude/container selection and controller differences are likely relevant.
6. **Player position and region.** For integrated in-game display, identify an in-process player/entity transform and region/layer state. The external tracker proves a physics capture path for its matched build, but its signatures are not an in-game mod API. The in-game mod needs safe, build-guarded access to position, facing, region, and player lifetime.
7. **Map UX offsets.** If the goal expands to native category filters or labels, find the UI-owned category list, filter-state model, localized name source and minimap/world-map refresh contract. Existing creation/removal and cached icon template lookup do not expose those UX controls.

## Safety and evidence rules for the next investigator

- Never write to game saves. Read stable copies only.
- Never infer completion from proximity or a missing/failed read.
- Preserve original game function ABI/arguments/return values and LastError in hooks.
- Capture values synchronously with bounded self-process reads; do not dereference retained game pointers on a worker thread or after cleanup.
- Keep observation-only builds separate from marker builds and use distinct ASI/package names.
- Regenerate and verify signature guards against the exact executable before installation. Current site guards live in `outputs/tools/native-map/save-load-profile.h`, `category-profile.h`, `inspect-profile.h` and `display-profile.h`.
- No tests were added/run for the current work. User-run game sequences are the runtime evidence; label static inference, runtime capture and user-confirmed visual behavior separately.

## Authoritative project references

- `outputs/docs/native-save-detection.md` — current save-load offset evidence, v0.35 trace interpretation and open questions.
- `outputs/docs/native-map-investigation.md` — complete chronological marker and world-map/minimap offset history, including superseded routes.
- `outputs/tools/native-map/NativeSaveLoadProbe.cpp` — current five-hook observation implementation and structure offsets.
- `outputs/tools/native-map/NativeMapCategoryProbe.cpp` — scoped private marker create/remove and type/container guards.
- `outputs/tools/native-map/NativeSaveReader.cpp` / `.h` — native read-only Bell parser and selected-slot interface.
- `outputs/docs/player-tracking.md` and `outputs/tools/player_bridge.py` — desktop tracker source and position capture method.
- `work/map-mod-research/save-detection-v0.35-continue-title-confirmed.log` — latest complete user-confirmed runtime trace.
