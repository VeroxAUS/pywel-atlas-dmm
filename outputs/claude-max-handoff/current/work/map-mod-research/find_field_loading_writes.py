"""Find decoded writes to displacement c3; retain unwind-bounded context."""
import bisect
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'deps'))
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
pe.parse_data_directories(directories=[3])
base = pe.OPTIONAL_HEADER.ImageBase
entries = [(e.struct.BeginAddress, e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION]
starts = [x[0] for x in entries]
owners = set()
for section in pe.sections:
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    cursor = 0
    while (cursor := raw.find(struct.pack('<I', 0xc3), cursor)) >= 0:
        rva = section.VirtualAddress + cursor
        index = bisect.bisect_right(starts, rva) - 1
        if index >= 0 and rva < entries[index][1]:
            owners.add(entries[index])
        cursor += 4
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
lines = []
for start, end in sorted(owners):
    instructions = list(decoder.disasm(pe.get_data(start, end-start), base+start))
    for index, ins in enumerate(instructions):
        if ins.mnemonic == 'mov' and ins.op_str.startswith('byte ptr [') and '+ 0xc3],' in ins.op_str:
            lines.append(f'owner={start:#x}')
            lines.extend(f'{x.address-base:#x}: {x.mnemonic} {x.op_str}' for x in instructions[max(0,index-7):index+8])
(ROOT / 'field-loading-writes.txt').write_text('\n'.join(lines), encoding='utf-8')
print('\n'.join(lines))
