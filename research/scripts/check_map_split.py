"""Check that the v0.122 map code split only moved code.

What it does:
    v0.122 split src/marker-bell/NativeMapCategoryProbe.cpp (4,700 lines) into
    several files without changing what the code does. This script compares the
    old single file (kept in research/baselines) with the new files and stops
    with an error if anything other than a move happened.

    Two checks:
    1. Code: the old file and the new files are cut into top-level pieces
       (each function, variable, type or setting). Comments are left out and
       spaces are evened out. Every old piece must appear exactly once in the
       new files, unchanged. The only new pieces allowed are declarations
       ("extern ..." lines and function lines ending in ";", which only say
       that something exists in another file) and the namespace wrapping.
    2. Text: every non-empty old line (comments included) must still exist in
       the new files, so no comment was lost either.

Reads:  research/baselines/NativeMapCategoryProbe-v0.121.cpp (the old file)
        src/marker-bell/MapMarkerShared.h and the split .cpp files
Run:    python -B research/scripts/check_map_split.py
"""
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
OLD = ROOT / "research" / "baselines" / "NativeMapCategoryProbe-v0.121.cpp"
MARKER = ROOT / "src" / "marker-bell"
NEW = ["MapMarkerShared.h", "MapHooks.cpp", "MapCategories.cpp", "MarkerService.cpp",
       "MarkerState.cpp", "IconDefinitions.cpp", "MapDiagnostics.cpp", "MinimapMarkers.cpp",
       "NativeMapCategoryProbe.cpp", "MapPublicApi.cpp"]


def pieces(text):
    """Cut C++ source into top-level pieces (also inside namespaces).

    Skips comments, strings and preprocessor lines; returns the code text of
    each declaration, definition or function, and the preprocessor lines."""
    found = []
    depth = 0
    namespace_depths = []
    start = None
    k = 0
    n = len(text)
    while k < n:
        c = text[k]
        # Comments: skipped (check 2 covers them).
        if text.startswith("//", k):
            end = text.find("\n", k)
            k = n if end < 0 else end
            continue
        if text.startswith("/*", k):
            k = text.find("*/", k) + 2
            continue
        # Preprocessor line (first non-space character of a line is #).
        if c == "#" and text[text.rfind("\n", 0, k) + 1:k].strip() == "":
            end = text.find("\n", k)
            end = n if end < 0 else end
            if start is None:
                found.append(text[k:end].strip())
            k = end
            continue
        # Strings and characters: skipped whole so their braces do not count.
        if c in "\"'":
            j = k + 1
            while text[j] != c:
                j += 2 if text[j] == "\\" else 1
            k = j + 1
            continue
        top = depth == (namespace_depths[-1] if namespace_depths else 0)
        if top and start is None and not c.isspace():
            start = k
        if c == "{":
            head = text[start:k] if start is not None else ""
            if top and re.fullmatch(r"\s*namespace\s*\w*\s*", head):
                depth += 1
                namespace_depths.append(depth)
                start = None
                k += 1
                continue
            depth += 1
        elif c == "}":
            depth -= 1
            if namespace_depths and depth == namespace_depths[-1] - 1:
                namespace_depths.pop()
                start = None
                k += 1
                continue
            if depth == (namespace_depths[-1] if namespace_depths else 0) and start is not None:
                j = k + 1
                while j < n and text[j] in " \t":
                    j += 1
                if j < n and text[j] == ";":
                    k = j
                found.append(text[start:k + 1])
                start = None
        elif c == ";" and top and start is not None:
            found.append(text[start:k + 1])
            start = None
        k += 1
    return [re.sub(r"\s+", " ", piece).strip() for piece in found]


def strip_comments_keep_layout(piece):
    """Pieces may hold comments inside them (inside functions); remove them."""
    piece = re.sub(r"//[^\n]*", "", piece)
    return re.sub(r"\s+", " ", piece).strip()


def is_declaration_only(piece):
    """An added line that only says something exists elsewhere, or wrapping."""
    if piece.startswith("extern ") or piece.startswith("using namespace "):
        return True
    if piece.startswith("#") :
        return True
    # A function declaration: ends in ");" and has no body or "=".
    return piece.endswith(");") and "{" not in piece and "=" not in piece


# The only intended text edits of v0.122, applied to the old file before
# comparing: the version in the startup log line, and the old file's single
# private ("anonymous") namespace, which became the named namespace pywel_map.
EXPECTED_EDITS = [
    ("Pywel Atlas combined v0.121 map markers (v0.121:",
     "Pywel Atlas combined v0.122 map markers (v0.122: no map-marker change "
     "(map code split into files); v0.121:"),
]
ALLOWED_LOST_LINES = {"namespace {", "} // namespace"}


def main():
    old_text = OLD.read_text(encoding="utf-8")
    for before, after in EXPECTED_EDITS:
        if old_text.count(before) != 1:
            print("Expected edit not found once in the old file:", before)
            sys.exit(1)
        old_text = old_text.replace(before, after)
    new_texts = {name: (MARKER / name).read_text(encoding="utf-8") for name in NEW}

    # Check 1: code pieces.
    old_pieces = Counter(p for p in pieces(old_text) if not p.startswith("#"))
    new_pieces = Counter()
    for text in new_texts.values():
        new_pieces.update(p for p in pieces(text) if not p.startswith("#"))
    missing = old_pieces - new_pieces
    added = new_pieces - old_pieces
    added_code = [p for p in added if not is_declaration_only(p)]
    problems = 0
    for piece in missing:
        print("MISSING or CHANGED:", piece[:160])
        problems += 1
    for piece in added_code:
        print("NEW CODE:", piece[:160])
        problems += 1

    # Check 2: every old line (comments too) is still there.
    old_lines = Counter(line.strip() for line in old_text.splitlines() if line.strip())
    new_lines = Counter()
    for text in new_texts.values():
        new_lines.update(line.strip() for line in text.splitlines() if line.strip())
    lost = old_lines - new_lines
    for line in lost:
        if line in ALLOWED_LOST_LINES:
            continue
        print("LOST LINE:", line[:160])
        problems += 1

    print(f"{sum(old_pieces.values())} old pieces, {sum(new_pieces.values())} new pieces "
          f"({len(added)} added declarations); {len(old_lines)} old lines checked.")
    if problems:
        print(f"FAILED: {problems} differences.")
        sys.exit(1)
    print("OK: the split only moved code.")


if __name__ == "__main__":
    main()
