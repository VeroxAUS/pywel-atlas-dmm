"""Inspect supported actor RTTI/virtual getters without opening the game process.

What it does:
    For three known vtables (RVAs 0x5585c40, 0x5b1e2b0 and 0x5b257a8) it looks
    up the C++ class name through RTTI and lists the functions stored in the
    vtable slots at offsets 0xc0, 0x130, 0x140, 0x158, 0x178 and 0x180 (the
    virtual getters this research is interested in). It only reads the
    executable file; the game is not started or modified.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    RTTI ("run-time type information") - records the Microsoft C++ compiler
        (MSVC) stores in the executable so the program can identify an
        object's class while running. They include each class name as text
        such as ".?AVClassName@namespace@@".
    vtable ("virtual function table") - a list of function addresses shared
        by all objects of one C++ class; each 8-byte entry is a "slot". A
        class's vtable shows which functions implement its behaviour.
    Type descriptor - the RTTI record that holds the class name text, which
        starts 16 bytes into the record.
    Complete object locator (COL) - an RTTI record linked from just before a
        vtable. Its six 32-bit fields are: signature (1 on 64-bit), offset of
        this vtable inside the object, constructor-displacement offset, type
        descriptor RVA, class hierarchy descriptor RVA, and the COL's own RVA.
        "Image-relative" means these are stored as RVAs, not full addresses.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: research/analysis/actor-link-layouts.txt (also printed)
Run:    python -B research/scripts/inspect_actor_links.py
        (from the repository root)
"""
import struct
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
# ImageBase is the address the executable expects to be loaded at. Subtracting
# it from a full address gives an RVA (offset inside the executable).
base = pe.OPTIONAL_HEADER.ImageBase
# Collected output lines.
lines = []
for table in (0x5585c40, 0x5b1e2b0, 0x5b257a8):
    # The 8 bytes just before a vtable are a pointer to its complete object
    # locator (COL), an RTTI record. Subtracting ImageBase turns that full
    # address into an RVA.
    col = struct.unpack('<Q', pe.get_data(table-8, 8))[0] - base
    # The COL's type-descriptor RVA is at byte 12 of the COL; the class name
    # text starts 16 bytes into the type descriptor.
    descriptor = struct.unpack('<I', pe.get_data(col+12, 4))[0]
    lines.append(f'{table:#x} {pe.get_string_at_rva(descriptor+16).decode()}')
    # Read the selected 8-byte slots and show each target as an RVA.
    for offset in (0xc0, 0x130, 0x140, 0x158, 0x178, 0x180):
        target = struct.unpack('<Q', pe.get_data(table+offset,8))[0]-base
        lines.append(f'virtual +{offset:x} -> {target:#x}')
# Save and print the report.
(ROOT.parent / 'analysis' / 'actor-link-layouts.txt').write_text('\n'.join(lines), encoding='utf-8')
print('\n'.join(lines))
