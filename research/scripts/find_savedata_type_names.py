"""List save-record type names and progress-like field names in the game exe.

What it does:
    Scans the installed Crimson Desert executable for printable ASCII strings
    and prints two groups:
      1. names that end in "SaveData" (the game's save record types; a save
         file only lists the types it actually uses, so the exe shows the
         full set, including types an early save does not contain yet),
      2. field-like names (starting with "_") that suggest discovery or
         completion, for example "_isCompleted", "_discovered...",
         "_collected...", "_opened...", "_acquired...".
    The goal is to find which collectible families have their own save
    records. Read-only: the game is not started or modified.

Key terms:
    RVA ("relative virtual address") - an offset inside the executable as
        laid out in memory, counted from the start of the loaded image.

Reads:  E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe
        (pefile is imported from research/deps)
Writes: nothing; prints "rva: string" lines grouped by section.
Run:    python -B research/scripts/find_savedata_type_names.py
        (from the repository root)
"""
import re
import sys
from pathlib import Path

# The bundled third-party libraries live in research/deps.
ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT.parent / 'deps'))
import pefile  # noqa: E402

EXE = 'E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe'

# A whole string that is one identifier ending in SaveData (optionally with
# a suffix such as "_Element").
SAVE_TYPE = re.compile(rb'^[A-Za-z0-9_]*SaveData[A-Za-z0-9_]*$')

# Field names that suggest a progress flag or list.
PROGRESS_FIELD = re.compile(
    rb'^_[A-Za-z0-9_]*(complet|discover|collect|opened|acquire|obtain|unlock|'
    rb'found|visit|reveal|activat|achiev|learned|read|cleared|conquer)[A-Za-z0-9_]*$',
    re.IGNORECASE,
)

# Printable ASCII runs of 6+ characters.
STRINGS = re.compile(rb'[\x20-\x7e]{6,}')


def main():
    """Print matching strings once each, with the RVA of the first hit."""
    pe = pefile.PE(EXE, fast_load=True)
    save_types = {}
    fields = {}

    for section in pe.sections:
        data = section.get_data()
        for match in STRINGS.finditer(data):
            text = match.group()
            rva = section.VirtualAddress + match.start()
            if SAVE_TYPE.match(text):
                save_types.setdefault(text.decode(), rva)
            elif PROGRESS_FIELD.match(text):
                fields.setdefault(text.decode(), rva)

    print(f'== {len(save_types)} SaveData type names ==')
    for name, rva in sorted(save_types.items()):
        print(f'{rva:#x}: {name}')

    print(f'\n== {len(fields)} progress-like field names ==')
    for name, rva in sorted(fields.items()):
        print(f'{rva:#x}: {name}')


if __name__ == '__main__':
    main()
