"""Resolve image-relative MSVC RTTI and virtual entries for save lifecycle types.

What it does:
    For each C++ class name listed in the loop below (CommonGamePlayStateActorComponent,
    ClientGamePlayStateActorComponent, ServerGamePlayStateActorComponent),
    finds the class's RTTI records in the installed executable, locates every
    vtable that belongs to that class, and records the first 56 function
    addresses (slots) of each vtable as RVAs. Read-only: the game is not
    started or modified.

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
Writes: research/analysis/gameplay-state-vtables.json
        A JSON list of {type, descriptor, tables: [{table, offset, entries}]}.
        The console shows a shorter summary: the first 34 slots of each vtable.
Run:    python -B research/scripts/inspect_gameplay_rtti.py   (from the repository root)
"""
import json
import struct
import sys
from pathlib import Path
# Folder containing this script (research/scripts). The bundled third-party
# libraries live next to it in research/deps, so add that folder to Python's
# import search path before importing them.
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent / 'deps'))
# pefile reads the Windows executable file format ("PE").
import pefile
# Open the installed game executable for reading only. fast_load skips
# parsing tables that are not needed here.
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
# ImageBase is the address the executable expects to be loaded at. Subtracting
# it from a full address gives an RVA (offset inside the executable).
base=pe.OPTIONAL_HEADER.ImageBase
# The whole executable file as raw bytes (positions in it are file offsets).
raw=pe.__data__
# One result entry per class name.
results=[]
# The C++ class names to look up.
for type_name in ('CommonGamePlayStateActorComponent','ClientGamePlayStateActorComponent','ServerGamePlayStateActorComponent'):
    # MSVC stores a class name as ".?AV<name>@<namespace>@@" plus a zero
    # byte; these classes are in the namespace "pa".
    pattern=f'.?AV{type_name}@pa@@'.encode()+b'\0'
    offset=raw.find(pattern)
    # Skip names that do not exist in this build.
    if offset<0: continue
    # The type descriptor begins 16 bytes before the name text; convert that
    # file offset into an RVA.
    descriptor=pe.get_rva_from_offset(offset-16)
    cursor=0
    matches=[]
    # Find every place this descriptor RVA is stored as a 32-bit value.
    # (":=" saves the search result in cursor; find() returns -1 when done.)
    while (cursor:=raw.find(struct.pack('<I',descriptor),cursor))>=0:
        if cursor>=12:
            # If this is the type-descriptor field of a complete object locator
            # (COL), the COL starts 12 bytes earlier. Confirm it is real: the
            # signature is 1 and the last field equals the COL's own RVA.
            col=pe.get_rva_from_offset(cursor-12)
            fields=struct.unpack_from('<6I',raw,cursor-12)
            if fields[0]==1 and fields[5]==col:
                # Each vtable is preceded by a full 64-bit pointer to its COL.
                # Find every such pointer; the vtable starts 8 bytes after it.
                needle=struct.pack('<Q',base+col)
                location=0
                while (location:=raw.find(needle,location))>=0:
                    table=pe.get_rva_from_offset(location+8)
                    # Read the first 56 slots (8 bytes each) as RVAs.
                    entries=[hex(struct.unpack('<Q',pe.get_data(table+8*i,8))[0]-base) for i in range(56)]
                    # offset = where this vtable's part sits inside the object
                    # (0 for the primary vtable).
                    matches.append({'table':hex(table),'offset':fields[1],'entries':entries})
                    location+=1
        # Keep searching one byte further on.
        cursor+=1
    results.append({'type':type_name,'descriptor':hex(descriptor),'tables':matches})
# Save the full results as JSON.
(ROOT.parent / 'analysis' / 'gameplay-state-vtables.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
# Print a shorter summary: the first 34 slots (0x0-0x108) of each vtable.
for result in results:
    print(result['type'])
    for table in result['tables']:
        print('table',table['table'],'base offset',table['offset'])
        for index,entry in enumerate(table['entries']):
            if index<34: print(hex(index*8),entry)

