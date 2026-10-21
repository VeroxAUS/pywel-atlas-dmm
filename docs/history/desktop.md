# Windows desktop companion

## Application windows

Run `Pywel Atlas.exe` from the parent folder. The resizable main window starts above other windows. Its native toolbar controls always-on-top, a separate compact navigator, and hiding the overlay. Global **Ctrl + Shift + M** restores the windows even while the game has focus. A second launch restores the existing app rather than starting another tracker.

Windows can display the overlay over a borderless/windowed game. Exclusive fullscreen is not supported by this window-based overlay.

The compact navigator uses the same region, calibration, and selected save settings as the main map. It automatically follows when coordinates are available. Closing the compact window hides it; closing the main window exits the app and shuts down tracking.

## Tracking lifetime

The app starts the local Python bridge in the background. It can replace the earlier command-launcher bridge by requesting a normal shutdown before connecting the updated one. It never force-kills a bridge that may own a game capture hook.

On exit, the app waits for the bridge to restore the original capture instructions. If this cannot finish, it keeps the application open and explains how to close the game and retry. Reopening a crashed tracker may require restarting the game first.

Live facing uses the orientation vector captured from the same verified physics routine as position. The map projects that vector through the selected region's calibration. It is not inferred from movement or camera rotation. If facing cannot be read, a neutral position dot is used and the tracking panel explains that facing is unavailable.

## Local data and migration

The desktop app stores its WebView2 profile under `%LOCALAPPDATA%\PywelAtlas\WebView2`. Local storage inside that profile contains personal markers, manual progress, save confirmations, filters, and calibration. Runtime logs and encrypted save snapshots are in the same application data folder, in `player-tracker/` and `save-tracker/`.

The old browser page and the new desktop app have separate storage. Export a backup from the original browser map, then import it into the desktop app. The app shows a dismissible first-use reminder.

## Technical layout

The native host uses Windows Forms with Microsoft's installed WebView2 runtime. The local map files are served inside the view under `https://pywel-atlas.local`. Read-only requests use the separate in-process `https://pywel-bridge.local` origin and pass through the native host to the loopback bridge, avoiding a separate browser local-network permission prompt. External reference links open in the default browser; external sites cannot replace the app view.

Native web messages only control window actions. The bridge's shutdown token stays in the native host and is not exposed to map scripts. The bridge binds to loopback, and save requests are constrained to the known save directory.

This prototype currently uses the Codex Python 3.12 runtime already installed on this PC. Distributing it elsewhere will require packaging a Python runtime and the `cryptography` dependency, checking WebView2 availability, and producing an installer.

Build source is in `tools/desktop/PywelAtlas.cs`; `tools/desktop/build.ps1` compiles it using the installed .NET Framework compiler and bundled WebView2 SDK references. Microsoft's SDK license and version are in `vendor/webview2/`.
