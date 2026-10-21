"""Shared constants and Windows API setup for an external teleport tool.

What it is, in plain terms:
    This file appears to be a reference copy of a module from a separate
    project, not one of this repository's research scripts. Judging by its
    contents (the "cd_server" logger name, a "CD_Teleport" settings folder,
    and teleport/hook names), it belongs to a tool that attaches to the
    running game process. It is kept here as evidence of how that tool was
    set up; this file itself only defines values and does no work.

What it defines:
    - PROCESS_NAME: the game process to look for (CrimsonDesert.exe).
    - SAVE_DIR / HOOK_OFFSETS_FILE: a CD_Teleport folder under the user's
      LOCALAPPDATA, and a JSON file there for remembered hook offsets.
    - HEIGHT_BOOST: a fixed number (10.0) used elsewhere in that tool.
    - k32: access to Windows' kernel32.dll, with argument/return types
      declared for VirtualAllocEx and VirtualFreeEx. Those Windows functions
      reserve and free memory inside *another* process.
    - MEM_* / PAGE_EXECUTE_READWRITE: standard Windows flag values for those
      memory calls (commit, reserve, release; memory that may hold code and
      be read and written).

Reads/writes: nothing when imported, beyond reading environment variables.

Legacy: copied from another codebase; it is not wired into this repository.
The hyphen in the file name means it cannot be imported under this name,
and the package it came from is not present here. Windows-only (ctypes.windll).
"""
import ctypes
import ctypes.wintypes
import logging
import os
import sys

log = logging.getLogger('cd_server')

# True when running as a "frozen" packaged executable (e.g. built with a
# bundler); the name suggests it controls redacting details in output.
_REDACT = getattr(sys, 'frozen', False)

PROCESS_NAME = "CrimsonDesert.exe"
SAVE_DIR = os.path.join(os.environ.get("LOCALAPPDATA", ""), "CD_Teleport")
HOOK_OFFSETS_FILE = os.path.join(SAVE_DIR, "cd_hook_offsets.json")
HEIGHT_BOOST = 10.0

# Declare exact argument and return types so 64-bit addresses and handles
# pass through ctypes without being cut down to 32 bits.
k32 = ctypes.windll.kernel32
k32.VirtualAllocEx.restype = ctypes.c_ulonglong
k32.VirtualAllocEx.argtypes = [
    ctypes.c_void_p, ctypes.c_ulonglong, ctypes.c_size_t,
    ctypes.c_ulong, ctypes.c_ulong,
]
k32.VirtualFreeEx.argtypes = [
    ctypes.c_void_p, ctypes.c_ulonglong, ctypes.c_size_t, ctypes.c_ulong,
]

# Standard Windows memory flags (values from the Windows SDK).
MEM_COMMIT  = 0x1000
MEM_RESERVE = 0x2000
MEM_RELEASE = 0x8000
PAGE_EXECUTE_READWRITE = 0x40
