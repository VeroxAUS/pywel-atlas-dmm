"""Find code that refers to given addresses, and print the referring lines.

What it does:
    x86-64 code names most globals and constants "RIP-relative": the
    instruction stores a 4-byte distance from the end of the instruction to
    the target. This script scans the game's first (code) section for every
    4-byte value that, read as such a distance, lands exactly on one of the
    requested target RVAs. Each hit is then disassembled from a few bytes
    earlier, and only real instructions that really use that target are
    printed. Used to find who writes or reads a global such as the
    interned attribute names used by the world-map icon zoom range.
    Read-only: the game is not started or modified.

Key terms:
    RVA ("relative virtual address") - an offset inside the loaded image.
    RIP-relative - "this many bytes after the current instruction".
    Interned name - a text name the game converts once into a small number
        (stored in a global) so later lookups compare numbers, not text.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile, capstone and numpy; the first two from research/deps)
Writes: nothing; prints "target: rva instruction" lines.
Run:    python -B research/scripts/find_rip_references.py 0x6cd0150 0x6cd0154
        (from the repository root)
"""

import sys
from pathlib import Path

# Bundled third-party libraries live in research/deps.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))

import numpy
import pefile
from capstone import CS_ARCH_X86, CS_MODE_64, Cs

GAME = 'E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe'


def code_section(pe):
    """Return (start RVA, bytes) of the first section, which holds the code."""
    section = pe.sections[0]
    return section.VirtualAddress, section.get_data()


def candidate_offsets(start, data, target):
    """Return offsets whose 4 bytes, as a RIP distance, can reach `target`.

    The distance is measured from the end of the instruction. That end is
    the end of the 4 bytes, or up to 4 bytes later when an immediate value
    (for example "mov dword ptr [rip+x], 5") follows the distance.
    """
    count = (len(data) - 4) // 1
    raw = numpy.frombuffer(data, dtype=numpy.uint8)

    # Build every little-endian signed 32-bit value starting at each byte.
    values = (
        raw[0:count].astype(numpy.int64)
        | (raw[1 : count + 1].astype(numpy.int64) << 8)
        | (raw[2 : count + 2].astype(numpy.int64) << 16)
        | (raw[3 : count + 3].astype(numpy.int64) << 24)
    )
    values = numpy.where(values >= 1 << 31, values - (1 << 32), values)
    positions = numpy.arange(count, dtype=numpy.int64) + start

    hits = []
    for trailing in (0, 1, 2, 4):
        reached = positions + 4 + trailing + values
        hits.extend(numpy.nonzero(reached == target)[0].tolist())

    return sorted(set(hits))


def confirm(decoder, pe, start, data, offset, target):
    """Disassemble around a candidate and return the instruction, if real."""
    base = pe.OPTIONAL_HEADER.ImageBase

    # An instruction's distance field begins 2 to 10 bytes after its start.
    for back in range(2, 11):
        begin = offset - back
        if begin < 0:
            continue

        chunk = data[begin : begin + 16]
        for instruction in decoder.disasm(chunk, base + start + begin, 1):
            if 'rip' not in instruction.op_str:
                continue

            # Recompute the target exactly as the CPU would.
            text = instruction.op_str
            sign = -1 if 'rip - ' in text else 1
            marker = 'rip - ' if sign < 0 else 'rip + '
            distance = int(text.split(marker)[1].split(']')[0], 16) * sign
            end = instruction.address + instruction.size - base
            if end + distance == target:
                return f'{instruction.address - base:#x}: {instruction.mnemonic} {text}'

    return None


def main():
    """Print every confirmed reference to each target RVA."""
    pe = pefile.PE(GAME, fast_load=True)
    start, data = code_section(pe)
    decoder = Cs(CS_ARCH_X86, CS_MODE_64)

    for value in sys.argv[1:]:
        target = int(value, 0)
        seen = set()
        for offset in candidate_offsets(start, data, target):
            line = confirm(decoder, pe, start, data, offset, target)
            if line and line not in seen:
                seen.add(line)
                print(f'{target:#x}: {line}')


if __name__ == '__main__':
    main()
