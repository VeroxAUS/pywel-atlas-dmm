"""List MSVC RTTI type names containing given substrings, with their primary vtables.

What it does:
    Searches the installed executable for C++ class names that contain any
    of the words given on the command line, and prints each matching name
    followed by the vtables found for it. Read-only: the game is not started
    or modified.

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

Output: one line per matching name: the name, then "vtableRVA@offset" for each
vtable found (offset 0x0 is the class's primary vtable; other offsets are
vtables for further base-class parts of the same object).

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints to the console.
Run:    python -B research/scripts/find_rtti_names.py GamePlayState Actor ...
        (from the repository root)
"""
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
# Search words from the command line, as bytes.
needles=[value.encode() for value in sys.argv[1:]]
# Walk every ".?AV" in the file: the MSVC prefix of a class name.
# (":=" saves the search result in cursor; find() returns -1 when done.)
cursor=0
while (cursor:=raw.find(b'.?AV',cursor))>=0:
    # The name runs up to the next zero byte (looked for within 256 bytes).
    end=raw.find(b'\0',cursor,cursor+256)
    name=raw[cursor:end] if end>0 else b''
    # Only names that contain one of the search words.
    if name and any(n in name for n in needles):
        # The type descriptor starts 16 bytes before its name; convert that file
        # offset to an RVA.
        descriptor=pe.get_rva_from_offset(cursor-16)
        # Look for every place this descriptor RVA is stored as a 32-bit value.
        tables=[]
        ref=0
        packed=struct.pack('<I',descriptor)
        while (ref:=raw.find(packed,ref))>=0:
            # If it is the type-descriptor field of a complete object locator
            # (COL), the COL starts 12 bytes earlier. Check it is real: the
            # signature is 1 and the last field equals the COL's own RVA.
            if ref>=12:
                fields=struct.unpack_from('<6I',raw,ref-12)
                col=pe.get_rva_from_offset(ref-12)
                if fields[0]==1 and fields[5]==col:
                    # A vtable is preceded by a full 64-bit pointer to its COL, so
                    # find that pointer; the vtable starts 8 bytes after it. (Only
                    # the first such pointer in the file is used.)
                    location=raw.find(struct.pack('<Q',base+col))
                    if location>=0:
                        tables.append(f'{pe.get_rva_from_offset(location+8):#x}@{fields[1]:#x}')
            # Keep searching one byte further on.
            ref+=1
        # Print the name and its vtables as "vtableRVA@offset".
        print(name.decode(errors='replace'),' '.join(tables))
    # Continue the name search past this match.
    cursor+=4
