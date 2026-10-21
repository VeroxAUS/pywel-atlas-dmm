"""Read the observed pin listener and its direct callees from the installed PE.

What it does, in plain terms:
    "PE" (Portable Executable) is the Windows file format for .exe files.
    This script disassembles one function in the game executable -- that is,
    turns its machine-code bytes back into readable CPU instructions -- and
    then also disassembles every function that it directly calls or jumps to.
    By default it starts at RVA 0xe016b0, a function observed handling map
    pins (a "listener"); another start address can be given as the first
    command-line argument. An RVA ("relative virtual address") is a position
    measured from the start of the program as loaded in memory.

Reads: the installed game executable, read-only (never run or modified).
Writes: listener-<rva>.asm next to the script for every function inspected,
and prints the same listings.

Shared setup: several other legacy scripts run the first part of this file
with exec(), cutting the text at the line where the main section below first
calls inspect(). Everything above that point (imports, pe, base, ends,
decoder and the inspect() helper) must therefore stay valid on its own.
Note that inside those scripts "root" means *their* folder, because
__file__ then refers to the calling script.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (expects pefile/capstone in a "deps" folder next to the script and a
hard-coded Steam install path on drive E:).
"""
import sys
from pathlib import Path
root = Path(__file__).resolve().parent
# Make bundled third-party libraries in ./deps importable (old layout).
sys.path.insert(0, str(root / 'deps'))
# pefile parses the .exe format; capstone is a disassembler library.
import pefile
from capstone import Cs, CS_ARCH_X86, CS_MODE_64
pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
# Directory 3 = exception table. On 64-bit Windows it lists the start and end
# of (nearly) every function, so it serves as a map of function boundaries.
pe.parse_data_directories(directories=[3])
# ImageBase = preferred load address; real address = ImageBase + RVA.
base = pe.OPTIONAL_HEADER.ImageBase
# Function start RVA -> function end RVA.
ends = {entry.struct.BeginAddress: entry.struct.EndAddress for entry in pe.DIRECTORY_ENTRY_EXCEPTION}
# Disassembler for 64-bit x86 (x64) code.
decoder = Cs(CS_ARCH_X86, CS_MODE_64)
def inspect(rva):
    """Disassemble the function starting at `rva`, save and print it.

    Uses the exception table for the function's end; if the address is not
    a known function start, it takes 256 bytes instead. Writes
    listener-<rva>.asm into `root` and returns the decoded instructions.
    """
    end = ends.get(rva, rva + 256)
    instructions = list(decoder.disasm(pe.get_data(rva, end-rva), base+rva))
    lines = [f'{ins.address-base:#x}: {ins.mnemonic} {ins.op_str}' for ins in instructions]
    (root / f'listener-{rva:x}.asm').write_text('\n'.join(lines), encoding='utf-8')
    print('\n'.join(lines))
    return instructions
# Main section (not run by the scripts that borrow the code above):
# inspect the start function (argv[1] or 0xe016b0), then every function it
# calls or jumps to directly (operand is a plain hex address that is a known
# function start), printing "CALLEE <rva>" before each one.
instructions = inspect(int(sys.argv[1], 0) if len(sys.argv) > 1 else 0xe016b0)
for ins in instructions:
    if ins.mnemonic in ('call', 'jmp') and ins.op_str.startswith('0x'):
        target = int(ins.op_str, 16) - base
        if target in ends:
            print(f'CALLEE {target:#x}')
            inspect(target)
