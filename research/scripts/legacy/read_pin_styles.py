"""Read the shared native pin stylesheet from installed archives, without edits."""
import sys
from pathlib import Path
root = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(root / 'outputs/vendor/python'))
from pycrimson._context import PackageContext
context = PackageContext(Path('E:/SteamLibrary/steamapps/common/Crimson Desert'), pack_group_whitelist=['0008', '0012'])
name = 'ui/xml/gamemain/template/pinmarkericon.css'
content = context.get_file(name)
if content is None:
    raise ValueError('Pin stylesheet not found')
destination = Path(__file__).resolve().parent / 'sources' / name
destination.parent.mkdir(parents=True, exist_ok=True)
destination.write_bytes(content)
print(content.decode('utf-8')[:14000])
