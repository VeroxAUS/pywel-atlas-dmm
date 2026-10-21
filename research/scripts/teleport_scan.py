"""Read-only helpers for the test-only teleporter research.

What it does, in plain terms:
    The test build wants to move the player the way the game itself does
    (fast travel, revive point, debug warp). This script answers small static
    questions about the installed game executable. It only reads the .exe
    file; the game is not started or changed.

    It reuses the helpers in player_position_scan.py (function table,
    disassembler, call/reference scans) and adds a few commands:

Sub-commands:
    strings WORD [WORD ...]
        Find ASCII and UTF-16 strings that contain any WORD. Print each
        string's RVA and the code that references it (lea/mov [rip+...]).
    func RVA [RVA ...]
        Write whole-function disassembly to research/disasm/teleport-<rva>.asm.
    head RVA [RVA ...]
        Print the first 24 bytes of each function (a guard, like the mod's
        existing byte checks before it installs a hook).
    calls RVA
        List the direct call targets inside one function (what it calls).
    texts RVA
        List every [rip+...] address in one function that points at text,
        with that text (enum name tables, log messages).
    owners RVA [RVA ...]
        Name the C++ class (from RTTI) whose vtable holds each function.
    vcalls SLOT [VALUE]
        Count virtual calls to vtable slot SLOT by the 'mov r9b, imm' value
        just before them; with VALUE, also list those call sites.
    Any other command is passed on to player_position_scan.py
        (callers, refs, pointers, vtable, site, raw, floats, entries ...).

Key terms:
    RVA ("relative virtual address") - an offset inside the executable as it
        is laid out in memory. Full address = ImageBase + RVA.
    Guard bytes - the first bytes of a function. A hook checks them first so
        it refuses to patch a different game build.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (through player_position_scan.py; pefile and capstone from research/deps)
Writes: research/disasm/teleport-<rva>.asm for "func"; otherwise prints.
Run:    python -B research/scripts/teleport_scan.py strings Teleport
        (from the repository root)
"""
import re
import struct
import sys

import player_position_scan as scan


def file_offset_to_rva(offset):
    """Convert a raw file offset to an RVA, or None if outside any section."""
    for section in scan.pe.sections:
        start = section.PointerToRawData
        if start <= offset < start + section.SizeOfRawData:
            return section.VirtualAddress + offset - start
    return None


def command_strings(words):
    """Print matching ASCII / UTF-16 strings with their code references."""
    raw = scan.pe.__data__
    needles = [word.encode() for word in words]
    ascii_pattern = re.compile(rb"[\x20-\x7e]{4,}")
    wide_pattern = re.compile(rb"(?:[\x20-\x7e]\x00){4,}")

    for kind, pattern in (("ascii", ascii_pattern), ("utf16", wide_pattern)):
        for match in pattern.finditer(raw):
            text = match.group()
            if kind == "utf16":
                text = text.decode("utf-16-le").encode()
            if not any(needle in text for needle in needles):
                continue

            # Skip RTTI names; find_rtti_names.py handles those.
            if text.startswith(b".?A"):
                continue

            rva = file_offset_to_rva(match.start())
            if rva is None:
                continue
            print(f"[{kind}] {rva:#x} {text[:120].decode()}")
            scan.command_refs([hex(rva)])


def command_func(values):
    """Write whole functions to research/disasm/teleport-<rva>.asm."""
    for value in values:
        rva = int(value, 0)
        end = scan.ends.get(rva, rva + 0x400)
        lines = [scan.format_instruction(ins) for ins in scan.disassemble(rva, end)]
        path = scan.ROOT.parent / "disasm" / f"teleport-{rva:x}.asm"
        path.write_text("\n".join(lines), encoding="utf-8")
        print(f"{path.name}: {len(lines)} instructions (end {end:#x})")


def command_head(values):
    """Print the first 24 bytes of each function as a hex guard."""
    for value in values:
        rva = int(value, 0)
        data = scan.pe.get_data(rva, 24)
        print(f"{rva:#x}: {data.hex(' ')}")


def command_calls(values):
    """List direct call targets inside the function that starts at RVA."""
    rva = int(values[0], 0)
    end = scan.ends.get(rva, rva + 0x400)
    for ins in scan.disassemble(rva, end):
        if ins.mnemonic == "call":
            print(scan.format_instruction(ins))


def read_text(rva):
    """Return the printable ASCII text stored at rva, or '' if none."""
    data = scan.pe.get_data(rva, 96)
    text = data.split(b"\0", 1)[0]
    if len(text) >= 3 and all(0x20 <= byte < 0x7F for byte in text):
        return text.decode()
    return ""


def command_texts(values):
    """Show every RIP-relative address in a function that points at text.

    Useful for enum name tables and log calls: each line is the
    instruction followed by the string it loads.
    """
    rva = int(values[0], 0)
    end = scan.ends.get(rva, rva + 0x400)
    for ins in scan.disassemble(rva, end):
        for operand in ins.operands:
            if operand.type != scan.X86_OP_MEM or operand.mem.base != scan.X86_REG_RIP:
                continue
            target = ins.address - scan.base + ins.size + operand.mem.disp
            text = read_text(target)
            if text:
                print(f"{scan.format_instruction(ins)}    ; {target:#x} '{text}'")


def vtable_name(slot_rva):
    """Walk back from a vtable slot to the vtable start and return
    (vtable RVA, slot offset, class name), or None.

    MSVC stores a pointer to the "complete object locator" (an RTTI record)
    just before each vtable. Its 6th field is its own RVA, which lets us
    recognise it; its 4th field leads to the class name text.
    """
    for back in range(0, 0x1000, 8):
        table = slot_rva - back
        locator = struct.unpack("<Q", scan.pe.get_data(table - 8, 8))[0] - scan.base
        try:
            fields = struct.unpack("<6I", scan.pe.get_data(locator, 24))
        except Exception:
            continue
        if fields[0] == 1 and fields[5] == locator:
            name = scan.pe.get_data(fields[3] + 16, 160).split(b"\0")[0]
            return table, back, name.decode("latin-1")
    return None


def command_owners(values):
    """For each function, list vtables that hold a pointer to it (class name
    and slot), so we know which C++ class method it is."""
    sections = [(section.VirtualAddress, section.get_data()) for section in scan.pe.sections]
    for value in values:
        rva = int(value, 0)
        needle = struct.pack("<Q", scan.base + rva)
        found = False
        for section_rva, data in sections:
            position = data.find(needle)
            while position != -1:
                found = True
                info = vtable_name(section_rva + position)
                if info:
                    print(f"{rva:#x}: vtable {info[0]:#x} slot {info[1]:#x} {info[2]}")
                else:
                    print(f"{rva:#x}: pointer at {section_rva + position:#x} (no vtable found)")
                position = data.find(needle, position + 1)
        if not found:
            print(f"{rva:#x}: no pointers (only direct calls)")


def command_vcalls(values):
    """Find virtual calls 'call [reg + SLOT]' and report the byte loaded by
    the nearest 'mov r9b, imm' before each (the 4th argument, e.g. the
    move type). Prints a count per value and the sites for one value.

    Usage: vcalls SLOT [VALUE]
    """
    slot = int(values[0], 0)
    wanted = int(values[1], 0) if len(values) > 1 else None
    patterns = [bytes([0xFF, modrm]) + slot.to_bytes(4, "little") for modrm in (0x90, 0x91, 0x92, 0x93, 0x96, 0x97)]
    counts = {}
    for section in scan.code_sections():
        data = section.get_data()
        for pattern in patterns:
            for match in re.finditer(re.escape(pattern), data):
                before = data[max(0, match.start() - 40) : match.start()]
                index = before.rfind(b"\x41\xb1")
                value = before[index + 2] if index != -1 else None
                counts[value] = counts.get(value, 0) + 1
                if wanted is not None and value == wanted:
                    site = section.VirtualAddress + match.start()
                    owner = scan.owner_of(site)
                    owner_text = f"{owner[0]:#x}" if owner else "?"
                    print(f"call [reg+{slot:#x}] at {site:#x} owner {owner_text}")
    print(f"slot {slot:#x}: r9b values {counts}")


COMMANDS = {
    "owners": command_owners,
    "vcalls": command_vcalls,
    "texts": command_texts,
    "strings": command_strings,
    "func": command_func,
    "head": command_head,
    "calls": command_calls,
}

if __name__ == "__main__":
    name = sys.argv[1]
    handler = COMMANDS.get(name) or scan.COMMANDS[name]
    handler(sys.argv[2:])
