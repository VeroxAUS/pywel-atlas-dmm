"""Read map-related strings from the installed executable, without loading it."""

import json
import re
from pathlib import Path

root = Path(__file__).resolve().parent
executable = Path("E:/SteamLibrary/steamapps/common/Crimson Desert/bin64/CrimsonDesert.exe")
data = executable.read_bytes()
matches = []
for match in re.finditer(rb"[ -~]{6,}", data):
    value = match.group().decode("ascii")
    lower = value.lower()
    if len(value) < 300 and any(term in lower for term in (
        "worldmapicon", "minimapevent", "world-position", "worldposition",
        "mapmarker", "create_icon", "icon-position", "mappin", "custompin",
    )):
        matches.append({"fileOffset": hex(match.start()), "text": value})
(root / "native-map-strings.json").write_text(json.dumps(matches, indent=2), encoding="utf-8")
print(json.dumps(matches[:75], indent=2))
