# Project working conventions

## Readability

- Write readable source, not compressed/minified application code.
- Format JavaScript, HTML, CSS, and JSON with Prettier using `.prettierrc.json`.
- Use two spaces in JavaScript, explicit statement blocks, descriptive names, and blank lines between logical steps.
- Use multiline template literals for substantial HTML markup instead of long concatenated strings.
- Comment public module responsibilities, coordinate conventions, state ownership, asynchronous cancellation, and non-obvious safety checks. Explain why an operation is needed; do not narrate obvious assignments.
- Write comments for a reader with surface-level coding knowledge: plain language, short sentences, what each part does and why. Define a term like "hook", "vtable" or "epoch" the first time a file uses it. The reader should follow what is going on without knowing exactly how it works.
- Every source file starts with a plain-language summary of its job. Every function gets a one- or two-line comment. Break long lines and dense one-line blocks for readability.
- Keep explanations to the user brief and simple (KISS). Avoid jargon or explain it in a few words.
- Keep generated datasets and third-party bundles separate from hand-maintained source. Retain third-party licenses.

## Files and cleanup

- Layout: hand-maintained source in `src/`, research scripts/disassembly/analysis/traces in `research/`, docs in `docs/`, inputs in `data/`, third-party licenses in `third_party/`. Build intermediates go to `build/` and distributables to `dist/` (both ignored). Released ZIPs and the user's unpacked install copies live in `archive/releases/` (ignored by git).
- Remove superseded downloads, duplicate previews, obsolete tools, and temporary build files after their replacements are ready.
- If deletion is blocked by the environment, explain the restriction and consolidate obsolete files into one recoverable archive inside `archive/`; do not bypass a deletion restriction.
- Git: the user commits manually. Never commit or push unless asked for that specific commit.
- Update references and documentation when reorganizing files.
- Preserve active tracker control files until the running bridge has shut down normally. Never force-kill a bridge with an installed capture hook merely to clean files.
- Preserve browser backups, personal progress, calibration, and native application data. Do not treat user data as disposable build output.
- Keep the repository root easy to navigate: a short README, conventions, and organized subfolders.

## Implementation boundaries

- Never write to the game's save folder. Read stable copies for save tracking.
- Keep save-confirmed progress separate from manual marks and separate per selected save slot.
- Do not infer discovery from proximity. Only explicitly supported records may confirm completion.
- Do not add or run tests unless the user asks for testing or verification.

## Claude continuation context

- `docs/handoff/` is a frozen onboarding transfer: read it for background and exact offsets, but never update it. Its paths predate the reorganization; `README.md` maps old paths to new ones. Keep current status and evidence in `docs/native-save-detection.md` and this file.
- The selected product is one standalone Crimson Desert in-game mod installed through DMM. Do not introduce a required companion process, Python runtime, background bridge or desktop overlay.
- Work in `src/save-detection/` for the current observation probe. Use `src/marker-bell/` as the marker/Bell implementation reference; its marker source is v0.32, while v0.31 (`archive/releases/`) is the confirmed visibility baseline.
- v0.37 normal-load/F7 completed (trace `research/traces/save-detection-v0.37-normal-load-f7.log`). Resolver `17ef9c0` is side-local (client→client child, server→server child), so it cannot link sides. Its unfiltered records also caused 449 queue drops. v0.38 normal-load/F7 completed (trace `research/traces/save-detection-v0.38-normal-load-f7.log`): both per-side manager lookups (`8ae390`/`2a82590`) used the identical key `0x90100000`. Both user actors store it at `+60`, the client user selects the controller child and the server user selects the loaded server child, and the boundary matched with zero drops. The key is a constant local-user identity, not a save identity. v0.39 uses full-key plus `+60` equality and adds a worker-owned diagnostic account/slot selection (formation, retirement and serials in `docs/native-save-detection.md`). Its normal-load/F7 run completed (trace `research/traces/save-detection-v0.39-normal-load-f7.log`): the selection formed once (serial 1, slot 2, account 60062761) at the second phase-24 boundary, with zero drops. Retirement/re-formation across later loads is runtime-untested. Nothing consumes it yet.
- Manual slot101/100/101, Continue/title, v0.36 death/retry/explicit-autosave, and v0.37 normal-load observations are complete. Do not request repetitions simply because a probe assumption failed.
- Do not treat elapsed time, installation or compilation as runtime confirmation.
- Preserve exact executable guards, Windows x64 argument/result forwarding, floating-point arguments, extra stack arguments and LastError. Do not independently invoke native loading/game functions.
- Copy bounded native values while references are live. Do not dereference captured game pointers from workers or dialogs, and never reread an object after native cleanup returns.
- Close the game before replacing or disabling a hooked ASI. Process-lifetime hooks must not be live-unloaded. Keep other Atlas proof ASIs disabled during observation runs.
- Keep the foreground/topmost F7 confirmation on its independent notification thread so logging continues while the dialog is open.
- Treat loading-controller phase24 as a completed loading sequence, not proof of being alive or controllable. It was also present on the death screen. Keep diagnostic actor-link flags separate from trusted loaded-save state.
- Establish actor association, activation/invalidation and account/slot ownership before connecting automatic detection to the existing Bell reader. Reject stale results across selection or generation changes.
- Use focused source/disassembly reads and filtered logs. Keep progress updates concise, distinguish static inference from captured and user-confirmed evidence, and avoid long speculative detours.
- Preserve the supplied source, traces and original conventions as evidence. When meaningful new evidence changes the stopping point, update `docs/native-save-detection.md` and this file (not `docs/handoff/`).
