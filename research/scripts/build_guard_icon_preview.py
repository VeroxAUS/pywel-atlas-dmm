"""Draw a preview of the Defense Efficiency icon choice (research/mockups/defense-efficiency-icon.png).

What it does:
    Cuts two stat icons out of the game's icon sheets (read-only, packs group
    0012): the Defense row's icon (cd_icon_ability_defense, cpp-dpv) and the
    guard icon the game uses for its guard effects (cd_icon_ability_GUARDCRASH).
    Their places come from the sheets' own XML (ui/xml/texture/
    cd_icon_common_00/01.xml, "GetRect" = x, y, width, height). The preview
    shows both enlarged, both at the card's 22 px tinted like the card's stat
    icons (itemtooltip2.css: background-color #f6f0f0, multiply), and a mock
    pair of shield card rows ("Defense 5" / "Defense Efficiency 20") with the
    guard icon on the second row.

Reads:  the installed game's interface packs (group 0012) through pycrimson
Writes: research/mockups/defense-efficiency-icon.png (overwritten)
Run:    an interpreter with Pillow, using the research venv's packages, e.g.
        C:/Users/Thomas/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe -B research/scripts/build_guard_icon_preview.py
        (pycrimson: LukeFZ, MIT; see third_party/python/pycrimson-LICENSE.txt)
"""
import io
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path[:0] = [str(ROOT / "research" / "vendor" / "pycrimson" / "src"),
                str(ROOT / "research" / "vendor" / ".venv" / "Lib" / "site-packages")]

from PIL import Image, ImageDraw, ImageFont  # noqa: E402
from pycrimson._context import PackageContext  # noqa: E402

GAME = Path("E:/SteamLibrary/steamapps/common/Crimson Desert")
# name: (sheet, GetRect) from cd_icon_common_00/01.xml.
ICONS = {
    "Defense (cd_icon_ability_defense)": ("ui/texture/cd_icon_common_00.dds", (862, 155, 52, 52)),
    "Guard (cd_icon_ability_GUARDCRASH)": ("ui/texture/cd_icon_common_01.dds", (520, 791, 52, 52)),
}
TINT = (0xf6, 0xf0, 0xf0)
CARD = (0x3a, 0x35, 0x32)
WHITE = (0xf6, 0xf0, 0xf0)


def tinted(icon, size):
    """Return `icon` scaled to `size` px and multiplied by the card's stat-icon tint."""
    small = icon.resize((size, size), Image.LANCZOS)
    r, g, b, a = small.split()
    r = r.point(lambda v: v * TINT[0] // 255)
    g = g.point(lambda v: v * TINT[1] // 255)
    b = b.point(lambda v: v * TINT[2] // 255)
    return Image.merge("RGBA", (r, g, b, a))


def main():
    """Cut the icons and draw the preview."""
    context = PackageContext(GAME, pack_group_whitelist=["0012"])
    sheets = {}
    icons = {}
    for name, (sheet, (x, y, w, h)) in ICONS.items():
        if sheet not in sheets:
            sheets[sheet] = Image.open(io.BytesIO(context.get_file(sheet))).convert("RGBA")
        icons[name] = sheets[sheet].crop((x, y, x + w, y + h))

    scale = 3
    width, height = 640, 360
    page = Image.new("RGBA", (width, height), CARD + (255,))
    draw = ImageDraw.Draw(page)
    try:
        font = ImageFont.truetype("georgia.ttf", 18)
        small = ImageFont.truetype("georgia.ttf", 14)
    except OSError:
        font = small = ImageFont.load_default()

    for column, (name, icon) in enumerate(icons.items()):
        left = 30 + column * 310
        draw.text((left, 14), name, fill=WHITE, font=small)
        big = icon.resize((52 * scale, 52 * scale), Image.LANCZOS)
        page.alpha_composite(big, (left, 40))
        page.alpha_composite(tinted(icon, 22), (left + 52 * scale + 30, 40 + 52 * scale // 2 - 11))
        draw.text((left + 52 * scale + 20, 40 + 52 * scale // 2 + 16), "card size", fill=WHITE, font=small)

    # Mock shield card rows at card size, scaled up 1.5x for reading.
    rows = Image.new("RGBA", (300, 64), CARD + (255,))
    rows_draw = ImageDraw.Draw(rows)
    for row, (label, value, name) in enumerate((("Defense", "5", "Defense (cd_icon_ability_defense)"),
                                               ("Defense Efficiency", "20", "Guard (cd_icon_ability_GUARDCRASH)"))):
        top = 8 + row * 26
        rows.alpha_composite(tinted(icons[name], 22), (8, top))
        rows_draw.text((36, top + 2), label, fill=WHITE, font=small)
        rows_draw.text((36 + 160, top + 2), value, fill=WHITE, font=small)
    page.alpha_composite(rows.resize((450, 96), Image.LANCZOS), (30, 240))
    draw.text((30, 222), "Shield card rows with the guard icon (card size, enlarged 1.5x):", fill=WHITE, font=small)

    output = ROOT / "research" / "mockups" / "defense-efficiency-icon.png"
    page.convert("RGB").save(output)
    print(f"Wrote {output}")


if __name__ == "__main__":
    main()
