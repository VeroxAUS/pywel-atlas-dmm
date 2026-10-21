"""Find RIP-relative loads/stores of the resolver's TLS-selected registry roots."""
import bisect
import json
import struct
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent / 'deps'))
import pefile
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
pe.parse_data_directories(directories=[3])
entries=[(e.struct.BeginAddress,e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION]
starts=[e[0] for e in entries]
targets={int(value,0) for value in sys.argv[1:]} or {0x6d694d8,0x6d694e0}
results=[]
for section in pe.sections:
    if not section.Characteristics & 0x20000000: continue
    raw=section.get_data()
    # REX.W mov load/store and cmov with a [rip+disp32] operand.
    for opcode,kind in ((b'\x48\x8b','load'),(b'\x4c\x8b','load'),(b'\x48\x89','store'),(b'\x4c\x89','store'),
                        (b'\x48\x0f\x45','cmovne'),(b'\x48\x0f\x44','cmove'),(b'\x48\x39','cmp'),(b'\x48\x3b','cmp')):
        cursor=0
        while (cursor:=raw.find(opcode,cursor))>=0:
            modrm=cursor+len(opcode)
            length=len(opcode)+5
            if modrm<len(raw) and raw[modrm]&0xc7==5 and cursor+length<=len(raw):
                rva=section.VirtualAddress+cursor
                destination=rva+length+struct.unpack_from('<i',raw,modrm+1)[0]
                if destination in targets:
                    index=bisect.bisect_right(starts,rva)-1
                    owner=entries[index][0] if index>=0 and rva<entries[index][1] else 0
                    results.append({'target':hex(destination),'kind':kind,'reference':hex(rva),'owner':hex(owner)})
            cursor+=1
print(json.dumps(sorted(results,key=lambda r:(r['target'],r['kind'])),indent=2))
