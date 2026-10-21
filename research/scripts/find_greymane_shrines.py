"""Link the 12 Greymane Shrines in the game's data to their MapGenie map points.

What it does:
    Reads three of the game's static data tables (already extracted with
    pycrimson into research/vendor/work/staticinfo/) and the MapGenie POI
    snapshot, then prints and saves one row per shrine:
      - the faction node: the game's record for the shrine (key, name, and its
        position in the table, which is also its position in the save's
        faction-node list);
      - the knowledge entry: the "you found this place" record that names the
        shrine (for example Knowledge_Node_NasRiver_GreyManeTemple) and stores
        the node key it belongs to;
      - the MapGenie POI whose name matches that knowledge name.
    Name matches that are not exact are marked "review" so a person checks them.
    It does not find positions: shrine positions are not in these tables.

Key terms:
    static table - the game keeps fixed data in pairs of files: a header
        (count, then key + offset per entry) and a body with the entries.
    faction node - a place the game tracks as part of its faction system;
        each shrine is one node with a "_Repair" stage and a "Ritual" step.

Reads:  research/vendor/work/staticinfo/{factionnode,knowledgeinfo}.staticinfo*
        data/poi-data.js
Writes: research/analysis/greymane-shrine-identity.json (overwritten)
Run:    python -B research/scripts/find_greymane_shrines.py
        (format interpretation adapted from LukeFZ/pycrimson, MIT; see
        third_party/python/pycrimson-LICENSE.txt)
"""
import json
import re
import struct
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
TABLES = ROOT / "research" / "vendor" / "work" / "staticinfo"

# Knowledge name (from the game) -> (MapGenie shrine name, match label).
# Names that match after removing spaces/punctuation need no entry.
# "close": same name, only spelled differently. "review": the names differ,
# so a person must confirm the pairing (the user asked to see these).
NAME_REVIEW = {
    "ShadowSlope": ("Shadow's Slope Shrine", "close"),
    "Kingshield_South": ("Kingshield Mountains Southern Shrine", "close"),
    "Kingshield_North": ("Kingshield Mountains Northern Shrine", "close"),
    "Rivercrest": ("Riverbed Terrace Shrine", "review"),
    "MistLake": ("Lake Mistveil Shrine", "review"),
}


def read_table(name):
    """Return [(key, entry bytes)] in header order for one static table."""
    header = (TABLES / f"{name}.staticinfoheader").read_bytes()
    body = (TABLES / f"{name}.staticinfobody").read_bytes()
    # Header: u16 count, then per entry a key and a u32 body offset. The key
    # size is whatever is left over, divided evenly (pycrimson's heuristic).
    count = int.from_bytes(header[:2], "little")
    key_size = (len(header) - 2 - 4 * count) // count
    entries = []
    for index in range(count):
        start = 2 + (key_size + 4) * index
        key = int.from_bytes(header[start:start + key_size], "little")
        offset = struct.unpack_from("<I", header, start + key_size)[0]
        entries.append((key, offset))
    # Each entry runs until the next entry's offset (or the end of the body).
    ends = sorted(offset for _, offset in entries) + [len(body)]
    following = {offset: ends[i + 1] for i, offset in enumerate(ends[:-1])}
    return [(key, body[offset:following[offset]]) for key, offset in entries]


def simplify(text):
    """Lower-case letters only, for comparing names like "SilverWolf"."""
    return re.sub(r"[^a-z]", "", text.lower())


def main():
    """Build the shrine rows, print them and write the JSON file."""
    nodes = read_table("factionnode")
    node_keys = {key for key, _ in nodes}

    # Shrine nodes: the entry starts with an 8-byte prefix, then the name.
    shrines = []
    for index, (key, entry) in enumerate(nodes):
        match = re.match(rb".{8}(Node_[A-Za-z_]*GreyManeTemple)\x00", entry, re.S)
        if match:
            shrines.append({"tableIndex": index, "nodeKey": key, "nodeName": match.group(1).decode()})

    # Knowledge entries that name a shrine, and which node key each stores.
    knowledge = {}
    for key, entry in read_table("knowledgeinfo"):
        match = re.search(rb"Knowledge_Node_([A-Za-z_]+?)_?GreyManeTemple\x00", entry)
        if not match:
            continue
        # Any 4-byte value after the name that is a known node key. Offset 0
        # is the knowledge key itself, so the search starts after the name.
        linked = {struct.unpack_from("<I", entry, i)[0] for i in range(match.end(), len(entry) - 3)}
        for node_key in linked & node_keys:
            knowledge.setdefault(node_key, []).append({"knowledgeKey": key, "name": match.group(1).decode()})

    # MapGenie Greymane Shrine POIs (category mg-category:15097).
    text = (ROOT / "data" / "poi-data.js").read_text(encoding="utf-8")
    pois = re.findall(
        r'"id": "(mg:\d+)",\s*"sourceId": \d+,\s*"name": "([^"]+)",\s*'
        r'"categoryId": "mg-category:15097".*?"region": "([^"]*)",\s*'
        r'"mapLat": ([-\d.]+),\s*"mapLng": ([-\d.]+)', text, re.S)

    rows = []
    for shrine in shrines:
        links = knowledge.get(shrine["nodeKey"], [])
        row = dict(shrine, knowledge=links, poiId=None, poiName=None, match="none")
        if len(links) == 1:
            name = links[0]["name"]
            wanted, label = NAME_REVIEW.get(name, (None, "name"))
            for poi_id, poi_name, region, lat, lng in pois:
                exact = simplify(poi_name).startswith(simplify(name))
                if poi_name == wanted or (wanted is None and exact):
                    row.update(poiId=poi_id, poiName=poi_name, region=region,
                               mapLat=float(lat), mapLng=float(lng), match=label)
        rows.append(row)

    used = [row["poiId"] for row in rows if row["poiId"]]
    for row in rows:
        print(f'{row["tableIndex"]} {row["nodeKey"]} {row["nodeName"]:34} '
              f'{",".join(k["name"] for k in row["knowledge"]):28} '
              f'{row["poiId"]} {row["poiName"]} [{row["match"]}]')
    print(f"{len(rows)} shrine nodes, {len(set(used))} distinct POIs, {len(pois)} MapGenie shrines")

    output = ROOT / "research" / "analysis" / "greymane-shrine-identity.json"
    output.write_text(json.dumps({"shrines": rows}, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
