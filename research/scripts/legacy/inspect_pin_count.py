"""Disassemble the pin-registration range across chained unwind entries."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for ins in decoder.disasm(pe.get_data(0xdb85a0, 0x460), base+0xdb85a0):
    print(f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}')
