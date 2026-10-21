"""Find bounded RIP-relative address references for save/load string candidates.

What it does:
    Given target RVAs on the command line (for example the addresses of text
    strings related to saving and loading), finds code that points at them:
    direct calls (opcode E8), "lea" address computations and 64-bit "mov"
    loads that use a RIP-relative operand. Each hit is reported with the
    function that contains it ("owner"). Read-only: the game is not started
    or modified.

    This is a byte-pattern scan, not full disassembly, so a hit can also be
    a coincidental byte sequence; check hits by disassembling the owner.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    RIP-relative reference - in 64-bit x86 code a global address is usually
        written as "[rip + disp32]": the address of the *next* instruction plus
        a signed 32-bit distance (disp32) stored inside the instruction. So the
        referenced RVA = instruction RVA + instruction length + disp32.
        A direct call "E8 rel32" works the same way (5 bytes long).
    ModRM byte - the byte after the opcode that selects the operand form.
        (modrm & 0xc7) == 5 is the bit pattern meaning "[rip + disp32]".
    Exception directory - a table inside 64-bit Windows executables that
        lists where (most) functions begin and end. Used here only to find
        function boundaries.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints a JSON list of {target, reference, owner}.
Run:    python -B research/scripts/find_save_load_references.py 0x... [0x... ...]
        (from the repository root)
"""
import bisect
import json
import struct
import sys
from pathlib import Path
# Folder containing this script (research/scripts). The bundled third-party
# libraries live next to it in research/deps, so add that folder to Python's
# import search path before importing them.
ROOT=Path(__file__).resolve().parent
sys.path.insert(0,str(ROOT.parent / 'deps'))
# pefile reads the Windows executable file format ("PE").
import pefile
# Open the installed game executable for reading only. fast_load skips
# parsing tables that are not needed here.
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
# Data directory 3 is the exception directory: its entries record where each
# function starts and ends (as RVAs), which gives us function boundaries.
pe.parse_data_directories(directories=[3])
# (start, end) RVA of every function, plus a list of just the starts so
# bisect can binary-search it.
entries=[(e.struct.BeginAddress,e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION]
starts=[e[0] for e in entries]
# Addresses to look for, from the command line (hex like 0x... or decimal).
targets={int(value,0) for value in sys.argv[1:]}
# One entry per reference found.
results=[]
# Only scan executable sections: 0x20000000 is the PE "memory is executable"
# flag, so data-only sections are skipped.
for section in pe.sections:
    if not section.Characteristics & 0x20000000: continue
    raw=section.get_data()
    # Opcodes checked: E8 = call rel32 (5 bytes); 48/4C 8D = lea; 48/4C 8B =
    # 64-bit mov load. The last four are 7 bytes long with [rip + disp32]:
    # prefix, opcode, ModRM byte, 4-byte distance.
    for opcode in (b'\xe8',b'\x48\x8d',b'\x4c\x8d',b'\x48\x8b',b'\x4c\x8b'):
        cursor=0
        # Try every position where these opcode bytes appear.
        # (":=" saves the search result in cursor; find() returns -1 when done.)
        while (cursor:=raw.find(opcode,cursor))>=0:
            length = 5 if len(opcode) == 1 else 7
            # Must fit in the section; for the 7-byte forms the ModRM byte (the
            # third byte) must select [rip + disp32].
            if cursor+length<=len(raw) and (length==5 or raw[cursor+2]&0xc7==5):
                rva=section.VirtualAddress+cursor
                # The signed 32-bit distance is the last 4 bytes of the
                # instruction; add it to the address of the next instruction.
                destination=rva+length+struct.unpack_from('<i',raw,cursor+length-4)[0]
                if destination in targets:
                    # Find the containing function: the last function starting at or before
                    # this RVA (binary search with bisect), if the RVA is also before its end.
                    # 0 means no recorded function contains it.
                    index=bisect.bisect_right(starts,rva)-1
                    owner=entries[index][0] if index>=0 and rva<entries[index][1] else 0
                    results.append({'target':hex(destination),'reference':hex(rva),'owner':hex(owner)})
            # Step one byte so overlapping candidates are also checked.
            cursor+=1
# Print all hits as JSON.
print(json.dumps(results,indent=2))
