"""Find RIP-relative loads/stores of the resolver's TLS-selected registry roots.

What it does:
    Given one or more target RVAs (addresses of global variables in the game
    executable), finds every instruction in executable code that loads,
    stores, compares or conditionally moves (cmove/cmovne) the value at
    exactly that address. Without arguments it uses the two default targets
    0x6d694d8 and 0x6d694e0. Read-only: the game is not started or modified.

    This is a byte-pattern scan, not full disassembly, so it only recognises
    the specific opcode forms listed in the code below.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    RIP-relative reference - in 64-bit x86 code a global address is usually
        written as "[rip + disp32]": the address of the *next* instruction plus
        a signed 32-bit distance (disp32) stored inside the instruction. So the
        referenced RVA = instruction RVA + instruction length + disp32.
    ModRM byte - the byte after the opcode that selects the operand form.
        (modrm & 0xc7) == 5 is the bit pattern meaning "[rip + disp32]".
    Exception directory - a table inside 64-bit Windows executables that
        lists where (most) functions begin and end. Used here only to find
        function boundaries.
        Used to name the function ("owner") that contains each reference.
    TLS - thread-local storage: data kept separately for each thread.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints a JSON list of {target, kind, reference, owner}.
Run:    python -B research/scripts/find_registry_globals.py [0x6d694d8 ...]
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
# Addresses to look for: from the command line, or the defaults when none
# are given (an empty set counts as false, so "or" picks the defaults).
targets={int(value,0) for value in sys.argv[1:]} or {0x6d694d8,0x6d694e0}
# One entry per reference found.
results=[]
# Only scan executable sections: 0x20000000 is the PE "memory is executable"
# flag, so data-only sections are skipped.
for section in pe.sections:
    if not section.Characteristics & 0x20000000: continue
    raw=section.get_data()
    # REX.W mov load/store and cmov with a [rip+disp32] operand.
    # Each pair is (opcode bytes, label for the report). 0x48 and 0x4c are
    # "REX" prefixes selecting 64-bit operands (0x4c also selects registers
    # r8-r15).
    for opcode,kind in ((b'\x48\x8b','load'),(b'\x4c\x8b','load'),(b'\x48\x89','store'),(b'\x4c\x89','store'),
                        (b'\x48\x0f\x45','cmovne'),(b'\x48\x0f\x44','cmove'),(b'\x48\x39','cmp'),(b'\x48\x3b','cmp')):
        # Try every position where these opcode bytes appear.
        cursor=0
        while (cursor:=raw.find(opcode,cursor))>=0:
            # The ModRM byte follows the opcode. A [rip + disp32] instruction is
            # opcode + ModRM (1 byte) + disp32 (4 bytes) long.
            modrm=cursor+len(opcode)
            length=len(opcode)+5
            # Accept only the [rip + disp32] form, fully inside the section.
            if modrm<len(raw) and raw[modrm]&0xc7==5 and cursor+length<=len(raw):
                rva=section.VirtualAddress+cursor
                # The referenced RVA (see "RIP-relative reference" above).
                destination=rva+length+struct.unpack_from('<i',raw,modrm+1)[0]
                if destination in targets:
                    # Find the containing function: the last function starting at or before
                    # this RVA (binary search with bisect), if the RVA is also before its end.
                    # 0 means no recorded function contains it.
                    index=bisect.bisect_right(starts,rva)-1
                    owner=entries[index][0] if index>=0 and rva<entries[index][1] else 0
                    results.append({'target':hex(destination),'kind':kind,'reference':hex(rva),'owner':hex(owner)})
            # Step one byte at a time so overlapping matches are not missed.
            cursor+=1
# Print the results sorted by target address, then by kind.
print(json.dumps(sorted(results,key=lambda r:(r['target'],r['kind'])),indent=2))
