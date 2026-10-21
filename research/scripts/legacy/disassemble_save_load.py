"""Write focused function disassembly for save-load control-flow research."""
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT/'deps'))
import pefile
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
pe.parse_data_directories(directories=[3])
ends={e.struct.BeginAddress:e.struct.EndAddress for e in pe.DIRECTORY_ENTRY_EXCEPTION}
decoder=Cs(CS_ARCH_X86,CS_MODE_64)
base=pe.OPTIONAL_HEADER.ImageBase
for value in sys.argv[1:]:
    rva=int(value,0)
    end=ends.get(rva,rva+256)
    lines=[f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}' for ins in decoder.disasm(pe.get_data(rva,end-rva),base+rva)]
    path=ROOT/f'save-load-{rva:x}.asm'
    path.write_text('\n'.join(lines),encoding='utf-8')
    print(f'{path.name}: {len(lines)} instructions')
