"""Parse missioninfo rows using the field order recovered from the game's own reader.

What it does:
    The game's MissionInfo reader (CrimsonDesert.exe, row loader FUN_1404344e0 ->
    deserializer at RVA 0x1509960) reads each row field by field with a stream
    reader. Primitive shapes seen in that code:
        key   - u32 (the game maps it to an internal index afterwards)
        str   - u32 length, then that many bytes
        list  - u32 count, then `count` elements
    This module encodes the field order as a small spec and walks a row with it.
    A row is "fully decoded" when the walk ends exactly at the row's last byte,
    which is a strong check that the layout is right.

Reads:  (library) used by decode_layout_check.py and later scripts.
"""
import struct


class Reader:
    """Walks a bytes object and records every primitive read as (name, value)."""

    def __init__(self, data):
        self.data = data
        self.pos = 0
        self.fields = []

    def take(self, size):
        """Return `size` bytes and advance; raise if the row is too short."""
        if self.pos + size > len(self.data):
            raise EOFError(f"need {size} bytes at {self.pos}, row has {len(self.data)}")
        chunk = self.data[self.pos:self.pos + size]
        self.pos += size
        return chunk

    def u8(self):
        return self.take(1)[0]

    def u16(self):
        return struct.unpack("<H", self.take(2))[0]

    def u32(self):
        return struct.unpack("<I", self.take(4))[0]

    def u64(self):
        return struct.unpack("<Q", self.take(8))[0]

    def string(self):
        length = self.u32()
        if length > 4096:
            raise ValueError(f"string length {length} at {self.pos}")
        return self.take(length).decode("utf-8", "replace")

    def raw(self, size):
        return self.take(size).hex()


def key_list(r):
    """Read a list of u32 keys."""
    return [r.u32() for _ in range(count(r))]


def count(r):
    """Read a list count, rejecting absurd values (a sign of a wrong layout)."""
    n = r.u32()
    if n > 5000:
        raise ValueError(f"list count {n} at {r.pos - 4}")
    return n



def klist(r):
    """List of u32 keys: count then keys."""
    return key_list(r)


def alist(r, element):
    """List whose elements are read by `element(r)`."""
    return [element(r) for _ in range(count(r))]


def e_14ecb60(r):
    return {"key": r.u32(), "k2": r.u32(), "a": r.u32(), "b": r.u32(), "flags": r.raw(4)}


def e_150a0d0(r):
    return {"key": r.u32(), "key2": r.u32(), "a": r.u32(), "b": r.u32(), "flags": r.raw(3)}


def e_1509500(r):
    out = {"flag": r.u8(), "keys": klist(r), "k1": r.u32(), "a": r.u32(), "b": r.u32()}
    out.update(k2=r.u32(), k3=r.u32(), c=r.u32(), k4=r.u32(), k5=r.u32(), tail=r.raw(2))
    return out


def e_15092f0(r):
    out = {"flag": r.u8(), "s1": r.string(), "s2": r.string(), "k1": r.u32(), "k2": r.u32()}
    out.update(h=r.u16(), b=r.u8(), s3=r.string(), l1=klist(r), l2=klist(r), l3=klist(r),
               q=r.u64(), z=r.u8())
    return out


def e_15096f0(r):
    out = {"flag0": r.u8(), "kA": r.u32(), "kB": r.u32(), "kC": r.u32(),
           "l1": klist(r), "a": r.u32(), "h": r.u16(), "k1": r.u32(), "b": r.u32(),
           "k2": r.u32(), "f": r.u8(), "k3": r.u32(), "k4": r.u32(), "k5": r.u32(),
           "s": r.string(), "c": r.u32(), "tail": r.raw(2)}
    return out


def f_1525ef0(r):
    """Optional struct: u8 flag, then (when set) a placement block with a position."""
    flag = r.u8()
    if not flag:
        return {"flag": 0}
    out = {"flag": flag, "b0": r.u8(), "pos_block": r.raw(12), "quat_block": r.raw(16),
           "tail_block": r.raw(12), "k": r.u32(), "s": r.string(), "b1": r.u8(),
           "v1": r.raw(12), "v2": r.raw(12), "b2": r.u8(), "b3": r.u8()}
    return out


def f_12c01e0(r):
    return {"b": r.u8(), "q": r.u64(), "s": r.string()}


def f_1508ef0(r):
    out = {"k1": r.u32(), "k2": r.u32(), "k3": r.u32(), "v": r.u32(), "k4": r.u32(),
           "k5": r.u32(), "l1": klist(r), "l2": [r.u32() for _ in range(count(r))],
           "k6": r.u32(), "k7": r.u32(), "blk": r.raw(12), "w": r.u32(), "bytes": r.raw(6),
           "h": r.u16()}
    return out


def parse_mission(row, trace=None):
    """Return a dict of named fields for one missioninfo row; raises on a layout mismatch."""
    r = Reader(row)

    class Recorder(dict):
        """Dict that remembers the read position after each field is stored."""

        def __setitem__(self, name, value):
            super().__setitem__(name, value)
            r.fields.append((name, r.pos))

    m = Recorder()
    m["key"] = r.u32()
    m["name"] = r.string()
    m["b10"] = r.u8()
    m["typeKey"] = r.u32()
    m["keyList18"] = klist(r)
    m["list28"] = alist(r, e_14ecb60)
    m["items38"] = alist(r, e_150a0d0)
    m["keyList48"] = klist(r)
    m["u32List58"] = [r.u32() for _ in range(count(r))]
    m["u32List68"] = [r.u32() for _ in range(count(r))]
    m["block78"] = f_1525ef0(r)
    m["pairs80"] = [(r.u32(), r.u32()) for _ in range(count(r))]
    m["keyList90"] = klist(r)
    m["list_a0"] = alist(r, e_1509500)
    m["h_b0"] = r.u16()
    m["blk_b8"] = f_1508ef0(r)
    m["s108"] = f_12c01e0(r)
    m["s128"] = f_12c01e0(r)
    m["s148"] = f_12c01e0(r)
    m["s168"] = f_12c01e0(r)
    m["key188"] = r.u32()
    m["list190"] = alist(r, e_15092f0)
    m["list1a0"] = alist(r, e_15096f0)
    m["key1b0"] = r.u32()
    m["tail"] = {"h1b2": r.u16(), "h1b4": r.u16(), "u1b8": r.u32(), "bytes": r.raw(14),
                 "last": [r.u8() for _ in range(0)]}
    m["tail2"] = {"u1cc": r.u32(), "key1d0": r.u32(), "keyList1d8": klist(r)}
    return m, r


# ---------------------------------------------------------------- questinfo
# Layout from the game's QuestInfo deserializer (RVA 0x1515550, row loader
# 0x5c2910). Fields before the large nested "list 152e3b0" (stage-like records)
# are decoded exactly; that list and the few fields after it are left raw.

def e_1514810(r):
    return {"key": r.u32(), "key2": r.u32(), "a": r.u32(), "b": r.u32(), "flags": r.raw(3)}


def f_14fe280(r):
    return {"bytes": r.raw(count(r)), "k1": r.u32(), "k2": r.u32(), "b": r.u8()}


def parse_quest_prefix(row):
    """Return (fields, reader) up to the nested list; reader.pos is where that list starts."""
    r = Reader(row)

    class Recorder(dict):
        """Dict that remembers the read position after each field is stored."""

        def __setitem__(self, name, value):
            super().__setitem__(name, value)
            r.fields.append((name, r.pos))

    q = Recorder()
    q["key"] = r.u32()
    q["name"] = r.string()
    q["b10"] = r.u8()
    q["b11"] = r.u8()
    q["b12"] = r.u8()
    q["s18"] = f_12c01e0(r)
    q["s38"] = f_12c01e0(r)
    q["h58"] = r.u16()
    q["k5a"] = r.u32()
    q["f60"] = f_14fe280(r)
    q["e78"] = e_1514810(r)
    q["h8c"] = r.u16()
    q["keyList90"] = klist(r)
    q["list_a0"] = alist(r, e_1514810)
    q["keyList_b0"] = klist(r)                                   # 1523e60
    q["u32List_c0"] = [r.u32() for _ in range(count(r))]         # 15274a0
    q["keyList_d0"] = klist(r)                                   # 1525c20
    q["keyList_e0"] = klist(r)                                   # 1521b60
    q["keys_f0"] = [r.u32() for _ in range(5)]                   # 1523c60,151eea0,1520520 x3
    q["u100"] = r.u32()
    q["u104"] = r.u32()
    q["s108"] = r.string()
    q["k_110"] = r.u32()
    q["u114"] = r.u32()
    q["s118"] = r.string()
    q["nestedStart"] = r.pos
    return q, r


def parse_quest_tail(row, start):
    """Parse the fields after the nested list when that list is empty (count 0)."""
    r = Reader(row)
    r.pos = start
    nested = r.u32()
    if nested:
        return None
    tail = {"klist4c": klist(r), "k50": r.u32(), "bytes": r.raw(4), "u52": r.u32()}
    return tail, len(row) - r.pos


# ---------------------------------------------------------------- factionnode
# Layout from the deserializer at RVA 0x14ff1d0. Only the leading fields are
# decoded (identity, links and the world position); the nested records that follow
# (stage-like lists) are left undecoded.

def parse_node_prefix(row):
    """Return (fields, reader); reader.pos is where the nested lists start."""
    r = Reader(row)
    n = {}
    n["key"] = r.u32()
    n["name"] = r.string()
    n["b10"] = r.u8()
    n["k12"] = r.u32()
    n["k14"] = r.u32()
    n["k16"] = r.u32()
    n["h18"] = r.u16()
    n["h1a"] = r.u16()
    n["s20"] = r.string()
    n["klistA"] = klist(r)
    n["klistB"] = klist(r)
    n["xyz"] = struct.unpack("<3f", r.take(12))
    n["u54"] = r.u32()
    n["u58"] = r.u32()
    n["after_xyz"] = r.pos
    return n, r


# ---------------------------------------------------------------- stageinfo
# Layout from the deserializer at RVA 0x151ab40. Only the leading fields are decoded:
# identity, three small blocks and the first record, which holds a world position.

def parse_stage_prefix(row):
    """Return (fields, reader) up to and including the stage's world XYZ position."""
    r = Reader(row)
    s = {}
    s["key"] = r.u32()
    s["name"] = r.string()
    s["b"] = r.u8()
    s["blocks"] = [f_12c01e0(r) for _ in range(3)]
    s["s1"] = r.string()
    s["u1"] = r.u32()
    s["s2"] = r.string()
    s["s3"] = r.string()
    s["xyz"] = struct.unpack("<3f", r.take(12))
    return s, r
