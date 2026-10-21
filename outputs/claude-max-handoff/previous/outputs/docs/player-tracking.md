# Player tracking prototype

Live position capture connected successfully to the loaded Windows Steam game on 21 October 2026. The player confirmed that the blue map dot matched the in-game location. Future game updates may require signature changes.

## Start

1. Load your character in Crimson Desert on Windows.
2. Open **Pywel Atlas.exe** from the parent folder. It starts the local tracker in the background.
3. If moving from the browser prototype, export a backup there and import it into the desktop app.
4. Open **Player offline / Player connected** on the map toolbar for connection details. Choose your character's actual region: Pywel or Abyss.
5. Once connected, choose **Follow player** to jump to your character. Dragging the map stops following. The bottom of the map displays game X/Y/Z; Y is altitude.

Close the main desktop window to stop the background bridge normally. It reconnects if the game is restarted while the bridge is running. Close the bridge before moving these files.

The desktop host uses the 64-bit Python runtime already installed with Codex on this computer. There are no third-party Python packages to install. Packaging for other computers is still pending; see desktop.md. Keep the entire outputs folder together.

## Accurate placement

Starter alignment points are based on the public [CD Companion coordinate research](https://github.com/andreikapica-dot/CD_Companion/blob/main/shared/coord_math.py). They are approximate until checked against your game/map version.

For your own alignment:

1. Stand at a clearly recognizable landmark.
2. Choose **Calibrate map → Capture landmark**. The current game position is captured immediately.
3. Click the matching landmark on the map.
4. Repeat at two more landmarks, widely separated and not on one straight line.

The previous alignment stays active until three valid points have been collected. The app stores a separate transformation for each region. **Use starter alignment** removes the custom calibration for the selected region. **Export backup** includes these settings; **Import / restore** restores them.

Select the character's region explicitly in Player tracking. Merely browsing a different map does not move the character into it. The dot is hidden when viewing the other region. Automatic realm detection is not implemented yet.

## Current compatibility boundary

The bridge first looks for directly readable position globals. The desktop host also enables the physics-capture fallback required by the installed game build. This fallback adds a small in-memory capture routine at a uniquely matched physics instruction sequence; it records the position vector pointer and replays the original instructions. It briefly pauses game threads during installation/restoration and checks that no instruction pointer overlaps the patch. It does not change game coordinates, teleport, or edit saves.

Both methods require an unambiguous world-origin signature before reporting absolute coordinates. Unknown or ambiguous builds show a compatibility message rather than an invented position. A successful connection still needs an in-game landmark check to establish that the source tracks the character and that the projection is correct.

The desktop app requests restoration of the original capture instructions during normal shutdown. A small capture allocation is retained until game exit so any in-flight instruction can complete. If the bridge is forcibly terminated, restart the game before restarting tracking. Avoid moving or deleting the bridge while it is running.

For direct reads only, run `python tools/player_bridge.py` without `--capture-position` as a development-only alternative. That mode has no write or allocation access and reports unsupported builds requiring capture.

Bell save tracking is available separately under Save progress. Live position tracking never changes Found status.

## Local connection and diagnostics

The bridge binds only to `127.0.0.1:18765`. The map reads `/position` at approximately 5 updates per second while connected; the bridge samples at 10 Hz. Missing, invalid, or stale coordinates hide the player marker. There is no server upload.

Connection diagnostics and launcher logs are written to `%LOCALAPPDATA%\PywelAtlas\player-tracker\`. `status.json` contains the most recent bridge state, including coordinates when connected. Those diagnostic files are not save files or discovery progress.

The default game process name is `CrimsonDesert.exe`. If access is denied, the map explains that the bridge and game must run at the same permission level. If the game name or instruction layout changes, the reader needs an update.

Technical references: [CD Companion's position signatures](https://github.com/andreikapica-dot/CD_Companion/blob/main/server/memory/aob_scanner.py), [its position reader and world-origin handling](https://github.com/andreikapica-dot/CD_Companion/blob/main/server/memory/reader.py), and [Microsoft ReadProcessMemory documentation](https://learn.microsoft.com/en-us/windows/win32/api/memoryapi/nf-memoryapi-readprocessmemory). The bridge is a new implementation using Python's standard library and Win32 calls; it does not import the community tracker's teleport or hooking code.
