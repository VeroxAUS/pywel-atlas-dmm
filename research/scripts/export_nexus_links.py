"""Write the list of surface Abyss Nexuses the mod is built from (v0.79).

What it does:
    Takes the 213 Abyss Nexus objects of the game's landmark table
    (levelgimmicksceneobjectinfo, type key 1000001 "AbyssRuins_Field"), each
    in its own level AbyssRuins_<region>_<number>, finds the same object in
    that level file (read-only, from the game's packages) and takes its world
    position from there (the table's own position field does not hold one for
    these objects). Writes a small, stable data file with name, UUID,
    position, level and the nearest MapGenie Abyss Nexus point (within 80 m).
    Stops with an error if an object is missing from its level, a UUID
    repeats or the count is not 213.

Save rule (offline, from the user's save copies, 2026-10-22):
    - discovered: the Bells' list (DiscoveredLevelGimmickSceneObjectSaveData)
      holds a record with key 1000001 and this UUID, without flags;
    - activated: FieldSaveData._fieldGimmickSaveDataList holds a record for
      this UUID (gimmick "abyssruins_useartifact_01", reason 1, refill time
      "never", state 353047760, the same "opened" state as the strongboxes).
      In the saves, 3 of 5 discovered Nexuses have it, 2 have no field record.
    The mod hides a Nexus once it is activated.

Reads:  research/vendor/work/levelgimmicksceneobjectinfo_misc.base.staticinfomisc,
        research/vendor/work/staticinfo/ (via classify_chest_gates.py),
        the game's level files (pack group 0015), data/poi-data.js
Writes: data/abyss-nexus-links.json (overwritten)
Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/export_nexus_links.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import json
import math
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "scripts"))

import classify_chest_gates as gates  # noqa: E402
import find_treasure_chests as levels  # noqa: E402

NEXUS_KEY = 1000001  # levelgimmicksceneobjectinfo key "AbyssRuins_Field".
EXPECTED = 213
# Readable region per level code (the chest names use the same words).
REGIONS = {"Her": "Hernand", "Dem": "Demeniss", "Del": "Delesyia", "Kwe": "Kweiden", "CD": "Crimson Desert"}
MAPGENIE_NEXUS = "Abyss Nexus"
PAIR_DISTANCE = 80.0


def world_objects(objects):
    """Yield (scene-object UUID, world position) for every placed object in a level."""
    def walk(item, parent):
        transform = item.get("_worldTransform") or []
        world = parent
        if len(transform) == 10:
            rotation, position = tuple(transform[3:7]), tuple(transform[7:10])
            if parent is None:
                world = (position, rotation)
            else:
                offset = levels.rotate(parent[1], position)
                world = (tuple(p + o for p, o in zip(parent[0], offset)), levels.multiply(parent[1], rotation))
        uuid = item.get("_sceneObjectUuid")
        if uuid and world:
            yield list(uuid), world[0]
        for child in item.get("_childSceneObjects") or []:
            yield from walk(child, world)

    for item in objects:
        if isinstance(item, dict):
            yield from walk(item, None)


def mapgenie_points():
    """MapGenie Abyss Nexus points on the surface map, as (id, game x, game z)."""
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    data = json.loads(text[text.index("{"):text.rindex("}") + 1])
    points = []
    for point in data["locations"]:
        if point.get("category") == MAPGENIE_NEXUS and (point.get("world") or "").lower() != "abyss":
            x, z = levels.mapgenie_to_game(point["mapLat"], point["mapLng"])
            points.append((point["id"], x, z))
    return points


def main():
    """Find each Nexus in its level file and write the data file."""
    nexuses = [item for item in gates.gimmick_objects() if item["type"] == NEXUS_KEY]
    if len(nexuses) != EXPECTED:
        raise ValueError(f"Expected {EXPECTED} surface Abyss Nexuses, found {len(nexuses)}")
    context = levels.PackageContext(levels.GAME, pack_group_whitelist=["0015"])
    points = mapgenie_points()

    rows = []
    for item in sorted(nexuses, key=lambda entry: entry["level"].lower()):
        match = re.fullmatch(r"AbyssRuins_([A-Za-z]+)_(\d+)", item["level"])
        if match is None or match.group(1) not in REGIONS:
            raise ValueError(f"Unexpected Nexus level {item['level']}")
        data = context.get_file(f"leveldata/bin__/rootlevel/{item['level'].lower()}.palevel")
        # The Nexus object (gimmick_abyssruins_useartifact_01) has fourth UUID
        # number 0; its part (..._part) shares the first three with 1.
        found = [(uuid, position) for uuid, position in world_objects(levels.parse_level(data))
                 if uuid[:3] == item["uuid"] and len(uuid) == 4 and uuid[3] == 0]
        if len(found) != 1:
            raise ValueError(f"{item['level']}: {len(found)} objects with the Nexus UUID (expected 1)")
        uuid, position = found[0]
        position = [round(value, 4) for value in position]
        if any(abs(value) > 100000 for value in position):
            raise ValueError(f"{item['level']}: position {position} out of range")
        nearest = min(points, key=lambda point: math.hypot(point[1] - position[0], point[2] - position[2]))
        distance = math.hypot(nearest[1] - position[0], nearest[2] - position[2])
        rows.append({
            "name": f"{REGIONS[match.group(1)]} Abyss Nexus {int(match.group(2))}",
            "uuid": uuid,
            "gamePosition": position,
            "level": item["level"].lower(),
            "mapGenieId": nearest[0] if distance <= PAIR_DISTANCE else None,
            "mapGenieDistance": round(distance, 1) if distance <= PAIR_DISTANCE else None,
        })
    if len({tuple(row["uuid"]) for row in rows}) != len(rows):
        raise ValueError("A Nexus UUID repeats")

    output = {
        "version": 1,
        "category": "Abyss Nexus (surface, AbyssRuins_Field)",
        "infoKey": NEXUS_KEY,
        "discoveredRule": "DiscoveredLevelGimmickSceneObjectSaveData record with infoKey 1000001 and this UUID",
        "activatedRule": "FieldSaveData._fieldGimmickSaveDataList record for this UUID with reason 1, reset never "
                         "and state 353047760 or 1537827618 (2255254665 = not yet)",
        "nativeIcon": {"type": 234, "templateType": 28866, "templateName": "MapIcon_Abyss_Ruins", "category": "0x20"},
        "locations": rows,
    }
    (ROOT / "data" / "abyss-nexus-links.json").write_text(json.dumps(output, indent=2) + "\n", encoding="utf-8")
    paired = sum(1 for row in rows if row["mapGenieId"])
    print(f"{len(rows)} Abyss Nexuses written ({paired} paired with a MapGenie point)")


if __name__ == "__main__":
    main()
