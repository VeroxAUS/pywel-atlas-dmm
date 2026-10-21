"""Locate native chest-template registrations without loading or changing game code.

What it does, in plain terms:
    The game executable contains the names of map icon templates such as
    "MapIcon_Gimmick_LevelTreasureBox" (treasure chest), its "...Opened"
    variant and "MapIcon_Pin_Marker". This script:
      1. finds where each of those names is stored (as RVAs -- positions
         measured from the start of the program in memory);
      2. scans all executable code for "lea" instructions (which load an
         address into a register) that point at one of those names;
      3. prints each reference and disassembles (shows as readable CPU
         instructions) every function that contains one, once per function.

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: listener-<rva>.asm next to this script for each referring function
(via inspect()), plus printed output and a final count.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, ends,
# inspect...) by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
import struct
# The whole file's bytes as loaded by pefile.
image = pe.__data__
# Name RVA -> name text, for every stored copy of each name.
targets = {}
for name in (b'MapIcon_Gimmick_LevelTreasureBox', b'MapIcon_Gimmick_LevelTreasureBoxOpened', b'MapIcon_Pin_Marker'):
    cursor = 0
    # Require a terminating zero byte so only the exact whole name matches.
    while (cursor := image.find(name+b'\0', cursor)) >= 0:
        targets[pe.get_rva_from_offset(cursor)] = name.decode()
        cursor += len(name)+1
seen = set()
for section in pe.sections:
    # 0x20000000 = section is executable code; skip data sections.
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    # 48 8D / 4C 8D = "lea" instruction (with a 64-bit register prefix).
    for prefix in (b'\x48\x8d', b'\x4c\x8d'):
        cursor = 0
        while (cursor := raw.find(prefix, cursor)) >= 0:
            # Byte 3 must mean "[rip + 32-bit offset]": the target is given
            # as a distance from the next instruction (RIP = instruction
            # pointer). Such a lea is 7 bytes long.
            if cursor + 7 <= len(raw) and raw[cursor+2] & 0xc7 == 5:
                address = section.VirtualAddress + cursor
                destination = address+7+struct.unpack_from('<i', raw, cursor+3)[0]
                if destination in targets:
                    # Which known function (from the exception table) holds it.
                    owner = next((start for start, end in ends.items() if start <= address < end), None)
                    print(f'{targets[destination]} reference={address:#x} function={owner!r}')
                    if owner and owner not in seen:
                        seen.add(owner)
                        inspect(owner)
            cursor += 2
print(f'Found {len(targets)} string addresses; {len(seen)} referring functions')
