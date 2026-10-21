"""Find active-context field references in the server actor implementation.

What it does:
    Disassembles every function whose start RVA lies in the range
    0x2060000-0x206ffff of the installed executable (the range this research
    associated with the server actor implementation) and reports each
    instruction whose memory operand ends in "+ 0xd0]" - that is, code that
    reads or writes the field at byte offset 0xd0 of some object. Each hit is
    shown with the function it belongs to ("owner") and up to 7 instructions
    before and 7 after it. Read-only: the game is not started or modified.

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
Writes: research/analysis/context-d0-references.txt
        (also printed to the console)
Run:    python -B research/scripts/find_context_assignment.py   (from the repository root)
"""
import sys
from pathlib import Path

# Folder containing this script (research/scripts). The bundled third-party
# libraries live next to it in research/deps, so add that folder to Python's
# import search path before importing them.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
# pefile reads the Windows executable file format ("PE"); capstone is a
# disassembler that turns x86-64 machine-code bytes into readable instructions.
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

# Open the installed game executable for reading only. fast_load skips
# parsing tables that are not needed here.
pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
# Data directory 3 is the exception directory: its entries record where each
# function starts and ends (as RVAs), which gives us function boundaries.
pe.parse_data_directories(directories=[3])
# ImageBase is the address the executable expects to be loaded at. Subtracting
# it from a full address gives an RVA (offset inside the executable).
base = pe.OPTIONAL_HEADER.ImageBase
# A disassembler configured for 64-bit x86 code.
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
# Collected output lines.
lines = []
# Walk every function listed in the exception directory.
for entry in pe.DIRECTORY_ENTRY_EXCEPTION:
    start, end = entry.struct.BeginAddress, entry.struct.EndAddress
    # Only look at functions in the address range of interest.
    if not 0x2060000 <= start < 0x2070000:
        continue
    # Decode the whole function into a list of instructions.
    instructions = list(decoder.disasm(pe.get_data(start, end - start), base + start))
    for index, ins in enumerate(instructions):
        # Capstone writes memory operands like "qword ptr [rcx + 0xd0]"; a
        # match means this instruction touches offset 0xd0 of some object.
        if '+ 0xd0]' in ins.op_str:
            # Record which function it was in, then a window of instructions
            # from 7 before the hit to 7 after it (the hit included).
            lines.append(f'owner={start:#x}')
            lines.extend(f'{x.address-base:#x}: {x.mnemonic} {x.op_str}' for x in instructions[max(0,index-7):index+8])
# Show the results and also save them for later reference.
print('\n'.join(lines))
(ROOT.parent / 'analysis' / 'context-d0-references.txt').write_text('\n'.join(lines), encoding='utf-8')
