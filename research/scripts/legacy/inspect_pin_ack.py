"""Locate pin acknowledgement methods through native RTTI, without loading code."""

import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "deps"))
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

data = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe").read_bytes()
pe = pefile.PE(data=data, fast_load=True)
pe.parse_data_directories(directories=[3])
base = pe.OPTIONAL_HEADER.ImageBase
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
ends = {entry.struct.BeginAddress: entry.struct.EndAddress for entry in pe.DIRECTORY_ENTRY_EXCEPTION}
rows = []
for name in ("TrocTrCreateOrChangePinMarkerAck", "TrocTrRemovePinMarkerAck"):
    text = f".?AV{name}@pa@@".encode()
    offset = data.find(text)
    if offset < 0:
        raise ValueError(f"Missing RTTI for {name}")
    type_rva = pe.get_rva_from_offset(offset - 16)
    cursor = 0
    while (cursor := data.find(struct.pack("<I", type_rva), cursor)) >= 0:
        col = cursor - 12
        signature, subobject, _, _, _, self_rva = struct.unpack_from("<6I", data, col)
        if signature == 1 and self_rva == pe.get_rva_from_offset(col):
            pointer = struct.pack("<Q", base + self_rva)
            table = data.find(pointer)
            while table >= 0:
                vtable = pe.get_rva_from_offset(table + 8)
                methods = []
                for slot in range(32):
                    address = struct.unpack_from("<Q", data, table + 8 + slot * 8)[0]
                    rva = address - base
                    if not 0 < rva < 0x5200000:
                        break
                    end = ends.get(rva, rva + 64)
                    instructions = [f"{ins.address - base:#x}: {ins.mnemonic} {ins.op_str}"
                        for ins in decoder.disasm(pe.get_data(rva, end-rva), address)]
                    methods.append({"slot": slot, "rva": hex(rva), "size": end-rva})
                    (ROOT / f"{name}-{slot}.asm").write_text("\n".join(instructions), encoding="utf-8")
                rows.append({"name": name, "subobject": subobject, "vtable": hex(vtable), "methods": methods})
                table = data.find(pointer, table + 8)
        cursor += 4
(ROOT / "pin-ack-methods.json").write_text(json.dumps(rows, indent=2), encoding="utf-8")
print(json.dumps(rows, indent=2))
