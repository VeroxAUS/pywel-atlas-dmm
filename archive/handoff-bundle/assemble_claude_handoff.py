"""Assemble verbatim transfer appendices, source literal index and hash manifest.

This packages existing engineering artifacts. It does not open a game process,
read raw game saves, compile code, or run any tests.
"""
import csv
import hashlib
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BUNDLE = ROOT / 'outputs/claude-max-handoff'
main = BUNDLE / 'CLAUDE-MAX-HANDOFF.md'
body = main.read_text(encoding='utf-8')
appendix_heading = '\n## Appendix A. Verbatim v0.37 entry guards\n'
body = body.split(appendix_heading)[0]
profile = (BUNDLE / 'current/outputs/tools/native-map/save-load-profile.h').read_text(encoding='utf-8')
bell_links = (BUNDLE / 'previous/outputs/tools/native-map/bell-proof-links.h').read_text(encoding='utf-8')
probe = (BUNDLE / 'current/outputs/tools/native-map/NativeSaveLoadProbe.cpp').read_text(encoding='utf-8-sig')
signatures = '\n'.join(line for line in probe.splitlines() if line.startswith('using '))
main.write_text(body + appendix_heading + '\nExact copied source; keep array order aligned with callbacks.\n\n```cpp\n' +
    profile + '\n```\n\n## Appendix B. Verbatim current hook declarations\n\n```cpp\n' +
    signatures + '\n```\n\n## Appendix C. Verbatim eight-Bell identity table\n\n```cpp\n' +
    bell_links + '\n```\n\n## Appendix D. Resolver TLS globals calculated from instructions\n\n' +
    '| Instruction | Next RVA | Displacement | Effective global RVA |\n| --- | --- | --- | --- |\n' +
    f'| 0x17efa77 MOV | 0x17efa7e | +0x5579a5a | `{0x17efa7e + 0x5579a5a:#x}` |\n' +
    f'| 0x17efa82 CMOVNE | 0x17efa8a | +0x5579a56 | `{0x17efa8a + 0x5579a56:#x}` |\n' +
    '\nThese are native registry-root pointer globals selected through TLS byte+0x1ec. '
    'They are static lookup provenance, not a proven client-to-server binding by themselves. '
    'The current observer hooks the getter instead of traversing these globals directly.\n', encoding='utf-8')

notes = (BUNDLE / 'current/outputs/docs/native-save-detection.md').read_bytes()
(BUNDLE / 'CURRENT-SAVE-DETECTION-NOTES.md').write_bytes(notes)
historical = (BUNDLE / 'previous/outputs/docs/native-offset-handoff.md').read_text(encoding='utf-8-sig')
(BUNDLE / 'HISTORICAL-NATIVE-OFFSETS.md').write_text(
    '# Historical offset ledger: read status corrections first\n\n'
    'The following original ledger predates v0.36/v0.37. Its offset history is valuable, '
    'but latest status, hook count, RTTI names, retry/autosave results and exact call/return '
    'distinctions are superseded by CLAUDE-MAX-HANDOFF.md. Do not execute old next-step '
    'manual sequences merely because they appear below.\n\n---\n\n' + historical, encoding='utf-8')

lines = [
    '# Exhaustive native project hex-literal source index', '',
    'Generated from both bundled native-map source trees, excluding third-party vendor files. '
    'Includes function RVAs, object/vtable byte offsets, stack offsets, type IDs, byte guards, '
    'bitmasks, float bits, crypto constants and private keys. **Not every literal is an address.** '
    'Semantic classifications are in the main handoff and original source. Original line numbers '
    'are preserved here for exact navigation; all indexed files are bundled.', '',
]
locations = {}
for label in ('current', 'previous'):
    directory = BUNDLE / label / 'outputs/tools/native-map'
    for source in sorted(directory.iterdir()):
        if not source.is_file() or source.suffix.lower() not in ('.cpp', '.h', '.py', '.json', '.ps1'):
            continue
        relative = source.relative_to(BUNDLE).as_posix()
        source_lines = source.read_text(encoding='utf-8-sig', errors='replace').splitlines()
        matches = [(number, text) for number, text in enumerate(source_lines, 1) if re.search(r'0x[0-9a-fA-F]+', text)]
        if not matches:
            continue
        lines += [f'## {relative}', '', '```text']
        for number, line in matches:
            lines.append(f'{number}: {line}')
            for value in re.findall(r'0x[0-9a-fA-F]+', line):
                normalized = f'{int(value, 16):#x}'
                locations.setdefault(normalized, []).append({'file': relative, 'line': number, 'source': line})
        lines += ['```', '']
(BUNDLE / 'OFFSET-LITERALS.md').write_text('\n'.join(lines), encoding='utf-8')
import json
(BUNDLE / 'OFFSET-LITERALS.json').write_text(json.dumps(locations, indent=2), encoding='utf-8')

with (BUNDLE / 'MANIFEST-SHA256.csv').open('w', newline='', encoding='utf-8-sig') as output:
    writer = csv.writer(output)
    writer.writerow(['path', 'bytes', 'sha256'])
    for path in sorted(BUNDLE.rglob('*')):
        if not path.is_file() or path.name == 'MANIFEST-SHA256.csv':
            continue
        raw = path.read_bytes()
        writer.writerow([path.relative_to(BUNDLE).as_posix(), len(raw), hashlib.sha256(raw).hexdigest()])
print(f'Handoff: {len(main.read_text(encoding="utf-8").split())} words')
print(f'Indexed {len(locations)} unique hex values; manifest written.')
