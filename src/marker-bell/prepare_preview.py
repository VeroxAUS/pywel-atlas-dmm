"""Bind a manually activated display preview to the verified proof pin.

What it does:
    Takes the result written by verify_pin_link.py (--verification) and the
    game executable (--executable), and writes two files next to this script:
      - display-profile.h: C++ constants for the native preview: the build's
        timestamp and image size, the allowed caller addresses, the proof
        pin's key, its position as raw 32-bit float bit patterns, its original
        shape, colour and group, the preview X position (original X + 200),
        and 48 guard bytes copied from the display function at RVA 0x4A9D00.
      - display-binding.json: a record of what the preview was bound to (save
        profile, pin, SHA-256 fingerprints of the save and the executable,
        original and preview style and position).
    It stops with an error unless the verification confirms a saved-pin match
    for the Bell pin mg:543894 with key "2", and unless the 48 guard bytes
    occur exactly once in the executable.

Key terms:
    RVA ("relative virtual address") - an offset inside the game executable
        as laid out in memory, counted from the start of the loaded image.
        A full address is ImageBase + RVA.
    PE header - the header near the start of every Windows .exe. This script
        reads a few fields (build timestamp, image size, section table)
        directly from the bytes instead of using a library.
    Guard bytes - a copy of the first bytes of game code at a place the mod
        observes, taken from the exact studied build. They act as a
        fingerprint: if a game update changes that code, the bytes no longer
        match.

Run:    python -B src/marker-bell/prepare_preview.py --verification <verification.json> --executable <CrimsonDesert.exe>
"""

import argparse
import hashlib
import json
from pathlib import Path
import struct


def main():
    """Check the verification, capture the guard bytes and write both outputs."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verification", type=Path, required=True)
    parser.add_argument("--executable", type=Path, required=True)
    args = parser.parse_args()
    # Load the result of verify_pin_link.py and make sure it is the expected pin.
    verification = json.loads(args.verification.read_text(encoding="utf-8"))
    if verification.get("savedPinMatch") is not True:
        raise ValueError("A verified selected-save pin match is required")
    if verification.get("poiId") != "mg:543894" or verification.get("pinKey") != "2":
        raise ValueError("This display proof is specifically for the observed Bell pin 2")
    image = args.executable.read_bytes()
    # Read PE header fields by hand: bytes 0x3C-0x3F hold the position of the
    # PE header; from there +8 is the build timestamp and +24+56 the image
    # size (SizeOfImage).
    pe = struct.unpack_from("<I", image, 0x3C)[0]
    timestamp = struct.unpack_from("<I", image, pe + 8)[0]
    image_size = struct.unpack_from("<I", image, pe + 24 + 56)[0]
    # RVA of the display function whose first bytes are captured.
    rva = 0x4A9D00
    # Walk the section table (40 bytes per section; from byte 8: size in
    # memory, start RVA, size on disk, file position) to turn the RVA into a
    # position in the file.
    section_count = struct.unpack_from("<H", image, pe + 6)[0]
    section_start = pe + 24 + struct.unpack_from("<H", image, pe + 20)[0]
    offset = None
    for index in range(section_count):
        size, start, raw_size, raw_start = struct.unpack_from(
            "<4I", image, section_start + index * 40 + 8
        )
        if start <= rva < start + min(size, raw_size):
            offset = raw_start + rva - start
            break
    if offset is None:
        raise ValueError("Display function is outside the executable's raw sections")
    # 48 bytes from the function start; they must exist and be unique in the
    # file, so that they identify this one place.
    context = image[offset:offset + 48]
    if len(context) != 48 or image.count(context) != 1:
        raise ValueError("Display context is missing or ambiguous")
    # Reinterpret each float coordinate as its 32-bit pattern ("<f" packs a
    # 32-bit float, "<I" reads the same 4 bytes back as an unsigned integer),
    # so the C++ side can compare exact values.
    bits = [struct.unpack("<I", struct.pack("<f", value))[0]
            for value in verification["position"]]
    # The preview position is the saved position moved 200 units along X.
    preview_position = list(verification["position"])
    preview_position[0] += 200.0
    preview_x_bits = struct.unpack("<I", struct.pack("<f", preview_position[0]))[0]
    source = [
        "// Generated from the verified proof pin; manual activation only.",
        "#pragma once",
        f"constexpr DWORD kExpectedTimestamp = {timestamp}u;",
        f"constexpr DWORD kExpectedImageSize = {image_size}u;",
        "constexpr uintptr_t kAllowedDisplayCaller = 0x4a4835;",
        "constexpr uintptr_t kQueuedDisplayCaller = 0x7ec21a;",
        "constexpr uint64_t kProofPinKey = 2;",
        "constexpr DWORD kPositionBits[3] = {" + ", ".join(f"0x{x:08x}u" for x in bits) + "};",
        f"constexpr DWORD kOriginalShape = {verification['shapeIndex']}u;",
        f"constexpr DWORD kOriginalColour = {verification['colorIndex']}u;",
        f"constexpr DWORD kOriginalGroup = {verification['pinGroup']}u;",
        f"constexpr DWORD kPreviewXBits = 0x{preview_x_bits:08x}u;",
        "constexpr unsigned char kDisplayContext[48] = {",
    ]
    # The 48 guard bytes, 12 per line.
    for start in range(0, 48, 12):
        source.append("    " + ", ".join(f"0x{x:02x}" for x in context[start:start+12]) + ",")
    source.append("};")
    root = Path(__file__).resolve().parent
    (root / "display-profile.h").write_text("\n".join(source) + "\n", encoding="utf-8")
    # Record of exactly what this preview was generated from.
    binding = {
        "mode": "manual-subscriber-dispatch-preview",
        "selectedSaveProfile": verification["selectedSaveProfile"],
        "poiId": verification["poiId"],
        "pinKey": verification["pinKey"],
        "saveSha256": verification["saveSha256"],
        "executableSha256": hashlib.sha256(image).hexdigest(),
        "position": verification["position"],
        "originalStyle": [verification["shapeIndex"], verification["colorIndex"]],
        "previewStyle": [0, 0],
        "previewPosition": preview_position,
        "loadedSaveDetected": False,
        "automaticCompletionStyling": False,
    }
    (root / "display-binding.json").write_text(json.dumps(binding, indent=2) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
