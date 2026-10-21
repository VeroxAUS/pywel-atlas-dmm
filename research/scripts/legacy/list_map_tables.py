"""List map/icon data tables from installed archives, read-only.

What it does, in plain terms:
    The game keeps its files inside packed archives, grouped into numbered
    "pack groups". Using the pycrimson archive reader, this script opens
    groups 0008 and 0012 and prints every file path under "gamedata/" whose
    path mentions "mapicon", "worldmap" or "uiicon" -- i.e. the game data
    tables that are likely to describe map icons.

Reads: the installed game archives under the Steam folder, read-only.
Writes: nothing on disk; prints matching paths.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve. It imports pycrimson from outputs/vendor/python two folders up,
and pycrimson is not part of this repository; the Steam path on drive E:
is hard-coded.
"""
import sys
from pathlib import Path
# Two folders above this script was the old workspace root.
root = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(root / 'outputs/vendor/python'))
# PackageContext: pycrimson's reader for the game's packed archives.
from pycrimson._context import PackageContext
context = PackageContext(Path('E:/SteamLibrary/steamapps/common/Crimson Desert'), pack_group_whitelist=['0008', '0012'])
# Visit every file name in every opened archive.
for pack in context._packs.values():
    for directory, entries in pack.directories.items():
        for name in entries:
            path = f'{directory}/{name}'
            lower = path.lower()
            if lower.startswith('gamedata/') and any(word in lower for word in ('mapicon', 'worldmap', 'uiicon')):
                print(path)
