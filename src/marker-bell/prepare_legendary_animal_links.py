"""Embed the Legendary Animal list for the native mod (0.29.0).

What it does:
    Converts data/legendary-animal-links.json (written by
    research/scripts/survey_legendary_animals.py) into a C++ header, so the
    mod includes the table when it is built instead of reading JSON while
    the game runs. Each animal has a readable name, its marker position (the
    middle of its patrol network), the key of its challenge mission, how far
    it roams, and the lines of its patrol network (X, Z points in metres,
    drawn on the maps when the cursor rests on its marker or it is tracked).
    If any entry has a different shape the script stops with an error
    instead of writing a suspect table.

Reads:  data/legendary-animal-links.json at the repository root
Writes: src/marker-bell/legendary-animal-links.h (overwritten)
Run:    python -B src/marker-bell/prepare_legendary_animal_links.py
"""
import json
from pathlib import Path

ANIMALS = 24
# Most points and lines one animal may have (the mod's drawing buffers).
MAX_POINTS = 512
MAX_LINES = 128


def number(value):
    """A C++ float literal for `value`."""
    return repr(float(value)) + "f"


def main():
    """Read the animal JSON, validate every entry and write the C++ header."""
    # Folder of this script (src/marker-bell); parents[1] is the repository root.
    directory = Path(__file__).resolve().parent
    mapping = json.loads((directory.parents[1] / "data" / "legendary-animal-links.json").read_text(encoding="utf-8"))
    if mapping.get("version") != 1 or mapping.get("nativeIcon", {}).get("templateName") != "MapIcon_TestGimmick9":
        raise ValueError("Unexpected Legendary Animal data file")
    if len(mapping["locations"]) != ANIMALS:
        raise ValueError(f"Expected {ANIMALS} Legendary Animals")
    animals = []
    lines = []
    points = []
    keys = set()
    for entry in mapping["locations"]:
        # The marker's game-world position (X/Z horizontal, Y altitude).
        position = entry["gamePosition"]
        if len(position) != 3 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in position):
            raise ValueError("Unsupported animal position")
        key = entry["missionKey"]
        if type(key) is not int or not 0 < key <= 0xffffffff or key in keys:
            raise ValueError(f"Unsupported or repeated animal mission key {key!r}")
        keys.add(key)
        name = entry["name"]
        if type(name) is not str or not name.isascii() or not 0 < len(name) < 48 or '"' in name:
            raise ValueError(f"Unsupported animal name {name!r}")
        roam = entry["roam"]
        if type(roam) is not int or not 0 <= roam < 2000:
            raise ValueError(f"Unsupported roam distance for {name}")
        first_line = len(lines)
        count = 0
        if len(entry["paths"]) > MAX_LINES:
            raise ValueError(f"Too many path lines for {name}")
        for line in entry["paths"]:
            if len(line) < 2:
                raise ValueError(f"A path line of {name} has fewer than 2 points")
            for point in line:
                if len(point) != 2 or any(type(v) not in (int, float) or abs(v) > 1000000 for v in point):
                    raise ValueError(f"Unsupported path point for {name}")
                # Path points lie around the marker; anything far off is a misread.
                if abs(point[0] - position[0]) > 1000 or abs(point[1] - position[2]) > 1000:
                    raise ValueError(f"A path point of {name} is more than 1 km from its marker")
            lines.append((len(points), len(line)))
            points.extend(line)
            count += len(line)
        if count > MAX_POINTS:
            raise ValueError(f"Too many path points for {name}")
        animals.append("    {" + json.dumps(name) + ", {" + ", ".join(number(v) for v in position) + "}, " +
                       str(key) + "u, " + str(roam) + "u, " + str(first_line) + "u, " +
                       str(len(entry["paths"])) + "u},")
    out = [
        "// Generated from data/legendary-animal-links.json by prepare_legendary_animal_links.py - do not edit by hand.",
        "// Done = the save's mission list holds missionKey at state 5 (completed); another state = not",
        "// done yet; no record = unknown (see NativeSaveReader.cpp). The marker sits in the middle of the",
        "// animal's patrol network; its lines are kLegendaryAnimalLines[firstLine .. firstLine + lineCount).",
        "#pragma once",
        "// One line of a patrol network: kLegendaryAnimalPoints[first .. first + count).",
        "struct LegendaryAnimalLine { unsigned first; unsigned count; };",
        "struct LegendaryAnimalLink { const char* name; float position[3]; uint32_t missionKey; unsigned roam;",
        "    unsigned firstLine; unsigned lineCount; };",
        f"constexpr unsigned kLegendaryAnimalMaxPoints = {MAX_POINTS}; // Per animal.",
        "// Patrol network points: world X, Z (metres).",
        "constexpr float kLegendaryAnimalPoints[][2] = {",
    ]
    for start in range(0, len(points), 4):
        out.append("    " + " ".join("{" + number(x) + ", " + number(z) + "}," for x, z in points[start:start + 4]))
    out.append("};")
    out.append("constexpr LegendaryAnimalLine kLegendaryAnimalLines[] = {")
    for start in range(0, len(lines), 8):
        out.append("    " + " ".join("{" + str(first) + "u, " + str(count) + "u}," for first, count in lines[start:start + 8]))
    out.append("};")
    out.append("constexpr LegendaryAnimalLink kLegendaryAnimalLinks[] = {")
    out.extend(animals)
    out.append("};")
    (directory / "legendary-animal-links.h").write_text("\n".join(out) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
