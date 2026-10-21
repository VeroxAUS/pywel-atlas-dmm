"""Trace map-range uses of the observed icon coordinate offset, read-only.

What it does, in plain terms:
    Earlier observation suggested that a map icon object keeps its
    coordinates at byte offset 0xe0 inside the object. This script looks
    through every function whose start lies in the RVA range 0xd80000 to
    0xe30000 (the part of the executable the research associated with map
    code; an RVA is a position measured from the start of the program in
    memory). It disassembles each function (turns machine code into readable
    CPU instructions) and, wherever an instruction reads or writes memory at
    "+0xe0" from some register, prints a few instructions around it.

    Accesses based on RSP or RBP are skipped: those registers normally point
    at the stack (temporary local variables), not at an object.

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: nothing on disk; prints "FUNCTION <start> END <end>" followed by
the surrounding instructions for each hit.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, ends,
# decoder...) by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
from capstone.x86_const import X86_OP_MEM, X86_REG_RSP, X86_REG_RBP

# detail=True makes capstone report each instruction's operands.
decoder.detail = True
# ends: function start RVA -> end RVA, from the exception table.
for begin, end in ends.items():
    if not 0xd80000 <= begin < 0xe30000:
        continue
    instructions = list(decoder.disasm(pe.get_data(begin, end-begin), base+begin))
    for index, ins in enumerate(instructions):
        # A memory operand with displacement 0xe0 not based on the stack.
        if any(op.type == X86_OP_MEM and op.mem.disp == 0xe0 and op.mem.base not in (X86_REG_RSP, X86_REG_RBP) for op in ins.operands):
            print(f'FUNCTION {begin:#x} END {end:#x}')
            # Show 4 instructions before and 5 after the hit.
            for context in instructions[max(0, index-4):index+6]:
                print(f'{context.address-base:#x}: {context.mnemonic} {context.op_str}')
