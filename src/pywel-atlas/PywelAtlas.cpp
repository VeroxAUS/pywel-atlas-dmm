// =============================================================================
// Pywel Atlas - combined mod entry point (PywelAtlas.cpp)
// =============================================================================
//
// WHAT THIS FILE IS
//   The start of the single Pywel Atlas mod file (PywelAtlas.asi) that DMM
//   loads into Crimson Desert. It joins two parts that used to be separate
//   mods, without changing what either part does:
//     - Save detection (src/save-detection/NativeSaveLoadProbe.cpp): works out
//       which save is loaded and where the game saves it, and reads its Bells.
//     - Map marker (src/marker-bell/NativeMapCategoryProbe.cpp): shows and
//       removes the test map marker ("proof chest").
//   Both files are compiled with PYWEL_ATLAS_COMBINED defined, which removes
//   their own DllMain and gives each a start function instead.
//
// KEY IDEAS
//   MinHook - the small library both parts use to install their hooks. It
//             must be initialized exactly once per process, so this file does
//             it before starting either part. Each part then creates and
//             switches on only its own hooks.
//   Worker  - each part keeps its own background thread, exactly as before.
//
// KEYS IN THE COMBINED BUILD
//   F7        save-detection checkpoint popup (unchanged).
//   Shift+F7  map marker's "read the selected save" (was plain F7 there).
//   F6, F8, F9, F10 keep their map-marker meanings.
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include "../save-detection/vendor/minhook/include/MinHook.h"

// Start functions of the two parts (defined in their own files).
DWORD WINAPI PywelSaveDetectionRun(void* address);
DWORD WINAPI PywelMapMarkerRun(void* address);

namespace {

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
    if (MH_Initialize() != MH_OK) {
        return 0;
    }
    StartPart(PywelSaveDetectionRun, address);
    StartPart(PywelMapMarkerRun, address);
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
