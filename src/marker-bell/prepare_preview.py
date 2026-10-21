"""Bind a manually activated display preview to the verified proof pin."""

import argparse
import hashlib
import json
from pathlib import Path
import struct


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--verification", type=Path, required=True)
    parser.add_argument("--executable", type=Path, required=True)
    args = parser.parse_args()
    verification = json.loads(args.verification.read_text(encoding="utf-8"))
    if verification.get("savedPinMatch") is not True:
        raise ValueError("A verified selected-save pin match is required")
    if verification.get("poiId") != "mg:543894" or verification.get("pinKey") != "2":
        raise ValueError("This display proof is specifically for the observed Bell pin 2")
    image = args.executable.read_bytes()
    pe = struct.unpack_from("<I", image, 0x3C)[0]
    timestamp = struct.unpack_from("<I", image, pe + 8)[0]
    image_size = struct.unpack_from("<I", image, pe + 24 + 56)[0]
    rva = 0x4A9D00
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
    context = image[offset:offset + 48]
    if len(context) != 48 or image.count(context) != 1:
        raise ValueError("Display context is missing or ambiguous")
    bits = [struct.unpack("<I", struct.pack("<f", value))[0]
            for value in verification["position"]]
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
    for start in range(0, 48, 12):
        source.append("    " + ", ".join(f"0x{x:02x}" for x in context[start:start+12]) + ",")
    source.append("};")
    root = Path(__file__).resolve().parent
    (root / "display-profile.h").write_text("\n".join(source) + "\n", encoding="utf-8")
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
