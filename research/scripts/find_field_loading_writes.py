"""Find decoded writes to displacement c3; retain unwind-bounded context.

What it does:
    Looks for machine instructions in the installed executable that store a
    single byte at offset 0xc3 inside some object, for example
    "mov byte ptr [rbx + 0xc3], al", and reports each one together with the
    instructions around it. Read-only: the game is not started or modified.

How (two passes, to keep it fast):
    1. Cheap byte search. x86 has a short one-byte form for small offsets,
       but it only covers -128..127, so an offset of 0xc3 (195) is stored as
       the 4-byte little-endian value c3 00 00 00. Every function whose code
       contains those 4 bytes becomes a candidate.
    2. Precise check. Only the candidate functions are disassembled, and real
       "mov byte ptr [... + 0xc3], ..." instructions are kept.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    Displacement - the constant offset added to a register in a memory
        operand: [rbx + 0xc3] has displacement 0xc3.
    Disassembly - translating raw machine-code bytes back into readable
        instruction names and operands (mov, call, lea, ...).
    Exception directory - a table inside 64-bit Windows executables that
        lists where (most) functions begin and end. Used here only to find
        function boundaries.
        "Unwind-bounded" context: the instructions shown around a hit are
        taken only from the function that contains it.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile and capstone are imported from research/deps)
Writes: research/analysis/field-loading-writes.txt (also printed)
Run:    python -B research/scripts/find_field_loading_writes.py
        (from the repository root)
"""
import bisect
import struct
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
# (start, end) RVA of every function, in table order (sorted by start), plus
# a list of just the starts so bisect can binary-search it.
entries = [(e.struct.BeginAddress, e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION]
starts = [x[0] for x in entries]
# Functions (start, end) that contain at least one c3 00 00 00 pattern.
owners = set()
# Pass 1: byte search through the executable sections.
for section in pe.sections:
    # 0x20000000 is the PE "memory is executable" flag; skip data-only
    # sections.
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    cursor = 0
    # Find each next occurrence of the bytes c3 00 00 00 ('<I' = 32-bit
    # little-endian). ':=' stores the search result in cursor; the loop stops
    # when find() returns -1 (no more matches).
    while (cursor := raw.find(struct.pack('<I', 0xc3), cursor)) >= 0:
        # Convert the position within the section into an RVA.
        rva = section.VirtualAddress + cursor
        # Find the containing function: the last function starting at or before
        # this RVA (binary search with bisect), if the RVA is also before its end.
        index = bisect.bisect_right(starts, rva) - 1
        if index >= 0 and rva < entries[index][1]:
            owners.add(entries[index])
        cursor += 4
# Pass 2: disassemble each candidate function and keep the real byte writes.
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
lines = []
for start, end in sorted(owners):
    instructions = list(decoder.disasm(pe.get_data(start, end-start), base+start))
    for index, ins in enumerate(instructions):
        # A one-byte store whose memory destination ends in "+ 0xc3]".
        if ins.mnemonic == 'mov' and ins.op_str.startswith('byte ptr [') and '+ 0xc3],' in ins.op_str:
            # Record the function, then the instructions from 7 before the hit
            # to 7 after it.
            lines.append(f'owner={start:#x}')
            lines.extend(f'{x.address-base:#x}: {x.mnemonic} {x.op_str}' for x in instructions[max(0,index-7):index+8])
# Save the report and print it.
(ROOT.parent / 'analysis' / 'field-loading-writes.txt').write_text('\n'.join(lines), encoding='utf-8')
print('\n'.join(lines))
