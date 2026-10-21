"""Summarize the world-map controller's native virtual methods."""
import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "deps"))
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64, CS_OP_MEM, CS_OP_IMM
from capstone.x86 import X86_REG_RIP

data = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe").read_bytes()
pe = pefile.PE(data=data, fast_load=True)
pe.parse_data_directories(directories=[3])
base = pe.OPTIONAL_HEADER.ImageBase
methods = struct.unpack_from("<140Q", data, pe.get_offset_from_rva(0x566ff50))
functions = {entry.struct.BeginAddress: entry.struct.EndAddress for entry in pe.DIRECTORY_ENTRY_EXCEPTION}
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
decoder.detail = True
results = []
for slot, pointer in enumerate(methods):
    rva = pointer - base
    if rva not in functions:
        continue
    end = functions[rva]
    code = pe.get_data(rva, end - rva)
    strings = []
    opening = []
    for index, instruction in enumerate(decoder.disasm(code, pointer)):
        if index < 18:
            opening.append(f"{instruction.address-base:#x}: {instruction.mnemonic} {instruction.op_str}")
        for operand in instruction.operands:
            if operand.type == CS_OP_MEM and operand.mem.base == X86_REG_RIP:
                target = instruction.address + instruction.size + operand.mem.disp - base
                if target < 0 or target >= pe.OPTIONAL_HEADER.SizeOfImage:
                    continue
                raw = pe.get_data(target, 160).split(b"\0", 1)[0]
                if len(raw) >= 5 and all(32 <= value <= 126 for value in raw):
                    text = raw.decode()
                    if text not in strings: strings.append(text)
    results.append({"slot": slot, "rva": hex(rva), "size": len(code), "opening": opening, "strings": strings[:80]})
(ROOT / "worldmap-methods.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
print(json.dumps([
    {"slot": row["slot"], "rva": row["rva"], "size": row["size"], "strings": row["strings"]}
    for row in results if row["slot"] >= 110
], indent=2))
