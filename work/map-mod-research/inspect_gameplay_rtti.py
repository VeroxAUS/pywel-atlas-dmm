"""Resolve image-relative MSVC RTTI and virtual entries for save lifecycle types."""
import json
import struct
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'deps'))
import pefile
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
base=pe.OPTIONAL_HEADER.ImageBase
raw=pe.__data__
results=[]
for type_name in ('CommonGamePlayStateActorComponent','ClientGamePlayStateActorComponent','ServerGamePlayStateActorComponent'):
    pattern=f'.?AV{type_name}@pa@@'.encode()+b'\0'
    offset=raw.find(pattern)
    if offset<0: continue
    descriptor=pe.get_rva_from_offset(offset-16)
    cursor=0
    matches=[]
    while (cursor:=raw.find(struct.pack('<I',descriptor),cursor))>=0:
        if cursor>=12:
            col=pe.get_rva_from_offset(cursor-12)
            fields=struct.unpack_from('<6I',raw,cursor-12)
            if fields[0]==1 and fields[5]==col:
                needle=struct.pack('<Q',base+col)
                location=0
                while (location:=raw.find(needle,location))>=0:
                    table=pe.get_rva_from_offset(location+8)
                    entries=[hex(struct.unpack('<Q',pe.get_data(table+8*i,8))[0]-base) for i in range(56)]
                    matches.append({'table':hex(table),'offset':fields[1],'entries':entries})
                    location+=1
        cursor+=1
    results.append({'type':type_name,'descriptor':hex(descriptor),'tables':matches})
(ROOT/'gameplay-state-vtables.json').write_text(json.dumps(results,indent=2),encoding='utf-8')
for result in results:
    print(result['type'])
    for table in result['tables']:
        print('table',table['table'],'base offset',table['offset'])
        for index,entry in enumerate(table['entries']):
            if index<34: print(hex(index*8),entry)

