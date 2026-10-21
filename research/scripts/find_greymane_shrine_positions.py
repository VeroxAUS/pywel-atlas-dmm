"""Find the exact world position of each Greymane Shrine in the game's level files.

What it does:
    The game places objects in the world through level files (.palevel).
    Every shrine has one interactive "temple" object,
    gimmick_graymane_temple_0002 (the object whose game data switches on the
    shrine's map icon, Gimmick_GreyManeTemple), with an altar
    (gimmick_graymane_altar_0001) a few metres away. This script reads every
    level file, lists each placed temple and altar with its world position,
    then pairs each temple with a shrine row from
    research/analysis/greymane-shrine-identity.json (made by
    find_greymane_shrines.py) by distance to the MapGenie point.
    Pairs further than 60 m apart are marked "check" for a person to review.

Key terms:
    PARC block - the wrapper the current level files use. The readable data
        starts 16 bytes into each block, and these files need pycrimson's
        "shared strings" option (this was why the reader failed before).
    world transform - per object: scale (3 numbers), rotation as a
        quaternion (4), position (3). A child object's position is relative
        to its parent, so it is rotated by the parent's rotation and added to
        the parent's position. (Checked against the Calphade Bell: this gives
        exactly its verified game position.)
    MapGenie point - converted to game X/Z with the formula fitted from the
        8 Bells (about 35 m accuracy, no height). Used only to pair, never as
        the marker position.

Reads:  the installed game's level packs (group 0015) through pycrimson in
        research/vendor/ (research-only, git-ignored), read-only;
        research/vendor/work/pack-files.txt (pack listing);
        research/analysis/greymane-shrine-identity.json
Writes: research/analysis/greymane-shrine-positions.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_greymane_shrine_positions.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
TEMPLE = "gimmick_graymane_temple_0002"
ALTAR = "gimmick_graymane_altar_0001"
CHECK_DISTANCE = 60.0

# Temple objects the user checked in game that are NOT one of the 12
# collectible shrines (UUID words -> what the user saw). 2026-10-22: the
# 12th temple sits in Pailune city; the user judged it a shrine-looking
# structure, not the Kingshield Mountains Northern Shrine.
NOT_A_SHRINE = {
    (4113845946, 1450447032, 1681732668, 0): "shrine-looking structure in Pailune city (user check 2026-10-22)",
}
# Shrines with no temple object, placed from a user in-game check instead.
# Kingshield Mountains Northern Shrine: the user teleported to the th.gl point
# (-8784, -1487) and confirmed the shrine is there (2026-10-22). Height is
# where the player stood after landing there (667.79). The level files show
# only a Greymane wood totem 4 m away, no temple object.
USER_CONFIRMED = {
    "Kingshield Mountains Northern Shrine": [-8784.0, 667.79, -1487.0],
}


def parse_level(data):
    """Return every top-level object in all PARC blocks of one level file."""
    objects = []
    for match in re.finditer(b"PARC", data):
        start = match.start() + 16
        # A readable block starts with the 0xFFFF reflection header marker.
        if data[start:start + 2] != b"\xff\xff":
            continue
        try:
            reader = EndianedBytesIO(data)
            reader.seek(start)
            objects += ReflectionParser(reader, has_shared_strings=True).objects
        except Exception:
            # Some blocks use types this reader does not know; they hold no
            # shrine objects in practice, so they are skipped, not guessed.
            continue
    return objects


def rotate(quaternion, vector):
    """Rotate a 3D vector by a unit quaternion (x, y, z, w)."""
    x, y, z, w = quaternion
    vx, vy, vz = vector
    cx, cy, cz = y * vz - z * vy, z * vx - x * vz, x * vy - y * vx
    dx, dy, dz = y * cz - z * cy, z * cx - x * cz, x * cy - y * cx
    return (vx + 2 * (w * cx + dx), vy + 2 * (w * cy + dy), vz + 2 * (w * cz + dz))


def placed_objects(objects):
    """Yield (prefab, uuid, world position) for every object and child."""
    def walk(item, parent):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = transform[3:7], transform[7:10]
            if parent is None:
                world = (tuple(position), tuple(rotation))
            else:
                offset = rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), parent[1])
        if world:
            yield str(item.get("__pycr_type__")), item.get("_sceneObjectUuid"), world[0]
        for child in item.get("_childSceneObjects") or []:
            yield from walk(child, world)

    for item in objects:
        if isinstance(item, dict):
            yield from walk(item, None)


def mapgenie_to_game(lat, lng):
    """Convert a MapGenie grid point to approximate game (x, z)."""
    return (lng + 0.40246) / 4.1456e-5, (lat - 0.77890) / 4.1373e-5


def main():
    """Scan all levels, pair temples with shrine rows and write the JSON."""
    listing = (VENDOR / "work" / "pack-files.txt").read_text(encoding="utf-8").splitlines()
    levels = [line.split(" ", 1)[1] for line in listing if line.endswith(".palevel")]
    context = PackageContext(GAME, pack_group_whitelist=["0015"])

    temples, altars = [], []
    for path in levels:
        data = context.get_file(path)
        # Cheap byte check first; only matching files are fully parsed.
        if b"graymane_temple_" not in data and b"graymane_altar_" not in data:
            continue
        for prefab, uuid, position in placed_objects(parse_level(data)):
            row = {"prefab": prefab, "uuid": uuid, "position": list(position), "level": path}
            if TEMPLE in prefab:
                temples.append(row)
            elif ALTAR in prefab:
                altars.append(row)
    print(f"{len(temples)} temples, {len(altars)} altars")
    for temple in temples:
        note = NOT_A_SHRINE.get(tuple(temple["uuid"] or ()))
        if note:
            print(f'excluded temple at {[round(v, 1) for v in temple["position"]]}: {note}')
    temples = [t for t in temples if tuple(t["uuid"] or ()) not in NOT_A_SHRINE]

    identity = json.loads((ROOT / "research" / "analysis" / "greymane-shrine-identity.json").read_text())
    shrines = identity["shrines"]
    # User-confirmed shrines take their checked position and are not paired
    # with a temple object.
    for shrine in shrines:
        if shrine["poiName"] in USER_CONFIRMED:
            x, z = mapgenie_to_game(shrine["mapLat"], shrine["mapLng"])
            position = USER_CONFIRMED[shrine["poiName"]]
            shrine.update(gamePosition=position, positionSource="user in-game check",
                          mapGenieDistance=round(math.hypot(position[0] - x, position[2] - z), 1),
                          positionMatch="ok")

    # Pair greedily by distance: closest temple/shrine pairs first.
    pairs = []
    for t_index, temple in enumerate(temples):
        for s_index, shrine in enumerate(shrines):
            if shrine["poiName"] in USER_CONFIRMED:
                continue
            x, z = mapgenie_to_game(shrine["mapLat"], shrine["mapLng"])
            distance = math.hypot(temple["position"][0] - x, temple["position"][2] - z)
            pairs.append((distance, t_index, s_index))
    used_temples, used_shrines = set(), set()
    for distance, t_index, s_index in sorted(pairs):
        if t_index in used_temples or s_index in used_shrines:
            continue
        used_temples.add(t_index)
        used_shrines.add(s_index)
        temple = temples[t_index]
        nearest_altar = min(altars, key=lambda a: math.dist(a["position"], temple["position"]))
        shrines[s_index].update(
            templeUuid=temple["uuid"],
            gamePosition=[round(v, 4) for v in temple["position"]],
            positionSource="temple object in the level files",
            templeLevel=temple["level"],
            altarUuid=nearest_altar["uuid"],
            altarDistance=round(math.dist(nearest_altar["position"], temple["position"]), 1),
            mapGenieDistance=round(distance, 1),
            positionMatch="check" if distance > CHECK_DISTANCE else "ok",
        )

    for shrine in shrines:
        position = shrine.get("gamePosition")
        print(f'{shrine["poiName"]:38} {shrine["nodeName"]:32} '
              f'{[round(v, 1) for v in position] if position else None} '
              f'mapGenie {shrine.get("mapGenieDistance")} m altar {shrine.get("altarDistance")} m '
              f'[{shrine.get("positionMatch")}]')

    output = ROOT / "research" / "analysis" / "greymane-shrine-positions.json"
    output.write_text(json.dumps({"shrines": shrines}, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
