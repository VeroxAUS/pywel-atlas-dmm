"""Find statically decoded callers of the native per-layer projection function.

What it does, in plain terms:
    The function at RVA 0xd94040 was identified as the game's per-layer
    "projection" function (per the summary line above; this script does not
    check what the function does). An RVA is a position
    measured from the start of the program in memory. This script
    disassembles (turns machine code into readable CPU instructions) every
    function starting in the RVA range 0xd80000..0xe30000 and reports each
    direct "call" to 0xd94040, printing 14 instructions before and 6 after
    the call so the arguments being prepared can be read.

    "Statically decoded" means only calls written with a fixed target
    address are found; calls made through a pointer are not.

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: nothing on disk; printed output only.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, ends,
# decoder...) by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
# ends: function start RVA -> end RVA, from the exception table.
for begin, end in ends.items():
    if not 0xd80000 <= begin < 0xe30000:
        continue
    code = list(decoder.disasm(pe.get_data(begin, end-begin), base+begin))
    for index, ins in enumerate(code):
        # capstone prints a direct call target as a full hex address.
        if ins.mnemonic == 'call' and ins.op_str == hex(base+0xd94040):
            print(f'CALLER {begin:#x} END {end:#x}')
            for item in code[max(0,index-14):index+7]:
                print(f'{item.address-base:#x}: {item.mnemonic} {item.op_str}')
