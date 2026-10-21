"""Find statically decoded callers of the native per-layer projection function."""
from pathlib import Path
exec(Path(__file__).with_name('inspect_display_listener.py').read_text().split('instructions = inspect(')[0])
for begin, end in ends.items():
    if not 0xd80000 <= begin < 0xe30000:
        continue
    code = list(decoder.disasm(pe.get_data(begin, end-begin), base+begin))
    for index, ins in enumerate(code):
        if ins.mnemonic == 'call' and ins.op_str == hex(base+0xd94040):
            print(f'CALLER {begin:#x} END {end:#x}')
            for item in code[max(0,index-14):index+7]:
                print(f'{item.address-base:#x}: {item.mnemonic} {item.op_str}')
