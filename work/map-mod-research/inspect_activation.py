"""Survey on-disk lifecycle names and the confirmed gameplay-context vtable."""
import json
import re
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'deps'))
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
for table in (0x5b1e2b0, 0x5b257a8):
    col = struct.unpack('<Q', pe.get_data(table - 8, 8))[0] - base
    descriptor = struct.unpack('<I', pe.get_data(col + 12, 4))[0]
    print(hex(table), pe.get_string_at_rva(descriptor + 16).decode(errors='replace'))
    for offset in range(0x60, 0x190, 8):
        entry = struct.unpack('<Q', pe.get_data(table + offset, 8))[0] - base
        print(hex(offset), hex(entry))

names = []
pattern = re.compile(rb'(?:GamePlayState|GameState|LoadingState|EnterToField|InGameState)', re.I)
for match in re.finditer(rb'[\x20-\x7e]{8,200}\x00', pe.__data__):
    raw = match.group()[:-1]
    if pattern.search(raw):
        names.append({'rva': hex(pe.get_rva_from_offset(match.start())), 'text': raw.decode()})
(ROOT / 'activation-strings.json').write_text(json.dumps(names, indent=2), encoding='utf-8')
print(json.dumps(names, indent=2))
