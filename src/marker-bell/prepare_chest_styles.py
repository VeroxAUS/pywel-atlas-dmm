"""Build a DMM stylesheet companion without changing installed game assets.

Preserve the exact extracted pin stylesheet, appending only our scoped rules.
The original remains a research input under work, separate from maintained CSS.
"""

import argparse
import hashlib
import json
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--original", type=Path, required=True)
    parser.add_argument("--destination", type=Path, required=True)
    args = parser.parse_args()
    original = args.original.read_bytes()
    expected_hash = "968b68a9aa9254abfecf2ef5b171f2c01adc4be089683b7ace01cf0be3964463"
    if hashlib.sha256(original).hexdigest() != expected_hash:
        raise ValueError("Reinspect the changed native pin stylesheet before packaging")
    additions = Path(__file__).with_name("chest-icon.css").read_bytes()
    destination = args.destination.resolve()
    workspace = Path(__file__).resolve().parents[2]
    if not destination.is_relative_to(workspace / "dist"):
        raise ValueError("Styles must be generated under this workspace's dist folder")
    css_path = destination / "files/ui/xml/gamemain/template/pinmarkericon.css"
    css_path.parent.mkdir(parents=True, exist_ok=True)
    css_path.write_bytes(original + b"\r\n" + additions)
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
