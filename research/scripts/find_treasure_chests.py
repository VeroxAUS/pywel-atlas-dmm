"""List every special treasure chest placed in the game's level files.

What it does:
    The game has two kinds of chest:
      - furniture chests in houses (dff_chest, box_chest, treasurebox_cabinet).
        Their loot refills on a timer, so they cannot be "completed";
      - special treasure boxes (object/cd_gimmick/00_common/treasurebox/...,
        plus the ocean, dungeon and temple chests). These match MapGenie's
        "Treasure Chest" / "Strongbox" category (251 points).
    This script reads the level files that mention a special box (listed by
    research/vendor/work/scan_chest_levels.py), finds each placed chest object
    with its unique ID (UUID) and world position, groups chests that stand
    within GROUP_DISTANCE of each other into one "spot", and pairs each spot
    with the nearest MapGenie chest point.
    A chest is one placed object whose prefab is a special box and whose
    parent object is not itself a box (so lids, dials and other parts of the
    same chest are not counted twice). Loose "_part" pieces are skipped too.
    The level list was widened on 2026-10-22: the first scan missed the
    fitnumber, dial, jigsaw_move and allbutton safes and itemboxes outside
    the six chest levels (for example the Count's owl strongbox in Hernand).

Key terms:
    prefab - a reusable object template; a level places copies of it. The
        parsed level names each placed copy by its prefab path.
    world transform - scale (3 numbers), rotation quaternion (4), position
        (3). A child's position is relative to its parent: it is rotated by
        the parent's rotation and added to the parent's position.
    MapGenie point - converted to game X/Z with the formula fitted from the 8
        Bells (about 35 m accuracy, no height). Used only for pairing.

Reads:  the installed game's level packs (group 0015) through pycrimson in
        research/vendor/ (research-only, git-ignored), read-only;
        research/vendor/work/chest-levels.txt; data/poi-data.js
Writes: research/analysis/treasure-chest-placements.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/find_treasure_chests.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
VENDOR = ROOT / "research" / "vendor"
sys.path.insert(0, str(VENDOR / "pycrimson" / "src"))

from bier.EndianedBinaryIO import EndianedBytesIO  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402
from pycrimson._reflection import ReflectionParser  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
# Prefab paths of special chests (not furniture chests).
CHEST_PREFAB = re.compile(r"/treasurebox/gimmick_treasurebox_(?!cabinet)|/treasurebox/gimmick_itembox_|"
                          r"gimmick_ocean_chest_|gimmick_dungeon_chest_|temple_chest_", re.IGNORECASE)
# Loose puzzle pieces (for example "allbutton_03_part_01", placed on their own
# in a quest level) are not chests.
PIECE_PREFAB = re.compile(r"_part(?:_\d+)?\.prefab$", re.IGNORECASE)
# The game's dedicated chest levels (2026-10-22 save test: chest B, "itembox_06"
# in TreasureBoxHernand, is recorded like a Bell). Always read, in addition to
# the levels found by the scan.
CHEST_LEVELS = [f"leveldata/bin__/rootlevel/{name}.palevel" for name in (
    "treasurebox", "treasureboxcrimsondesert", "treasureboxdelesyia",
    "treasureboxdemeniss", "treasureboxhernand", "treasureboxkweiden")]
GROUP_DISTANCE = 15.0  # Chests closer than this form one spot (a treasure pile).
PAIR_DISTANCE = 80.0  # Spots further than this from any MapGenie point are "unmatched".


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
            # Blocks with types this reader does not know are skipped, not guessed.
            continue
    return objects


def rotate(quaternion, vector):
    """Rotate a 3D vector by a unit quaternion (x, y, z, w)."""
    x, y, z, w = quaternion
    vx, vy, vz = vector
    cx, cy, cz = y * vz - z * vy, z * vx - x * vz, x * vy - y * vx
    dx, dy, dz = y * cz - z * cy, z * cx - x * cz, x * cy - y * cx
    return (vx + 2 * (w * cx + dx), vy + 2 * (w * cy + dy), vz + 2 * (w * cz + dz))


def multiply(a, b):
    """Combine two rotations (quaternion a, then b inside it)."""
    ax, ay, az, aw = a
    bx, by, bz, bw = b
    return (aw * bx + ax * bw + ay * bz - az * by,
            aw * by - ax * bz + ay * bw + az * bx,
            aw * bz + ax * by - ay * bx + az * bw,
            aw * bw - ax * bx - ay * by - az * bz)


def chests_in(objects):
    """Yield (prefab, uuid, world position) for each chest object (not its parts)."""
    def walk(item, parent, inside_chest):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), multiply(parent[1], rotation))
        prefab = str(item.get("__pycr_type__"))
        is_chest = bool(CHEST_PREFAB.search(prefab)) and not PIECE_PREFAB.search(prefab)
        if is_chest and not inside_chest and world:
            yield prefab.rsplit("/", 1)[-1], item.get("_sceneObjectUuid"), world[0]
        for child in item.get("_childSceneObjects") or []:
            yield from walk(child, world, inside_chest or is_chest)

    for item in objects:
        if isinstance(item, dict):
            yield from walk(item, None, False)


def mapgenie_to_game(lat, lng):
    """Convert a MapGenie grid point to approximate game (x, z)."""
    return (lng + 0.40246) / 4.1456e-5, (lat - 0.77890) / 4.1373e-5


def main():
    """Collect chests, group them into spots, pair spots with MapGenie and write JSON."""
    levels = [line.split(" ", 1)[0] for line in
              (VENDOR / "work" / "chest-levels.txt").read_text(encoding="utf-8").splitlines()
              if line and not line.startswith("ERROR")]
    levels = CHEST_LEVELS + [level for level in levels if level not in CHEST_LEVELS]
    context = PackageContext(GAME, pack_group_whitelist=["0015"])
    chests = []
    seen = set()
    for level in levels:
        for prefab, uuid, position in chests_in(parse_level(context.get_file(level))):
            key = tuple(uuid or ())
            # The same object can appear in more than one level file; keep one.
            if key in seen:
                continue
            seen.add(key)
            # Save rule seen in the 2026-10-22 test: chests in the dedicated
            # chest levels get a Bells'-list record (_isCompleted when opened);
            # other chests (chest A) only a field-object record.
            rule = "landmark" if level in CHEST_LEVELS else "field"
            chests.append({"prefab": prefab, "uuid": uuid, "level": level, "saveRule": rule,
                           "gamePosition": [round(v, 4) for v in position]})

    # Group chests closer than GROUP_DISTANCE (horizontal) into spots.
    spots = []
    for chest in chests:
        x, _, z = chest["gamePosition"]
        for spot in spots:
            sx, _, sz = spot["chests"][0]["gamePosition"]
            if math.hypot(x - sx, z - sz) < GROUP_DISTANCE:
                spot["chests"].append(chest)
                break
        else:
            spots.append({"chests": [chest]})

    # Pair each spot with the nearest MapGenie Treasure Chest point.
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    points = [p for p in data["locations"] if p.get("categoryId") == "mg-category:15041"]
    for spot in spots:
        x, _, z = spot["chests"][0]["gamePosition"]
        best = None
        for point in points:
            px, pz = mapgenie_to_game(point["mapLat"], point["mapLng"])
            distance = math.hypot(px - x, pz - z)
            if best is None or distance < best[0]:
                best = (distance, point)
        spot["mapGenieId"] = best[1]["id"]
        spot["mapGenieName"] = best[1]["name"]
        spot["mapGenieRegion"] = best[1].get("region")
        spot["mapGenieDistance"] = round(best[0], 1)
        spot["matched"] = best[0] <= PAIR_DISTANCE

    matched_points = Counter(s["mapGenieId"] for s in spots if s["matched"])
    summary = {
        "chestObjects": len(chests),
        "spots": len(spots),
        "spotsMatched": sum(1 for s in spots if s["matched"]),
        "mapGeniePoints": len(points),
        "mapGeniePointsMatched": len(matched_points),
        "mapGeniePointsWithSeveralSpots": sum(1 for n in matched_points.values() if n > 1),
        "chestsBySaveRule": dict(Counter(c["saveRule"] for c in chests)),
        "spotsMatchedBySaveRule": dict(Counter(s["chests"][0]["saveRule"] for s in spots if s["matched"])),
        "prefabs": dict(Counter(c["prefab"] for c in chests).most_common()),
    }
    output = {"summary": summary, "spots": spots,
              "unmatchedMapGenie": [p["id"] for p in points if p["id"] not in matched_points]}
    (ROOT / "research" / "analysis" / "treasure-chest-placements.json").write_text(
        json.dumps(output, indent=1) + "\n", encoding="utf-8")
    print(json.dumps(summary, indent=1))


if __name__ == "__main__":
    main()
