"""List map/icon data tables from installed archives, read-only."""
import sys
from pathlib import Path
root = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(root / 'outputs/vendor/python'))
from pycrimson._context import PackageContext
context = PackageContext(Path('E:/SteamLibrary/steamapps/common/Crimson Desert'), pack_group_whitelist=['0008', '0012'])
for pack in context._packs.values():
    for directory, entries in pack.directories.items():
        for name in entries:
            path = f'{directory}/{name}'
            lower = path.lower()
            if lower.startswith('gamedata/') and any(word in lower for word in ('mapicon', 'worldmap', 'uiicon')):
                print(path)
