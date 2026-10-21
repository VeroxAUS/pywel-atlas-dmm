"""Read-only disassembly helpers for the player-position research.

What it does, in plain terms:
    The mod wants the player's live world position (to show markers only near
    the player). This script answers small static questions about the
    installed game executable, one sub-command at a time. It only reads the
    .exe file; the game is not started or changed.

Sub-commands:
    func RVA [RVA ...]
        Disassemble whole functions (start and end come from the exception
        table) and write each to research/disasm/player-position-<rva>.asm.
    writes START END DISP [DISP ...]
        In every function that starts inside [START, END), list instructions
        that WRITE memory at one of the given displacements (for example 0xe0,
        the icon position field). Stack-based writes (RSP/RBP) are skipped.
    reads START END DISP [DISP ...]
        Same, but list instructions that READ memory at those displacements.
    callers RVA [RVA ...]
        Find direct calls/jumps (E8/E9 rel32) to each RVA and name the
        function that contains each call ("owner").
    vtable RVA COUNT
        Print the first COUNT 8-byte slots of a vtable (as RVAs).
    entries LOW HIGH
        List function entries starting inside [LOW, HIGH).
    raw START END
        Disassemble an arbitrary range.
    floats RVA [COUNT]
        Print 32-bit floats stored at an RVA (constants).
    site RVA [RVA ...] BEFORE AFTER
        Print BEFORE/AFTER instructions around each site.
    pointers RVA [RVA ...]
        Find 8-byte absolute pointers to each RVA (vtable slots, tables).
    refs RVA [RVA ...]
        Find RIP-relative references (lea/mov/call through [rip+disp32]) to
        each RVA, e.g. the code that installs a vtable (a constructor).

Key terms:
    RVA ("relative virtual address") - an offset inside the executable as it
        is laid out in memory. Full address = ImageBase + RVA.
    Displacement - the constant in a memory operand, as in [rcx + 0xe0].
    vtable - a table of function addresses shared by all objects of one C++
        class; slot N is at byte offset N*8.
    Exception table - a list of where (most) functions begin and end.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile and capstone are imported from research/deps)
Writes: research/disasm/player-position-<rva>.asm for "func"; otherwise prints.
Run:    python -B research/scripts/player_position_scan.py func 0xdabd10
        (from the repository root)
"""
import bisect
import struct
import sys
from pathlib import Path

# The bundled third-party libraries live in research/deps.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / "deps"))

import numpy as np
import pefile
from capstone import CS_ARCH_X86, CS_MODE_64, Cs
from capstone.x86_const import (
    X86_OP_MEM,
    X86_REG_RBP,
    X86_REG_RIP,
    X86_REG_RSP,
)

EXE = "E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe"

# Open the executable read-only. Directory 3 is the exception table.
pe = pefile.PE(EXE, fast_load=True)
pe.parse_data_directories(directories=[3])
base = pe.OPTIONAL_HEADER.ImageBase

# Function boundaries: (start, end) pairs sorted by start.
entries = sorted(
    {(e.struct.BeginAddress, e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION}
)
starts = [entry[0] for entry in entries]
ends = dict(entries)

decoder = Cs(CS_ARCH_X86, CS_MODE_64)
decoder.detail = True

# Mnemonics that never write their first (memory) operand.
NON_WRITING = {
    "cmp", "test", "push", "call", "jmp", "ucomiss", "comiss", "vucomiss",
    "vcomiss", "bt", "prefetcht0", "prefetchw", "nop",
}


def code_sections():
    """Return every section marked executable.

    This executable's section names are scrambled (code lives in sections
    named ".rsrc", ".xtls" and ".text"), so use the executable flag instead
    of trusting names.
    """
    return [s for s in pe.sections if s.Characteristics & 0x20000000]


def owner_of(rva):
    """Return the (start, end) of the function containing rva, or None."""
    index = bisect.bisect_right(starts, rva) - 1
    if index >= 0 and entries[index][0] <= rva < entries[index][1]:
        return entries[index]
    return None


def disassemble(start, end):
    """Decode the instructions between two RVAs."""
    return list(decoder.disasm(pe.get_data(start, end - start), base + start))


def format_instruction(ins):
    """One 'rva: mnemonic operands' line."""
    return f"{ins.address - base:#x}: {ins.mnemonic} {ins.op_str}"


def command_func(values):
    """Write whole-function disassembly files."""
    for value in values:
        rva = int(value, 0)
        end = ends.get(rva, rva + 0x400)
        lines = [format_instruction(ins) for ins in disassemble(rva, end)]
        path = ROOT.parent / "disasm" / f"player-position-{rva:x}.asm"
        path.write_text("\n".join(lines), encoding="utf-8")
        print(f"{path.name}: {len(lines)} instructions (end {end:#x})")


def memory_access(values, want_write):
    """List reads or writes at given displacements inside a function range."""
    low = int(values[0], 0)
    high = int(values[1], 0)
    displacements = {int(value, 0) for value in values[2:]}
    for start, end in entries:
        if not low <= start < high:
            continue
        for ins in disassemble(start, end):
            operands = ins.operands
            for position, operand in enumerate(operands):
                if operand.type != X86_OP_MEM or operand.mem.disp not in displacements:
                    continue
                if operand.mem.base in (X86_REG_RSP, X86_REG_RBP, X86_REG_RIP):
                    continue
                # Intel order: a memory first operand is the destination.
                writes = position == 0 and len(operands) > 1 and ins.mnemonic not in NON_WRITING
                if writes == want_write:
                    print(f"func {start:#x}  {format_instruction(ins)}")


def scan_rel32(target, extras):
    """Yield (section, rva of the rel32 field) for every 4-byte signed field
    whose "next instruction RVA + value" equals target.

    `extras` lists how many bytes may follow the field before the next
    instruction starts (0 for calls and most loads, 1 or 4 when an
    immediate follows). Uses numpy in chunks so all code is scanned quickly.
    """
    for section in code_sections():
        data = section.get_data()
        section_rva = section.VirtualAddress
        raw = np.frombuffer(data, dtype=np.uint8)
        chunk = 1 << 24
        for offset in range(0, len(raw) - 4, chunk):
            window = raw[offset : offset + chunk + 3].astype(np.int64)
            count = len(window) - 3
            value = (
                window[:count]
                | (window[1 : count + 1] << 8)
                | (window[2 : count + 2] << 16)
                | (window[3 : count + 3] << 24)
            )
            value = np.where(value >= 1 << 31, value - (1 << 32), value)
            positions = np.arange(offset, offset + count, dtype=np.int64)
            for extra in extras:
                matches = np.nonzero(value + positions == target - section_rva - 4 - extra)[0]
                for match in matches:
                    yield section, section_rva + offset + int(match), extra


def command_callers(values):
    """Find E8/E9 rel32 call/jump sites that target each RVA."""
    for value in values:
        target = int(value, 0)
        print(f"target {target:#x}:")
        for section, field, _ in scan_rel32(target, (0,)):
            opcode = pe.get_data(field - 1, 1)[0]
            if opcode not in (0xE8, 0xE9):
                continue
            site = field - 1
            owner = owner_of(site)
            kind = "call" if opcode == 0xE8 else "jmp"
            name = f"{owner[0]:#x}" if owner else "?"
            print(f"  {kind} at {site:#x} owner {name}")


def command_vtable(values):
    """Print vtable slots as RVAs."""
    rva = int(values[0], 0)
    count = int(values[1], 0)
    raw = pe.get_data(rva, count * 8)
    for slot in range(count):
        pointer = struct.unpack_from("<Q", raw, slot * 8)[0]
        print(f"slot {slot * 8:#05x}: {pointer - base:#x}")


def command_refs(values):
    """Find RIP-relative references to each RVA (numpy scan, then decode)."""
    for value in values:
        target = int(value, 0)
        for section, field, extra in scan_rel32(target, (0, 1, 4)):
            next_rva = field + 4 + extra
            # Try the longest plausible encoding first; skip byte patterns
            # that only decode as arithmetic-with-carry noise.
            for back in range(9, 0, -1):
                start = field - back
                decoded = list(decoder.disasm(pe.get_data(start, 16), base + start, 1))
                if not decoded or decoded[0].address - base + decoded[0].size != next_rva:
                    continue
                ins = decoded[0]
                if ins.mnemonic in ("adc", "sbb", "in", "out", "insb", "outsb"):
                    continue
                if ins.mnemonic in ("call", "jmp") and ins.op_str.startswith("0x"):
                    owner = owner_of(start)
                    name = f"{owner[0]:#x}" if owner else "?"
                    print(f"ref {target:#x} at {format_instruction(ins)} owner {name}")
                    break
                if any(op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP for op in ins.operands):
                    owner = owner_of(start)
                    name = f"{owner[0]:#x}" if owner else "?"
                    print(f"ref {target:#x} at {format_instruction(ins)} owner {name}")
                    break


def command_pointers(values):
    """Find 8-byte absolute pointers to each RVA anywhere in the file
    (vtable slots and other tables)."""
    for value in values:
        needle = struct.pack("<Q", base + int(value, 0))
        for section in pe.sections:
            data = section.get_data()
            position = data.find(needle)
            while position != -1:
                print(f"pointer {int(value, 0):#x} at {section.VirtualAddress + position:#x}")
                position = data.find(needle, position + 1)


def command_site(values):
    """Print the instructions around each site RVA, decoding from the start
    of the function that contains it so instruction boundaries are right.
    Optional trailing "-B N -A M" style is replaced by two numbers at the end:
    entries LOW HIGH
        List function entries starting inside [LOW, HIGH).
    raw START END
        Disassemble an arbitrary range.
    floats RVA [COUNT]
        Print 32-bit floats stored at an RVA (constants).
    site RVA [RVA ...] BEFORE AFTER."""
    before = int(values[-2], 0)
    after = int(values[-1], 0)
    for value in values[:-2]:
        site = int(value, 0)
        owner = owner_of(site)
        if not owner:
            print(f"site {site:#x}: no owner")
            continue
        instructions = disassemble(owner[0], owner[1])
        addresses = [ins.address - base for ins in instructions]
        index = bisect.bisect_left(addresses, site)
        print(f"---- site {site:#x} in {owner[0]:#x}")
        for ins in instructions[max(0, index - before) : index + after + 1]:
            print(format_instruction(ins))


def command_entries(values):
    """List exception-table function entries that start inside [LOW, HIGH)."""
    low = int(values[0], 0)
    high = int(values[1], 0)
    for start, end in entries:
        if low <= start < high:
            print(f"function {start:#x} .. {end:#x}")


def command_raw(values):
    """Disassemble an arbitrary [START, END) range (START must be an
    instruction boundary)."""
    for ins in disassemble(int(values[0], 0), int(values[1], 0)):
        print(format_instruction(ins))


def command_floats(values):
    """Print COUNT 32-bit floats (and their hex) stored at an RVA."""
    rva = int(values[0], 0)
    count = int(values[1], 0) if len(values) > 1 else 1
    raw = pe.get_data(rva, count * 4)
    if len(raw) < count * 4:
        print(f"{rva:#x}: not stored in the file (zero-filled data, set at run time)")
        return
    for index in range(count):
        number = struct.unpack_from("<f", raw, index * 4)[0]
        bits = struct.unpack_from("<I", raw, index * 4)[0]
        print(f"{rva + index * 4:#x}: {number!r} (0x{bits:08x})")


COMMANDS = {
    "entries": command_entries,
    "raw": command_raw,
    "floats": command_floats,
    "site": command_site,
    "func": command_func,
    "writes": lambda values: memory_access(values, True),
    "reads": lambda values: memory_access(values, False),
    "callers": command_callers,
    "vtable": command_vtable,
    "refs": command_refs,
    "pointers": command_pointers,
}

if __name__ == "__main__":
    COMMANDS[sys.argv[1]](sys.argv[2:])
