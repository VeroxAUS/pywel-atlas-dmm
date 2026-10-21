"""Print the text stored at given RVAs in the game executable.

What it does:
    For each RVA on the command line, reads up to 120 bytes there and prints
    them as an ASCII string (stopping at the first zero byte), plus a UTF-16
    reading. Used to see which format string or name an instruction such as
    "lea r8, [rip + ...]" points at. Read-only.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Run:    python -B research/scripts/read_string_at.py 0x558ee38 0x57a9508
"""
import sys
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
for value in sys.argv[1:]:
    rva = int(value, 0)
    data = pe.get_data(rva, 120)
    ascii_text = data.split(b'\0', 1)[0].decode('latin-1')
    wide_text = data.decode('utf-16le', 'replace').split('\0', 1)[0]
    print(f'{rva:#x}: ascii={ascii_text!r} utf16={wide_text[:40]!r}')
