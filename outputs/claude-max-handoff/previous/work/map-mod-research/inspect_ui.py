"""Extract only map interface sources for native marker research.

The installed archives are opened read-only. Extracted game sources remain in
work rather than being included in the companion application's distribution.
"""

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "outputs/vendor/python"))

from pycrimson._context import PackageContext

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
DESTINATION = Path(__file__).resolve().parent
context = PackageContext(GAME, pack_group_whitelist=["0008", "0012"])
paths = []
table_names = []

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
