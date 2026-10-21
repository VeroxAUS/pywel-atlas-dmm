"""Disassemble the pin-registration range across chained unwind entries.

What it does, in plain terms:
    Prints the disassembly (machine code shown as readable CPU instructions)
    of a fixed 0x460-byte range starting at RVA 0xdb85a0 in the game
    executable. An RVA is a position measured from the start of the program
    in memory.

    Why a fixed range (as the summary line hints): the other scripts use the
    exception ("unwind") table to find where a function ends, but that table
    can split one function into several chained pieces. Taking a fixed byte
    range covers those pieces in one listing.

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
for ins in decoder.disasm(pe.get_data(0xdb85a0, 0x460), base+0xdb85a0):
    print(f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}')
