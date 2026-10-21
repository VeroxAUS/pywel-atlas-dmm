"""List text strings in the game executable that look related to saving.

What it does:
    Scans the installed Crimson Desert executable for printable ASCII strings
    (at least 6 characters) that contain words like "SaveSlot", "Save Slot",
    "AutoSave" or "WriteSave", and prints each one with its RVA. The goal is to
    find the game's own "save to slot" code, the same way the "Start Load
    SaveSlot" string led to the load function 0x186f570. Read-only: the game
    is not started or modified.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints "rva: string" lines.
Run:    python -B research/scripts/find_save_write_strings.py
        (from the repository root)
"""
import re
import sys
from pathlib import Path
# The bundled third-party libraries live in research/deps.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
# Words that suggest saving (case-insensitive). Load-only strings are kept
# too, so the save strings can be compared with the known load pair.
PATTERN = re.compile(rb'save ?slot|auto ?save|write ?save|save ?game|savedata|save ?file|quick ?save',
                     re.IGNORECASE)
# Printable ASCII runs of 6+ characters.
STRINGS = re.compile(rb'[\x20-\x7e]{6,}')
for section in pe.sections:
    data = section.get_data()
    for match in STRINGS.finditer(data):
        text = match.group()
        if PATTERN.search(text):
            rva = section.VirtualAddress + match.start()
            print(f'{rva:#x}: {text.decode("ascii")[:160]}')
