"""List MSVC RTTI type names containing given substrings, with their primary vtables."""
import struct
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent / 'deps'))
import pefile
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
base=pe.OPTIONAL_HEADER.ImageBase
raw=pe.__data__
needles=[value.encode() for value in sys.argv[1:]]
cursor=0
while (cursor:=raw.find(b'.?AV',cursor))>=0:
    end=raw.find(b'\0',cursor,cursor+256)
    name=raw[cursor:end] if end>0 else b''
    if name and any(n in name for n in needles):
        descriptor=pe.get_rva_from_offset(cursor-16)
        tables=[]
        ref=0
        packed=struct.pack('<I',descriptor)
        while (ref:=raw.find(packed,ref))>=0:
            if ref>=12:
                fields=struct.unpack_from('<6I',raw,ref-12)
                col=pe.get_rva_from_offset(ref-12)
                if fields[0]==1 and fields[5]==col:
                    location=raw.find(struct.pack('<Q',base+col))
                    if location>=0:
                        tables.append(f'{pe.get_rva_from_offset(location+8):#x}@{fields[1]:#x}')
            ref+=1
        print(name.decode(errors='replace'),' '.join(tables))
    cursor+=4
