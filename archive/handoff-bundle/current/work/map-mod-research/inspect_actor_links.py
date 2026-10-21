"""Inspect supported actor RTTI/virtual getters without opening the game process."""
import struct
import sys
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'deps'))
import pefile
pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
lines = []
for table in (0x5585c40, 0x5b1e2b0, 0x5b257a8):
    col = struct.unpack('<Q', pe.get_data(table-8, 8))[0] - base
    descriptor = struct.unpack('<I', pe.get_data(col+12, 4))[0]
    lines.append(f'{table:#x} {pe.get_string_at_rva(descriptor+16).decode()}')
    for offset in (0xc0, 0x130, 0x140, 0x158, 0x178, 0x180):
        target = struct.unpack('<Q', pe.get_data(table+offset,8))[0]-base
        lines.append(f'virtual +{offset:x} -> {target:#x}')
(ROOT/'actor-link-layouts.txt').write_text('\n'.join(lines), encoding='utf-8')
print('\n'.join(lines))
