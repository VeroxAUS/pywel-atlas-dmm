"""Locate save/load names in the installed executable without running it.

What it does, in plain terms:
    Programs contain readable text mixed in with their machine code. This
    script reads the game executable as bytes, finds every run of 5 or more
    printable ASCII characters, and keeps the ones that look save/load
    related (e.g. "save slot", "load game", "slot%d", "save.save"). Each hit
    is reported with its RVA -- its position measured from the start of the
    program in memory -- which can then be fed to
    find_save_load_references.py to find the code that uses the string.

Reads: the installed game executable, read-only (never run).
Writes: save-load-strings.json next to this script, and prints
"<rva>: <text>" for each hit.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (expects pefile in a "deps" folder next to the script and a
hard-coded Steam install path on drive E:).
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0, str(ROOT / 'deps'))
# pefile parses the Windows "PE" .exe format (used here to turn file
# positions into RVAs).
import pefile

binary = Path('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe')
data = binary.read_bytes()
pe = pefile.PE(data=data, fast_load=True)
# Case-insensitive pattern; ".?" allows one optional separator character,
# so "save_slot", "saveslot" and "save slot" all match.
terms = re.compile(r'save.?slot|load.?game|load.?save|save.?game|save.?data|continue.?game|slot%d|save\.save|slotindex|loadedslot', re.I)
results = []
# [ -~] = any printable ASCII character (space through tilde).
for match in re.finditer(rb'[ -~]{5,}', data):
    value = match.group().decode('ascii')
    if len(value) < 400 and terms.search(value):
        results.append({'rva': hex(pe.get_rva_from_offset(match.start())), 'text': value})
(ROOT / 'save-load-strings.json').write_text(json.dumps(results, indent=2), encoding='utf-8')
for result in results:
    print(f"{result['rva']}: {result['text']}")
