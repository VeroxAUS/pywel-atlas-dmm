"""Bounded static slices for the invisible chest investigation; never runs game code.

What it does, in plain terms:
    Saves the disassembly (machine code shown as readable CPU instructions)
    of three fixed address ranges in the game executable, chosen while
    investigating why a chest icon was not visible on the map. Ranges are
    given as RVAs (positions measured from the start of the program in
    memory): 0xe09ae0-0xe09c90, 0xdba670-0xdba780 and 0xd94040-0xd94700.
    "Static" means the file is only read, never executed.

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: visibility-slice-<start>.asm next to this script, one per range.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, decoder,
# root...) by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for start, end in [(0xe09ae0, 0xe09c90), (0xdba670, 0xdba780), (0xd94040, 0xd94700)]:
    lines = [f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}'
             for ins in decoder.disasm(pe.get_data(start, end-start), base+start)]
    # root comes from the borrowed setup and is this script's folder.
    (root / f'visibility-slice-{start:x}.asm').write_text('\n'.join(lines), encoding='utf-8')
