"""Survey on-disk lifecycle names and the confirmed gameplay-context vtable.

What it does, in two parts (read-only: the game is not started or modified):
    1. For two known vtables (RVAs 0x5b1e2b0 and 0x5b257a8) it prints the C++
       class name found through RTTI and the function RVA in each vtable slot
       from offset 0x60 up to 0x188.
    2. It scans the whole executable file for readable text strings (8-200
       printable characters ending in a zero byte) that contain
       GamePlayState, GameState, LoadingState, EnterToField or InGameState
       (in any letter case), and records each one with its RVA.

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
Writes: research/analysis/activation-strings.json (part 2; also printed).
        Part 1 is printed only.
Run:    python -B research/scripts/inspect_activation.py
        (from the repository root)
"""
import json
import re
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
# Part 1: class name and vtable slots for each known vtable RVA.
for table in (0x5b1e2b0, 0x5b257a8):
    # The 8 bytes just before a vtable are a pointer to its complete object
    # locator (COL), an RTTI record. Subtracting ImageBase turns that full
    # address into an RVA.
    col = struct.unpack('<Q', pe.get_data(table - 8, 8))[0] - base
    # The COL's type-descriptor RVA is at byte 12 of the COL.
    descriptor = struct.unpack('<I', pe.get_data(col + 12, 4))[0]
    # The class name text starts 16 bytes into the type descriptor.
    print(hex(table), pe.get_string_at_rva(descriptor + 16).decode(errors='replace'))
    # Print each 8-byte slot from offset 0x60 up to 0x188 as an RVA.
    for offset in range(0x60, 0x190, 8):
        entry = struct.unpack('<Q', pe.get_data(table + offset, 8))[0] - base
        print(hex(offset), hex(entry))

# Part 2: lifecycle-related text strings anywhere in the file.
names = []
# Case-insensitive (re.I) pattern of the words searched for.
pattern = re.compile(rb'(?:GamePlayState|GameState|LoadingState|EnterToField|InGameState)', re.I)
# Every run of 8-200 printable ASCII characters followed by a zero byte
# (the way C/C++ strings are stored).
for match in re.finditer(rb'[\x20-\x7e]{8,200}\x00', pe.__data__):
    # Drop the trailing zero byte.
    raw = match.group()[:-1]
    if pattern.search(raw):
        # match.start() is a file offset; convert it to an RVA for the report.
        names.append({'rva': hex(pe.get_rva_from_offset(match.start())), 'text': raw.decode()})
# Save and print the list.
(ROOT.parent / 'analysis' / 'activation-strings.json').write_text(json.dumps(names, indent=2), encoding='utf-8')
print(json.dumps(names, indent=2))
