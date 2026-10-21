"""Embed the readable marker template so an installed ASI can seed local data."""

import json
from pathlib import Path


def main():
    directory = Path(__file__).resolve().parent
    source = directory.parents[1] / "data" / "native-map-marker.json"
    content = source.read_text(encoding="utf-8-sig")
    parsed = json.loads(content)
    if parsed.get("schemaVersion") != 1 or ')atlas"' in content:
        raise ValueError("Unsupported default marker or raw-string delimiter")
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
