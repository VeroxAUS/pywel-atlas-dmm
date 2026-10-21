"""Locate pin acknowledgement methods through native RTTI, without loading code.

What it does, in plain terms:
    The game contains two C++ classes named TrocTrCreateOrChangePinMarkerAck
    and TrocTrRemovePinMarkerAck (by their names, replies about creating /
    changing or removing a pin marker). This script finds the code that
    belongs to those classes, starting only from their names.

    How: Microsoft's C++ compiler stores RTTI ("run-time type information")
    in the program -- small records that let the program know an object's
    class while running. The chain followed here is:
      1. The class name, stored in a mangled form like ".?AVName@pa@@"
         (the "pa@@" part means the class lives in a namespace called pa).
         The name sits 16 bytes into a "type descriptor" record.
      2. A "complete object locator" (COL) record that points back to that
         type descriptor. On 64-bit builds it is six 4-byte numbers:
         signature (1), sub-object offset, another offset, type descriptor
         RVA, class hierarchy RVA, and the COL's own RVA.
      3. The class's vtable (virtual method table: a list of addresses of
         its overridable methods). The 8 bytes just before a vtable hold the
         COL's address, so searching for that address finds the vtable.
    An RVA ("relative virtual address") is a position measured from the
    start of the program in memory.

    For every vtable found it disassembles up to 32 methods (shows their
    machine code as readable CPU instructions).

Reads: the installed game executable, read-only (never run or modified).
Writes, next to this script: <ClassName>-<slot>.asm for each method, and
pin-ack-methods.json summarizing classes, vtables and methods; the JSON is
also printed.

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
# pefile parses the Windows "PE" .exe format; capstone disassembles.
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

data = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe").read_bytes()
pe = pefile.PE(data=data, fast_load=True)
# Directory 3 = exception table: start/end of (nearly) every function.
pe.parse_data_directories(directories=[3])
# ImageBase = preferred load address; real address = ImageBase + RVA.
base = pe.OPTIONAL_HEADER.ImageBase
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
ends = {entry.struct.BeginAddress: entry.struct.EndAddress for entry in pe.DIRECTORY_ENTRY_EXCEPTION}
rows = []
for name in ("TrocTrCreateOrChangePinMarkerAck", "TrocTrRemovePinMarkerAck"):
    # Step 1: find the mangled class name in the file.
    text = f".?AV{name}@pa@@".encode()
    offset = data.find(text)
    if offset < 0:
        raise ValueError(f"Missing RTTI for {name}")
    # The type descriptor record begins 16 bytes before the name.
    type_rva = pe.get_rva_from_offset(offset - 16)
    cursor = 0
    # Step 2: look for every 4-byte value equal to the type descriptor RVA;
    # each could be the 4th field of a complete object locator (COL).
    while (cursor := data.find(struct.pack("<I", type_rva), cursor)) >= 0:
        # The 4th field is at byte 12, so the COL would start 12 bytes earlier.
        col = cursor - 12
        signature, subobject, _, _, _, self_rva = struct.unpack_from("<6I", data, col)
        # A genuine COL has signature 1 and its last field equals its own RVA.
        if signature == 1 and self_rva == pe.get_rva_from_offset(col):
            # Step 3: the vtable is preceded by the COL's full 8-byte address.
            pointer = struct.pack("<Q", base + self_rva)
            table = data.find(pointer)
            while table >= 0:
                vtable = pe.get_rva_from_offset(table + 8)
                methods = []
                for slot in range(32):
                    address = struct.unpack_from("<Q", data, table + 8 + slot * 8)[0]
                    rva = address - base
                    # Stop at the first entry that does not look like a code
                    # address (outside 0..0x5200000); the table has ended.
                    if not 0 < rva < 0x5200000:
                        break
                    # Function end from the exception table, else 64 bytes.
                    end = ends.get(rva, rva + 64)
                    instructions = [f"{ins.address - base:#x}: {ins.mnemonic} {ins.op_str}"
                        for ins in decoder.disasm(pe.get_data(rva, end-rva), address)]
                    methods.append({"slot": slot, "rva": hex(rva), "size": end-rva})
                    (ROOT / f"{name}-{slot}.asm").write_text("\n".join(instructions), encoding="utf-8")
                # subobject = offset of this part within a multiply-inherited
                # object (0 for the main vtable).
                rows.append({"name": name, "subobject": subobject, "vtable": hex(vtable), "methods": methods})
                # Look for further vtables that use the same COL.
                table = data.find(pointer, table + 8)
        cursor += 4
(ROOT / "pin-ack-methods.json").write_text(json.dumps(rows, indent=2), encoding="utf-8")
print(json.dumps(rows, indent=2))
