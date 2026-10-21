# Start the Claude transfer

`CLAUDE.md` at this folder root carries the original AGENTS.md conventions and the current Claude continuation constraints. Keep it at the project root when moving the work.

Give Claude `CLAUDE-MAX-HANDOFF.md` first. Keep the transfer ZIP/extracted folder
available for its source, traces and disassemblies. The main document is detailed
enough to paste as context; the included files avoid transcription mistakes.

Paste this as the opening instruction:

```text
Continue my Pywel Atlas standalone Crimson Desert DMM mod from the attached
CLAUDE-MAX-HANDOFF.md and transfer bundle. Treat the evidence levels and pending
step exactly as documented. The latest built probe is v0.37; its native actor-link
relationship is not runtime confirmed. The latest available live session when
handoff was written was v0.36. Do not invent v0.37 results.

The product is one standalone in-game mod, without a required companion process.
Native Bell reading and completion-driven synthetic marker removal/recreation
blocking were confirmed in v0.31. Manual 101/100/101, Continue/title, and the
v0.36 death/retry/explicit-autosave sequences are complete; do not repeat them.

The current missing step is proving the native relationship between the client
loading-controller actor and the server save actor, then designing trustworthy
activation/invalidation and account/slot ownership before connecting to the
existing Bell reader. v0.37 observes native resolver RVA 17ef9c0 and remains
diagnostic. Audit its stated limitations before production integration.

Read the handoff, current NativeSaveLoadProbe.cpp, save-load-profile.h and the
v0.36 trace summary first. Inspect narrow source/disassembly windows as needed.
If I have completed the pending v0.37 normal-load/F7 step, inspect and preserve
that session before building anything new. Otherwise only that short step is
pending; no new death/retry/autosave sequence is required.

Never write to game saves; preserve user data; never infer completion from
proximity, file recency, missing records or errors. Keep actual ABI, argument,
lifetime and guard-byte requirements intact. Do not independently invoke native
loading/game functions. Do not add/run tests unless I request testing or
verification, per the original project conventions. Compilation and source/log
inspection are the established workflow.

Work efficiently, keep commentary concise, label hypotheses honestly, and avoid
long speculative detours. Continue concrete engineering work within this scope.
```

Read order after the main handoff:

1. `CURRENT-SAVE-DETECTION-NOTES.md` for chronological save-detection evidence.
2. `current/outputs/tools/native-map/NativeSaveLoadProbe.cpp` and exact profile.
3. v0.36 extracted trace and the pending v0.37 log, if available.
4. `previous/outputs/tools/native-map/NativeSaveReader.cpp` and marker consumer.
5. `HISTORICAL-NATIVE-OFFSETS.md`, `OFFSET-LITERALS.md` and focused `.asm` as needed.

The main handoff contains original absolute paths and portable bundle paths.
The game executable and private raw saves are not included. Every bundled file
other than the manifest itself is recorded in `MANIFEST-SHA256.csv`.

