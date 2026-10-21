"""Embed entry guards for the five statically traced save lifecycle observation sites.

What it does, in plain terms:
    The native mod watches five places in the game's code that research
    linked to saving/loading. To make sure the mod only does this on the
    exact game build it was made for, this script generates a C++ header
    (save-load-profile.h) containing:
      - the executable's build timestamp and SizeOfImage (its size in memory),
      - for each of the five sites, its RVA and the first 24 bytes found
        there. ("Entry guard": the mod can compare these bytes at run time
        and stay inactive -- "fail closed" -- if they differ.)
    An RVA ("relative virtual address") is a position measured from the
    start of the program as loaded in memory.

Reads: the installed game executable, read-only.
Writes: outputs/tools/native-map/save-load-profile.h, two folders above this
script's folder, and prints that path.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (outputs/tools/native-map/ is an old folder -- see the path map in
README.md -- pefile is expected in a "deps" folder next to the script, and
the Steam path on drive E: is hard-coded).
"""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0, str(ROOT / 'deps'))
# pefile parses the Windows "PE" (Portable Executable) .exe format.
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
# Build the C++ header text line by line.
lines = [
    '// Generated from the installed executable; fail closed on changed entries.',
    '#pragma once',
    f'constexpr DWORD kLoadTimestamp = {pe.FILE_HEADER.TimeDateStamp}u;',
    f'constexpr DWORD kLoadImageSize = {pe.OPTIONAL_HEADER.SizeOfImage}u;',
    'struct SaveLoadSite { uintptr_t rva; BYTE bytes[24]; };',
    'constexpr SaveLoadSite kSaveLoadSites[] = {',
]
# The five site RVAs found by the static (read-only) tracing.
for address in (0x186f570, 0x2941020, 0x1042aaf0, 0x206b750, 0xef62160):
    raw = pe.get_data(address, 24)
    # "{{" in an f-string produces a literal "{".
    lines.append(f'    {{0x{address:x}, {{')
    # Write the 24 bytes as hex values, 8 per line.
    for start in range(0, len(raw), 8):
        lines.append('        ' + ', '.join(f'0x{value:02x}' for value in raw[start:start+8]) + ',')
    lines.append('    }},')
lines.append('};')
output = ROOT.parents[1] / 'outputs/tools/native-map/save-load-profile.h'
output.write_text('\n'.join(lines) + '\n', encoding='utf-8')
print(output)
