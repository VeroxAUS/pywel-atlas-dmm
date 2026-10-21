"""Generate exact-build entry guards for the observation-only native probe."""

import argparse
import hashlib
from pathlib import Path
import struct


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--executable", type=Path, required=True)
    parser.add_argument("--mode", choices=("icons", "categories"), default="icons")
    args = parser.parse_args()
    image = args.executable.read_bytes()
    expected_hash = "57da440d72f4db974f25fef047cf84c4dadd999a88cb2a3c5af4c9bd67fde1e7"
    if hashlib.sha256(image).hexdigest() != expected_hash:
        raise ValueError("Static callback tracing applies only to the known game build")
    pe = struct.unpack_from("<I", image, 0x3C)[0]
    timestamp = struct.unpack_from("<I", image, pe + 8)[0]
    image_size = struct.unpack_from("<I", image, pe + 24 + 56)[0]
    section_count = struct.unpack_from("<H", image, pe + 6)[0]
    section_start = pe + 24 + struct.unpack_from("<H", image, pe + 20)[0]
    def raw_offset(rva, length):
        for index in range(section_count):
            size, start, raw_size, raw_start = struct.unpack_from(
                "<4I", image, section_start + index * 40 + 8
            )
            if start <= rva and rva + length <= start + min(size, raw_size):
                return raw_start + rva - start
        raise ValueError(f"Missing native entry at {rva:#x}")

    def table_pointer_rva(instruction):
        offset = raw_offset(instruction, 7)
        if image[offset:offset + 3] != b"\x48\x8b\x1d":
            raise ValueError("Native metadata table reference changed")
        return instruction + 7 + struct.unpack_from("<i", image, offset + 3)[0]

    # vcomiss xmm0,[rip+disp32] in native altitude-based parent selection.
    threshold_instruction = 0xDB83AE
    threshold_offset = raw_offset(threshold_instruction, 8)
    if image[threshold_offset:threshold_offset + 4] != b"\xc5\xf8\x2f\x05":
        raise ValueError("Native altitude-threshold instruction changed")
    threshold_rva = threshold_instruction + 8 + struct.unpack_from(
        "<i", image, threshold_offset + 4
    )[0]
    source = [
        "// Generated entry guards for the statically traced Steam build.",
        "#pragma once",
        f"constexpr DWORD kExpectedTimestamp = {timestamp}u;",
        f"constexpr DWORD kExpectedImageSize = {image_size}u;",
        "constexpr DWORD kBellPositionBits[3] = {0xc62739fd, 0x441dc826, 0xc56f9dbe};",
        f"constexpr uintptr_t kIconTablePointerRva = {table_pointer_rva(0x537265):#x};",
        f"constexpr uintptr_t kTemplateTablePointerRva = {table_pointer_rva(0x388E15):#x};",
        f"constexpr uintptr_t kParentAltitudeThresholdRva = {threshold_rva:#x};",
        "struct InspectSite { uintptr_t rva; unsigned char context[24]; };",
        "constexpr InspectSite kInspectSites[] = {",
    ]
    # The small callback wrapper has a VEX instruction immediately after its
    # copied prologue. MinHook's decoder examines that next instruction too.
    # Observe its direct callee, which has the same ABI and a compatible entry.
    # Categories: creator/type/template hooks, two guarded lookup calls, then
    # the suppression observer, scoped world constructor route and native
    # initializer observer. Icons mode
    # retains its historical layout.
    sites = (
        (0xDEEB60, 0x537250, 0x388E00, 0xDB8A00, 0xDEFFA0, 0xDECA40,
         0xDB3BD0, 0xD8A970, 0xD94040, 0xD91820, 0xDB8A60, 0xDB83AE,
         0xDABD10)
        if args.mode == "categories" else
        (0xDF88C0, 0xDB8A00, 0xDEFFA0, 0xDEC5B0, 0x35CA0A0, 0x12BECB0)
    )
    for rva in sites:
        offset = raw_offset(rva, 24)
        context = image[offset:offset + 24]
        source.append(f"    {{{rva:#x}, {{")
        for start in range(0, 24, 8):
            source.append("        " + ", ".join(
                f"0x{value:02x}" for value in context[start:start + 8]
            ) + ",")
        source.append("    }},")
    source.append("};")
    filename = "category-profile.h" if args.mode == "categories" else "inspect-profile.h"
    destination = Path(__file__).with_name(filename)
    destination.write_text("\n".join(source) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
