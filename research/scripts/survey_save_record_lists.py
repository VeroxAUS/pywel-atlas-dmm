"""List which record lists a decoded save contains, and how big they are.

What it does:
    Takes one of the mod's OWN diagnostic save copies (the encrypted
    native-save-proof-*.save files that older builds wrote into
    %LOCALAPPDATA%\\PywelAtlas), decodes it in memory the same way
    src/marker-bell/NativeSaveReader.cpp does (decrypt, check the HMAC,
    decompress), and then walks every top-level object instead of only the
    Bell container. It prints:
      1. every top-level object type and its size,
      2. every list of objects with its entry count and element type,
      3. type-table entries whose type or field names suggest discovery or
         completion (for example "Discovered", "_isCompleted", "Treasure"),
      4. for each list whose entries have a "...Key" field, how many entries
         use each key value, and how many of them have each yes/no field set.
    The goal is to see which other collectible families might be stored the
    same way as Bells. Read-only: the game's save folder is never opened, and
    nothing is written; all output goes to the console.

Key terms:
    reflection data - the save describes its own layout: first a table of
        type names and field names, then objects stored using that table.
    kind - a number per field saying how its value is stored (plain value,
        list, nested object and so on), as in NativeSaveReader.cpp.
    HMAC - a keyed checksum; if it matches, the copy is genuine and complete.

Reads:  one native-save-proof-*.save file given on the command line
Writes: nothing; prints a plain-text report.
Run:    python -B research/scripts/survey_save_record_lists.py <path to .save> [--detail]
        (--detail instead prints each discovered-gimmick record with its
        position, and field gimmicks grouped by their gimmick info key)
        (format interpretation adapted from LukeFZ/pycrimson, MIT; see
        third_party/python/pycrimson-LICENSE.txt)
"""
import hashlib
import hmac
import re
import struct
import sys
from collections import Counter, defaultdict
from pathlib import Path

# Words that suggest a type or field records discovery or completion.
INTEREST = re.compile(
    r'discover|complet|collect|treasure|chest|memory|fragment|artifact|cresset|nexus|'
    r'shrine|constellation|sanctum|spire|cave|hidden|gimmick|knowledge|observe|'
    r'acquire|obtain|unlock|found|visit|open|reveal|fog|region|waypoint|mapicon|'
    r'puzzle|kuku|pet|mount|blueprint|recipe|formula|boss|quest|mission',
    re.IGNORECASE,
)

MASK = 0xFFFFFFFF


def rotate(value, bits):
    """Rotate a 32-bit number left by `bits` (a ChaCha20 building block)."""
    return ((value << bits) | (value >> (32 - bits))) & MASK


def chacha20(data, key, nonce):
    """Decrypt `data` with original ChaCha20 (64-bit counter in nonce words 0-1).

    This mirrors Decrypt() in NativeSaveReader.cpp: the 16 nonce bytes fill
    state words 12..15 and words 12..13 act as the block counter.
    """
    state = [0x61707865, 0x3320646E, 0x79622D32, 0x6B206574]
    state += list(struct.unpack('<8I', key))
    state += list(struct.unpack('<4I', nonce))
    output = bytearray(len(data))

    for start in range(0, len(data), 64):
        x = list(state)

        # 10 double rounds = the standard 20 rounds.
        for _ in range(10):
            for a, b, c, d in ((0, 4, 8, 12), (1, 5, 9, 13), (2, 6, 10, 14), (3, 7, 11, 15),
                               (0, 5, 10, 15), (1, 6, 11, 12), (2, 7, 8, 13), (3, 4, 9, 14)):
                x[a] = (x[a] + x[b]) & MASK
                x[d] = rotate(x[d] ^ x[a], 16)
                x[c] = (x[c] + x[d]) & MASK
                x[b] = rotate(x[b] ^ x[c], 12)
                x[a] = (x[a] + x[b]) & MASK
                x[d] = rotate(x[d] ^ x[a], 8)
                x[c] = (x[c] + x[d]) & MASK
                x[b] = rotate(x[b] ^ x[c], 7)

        stream = struct.pack('<16I', *[(x[i] + state[i]) & MASK for i in range(16)])
        chunk = data[start:start + 64]
        output[start:start + len(chunk)] = bytes(p ^ s for p, s in zip(chunk, stream))

        # Advance the 64-bit block counter.
        state[12] = (state[12] + 1) & MASK
        if state[12] == 0:
            state[13] = (state[13] + 1) & MASK

    return bytes(output)


def lz4_expand(data, expected):
    """Decompress an LZ4 block; matches may overlap what was just written."""
    output = bytearray()
    position = 0

    def length(initial):
        """Apply the LZ4 rule: 15 means 'keep adding bytes until one is not 255'."""
        nonlocal position
        result = initial
        if initial == 15:
            while True:
                extra = data[position]
                position += 1
                result += extra
                if extra != 255:
                    break
        return result

    while position < len(data):
        token = data[position]
        position += 1
        literal = length(token >> 4)
        output += data[position:position + literal]
        position += literal
        if position == len(data):
            break
        distance = data[position] | (data[position + 1] << 8)
        position += 2
        count = length(token & 15) + 4
        if distance <= 0 or distance > len(output):
            raise ValueError('Invalid LZ4 match offset')
        start = len(output) - distance
        if distance >= count:
            output += output[start:start + count]
        else:
            # Overlapping copy: repeat the last `distance` bytes.
            for index in range(count):
                output.append(output[start + index])

    if len(output) != expected:
        raise ValueError('LZ4 expanded length mismatch')
    return bytes(output)


def decode(file_bytes):
    """Check the 128-byte header, decrypt, verify the HMAC and decompress."""
    if file_bytes[:4] != b'SAVE':
        raise ValueError('Unsupported save magic')
    version, size = struct.unpack_from('<HH', file_bytes, 4)
    if version != 2 or size != 128:
        raise ValueError('Only save envelope version 2 is supported')
    expanded, compressed = struct.unpack_from('<II', file_bytes, 18)
    nonce = file_bytes[26:42]
    signature = file_bytes[42:74]
    if compressed != len(file_bytes) - size:
        raise ValueError('Payload size mismatch')

    # Same key derivation as NativeSaveReader.cpp (31 bytes XOR text, last byte 0).
    base = bytes([
        0xC4, 0x1B, 0x8E, 0x73, 0x0D, 0xF2, 0x59, 0xA6, 0x37, 0xCC, 0x04, 0xE9, 0xB1, 0x2F, 0x96, 0x68,
        0xDA, 0x10, 0x7A, 0x85, 0x3E, 0x61, 0xF9, 0x22, 0x4D, 0xB8, 0x0A, 0xD7, 0x5C, 0x13, 0xEF,
    ])
    material = b'^Pearl--#Abyss__@!!PRIVATE_HMAC_SECRET_CHECK'
    key = bytes(b ^ m for b, m in zip(base, material[:31])) + b'\x00'

    plain = chacha20(file_bytes[size:], key, nonce)
    digest = hmac.new(key, plain, hashlib.sha256).digest()
    if not hmac.compare_digest(digest, signature):
        raise ValueError('Save authentication failed')
    return plain if compressed == expanded else lz4_expand(plain, expanded)


class Cursor:
    """Bounded little-endian read position inside the decoded bytes."""

    def __init__(self, data):
        """Start at offset 0 with the whole buffer readable."""
        self.data = data
        self.offset = 0
        self.limit = len(data)

    def take(self, count):
        """Return the next `count` bytes and move past them."""
        if count < 0 or self.offset + count > self.limit:
            raise ValueError('Truncated save structure')
        value = self.data[self.offset:self.offset + count]
        self.offset += count
        return value

    def u8(self):
        """Read one unsigned byte."""
        return self.take(1)[0]

    def u16(self):
        """Read a 2-byte unsigned number."""
        return struct.unpack('<H', self.take(2))[0]

    def u32(self):
        """Read a 4-byte unsigned number."""
        return struct.unpack('<I', self.take(4))[0]

    def string(self):
        """Read a 4-byte length followed by that many bytes of text."""
        return self.take(self.u32()).decode('utf-8', 'replace')


class Survey:
    """Walk every top-level object and collect list and key statistics."""

    ARRAY_KINDS = {3, 6, 7, 9, 10}

    def __init__(self, plain):
        """Parse the header and the type and object tables."""
        self.reader = Cursor(plain)
        self.types = []
        self.objects = []
        # (owner type, list field) -> Counter of element type names.
        self.lists = defaultdict(Counter)
        # (owner type, list field) -> list of captured scalar dicts per entry.
        self.entries = defaultdict(list)
        self.failures = []
        self._read_tables()

    def _read_tables(self):
        """Read the header, type table, optional name list and object table."""
        reader = self.reader
        if reader.u16() != 0xFFFF:
            raise ValueError('Unsupported legacy reflection header')
        metadata = reader.u32()
        if metadata >= 4:
            reader.take(8)
        self.version = reader.u32()

        for _ in range(reader.u16()):
            name = reader.string()
            properties = []
            for _ in range(reader.u16()):
                properties.append({
                    'name': reader.string(),
                    'typeName': reader.string(),
                    'kind': reader.u16(),
                    'size': reader.u16(),
                    'flags': reader.u32(),
                })
            self.types.append({'name': name, 'properties': properties})

        if self.version > 13:
            for _ in range(reader.u32()):
                reader.string()

        count = reader.u32()
        reader.u32()
        for _ in range(count):
            type_index = reader.u16()
            reader.take(10)
            offset = reader.u32()
            size = reader.u32()
            self.objects.append((type_index, offset, size))

    def walk_all(self):
        """Parse each top-level object on its own, so one failure stays local."""
        for type_index, offset, size in self.objects:
            self.reader.offset = offset
            self.reader.limit = offset + size
            try:
                self._object(0, True, type_index, False, None)
            except Exception as error:  # noqa: BLE001 - report and move on
                self.failures.append((self.types[type_index]['name'], str(error)))

    def _object(self, depth, top, known_type, named, capture):
        """Parse one object; `capture` collects small scalar fields when given."""
        reader = self.reader
        if depth > 64:
            raise ValueError('Nesting limit exceeded')
        bitmap = reader.take(reader.u16())
        type_index = known_type
        if not top:
            type_index = reader.u16()
            reader.take(9)
            if self.version >= 14 and named:
                reader.take(4)
            target = reader.u32()
            if target < reader.offset or target > reader.limit:
                raise ValueError('Invalid object offset')
            reader.offset = target

        type_info = self.types[type_index]
        start = reader.offset
        reader.take(1)
        if reader.u8() != 1:
            for _ in range(reader.u16()):
                reader.u16()
                reader.string()

        for index, prop in enumerate(type_info['properties']):
            kind = prop['kind']
            array = kind in self.ARRAY_KINDS
            present = (bitmap[index // 8] >> (index & 7)) & 1
            if (prop['flags'] & 0x82) or (not array and not present):
                continue
            if self.version >= 15 and array and reader.u8() == 1:
                continue

            if kind in (0, 2):
                self._scalar(prop, reader.take(prop['size']), capture)
            elif kind == 1:
                self._scalar(prop, reader.take(reader.u32()), capture)
            elif kind == 3:
                reader.take(reader.u32() * prop['size'])
            elif kind == 4:
                self._object(depth + 1, False, 0, False, None)
            elif kind == 5:
                if reader.u8():
                    self._object(depth + 1, False, 0, False, None)
            elif kind in (6, 7):
                count = reader.u32()
                has_names = self.version >= 14 and reader.u8() == 1
                reader.take(8)
                unknown = struct.unpack('<i', reader.take(4))[0]
                if unknown > 0:
                    reader.take(unknown * (12 if has_names else 8))
                key = (type_info['name'], prop['name'])
                for _ in range(count):
                    entry = {}
                    element_type = self._peek_type(has_names)
                    self.lists[key][element_type] += 1
                    self._object(depth + 1, False, 0, has_names, entry)
                    self.entries[key].append(entry)
            elif kind == 10:
                for _ in range(reader.u32()):
                    reader.take(reader.u32() * prop['size'])
            else:
                raise ValueError(f'Unsupported kind {kind} in {type_info["name"]}.{prop["name"]}')

        if not top:
            end = reader.offset
            if reader.u32() != end - start:
                raise ValueError('Nested object size mismatch')

    def _peek_type(self, has_names):
        """Return the element type name of the nested object about to be read."""
        reader = self.reader
        bitmap_size = struct.unpack_from('<H', reader.data, reader.offset)[0]
        type_index = struct.unpack_from('<H', reader.data, reader.offset + 2 + bitmap_size)[0]
        if type_index < len(self.types):
            return self.types[type_index]['name']
        return f'?{type_index}'

    @staticmethod
    def _scalar(prop, value, capture):
        """Keep small plain values (bools, numbers, UUIDs, text) of a list entry."""
        if capture is None:
            return
        if prop['typeName'] == 'bool' and len(value) == 1:
            capture[prop['name']] = ('bool', value[0])
        elif prop['kind'] == 1:
            capture[prop['name']] = ('text', value.decode('utf-8', 'replace'))
        elif prop['typeName'] == 'float3' and len(value) == 12:
            capture[prop['name']] = ('float3', struct.unpack('<3f', value))
        elif prop['typeName'] == 'Transform' and len(value) == 40:
            # Assumed layout: position (3 floats) first; only that part is kept.
            capture[prop['name']] = ('float3', struct.unpack_from('<3f', value))
        elif len(value) in (1, 2, 4, 8) and prop['kind'] in (0, 2):
            capture[prop['name']] = ('int', int.from_bytes(value, 'little'))
        elif len(value) == 16:
            capture[prop['name']] = ('uuid', struct.unpack('<4I', value))


def report(survey):
    """Print the four sections described in the file header."""
    print(f'serialization version {survey.version}; {len(survey.types)} types; '
          f'{len(survey.objects)} top-level objects')

    print('\n== Top-level objects ==')
    for type_index, _, size in sorted(survey.objects, key=lambda item: -item[2]):
        print(f'{size:>9}  {survey.types[type_index]["name"]}')

    print('\n== Object lists (owner.field: count [element types]) ==')
    for key, counter in sorted(survey.lists.items(), key=lambda item: -sum(item[1].values())):
        total = sum(counter.values())
        elements = ', '.join(f'{name}x{count}' for name, count in counter.most_common(3))
        print(f'{total:>6}  {key[0]}.{key[1]}  [{elements}]')

    print('\n== Type-table names suggesting discovery/completion ==')
    for type_info in survey.types:
        fields = [p for p in type_info['properties'] if INTEREST.search(p['name'])]
        if INTEREST.search(type_info['name']) or fields:
            names = ', '.join(f'{p["name"]}:{p["typeName"]}' for p in type_info['properties'])
            print(f'{type_info["name"]}: {names}')

    print('\n== Key fields per list (value: entries, bool fields true/total) ==')
    for key, entries in survey.entries.items():
        key_fields = sorted({name for entry in entries for name, (kind, _) in entry.items()
                             if kind == 'int' and name.lower().endswith('key')})
        bool_fields = sorted({name for entry in entries for name, (kind, _) in entry.items()
                              if kind == 'bool'})
        if not key_fields:
            continue
        print(f'\n{key[0]}.{key[1]}  entries={len(entries)}  keyFields={key_fields}')
        for bool_name in bool_fields:
            true_count = sum(1 for entry in entries if entry.get(bool_name, (None, 0))[1] == 1)
            print(f'  bool {bool_name}: {true_count} true of {len(entries)}')
        main_key = key_fields[0]
        grouped = defaultdict(list)
        for entry in entries:
            grouped[entry.get(main_key, (None, None))[1]].append(entry)
        print(f'  distinct {main_key}: {len(grouped)}')
        for value, group in sorted(grouped.items(), key=lambda item: -len(item[1]))[:60]:
            flags = ' '.join(
                f'{name}={sum(1 for e in group if e.get(name, (None, 0))[1] == 1)}'
                for name in bool_fields
            )
            print(f'    {value}: {len(group)}  {flags}')

    if survey.failures:
        print('\n== Objects not fully parsed ==')
        for name, error in survey.failures:
            print(f'{name}: {error}')


def detail(survey):
    """Print every discovered-gimmick record and field gimmicks by info key.

    Positions are printed as game coordinates (x, y, z). For field gimmicks
    the owner level name and alias are printed, because their text often
    names the object family (for example a chest or a bell).
    """
    gimmick_key = ('DiscoveredLevelGimmickSceneObjectSaveData',
                   '_discoveredLevelGimmickSceneObjectSaveDataList')
    print('\n== Discovered level gimmick records ==')
    for entry in survey.entries.get(gimmick_key, []):
        values = {name: value for name, (_, value) in entry.items()}
        print(f'key={values.get("_levelGimmickSceneObjectInfoKey")} '
              f'uuid={list(values.get("_sceneObjectUuid", ()))} '
              f'pos={tuple(round(v, 1) for v in values.get("_fogPivotPosition", ()))} '
              f'completed={values.get("_isCompleted")} discovered={values.get("_isDiscoverd")}')

    field_key = ('FieldSaveData', '_fieldGimmickSaveDataList')
    grouped = defaultdict(list)
    for entry in survey.entries.get(field_key, []):
        grouped[entry.get('_gimmickInfoKey', (None, None))[1]].append(entry)
    print('\n== Field gimmicks by _gimmickInfoKey (count, sample names) ==')
    for value, group in sorted(grouped.items(), key=lambda item: -len(item[1])):
        names = Counter()
        for entry in group:
            owner = entry.get('_ownerLevelName', (None, ''))[1]
            alias = entry.get('_aliasName', (None, ''))[1]
            names[f'{owner}|{alias}'] += 1
        samples = '; '.join(f'{name} x{count}' for name, count in names.most_common(3))
        print(f'{value}: {len(group)}  {samples}')


def main():
    """Decode the given proof copy and print the survey (add --detail for more)."""
    path = Path(sys.argv[1])
    if 'Pearl Abyss' in str(path):
        raise SystemExit('Refusing to read inside the game save folder; use a mod proof copy.')
    plain = decode(path.read_bytes())
    survey = Survey(plain)
    survey.walk_all()
    if '--detail' in sys.argv[2:]:
        detail(survey)
    else:
        report(survey)


if __name__ == '__main__':
    main()
