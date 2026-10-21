"""Locate save/load names in the installed executable without running it."""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'deps'))
import pefile

binary = Path('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe')
data = binary.read_bytes()
pe = pefile.PE(data=data, fast_load=True)
terms = re.compile(r'save.?slot|load.?game|load.?save|save.?game|save.?data|continue.?game|slot%d|save\.save|slotindex|loadedslot', re.I)
results = []
for match in re.finditer(rb'[ -~]{5,}', data):
    value = match.group().decode('ascii')
    if len(value) < 400 and terms.search(value):
        results.append({'rva': hex(pe.get_rva_from_offset(match.start())), 'text': value})
(ROOT / 'save-load-strings.json').write_text(json.dumps(results, indent=2), encoding='utf-8')
for result in results:
    print(f"{result['rva']}: {result['text']}")
