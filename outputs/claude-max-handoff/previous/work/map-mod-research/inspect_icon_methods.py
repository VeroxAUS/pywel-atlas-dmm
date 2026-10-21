"""Resolve relevant world/minimap virtual methods without loading game code."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
import struct
for table in (0x566ff50, 0x5674e00):
    for slot in (0x548, 0x550, 0x558):
        target = struct.unpack('<Q', pe.get_data(table+slot, 8))[0] - base
        print(f'vtable={table:#x} slot={slot:#x} target={target:#x}')
        inspect(target)
