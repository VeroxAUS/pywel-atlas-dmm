# Pywel Atlas: standalone Crimson Desert DMM mod

One in-game native mod (ASI, installed through DMM) for collectible tracking
and native map markers. It needs no companion process. Conventions,
evidence rules and current status are in [CLAUDE.md](CLAUDE.md).

## Layout

| Path | Contents |
| --- | --- |
| `src/pywel-atlas/` | Combined mod entry point (`PywelAtlas.cpp`), build script and README. It builds one `PywelAtlas.asi` from the save-detection and marker parts. |
| `src/save-detection/` | Current loaded-save observation probe (`NativeSaveLoadProbe.cpp`), its executable guard profile, build script, README shipped with the mod, vendored MinHook. |
| `src/marker-bell/` | v0.32 synthetic marker proof and native Bell save reader (`NativeSaveReader.cpp`). It also holds the older v0.35 save-load probe and earlier map probes. |
| `data/` | Bell save links, marker default definition, POI dataset and import template used by `src/marker-bell`. |
| `third_party/python/` | Licenses for the save-format work derived from pycrimson, bier and lz4. |
| `research/scripts/` | Read-only static analysis of the installed executable (guard generation, disassembly, RTTI, reference scans). `legacy/` holds earlier map-era scripts, kept unchanged. |
| `research/disasm/`, `research/analysis/` | Script output: focused disassembly and RTTI/reference tables. `legacy/` subfolders hold earlier results. |
| `research/traces/` | Preserved in-game observation logs (v0.35 to v0.37; older ones in `legacy/`). |
| `research/baselines/` | Exact v0.37 probe source and guard header before the v0.38 edits. |
| `docs/` | Current save-detection notes; `handoff/` is the Claude transfer documentation; `history/` holds earlier ledgers and the original AGENTS.md. |
| `archive/handoff-bundle/` | Remainder of the transfer bundle (redundant v0.37 `current/` snapshot, manifest, assembler script). |
| `archive/releases/` | Packaged mod ZIPs v0.30 to v0.37 (local only, ignored by git). v0.31 is the confirmed marker rollback binary. |
| `build/`, `dist/` | Compiler intermediates and built ASIs (ignored by git). |

`research/deps/` (Python capstone and pefile) is local only and ignored by git.

## Build

Requires Visual Studio 2022 Build Tools (x64 MSVC).

```powershell
.\src\pywel-atlas\build.ps1            # -> dist/pywel-atlas/ (combined mod)
.\src\save-detection\build.ps1          # -> dist/native-save-detection/
.\src\marker-bell\build.ps1 -Mode Categories   # -> dist/native-map-proof/
```

Regenerate the save-detection guard profile from the installed executable:

```powershell
python -B research/scripts/prepare_save_load_profile.py
python -B research/scripts/disassemble_save_load.py 0x17ef9c0
```

## Old to new paths

The handoff and history documents still use the original Codex workspace paths:

| Old | New |
| --- | --- |
| `outputs/tools/native-map/` (current) | `src/save-detection/` |
| `previous/outputs/tools/native-map/` | `src/marker-bell/` |
| `previous/outputs/data/` | `data/` |
| `previous/outputs/vendor/python/` | `third_party/python/` |
| `work/map-mod-research/*.py` / `*.asm` / `*.json, *.txt` / `*.log` | `research/scripts/` / `disasm/` / `analysis/` / `traces/` |
| `previous/work/map-mod-research/` | the `legacy/` subfolders of `research/` |
| `outputs/mods/*.zip`, `previous/work/superseded/*.zip` | `archive/releases/` |
| `outputs/mods/native-save-detection/` | `dist/native-save-detection/` |
| `work/native-map-build/` | `build/save-detection/`, `build/marker-bell/` |
| `outputs/claude-max-handoff/*.md` | `docs/handoff/` |
