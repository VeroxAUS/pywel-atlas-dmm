"""Extract only map interface sources for native marker research.

The installed archives are opened read-only. Extracted game sources remain in
work rather than being included in the companion application's distribution.

What it does, in plain terms:
    The game stores its files inside packed archives, grouped into numbered
    "pack groups". Using the pycrimson archive reader, this script opens only
    groups 0008 and 0012 and walks the list of every file they contain. It:
      - records every file whose path mentions "worldmap" or "minimap", or
        a "staticinfo" file whose name mentions icon, pin, gimmick or map;
      - copies the readable ones of those (scripts, HTML/CSS, XML and
        staticinfo data) out to a local "sources" folder for study;
      - separately lists every ".staticinfoheader" file (data table headers).

Reads: the installed game archives under the Steam folder, read-only.
Writes, next to this script: sources/<archive path> (extracted copies),
asset-paths.json (matching paths) and table-paths.json (all table headers).

Legacy: written for the original Codex workspace layout; paths may no longer
resolve. It imports pycrimson from outputs/vendor/python two folders up,
and pycrimson is not part of this repository; the Steam path on drive E:
is hard-coded.
"""

import json
import sys
from pathlib import Path

# Two folders above this script was the old workspace root.
ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "outputs/vendor/python"))

# PackageContext: pycrimson's reader for the game's packed archives.
from pycrimson._context import PackageContext

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
DESTINATION = Path(__file__).resolve().parent
# Only open the two pack groups that hold the UI and data files of interest.
context = PackageContext(GAME, pack_group_whitelist=["0008", "0012"])
paths = []
table_names = []

# Visit every file name in every opened archive.
for pack in context._packs.values():
    for directory, entries in pack.directories.items():
        for name in entries:
            path = f"{directory}/{name}"
            if path.endswith(".staticinfoheader"):
                table_names.append(path)
            if any(term in path.lower() for term in ("worldmap", "minimap")) or (
                "staticinfo" in path and any(term in name for term in ("icon", "pin", "gimmick", "map"))
            ):
                paths.append(path)
                # Extract only text-like source/data formats.
                if path.endswith((".js", ".html", ".thtml", ".css", ".xml", ".staticinfoheader", ".staticinfobody")):
                    content = context.get_file(path)
                    if content is not None:
                        target = DESTINATION / "sources" / path
                        target.parent.mkdir(parents=True, exist_ok=True)
                        target.write_bytes(content)

(DESTINATION / "asset-paths.json").write_text(
    json.dumps(paths, indent=2), encoding="utf-8"
)
print(f"Indexed {len(paths)} map interface assets.")
(DESTINATION / "table-paths.json").write_text(
    json.dumps(table_names, indent=2), encoding="utf-8"
)
