"""Locate current native map-controller registrations in the on-disk PE image.

This only disassembles the installed file. No game process is opened or changed.

What it does, in plain terms:
    "PE" (Portable Executable) is the Windows .exe file format. The game
    executable contains map-related names such as
    "UIGamePlayControlRootWorldMap", "WorldMapPinMarker" and
    "selector-keyguide-pin-mark". This script:
      1. finds where each name is stored, as an RVA (a position measured
         from the start of the program in memory);
      2. scans the executable code for "lea" instructions (which load an
         address into a register) that point at one of those names;
      3. for each hit, saves a short disassembly around it -- about 32 bytes
         before to 100 bytes after -- showing the machine code as readable
         CPU instructions. This shows where the game registers or uses those
         map controllers and actions.

Reads: the installed game executable, read-only.
Writes: controller-references.json next to this script, and prints it.

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
# pefile parses the .exe format; capstone is a disassembler library.
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64

path = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe")
data = path.read_bytes()
pe = pefile.PE(data=data, fast_load=True)
# ImageBase = preferred load address; real address = ImageBase + RVA.
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
# Name RVA -> name text, for every stored copy of each name.
targets = {}
for name in names:
    cursor = 0
    # Require a terminating zero byte so only the exact whole name matches.
    while (cursor := data.find(name + b"\0", cursor)) >= 0:
        targets[pe.get_rva_from_offset(cursor)] = name.decode()
        cursor += len(name)

results = []
for section in pe.sections:
    # 0x20000000 = section is executable code; skip data sections.
    if not section.Characteristics & 0x20000000:
        continue
    raw = section.get_data()
    # 48 8D / 4C 8D = "lea" instruction (with a 64-bit register prefix).
    for prefix in (b"\x48\x8d", b"\x4c\x8d"):
        cursor = 0
        while (cursor := raw.find(prefix, cursor)) >= 0:
            # Byte 3 must mean "[rip + 32-bit offset]": the target is a
            # distance from the next instruction (RIP = instruction pointer).
            # Such a lea is 7 bytes long.
            if cursor + 7 <= len(raw) and raw[cursor + 2] & 0xC7 == 0x05:
                rva = section.VirtualAddress + cursor
                destination = rva + 7 + struct.unpack_from("<i", raw, cursor + 3)[0]
                if destination in targets:
                    # Disassemble a small window around the reference.
                    # (Starting 32 bytes early may begin mid-instruction, so
                    # the first lines of context can be imprecise.)
                    begin = max(0, cursor - 32)
                    instructions = [f"{ins.address - base:#x}: {ins.mnemonic} {ins.op_str}"
                        for ins in decoder.disasm(raw[begin:cursor + 100], base + section.VirtualAddress + begin)]
                    results.append({"name": targets[destination], "rva": hex(rva), "context": instructions})
            cursor += 2
(ROOT / "controller-references.json").write_text(json.dumps(results, indent=2), encoding="utf-8")
print(json.dumps(results, indent=2))
