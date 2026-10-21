"""Write annotated disassembly of the world-map icon zoom/scale code.

What it does:
    For each function start address given on the command line, cuts that one
    function out of the installed Crimson Desert executable and writes its
    disassembly to research/disasm/map-zoom-<rva>.asm. Unlike the save-load
    script, it also annotates every instruction that reads a fixed value from
    the executable itself (a "RIP-relative" read, explained below) with the
    4-byte float and integer stored there. Those fixed values are the
    constants the map code uses for its zoom and scale math.
    Read-only: the game is not started or modified.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    RIP-relative - an x86-64 way of naming a memory address as "this many
        bytes after the current instruction". Compilers use it for constants
        and global variables stored in the executable.
    Exception directory - a table inside 64-bit Windows executables that
        lists where (most) functions begin and end. Used here only to find
        function boundaries.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile and capstone are imported from research/deps)
Writes: research/disasm/map-zoom-<rva in hex>.asm, one file per address, with
        one "rva: instruction  ; constant" line per instruction.
Run:    python -B research/scripts/disassemble_map_zoom.py 0xd91820 [more RVAs]
        (from the repository root)
"""

import struct
import sys
from pathlib import Path

# Folder containing this script (research/scripts). The bundled third-party
# libraries live next to it in research/deps, so add that folder to Python's
# import search path before importing them.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))

import pefile
from capstone import CS_ARCH_X86, CS_MODE_64, Cs
from capstone.x86 import X86_OP_MEM, X86_REG_RIP

GAME = 'E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe'


def load_executable():
    """Open the game executable read-only and index its function bounds."""
    pe = pefile.PE(GAME, fast_load=True)

    # Data directory 3 is the exception directory (function start/end RVAs).
    pe.parse_data_directories(directories=[3])
    ends = {}
    for entry in pe.DIRECTORY_ENTRY_EXCEPTION:
        ends[entry.struct.BeginAddress] = entry.struct.EndAddress

    return pe, ends


def stored_in_file(pe, target_rva):
    """True when target_rva has bytes in the file (not zero-filled at load)."""
    for section in pe.sections:
        start = section.VirtualAddress
        if start <= target_rva < start + section.SizeOfRawData:
            return True

    return False


def describe_constant(pe, target_rva):
    """Return a short "float / hex" text for the 4 bytes at target_rva."""
    # Addresses past a section's file bytes are globals the game fills in
    # while running (for example settings), so the file holds no value.
    if not stored_in_file(pe, target_rva):
        return f'[{target_rva:#x}] = runtime global (no file value)'

    try:
        raw = pe.get_data(target_rva, 4)
    except Exception:
        return 'unreadable'

    if len(raw) < 4:
        return 'unreadable'

    as_float = struct.unpack('<f', raw)[0]
    as_int = struct.unpack('<I', raw)[0]
    return f'[{target_rva:#x}] = {as_float:.6g} ({as_int:#010x})'


def disassemble(pe, ends, rva):
    """Disassemble one function and return its annotated lines."""
    base = pe.OPTIONAL_HEADER.ImageBase

    # The exception directory often splits one function into several pieces,
    # so its end is only a lower bound. Read up to 64 KiB and stop at the
    # first return or jump that no earlier branch jumps past.
    recorded_end = ends.get(rva, rva + 16)
    code = pe.get_data(rva, 0x10000)

    decoder = Cs(CS_ARCH_X86, CS_MODE_64)
    # "detail" mode exposes each operand, so RIP-relative reads can be found.
    decoder.detail = True

    lines = []
    furthest_target = base + recorded_end
    for instruction in decoder.disasm(code, base + rva):
        text = f'{instruction.address - base:#x}: '
        text += f'{instruction.mnemonic} {instruction.op_str}'

        # Remember the furthest forward branch inside this function.
        is_branch = instruction.mnemonic.startswith('j')
        if is_branch and instruction.op_str.startswith('0x'):
            target = int(instruction.op_str, 16)
            if base + rva < target < base + rva + 0x10000:
                furthest_target = max(furthest_target, target)

        # Annotate reads of fixed data stored inside the executable.
        for operand in instruction.operands:
            if operand.type == X86_OP_MEM and operand.mem.base == X86_REG_RIP:
                next_address = instruction.address + instruction.size
                target = next_address + operand.mem.disp - base
                text += '  ; ' + describe_constant(pe, target)

        lines.append(text)

        # Stop after a return or unconditional jump once nothing jumps past it.
        next_address = instruction.address + instruction.size
        leaves = instruction.mnemonic in ('ret', 'jmp', 'int3')
        if leaves and next_address > furthest_target:
            break

    return lines


def main():
    """Write one annotated .asm file per RVA given on the command line."""
    pe, ends = load_executable()

    for value in sys.argv[1:]:
        rva = int(value, 0)
        lines = disassemble(pe, ends, rva)

        path = ROOT.parent / 'disasm' / f'map-zoom-{rva:x}.asm'
        path.write_text('\n'.join(lines), encoding='utf-8')
        print(f'{path.name}: {len(lines)} instructions')


if __name__ == '__main__':
    main()
