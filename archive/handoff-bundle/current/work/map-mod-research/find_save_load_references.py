"""Find bounded RIP-relative address references for save/load string candidates."""
import bisect
import json
import struct
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'deps'))
import pefile
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
pe.parse_data_directories(directories=[3])
entries=[(e.struct.BeginAddress,e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION]
starts=[e[0] for e in entries]
targets={int(value,0) for value in sys.argv[1:]}
results=[]
for section in pe.sections:
    if not section.Characteristics & 0x20000000: continue
    raw=section.get_data()
    for opcode in (b'\xe8',b'\x48\x8d',b'\x4c\x8d',b'\x48\x8b',b'\x4c\x8b'):
        cursor=0
        while (cursor:=raw.find(opcode,cursor))>=0:
            length = 5 if len(opcode) == 1 else 7
            if cursor+length<=len(raw) and (length==5 or raw[cursor+2]&0xc7==5):
                rva=section.VirtualAddress+cursor
                destination=rva+length+struct.unpack_from('<i',raw,cursor+length-4)[0]
                if destination in targets:
                    index=bisect.bisect_right(starts,rva)-1
                    owner=entries[index][0] if index>=0 and rva<entries[index][1] else 0
                    results.append({'target':hex(destination),'reference':hex(rva),'owner':hex(owner)})
            cursor+=1
print(json.dumps(results,indent=2))
