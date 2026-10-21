"""Locate explicit personal-pin category gates in map code, read-only.

What it does, in plain terms:
    Searches the game's executable code for the 4-byte instruction
    83 78 2C 25, which means "cmp dword ptr [rax+0x2c], 0x25": compare the
    4-byte value at offset 0x2c of the object that register RAX points to
    with the number 0x25 (37). The summary line above calls such a check a
    personal-pin "category gate" (code that only continues for one category).
    Only hits whose RVA lies in 0xd80000..0xe30000 (the range the research
    associated with map code) are reported. An RVA is a position measured
    from the start of the program in memory.

    For each hit it prints which function contains it and disassembles the
    next 110 bytes (shows the machine code as readable CPU instructions).

Reads: the installed game executable, read-only (setup borrowed from
inspect_display_listener.py).
Writes: nothing on disk; printed output only.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (it relies on inspect_display_listener.py, which expects a "deps"
folder and a hard-coded Steam path on drive E:).
"""
from pathlib import Path
# Reuse the setup part of inspect_display_listener.py (pe, base, ends,
# decoder...) by running its text up to, but not including, its main section.
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for section in pe.sections:
    # 0x20000000 = section is executable code; skip data sections.
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    cursor = 0
    while (cursor := raw.find(b'\x83\x78\x2c\x25', cursor)) >= 0:
        address = section.VirtualAddress + cursor
        if 0xd80000 <= address < 0xe30000:
            # Which known function (from the exception table) holds it.
            owner = next((start for start, end in ends.items() if start <= address < end), None)
            print(f'GATE {address:#x} function={owner!r}')
            for ins in decoder.disasm(pe.get_data(address, 110), base+address):
                print(f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}')
        cursor += 4
