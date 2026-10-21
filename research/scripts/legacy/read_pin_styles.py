"""Read the shared native pin stylesheet from installed archives, without edits.

What it does, in plain terms:
    The game's map pins are drawn by its UI layer, which is styled with CSS
    (the same styling language web pages use). Using the pycrimson archive
    reader, this script pulls one file, ui/xml/gamemain/template/pinmarkericon.css,
    out of the game's packed archives (pack groups 0008 and 0012), saves a
    copy and prints its start.

Reads: the installed game archives under the Steam folder, read-only.
Writes: sources/ui/xml/gamemain/template/pinmarkericon.css next to this
script; prints the first 14000 characters.

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
name = 'ui/xml/gamemain/template/pinmarkericon.css'
content = context.get_file(name)
if content is None:
    raise ValueError('Pin stylesheet not found')
# Save the copy under ./sources, keeping the archive's folder structure.
destination = Path(__file__).resolve().parent / 'sources' / name
destination.parent.mkdir(parents=True, exist_ok=True)
destination.write_bytes(content)
print(content.decode('utf-8')[:14000])
