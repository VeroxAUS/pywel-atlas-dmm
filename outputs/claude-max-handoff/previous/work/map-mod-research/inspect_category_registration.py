"""Read the two post-creation registration functions and their category gates."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for start, length in ((0xdf0320, 0x460), (0xdcfe70, 0x210)):
    print(f'FUNCTION {start:#x}')
    for ins in decoder.disasm(pe.get_data(start, length), base+start):
        print(f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}')
