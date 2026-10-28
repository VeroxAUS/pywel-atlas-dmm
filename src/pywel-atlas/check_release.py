"""Check that a release PywelAtlas.asi holds no debug tools (v0.129).

build.ps1 -Release runs this on the freshly linked .asi. It looks for text
that only the debug keys, the debug tools and the detailed per-part logs
contain (both as plain text and as Windows wide text). If any is found it
prints what and where, and exits with 1 so the build stops.

Usage: python check_release.py path/to/PywelAtlas.asi
"""

import sys
from pathlib import Path

# Text that exists only inside PYWEL_ATLAS_DEV code (see build.ps1).
DEBUG_TEXTS = [
    # F7: the save-detection checkpoint and its popup.
    "CHECKPOINT F7",
    "checkpoint recorded",
    # F8: the marker snapshot, render capture and the route views.
    "(F8)",
    "snapshot creates=",
    "render-window complete",
    # Marker diagnostics (layer dumps, world-create watch).
    "layer-dump",
    "world-create",
    # The teleporter and the teleport observation.
    "teleport-observe.log",
    "teleporter.log",
    "TEST teleporter",
    "teleport observation",
    # The detailed per-part log files.
    "native-save-detection.log",
    "native-map-categories.log",
    "filter-panel.log",
    "route.log",
    # Panel cursor diagnostics.
    "cursor frames=",
    # 0.29.0: the build kind in the log header (ReleaseLog.cpp).
    "(development build)",
]


def main() -> int:
    """Scans the file named on the command line; 0 if clean, 1 if not."""
    if len(sys.argv) != 2:
        print("Usage: check_release.py PywelAtlas.asi")
        return 2
    data = Path(sys.argv[1]).read_bytes()
    found = []
    for text in DEBUG_TEXTS:
        for encoding in ("ascii", "utf-16-le"):
            position = data.find(text.encode(encoding))
            if position >= 0:
                found.append(f"  {text!r} ({encoding}) at 0x{position:x}")
    if found:
        print("Debug text found in the release build:")
        print("\n".join(found))
        return 1
    print(f"Release check passed: none of {len(DEBUG_TEXTS)} debug texts found.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
