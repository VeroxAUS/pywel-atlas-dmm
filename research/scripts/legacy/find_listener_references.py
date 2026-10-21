"""Locate direct calls and RIP-relative references to observed pin callbacks."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0].replace('from pathlib import Path', 'from pathlib import Path'))
import struct
for section in pe.sections:
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    for target in (0xe016b0, 0xdf88c0):
        for opcode in (b'\xe8', b'\x48\x8d', b'\x4c\x8d'):
            cursor = 0
            while (cursor := raw.find(opcode, cursor)) >= 0:
                length = 5 if len(opcode) == 1 else 7
                if cursor + length <= len(raw) and (length == 5 or raw[cursor+2] & 0xc7 == 5):
                    address = section.VirtualAddress + cursor
                    offset = cursor + length - 4
                    destination = address + length + struct.unpack_from('<i', raw, offset)[0]
                    if destination == target:
                        owner = next((begin for begin, end in ends.items() if begin <= address < end), None)
                        print(f'target={target:#x} reference={address:#x} return={address+length:#x} function={owner!r}')
                        if owner and owner not in (0xe016b0, 0xdf88c0):
                            inspect(owner)
                cursor += 1
