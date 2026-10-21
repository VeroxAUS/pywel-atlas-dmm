# Source layout and maintenance

## JavaScript formatting

Use Prettier with the project-root `.prettierrc.json`: two spaces, an 80-column print-width target, semicolons, single quotes, trailing commas, and line feeds. Use explicit braces for statement blocks, one variable declaration per statement, descriptive names, and multiline HTML templates.

Comments explain module responsibilities, coordinate conventions, progress ownership, save matching, asynchronous cancellation, and stale-data handling. Avoid minifying hand-maintained source. Generated POI data uses indented JSON for inspection; third-party distributions retain upstream formatting.

The formatting choices follow [Prettier's documented options](https://prettier.io/docs/options). The project was formatted with Prettier 3.9.10. A formatter can be installed as a development tool; it is not needed to run the app.

## Modules

- `app/atlas-app.js`: map/catalog UI, markers, filtering, details, and manual progress per profile.
- `app/poi-model.js`: pure search, filtering, facet counts, and legacy progress migration.
- `app/region-map.js`: active region tiles, boundary clipping, and remembered views.
- `app/player-tracker.js`: live feed, facing arrow, follow mode, and calibration.
- `app/save-tracker.js`: explicit slot selection, cached Bell snapshots, and refresh cancellation.
- `app/desktop-shell.js`: native window controls, shared window settings, and compact view behavior.
- `tools/player_bridge.py`: game process reading/capture and loopback transport.
- `tools/save_reader.py`: stable save copies, decryption, exact Bell ID matching, and caching.
- `tools/desktop/PywelAtlas.cs`: native window lifecycle, tray/hotkeys, WebView2, and bridge management.

## Cleanup

Superseded offline map tiles, extracted previews, duplicate source checkouts, source API captures, temporary package downloads, and obsolete launchers are consolidated under work/superseded/. Automatic approval review blocked deletion in this session, so the cleanup is recoverable rather than destructive. Keep application data and active bridge control files out of disposable build cleanup. See the project-root `AGENTS.md` for the standing maintenance instructions.

No automated tests were added or run for this change. The native executable was compiled. Save research read real local saves and matched the explicit completed Hernand Bell record. The player confirmed that the desktop app marks the bell Found after selecting the correct slot. The live bridge also supplies position and a normalized facing vector; stationary turning has not yet been separately confirmed by the player.
