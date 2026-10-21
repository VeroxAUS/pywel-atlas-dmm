"""Embed existing verified Bell identities for the native read-only proof."""
import json
from pathlib import Path


def main():
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "bell-save-links.json").read_text(encoding="utf-8"))
    lines = [
        "// Generated from verified outputs/data/bell-save-links.json.",
        "#pragma once",
        "struct BellLink { const char* id; const char* name; uint32_t uuid[4]; uint32_t keys[5]; };",
        "constexpr BellLink kBellLinks[] = {",
    ]
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        keys = entry["typeKeys"]
        if len(uuid) != 4 or len(keys) != 5 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid + keys):
            raise ValueError("Unsupported Bell identity")
        lines.append("    {" + json.dumps(entry["poiId"]) + ", " + json.dumps(entry["name"]) +
                     ", {" + ", ".join(str(v) + "u" for v in uuid) + "}, {" +
                     ", ".join(str(v) + "u" for v in keys) + "}},")
    lines.append("};")
    (directory / "bell-proof-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
