"""Embed entry guards for thirteen statically traced lifecycle observation sites.

What it does:
    Generates the C++ header src/save-detection/save-load-profile.h, which is
    compiled into the save-detection mod. For each of 13 function entry RVAs
    it copies the first 24 bytes found there in the installed executable,
    and it also records the executable's build timestamp and image size.

Why:
    The header's own first line says to "fail closed on changed entries": the
    copied bytes describe exactly what the studied build contains at each
    observed place, so the mod can tell when an update has changed that code.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    Guard bytes - a copy of the first bytes of game code at a place the mod
        observes, taken from the exact studied build. They act as a
        fingerprint: if a game update changes that code, the bytes no longer
        match.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: src/save-detection/save-load-profile.h (overwritten; the path is printed)
Run:    python -B research/scripts/prepare_save_load_profile.py
        (from the repository root)
"""
import sys
from pathlib import Path

# Folder containing this script (research/scripts). The bundled third-party
# libraries live next to it in research/deps, so add that folder to Python's
# import search path before importing them.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
# pefile reads the Windows executable file format ("PE").
import pefile

# Open the installed game executable for reading only. fast_load skips
# parsing tables that are not needed here.
pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
# Lines of the generated header. kLoadTimestamp and kLoadImageSize come from
# the PE headers and identify the build; each SaveLoadSite pairs an RVA with
# its 24 expected bytes.
lines = [
    '// Generated from the installed executable; fail closed on changed entries.',
    '#pragma once',
    f'constexpr DWORD kLoadTimestamp = {pe.FILE_HEADER.TimeDateStamp}u;',
    f'constexpr DWORD kLoadImageSize = {pe.OPTIONAL_HEADER.SizeOfImage}u;',
    'struct SaveLoadSite { uintptr_t rva; BYTE bytes[24]; };',
    'constexpr SaveLoadSite kSaveLoadSites[] = {',
]
# The 13 function entry RVAs to guard.
for address in (0x186f570, 0x2941020, 0x1042aaf0, 0x206b750, 0xef62160,
                0x219d7f0, 0x77a220, 0x28f82a0, 0x294d5b0, 0x7797f0, 0x17ef9c0,
                # ClientActorManager / ServerActorManager virtual +0x30 key lookups.
                0x8ae390, 0x2a82590):
    # Copy 24 bytes at that RVA and write them as C hex bytes, 8 per line.
    # ("{{" and "}}" inside the f-strings produce literal braces.)
    raw = pe.get_data(address, 24)
    lines.append(f'    {{0x{address:x}, {{')
    for start in range(0, len(raw), 8):
        lines.append('        ' + ', '.join(f'0x{value:02x}' for value in raw[start:start+8]) + ',')
    lines.append('    }},')
lines.append('};')
# ROOT.parents[1] is the repository root (research/scripts -> research -> root).
output = ROOT.parents[1] / 'src/save-detection/save-load-profile.h'
output.write_text('\n'.join(lines) + '\n', encoding='utf-8')
print(output)
