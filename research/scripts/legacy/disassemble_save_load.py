"""Write focused function disassembly for save-load control-flow research.

What it does, in plain terms:
    The game's program file (CrimsonDesert.exe) is machine code. "Disassembly"
    means translating those raw bytes back into readable CPU instructions such
    as "mov" or "call". For every address given on the command line, this
    script finds the function that starts there, disassembles it, and saves
    the listing to a text file so a person can study how saving/loading works.

Reads:
    - The installed game executable, read-only (never run or modified).
    - Command-line arguments: one or more function start addresses written as
      RVAs, e.g. 0x186f570. An RVA ("relative virtual address") is a position
      measured from the start of the program as it sits in memory, so it stays
      the same no matter where Windows actually loads the program.

Writes:
    - save-load-<rva>.asm next to this script, one per address.
    - Prints how many instructions each file contains.

Libraries: pefile reads the Windows "PE" (Portable Executable) file format
used by .exe files; capstone is a disassembler library.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve. It expects pefile/capstone in a "deps" folder next to the script
(not present here) and a hard-coded Steam install path on drive E:.
"""
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0,str(ROOT/'deps'))
import pefile
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
# fast_load skips parsing most tables up front; we then ask only for
# directory 3, the "exception directory". On 64-bit Windows this table lists
# the start and end address of (nearly) every function, so it doubles as a
# map of where functions begin and end.
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
pe.parse_data_directories(directories=[3])
# Function start RVA -> function end RVA.
ends={e.struct.BeginAddress:e.struct.EndAddress for e in pe.DIRECTORY_ENTRY_EXCEPTION}
# Disassembler for 64-bit x86 (x64) machine code.
decoder=Cs(CS_ARCH_X86,CS_MODE_64)
# ImageBase is the preferred memory address the program is loaded at.
# Real address = ImageBase + RVA; subtracting it turns addresses back into RVAs.
base=pe.OPTIONAL_HEADER.ImageBase
for value in sys.argv[1:]:
    # int(value, 0) accepts hex such as "0x1234" as well as plain decimal.
    rva=int(value,0)
    # If the address is not a known function start, just take 256 bytes.
    end=ends.get(rva,rva+256)
    # One text line per instruction: "<rva>: <instruction> <operands>".
    lines=[f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}' for ins in decoder.disasm(pe.get_data(rva,end-rva),base+rva)]
    path=ROOT/f'save-load-{rva:x}.asm'
    path.write_text('\n'.join(lines),encoding='utf-8')
    print(f'{path.name}: {len(lines)} instructions')
