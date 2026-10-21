"""Locate direct calls and RIP-relative references to observed pin callbacks.

What it does, in plain terms:
    Two functions in the game executable (RVAs 0xe016b0 and 0xdf88c0) had
    been observed acting as map-pin "listeners" (code that reacts to pin
    events). This script scans all executable code for instructions that
    point at either of them, so we can learn who calls or registers them.

    An RVA ("relative virtual address") is a position inside the program
    measured from where it starts in memory.

    It looks for three instruction shapes whose target is written as a
    distance from the next instruction ("RIP-relative"; RIP is the CPU's
    instruction pointer):
      - E8 xx xx xx xx        "call" to a nearby function
      - 48 8D / 4C 8D ...     "lea", which loads an address into a register
                              (often used to pass a callback pointer along)

    For every hit it prints where the reference is, and disassembles the
    function containing it (disassembly = turning machine-code bytes back
    into readable instructions).

Reads: the installed game executable, read-only (via the shared setup code
borrowed from inspect_display_listener.py).
Writes: listener-<rva>.asm files next to this script (made by inspect()),
plus printed output.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Run the top part of inspect_display_listener.py inside this script. It is
# cut off just before that file's "main" section, so we get its setup (pe,
# base, ends, decoder) and its inspect() helper without running its own scan.
# The .replace() call swaps a text for itself, so it has no effect.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0].replace('from pathlib import Path', 'from pathlib import Path'))
import struct
for section in pe.sections:
    # 0x20000000 is the PE section flag "memory is executable"; only code
    # sections are scanned.
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    for target in (0xe016b0, 0xdf88c0):
        for opcode in (b'\xe8', b'\x48\x8d', b'\x4c\x8d'):
            cursor = 0
            # Walk through every place the opcode bytes occur in the section.
            while (cursor := raw.find(opcode, cursor)) >= 0:
                # A call is 5 bytes long; a RIP-relative lea is 7 bytes.
                length = 5 if len(opcode) == 1 else 7
                # For lea, the third byte must encode "[rip + 32-bit offset]"
                # (its bit pattern masked with 0xc7 equals 5).
                if cursor + length <= len(raw) and (length == 5 or raw[cursor+2] & 0xc7 == 5):
                    address = section.VirtualAddress + cursor
                    # The last 4 bytes hold a signed distance; the destination
                    # is measured from the end of the instruction.
                    offset = cursor + length - 4
                    destination = address + length + struct.unpack_from('<i', raw, offset)[0]
                    if destination == target:
                        # Find which known function (start..end range) holds
                        # this reference, using the exception-table map.
                        owner = next((begin for begin, end in ends.items() if begin <= address < end), None)
                        print(f'target={target:#x} reference={address:#x} return={address+length:#x} function={owner!r}')
                        # Disassemble the referencing function, unless it is
                        # one of the two targets themselves.
                        if owner and owner not in (0xe016b0, 0xdf88c0):
                            inspect(owner)
                cursor += 1
