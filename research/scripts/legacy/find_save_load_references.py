"""Find bounded RIP-relative address references for save/load string candidates.

What it does, in plain terms:
    Given one or more target addresses on the command line (typically the
    locations of save/load-related text strings found by inspect_save_load.py),
    this script scans the game's executable code for instructions that refer
    to those addresses. That reveals which functions use each string, which is
    a common way to find the code behind a feature.

    Addresses are RVAs ("relative virtual addresses": positions measured from
    where the program starts in memory).

    Instruction shapes checked (all address their target "RIP-relative",
    i.e. as a distance from the next instruction; RIP is the CPU's
    instruction pointer):
      - E8          call
      - 48 8D/4C 8D lea  (load an address into a register)
      - 48 8B/4C 8B mov  (load a value from memory into a register)

Reads: the installed game executable, read-only; target RVAs from argv.
Writes: nothing on disk; prints a JSON list of
{target, reference, owner} where owner is the start of the containing function.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (expects pefile in a "deps" folder next to the script and a
hard-coded Steam install path on drive E:).
"""
import bisect
import json
import struct
import sys
from pathlib import Path
ROOT=Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0,str(ROOT/'deps'))
# pefile reads the Windows "PE" (Portable Executable) .exe file format.
import pefile
pe=pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe',fast_load=True)
# Directory 3 is the exception table: on 64-bit Windows it lists the start
# and end of (nearly) every function, so it works as a function map.
pe.parse_data_directories(directories=[3])
entries=[(e.struct.BeginAddress,e.struct.EndAddress) for e in pe.DIRECTORY_ENTRY_EXCEPTION]
# Sorted list of function starts, used for fast "which function is this in?".
starts=[e[0] for e in entries]
# int(value, 0) accepts hex such as "0x1234" as well as decimal.
targets={int(value,0) for value in sys.argv[1:]}
results=[]
for section in pe.sections:
    # 0x20000000 = section is executable code; skip data sections.
    if not section.Characteristics & 0x20000000: continue
    raw=section.get_data()
    for opcode in (b'\xe8',b'\x48\x8d',b'\x4c\x8d',b'\x48\x8b',b'\x4c\x8b'):
        cursor=0
        while (cursor:=raw.find(opcode,cursor))>=0:
            # call = 5 bytes; RIP-relative lea/mov = 7 bytes.
            length = 5 if len(opcode) == 1 else 7
            # For lea/mov, byte 3 must mean "[rip + 32-bit offset]".
            if cursor+length<=len(raw) and (length==5 or raw[cursor+2]&0xc7==5):
                rva=section.VirtualAddress+cursor
                # Last 4 bytes = signed distance from the end of the instruction.
                destination=rva+length+struct.unpack_from('<i',raw,cursor+length-4)[0]
                if destination in targets:
                    # Binary search for the last function starting at or
                    # before this address; 0 if it is not inside one.
                    index=bisect.bisect_right(starts,rva)-1
                    owner=entries[index][0] if index>=0 and rva<entries[index][1] else 0
                    results.append({'target':hex(destination),'reference':hex(rva),'owner':hex(owner)})
            cursor+=1
print(json.dumps(results,indent=2))
