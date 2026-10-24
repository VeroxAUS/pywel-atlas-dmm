"""Draw the Pywel Atlas star-cluster map icon for Constellation markers (add-on v0.81).

What it does:
    Draws one 52 x 52 picture in the style of the game's own white map icons
    (cream-white fill with a light speckle and a thin mid-grey outline, like
    the game's ink-line map pictures): a large four-point star with two small
    ones. The UI add-on (build_ui_patch.py) turns it into the texture of the
    game's unused test icon MapIcon_TestGimmick11, which the Constellation
    markers use. The drawing is fixed (fixed random seed), so every run gives
    the same picture.
    v0.83: thinner, lighter outline (user, after the v0.82 run: the dark thick outline looked out of place next to the game's icons).

Writes: src/pywel-atlas-ui/pywel-star-cluster.png (overwritten)
Run:    python -B src/pywel-atlas-ui/draw_star_icon.py   (needs Pillow)
"""
import math
import random
from pathlib import Path

from PIL import Image, ImageDraw, ImageFilter

SIZE = 52  # Same as the game's 32 px world-map gimmick icons' pictures.
SCALE = 8  # Drawn larger, then reduced, for smooth edges.


def star_points(cx, cy, outer, inner, points, rotation=-90):
    """Corner points of a star with `points` tips around (cx, cy)."""
    corners = []
    for step in range(2 * points):
        angle = math.radians(rotation + step * 180 / points)
        radius = outer if step % 2 == 0 else inner
        corners.append((cx + radius * math.cos(angle), cy + radius * math.sin(angle)))
    return corners


def draw():
    """Return the finished 52 x 52 RGBA picture."""
    random.seed(3)
    width = SIZE * SCALE
    centre = width / 2
    mask = Image.new("L", (width, width), 0)
    pen = ImageDraw.Draw(mask)
    # One large four-point star, slightly left and down, and two small ones.
    pen.polygon(star_points(centre - 3 * SCALE, centre + 3 * SCALE, 17 * SCALE, 4.6 * SCALE, 4), fill=255)
    for x, y, radius in ((centre + 14 * SCALE, centre - 13 * SCALE, 6 * SCALE),
                         (centre + 16 * SCALE, centre + 12 * SCALE, 4 * SCALE)):
        pen.polygon(star_points(x, y, radius, radius * 0.35, 4), fill=255)
    # The outline: the shape grown by about 1.3 px.
    outline = mask.filter(ImageFilter.MaxFilter(2 * int(1.3 * SCALE) + 1))
    picture = Image.new("RGBA", (width, width), (0, 0, 0, 0))
    picture.paste((110, 114, 108, 255), (0, 0), outline)
    picture.paste((246, 245, 238, 255), (0, 0), mask)
    picture = picture.resize((SIZE, SIZE), Image.LANCZOS)
    # The light speckle of the game's white icons.
    pixels = picture.load()
    for y in range(SIZE):
        for x in range(SIZE):
            red, green, blue, alpha = pixels[x, y]
            if alpha and red > 200:
                shade = random.randint(-18, 0)
                pixels[x, y] = (red + shade, green + shade, blue + shade, alpha)
    return picture


def main():
    """Draw the icon and save it beside this script."""
    path = Path(__file__).resolve().parent / "pywel-star-cluster.png"
    draw().save(path)
    print(f"Wrote {path}")


if __name__ == "__main__":
    main()
