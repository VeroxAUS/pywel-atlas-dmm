"""Read the two post-creation registration functions and their category gates.

What it does, in plain terms:
    Prints the disassembly (machine code turned back into readable CPU
    instructions) of two fixed byte ranges in the game executable. The
    ranges start at RVAs 0xdf0320 and 0xdcfe70 (an RVA is a position
    measured from the start of the program in memory). The summary line
    above describes them as registration functions that run after something
    is created, plus their checks on a category value ("category gates");
    the script itself only prints the instructions.

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: nothing on disk; prints one line per instruction.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, decoder...)
# by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
# (start RVA, number of bytes to disassemble)
for start, length in ((0xdf0320, 0x460), (0xdcfe70, 0x210)):
    print(f'FUNCTION {start:#x}')
    # Addresses are shown as RVAs (real address minus the image base).
    for ins in decoder.disasm(pe.get_data(start, length), base+start):
        print(f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}')
