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
