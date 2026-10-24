"""Height arrow pictures for Pywel Atlas markers (add-on v0.88, with mod v0.126).

What it does:
    The mod (src/marker-bell/MarkerHeightArrow.h) gives a marker's picture
    element the class "pywel-above" when the marker is more than 10 m above
    the player, or "pywel-below" when it is more than 10 m below. This file
    makes, for every picture our markers use, two copies with a small arrow
    badge in the bottom left of the visible picture (up and down), and the
    style rules that show them:
        .worldmap-icon-standstone.pywel-marker.pywel-above {
            background-image: textureid(cd_icon_map_pywel_hu05); ... }
    The game's interface draws a picture through only one background, so the
    arrow is baked into a copy of each picture instead of laid on top.

    The pictures are cut out of the game's own texture sheets (found through
    the texture lists ui/xml/texture/*.xml, read from the install at build
    time), so they follow a game update when the add-on is rebuilt. Some
    picture rules tint the picture with "background-color: ...;
    background-blend-mode: multiply" (e.g. #888 for the Cresset, #f074ff for
    the minimap artifact). That tint is applied to the icon part of our copy
    here and the rule sets the tint to white, so the icon looks as before and
    the badge keeps its own colours.

    Each copy is its own small DDS file, made like the star picture
    (build_ui_patch.star_texture: DXT5, one mip level, the game's sample map
    icon header), with one texture list line each, after the star's line.

Key terms:
    texture sheet ("atlas") - one big picture holding many small ones; the
        texture lists say where each small picture sits (GetRect="x,y,w,h").
    DXT5 - the compressed pixel format of the game's map icon sheets: 4 x 4
        pixel blocks of 16 bytes.
    badge - the dark round disc with the light arrow.

Used by build_ui_patch.py (no Pillow: the build runs in the research venv).
"""
import re
import struct

# The classes the mod sets (MarkerHeightArrow.h kArrowClasses).
ARROW_CLASSES = {"up": b"pywel-above", "down": b"pywel-below"}
# Texture names and files: cd_icon_map_pywel_h<u|d><nn>, numbered in the
# order the pictures are first used. v0.89: short on purpose. The v0.88 names
# (cd_icon_map_pywel_height_<up|down>_<picture>_<tint>, up to 64 characters,
# files up to 80) were longer than any name in the game's map icon texture
# list (54; files 45), and the game crashed while starting with them.
TEXTURE_PREFIX = "cd_icon_map_pywel_h"
TEXTURE_FOLDER = "ui/texture/"
TEXTURE_LIST_FOLDER = "ui/xml/texture"
# Our copies are at most this many px a side (the Nexus world picture is
# 512 px but drawn at about 31 px); smaller pictures keep their size,
# rounded up to whole 4 x 4 blocks.
MAX_SIDE = 128
# Badge: its diameter as a share of the visible picture's larger side, and
# where it sits: its bottom left corner on the visible picture's.
BADGE_SHARE = 0.46
BADGE_FILL = (20, 18, 16, 235)
BADGE_RING = (214, 190, 140, 255)
BADGE_ARROW = (245, 232, 200, 255)
# A pixel counts as visible from this alpha (as in research visible.json).
VISIBLE_ALPHA = 40

STYLE_START = b"\r\n/* Pywel Atlas: height arrows (classes pywel-above / pywel-below on Pywel Atlas markers only) */"
STYLE_END = b"\r\n/* Pywel Atlas: end of height arrows */"
TEXTURE_LINE = re.compile(rb'<Texture\s+Name="([^"]+)"\s+Filename="([^"]+)"[^>]*?GetRect="(\d+),(\d+),(\d+),(\d+)"')
# Ours, any version (v0.88 long names or the v0.89 short ones).
OUR_TEXTURE_LINE = re.compile(rb'<Texture Name="cd_icon_map_pywel_h[a-z0-9_]+" '
                              rb'Filename="UI/texture/cd_icon_map_pywel_h[a-z0-9_]+\.dds" '
                              rb'Type="Image" GetRect="0,0,\d+,\d+"/>\r\n')
RULE_TEXTURE = re.compile(rb"background-image:\s*textureid\(([A-Za-z0-9_]+)\)")
RULE_COLOR = re.compile(rb"background-color:\s*#([0-9a-fA-F]{3}|[0-9a-fA-F]{6})\s*;")


# --- Reading the game's pictures ---------------------------------------------

def picture_rule(style, picture_class):
    """Return the game's own rule for one picture class (the one without other classes)."""
    rule = re.search(rb"\r?\n\.%s \{[^}]*\}" % re.escape(picture_class.encode("ascii")), style)
    if rule is None:
        raise SystemExit(f"Height arrows: no .{picture_class} rule as studied; nothing written.")
    return rule.group(0)


def rule_texture_and_tint(rule, picture_class):
    """Return (texture name, tint colour or None) from a picture rule."""
    texture = RULE_TEXTURE.search(rule)
    if texture is None:
        raise SystemExit(f"Height arrows: .{picture_class} has no textureid picture; nothing written.")
    tint = None
    color = RULE_COLOR.search(rule)
    if color is not None and b"multiply" in rule:
        digits = color.group(1).decode("ascii")
        if len(digits) == 3:
            digits = "".join(digit * 2 for digit in digits)
        tint = tuple(int(digits[index:index + 2], 16) for index in (0, 2, 4))
    return texture.group(1).decode("ascii"), tint


def find_texture_rects(context, names):
    """Return {name: (sheet path, x, y, w, h)} for each wanted texture name, from every texture list."""
    wanted = {name.lower(): name for name in names}
    found = {}
    for pack in context._packs.values():
        files = pack.directories.get(TEXTURE_LIST_FOLDER, {})
        for file_name in sorted(files):
            if not file_name.lower().endswith(".xml"):
                continue
            text = context.get_file(f"{TEXTURE_LIST_FOLDER}/{file_name}") or b""
            for match in TEXTURE_LINE.finditer(text):
                name = match.group(1).decode("ascii", "replace").lower()
                if name in wanted and wanted[name] not in found:
                    sheet = match.group(2).decode("ascii", "replace").replace("\\", "/")
                    sheet = sheet[0:2].lower() + sheet[2:]  # "UI/texture/..." is "ui/texture/..." in the pack.
                    found[wanted[name]] = (sheet,) + tuple(int(match.group(index)) for index in range(3, 7))
    missing = sorted(set(names) - set(found))
    if missing:
        raise SystemExit("Height arrows: pictures not in any texture list: " + ", ".join(missing) + "; nothing written.")
    return found


def decode_dxt5_rect(dds, x, y, width, height):
    """Return the RGBA rows (list of lists of 4-tuples) of one rectangle of a DXT5 DDS file."""
    if dds[:4] != b"DDS " or dds[84:88] != b"DXT5":
        raise SystemExit("Height arrows: a picture sheet is not DXT5 as studied; nothing written.")
    sheet_height, sheet_width = struct.unpack_from("<II", dds, 12)
    if x + width > sheet_width or y + height > sheet_height or len(dds) < 128 + sheet_width * sheet_height:
        raise SystemExit("Height arrows: a picture lies outside its sheet; nothing written.")
    blocks_across = (sheet_width + 3) // 4
    rows = [[None] * width for _ in range(height)]
    for block_y in range(y // 4, (y + height + 3) // 4):
        for block_x in range(x // 4, (x + width + 3) // 4):
            offset = 128 + (block_y * blocks_across + block_x) * 16
            pixels = decode_dxt5_block(dds[offset:offset + 16])
            for index, pixel in enumerate(pixels):
                px = block_x * 4 + index % 4 - x
                py = block_y * 4 + index // 4 - y
                if 0 <= px < width and 0 <= py < height:
                    rows[py][px] = pixel
    return rows


def decode_dxt5_block(block):
    """Decode 16 bytes of DXT5 into 16 RGBA tuples (row by row), as the GPU does."""
    alpha0, alpha1 = block[0], block[1]
    alpha_bits = int.from_bytes(block[2:8], "little")
    if alpha0 > alpha1:
        alphas = [alpha0, alpha1] + [((7 - step) * alpha0 + step * alpha1) // 7 for step in range(1, 7)]
    else:
        alphas = [alpha0, alpha1] + [((5 - step) * alpha0 + step * alpha1) // 5 for step in range(1, 5)] + [0, 255]
    color0, color1, color_bits = struct.unpack_from("<HHI", block, 8)
    ends = [unpack565(color0), unpack565(color1)]
    # DXT5 always uses the four-colour palette.
    palette = ends + [tuple((2 * a + b) // 3 for a, b in zip(*ends)), tuple((a + 2 * b) // 3 for a, b in zip(*ends))]
    return [palette[(color_bits >> (2 * index)) & 3] + (alphas[(alpha_bits >> (3 * index)) & 7],)
            for index in range(16)]


def unpack565(value):
    """Expand a 5-6-5 colour to 8 bits per channel."""
    red, green, blue = (value >> 11) & 31, (value >> 5) & 63, value & 31
    return ((red << 3) | (red >> 2), (green << 2) | (green >> 4), (blue << 3) | (blue >> 2))


# --- Making the copies ---------------------------------------------------------

def copy_side(side):
    """Our copy's side for a picture `side` px wide: whole 4-px blocks, at most MAX_SIDE."""
    return min(MAX_SIDE, (side + 3) // 4 * 4)


def resample(rows, size):
    """Scale square RGBA rows to size x size: averages a grid of samples over each new pixel (alpha-weighted)."""
    source = len(rows)
    if source == size:
        return [list(row) for row in rows]
    taps = max(2, -(-source // size) + 1)
    result = []
    for out_y in range(size):
        line = []
        for out_x in range(size):
            total = [0.0, 0.0, 0.0, 0.0]
            for tap_y in range(taps):
                sy = min(source - 1, int((out_y + (tap_y + 0.5) / taps) * source / size))
                for tap_x in range(taps):
                    sx = min(source - 1, int((out_x + (tap_x + 0.5) / taps) * source / size))
                    red, green, blue, alpha = rows[sy][sx]
                    total[0] += red * alpha
                    total[1] += green * alpha
                    total[2] += blue * alpha
                    total[3] += alpha
            count = taps * taps
            if total[3] <= 0:
                line.append((0, 0, 0, 0))
            else:
                line.append(tuple(min(255, round(total[channel] / total[3])) for channel in range(3)) +
                            (min(255, round(total[3] / count)),))
        result.append(line)
    return result


def visible_box(rows):
    """Return (left, top, right, bottom) of the pixels with alpha >= VISIBLE_ALPHA (right/bottom exclusive)."""
    xs = [x for row in rows for x, pixel in enumerate(row) if pixel[3] >= VISIBLE_ALPHA]
    ys = [y for y, row in enumerate(rows) if any(pixel[3] >= VISIBLE_ALPHA for pixel in row)]
    if not xs:
        raise SystemExit("Height arrows: a picture has no visible pixels; nothing written.")
    return min(xs), min(ys), max(xs) + 1, max(ys) + 1


def badge_coverage(diameter, up, samples=4):
    """Return a diameter x diameter grid of RGBA badge pixels (disc, ring, arrow), anti-aliased."""
    radius = diameter / 2
    ring = max(1.0, diameter / 14)
    margin = diameter * 0.27
    if up:
        triangle = ((radius, margin), (diameter - margin, diameter - margin * 1.05), (margin, diameter - margin * 1.05))
    else:
        triangle = ((radius, diameter - margin), (diameter - margin, margin * 1.05), (margin, margin * 1.05))
    grid = []
    for py in range(diameter):
        line = []
        for px in range(diameter):
            disc = ring_hits = arrow = 0
            for sy in range(samples):
                for sx in range(samples):
                    x = px + (sx + 0.5) / samples
                    y = py + (sy + 0.5) / samples
                    distance = ((x - radius) ** 2 + (y - radius) ** 2) ** 0.5
                    if distance <= radius:
                        disc += 1
                        if distance >= radius - ring:
                            ring_hits += 1
                        elif inside_triangle(x, y, triangle):
                            arrow += 1
            total = samples * samples
            if disc == 0:
                line.append((0, 0, 0, 0))
                continue
            fill = disc - ring_hits - arrow
            parts = ((BADGE_FILL, fill), (BADGE_RING, ring_hits), (BADGE_ARROW, arrow))
            color = tuple(round(sum(c[channel] * n for c, n in parts) / disc) for channel in range(3))
            alpha = sum(c[3] * n for c, n in parts) / total
            line.append(color + (round(alpha),))
        grid.append(line)
    return grid


def inside_triangle(x, y, triangle):
    """True if (x, y) lies inside the triangle (any winding)."""
    (ax, ay), (bx, by), (cx, cy) = triangle
    first = (bx - ax) * (y - ay) - (by - ay) * (x - ax)
    second = (cx - bx) * (y - by) - (cy - by) * (x - bx)
    third = (ax - cx) * (y - cy) - (ay - cy) * (x - cx)
    return (first >= 0 and second >= 0 and third >= 0) or (first <= 0 and second <= 0 and third <= 0)


def over(bottom, top):
    """Return `top` drawn over `bottom` (straight alpha)."""
    alpha_top = top[3] / 255
    alpha_bottom = bottom[3] / 255
    alpha = alpha_top + alpha_bottom * (1 - alpha_top)
    if alpha <= 0:
        return (0, 0, 0, 0)
    color = tuple(round((top[channel] * alpha_top + bottom[channel] * alpha_bottom * (1 - alpha_top)) / alpha)
                  for channel in range(3))
    return color + (round(alpha * 255),)


def arrow_copy(rows, tint, up):
    """Return the picture with the tint applied and the badge on its visible bottom left corner."""
    size = len(rows)
    picture = [[pixel if tint is None else
                tuple(pixel[channel] * tint[channel] // 255 for channel in range(3)) + (pixel[3],)
                for pixel in row] for row in rows]
    left, top, right, bottom = visible_box(picture)
    diameter = max(6, round(max(right - left, bottom - top) * BADGE_SHARE))
    badge = badge_coverage(diameter, up)
    origin_x = max(0, left)
    origin_y = min(size, bottom) - diameter
    origin_y = max(0, origin_y)
    for by, line in enumerate(badge):
        for bx, pixel in enumerate(line):
            x, y = origin_x + bx, origin_y + by
            if pixel[3] and x < size and y < size:
                picture[y][x] = over(picture[y][x], pixel)
    return picture


def dds_file(sample_icon, rows, encode_block):
    """Return a DXT5 DDS file of the square RGBA rows, with the game's sample map icon header.

    `encode_block` is build_ui_patch.encode_dxt5_block (the star picture's encoder).
    """
    header = bytearray(sample_icon[:128])
    if header[:4] != b"DDS " or header[84:88] != b"DXT5" or struct.unpack_from("<I", header, 28)[0] != 1:
        raise SystemExit("The game's sample map icon file looks different; nothing written.")
    size = len(rows)
    blocks = bytearray()
    for top in range(0, size, 4):
        for left in range(0, size, 4):
            block = [rows[top + y][left + x] for y in range(4) for x in range(4)]
            blocks += encode_block(block)
    struct.pack_into("<III", header, 12, size, size, len(blocks))
    return bytes(header) + bytes(blocks)


# --- What build_ui_patch.py calls ----------------------------------------------

def take_out(style, name):
    """Remove this add-on's height arrow block from a mounted style file, or stop if it looks foreign."""
    if b"pywel-above" not in style and b"pywel-below" not in style:
        return style
    start = style.find(STYLE_START)
    end = style.find(STYLE_END)
    if start < 0 or end < start or style.count(STYLE_START) != 1:
        raise SystemExit(f"{name} has height arrow rules that are not ours; nothing written.")
    style = style[:start] + style[end + len(STYLE_END):]
    if b"pywel-above" in style or b"pywel-below" in style:
        raise SystemExit(f"{name} has height arrow rules that are not ours; nothing written.")
    print(f"Found this mod's own height arrows in {name} (mounted by DMM); rebuilt without them.")
    return style


def take_out_texture_lines(texture_list):
    """Remove our height arrow texture lines from a mounted texture list, or stop if any look foreign."""
    if TEXTURE_PREFIX.encode("ascii") not in texture_list:
        return texture_list
    texture_list, removed = OUR_TEXTURE_LINE.subn(b"", texture_list)
    if TEXTURE_PREFIX.encode("ascii") in texture_list:
        raise SystemExit("The map icon texture list has height arrow lines that are not ours; nothing written.")
    print(f"Found {removed} of this mod's own height arrow texture lines (mounted by DMM); rebuilt without them.")
    return texture_list


def build(context, marker_sizes, styles, sample_icon, own_pictures, encode_block):
    """Make the arrow copies and their rules.

    marker_sizes: build_ui_patch.MARKER_SIZES. styles: {"world": world style
    text, "minimap": minimap style text}, each the game's text with the
    add-on's earlier changes (shrine rule, star picture), before the size
    blocks. own_pictures: {texture name: RGBA rows} for pictures this add-on
    makes itself (the star), which are in no game texture list.
    encode_block: build_ui_patch.encode_dxt5_block.

    Returns (rules {"world": bytes, "minimap": bytes}, texture lines bytes,
    files {path in the mod: bytes}).
    """
    uses = {"world": [], "minimap": []}  # (picture class, texture name, tint)
    for entry in marker_sizes.values():
        for side in ("world", "minimap"):
            for picture_class, _, _ in entry[side]:
                rule = picture_rule(styles[side], picture_class)
                texture, tint = rule_texture_and_tint(rule, picture_class)
                uses[side].append((picture_class, texture, tint))
    names = sorted({texture for side in uses.values() for _, texture, _ in side if texture not in own_pictures})
    rects = find_texture_rects(context, names)
    sheets = {}
    pictures = dict(own_pictures)
    for name in names:
        sheet, x, y, width, height = rects[name]
        if width != height:
            raise SystemExit(f"Height arrows: {name} is not square ({width} x {height}); nothing written.")
        if sheet not in sheets:
            sheets[sheet] = context.get_file(sheet) or context.get_file(sheet.lower())
            if not sheets[sheet]:
                raise SystemExit(f"Height arrows: sheet {sheet} not found; nothing written.")
        pictures[name] = decode_dxt5_rect(sheets[sheet], x, y, width, height)

    files = {}
    lines = []
    made = {}  # (texture, tint, direction) -> our texture name
    rules = {"world": [STYLE_START], "minimap": [STYLE_START]}
    for side in ("world", "minimap"):
        for picture_class, texture, tint in uses[side]:
            size = copy_side(len(pictures[texture]))
            for direction in ("up", "down"):
                key = (texture, tint, direction)
                if key not in made:
                    scaled = resample(pictures[texture], size)
                    number = len(made) // 2 + 1
                    name = f"{TEXTURE_PREFIX}{direction[0]}{number:02d}"
                    if not re.fullmatch(r"[a-z0-9_]+", name):
                        raise SystemExit(f"Height arrows: unexpected texture name {name!r}; nothing written.")
                    picture = arrow_copy(scaled, tint, direction == "up")
                    files[f"{TEXTURE_FOLDER}{name}.dds"] = dds_file(sample_icon, picture, encode_block)
                    lines.append(f'<Texture Name="{name}" Filename="UI/texture/{name}.dds" Type="Image"'
                                 f' GetRect="0,0,{size},{size}"/>\r\n'.encode("ascii"))
                    made[key] = name
                rule = b"\r\n.%s.pywel-marker.%s { background-image: textureid(%s);" % (
                    picture_class.encode("ascii"), ARROW_CLASSES[direction], made[key].encode("ascii"))
                if tint is not None:
                    rule += b" background-color: #ffffff;"
                rules[side].append(rule + b" }")
    for side in rules:
        rules[side].append(STYLE_END)
        rules[side] = b"".join(rules[side])
    return rules, b"".join(lines), files
