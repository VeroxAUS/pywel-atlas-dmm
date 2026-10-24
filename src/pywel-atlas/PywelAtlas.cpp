// =============================================================================
// Pywel Atlas - combined mod entry point (PywelAtlas.cpp)
// =============================================================================
//
// WHAT THIS FILE IS
//   The start of the single Pywel Atlas mod file (PywelAtlas.asi) that DMM
//   loads into Crimson Desert. It joins two parts that used to be separate
//   mods, without changing what either part does:
//     - Save detection (src/save-detection/NativeSaveLoadProbe.cpp): works out
//       which save is loaded and where the game saves it, and reads its Bells
//       and (v0.56) Greymane Shrines.
//     - Map marker (src/marker-bell/NativeMapCategoryProbe.cpp): shows and
//       removes the Bell and (v0.56) Greymane Shrine map markers.
//     - Teleport observation (TeleportObserve.cpp, v0.55): watch-only logging
//       of the game's own player-move functions, for the planned test-only
//       teleporter. It moves nothing. Development builds only (v0.129).
//     - Filter panel (FilterPanel.cpp, v0.62): the in-game Dear ImGui panel
//       (F9), drawn in the game's own frames; v0.62 is not connected to
//       the markers yet. Hooks only Windows' dxgi.dll.
//     - Route (RouteSystem.cpp, RoutePlanner.cpp, RouteOverlay.cpp, v0.104):
//       plans a tour of the nearest collectibles still to do and draws it as
//       a line on the world map and the minimap. Its own worker thread; the
//       line is drawn by the filter panel's frame code. Reads only.
//     - Test teleporter (TestTeleporter.cpp): ONLY in the separate test build
//       PywelAtlasTest.asi (build.ps1 -Test defines PYWEL_ATLAS_TELEPORT).
//   Both files are compiled with PYWEL_ATLAS_COMBINED defined, which removes
//   their own DllMain and gives each a start function instead.
//
// RELEASE AND DEVELOPMENT BUILDS (v0.129)
//   build.ps1 and build.ps1 -Test define PYWEL_ATLAS_DEV: the development
//   builds, with the debug keys (F7, F8), the detailed per-part logs and the
//   teleport observation. build.ps1 -Release leaves it out: no debug keys,
//   no debug tools, and only the short pywel-atlas.log (ReleaseLog.cpp).
//
// KEY IDEAS
//   MinHook - the small library both parts use to install their hooks. It
//             must be initialized exactly once per process, so this file does
//             it before starting either part. Each part then creates and
//             switches on only its own hooks.
//   Worker  - each part keeps its own background thread, exactly as before.
//
// KEYS IN THE COMBINED BUILD
//   F7        save-detection checkpoint popup (development builds only).
//   F8        diagnostic snapshot (development builds only).
//   The player keys (panel, widget, markers on/off, skip stop) are
//   rebindable; see Keybinds.cpp.
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <stdlib.h>
#include "../save-detection/vendor/minhook/include/MinHook.h"
#include "ReleaseLog.h"

// Start functions of the parts (defined in their own files).
DWORD WINAPI PywelSaveDetectionRun(void* address);
DWORD WINAPI PywelMapMarkerRun(void* address);
#ifdef PYWEL_ATLAS_DEV
// v0.55: watch-only teleport observation (TeleportObserve.cpp); moves nothing.
// Development builds only; build.ps1 -Release does not compile that file.
DWORD WINAPI PywelTeleportObserveRun(void* address);
#endif
// v0.62: the in-game filter panel (FilterPanel.cpp).
DWORD WINAPI PywelFilterPanelRun(void* address);
// v0.104: the route worker (RouteSystem.cpp): plans the collectible route.
DWORD WINAPI PywelRouteRun(void* address);
#ifdef PYWEL_ATLAS_TELEPORT
// Test build only (PywelAtlasTest.asi): the test teleporter's worker.
DWORD WINAPI PywelTeleporterRun(void* address);
#endif

namespace {

// v0.127: what the C runtime does when a "safe" string function (sprintf_s
// and the like) gets a buffer that is too small: by default it ends the
// whole game at once (v0.124-v0.126 crashed at launch that way, from one
// over-long log line). With this handler the call returns -1 with an empty
// string instead, so a too-long log line is lost, never the game. The mod
// links its own copy of the C runtime (/MT), so this affects only the mod.
void IgnoreInvalidParameter(const wchar_t*, const wchar_t*, const wchar_t*, unsigned int, uintptr_t) {}

// Starts one part's worker thread; the handle is not needed afterwards.
void StartPart(LPTHREAD_START_ROUTINE run, void* address) {
    HANDLE worker = CreateThread(nullptr, 0, run, address, 0, nullptr);
    if (worker) {
        CloseHandle(worker);
    }
}

// Startup thread: initializes MinHook once, then starts both parts. Done off
// DllMain because Windows restricts what is safe while a DLL is loading. If
// MinHook cannot start, neither part is started (no hooks are installed).
DWORD WINAPI Start(void* address) {
    _set_invalid_parameter_handler(IgnoreInvalidParameter);
#ifdef PYWEL_ATLAS_DEV
    PywelReleaseLog("Pywel Atlas 0.28.0 (development build) starting");
#else
    PywelReleaseLog("Pywel Atlas 0.28.0 starting");
#endif
    if (MH_Initialize() != MH_OK) {
        PywelReleaseLog("Could not start the hook library (MinHook); Pywel Atlas is off this session.");
        return 0;
    }
    StartPart(PywelSaveDetectionRun, address);
    StartPart(PywelMapMarkerRun, address);
#ifdef PYWEL_ATLAS_DEV
    StartPart(PywelTeleportObserveRun, address);
#endif
    StartPart(PywelFilterPanelRun, address);
    StartPart(PywelRouteRun, address);
#ifdef PYWEL_ATLAS_TELEPORT
    StartPart(PywelTeleporterRun, address);
#endif
    return 0;
}

} // namespace

// Windows calls this when the game loads PywelAtlas.asi. It only starts the
// startup thread; all real work happens in the two parts' workers.
BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(instance);
        StartPart(Start, instance);
    }
    return TRUE;
}
