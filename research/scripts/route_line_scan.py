"""Route line research: print the game's UI rules that size and scale the maps.

What it does:
    Reads UI text files from the installed game's pack group 0012 (read-only)
    and prints the CSS rules and HTML lines that matter for drawing our own
    route line over the world map and the minimap: the HUD scale classes,
    the map canvas sizes and the route-line attributes.
    Nothing is written; the game is not started.

Run:    research/vendor/.venv/Scripts/python.exe -B research/scripts/route_line_scan.py
"""

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT / "research" / "vendor" / "pycrimson" / "src"))

from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")

# File -> words whose CSS rules or HTML lines we want to see.
QUERIES = {
    "ui/xml/gamecommon.css": ["ui-scale", "hud-scale", "cpp-ui-hud-scale-layer"],
    "ui/xml/gamemain/play/worldmapview.html": ["route-line", "destination-line", "trade-route", "canvas"],
}


def show_matches(name, text, words):
    """Print every line of `text` that contains one of `words`."""
    print(f"===== {name}")
    for number, line in enumerate(text.splitlines(), 1):
        if any(word in line for word in words):
            print(f"{number}: {line.strip()[:400]}")


def main():
    """Read each file once and print the matching lines."""
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    for name, words in QUERIES.items():
        data = context.get_file(name)
        text = data.decode("utf-8-sig", errors="replace")
        show_matches(name, text, words)

        # Also print media queries, which may switch the UI scale by screen size.
        for match in re.finditer(r"@media[^{]*\{", text):
            print(f"media: {match.group(0)}")


if __name__ == "__main__":
    main()
