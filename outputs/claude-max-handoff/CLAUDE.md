# Project working conventions

## Readability

- Write readable source, not compressed/minified application code.
- Format JavaScript, HTML, CSS, and JSON with Prettier using `.prettierrc.json`.
- Use two spaces in JavaScript, explicit statement blocks, descriptive names, and blank lines between logical steps.
- Use multiline template literals for substantial HTML markup instead of long concatenated strings.
- Comment public module responsibilities, coordinate conventions, state ownership, asynchronous cancellation, and non-obvious safety checks. Explain why an operation is needed; do not narrate obvious assignments.
- Keep generated datasets and third-party bundles separate from hand-maintained source. Retain third-party licenses.

## Files and cleanup

- Keep user-facing application files in `outputs/`; use `work/` for temporary build and research files.
- Remove superseded downloads, duplicate previews, obsolete tools, and temporary build files after their replacements are ready.
- If deletion is blocked by the environment, explain the restriction and consolidate obsolete files into one recoverable archive inside `work/superseded/`; do not bypass a deletion restriction.
- Update references and documentation when reorganizing files.
- Preserve active tracker control files until the running bridge has shut down normally. Never force-kill a bridge with an installed capture hook merely to clean files.
- Preserve browser backups, personal progress, calibration, and native application data. Do not treat user data as disposable build output.
- Keep the root output folder easy to navigate: the Windows executable, the HTML entry point, a short README, and organized subfolders.

## Implementation boundaries

- Never write to the game's save folder. Read stable copies for save tracking.
- Keep save-confirmed progress separate from manual marks and separate per selected save slot.
- Do not infer discovery from proximity. Only explicitly supported records may confirm completion.
- Do not add or run tests unless the user asks for testing or verification.

## Claude continuation context

- Read `CLAUDE-MAX-HANDOFF.md` and `START-HERE.md` in this transfer folder before continuing. They identify the authoritative source, completed observations, exact offsets, build commands and pending work.
- The selected product is one standalone Crimson Desert in-game mod installed through DMM. Do not introduce a required companion process, Python runtime, background bridge or desktop overlay.
- Work in `current/` for the current observation probe. Use `previous/` as the marker/Bell implementation and historical evidence reference; its marker source is v0.32, while v0.31 is the confirmed visibility baseline.
- v0.37 is built but its native client/server actor-link relationship is not runtime confirmed. At handoff the newest available live session was v0.36. Check for newer evidence before claiming a result.
- Manual slot101/100/101, Continue/title, and v0.36 death/retry/explicit-autosave observations are complete. Do not request repetitions simply because a probe assumption failed.
- The only pending requested observation is a normal load with v0.37, brief movement, then one F7/OK checkpoint. Do not treat elapsed time, installation or compilation as runtime confirmation.
- Preserve exact executable guards, Windows x64 argument/result forwarding, floating-point arguments, extra stack arguments and LastError. Do not independently invoke native loading/game functions.
- Copy bounded native values while references are live. Do not dereference captured game pointers from workers or dialogs, and never reread an object after native cleanup returns.
- Close the game before replacing or disabling a hooked ASI. Process-lifetime hooks must not be live-unloaded. Keep other Atlas proof ASIs disabled during observation runs.
- Keep the foreground/topmost F7 confirmation on its independent notification thread so logging continues while the dialog is open.
- Treat loading-controller phase24 as a completed loading sequence, not proof of being alive or controllable. It was also present on the death screen. Keep diagnostic actor-link flags separate from trusted loaded-save state.
- Establish actor association, activation/invalidation and account/slot ownership before connecting automatic detection to the existing Bell reader. Reject stale results across selection or generation changes.
- Use focused source/disassembly reads and filtered logs. Keep progress updates concise, distinguish static inference from captured and user-confirmed evidence, and avoid long speculative detours.
- Preserve the supplied source, traces and original conventions as evidence. Update the handoff notes when meaningful new evidence changes the stopping point.
