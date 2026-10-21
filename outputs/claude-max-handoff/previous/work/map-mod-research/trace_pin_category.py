"""Locate explicit personal-pin category gates in map code, read-only."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for section in pe.sections:
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    cursor = 0
    while (cursor := raw.find(b'\x83\x78\x2c\x25', cursor)) >= 0:
        address = section.VirtualAddress + cursor
        if 0xd80000 <= address < 0xe30000:
            owner = next((start for start, end in ends.items() if start <= address < end), None)
            print(f'GATE {address:#x} function={owner!r}')
            for ins in decoder.disasm(pe.get_data(address, 110), base+address):
                print(f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}')
        cursor += 4
