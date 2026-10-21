"""Resolve image-relative MSVC RTTI and virtual entries for save lifecycle types.

What it does, in plain terms:
    The game contains C++ classes named GamePlaySaveData,
    GamePlaySaveDataFileHandler and GamePlaySaveDataFileHandler_Steam. Starting
    only from those names, this script finds each class's vtable (virtual
    method table: the list of addresses of a class's overridable methods)
    and lists its first 56 entries, so the save/load code can be studied.

    How: MSVC (Microsoft's C++ compiler) stores RTTI ("run-time type
    information") records in the program. "Image-relative" means these
    records store positions as RVAs -- offsets from the start of the program
    in memory -- rather than full addresses. The chain is:
      1. Mangled class name ".?AVName@pa@@" inside a "type descriptor"
         record (the name starts 16 bytes into the record).
      2. A "complete object locator" (COL): six 4-byte numbers -- signature
         (1 on 64-bit), base offset, another offset, type descriptor RVA,
         class hierarchy RVA, and the COL's own RVA.
      3. The vtable, which is directly preceded by the COL's full 8-byte
         address.

Reads: the installed game executable, read-only (never run or modified).
Writes: save-load-vtables.json next to this script; prints, per class and
vtable, the first 34 entries as "<byte offset> <method rva>".

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (expects pefile in a "deps" folder next to the script and a
hard-coded Steam install path on drive E:).
"""
import json
import struct
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0,str(ROOT/'deps'))
# pefile parses the Windows "PE" (Portable Executable) .exe format.
import pefile
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
# ImageBase = preferred load address; real address = ImageBase + RVA.
base=pe.OPTIONAL_HEADER.ImageBase
# The whole file's bytes as loaded by pefile.
raw=pe.__data__
results=[]
for type_name in ('GamePlaySaveData','GamePlaySaveDataFileHandler','GamePlaySaveDataFileHandler_Steam'):
    # Step 1: the mangled name, ending in a zero byte so that e.g.
    # "GamePlaySaveData" does not also match "GamePlaySaveDataFileHandler".
    pattern=f'.?AV{type_name}@pa@@'.encode()+b'\0'
    offset=raw.find(pattern)
    if offset<0: continue
    descriptor=pe.get_rva_from_offset(offset-16)
    cursor=0
    matches=[]
    # Step 2: every 4-byte value equal to the descriptor RVA may be field 4
    # (byte 12) of a COL.
    while (cursor:=raw.find(struct.pack('<I',descriptor),cursor))>=0:
        if cursor>=12:
            col=pe.get_rva_from_offset(cursor-12)
            fields=struct.unpack_from('<6I',raw,cursor-12)
            # Real COL: signature 1 and last field equals its own RVA.
            if fields[0]==1 and fields[5]==col:
                # Step 3: find the COL's absolute address; the vtable starts
                # 8 bytes after each place it is stored.
                needle=struct.pack('<Q',base+col)
                location=0
                while (location:=raw.find(needle,location))>=0:
                    table=pe.get_rva_from_offset(location+8)
                    # 56 consecutive 8-byte entries, converted to RVAs.
                    entries=[hex(struct.unpack('<Q',pe.get_data(table+8*i,8))[0]-base) for i in range(56)]
                    # 'offset' = where this part sits inside the full object
                    # (non-zero for extra vtables from multiple inheritance).
                    matches.append({'table':hex(table),'offset':fields[1],'entries':entries})
                    location+=1
        cursor+=1
    results.append({'type':type_name,'descriptor':hex(descriptor),'tables':matches})
(ROOT/'save-load-vtables.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
for result in results:
    print(result['type'])
    for table in result['tables']:
        print('table',table['table'],'base offset',table['offset'])
        # Print only the first 34 entries; hex(index*8) is the byte offset.
        for index,entry in enumerate(table['entries']):
            if index<34: print(hex(index*8),entry)
