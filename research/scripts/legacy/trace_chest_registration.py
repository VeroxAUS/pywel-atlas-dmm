"""Locate native chest-template registrations without loading or changing game code."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
import struct
image = pe.__data__
targets = {}
for name in (b'MapIcon_Gimmick_LevelTreasureBox', b'MapIcon_Gimmick_LevelTreasureBoxOpened', b'MapIcon_Pin_Marker'):
    cursor = 0
    while (cursor := image.find(name+b'\0', cursor)) >= 0:
        targets[pe.get_rva_from_offset(cursor)] = name.decode()
        cursor += len(name)+1
seen = set()
for section in pe.sections:
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    for prefix in (b'\x48\x8d', b'\x4c\x8d'):
        cursor = 0
        while (cursor := raw.find(prefix, cursor)) >= 0:
            if cursor + 7 <= len(raw) and raw[cursor+2] & 0xc7 == 5:
                address = section.VirtualAddress + cursor
                destination = address+7+struct.unpack_from('<i', raw, cursor+3)[0]
                if destination in targets:
                    owner = next((start for start, end in ends.items() if start <= address < end), None)
                    print(f'{targets[destination]} reference={address:#x} function={owner!r}')
                    if owner and owner not in seen:
                        seen.add(owner)
                        inspect(owner)
            cursor += 2
print(f'Found {len(targets)} string addresses; {len(seen)} referring functions')
