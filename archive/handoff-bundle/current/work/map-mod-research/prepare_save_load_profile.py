"""Embed entry guards for eleven statically traced lifecycle observation sites."""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'deps'))
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
lines = [
    '// Generated from the installed executable; fail closed on changed entries.',
    '#pragma once',
    f'constexpr DWORD kLoadTimestamp = {pe.FILE_HEADER.TimeDateStamp}u;',
    f'constexpr DWORD kLoadImageSize = {pe.OPTIONAL_HEADER.SizeOfImage}u;',
    'struct SaveLoadSite { uintptr_t rva; BYTE bytes[24]; };',
    'constexpr SaveLoadSite kSaveLoadSites[] = {',
]
for address in (0x186f570, 0x2941020, 0x1042aaf0, 0x206b750, 0xef62160,
                0x219d7f0, 0x77a220, 0x28f82a0, 0x294d5b0, 0x7797f0, 0x17ef9c0):
    raw = pe.get_data(address, 24)
    lines.append(f'    {{0x{address:x}, {{')
    for start in range(0, len(raw), 8):
        lines.append('        ' + ', '.join(f'0x{value:02x}' for value in raw[start:start+8]) + ',')
    lines.append('    }},')
lines.append('};')
output = ROOT.parents[1] / 'outputs/tools/native-map/save-load-profile.h'
output.write_text('\n'.join(lines) + '\n', encoding='utf-8')
print(output)
