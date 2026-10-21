"""Trace map-range uses of the observed icon coordinate offset, read-only."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
from capstone.x86_const import X86_OP_MEM, X86_REG_RSP, X86_REG_RBP

decoder.detail = True
for begin, end in ends.items():
    if not 0xd80000 <= begin < 0xe30000:
        continue
    instructions = list(decoder.disasm(pe.get_data(begin, end-begin), base+begin))
    for index, ins in enumerate(instructions):
        if any(op.type == X86_OP_MEM and op.mem.disp == 0xe0 and op.mem.base not in (X86_REG_RSP, X86_REG_RBP) for op in ins.operands):
            print(f'FUNCTION {begin:#x} END {end:#x}')
            for context in instructions[max(0, index-4):index+6]:
                print(f'{context.address-base:#x}: {context.mnemonic} {context.op_str}')
