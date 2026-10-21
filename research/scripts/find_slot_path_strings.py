"""List strings that look like save-slot file names or paths.

What it does:
    Scans the installed Crimson Desert executable for ASCII and UTF-16 text
    containing "save.save", "slot%", "\\slot", ".tmp" and similar, and prints
    each with its RVA. Code that formats a slot's file path for writing should
    reference one of these. Read-only: the game is not started or modified.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints "A|W rva: text" lines (A = ASCII, W = UTF-16).
Run:    python -B research/scripts/find_slot_path_strings.py
"""
import re
import sys
from pathlib import Path
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
import pefile

pe = pefile.PE('E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe', fast_load=True)
PATTERN = re.compile(r'save\.save|slot%|slot\{|\\slot|/slot|\.save|save\.tmp|\.tmp|\.bak', re.I)
for section in pe.sections:
    data = section.get_data()
    # ASCII runs of 4+ printable characters.
    for match in re.finditer(rb'[\x20-\x7e]{4,}', data):
        text = match.group().decode('ascii')
        if PATTERN.search(text):
            print(f'A {section.VirtualAddress + match.start():#x}: {text[:120]}')
    # UTF-16 little-endian runs (Windows "wide" strings).
    for match in re.finditer(rb'(?:[\x20-\x7e]\x00){4,}', data):
        text = match.group().decode('utf-16le')
        if PATTERN.search(text):
            print(f'W {section.VirtualAddress + match.start():#x}: {text[:120]}')
