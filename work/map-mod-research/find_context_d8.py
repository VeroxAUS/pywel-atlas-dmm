"""Find active-context field references in the server actor implementation."""
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / 'deps'))
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
pe.parse_data_directories(directories=[3])
base = pe.OPTIONAL_HEADER.ImageBase
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
lines = []
for entry in pe.DIRECTORY_ENTRY_EXCEPTION:
    start, end = entry.struct.BeginAddress, entry.struct.EndAddress
    if not 0x2060000 <= start < 0x2070000:
        continue
    instructions = list(decoder.disasm(pe.get_data(start, end - start), base + start))
    for index, ins in enumerate(instructions):
        if '+ 0xd8]' in ins.op_str:
            lines.append(f'owner={start:#x}')
            lines.extend(f'{x.address-base:#x}: {x.mnemonic} {x.op_str}' for x in instructions[max(0,index-7):index+8])
print('\n'.join(lines))
(ROOT / 'context-d8-references.txt').write_text('\n'.join(lines), encoding='utf-8')

