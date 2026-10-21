"""Summarize the world-map controller's native virtual methods.

What it does, in plain terms:
    In C++ programs, an object that can behave differently per class keeps a
    pointer to a "vtable" (virtual method table): a list of addresses, one per
    overridable method. The research identified the world-map controller's
    vtable at RVA 0x566ff50 (an RVA is a position measured from the start of
    the program in memory). This script reads the first 140 entries of that
    table and, for each method, records:
      - its first 18 instructions (disassembly = machine code shown as
        readable CPU instructions),
      - any readable text strings the method refers to, which often hint at
        what the method is for.

Reads: the installed game executable, read-only (never run or modified).
Writes: worldmap-methods.json next to this script (all slots), and prints a
JSON summary of slots 110 and above.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (expects pefile/capstone in a "deps" folder next to the script and a
hard-coded Steam install path on drive E:).
"""
import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0, str(ROOT / "deps"))
# pefile reads the Windows "PE" (Portable Executable) .exe format;
# capstone is a disassembler library.
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM, CS_OP_IMM
from capstone.x86 import X86_REG_RIP

data = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe").read_bytes()
pe = pefile.PE(data=data, fast_load=True)
# Directory 3 = exception table, which lists start/end of (nearly) every
# function on 64-bit Windows; used here as a map of function boundaries.
pe.parse_data_directories(directories=[3])
# ImageBase = preferred load address; real address = ImageBase + RVA.
base = pe.OPTIONAL_HEADER.ImageBase
# Read 140 little-endian 8-byte pointers: the vtable entries.
methods = struct.unpack_from("<140Q", data, pe.get_offset_from_rva(0x566ff50))
functions = {entry.struct.BeginAddress: entry.struct.EndAddress for entry in pe.DIRECTORY_ENTRY_EXCEPTION}
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
# detail=True makes capstone report each instruction's operands.
decoder.detail = True
results = []
for slot, pointer in enumerate(methods):
    rva = pointer - base
    # Skip entries that do not point at the start of a known function.
    if rva not in functions:
        continue
    end = functions[rva]
    code = pe.get_data(rva, end - rva)
    strings = []
    opening = []
    for index, instruction in enumerate(decoder.disasm(code, pointer)):
        # Keep only the first 18 instructions as a short preview.
        if index < 18:
            opening.append(f"{instruction.address-base:#x}: {instruction.mnemonic} {instruction.op_str}")
        # Look for memory operands written relative to RIP (the instruction
        # pointer), i.e. references to fixed data such as strings.
        for operand in instruction.operands:
            if operand.type == CS_OP_MEM and operand.mem.base == X86_REG_RIP:
                # Target = address of next instruction + displacement, as an RVA.
                target = instruction.address + instruction.size + operand.mem.disp - base
                if target < 0 or target >= pe.OPTIONAL_HEADER.SizeOfImage:
                    continue
                # Read up to 160 bytes and cut at the first zero byte (end of
                # a C string). Keep it if it is 5+ printable ASCII characters.
                raw = pe.get_data(target, 160).split(b"\0", 1)[0]
                if len(raw) >= 5 and all(32 <= value <= 126 for value in raw):
                    text = raw.decode()
                    if text not in strings: strings.append(text)
    results.append({"slot": slot, "rva": hex(rva), "size": len(code), "opening": opening, "strings": strings[:80]})
(ROOT / "worldmap-methods.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
# Print only the later slots (110+), without the instruction previews.
print(json.dumps([
    {"slot": row["slot"], "rva": row["rva"], "size": row["size"], "strings": row["strings"]}
    for row in results if row["slot"] >= 110
], indent=2))
