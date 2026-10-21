"""Write focused function disassembly for save-load control-flow research.

What it does:
    For each function start address given on the command line, cuts that one
    function out of the installed Crimson Desert executable and writes its
    disassembly to a text file. Read-only: the game is not started or
    modified.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    Disassembly - translating raw machine-code bytes back into readable
        instruction names and operands (mov, call, lea, ...).
    Exception directory - a table inside 64-bit Windows executables that
        lists where (most) functions begin and end. Used here only to find
        function boundaries.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile and capstone are imported from research/deps)
Writes: research/disasm/save-load-<rva in hex>.asm, one file per address, with
        one "rva: instruction" line per instruction.
Run:    python -B research/scripts/disassemble_save_load.py 0x17ef9c0 [more RVAs]
        (from the repository root)
"""
import sys
from pathlib import Path
# Folder containing this script (research/scripts). The bundled third-party
# libraries live next to it in research/deps, so add that folder to Python's
# import search path before importing them.
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent / 'deps'))
# pefile reads the Windows executable file format ("PE"); capstone is a
# disassembler that turns x86-64 machine-code bytes into readable instructions.
import pefile
from capstone import Cs,CS_ARCH_X86,CS_MODE_64
# Open the installed game executable for reading only. fast_load skips
# parsing tables that are not needed here.
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
# Data directory 3 is the exception directory: its entries record where each
# function starts and ends (as RVAs), which gives us function boundaries.
pe.parse_data_directories(directories=[3])
# Lookup table: function start RVA -> function end RVA.
ends={e.struct.BeginAddress:e.struct.EndAddress for e in pe.DIRECTORY_ENTRY_EXCEPTION}
# A disassembler configured for 64-bit x86 code.
decoder=Cs(CS_ARCH_X86,CS_MODE_64)
# ImageBase is the address the executable expects to be loaded at. Subtracting
# it from a full address gives an RVA (offset inside the executable).
base=pe.OPTIONAL_HEADER.ImageBase
# Each command-line argument is one function start RVA, e.g. 0x17ef9c0
# (int(value, 0) accepts hex with a 0x prefix or plain decimal).
for value in sys.argv[1:]:
    rva=int(value,0)
    # Use the recorded function end if known; otherwise just take 256 bytes.
    end=ends.get(rva,rva+256)
    # Disassemble the bytes from start to end and format each instruction as
    # "rva: mnemonic operands".
    lines=[f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}' for ins in decoder.disasm(pe.get_data(rva,end-rva),base+rva)]
    # Save to research/disasm/save-load-<rva>.asm and report the count.
    path=ROOT.parent/'disasm'/f'save-load-{rva:x}.asm'
    path.write_text('\n'.join(lines),encoding='utf-8')
    print(f'{path.name}: {len(lines)} instructions')
