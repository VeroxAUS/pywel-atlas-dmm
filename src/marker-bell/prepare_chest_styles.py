"""Build a DMM stylesheet companion without changing installed game assets.

Preserve the exact extracted pin stylesheet, appending only our scoped rules.
The original remains a research input under work, separate from maintained CSS.

What it does:
    DMM is the mod manager this project installs through. This script builds a
    small DMM mod folder whose pinmarkericon.css (the game's map-pin
    stylesheet) is the original file, byte for byte, followed by the extra
    rules in chest-icon.css (next to this script). It first checks the
    original's SHA-256 fingerprint so it only ever extends the exact version
    that was inspected; if the game's file has changed it stops with an
    error. Installed game files are never touched.

Reads:
    --original      the extracted original pinmarkericon.css
    chest-icon.css  next to this script
Writes (inside --destination, which must be under this workspace's dist folder):
    files/ui/xml/gamemain/template/pinmarkericon.css
    modinfo.json    the mod's name, version, author and description

Run:
    python -B src/marker-bell/prepare_chest_styles.py --original <path> --destination dist/<folder>
"""

import argparse
import hashlib
import json
from pathlib import Path


def main():
    """Check the original stylesheet, then write the combined CSS and metadata."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original", type=Path, required=True)
    parser.add_argument("--destination", type=Path, required=True)
    args = parser.parse_args()
    # Compare the original with the SHA-256 fingerprint of the inspected
    # version.
    original = args.original.read_bytes()
    expected_hash = "968b68a9aa9254abfecf2ef5b171f2c01adc4be089683b7ace01cf0be3964463"
    if hashlib.sha256(original).hexdigest() != expected_hash:
        raise ValueError("Reinspect the changed native pin stylesheet before packaging")
    # Our additional CSS rules, kept in chest-icon.css next to this script.
    additions = Path(__file__).with_name("chest-icon.css").read_bytes()
    # Safety check: only write under <repository root>/dist (parents[2] of
    # src/marker-bell/<this file> is the repository root).
    destination = args.destination.resolve()
    workspace = Path(__file__).resolve().parents[2]
    if not destination.is_relative_to(workspace / "dist"):
        raise ValueError("Styles must be generated under this workspace's dist folder")
    # Mirror the game's folder layout for the stylesheet.
    css_path = destination / "files/ui/xml/gamemain/template/pinmarkericon.css"
    css_path.parent.mkdir(parents=True, exist_ok=True)
    # Original bytes, a Windows line break, then our rules.
    css_path.write_bytes(original + b"\r\n" + additions)
    # Mod metadata file.
    metadata = {
        "name": "Pywel Atlas Chest Icon Styles",
        "version": "0.15",
        "author": "Pywel Atlas",
        "description": "Scoped chest texture rules for the v0.15 native map proof.",
    }
    (destination / "modinfo.json").write_text(
        json.dumps(metadata, indent=2) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
