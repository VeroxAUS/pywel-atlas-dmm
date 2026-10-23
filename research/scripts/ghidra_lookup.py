"""Search the Ghidra export of the game executable from the command line.

What it does:
    Reads the plain-text export written by research/scripts/ghidra/
    ExportDecompiled.java (functions.tsv, strings.tsv, symbols.tsv and
    the decomp/ folder) and answers the questions we ask most while
    modding: "what does the function at this RVA look like", "which
    functions mention this constant or string", "where is this string
    stored" and "where is this class's virtual function table".
    Read-only: nothing is written and the game is not started.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        counted from the start of the loaded image. The export, the hooks
        and the disassembly listings in this repository all use RVAs.
    Decompiled C - Ghidra's reconstruction of a function as C-like source.
        Names like FUN_1400e13cf0 are made from the address, and types are
        guesses; the control flow and constants are what to trust.

Reads:  D:/Modding/pywel-atlas-ghidra/export (override with --export DIR)
Run:    python -B research/scripts/ghidra_lookup.py func 0xe13cf0
        python -B research/scripts/ghidra_lookup.py grep 0x90100000
        python -B research/scripts/ghidra_lookup.py grep "FUN_14186e450\\(" --names
        python -B research/scripts/ghidra_lookup.py string MapIcon_Gimmick
        python -B research/scripts/ghidra_lookup.py callers 0x186e450
        python -B research/scripts/ghidra_lookup.py symbol MapIcon
        python -B research/scripts/ghidra_lookup.py vftable 0x552b078
        (from the repository root)
"""

import argparse
import bisect
import re
import sys
from pathlib import Path

DEFAULT_EXPORT = Path("D:/Modding/pywel-atlas-ghidra/export")
IMAGE_BASE = 0x140000000

# Each decompiled function in the chunk files starts with this header line.
HEADER_RE = re.compile(r"^// ===== FUNC rva=([0-9a-f]+) va=[0-9a-f]+ size=(\d+) name=(.*) =====$")


def parse_rva(text):
    """Accepts '0xe13cf0', 'e13cf0' or a full address like 0x1400e13cf0."""
    value = int(text, 16)
    if value >= IMAGE_BASE:
        value -= IMAGE_BASE
    return value


def load_functions(export_dir):
    """Returns a sorted list of (rva, size, name, namespace) from functions.tsv."""
    rows = []
    with open(export_dir / "functions.tsv", encoding="utf-8") as handle:
        next(handle)
        for line in handle:
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 4:
                continue
            rows.append((int(parts[0], 16), int(parts[1]), parts[2], parts[3]))
    rows.sort()
    return rows


def find_containing(functions, rva):
    """Finds the function whose entry is at or just before the RVA."""
    starts = [row[0] for row in functions]
    index = bisect.bisect_right(starts, rva) - 1
    if index < 0:
        return None
    row = functions[index]
    # Functions can have gaps, so only treat the RVA as inside the function
    # when it falls within the reported size.
    if rva != row[0] and rva >= row[0] + row[1]:
        return None
    return row


def chunk_file(export_dir, rva):
    """Returns the chunk file that holds the function starting at this RVA."""
    return export_dir / "decomp" / f"rva_{rva >> 20:03x}.c"


def read_function_text(export_dir, rva):
    """Returns the decompiled text of the function whose entry is this RVA."""
    path = chunk_file(export_dir, rva)
    if not path.exists():
        return None

    wanted = f"// ===== FUNC rva={rva:x} "
    collected = []
    inside = False

    with open(path, encoding="utf-8", errors="replace") as handle:
        for line in handle:
            if line.startswith("// ===== FUNC "):
                if inside:
                    break
                inside = line.startswith(wanted)
            if inside:
                collected.append(line)

    return "".join(collected) if collected else None


def iter_functions_text(export_dir):
    """Yields (rva, name, text) for every function in every chunk file."""
    for path in sorted((export_dir / "decomp").glob("rva_*.c")):
        rva = None
        name = None
        lines = []
        with open(path, encoding="utf-8", errors="replace") as handle:
            for line in handle:
                match = HEADER_RE.match(line.rstrip("\n"))
                if match:
                    if rva is not None:
                        yield rva, name, "".join(lines)
                    rva = int(match.group(1), 16)
                    name = match.group(3)
                    lines = [line]
                else:
                    lines.append(line)
        if rva is not None:
            yield rva, name, "".join(lines)


def command_func(args, export_dir):
    """Prints the decompiled function at (or containing) an RVA."""
    rva = parse_rva(args.rva)
    functions = load_functions(export_dir)
    row = find_containing(functions, rva)
    if row is None:
        print(f"no function contains rva {rva:x}")
        return 1
    if row[0] != rva:
        print(f"// rva {rva:x} is inside function {row[0]:x} ({row[2]})")
    text = read_function_text(export_dir, row[0])
    if text is None:
        print(f"function {row[0]:x} is in functions.tsv but not in the decomp files")
        return 1
    sys.stdout.write(text)
    return 0


def command_grep(args, export_dir):
    """Lists functions whose decompiled text matches a regular expression."""
    pattern = re.compile(args.pattern, re.IGNORECASE if args.ignore_case else 0)
    hits = 0
    for rva, name, text in iter_functions_text(export_dir):
        matches = [line for line in text.splitlines()[1:] if pattern.search(line)]
        if not matches:
            continue
        hits += 1
        print(f"{rva:x}\t{name}\t{len(matches)} line(s)")
        if not args.names:
            for line in matches[: args.max_lines]:
                print("    " + line.strip())
        if args.limit and hits >= args.limit:
            print("... stopped at --limit")
            break
    print(f"{hits} function(s) matched")
    return 0


def command_callers(args, export_dir):
    """Lists functions that call the function at an RVA (by Ghidra's name)."""
    rva = parse_rva(args.rva)
    functions = load_functions(export_dir)
    row = find_containing(functions, rva)
    if row is None or row[0] != rva:
        print(f"no function starts at rva {rva:x}")
        return 1
    name = row[2]
    pattern = re.compile(re.escape(name) + r"\s*\(")
    print(f"callers of {rva:x} {name}:")
    count = 0
    for caller_rva, caller_name, text in iter_functions_text(export_dir):
        if caller_rva == rva:
            continue
        if pattern.search(text):
            count += 1
            print(f"{caller_rva:x}\t{caller_name}")
    print(f"{count} caller(s)")
    return 0


def command_string(args, export_dir):
    """Lists strings from strings.tsv containing the given text."""
    needle = args.text.lower()
    count = 0
    with open(export_dir / "strings.tsv", encoding="utf-8", errors="replace") as handle:
        next(handle)
        for line in handle:
            if needle in line.lower():
                sys.stdout.write(line)
                count += 1
    print(f"{count} string(s)")
    return 0


def command_symbol(args, export_dir):
    """Lists symbols from symbols.tsv whose name or namespace contains text."""
    path = export_dir / "symbols.tsv"
    if not path.exists():
        print("symbols.tsv not found; rerun run-headless.ps1 export")
        return 1
    needle = args.text.lower()
    count = 0
    with open(path, encoding="utf-8", errors="replace") as handle:
        next(handle)
        for line in handle:
            parts = line.rstrip("\n").split("\t")
            if len(parts) < 4:
                continue
            haystack = (parts[1] + "\t" + parts[2]).lower()
            if needle in haystack and (not args.vftables or parts[1] == "vftable"):
                sys.stdout.write(line)
                count += 1
                if args.limit and count >= args.limit:
                    print("... stopped at --limit")
                    break
    print(f"{count} symbol(s)")
    return 0


def command_vftable(args, export_dir):
    """Prints the function slots of a virtual function table at an RVA."""
    rva = parse_rva(args.rva)
    functions = load_functions(export_dir)
    by_rva = {row[0]: row for row in functions}
    slots = read_vftable_slots(export_dir, functions, rva, args.max_slots)
    if slots is None:
        print(f"no vftable data at rva {rva:x} (is it listed in symbols.tsv?)")
        return 1
    for index, target in enumerate(slots):
        row = by_rva[target]
        namespace = f" [{row[3]}]" if row[3] else ""
        print(f"slot {index:3d}  +{index * 8:#05x}  {target:x}\t{row[2]}{namespace}")
    print(f"{len(slots)} slot(s); the table ends at the next label, the first non-function pointer, or --max-slots")
    return 0


def read_vftable_slots(export_dir, functions, rva, max_slots):
    """Reads consecutive 8-byte function pointers from the game executable.

    The export has no raw bytes, so this reads the executable itself
    (read-only). It stops at the next named symbol, at the first pointer that
    is not a known function entry, or after max_slots entries.
    """
    exe = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe")
    if not exe.exists():
        print(f"executable not found: {exe}")
        return None

    # pefile is vendored in research/deps, next to this script's folder.
    sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "deps"))
    import pefile

    pe = pefile.PE(str(exe), fast_load=True)
    next_symbol = next_symbol_rva(export_dir, rva)
    entries = {row[0] for row in functions}
    slots = []
    offset = rva
    while len(slots) < max_slots:
        if next_symbol is not None and offset >= next_symbol:
            break
        try:
            raw = pe.get_data(offset, 8)
        except Exception:
            break
        if len(raw) < 8:
            break
        value = int.from_bytes(raw, "little")
        if value < IMAGE_BASE:
            break
        target = value - IMAGE_BASE
        if target not in entries:
            break
        slots.append(target)
        offset += 8
    return slots if slots else None


def next_symbol_rva(export_dir, rva):
    """Returns the RVA of the first named symbol after the given one, if any."""
    path = export_dir / "symbols.tsv"
    if not path.exists():
        return None
    best = None
    with open(path, encoding="utf-8", errors="replace") as handle:
        next(handle)
        for line in handle:
            parts = line.split("\t", 1)
            try:
                candidate = int(parts[0], 16)
            except ValueError:
                continue
            if candidate > rva and (best is None or candidate < best):
                best = candidate
    return best


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--export", type=Path, default=DEFAULT_EXPORT, help="export folder")
    subparsers = parser.add_subparsers(dest="command", required=True)

    func_parser = subparsers.add_parser("func", help="print the function at an RVA")
    func_parser.add_argument("rva")
    func_parser.set_defaults(handler=command_func)

    grep_parser = subparsers.add_parser("grep", help="find functions whose C matches a regex")
    grep_parser.add_argument("pattern")
    grep_parser.add_argument("--names", action="store_true", help="only list function names")
    grep_parser.add_argument("-i", "--ignore-case", action="store_true")
    grep_parser.add_argument("--max-lines", type=int, default=5, help="matching lines shown per function")
    grep_parser.add_argument("--limit", type=int, default=0, help="stop after this many functions")
    grep_parser.set_defaults(handler=command_grep)

    callers_parser = subparsers.add_parser("callers", help="list functions calling the one at an RVA")
    callers_parser.add_argument("rva")
    callers_parser.set_defaults(handler=command_callers)

    string_parser = subparsers.add_parser("string", help="find strings containing text")
    string_parser.add_argument("text")
    string_parser.set_defaults(handler=command_string)

    symbol_parser = subparsers.add_parser("symbol", help="find labels (vftables, RTTI, data) by name")
    symbol_parser.add_argument("text")
    symbol_parser.add_argument("--vftables", action="store_true", help="only class vftable labels")
    symbol_parser.add_argument("--limit", type=int, default=0, help="stop after this many symbols")
    symbol_parser.set_defaults(handler=command_symbol)

    vftable_parser = subparsers.add_parser("vftable", help="list the function slots of a vftable at an RVA")
    vftable_parser.add_argument("rva")
    vftable_parser.add_argument("--max-slots", type=int, default=512)
    vftable_parser.set_defaults(handler=command_vftable)

    args = parser.parse_args()
    if not args.export.exists():
        print(f"export folder not found: {args.export}")
        return 1
    return args.handler(args, args.export)


if __name__ == "__main__":
    sys.exit(main())
