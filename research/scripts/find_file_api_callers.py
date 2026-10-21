"""Find game functions that call particular Windows file APIs.

What it does:
    Looks up where the executable's import table stores the addresses of
    Windows file functions (MoveFileExW, ReplaceFileW, CreateFileW, ...).
    Then it scans the code for "call qword ptr [rip + disp32]" and
    "jmp qword ptr [rip + disp32]" instructions that use those slots, and
    prints each caller with the function that contains it. Saving a slot file
    has to go through some of these, so their callers are candidates for the
    game's save-write code. Read-only: the game is not started or modified.

Key terms:
    Import table (IAT) - a table of pointers the Windows loader fills with the
        real addresses of system functions. Code calls a system function
        indirectly through its IAT slot.
    RVA - an offset inside the executable as laid out in memory.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints "api caller-rva owner-rva" lines.
Run:    python -B research/scripts/find_file_api_callers.py MoveFileExW ReplaceFileW
"""
import bisect
import struct
import sys
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
pe.parse_data_directories(directories=[1, 3])  # 1 = imports, 3 = exceptions
base = pe.OPTIONAL_HEADER.ImageBase
wanted = set(sys.argv[1:])
# IAT slot RVA -> API name, for the requested names.
slots = {}
for library in pe.DIRECTORY_ENTRY_IMPORT:
    for symbol in library.imports:
        if symbol.name and symbol.name.decode() in wanted:
            slots[symbol.address - base] = f'{library.dll.decode()}!{symbol.name.decode()}'
for rva, name in sorted(slots.items()):
    print(f'slot {rva:#x} {name}')
# Function boundaries, to name the owner of each caller.
entries = sorted((e.struct.BeginAddress, e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION)
starts = [entry[0] for entry in entries]


def owner(rva):
    """Return the start RVA of the function containing `rva`, or None."""
    index = bisect.bisect_right(starts, rva) - 1
    if index >= 0 and entries[index][0] <= rva < entries[index][1]:
        return entries[index][0]
    return None


for section in pe.sections:
    if not section.Characteristics & 0x20000000:  # executable sections only
        continue
    data = section.get_data()
    start = section.VirtualAddress
    for offset in range(len(data) - 6):
        # FF 15 = call [rip+disp32]; FF 25 = jmp [rip+disp32] (6 bytes).
        if data[offset] != 0xFF or data[offset + 1] not in (0x15, 0x25):
            continue
        disp = struct.unpack_from('<i', data, offset + 2)[0]
        target = start + offset + 6 + disp
        if target in slots:
            rva = start + offset
            function = owner(rva)
            print(f'{slots[target]} {rva:#x} {function:#x}' if function else f'{slots[target]} {rva:#x} ?')
