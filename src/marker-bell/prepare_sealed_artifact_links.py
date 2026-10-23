"""Embed the Sealed Abyss Artifact list for the native mod (v0.88).

What it does:
    Converts data/sealed-artifact-links.json into a C++ header, so the mod
    includes the table when it is built instead of reading JSON while the
    game runs. Each row has a readable name, the artifact's unique ID (UUID,
    4 numbers) and its game position. If any entry has a different shape the
    script stops with an error instead of writing a suspect table.

Reads:  data/sealed-artifact-links.json at the repository root
Writes: src/marker-bell/artifact-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_sealed_artifact_links.py
"""
import json
from pathlib import Path


def main():
    """Read the artifact JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "sealed-artifact-links.json").read_text(encoding="utf-8"))
    if mapping.get("infoKey") != 1000002 or mapping.get("gimmickInfoKey") != 1004255:
        raise ValueError("Unexpected Sealed Abyss Artifact keys")
    if len(mapping["locations"]) != 141:
        raise ValueError("Expected 141 Sealed Abyss Artifacts")
    lines = [
        "// Generated from data/sealed-artifact-links.json by prepare_sealed_artifact_links.py - do not edit by hand.",
        "// Picked up = a field-object record for this UUID with gimmick kArtifactGimmickKey that lists",
        "// the artifact's own UUID as removed from the world (see NativeSaveReader.cpp).",
        "#pragma once",
        "constexpr uint32_t kArtifactGimmickKey = 1004255; // \"item_sealed_artifact\" in the gimmick table.",
        "struct ArtifactLink { const char* name; uint32_t uuid[4]; float position[3]; };",
        "constexpr ArtifactLink kArtifactLinks[] = {",
    ]
    for entry in mapping["locations"]:
        uuid = entry["uuid"]
        if len(uuid) != 4 or any(type(v) is not int or not 0 <= v <= 0xffffffff for v in uuid):
            raise ValueError("Unsupported artifact UUID")
        # The artifact's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported artifact position")
        # MapGenie uses typographic apostrophes; the mod's text is plain ASCII.
        name = entry["name"].replace("‘", "'").replace("’", "'")
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 64:
            raise ValueError(f"Unsupported artifact name {name!r}")
        lines.append("    {" + json.dumps(name) + ", {" + ", ".join(str(v) + "u" for v in uuid) +
                     "}, {" + ", ".join(repr(float(v)) + "f" for v in position) + "}},")
    lines.append("};")
    (directory / "artifact-links.h").write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
