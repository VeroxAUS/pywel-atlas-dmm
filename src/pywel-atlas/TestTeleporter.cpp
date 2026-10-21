// =============================================================================
// Pywel Atlas - test-only teleporter (TestTeleporter.cpp, phase 2)
// =============================================================================
//
// WHAT THIS FILE IS
//   A teleporter for speeding up collectible checks. It is compiled ONLY into
//   the separate test build PywelAtlasTest.asi (build.ps1 -Test, which defines
//   PYWEL_ATLAS_TELEPORT). The normal PywelAtlas.asi release never contains
//   it. This is the user's explicit exception (2026-10-22) to the rule that
//   the mod never calls game functions itself; see CLAUDE.md.
//
// HOW IT MOVES THE PLAYER (copied from the game, see research/analysis/teleport.md
// and the v0.55 run in docs/native-save-detection.md)
//   The game's own fast travel and revive move the player on the minimap
//   thread with this exact sequence, which it uses at 15 places:
//     1. lock the player's actor      0x393650(&lock, [actor+8], 1)
//     2. "set actor world position"   0x507140(actor, &xyz, 4 = Teleport, 0)
//     3. unlock (inlined by the game; copied below step by step)
//   The game then applies the same position once more after loading. This
//   teleporter does the same about 3 seconds later. There is no loading
//   screen, so a long jump may arrive before the ground has loaded.
//
// KEY IDEAS
//   Game thread  - the move is made inside the minimap update hook (map
//                  marker part), right after the game's own minimap update
//                  returns, on the thread the game uses for its teleports.
//   Player handle- 0x64f530 fills a small handle: actor at +8, valid byte at
//                  +0x10. It is released with 0x1434880 after setting the
//                  handle's type pointer, exactly as the minimap code does.
//   Guards       - every game function used here must start with the bytes
//                  of the supported game build, or the teleporter stays off.
//   Abyss layer  - heights above the game's altitude threshold are the Abyss
//                  layer. A jump that would cross it is refused.
//
// KEYS (only while the game window is in front; arrow keys or the older keys)
//   Ctrl+Right / Ctrl+Left (Ctrl+PageDown / Ctrl+PageUp)  next / previous target
//   Ctrl+Up (Ctrl+Home)          show the current target again (popup)
//   Ctrl+Down (Ctrl+End)         teleport to the current target
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include "teleport-targets.h"

// Latest minimap player position, provided by the map-marker part.
bool PywelGetMinimapPlayer(float (&xyz)[3], DWORD& thread, ULONGLONG& tick);

namespace {

constexpr DWORD kExpectedTimestamp = 1790086912u;
constexpr DWORD kExpectedImageSize = 389722112u;
constexpr unsigned kTargetCount = _countof(kTeleportTargets);
constexpr float kLandingLift = 1.5f; // metres above the target, to land on top
constexpr ULONGLONG kReapplyDelay = 3000; // ms, like the game's second apply
constexpr ULONGLONG kCheckDelay = 2000; // ms after the second apply
constexpr ULONGLONG kRequestTimeout = 5000; // ms without a minimap update

// Game addresses (RVAs in the supported build) and what they are.
constexpr uintptr_t kPlayerLookupRva = 0x64f530;   // fills a player handle
constexpr uintptr_t kHandleReleaseRva = 0x1434880; // releases that handle
constexpr uintptr_t kHandleTypeRva = 0x5725e48;    // handle type pointer set before release
constexpr uintptr_t kActorLockRva = 0x393650;      // lock(&lock, object, mode)
constexpr uintptr_t kSetWorldPositionRva = 0x507140; // jump to 0x8c8f660
constexpr uintptr_t kSetWorldPositionBodyRva = 0x8c8f660;
constexpr uintptr_t kComponentTableRva = 0x55bf248; // player movement component vtable
constexpr uintptr_t kAltitudeThresholdRva = 0x6cde048; // Abyss layer height (float)

// Function shapes (Windows x64).
using LookupPlayer = void* (*)(void* unused, void* handle);
using ReleaseHandle = void (*)(void* handle);
using LockActor = void* (*)(void* lock, void* object, BYTE mode);
using SetWorldPosition = uintptr_t (*)(void* actor, const float* xyz, BYTE moveType, BYTE flag);
using VirtualWithArgument = void (*)(void* object, uint64_t argument);
using VirtualNoArgument = void (*)(void* object);

// First 24 bytes of each game function used (checked with pefile, 2026-10-22).
struct Guard {
    const char* name;
    uintptr_t rva;
    BYTE bytes[24];
};
const Guard kGuards[] = {
    {"player lookup", kPlayerLookupRva, {0x48, 0x89, 0x54, 0x24, 0x10, 0x53, 0x48, 0x83, 0xec, 0x30, 0x48, 0x8b,
        0xda, 0xc7, 0x44, 0x24, 0x20, 0x00, 0x00, 0x00, 0x00, 0x48, 0x8b, 0x0d}},
    {"handle release", kHandleReleaseRva, {0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x74, 0x24, 0x18, 0x57, 0x48,
        0x83, 0xec, 0x20, 0x48, 0x8b, 0xf1, 0x80, 0x79, 0x10, 0x00, 0x74, 0x74}},
    {"actor lock", kActorLockRva, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x57, 0x48, 0x83, 0xec, 0x20, 0x48, 0x89,
        0x11, 0x48, 0x8b, 0xda, 0x44, 0x88, 0x41, 0x08, 0x48, 0x8b, 0xf9, 0x41}},
    {"set world position jump", kSetWorldPositionRva, {0xe9, 0x1b, 0x85, 0x78, 0x08, 0xe9, 0xe4, 0x22, 0x47, 0x00,
        0x40, 0x0f, 0x85, 0x8b, 0x0e, 0x5b, 0xff, 0x88, 0x52, 0xb9, 0xe9, 0x3f, 0xaa, 0x46}},
    {"set world position", kSetWorldPositionBodyRva, {0x48, 0x83, 0xec, 0x58, 0xc5, 0xfb, 0x10, 0x12, 0xc5, 0xfa,
        0x10, 0x2d, 0x84, 0x40, 0x0e, 0xfd, 0xc5, 0xfa, 0x10, 0x62, 0x08, 0x48, 0x8b, 0x49}},
    {"queued move request", 0x9fca60, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x6c, 0x24, 0x10, 0x48, 0x89,
        0x74, 0x24, 0x18, 0x57, 0x48, 0x83, 0xec, 0x30, 0x0f, 0xbf, 0x42, 0x0e}},
};

uintptr_t imageBase = 0;
HANDLE logFile = INVALID_HANDLE_VALUE;
volatile LONG teleporterReady = 0; // 1 once the build and every guard matched

// Safely copy `size` bytes; false instead of a crash if not readable.
bool Read(const void* address, void* destination, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(), address,
        destination, size, &read) && read == size;
}

// ---------------------------------------------------------------------------
// Section: request and outcome hand-over between the worker and game thread
// ---------------------------------------------------------------------------

// requestState: 0 idle, 1 requested by the worker, 2 being carried out on the
// game thread. Only the worker moves 0 -> 1 (or times out 1 -> 0); only the
// game thread moves 1 -> 2 and 2 -> 0. The target is written before 1 is set.
volatile LONG requestState = 0;
float requestedTarget[3] = {};
unsigned requestedIndex = 0;
alignas(8) volatile LONG64 requestedAt = 0;

// What happened, for the worker to log. Written only on the game thread.
enum OutcomeKind : BYTE {
    kApplied = 1,       // a move was handed to the game
    kRefusedLayer,      // would cross the Abyss altitude threshold
    kNoPlayer,          // no valid player handle
    kBadComponent,      // the player's movement component did not match
    kChecked,           // position checked after the second apply
};
struct Outcome {
    BYTE kind;
    BYTE attempt;       // 1 = first apply, 2 = second apply
    unsigned index;     // target index
    ULONGLONG tick;
    DWORD thread;
    bool playerKnown;
    float player[3];    // minimap player position at that moment
    uintptr_t result;   // return value of the set-position call
};
SRWLOCK outcomeLock = SRWLOCK_INIT;
Outcome outcomes[16] = {};
unsigned outcomeCount = 0;

// Queue an outcome for the worker; never waits on the game thread.
void Report(BYTE kind, BYTE attempt, uintptr_t result) {
    Outcome outcome = {};
    outcome.kind = kind;
    outcome.attempt = attempt;
    outcome.index = requestedIndex;
    outcome.tick = GetTickCount64();
    outcome.thread = GetCurrentThreadId();
    DWORD minimapThread = 0;
    ULONGLONG minimapTick = 0;
    outcome.playerKnown = PywelGetMinimapPlayer(outcome.player, minimapThread, minimapTick);
    outcome.result = result;
    if (TryAcquireSRWLockExclusive(&outcomeLock)) {
        if (outcomeCount < _countof(outcomes)) {
            outcomes[outcomeCount++] = outcome;
        }
        ReleaseSRWLockExclusive(&outcomeLock);
    }
}

// ---------------------------------------------------------------------------
// Section: the move itself (game thread only)
// ---------------------------------------------------------------------------

// The game's inlined unlock, copied step by step (seen after every
// 0x507140 call, e.g. at 0x7fdfa3): release the lock through the object's
// own function, then drop the reference the lock took.
void UnlockActor(void* object, BYTE mode) {
    auto* bytes = static_cast<BYTE*>(object);
    auto** table = *reinterpret_cast<void***>(object);
    reinterpret_cast<VirtualWithArgument>(table[0x20 / 8])(object, 0);
    if (mode != 1) {
        return;
    }
    auto* references = reinterpret_cast<volatile LONG*>(bytes + 8);
    auto* flags = reinterpret_cast<volatile LONG*>(bytes + 0xc);
    LONG before = InterlockedExchangeAdd(references, -1);
    if (before == 1 && (*flags & 0x40000000)) {
        table = *reinterpret_cast<void***>(object);
        reinterpret_cast<VirtualNoArgument>(table[0x40 / 8])(object);
    }
    if (*flags & 0x40000000) {
        InterlockedDecrement(flags);
    }
}

// Move the player to `target` (plus the landing lift) with the game's own
// sequence. Returns the outcome kind.
BYTE ApplyMove(const float (&target)[3], BYTE attempt) {
    auto* base = reinterpret_cast<BYTE*>(imageBase);
    // Refuse a jump across the Abyss altitude threshold (first apply only;
    // the second apply repeats the same, already accepted target).
    float player[3] = {};
    DWORD minimapThread = 0;
    ULONGLONG minimapTick = 0;
    float threshold = 0;
    if (attempt == 1 && (!PywelGetMinimapPlayer(player, minimapThread, minimapTick) ||
        !Read(base + kAltitudeThresholdRva, &threshold, sizeof(threshold)) || !std::isfinite(threshold) ||
        (player[1] >= threshold) != (target[1] >= threshold))) {
        return kRefusedLayer;
    }

    // Get the player, like the minimap update does.
    alignas(16) BYTE handle[0x40] = {};
    reinterpret_cast<LookupPlayer>(base + kPlayerLookupRva)(nullptr, handle);
    void* actor = nullptr;
    memcpy(&actor, handle + 8, sizeof(actor));
    BYTE kind = kNoPlayer;
    uintptr_t result = 0;
    if (handle[0x10] && actor) {
        // The movement component must be the one the game's own path uses.
        uintptr_t inner = 0;
        uintptr_t component = 0;
        uintptr_t table = 0;
        void* lockObject = nullptr;
        kind = kBadComponent;
        if (Read(static_cast<BYTE*>(actor) + 0x68, &inner, sizeof(inner)) && inner &&
            Read(reinterpret_cast<void*>(inner + 0x1a0), &component, sizeof(component)) && component &&
            Read(reinterpret_cast<void*>(component), &table, sizeof(table)) &&
            table == imageBase + kComponentTableRva &&
            Read(static_cast<BYTE*>(actor) + 8, &lockObject, sizeof(lockObject)) && lockObject) {
            // Steps 1-3 exactly as the game does them.
            alignas(8) BYTE lock[16] = {};
            reinterpret_cast<LockActor>(base + kActorLockRva)(lock, lockObject, 1);
            float position[3] = {target[0], target[1] + kLandingLift, target[2]};
            result = reinterpret_cast<SetWorldPosition>(base + kSetWorldPositionRva)(actor, position, 4, 0);
            void* locked = nullptr;
            memcpy(&locked, lock, sizeof(locked));
            UnlockActor(locked, lock[8]);
            kind = kApplied;
        }
    }
    // Release the handle exactly as the minimap code does (type pointer first).
    uintptr_t handleType = imageBase + kHandleTypeRva;
    memcpy(handle, &handleType, sizeof(handleType));
    reinterpret_cast<ReleaseHandle>(base + kHandleReleaseRva)(handle);
    Report(kind, attempt, result);
    return kind;
}

// Game-thread progress of the current request: 0 waiting for a request,
// 1 first apply done (second pending), 2 second apply done (check pending).
int stage = 0;
ULONGLONG nextStepAt = 0;
float activeTarget[3] = {};

} // namespace

// Called by the map-marker part's minimap hook, on the game's minimap thread,
// right after the game's own minimap update returned.
void PywelTeleporterService() {
    if (InterlockedCompareExchange(&teleporterReady, 0, 0) == 0) {
        return;
    }
    ULONGLONG now = GetTickCount64();
    if (stage == 0) {
        if (InterlockedCompareExchange(&requestState, 2, 1) != 1) {
            return;
        }
        memcpy(activeTarget, requestedTarget, sizeof(activeTarget));
        if (ApplyMove(activeTarget, 1) == kApplied) {
            stage = 1;
            nextStepAt = now + kReapplyDelay;
        } else {
            InterlockedExchange(&requestState, 0);
        }
    } else if (stage == 1 && now >= nextStepAt) {
        ApplyMove(activeTarget, 2);
        stage = 2;
        nextStepAt = now + kCheckDelay;
    } else if (stage == 2 && now >= nextStepAt) {
        Report(kChecked, 2, 0);
        stage = 0;
        InterlockedExchange(&requestState, 0);
    }
}

namespace {

// ---------------------------------------------------------------------------
// Section: worker - checks, hotkeys, popup and log
// ---------------------------------------------------------------------------

// Append one line to teleporter.log (worker thread only).
void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

// Popup naming the current target, on its own thread so the game keeps
// running. Only one popup at a time.
volatile LONG popupOpen = 0;
wchar_t popupText[512] = {};

// Thread body: shows the popup, then allows the next one.
DWORD WINAPI ShowPopup(void*) {
    MessageBoxW(nullptr, popupText, L"Pywel Atlas TEST teleporter",
        MB_OK | MB_ICONINFORMATION | MB_TOPMOST | MB_SETFOREGROUND);
    InterlockedExchange(&popupOpen, 0);
    return 0;
}

// Opens the target popup unless one is already open.
void ShowTarget(unsigned index) {
    if (InterlockedCompareExchange(&popupOpen, 1, 0) != 0) {
        return;
    }
    const TeleportTarget& target = kTeleportTargets[index];
    swprintf_s(popupText, L"Target %u of %u:\n%hs\n(%.1f, %.1f, %.1f)\n\n"
        L"Ctrl+Down teleports there (test saves only).\n"
        L"Ctrl+Right / Ctrl+Left choose another target.",
        index + 1, kTargetCount, target.name, target.position[0], target.position[1], target.position[2]);
    HANDLE thread = CreateThread(nullptr, 0, ShowPopup, nullptr, 0, nullptr);
    if (thread) {
        CloseHandle(thread);
    } else {
        InterlockedExchange(&popupOpen, 0);
    }
}

// Logs everything the game thread reported since the last call.
void LogOutcomes() {
    Outcome copy[_countof(outcomes)] = {};
    unsigned count = 0;
    AcquireSRWLockExclusive(&outcomeLock);
    count = outcomeCount;
    memcpy(copy, outcomes, count * sizeof(Outcome));
    outcomeCount = 0;
    ReleaseSRWLockExclusive(&outcomeLock);
    static constexpr const char* kNames[] = {"?", "applied", "refused: would cross the Abyss layer (or position unknown)",
        "no valid player", "player movement component did not match", "checked"};
    for (unsigned index = 0; index < count; ++index) {
        const Outcome& outcome = copy[index];
        const TeleportTarget& target = kTeleportTargets[outcome.index];
        char line[512];
        int length = sprintf_s(line, "t=%llu attempt %u to \"%s\": %s thread=%lu", outcome.tick,
            outcome.attempt, target.name, kNames[outcome.kind < _countof(kNames) ? outcome.kind : 0], outcome.thread);
        if (outcome.kind == kApplied) {
            length += sprintf_s(line + length, sizeof(line) - length, " result=0x%llx",
                static_cast<unsigned long long>(outcome.result));
        }
        if (outcome.playerKnown && length > 0) {
            float dx = outcome.player[0] - target.position[0];
            float dz = outcome.player[2] - target.position[2];
            sprintf_s(line + length, sizeof(line) - length, " player=(%.2f, %.2f, %.2f) distanceToTarget=%.1f m%s",
                outcome.player[0], outcome.player[1], outcome.player[2], std::sqrt(dx * dx + dz * dz),
                outcome.kind == kChecked ? (std::sqrt(dx * dx + dz * dz) < 10.0f ? " -> ARRIVED" : " -> NOT THERE") : "");
        }
        Log(line);
    }
}

// Worker: opens the log, checks the build and guards, then handles keys.
DWORD WINAPI Run(void* address) {
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\teleporter.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    Log("Pywel Atlas TEST build teleporter (phase 2) - test saves only. Ctrl+Right/Left choose, Ctrl+Up shows, Ctrl+Down teleports (or PageDown/PageUp/Home/End).");

    auto* base = reinterpret_cast<BYTE*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    const auto* dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    const auto* pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported executable; teleporter stays off.");
        return 0;
    }
    for (const auto& guard : kGuards) {
        if (memcmp(base + guard.rva, guard.bytes, sizeof(guard.bytes)) != 0) {
            char line[160];
            sprintf_s(line, "Guard mismatch at %s (0x%llx); teleporter stays off.", guard.name,
                static_cast<unsigned long long>(guard.rva));
            Log(line);
            return 0;
        }
    }
    InterlockedExchange(&teleporterReady, 1);
    char line[160];
    sprintf_s(line, "All guards matched; %u targets loaded.", kTargetCount);
    Log(line);

    unsigned current = 0;
    bool previousNext = false;
    bool previousPrevious = false;
    bool previousShow = false;
    bool previousGo = false;
    ULONGLONG popupAt = 0; // show the popup once cycling pauses
    for (;;) {
        DWORD foreground = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foreground);
        bool inGame = foreground == GetCurrentProcessId();
        bool control = (GetAsyncKeyState(VK_CONTROL) & 0x8000) != 0;
        // Each action has an arrow key, which every keyboard has, plus the
        // older PageDown/PageUp/Home/End key for full-size keyboards.
        auto down = [](int key) { return (GetAsyncKeyState(key) & 0x8000) != 0; };
        bool next = inGame && control && (down(VK_RIGHT) || down(VK_NEXT));
        bool previous = inGame && control && (down(VK_LEFT) || down(VK_PRIOR));
        bool show = inGame && control && (down(VK_UP) || down(VK_HOME));
        bool go = inGame && control && (down(VK_DOWN) || down(VK_END));
        ULONGLONG now = GetTickCount64();

        if ((next && !previousNext) || (previous && !previousPrevious)) {
            current = next ? (current + 1) % kTargetCount : (current + kTargetCount - 1) % kTargetCount;
            MessageBeep(MB_OK);
            popupAt = now + 700;
            sprintf_s(line, "Selected target %u: %s", current + 1, kTeleportTargets[current].name);
            Log(line);
        }
        if (popupAt && now >= popupAt) {
            ShowTarget(current);
            popupAt = 0;
        }
        if (show && !previousShow) {
            ShowTarget(current);
        }
        if (go && !previousGo) {
            if (InterlockedCompareExchange(&requestState, 0, 0) != 0) {
                Log("Teleport ignored: the previous one is still being carried out.");
            } else {
                memcpy(requestedTarget, kTeleportTargets[current].position, sizeof(requestedTarget));
                requestedIndex = current;
                InterlockedExchange64(&requestedAt, static_cast<LONG64>(now));
                InterlockedExchange(&requestState, 1);
                sprintf_s(line, "t=%llu teleport requested to %u: %s", now, current + 1, kTeleportTargets[current].name);
                Log(line);
            }
        }
        // If the minimap never picks the request up (menus, loading), drop it.
        if (InterlockedCompareExchange(&requestState, 1, 1) == 1 &&
            now - static_cast<ULONGLONG>(InterlockedCompareExchange64(&requestedAt, 0, 0)) > kRequestTimeout &&
            InterlockedCompareExchange(&requestState, 0, 1) == 1) {
            Log("Teleport request dropped: no minimap update within 5 s (menu or loading screen?).");
        }
        LogOutcomes();
        previousNext = next;
        previousPrevious = previous;
        previousShow = show;
        previousGo = go;
        Sleep(30);
    }
}

} // namespace

// Test build only: started by src/pywel-atlas/PywelAtlas.cpp.
DWORD WINAPI PywelTeleporterRun(void* address) {
    return Run(address);
}
