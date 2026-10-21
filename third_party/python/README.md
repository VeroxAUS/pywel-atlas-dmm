# Save reader dependencies

- `pycrimson`: LukeFZ, MIT, source from `https://github.com/LukeFZ/pycrimson` (existing local checkout). Includes the existing pack language-mask compatibility adjustment, accepting `0x7FFF`. Save reader and reflection source are unchanged.
- `bier`: K0lb3 / Rudolf Kolbe, MIT, version 0.0.3 from the `luke/context-rework` branch of `https://github.com/K0lb3/Binaryhelper` used by pycrimson.
- `lz4`: python-lz4 contributors, version 4.4.5. Windows x64 CPython 3.12 extension, with upstream license notices.

Licenses are alongside this file. The bundled Codex Python runtime supplies `cryptography`; the launcher is currently tailored to this computer's existing Python 3.12 environment. No dependency installation or network request occurs at startup. These packages are used by the save reader; live position tracking itself uses the standard library.
