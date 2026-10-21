# Player position for radius-limited markers (static research)

Goal: find a cheap, safe way for the combined mod to know the player's live
world position, so markers can be shown only within a radius (for example
100 m), mainly on the minimap.

Labels used below:

- **[static]** read from disassembly of the installed exe (build 1790086912).
- **[observed]** seen in an existing runtime trace.
- **[hypothesis]** a reading that still needs a runtime check.

Tool: `research/scripts/player_position_scan.py` (read-only sub-commands:
`func`, `writes`, `reads`, `callers`, `pointers`, `refs`, `site`, `vtable`,
`floats`, `entries`, `raw`). Function dumps: `research/disasm/player-position-<rva>.asm`.
Existing dumps reused: `research/disasm/legacy/world-update-callback.asm`
(0xdabd10), `listener-deeb60.asm`, `listener-db8a60.asm`.

Note on the exe: section names are scrambled. Code lives in the executable
sections named `.rsrc`, `.xtls` and `.text`; vtables and constants in `.xdata`.
Scripts that pick "the .text section" by name miss almost all code.

## Short answer

1. **Recommended source (minimap): the minimap controller's own copy of the
   player position, float[3] at minimap controller `+0x330/+0x334/+0x338`.**
   The minimap update (vtable `0x5674e00` slot `0x118` = `0xe13cf0`) writes it
   every update from the player actor, in the same world coordinates as icon
   `+0xe0`. Reading it is one 12-byte `Read()` on the game's UI thread, right
   after that update returns. No native call and no pointer chain. It needs
   one new hook (on `0xe13cf0`), which is also the natural place to create and
   remove minimap markers.
2. **World map (already hooked):** the existing `ObserveWorldProjection` hook
   (`0xd94040`) already receives the player position. Its 5th argument
   (`optional`, today unused) points at the player's float[3], and its 6th
   (`value`) is the player's heading in degrees. This works only while the
   world map updates (in practice while it is open).
3. **Units: game units are metres** (strong static inference, see below), so
   "100 m" is `dx*dx + dz*dz <= 100*100` on X/Z, exactly as the game's own
   distance checks do.

## 1. The player map icon (ActorFocus) and who moves it

[observed] `pywel-atlas-v0.50/v0.51-map-marker.log`: type 0, category 0x43,
template `MapIcon_ActorFocus`, tag `{0xffffffffa0100001, kind 0xc}`, created
on both the world (`0x566ff50`) and minimap (`0x5674e00`) controllers at
about (-0.1, 1000.15, -0.4). After the slot-103 reload in v0.51 a new
ActorFocus appeared with key `0xffffffffa0100003` at (0, 1000, 0). So **the
tag key changes per world session** (same as the actor keys in
`docs/native-save-detection.md`), and the creation position is a placeholder.
The hired horse (`0xffffffffb0100002`, kind 0xc) was created at its real
position, so kind 0xc means "actor icon" keyed by the actor key.

[static] Icon position setter: **`0xdecaf0` `SetIconPosition(icon, const float* xyz)`**.
It ignores changes under 0.1 on every axis, writes `+0xe0/+0xe4/+0xe8`, sets
dirty byte `+0x1ef`, recomputes the icon's grid cell (`+0xec/+0xf0`, cell size
= runtime int `[0x6cad108]`) and tells the controller (`icon+0x28`, vtable
`+0x4d8`) when the cell changes. It has 21 direct callers; the important ones:

| Caller | What it does [static] |
| --- | --- |
| `0xdabd10` (world update) at `0xdadb31` | Repositions the icon held at **world controller `+0x5b8`** each update, from the actor whose id is at icon `+0x1c0`. `+0x5b8` is set in world creation `0xdb81e0` (at `0xdb86d4`) only for icon categories **0x43 or 0x42**, i.e. the ActorFocus icon. |
| `0xdf9bb0` (reached via callback thunk `0xe01790`, registered in `0xdf5490`) | Event handler "actor icon moved": `(controller, type or 0xffff, actor key, xyz*, heading*)`. World map: updates a per-key table and all icons of that key. Minimap: looks up `{key, kind 0xc}` via slot `0x548` and calls `0xdecaf0`. |
| `0xd94040` (world projection) | Per-icon placement during projection. |

Conclusion for goal 1: ActorFocus `+0xe0` does follow the player
(event-driven on both controllers, plus the explicit `+0x5b8` refresh in the
world update). But using it through `worldLookup` needs the per-session key
(`0xffffffff_a01000NN`), it is quantized to 0.1, and its creation value is a
placeholder. Reading world controller `+0x5b8 -> icon +0xe0` avoids the key,
but only refreshes while the world map updates. **Use it as a cross-check, not
as the main source.**

## 2. Where the game itself gets the player position

[static] Three map functions do the same thing:

```
0x64f530(out)            ; get player actor: [0x6d69190]+0x30 -> 0x8b4570
                         ;   0x8b4570: manager +0x58 (user actor) -> +0xd8 (controlled child)
lock   0x393df0(&guard, [actor+8])          ; spin lock on the actor
T    = [[actor+0x68]+0x1a0]                 ; transform component
0x4f8220(T, &p)          ; p = {float x,y,z; int16 sectorX, sectorZ}
                         ;   from T+0xb4..0xbc and T+0xc0/0xc2, composed with a
                         ;   parent transform (0x50ea80) unless 0x3933a0 says identity
world X = sectorX*1000 + p.x ; world Y = p.y ; world Z = sectorZ*1000 + p.z
heading = 0x17e9170(T)   ; radians; map uses (h + pi) * 57.29578 = degrees
unlock guard (vtable +0x20)
```

Constant 1000.0 at `0x5d736f4` [static]. The three users:

- **Minimap update `0xe13cf0`** (minimap vtable slot `0x118`, referenced only
  from `0x5674f18`): stores the result in **`+0x330/+0x334/+0x338`** when it
  moved by more than 0.001 (`0xe13eab`, `0xe13eb4`). It also sets byte
  `+0x569 = (playerY > [0x6cde048])` (the same altitude threshold the mod uses
  for world container choice), and recomputes the player grid cell
  (`+0x2a8/+0x2ac`), calling `0xdf4060` to stream minimap icons in an N x N cell
  window (N = runtime int `[0x6cad158]`). If no player actor exists it exits
  early (`0xe13d71`), leaving `+0x330` unchanged. Only other writers: the
  constructor `0xe04f00` (zero) and `0xe0ce20`, which is called from this same
  update with the same position.
- **World update `0xdabd10`** (called by world slot `0x118` `0xda8f60` only when
  flags `+0xace/+0xad6/+0xad7` and `0xda8dc0` allow): keeps the position in a
  local and passes `&position` and `heading` to every `0xd94040` call
  (`0xdadb60..0xdadb87`: `r9` = player actor or null, `[rsp+0x20]` =
  `&xyz`, `[rsp+0x28]` = heading). With no player it passes (0,0,0).
- **Shared `0xdee390`** (first call in both slot-`0x118` updates): uses the same
  position for a per-type proximity list (type record `+0x88` = radius).

[static] The game already filters by distance from this exact value:
`0xd9455b` in `0xd94040` compares `dx*dx + dz*dz` (icon `+0xe0/+0xe8` minus
player X/Z) with `R*R` (runtime float `[0x6cae808]`) for some special types,
and `0xd95209` compares player Y and icon Y with `[0x6cde048]` to match the
Pywel/Abyss layer. This proves the argument is the player position in the
same coordinate space as icon `+0xe0`.

[observed, indirect] Old counters (`research/traces/legacy/categories-v0.28-layer-reload-confirmed.log`):
`worldMapUpdateCalls` 649 to 5760 over a long session, about 6 projections per
update. That fits "the world update only runs while the map is open", so the
world-map sources cannot drive the minimap.

### Why not read the actor transform ourselves

Possible, but worse on every point [static]:

- It needs a 4-hop chain from a global (manager `+0x58` -> `+0xd8` -> `+0x68` ->
  `+0x1a0`) through objects that are rebuilt on load and title return.
- The game reads it under a spin lock (`0x393df0`); we could not take that
  lock without calling native code.
- `T+0xb4` is relative to a parent transform when `0x3933a0` finds a
  non-identity parent (likely when riding or standing on a moving object). The
  game composes it with `0x50ea80`; a raw read would be wrong then.
- Calling `0x4f8220` would be a new independent native call, which the
  project rules forbid.

The client/server child vtables from save detection (`0x5585c40`,
`0x5b1e2b0`) were not needed. Which actor `0x8b4570` returns (most likely the
ClientChildOnlyInGameActor of the controller) is [hypothesis].

## 3. Units: metres

[static, strong]

- Positions are packed as int16 1000-unit sectors plus a float offset. 1 km
  tiles are typical for metre-based engines.
- Gravity-like constants exist only as 9.8 / 9.81 / -9.8 / -9.81
  (`0x5d73450`, `0x5d73454`, `0x52df804`, `0x5d73a34`). There is no 980/981.
  `0x3c56e3a` computes `v*v / 9.8` (projectile/jump height form).
- Movement thresholds: icons move only after 0.1 (10 cm); the minimap after
  0.001 (1 mm).
- Data distances look like metres: Hernand Bell to the nearby campfire is
  245 m; the hired horse to that campfire is 28 m; Hernand to Calphade Bell is
  2.17 km (`data/bell-save-links.json` and v0.51 samples). Altitudes of about
  410 to 714 fit hills above sea level.

Use horizontal distance: `dx = markerX - playerX`, `dz = markerZ - playerZ`,
`dx*dx + dz*dz <= 100*100`. Add the game's own layer rule:
`(markerY > threshold) == (playerY > threshold)`, with the threshold at
`[0x6cde048]` (already read by `ResolveIndependentParent`) or the minimap's
`+0x569` byte. A runtime check against an in-game distance readout (for
example a waypoint distance) would turn this into observed evidence.

## 4. What minimap markers need compared with the world path

[static] The game creates every minimap icon the same way as world icons: the
listener route `0xdf88c0` calls the shared creator **`0xdeeb60`**
(`originalCreate`) once per controller. The v0.50/v0.51 traces show Bell,
campfire and other icons created on `0x5674e00`. So:

| Need | World today | Minimap |
| --- | --- | --- |
| Map-thread moment | hook `0xdabd10` (`ObserveWorldMapUpdate`) | **new hook `0xe13cf0`**, `uintptr_t(void* controller, float elapsed)` (RCX + XMM1, like `0xdabd10`; its first callee `0xdee390` reads only RCX). Guard bytes: `48 8b c4 48 89 58 08 55 56 57 41 54 41 55 41 56 41 57 48 8d a8 08 ff ff`. Check vtable `== imageBase + 0x5674e00`. |
| Create | `originalCreate(worldController, ...)` | the same call with the minimap controller. Slot `0x550` goes to `0xe08d70`. |
| Parent container | `ResolveIndependentParent` + `RouteWorldContainer` (hooks world constructor `0xdb3bd0`) | **Not used.** `0xe08d70` passes controller `+0x390/+0x398` to its own constructor `0xe0c2c0`; there is no altitude-based container selector. `RouteWorldContainer` never fires, so do not require `containerRouted` for minimap success. Layer is handled at display time (`0xe145c9` compares icon Y > threshold with `+0x569`). |
| Presentation | `ResolvePresentation(record)` | Same value; the record comes from the icon type table and does not depend on the controller. `0xe08d70` gives up if that presentation's first byte is 0. |
| Lookup | `worldLookup` `0xdb8a00` | `minimapLookup` `0xdeffa0` (already guarded and used). |
| Remove | `removeWorldIcon` `0xdb8a60` | minimap slot `0x558` = **`0xe09fc0`**, same ABI `(controller, WORD type, tag*, DWORD index)`. New guarded call site. |
| Timing | creation is immediate | `0xe08d70` may queue creation when runtime byte `[0x6cac438] == 1` (`0xe08dbb`), so the readback lookup may miss on the same update. Poll on later updates. |
| Culling | none by distance | The minimap already only activates icons in an N x N grid-cell window around the player (`0xdf4060`). The 100 m filter applies inside that window. |
| State | `bellMarkerPresent` etc. | Keep separate present/removal state per controller. The minimap is rebuilt on load independently. |

Unproven: whether type 226 (LevelTreasureBox) actually draws on the HUD
minimap. v0.15/v0.16 confirmed minimap object readback, but the user never
confirmed HUD minimap visibility. That needs a runtime check.

Radius policy: keep `wanted` from the save (worker), and let the minimap
thread AND it with "inside radius", using the position read in the same
update. Add hysteresis (for example create at <= 100 m, remove at > 110 m) so
a player standing near the edge does not cause a create/remove every frame.
The world map can keep showing all wanted markers.

## 5. Proposed minimal observation build

Diagnostic only, with no marker behaviour change:

1. Add one guarded hook on `0xe13cf0`. After calling the original, if the
   vtable is the minimap's, `Read(controller+0x330, 12)` and
   `Read(controller+0x569, 1)`. Publish {xyz, abyss byte, tick, thread id,
   update count} to a small snapshot (try-lock or sequence counter; never block
   the game thread). Keep no pointer.
2. In the existing `ObserveWorldProjection`: for the world controller,
   `Read(optional, 12)` and copy `value` (heading). Snapshot B.
3. In `ServiceBellMarkers` (world update): `Read(controller+0x5b8)`; if
   non-null, read icon `+0xde` type, `+0xc8` tag, `+0xe0` xyz and `+0x1c0`
   dword. Snapshot C (expect type 0, kind 0xc, key = player actor key).
4. Once: read runtime globals `[0x6cad108]` (cell size, int),
   `[0x6cad158]` (cell window, int), `[0x6cae808]` (native radius, float),
   `[0x6cde048]` (altitude threshold).
5. Worker: log at most once per second, and add to the F7 checkpoint:
   `PLAYER_POS minimap=(x,y,z) abyss=b ageMs=.. updates=.. tid=.. | world=(x,y,z) heading=.. tid=.. | focus type=.. key=.. xyz=.. actor=.. | nearestBell=<name> dist=<m>`.
6. User run: load a save, stand still, then walk about 100 m, ride a horse,
   open and close the world map, (if possible) set a waypoint and compare the
   game's distance readout with the logged distance, then title and reload.

What the log should confirm: the minimap position changes while walking and
stays put when standing still. It should match the world value and the
ActorFocus icon within 0.1 while the map is open, including while riding.
Both hooks should report the same thread id. The minimap update count should
keep rising with the map closed, the world update count should not, and
`abyss` should flip only in the Abyss.
