"""Read map-related strings from the installed executable, without loading it.

What it does, in plain terms:
    Programs contain readable text (names, messages, identifiers) mixed in
    with their machine code. This script reads the game executable as raw
    bytes, finds every run of 6 or more printable ASCII characters, and keeps
    the ones that contain map-related words such as "worldmapicon",
    "mappin" or "custompin". These hints point researchers at the parts of
    the program that deal with map markers.

Reads: the installed game executable, as plain bytes (never run).
Writes: native-map-strings.json next to this script (each hit with its
position in the file), and prints the first 75 hits.

Legacy: written for the original Codex workspace layout; paths may no longer
resolve (hard-coded Steam install path on drive E:; output lands next to the
script rather than in research/analysis/).
"""

import json
import re
from pathlib import Path

root = Path(__file__).resolve().parent
executable = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe")
data = executable.read_bytes()
matches = []
# [ -~] is the range from space to tilde, i.e. every printable ASCII character.
for match in re.finditer(rb"[ -~]{6,}", data):
    value = match.group().decode("ascii")
    lower = value.lower()
    # Keep reasonably short strings that mention any of these map terms.
    if len(value) < 300 and any(term in lower for term in (
        "worldmapicon", "minimapevent", "world-position", "worldposition",
        "mapmarker", "create_icon", "icon-position", "mappin", "custompin",
    )):
        # fileOffset = byte position in the .exe file (not an in-memory RVA).
        matches.append({"fileOffset": hex(match.start()), "text": value})
(root / "native-map-strings.json").write_text(json.dumps(matches, indent=2), encoding="utf-8")
print(json.dumps(matches[:75], indent=2))
