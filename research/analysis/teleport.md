# Teleport path for a test-only teleporter (static research)

Goal: find how the game itself moves the player to a new place (fast travel,
revive point, debug warp), so a separate test build can later call that same
native path. Nothing here has been run; no game, save or `src/` file was touched.

Labels:

- **[static]** read from disassembly of the installed exe (build 1790086912, RVAs).
- **[inference]** a reading of static evidence that still needs a runtime check.
- **[unknown]** not found statically.

Tool: `research/scripts/teleport_scan.py` (read-only; sub-commands `strings`,
`func`, `head`, `calls`, `texts`, `owners`, `vcalls`, plus all of
`player_position_scan.py`). Dumps: `research/disasm/teleport-<rva>.asm`.

## Short answer

1. **Best candidate: the player's transform component, virtual slot `0x198`
   (`0x9fe740`), called with move type `4` = "Teleport".** The component is
   `ClientTransformSyncActorComponent` (vtable `0x55bf248`), the same object
   at `[[actor+0x68]+0x1a0]` that the minimap reads the player position from.
   The game itself teleports actors exactly this way in several places (one
   idiom, four call sites, below). The call only *queues* the new position;
   the game's own movement update applies it later. It takes the actor lock
   itself. [static]
2. **The game's own "server says teleport" path** is the client handler of
   packet `TrocTrDoTeleportAck` (`0xb61640`), which calls `0x9fea40`. That
   adds a safe-ground search (`0x1efeb20`) and a "move session" update, then
   ends in the same queued set-position call with type 4. It needs a move
   session ID we cannot read yet, and the session setter is protected code.
   Second choice. [static]
3. **Fast travel and revive-point travel go through protected (obfuscated)
   code** (`0x2068340`, `0xb60150`, `0x9fcd40` jump into a virtual-machine
   section). Their inner logic cannot be read statically. The two cheat
   packets (`MovePlayerByCheat`, `MoveFieldCheat`) are compiled out: they
   parse their data and do nothing. [static]
4. Confidence: **medium** that slot `0x198` + type 4 moves the player the
   way the game's own gimmick/sequencer teleports do; **low** that this is
   what map fast travel uses (that likely adds a loading screen and field
   change). A one-run watch-only logging build should confirm before any call.

## 1. Strings, RTTI and names [static]

Packet classes (`Troc` = in-process client/server messages; `Req` = to the
server, `Ack` = to the client). Handler = vtable slot `0x10`.

| Class | Vtable | Handler | What it does |
| --- | --- | --- | --- |
| `TrocTrDoTeleportAck` | `0x560b810` | `0xb61640` | Reads `u32 actorKey, float3 pos, u64 moveSession`; finds actor; calls `0x9fea40`. Logs "TrDoTeleportDAck" on error. |
| `TrocTrMoveForceAck` | `0x560b830` | `0xb619c0` | Calls `0x9fed30` (forced move). |
| `TrocTrMoveFieldAck` | `0x560afd0` | `0xb87360` | Calls `0x9fa660` (field change; uses protected `0x2068340`). |
| `TrocTrSetMoveFieldAck` | `0x560af70` | `0xb882a0` | Calls `0x1795490`. |
| `TrocTrTeleportRevivePointAck` | `0x5609950` | `0xbcc190` | Reads `u32` revive key; calls `0x9c8290` (client notice, uses player lookup). |
| `TrocTrChangeMoveSessionIDAck` | `0x560b850` | `0xb61230` | Calls protected `0xb60150` (sets move session). |
| `TrocTrMovePlayerByCheatReq` | `0x5b24b38` | `0x29bf960` | Parses `float3 + u32`, then **does nothing** (stub). |
| `TrocTrMoveFieldCheatReq` | `0x5b24ab8` | `0x29bee80` | Parses, then **does nothing** (stub). |
| `TrocTrAITeleportReq` | `0x5b24f78` | `0x29841b0` | Server side, AI actors only: `0x2ac5bf0(serverComp=[[actor+0x68]+0x58], &res, pos, &session)`. |
| `TrocTrReviveReq` | `0x5b24498` | `0x298c070` | Server revive; uses protected `0x2068340`. |
| `TrocTrMoveActorReq` | `0x5b24cf8` | `0x2977e10` | Normal client-to-server movement sync. |

Other names:

- Move type enum (table built at `0x18d780`): `0 Physics, 1 Animation, 2 Curve,
  3 SideCurve, 4 Teleport, 5 SustainPrev, 6 MoveVelocity`. The set-position
  call takes this as its move-type byte.
- Reason enum at `0x1905c0`: `Dead, ChangeCharacter, Teleport, Meditation,
  MissionRestart, Position, Revive, ReviveLoading, AbyssArtifactItem, ...`
  (who uses it: [unknown]).
- `ItemUseData_TeleportRevivePoint` (vtable `0x59bf860`), `GimmickEventHandlerData_Teleport`
  (`0x59bb4b8`), `GameData_TimelineEvent_GimmickSetTeleportInfo`: data/serialize
  classes; their execution is elsewhere ([unknown]).
- UI strings: `UI_Modal_Teleport`, `UI_Worldmap_NonTeleportable_State`,
  `_MainPlayer`, `_PlayableTrigger` (the map refuses fast travel in some
  states), `selector-scriptobject-teleport`, `selector-scriptobject-revivepoint`.
  They only appear in big localisation-key tables, not in the travel logic.
- AI event names `OnMoveToPositionForQA`, `OnMoveToTestPosition`,
  `OnTeleportSuccess`, `OnAISystemDebug_TeleportDesc` (name-hash table in
  `0x17b6830`): AI events, not a player warp command.
- Data fields: `_useTeleport`, `_teleportOffsetTransform` (level gimmicks),
  `_reviveTransform`, `FieldReviveInfo` (revive points). Possible sources of
  known-good destinations; contents not checked here.
- No console/cheat command text for warping was found. `warping`
  (`0x5222a90`) and `_warpType` belong to cloud/graphics code.

## 2. The functions that move the player [static]

### 2a. Queued set-position: `0x9fca60` (not virtual)

```
void RequestSetPosition(ClientTransformSyncActorComponent* T,   // rcx
                        const PackedPos* pos,                    // rdx, 16 bytes
                        uint8_t moveType,                        // r8b  (4 = Teleport)
                        bool hasVelocity,                        // r9b  (games passes 0)
                        const float* velocity3,                  // [rsp+0x20] (game: constant zeros 0x5545e88)
                        uint8_t a6,                              // [rsp+0x28] -> T+0x5a1
                        uint8_t a7);                             // [rsp+0x30] -> T+0x5a2
struct PackedPos { float x, y, z; int16_t sectorX, sectorZ; };   // world X = sectorX*1000 + x
```

- Rejects NaN/inf coordinates. Uses 1000.0 at `0x5d736f4`.
- If a request of a higher move type is already pending it is ignored.
- Stores the request at `T+0x590` (pos), `T+0x5a0` (move type), `+0x580`
  (velocity), then wakes the actor (`[actor vtable+0x1b0](actor, 0, 1)`).
  So the move happens in the game's next movement update, not inside the call.
- About 30 direct callers; 13 pass type 4 (one is `0x9fea40`).

### 2b. Virtual wrappers on the same component (vtable `0x55bf248`)

| Slot | RVA | Arguments | Notes |
| --- | --- | --- | --- |
| `0x198` | `0x9fe740` | `(T, const PackedPos*, float yaw [xmm2], u8 moveType [r9b], u8 rotMode [rsp+0x20], u8 flag [rsp+0x28])` | Takes actor lock (`0x393650`), calls `0x9fca60(T,pos,type,0,zeros,flag,0)`, then yaw setter `0x9fcd40` (protected). |
| `0x1a0` | `0x9fe840` | same, but `r8 = const rotation*` instead of yaw | Rotation setter `0x9fce60`. |
| `0x1a8` | `0xa02960` | variant | Not used with type 4. |

The game's own idiom, identical at four sites (`0x175a5c9` in `0x1759eb0`
via slot `0x198`; `0x603522`, `0x204537b`, `0x28f8fc1` via slot `0x1a0`):

```
sx = (int16)trunc(X / 1000);  sz = (int16)trunc(Z / 1000);
pos = { X - sx*1000, Y (+offset), Z - sz*1000, sx, sz };
T   = [[actor + 0x68] + 0x1a0];
T->vtable[0x198](T, &pos, yaw, 4 /*Teleport*/, 5, 0);
```

What these four callers are is [unknown] (no strings; two are reached from
code near the server movement handlers).

### 2c. Server-ordered teleport: `0x9fea40` (only caller: `0xb61640`)

```
uint32_t* TeleportApply(ClientTransformSyncActorComponent* T, uint32_t* result,
                        const float* pos3, const uint64_t* moveSession);
```

Steps: get local user (`[0x6d69190]+0x30` -> `0x8b44e0`, fails if none);
set the move session (`0xb60150`, **protected**); build a ground query from
`pos3` (`0x1fe25c0`) and find a safe actor position (`0x1efeb20`); compose
with the parent transform when riding (`0x3933a0`/`0x50ea80`); then
`0x9fca60(..., type 4, ...)`. [inference] `pos3` is probably absolute world
coordinates (the query fills the sector form); confirm by logging.

## 3. Getting the pointers on the game thread [static]

- Player actor: `0x64f530(Handle* out)` -> `[0x6d69190]+0x30` -> `0x8b4570`.
  `out+8` = actor, `out+0x10` = valid byte. Release with `0x1434880(out)`.
  The minimap update `0xe13cf0` does exactly this at its start
  (`0xe13d67`) and releases at `0xe14b41`.
- Component: `T = [[actor+0x68]+0x1a0]`. Check `*(uint64*)T == base+0x55bf248`
  and slot `0x198` == `base+0x9fe740` before calling.
- Where to call from: inside an existing game-thread hook, after its original
  returns, while the handle is held. The minimap update hook (`0xe13cf0`,
  already planned for player position) is the natural place. Whether that is
  the same thread as the game's own teleports is [unknown]; see section 6.
- The world projection hook (`0xd94040`) receives the player actor in `r9`,
  but only while the map is open, and stored pointers must not be reused later.

First 24 bytes (guards; for the generic-looking prologues use 32-40 bytes):

```
0x9fe740 slot 0x198 : 48 89 5c 24 10 48 89 6c 24 18 48 89 74 24 20 57 48 83 ec 60 c5 f8 29 74
0x9fe840 slot 0x1a0 : 48 89 5c 24 10 48 89 6c 24 18 56 57 41 56 48 83 ec 50 41 0f b6 f1 4d 8b
0x9fca60 request    : 48 89 5c 24 08 48 89 6c 24 10 48 89 74 24 18 57 48 83 ec 30 0f bf 42 0e
0x9fea40 apply      : 48 89 5c 24 08 48 89 74 24 10 48 89 7c 24 18 55 41 56 41 57 48 8d ac 24
0xb61640 DoTeleport : 48 89 5c 24 08 55 56 57 41 54 41 55 41 56 41 57 48 8b ec 48 81 ec 10 01
0xb87360 MoveField  : 48 89 5c 24 08 55 56 57 41 54 41 55 41 56 41 57 48 8d ac 24 d0 ef ff ff
0x9fa660 MoveField  : 4c 89 4c 24 20 4c 89 44 24 18 48 89 54 24 10 48 89 4c 24 08 55 53 56 57
0xbcc190 RevivePt   : 48 89 5c 24 08 55 56 57 41 54 41 55 41 56 41 57 48 8d 6c 24 d9 48 81 ec
0xb619c0 MoveForce  : 48 89 5c 24 08 55 56 57 41 54 41 55 41 56 41 57 48 8d ac 24 10 ff ff ff
0x1efeb20 safe pos  : 48 89 5c 24 08 57 48 81 ec f0 01 00 00 49 8b f8 48 8b da c5 fa 10 82 9c
0x64f530 player     : 48 89 54 24 10 53 48 83 ec 30 48 8b da c7 44 24 20 00 00 00 00 48 8b 0d
```

Protected (start with `e9` into a VM section; do not hook):
`0xb60150` (move session), `0x9fcd40` (yaw), `0x2068340` (revive / field move).

## 4. Ranked approaches for the test-only teleporter

1. **Slot `0x198` with type 4** (`0x9fe740`). Same call shape as the game's
   own teleports; locks the actor; queued and applied by the game. Needs a
   packed position and a yaw (pass the current heading). No ground search:
   the destination Y must already be safe (use a known marker/Bell position
   plus a small lift, e.g. +1.5 m). Risk: the in-process server may not accept
   the jump (see risks).
2. **`0x9fea40` (DoTeleport apply)** with the *current* move session. Adds the
   game's safe-ground search. Blocked until a logging run shows where the
   current session value lives or what a real DoTeleport passes.
3. **`0x9fca60` directly** (no lock, no yaw). Only as a fallback if slot
   `0x198` misbehaves.
4. Not usable: cheat packets (stubs), MoveField / revive / revive-point item
   (protected, with loading flow), writing `T+0xb4` directly (the game reads
   it under a lock and relative to a parent when riding).

## 5. Risks

- **Server sync** [unknown]: the player is moved on the client component.
  The game normally sends client movement to the in-process server
  (`MoveActorReq`) with a move session ID; the server side may reject a large
  jump and pull the player back, or the save may keep the old place. The
  logging run and a short-hop first test will show this.
- **Streaming**: no loading screen. Far jumps may arrive before terrain and
  collision are loaded, so the player can fall through. Start with short
  jumps (under ~200 m), lift the target slightly, and wait for streaming
  before the next jump.
- **Mount / riding / climbing**: when riding, the position is relative to a
  parent. Only teleport on foot, not mounted, not climbing or gliding.
- **Combat, cutscenes, dialogue, death screen**: the map itself refuses fast
  travel in some states (`UI_Worldmap_NonTeleportable_*`). The test build
  should refuse too (at least: no cutscene, alive, on foot, no loading).
- **Abyss / altitude layers**: positions above `[0x6cde048]` are the Abyss
  layer; jumping between layers without the game's field change may leave
  the wrong layer/sky/streaming active. Keep jumps within one layer.
- **Autosave**: the game autosaves where the player lands. Use test saves only.
- **Threads**: the request at `T+0x5a0` is written without a lock in
  `0x9fca60`; slot `0x198` takes the actor lock. Call only on the thread the
  game uses for its own teleports (to confirm).
- **Protected code**: slot `0x198` calls the protected yaw setter. Calling it
  is normal game behaviour, but we cannot read what it checks.

## 6. One-run logging build (watch-only, before any call)

Hooks that only log and forward (preserve arguments, XMM, stack args, LastError):

| Hook | Log |
| --- | --- |
| `0x9fca60` | Only when `T` is the player's component or `moveType == 4`: T, move type, packed pos -> world pos, hasVelocity, a6, a7, **return address**, thread ID. |
| `0x9fe740` / `0x9fe840` | Same plus yaw / rotation, rotMode, return address, thread ID. |
| `0xb61640` + `0x9fea40` | actor key, pos3, **moveSession value**, result, thread ID. |
| `0xb87360`, `0xb882a0`, `0xbcc190`, `0xb619c0` | Entry/exit time, thread ID (which path fires). |
| `0xe13cf0` (minimap) | Thread ID; player position before/after each event above. |

User actions in that run: (1) map fast travel to a nearby and a far teleport
point; (2) the same while mounted (expect refusal); (3) die and revive at a
revive point; (4) use any gimmick/door teleport if one is near; (5) quit
normally.

The run should answer: which function fast travel and revive really reach;
whether they end in `0x9fca60` type 4 (and from which return address);
whether `pos3` is absolute world; what the move session looks like; and
whether the minimap thread equals the thread that issues game teleports.
Only then pick between approach 1 and 2 and ask the user before building
the caller.

## Open questions

- Does the in-process server accept a client-queued type-4 move, and does
  the next save keep it?
- Where is the current move session ID stored (setter is protected)?
- Which thread runs packet handlers and the four game teleport sites?
- What are the four game callers of slot `0x198`/`0x1a0` with type 4
  (gimmick teleport, sequencer, respawn)?
