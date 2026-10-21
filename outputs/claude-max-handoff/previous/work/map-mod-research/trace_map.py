"""Locate current native map-controller registrations in the on-disk PE image.

This only disassembles the installed file. No game process is opened or changed.
"""
import json
import struct
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT / "deps"))
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe")
data = path.read_bytes()
pe = pefile.PE(data=data, fast_load=True)
base = pe.OPTIONAL_HEADER.ImageBase
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
names = [
    b"UIGamePlayControlRootWorldMap",
    b"UIGamePlayControlRootMiniMap",
    b"WorldMapPinMarker",
    b"ChangeMinimapMarker",
    b"WorldmapFindPath",
    b"WorldMapPinMark",
    b"MapIcon_PathFinderDestination",
    b"MapIcon_Pin_Marker",
    b"selector-keyguide-find-path",
    b"selector-keyguide-pin-mark",
]
targets = {}
for name in names:
    cursor = 0
    while (cursor := data.find(name + b"\0", cursor)) >= 0:
        targets[pe.get_rva_from_offset(cursor)] = name.decode()
        cursor += len(name)

results = []
for section in pe.sections:
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    for prefix in (b"\x48\x8d", b"\x4c\x8d"):
        cursor = 0
        while (cursor := raw.find(prefix, cursor)) >= 0:
            if cursor + 7 <= len(raw) and raw[cursor + 2] & 0xC7 == 0x05:
                rva = section.VirtualAddress + cursor
                destination = rva + 7 + struct.unpack_from("<i", raw, cursor + 3)[0]
                if destination in targets:
                    begin = max(0, cursor - 32)
                    instructions = [f"{ins.address - base:#x}: {ins.mnemonic} {ins.op_str}"
                        for ins in decoder.disasm(raw[begin:cursor + 100], base + section.VirtualAddress + begin)]
                    results.append({"name": targets[destination], "rva": hex(rva), "context": instructions})
            cursor += 2
(ROOT / "controller-references.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
print(json.dumps(results, indent=2))
