"""Embed the readable marker template so an installed ASI can seed local data.

What it does:
    Copies data/native-map-marker.json (at the repository root) unchanged into
    a C++ header as one text constant, kDefaultMarkerJson. The native mod (an
    ASI file: a plugin library loaded into the game) can then use this built-in
    default to create its local data. The script refuses to run if the JSON's
    schemaVersion is not 1, or if the text contains ')atlas"', which would end
    the C++ raw string early.

Key terms:
    Raw string literal - the C++ form R"atlas( ... )atlas" holds text exactly
        as written, so the JSON needs no escaping; ')atlas"' marks its end.

Reads:  data/native-map-marker.json
Writes: src/marker-bell/marker-default.h (overwritten)
Run:    python -B src/marker-bell/prepare_marker_default.py
"""

import json
from pathlib import Path


def main():
    """Validate the default marker JSON and write it into marker-default.h."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    source = directory.parents[1] / "data" / "native-map-marker.json"
    # "utf-8-sig" also drops a leading byte-order mark if the file has one.
    content = source.read_text(encoding="utf-8-sig")
    parsed = json.loads(content)
    if parsed.get("schemaVersion") != 1 or ')atlas"' in content:
        raise ValueError("Unsupported default marker or raw-string delimiter")
    # The header: comment, include guard, then the JSON inside a raw string.
    header = (
        "// Generated from outputs/data/native-map-marker.json.\n"
        "#pragma once\n"
        'constexpr char kDefaultMarkerJson[] = R"atlas(\n'
        + content
        + ')atlas";\n'
    )
    (directory / "marker-default.h").write_text(header, encoding="utf-8")


if __name__ == "__main__":
    main()
