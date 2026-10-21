"""Resolve relevant world/minimap virtual methods without loading game code.

What it does, in plain terms:
    C++ objects keep a "vtable" (virtual method table): a list of 8-byte
    addresses, one per overridable method. This script looks at two such
    tables in the game executable, at RVAs 0x566ff50 and 0x5674e00 (an RVA is
    a position measured from the start of the program in memory; the first
    is the world-map controller table used in inspect_controllers.py, and the
    summary line above names the pair as world map / minimap). For three
    entries in each table (byte offsets 0x548, 0x550, 0x558) it reads the
    method address and disassembles that method (shows its machine code as
    readable CPU instructions).

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: listener-<rva>.asm next to this script for each method (via
inspect()), plus printed output.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, inspect...)
# by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
import struct
for table in (0x566ff50, 0x5674e00):
    for slot in (0x548, 0x550, 0x558):
        # Read one 8-byte little-endian address from the table and convert
        # it from an absolute address to an RVA.
        target = struct.unpack('<Q', pe.get_data(table+slot, 8))[0] - base
        print(f'vtable={table:#x} slot={slot:#x} target={target:#x}')
        inspect(target)
