"""Find where Pywel Atlas's hooked game code went after a game update (e.g. the DLC).

What it does:
    Pywel Atlas only runs on the exact game build it was studied on. It checks
    the executable's build stamp and the first 24 bytes ("guard bytes") at
    every game function it hooks or calls, and installs nothing if anything
    differs. A game update moves almost all code, so after the DLC every
    address (RVA) in the mod has to be found again.

    This script does that work in two steps:

    1. snapshot (run NOW, on the current build, before the DLC update):
       For every address the mod uses it builds a "signature": the game's
       instruction bytes at that place, with the parts that always change
       between builds (jump/call distances and RIP-relative addresses)
       blanked out. Each signature is made just long enough to be unique in
       the current executable. It also records which globals those
       instructions point at, the class name (RTTI) behind every vtable the
       mod compares against, and one game instruction per struct offset the
       mod reads ("witnesses"). Everything goes into snapshot.json. With
       --copy-exe it also keeps a copy of the current executable, which
       Steam would otherwise overwrite.

    2. check (run after the update, on the new build):
       Looks for every signature in the new executable and reports, per
       address: unchanged, moved (new RVA and new guard bytes), moved with
       changed struct offsets, ambiguous, or lost. Globals and vtables are
       re-found from the moved instructions and from the class names, and
       each witness reports whether its struct offset changed.

    Nothing here edits source files, starts the game or writes game files.
    The report says what to change; a person updates the profile headers
    (or reruns the prepare_*.py generators with the new RVAs).

Key terms:
    RVA - "relative virtual address": an offset inside the loaded game
        executable. Real address = image base + RVA. Every address in the
        mod's source is an RVA.
    Signature - a byte pattern with blanks ("wildcards") that should match
        the same code in another build.
    Strict / loose - the strict signature keeps struct offsets and other
        constants literal; the loose one blanks them too. A loose-only match
        means the code is the same shape but some offsets changed.
    Witness - one game instruction that reads a struct field the mod also
        reads (for example the minimap controller's player position at
        +0x330). If the game's own code now uses another offset there, the
        mod's copy of that offset is out of date too.
    RTTI - type names the compiler stores beside each vtable
        (".?AVClientUserActor@pa@@"); they survive updates and lead back to
        the moved vtable.

Reads:  the game executable(s) given on the command line (read-only)
Writes: snapshot mode: <out>/snapshot.json (and a copy of the exe with --copy-exe)
        check mode: a Markdown report (path from --report, default beside the snapshot)
Run:    research/vendor/.venv/Scripts/python.exe -B dlc_exe_check.py snapshot
            --exe "E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe"
            --out research/dlc/pre-dlc --copy-exe
        research/vendor/.venv/Scripts/python.exe -B dlc_exe_check.py check
            --exe "E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe"
            --snapshot research/dlc/pre-dlc/snapshot.json
        Needs pefile and capstone (research/deps has both); numpy is optional
        and only used by --xref-globals to find code that uses a global.
"""
import argparse
import hashlib
import json
import shutil
import struct
import sys
from pathlib import Path

# The repository bundles pefile and capstone in research/deps; look there too
# when this file is copied into research/scripts/.
for candidate in (Path(__file__).resolve().parent.parent / "deps", Path(__file__).resolve().parent / "deps"):
    if candidate.is_dir():
        sys.path.insert(0, str(candidate))

import pefile  # noqa: E402
from capstone import CS_ARCH_X86, CS_MODE_64, CS_GRP_CALL, CS_GRP_JUMP, Cs  # noqa: E402
from capstone.x86 import X86_OP_MEM, X86_REG_RIP  # noqa: E402

# ---------------------------------------------------------------------------
# What the mod uses (as of v0.102, 2026-10-24). Each entry names the source
# file that holds the value, so the report says where to make the change.
# kind:
#   hook   - function entry the mod hooks (24-byte guard)
#   call   - game function the mod calls (24-byte guard)
#   stub   - 5-byte jump the mod calls; only the jump itself can be checked
#   guard  - code the mod only compares (a mid-function instruction)
#   return - return address the mod compares _ReturnAddress() with (no guard;
#            a stale value silently switches a feature off)
#   anchor - not used by the mod directly, but needed to find witnesses
# ---------------------------------------------------------------------------
CODE_SITES = [
    # src/marker-bell/category-profile.h, kInspectSites (index in brackets).
    ("icon-create", 0xDEEB60, "hook", "category-profile.h kInspectSites[0] (shared icon create)"),
    ("icon-type-lookup", 0x537250, "hook", "category-profile.h kInspectSites[1]"),
    ("icon-template-lookup", 0x388E00, "hook", "category-profile.h kInspectSites[2]"),
    ("world-find-icon", 0xDB8A00, "call", "category-profile.h kInspectSites[3] (world vtable slot 0x548)"),
    ("minimap-find-icon", 0xDEFFA0, "call", "category-profile.h kInspectSites[4] (minimap vtable slot 0x548)"),
    ("icon-set-hide-bit", 0xDECA40, "hook", "category-profile.h kInspectSites[5]"),
    ("world-icon-constructor", 0xDB3BD0, "hook", "category-profile.h kInspectSites[6]"),
    ("icon-initialize", 0xD8A970, "hook", "category-profile.h kInspectSites[7]"),
    ("world-projection", 0xD94040, "hook", "category-profile.h kInspectSites[8]"),
    ("icon-scale", 0xD91820, "hook", "category-profile.h kInspectSites[9]"),
    ("world-remove-icon", 0xDB8A60, "call", "category-profile.h kInspectSites[10] (world vtable slot 0x558)"),
    ("abyss-altitude-compare", 0xDB83AE, "guard", "category-profile.h kInspectSites[11] (vcomiss in 0xdb81e0)"),
    ("world-map-update", 0xDABD10, "hook", "category-profile.h kInspectSites[12] (world vtable slot 0x118)"),
    ("world-create-icon", 0xDB81E0, "anchor", "world vtable slot 0x550 (anchor for witnesses)"),
    # src/marker-bell/NativeMapCategoryProbe.cpp
    ("minimap-update", 0xE13CF0, "hook", "NativeMapCategoryProbe.cpp kMinimapUpdateRva (minimap vtable slot 0x118)"),
    ("minimap-remove-icon", 0xE09FC0, "call", "NativeMapCategoryProbe.cpp kMinimapRemoveRva (minimap vtable slot 0x558)"),
    ("minimap-create-icon", 0xE08D70, "anchor", "minimap vtable slot 0x550"),
    # src/marker-bell/MapTooltips.h
    ("tooltip-text", 0x3EDD6B0, "hook", "MapTooltips.h kTooltipTextRva"),
    ("tooltip-show-return-1", 0xDAECDA, "return", "MapTooltips.h kTooltipShowReturns[0]"),
    ("tooltip-show-return-2", 0xDAECEC, "return", "MapTooltips.h kTooltipShowReturns[1]"),
    ("tooltip-hide-return-1", 0xDAE670, "return", "MapTooltips.h kTooltipHideReturns[0]"),
    ("tooltip-hide-return-2", 0xDAAEAC, "return", "MapTooltips.h kTooltipHideReturns[1]"),
    ("tooltip-hide-return-3", 0xDA85CD, "return", "MapTooltips.h kTooltipHideReturns[2]"),
    ("tooltip-hide-return-4", 0xDB90EE, "return", "MapTooltips.h kTooltipHideReturns[3]"),
    ("tooltip-setup-return", 0xDB5585, "return", "MapTooltips.h kTooltipSetupReturn"),
    # src/marker-bell/MapKnowledgeCard.h
    ("card-fill-gimmick", 0xDBA0E0, "hook", "MapKnowledgeCard.h cardHooks fill-gimmick"),
    ("card-set-key", 0xF12770, "hook", "MapKnowledgeCard.h cardHooks set-key"),
    ("card-layout", 0xF09E70, "hook", "MapKnowledgeCard.h cardHooks layout"),
    ("card-set-text", 0x3ED4E00, "hook", "MapKnowledgeCard.h cardHooks set-text"),
    ("card-format-text", 0x647CB0, "hook", "MapKnowledgeCard.h cardHooks format-text"),
    ("card-set-markup", 0x3ED7F90, "hook", "MapKnowledgeCard.h cardHooks set-markup"),
    ("card-name-copy", 0x3D5F80, "hook", "MapKnowledgeCard.h cardHooks name-copy"),
    ("card-show-box", 0xDBA3F0, "stub", "MapKnowledgeCard.h kShowCardBoxRva (5-byte jump)"),
    ("card-set-mode", 0xDCF090, "stub", "MapKnowledgeCard.h kSetCardModeRva (5-byte jump)"),
    ("card-description-return", 0x3EEF5A1, "return", "MapKnowledgeCard.h kCardDescriptionCaller"),
    ("card-picture-return-1", 0xF0B677, "return", "MapKnowledgeCard.h kCardPictureReturns[0]"),
    ("card-picture-return-2", 0xF0B6EA, "return", "MapKnowledgeCard.h kCardPictureReturns[1]"),
    # src/save-detection/save-load-profile.h, kSaveLoadSites (18), plus one return.
    ("save-read-slot", 0x186F570, "hook", "save-load-profile.h (read save from slot)"),
    ("save-apply", 0x2941020, "hook", "save-load-profile.h (apply loaded save to world)"),
    ("save-load-slot-outer", 0x1042AAF0, "hook", "save-load-profile.h (outer load-this-slot)"),
    ("actor-context-cleanup", 0x206B750, "hook", "save-load-profile.h (actor context unload)"),
    ("steam-storage-start", 0xEF62160, "hook", "save-load-profile.h (Steam save storage start-up)"),
    ("field-ready", 0x219D7F0, "hook", "save-load-profile.h (field ready step)"),
    ("loading-reset", 0x77A220, "hook", "save-load-profile.h (early loading step)"),
    ("world-transition", 0x28F82A0, "hook", "save-load-profile.h (world/field transition)"),
    ("field-reload", 0x294D5B0, "hook", "save-load-profile.h (field reload)"),
    ("loading-controller-update", 0x7797F0, "hook", "save-load-profile.h (loading controller per frame)"),
    ("actor-resolver", 0x17EF9C0, "hook", "save-load-profile.h (find player actor)"),
    ("client-user-lookup", 0x8AE390, "hook", "save-load-profile.h (ClientActorManager +0x30)"),
    ("server-user-lookup", 0x2A82590, "hook", "save-load-profile.h (ServerActorManager +0x30)"),
    ("save-write-slot", 0x186E450, "hook", "save-load-profile.h (save game data to slot)"),
    ("storage-slot-3", 0x2356E20, "hook", "save-load-profile.h (storage vtable 0x59840c0 slot 3)"),
    ("storage-slot-4", 0xEF601B0, "hook", "save-load-profile.h (storage slot 4 target)"),
    ("storage-slot-5", 0x23571D0, "hook", "save-load-profile.h (storage slot 5)"),
    ("storage-slot-6", 0x2357C60, "hook", "save-load-profile.h (storage slot 6)"),
    ("resolver-registry-return", 0x17EFAA3, "return", "NativeSaveLoadProbe.cpp (resolver registry call return)"),
    # src/pywel-atlas/TestTeleporter.cpp (test build only)
    ("tp-player-lookup", 0x64F530, "call", "TestTeleporter.cpp kPlayerLookupRva (test build)"),
    ("tp-handle-release", 0x1434880, "call", "TestTeleporter.cpp kHandleReleaseRva (test build)"),
    ("tp-actor-lock", 0x393650, "call", "TestTeleporter.cpp kActorLockRva (test build)"),
    ("tp-set-world-position", 0x507140, "stub", "TestTeleporter.cpp kSetWorldPositionRva (jump, test build)"),
    ("tp-set-world-position-body", 0x8C8F660, "call", "TestTeleporter.cpp kSetWorldPositionBodyRva (test build)"),
    # src/marker-bell/build-profile.json (v0.4 destination proof; route work may reuse it)
    ("route-find-path-action", 0xDC32E0, "call", "build-profile.json find-path-action (route research)"),
    ("route-destination-handoff", 0xDEF810, "call", "build-profile.json destination-handoff (route research)"),
    ("route-saved-pin-action", 0xD91EF0, "call", "build-profile.json saved-pin-action (route research)"),
    ("route-saved-pin-handoff", 0xB84320, "call", "build-profile.json saved-pin-handoff (route research)"),
    ("route-new-pin-insert", 0x4955A9, "guard", "build-profile.json new-pin-insert (route research)"),
]

# Globals: RVA, name, where the mod keeps it, and the instructions known to
# read it (the snapshot adds any other reference it finds inside a site).
GLOBALS = [
    (0x6D6E418, "icon-table-pointer", "category-profile.h kIconTablePointerRva", [0x537265]),
    (0x6D69A80, "template-table-pointer", "category-profile.h kTemplateTablePointerRva", [0x388E15]),
    (0x6CDE048, "abyss-altitude-threshold",
     "category-profile.h kParentAltitudeThresholdRva, TestTeleporter.cpp kAltitudeThresholdRva", [0xDB83AE]),
    (0x6CAB9E8, "map-near-distance", "NativeMapCategoryProbe.cpp (F8 diagnostics only)", []),
    (0x6CABA88, "map-far-distance", "NativeMapCategoryProbe.cpp (F8 diagnostics only)", []),
    (0x6CAD108, "minimap-cell-size", "NativeMapCategoryProbe.cpp (F8 diagnostics only)", []),
    (0x6CAD158, "minimap-cell-window", "NativeMapCategoryProbe.cpp (F8 diagnostics only)", []),
    (0x6CAE808, "minimap-native-radius", "NativeMapCategoryProbe.cpp (F8 diagnostics only)", []),
    (0x5725E48, "tp-handle-type", "TestTeleporter.cpp kHandleTypeRva (test build)", []),
]

# Vtables the mod compares object headers against, and the slots it relies on.
VTABLES = [
    (0x566FF50, "world-map-controller", "NativeMapCategoryProbe.cpp (imageBase + 0x566ff50)", [0x118, 0x548, 0x550, 0x558]),
    (0x5674E00, "minimap-controller", "NativeMapCategoryProbe.cpp (imageBase + 0x5674e00)", [0x118, 0x548, 0x550, 0x558]),
    (0x5585C40, "actor-link-child-a", "NativeSaveLoadProbe.cpp", []),
    (0x5B1E2B0, "actor-link-child-b", "NativeSaveLoadProbe.cpp", []),
    (0x59840C0, "steam-save-storage", "NativeSaveLoadProbe.cpp (slots 3-6 hooked)", [0x18, 0x20, 0x28, 0x30]),
    (0x5B257A8, "server-user-actor", "NativeSaveLoadProbe.cpp", [0x30]),
    (0x55B59F0, "client-user-actor", "NativeSaveLoadProbe.cpp", [0x30]),
    (0x55BF248, "tp-movement-component", "TestTeleporter.cpp kComponentTableRva (test build)", []),
]

# Struct offsets the mod reads, each with one game instruction that uses the
# same offset (from research/disasm/*.asm) and the function it sits in.
# (object, offset, instruction RVA, anchor site name, what the mod uses it for)
WITNESSES = [
    ("minimap controller", 0x330, 0xE13E32, "minimap-update", "player world position (x, y, z)"),
    ("minimap controller", 0x569, 0xE13F2A, "minimap-update", "player is on the Abyss layer"),
    ("minimap controller", 0x530, 0xE13FEA, "minimap-update", "camera/heading lead for the HUD arrow (unconfirmed)"),
    ("minimap controller", 0x288, 0xE1432E, "minimap-update", "minimap icon list"),
    ("map icon", 0x1C0, 0xD9427E, "world-projection", "actor the icon follows (0 for ours)"),
    ("map icon", 0x1E8, 0xD9438C, "world-projection", "24 suppression (hide) bits"),
    ("map icon", 0x1EB, 0xD94B4E, "world-projection", "suppression bits, byte 3"),
    ("map icon", 0x1ED, 0xD95476, "world-projection", "visibility state byte"),
    ("map icon", 0x1F8, 0xD94E79, "world-projection", "three zoom windows (0x14 bytes each)"),
    ("map icon", 0x208, 0xD94E87, "world-projection", "main zoom window enabled byte (DisableZoomWindows)"),
    ("map icon", 0x260, 0xD94787, "world-projection", "icon UI element"),
    ("map icon", 0x288, 0xD94CEB, "world-projection", "icon type word"),
    ("map icon", 0x2B0, 0xD94814, "world-projection", "icon state"),
    ("map icon", 0x2B9, 0xD947DD, "world-projection", "icon dirty flag"),
    ("map icon", 0xDE, 0xD94253, "world-projection", "icon record fields (+0xde..)"),
    ("map icon", 0xE0, 0xD9465D, "world-projection", "icon record float (+0xe0)"),
    ("map icon", 0xE4, 0xD951EE, "world-projection", "icon height (Abyss layer routing)"),
    ("world map controller", 0xAA0, 0xD940BF, "world-projection", "camera distance"),
    ("world map controller", 0xABC, 0xD94687, "world-projection", "icon size curve input"),
    ("world map controller", 0xA9C, 0xD94677, "world-projection", "zoom value (F8 log)"),
    ("world map controller", 0xAE4, 0xD9467F, "world-projection", "zoom flag (F8 log)"),
    ("world map controller", 0xBF8, 0xD946A5, "world-projection", "map mode"),
    ("world map controller", 0xACE, 0xD949BD, "world-projection", "first-update flag"),
    ("icon definition", 0x2C, 0xD946F4, "world-projection", "icon group (0x20 Nexus, 0xffffffff gimmicks)"),
    ("icon definition", 0xB7, 0xDB839E, "world-create-icon", "altitude-based parent branch"),
    ("world map controller", 0x398, 0xDB8375, "world-create-icon", "map layer containers"),
    ("icon definition", 0xB0, 0xDB829A, "world-create-icon", "icon follows its actor (type 360)"),
]

GUARD_SIZE = 24
MAX_SIGNATURE = 96
SEARCH_LIMIT = 4


class Image:
    """One game executable laid out as in memory (sections at their RVAs)."""

    def __init__(self, path):
        """Read the PE file and copy each section to its RVA."""
        self.path = Path(path)
        data = self.path.read_bytes()
        self.sha256 = hashlib.sha256(data).hexdigest()
        pe = pefile.PE(data=data, fast_load=True)
        self.headers = pe.OPTIONAL_HEADER.SizeOfHeaders
        self.timestamp = pe.FILE_HEADER.TimeDateStamp
        self.size = pe.OPTIONAL_HEADER.SizeOfImage
        self.base = pe.OPTIONAL_HEADER.ImageBase
        self.memory = bytearray(self.size)
        self.memory[:self.headers] = data[:self.headers]
        # (start RVA, end RVA, executable?, name) for every section.
        self.sections = []
        for section in pe.sections:
            start = section.VirtualAddress
            raw = data[section.PointerToRawData:section.PointerToRawData + section.SizeOfRawData]
            length = min(len(raw), max(section.Misc_VirtualSize, 1), self.size - start)
            self.memory[start:start + length] = raw[:length]
            executable = bool(section.Characteristics & 0x20000000)
            name = section.Name.rstrip(b"\x00").decode("ascii", "replace")
            self.sections.append((start, start + max(section.Misc_VirtualSize, length), executable, name))
        del data
        self.disassembler = Cs(CS_ARCH_X86, CS_MODE_64)
        self.disassembler.detail = True

    def code_ranges(self):
        """Return (start, end) of every executable section."""
        return [(start, end) for start, end, executable, _ in self.sections if executable]

    def is_code(self, rva):
        """True if `rva` lies inside an executable section."""
        return any(start <= rva < end for start, end in self.code_ranges())

    def read(self, rva, size):
        """Return `size` bytes at `rva` (zeros past the end of the image)."""
        return self.memory[rva:rva + size].ljust(size, b"\x00")

    def u32(self, rva):
        """Read a 4-byte unsigned number at `rva`."""
        return struct.unpack_from("<I", self.memory, rva)[0]

    def u64(self, rva):
        """Read an 8-byte unsigned number at `rva`."""
        return struct.unpack_from("<Q", self.memory, rva)[0]

    def instructions(self, rva, size):
        """Disassemble up to `size` bytes starting at `rva`."""
        return list(self.disassembler.disasm(self.read(rva, size), rva))


# ---------------------------------------------------------------------------
# Signatures
# ---------------------------------------------------------------------------

def describe(instruction):
    """Return the facts about one instruction that a signature needs."""
    rip = any(op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP for op in instruction.operands)
    branch = instruction.group(CS_GRP_JUMP) or instruction.group(CS_GRP_CALL)
    target = None
    if rip:
        target = instruction.address + instruction.size + next(
            op.mem.disp for op in instruction.operands if op.type == X86_OP_MEM and op.mem.base == X86_REG_RIP)
    elif branch and instruction.imm_size:
        target = instruction.operands[0].imm if instruction.operands else None
    displacement = None
    if not rip and instruction.disp_size:
        displacement = next((op.mem.disp for op in instruction.operands if op.type == X86_OP_MEM), None)
    return {
        "rva": instruction.address,
        "size": instruction.size,
        "text": f"{instruction.mnemonic} {instruction.op_str}".strip(),
        "dispOffset": instruction.disp_offset,
        "dispSize": instruction.disp_size,
        "immOffset": instruction.imm_offset,
        "immSize": instruction.imm_size,
        "rip": rip,
        "branch": bool(branch),
        "target": target,
        "displacement": displacement,
    }


def masks(parts, start):
    """Build the strict and loose wildcard masks (1 = byte must match)."""
    total = sum(part["size"] for part in parts)
    strict = [1] * total
    loose = [1] * total
    for part in parts:
        base = part["rva"] - start
        def blank(mask, offset, size):
            """Wildcard `size` bytes at `offset` inside this instruction."""
            for index in range(size):
                mask[base + offset + index] = 0
        if part["rip"] and part["dispSize"]:
            blank(strict, part["dispOffset"], part["dispSize"])
            blank(loose, part["dispOffset"], part["dispSize"])
        if part["branch"] and part["immSize"]:
            blank(strict, part["immOffset"], part["immSize"])
            blank(loose, part["immOffset"], part["immSize"])
        # Loose also forgets struct offsets and other constants.
        if part["dispSize"]:
            blank(loose, part["dispOffset"], part["dispSize"])
        if part["immSize"]:
            blank(loose, part["immOffset"], part["immSize"])
    return strict, loose


def find_all(image, pattern, mask, limit=SEARCH_LIMIT, ranges=None):
    """Return up to `limit` RVAs where `pattern` matches under `mask`.

    To stay fast on a 300 MB executable it looks up the longest run of
    literal bytes with bytes.find, then checks the full pattern around it.
    """
    best_start, best_length, run_start = 0, 0, None
    for index, keep in enumerate(list(mask) + [0]):
        if keep and run_start is None:
            run_start = index
        elif not keep and run_start is not None:
            if index - run_start > best_length:
                best_start, best_length = run_start, index - run_start
            run_start = None
    if best_length == 0:
        return []
    anchor = bytes(pattern[best_start:best_start + best_length])
    hits = []
    memory = image.memory
    for start, end in ranges or image.code_ranges():
        position = memory.find(anchor, start + best_start, end)
        while position != -1:
            candidate = position - best_start
            if candidate + len(pattern) <= end and all(
                    not keep or memory[candidate + index] == pattern[index]
                    for index, keep in enumerate(mask)):
                hits.append(candidate)
                if len(hits) >= limit:
                    return hits
            position = memory.find(anchor, position + 1, end)
    return hits


def build_signature(image, rva, kind, offset_before=0):
    """Make the shortest unique strict signature for the code at `rva`.

    For a return address the signature starts at the call instruction just
    before it (offset_before bytes earlier), so it covers the call too.
    """
    start = rva - offset_before
    parts = [describe(item) for item in image.instructions(start, MAX_SIGNATURE)]
    if not parts:
        return None
    chosen = parts
    unique = False
    for count in range(2, len(parts) + 1):
        window = parts[:count]
        size = sum(part["size"] for part in window)
        if size < 12 and count < len(parts):
            continue
        strict, _ = masks(window, start)
        hits = find_all(image, image.read(start, size), strict, limit=2)
        if hits == [start]:
            chosen, unique = window, True
            break
    size = sum(part["size"] for part in chosen)
    strict, loose = masks(chosen, start)
    return {
        "start": start,
        "offset": offset_before,
        "bytes": image.read(start, size).hex(),
        "strict": "".join(map(str, strict)),
        "loose": "".join(map(str, loose)),
        "uniqueInOldBuild": unique,
        "instructions": chosen,
    }


def call_before(image, rva):
    """Return how many bytes before a return address its call starts (0 = unknown)."""
    if image.read(rva - 5, 1) == b"\xe8":
        return 5
    if image.read(rva - 6, 2) == b"\xff\x15":
        return 6
    return 0


# ---------------------------------------------------------------------------
# RTTI (class names beside vtables, MSVC x64 layout)
# ---------------------------------------------------------------------------

def vtable_class(image, vtable):
    """Return (class name, object offset) for a vtable, or (None, None)."""
    locator = image.u64(vtable - 8) - image.base
    if not 0 < locator < image.size - 24 or image.u32(locator) != 1:
        return None, None
    offset = image.u32(locator + 4)
    descriptor = image.u32(locator + 12)
    if not 0 < descriptor < image.size:
        return None, None
    name = image.memory[descriptor + 16:descriptor + 16 + 512].split(b"\x00", 1)[0]
    return name.decode("ascii", "replace"), offset


def find_vtables(image, name, offset):
    """Return every vtable RVA whose RTTI says class `name` at object `offset`."""
    found = []
    needle = name.encode("ascii") + b"\x00"
    position = image.memory.find(needle)
    while position != -1:
        descriptor = position - 16
        # Complete object locators: signature 1, offset, ..., descriptor, ..., self.
        probe = struct.pack("<I", descriptor)
        spot = image.memory.find(probe)
        while spot != -1:
            locator = spot - 12
            if locator > 0 and image.u32(locator) == 1 and image.u32(locator + 20) == locator and \
                    image.u32(locator + 4) == offset:
                pointer = struct.pack("<Q", image.base + locator)
                where = image.memory.find(pointer)
                while where != -1:
                    found.append(where + 8)
                    where = image.memory.find(pointer, where + 1)
            spot = image.memory.find(probe, spot + 1)
        position = image.memory.find(needle, position + 1)
    return sorted(set(found))


# ---------------------------------------------------------------------------
# Optional: find code that reads a global (needs numpy)
# ---------------------------------------------------------------------------

def global_references(image, target, limit=3):
    """Return instruction RVAs that use `target` RIP-relatively (numpy scan)."""
    import numpy
    hits = []
    for start, end in image.code_ranges():
        chunk = numpy.frombuffer(image.memory, dtype=numpy.uint8, count=end - start, offset=start)
        for alignment in range(4):
            count = (len(chunk) - alignment) // 4
            values = numpy.frombuffer(chunk[alignment:alignment + count * 4].tobytes(), dtype="<i4").astype(numpy.int64)
            positions = start + alignment + 4 * numpy.arange(count, dtype=numpy.int64)
            for tail in (0, 1, 2, 4):
                matches = numpy.nonzero(positions + 4 + tail + values == target)[0]
                for match in matches[:20]:
                    disp_at = int(positions[match])
                    # Walk back to an instruction that really uses the target.
                    for back in range(1, 12):
                        found = image.instructions(disp_at - back, 16)
                        if found and found[0].address + found[0].size > disp_at:
                            part = describe(found[0])
                            if part["rip"] and part["target"] == target:
                                hits.append(part["rva"])
                                break
                    if len(hits) >= limit:
                        return sorted(set(hits))
    return sorted(set(hits))


# ---------------------------------------------------------------------------
# Snapshot
# ---------------------------------------------------------------------------

def snapshot(arguments):
    """Record signatures, globals, vtables and witnesses of the current build."""
    image = Image(arguments.exe)
    out = Path(arguments.out)
    out.mkdir(parents=True, exist_ok=True)
    print(f"build: timestamp {image.timestamp}, image size {image.size}, sha256 {image.sha256}")
    result = {
        "exe": {"path": str(image.path), "timestamp": image.timestamp, "imageSize": image.size,
                "sha256": image.sha256},
        "sites": [], "globals": [], "vtables": [], "witnesses": [],
    }
    for name, rva, kind, source in CODE_SITES:
        before = call_before(image, rva) if kind == "return" else 0
        entry = {"name": name, "rva": rva, "kind": kind, "source": source,
                 "guard": image.read(rva, GUARD_SIZE).hex(), "callBefore": before}
        if kind == "stub":
            jump = image.read(rva, 5)
            entry["stubTarget"] = rva + 5 + struct.unpack("<i", jump[1:])[0] if jump[0] == 0xE9 else None
            entry["signature"] = build_signature(image, entry["stubTarget"], "stub-target") \
                if entry["stubTarget"] and image.is_code(entry["stubTarget"]) else None
        else:
            entry["signature"] = build_signature(image, rva, kind, before)
        signature = entry["signature"]
        print(f"  {name:28} 0x{rva:x} {kind:6} signature "
              f"{len(signature['bytes']) // 2 if signature else 0} bytes"
              f"{'' if signature and signature['uniqueInOldBuild'] else ' (NOT unique)'}")
        result["sites"].append(entry)
    for rva, name, source, references in GLOBALS:
        references = list(references)
        if not references and arguments.xref_globals:
            references = global_references(image, rva)
        signatures = [build_signature(image, reference, "xref") for reference in references]
        result["globals"].append({"name": name, "rva": rva, "source": source, "references": references,
                                  "signatures": signatures, "value": image.read(rva, 8).hex()})
        print(f"  global {name:24} 0x{rva:x} references {[hex(item) for item in references]}")
    for rva, name, source, slots in VTABLES:
        cls, offset = vtable_class(image, rva)
        slot_values = {hex(slot): image.u64(rva + slot) - image.base for slot in slots}
        result["vtables"].append({"name": name, "rva": rva, "source": source, "rtti": cls, "objectOffset": offset,
                                  "slots": slot_values})
        print(f"  vtable {name:24} 0x{rva:x} {cls} slots {({k: hex(v) for k, v in slot_values.items()})}")
    for owner, offset, rva, anchor, use in WITNESSES:
        anchor_rva = next(site[1] for site in CODE_SITES if site[0] == anchor)
        signature = build_signature(image, rva, "witness")
        first = signature["instructions"][0] if signature else {}
        ok = first.get("displacement") == offset
        result["witnesses"].append({"object": owner, "offset": offset, "rva": rva, "anchor": anchor,
                                    "anchorRva": anchor_rva, "use": use, "signature": signature,
                                    "verified": ok})
        print(f"  witness {owner:22} +0x{offset:x} at 0x{rva:x}: {first.get('text')}"
              f"{'' if ok else '  (offset not in this instruction!)'}")
    (out / "snapshot.json").write_text(json.dumps(result, indent=1), encoding="utf-8")
    print(f"wrote {out / 'snapshot.json'}")
    if arguments.copy_exe:
        copy = out / f"CrimsonDesert-{image.timestamp}.exe"
        shutil.copy2(image.path, copy)
        print(f"copied the executable to {copy}")


# ---------------------------------------------------------------------------
# Check
# ---------------------------------------------------------------------------

def locate(image, signature, expected=None, window=None):
    """Find a recorded signature in `image`. Returns (status, rva, loose?).

    status: "same", "moved", "ambiguous", "lost". With `window`
    (start, end) the search is limited to that range and the hit closest to
    `expected` wins.
    """
    if not signature:
        return "lost", None, False
    pattern = bytes.fromhex(signature["bytes"])
    for loose in (False, True):
        mask = [int(bit) for bit in signature["loose" if loose else "strict"]]
        ranges = [window] if window else None
        hits = find_all(image, pattern, mask, limit=SEARCH_LIMIT if not window else 64, ranges=ranges)
        if not hits:
            continue
        if window and expected is not None:
            hits.sort(key=lambda hit: abs(hit - expected))
            return ("same" if hits[0] == signature["start"] else "moved"), hits[0], loose
        if len(hits) == 1:
            return ("same" if hits[0] == signature["start"] else "moved"), hits[0], loose
        if signature["start"] in hits:
            return "same", signature["start"], loose
        return "ambiguous", hits, loose
    return "lost", None, False


def compare_parts(image, signature, new_start):
    """List struct offsets and constants that differ between the two builds."""
    old_parts = signature["instructions"]
    size = sum(part["size"] for part in old_parts)
    new_parts = [describe(item) for item in image.instructions(new_start, size + 16)][:len(old_parts)]
    changes = []
    for old, new in zip(old_parts, new_parts):
        if old["displacement"] is not None and old["displacement"] != new["displacement"]:
            changes.append(f"`{old['text']}` -> `{new['text']}`")
        elif not old["rip"] and not old["branch"] and old["immSize"] and old["text"] != new["text"]:
            changes.append(f"`{old['text']}` -> `{new['text']}`")
    return changes, new_parts


def c_bytes(data):
    """Format bytes the way the profile headers write them."""
    return ", ".join(f"0x{value:02x}" for value in data)


def check(arguments):
    """Find every recorded item in the new build and write a Markdown report."""
    recorded = json.loads(Path(arguments.snapshot).read_text(encoding="utf-8"))
    image = Image(arguments.exe)
    old = recorded["exe"]
    lines = ["# Pywel Atlas executable re-check", "",
             f"Old build: timestamp {old['timestamp']}, image size {old['imageSize']}, sha256 `{old['sha256']}`",
             f"New build: timestamp {image.timestamp}, image size {image.size}, sha256 `{image.sha256}`", ""]
    if image.sha256 == old["sha256"]:
        lines += ["The executable is unchanged; nothing to do.", ""]
    else:
        lines += ["Update `kExpectedTimestamp` / `kExpectedImageSize` (category-profile.h, display/inspect profiles, "
                  "TestTeleporter.cpp) and `kLoadTimestamp` / `kLoadImageSize` (save-load-profile.h) to the new "
                  "values, plus the sha256 in prepare_inspection.py and build-profile.json.", ""]

    # Code sites.
    new_rva = {}
    lines += ["## Code sites", "", "| Name | Kind | Old RVA | Result | New RVA | Notes |", "| --- | --- | --- | --- | --- | --- |"]
    details = []
    for site in recorded["sites"]:
        signature = site["signature"]
        notes = []
        if site["kind"] == "stub":
            jump = image.read(site["rva"], 5)
            still = jump[0] == 0xE9
            status, where, loose = locate(image, signature)
            target = where if status in ("same", "moved") else None
            if still and target is not None and site["rva"] + 5 + struct.unpack("<i", jump[1:])[0] == target:
                status, found = "same", site["rva"]
                notes.append("jump still at the old RVA and still reaches its old target code")
            else:
                found = None
                status = "manual"
                notes.append(f"jump target code {'found at 0x%x' % target if target is not None else 'not found'}; "
                             "find the new 5-byte jump to it (calls from card-fill-gimmick)")
        else:
            status, found, loose = locate(image, signature)
            if status in ("same", "moved"):
                found = found + site["callBefore"]
                new_rva[site["name"]] = found
                if loose:
                    changes, _ = compare_parts(image, signature, found - site["callBefore"])
                    status += " (offsets changed)"
                    notes += changes or ["constants differ"]
                guard = image.read(found, GUARD_SIZE)
                if site["kind"] in ("hook", "call", "guard") and (found != site["rva"] or guard.hex() != site["guard"]):
                    details.append((site, found, guard))
            elif status == "ambiguous":
                notes.append("candidates " + ", ".join(hex(item) for item in found[:SEARCH_LIMIT]))
                found = None
            if signature and not signature["uniqueInOldBuild"]:
                notes.append("signature was not unique even in the old build")
        lines.append(f"| {site['name']} | {site['kind']} | 0x{site['rva']:x} | {status} | "
                     f"{'0x%x' % found if isinstance(found, int) else '-'} | {'; '.join(notes) or site['source']} |")
    lines.append("")
    if details:
        lines += ["### New guard bytes", "", "Paste these into the profile header named in each line "
                  "(or rerun the prepare_*.py generator with the new RVA).", ""]
        for site, found, guard in details:
            lines += [f"- **{site['name']}** ({site['source']}): `{{0x{found:x}, {{{c_bytes(guard)}}}}}`"]
        lines.append("")

    # Globals.
    lines += ["## Globals", "", "| Name | Old RVA | New RVA | How found | Source |", "| --- | --- | --- | --- | --- |"]
    sites_by_rva = {site["rva"]: site for site in recorded["sites"]}
    for item in recorded["globals"]:
        votes = []
        for reference, signature in zip(item["references"], item["signatures"]):
            status, where, _ = locate(image, signature)
            if status in ("same", "moved"):
                first = describe(image.instructions(where, 16)[0])
                if first["rip"]:
                    votes.append(first["target"])
        found = sorted(set(votes))
        how = f"{len(votes)} of {len(item['references'])} reading instructions" if item["references"] else \
            "no known reading instruction (snapshot with --xref-globals, or ghidra_lookup.py)"
        lines.append(f"| {item['name']} | 0x{item['rva']:x} | "
                     f"{', '.join('0x%x' % value for value in found) or '-'} | {how} | {item['source']} |")
    lines.append("")

    # Vtables.
    lines += ["## Vtables", "", "| Name | Old RVA | RTTI | New RVA | Slots now point at | Source |",
              "| --- | --- | --- | --- | --- | --- |"]
    for item in recorded["vtables"]:
        if not item["rtti"]:
            lines.append(f"| {item['name']} | 0x{item['rva']:x} | (no RTTI) | - | - | {item['source']} |")
            continue
        found = find_vtables(image, item["rtti"], item["objectOffset"])
        slots = []
        for slot, old_target in item["slots"].items():
            if len(found) == 1:
                target = image.u64(found[0] + int(slot, 16)) - image.base
                match = next((name for name, rva in new_rva.items() if rva == target), None)
                slots.append(f"{slot}: 0x{target:x}" + (f" (= {match})" if match else ""))
        lines.append(f"| {item['name']} | 0x{item['rva']:x} | `{item['rtti']}` | "
                     f"{', '.join('0x%x' % value for value in found) or 'not found'} | "
                     f"{'; '.join(slots) or '-'} | {item['source']} |")
    lines.append("")

    # Witnesses.
    lines += ["## Struct offsets (witnesses)", "",
              "| Object | Offset | Used for | Result | Game instruction now |", "| --- | --- | --- | --- | --- |"]
    for item in recorded["witnesses"]:
        anchor = new_rva.get(item["anchor"])
        if anchor is None:
            lines.append(f"| {item['object']} | +0x{item['offset']:x} | {item['use']} | "
                         f"anchor {item['anchor']} not found | - |")
            continue
        expected = anchor + (item["rva"] - item["anchorRva"])
        window = (max(anchor, expected - 0x4000), expected + 0x4000)
        status, where, loose = locate(image, item["signature"], expected=expected, window=window)
        if status in ("same", "moved"):
            part = describe(image.instructions(where, 16)[0])
            now = part["displacement"]
            result = "unchanged" if now == item["offset"] else f"CHANGED to +0x{now:x}" if now is not None else "check"
            lines.append(f"| {item['object']} | +0x{item['offset']:x} | {item['use']} | {result} | "
                         f"0x{where:x} `{part['text']}` |")
        else:
            lines.append(f"| {item['object']} | +0x{item['offset']:x} | {item['use']} | not found near "
                         f"0x{expected:x} | - |")
    lines.append("")
    report = Path(arguments.report) if arguments.report else Path(arguments.snapshot).with_name("exe-recheck.md")
    report.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"wrote {report}")


def main():
    """Parse the command line and run snapshot or check."""
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    commands = parser.add_subparsers(dest="command", required=True)
    take = commands.add_parser("snapshot", help="record the current build (run before the update)")
    take.add_argument("--exe", required=True)
    take.add_argument("--out", required=True)
    take.add_argument("--copy-exe", action="store_true", help="also keep a copy of the executable")
    take.add_argument("--xref-globals", action="store_true", help="find code that reads each global (numpy)")
    test = commands.add_parser("check", help="find everything in a new build")
    test.add_argument("--exe", required=True)
    test.add_argument("--snapshot", required=True)
    test.add_argument("--report")
    arguments = parser.parse_args()
    snapshot(arguments) if arguments.command == "snapshot" else check(arguments)


if __name__ == "__main__":
    main()
