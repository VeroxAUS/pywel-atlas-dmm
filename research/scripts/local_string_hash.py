"""Compute the game's key for a localstringinfo name (e.g. "UI_StatusGauge_DDD").

What it does:
    The game looks up its local UI strings by a 32-bit number made from the
    key name: the name is lower-cased and hashed with Bob Jenkins' lookup3
    "hashlittle" with the start value 0xc5ede (0x141364680 lower-cases and
    calls 0x141364780; its first instruction sets a = b = c = length +
    0xdeba1dcd = 0xdeadbeef + length + 0xc5ede). localstringinfo rows are
    keyed by that number.

Run:    python -B research/scripts/local_string_hash.py UI_StatusGauge_DDD [...]
"""
import sys

SEED = 0xC5EDE
MASK = 0xFFFFFFFF


def rotate(value, count):
    """Rotate a 32-bit value left by `count` bits."""
    return ((value << count) | (value >> (32 - count))) & MASK


def hashlittle(data, initial=SEED):
    """Return lookup3 hashlittle(data, initial) (little-endian reads, as on x64)."""
    length = len(data)
    a = b = c = (0xDEADBEEF + length + initial) & MASK
    position = 0
    while length > 12:
        a = (a + int.from_bytes(data[position:position + 4], "little")) & MASK
        b = (b + int.from_bytes(data[position + 4:position + 8], "little")) & MASK
        c = (c + int.from_bytes(data[position + 8:position + 12], "little")) & MASK
        a = (a - c) & MASK; a ^= rotate(c, 4); c = (c + b) & MASK
        b = (b - a) & MASK; b ^= rotate(a, 6); a = (a + c) & MASK
        c = (c - b) & MASK; c ^= rotate(b, 8); b = (b + a) & MASK
        a = (a - c) & MASK; a ^= rotate(c, 16); c = (c + b) & MASK
        b = (b - a) & MASK; b ^= rotate(a, 19); a = (a + c) & MASK
        c = (c - b) & MASK; c ^= rotate(b, 4); b = (b + a) & MASK
        position += 12
        length -= 12
    if length == 0:
        return c
    tail = data[position:] + b"\0" * 12
    a = (a + int.from_bytes(tail[0:4], "little")) & MASK
    b = (b + int.from_bytes(tail[4:8], "little")) & MASK
    c = (c + int.from_bytes(tail[8:12], "little")) & MASK
    c ^= b; c = (c - rotate(b, 14)) & MASK
    a ^= c; a = (a - rotate(c, 11)) & MASK
    b ^= a; b = (b - rotate(a, 25)) & MASK
    c ^= b; c = (c - rotate(b, 16)) & MASK
    a ^= c; a = (a - rotate(c, 4)) & MASK
    b ^= a; b = (b - rotate(a, 14)) & MASK
    c ^= b; c = (c - rotate(b, 24)) & MASK
    return c


def local_string_key(name):
    """Return the localstringinfo key for a key name."""
    return hashlittle(name.lower().encode("ascii"))


if __name__ == "__main__":
    for argument in sys.argv[1:]:
        print(argument, local_string_key(argument))
