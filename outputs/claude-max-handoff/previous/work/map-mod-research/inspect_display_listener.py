"""Read the observed pin listener and its direct callees from the installed PE."""
import sys
from pathlib import Path
root = Path(__file__).resolve().parent
sys.path.insert(0, str(root / 'deps'))
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
pe.parse_data_directories(directories=[3])
base = pe.OPTIONAL_HEADER.ImageBase
ends = {entry.struct.BeginAddress: entry.struct.EndAddress for entry in pe.DIRECTORY_ENTRY_EXCEPTION}
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
def inspect(rva):
    end = ends.get(rva, rva + 256)
    instructions = list(decoder.disasm(pe.get_data(rva, end-rva), base+rva))
    lines = [f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}' for ins in instructions]
    (root / f'listener-{rva:x}.asm').write_text('\n'.join(lines), encoding='utf-8')
    print('\n'.join(lines))
    return instructions
instructions = inspect(int(sys.argv[1], 0) if len(sys.argv) > 1 else 0xe016b0)
for ins in instructions:
    if ins.mnemonic in ('call', 'jmp') and ins.op_str.startswith('0x'):
        target = int(ins.op_str, 16) - base
        if target in ends:
            print(f'CALLEE {target:#x}')
            inspect(target)
