"""Bounded static slices for the invisible chest investigation; never runs game code."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for start, end in [(0xe09ae0, 0xe09c90), (0xdba670, 0xdba780), (0xd94040, 0xd94700)]:
    lines = [f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}'
             for ins in decoder.disasm(pe.get_data(start, end-start), base+start)]
    (root / f'visibility-slice-{start:x}.asm').write_text('\n'.join(lines), encoding='utf-8')
