// Create one experimental display-only chest with a private identifier, using
// a live, verified map callback as the controller-lifetime boundary. Original
// saved-pin callbacks remain intact. No saved-pin create/delete path is invoked.
// Captures are buffered; only the worker writes diagnostics to disk.
//
// ===========================================================================
// NativeMapInspect.cpp - plain-language overview ("Inspect" build mode)
// ===========================================================================
// What this is:
//   An earlier research probe for Pywel Atlas. It is not the current mod.
//   build.ps1 -Mode Inspect compiles it into PywelAtlasMapProbe.asi, a DLL
//   that the mod manager (DMM) loads into the game Crimson Desert.
//   Its log (version string "native chest proof v0.16") goes to
//   %LOCALAPPDATA%\PywelAtlas\native-map-inspect.log.
//
// What it does, in short:
//   1. It checks that the running game is the exact build it was made for.
//   2. It "hooks" a few game map functions. A hook redirects calls to a game
//      function through our own small function (a "detour"). The detour can
//      look at the arguments, then calls the real game function as normal.
//      We use the MinHook library to install hooks.
//   3. When the game draws the player's saved "Bell" map pin, it records
//      details (position, style, icon type) into a small in-memory buffer.
//   4. While the user enables the preview with F6, it asks the game to draw
//      one extra, display-only chest icon a little east of the Bell pin, using
//      a private identifier. Nothing is written to the save.
//   5. A background "worker" thread writes the buffered details to the log
//      and watches the hotkeys F6 (preview on), F8 (snapshot), F10 (off).
//
// How it relates to the rest:
//   Same folder as the other map probes (NativeMapPreview.cpp,
//   NativeMapProbe.cpp). The exact game addresses and safety bytes it uses
//   come from the generated header inspect-profile.h.
//
// Words used below:
//   RVA      - "relative virtual address": an offset inside the game
//              executable. Game base address + RVA = where a function lives
//              in memory this run.
//   vtable   - a table of function pointers that C++ objects point to. The
//              first 8 bytes of such an object hold its vtable address, so
//              (vtable - game base) identifies what kind of object it is.
//   guard bytes / "context" - the expected first bytes of each game function.
//              If they differ, the game was updated, so nothing is hooked.
//   callback - a function the game calls to tell other code something
//              happened (here: "show this map pin").
//   thread_local - a variable that has a separate copy on every thread.
// ===========================================================================
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include "vendor/minhook/include/MinHook.h"
#include "inspect-profile.h"

// Everything up to the closing "} // namespace" is private to this file.
namespace {
// ---------------------------------------------------------------------------
// Section: shapes of the game functions we hook or call, and saved pointers
// ---------------------------------------------------------------------------
// Each "using X = ..." line names a function signature (its argument and
// return types). These must match the game's real functions exactly; this is
// part of the ABI (the low-level calling rules between compiled code).
// Saved-pin "show this pin" callback: controller, key, XYZ, shape, colour, group.
using PinCallback = void (*)(void*, uint64_t, const float*, BYTE, BYTE, BYTE);
// Finds an existing map icon by type and tag (returns null when none exists).
// Two such lookups exist: one for the world map, one shared/minimap.
using IconLookup = void* (*)(void*, const WORD*, const void*, const DWORD*);
// Returns a pointer to a style class id for a given pin shape and group.
using ShapeClassLookup = const DWORD* (*)(BYTE, BYTE);
// Adds a style ("CSS-like") class id to an icon's class list.
using AddCssClass = bool (*)(void*, const DWORD*);
// Observed native calls pass output DWORD*, UTF-8 name, mode=1 and flags=0x2ffff.
// Registration runs on the native callback thread, never the polling worker.
using RegisterNativeName = void (*)(DWORD*, const char*, DWORD, DWORD);
// "original..." pointers: MinHook fills these in with a way to call the real
// game function after our detour has looked at the call.
PinCallback originalCallback = nullptr;
IconLookup originalWorldLookup = nullptr;
IconLookup originalSharedLookup = nullptr;
ShapeClassLookup originalShapeClass = nullptr;
AddCssClass originalAddCssClass = nullptr;
RegisterNativeName registerNativeName = nullptr;
// Cached style class ids for our test chest (0 = not registered yet),
// one for the world map and one for the minimap.
LONG worldChestClass = 0;
LONG minimapChestClass = 0;
// Where the game executable starts in memory this run (used to turn RVAs
// into real addresses and real addresses back into RVAs).
uintptr_t imageBase = 0;
HANDLE logFile = INVALID_HANDLE_VALUE;

// ---------------------------------------------------------------------------
// Section: data records
// ---------------------------------------------------------------------------
// The 16-byte tag the game uses to identify a map icon: a 64-bit key plus a
// one-byte kind (the rest is padding). Layout copied from observed calls.
struct NativeIconTag {
    uint64_t key;
    BYTE kind;
    BYTE padding[7];
};
static_assert(sizeof(NativeIconTag) == 16, "Native icon tag must remain 16 bytes");
// A private positive uint64, distinct from the observed ordinary keys 0, 1, 2.
// An existing native icon with this tag is never overwritten or adopted.
constexpr uint64_t collectibleKey = 0x5059415400000001ULL;

// One diagnostic record: what we saw during one pin callback or icon lookup.
// These are queued in memory and later written to the log by the worker.
struct Capture {
    uintptr_t controllerVtable;
    unsigned callbackSerial;
    unsigned lookupPath; // 0=callback, 1=world lookup, 2=shared/minimap lookup
    bool iconFound;
    WORD iconType;
    BYTE shape;
    BYTE colour;
    BYTE group;
    float position[3];
    int bellPositionOffset;
    bool previewApplied;
    float iconPosition[3];
    DWORD chestClass;
    uint64_t key;
    NativeIconTag nativeTag;
};

// A capture belongs to this synchronous native callback only. The original
// callback may nest; restoring the previous pointer keeps those lifetimes safe.
thread_local Capture* activeCapture = nullptr;
// The capture buffer (up to 128 records) and the lock that protects it.
// SRWLOCK is a lightweight Windows lock so two threads never edit it at once.
SRWLOCK captureLock = SRWLOCK_INIT;
Capture captures[128] = {};
unsigned captureCount = 0;
// Counters and flags shared between threads. They are only changed with
// Interlocked* calls (safe "atomic" updates that cannot be half-done).
// previewEnabled: 1 while the F6 preview is on. The *Mask values use bit 1
// for the world map and bit 2 for the minimap.
volatile LONG callbackCount = 0;
volatile LONG droppedCount = 0;
volatile LONG lookupCount = 0;
volatile LONG previewEnabled = 0;
volatile LONG previewAppliedCount = 0;
volatile LONG previewReadbackMask = 0;
volatile LONG chestClassCalls = 0;
volatile LONG classAppliedMask = 0;
volatile LONG occupiedKeyCount = 0;
volatile LONG creationAttempts = 0;
// Immutable module-lifetime payload: X/Z are horizontal, Y is altitude.
// Original X is -10702.4970703125; this diagnostic adds +200 along X.
constexpr float previewPosition[3] = {
    -10502.4970703125f, 631.1273193359375f, -3833.85888671875f
};

// ---------------------------------------------------------------------------
// Section: buffering diagnostics (called from game threads)
// ---------------------------------------------------------------------------
// Adds one record to the buffer without ever waiting. If the buffer is busy
// or full, the record is dropped and counted instead.
void Queue(const Capture& capture) {
    // Never wait on the game's UI thread. A full/busy buffer loses diagnostics,
    // not game events; original functions are always called exactly once.
    if (!TryAcquireSRWLockExclusive(&captureLock)) {
        InterlockedIncrement(&droppedCount);
        return;
    }
    if (captureCount < _countof(captures)) {
        captures[captureCount++] = capture;
    } else {
        InterlockedIncrement(&droppedCount);
    }
    ReleaseSRWLockExclusive(&captureLock);
}

// ---------------------------------------------------------------------------
// Section: hook detours (our code that runs inside game calls)
// ---------------------------------------------------------------------------
// Detour for the saved-pin callback. For the Bell pin (key 2, group 0) it
// records details, always forwards the real call, and - only while the
// preview is on and every check matches - asks the game to show one extra
// display-only chest using our private key.
void ObservePin(void* controller, uint64_t key, const float* position,
    BYTE shape, BYTE colour, BYTE group) {
    if (key != 2 || group != 0 || !position) {
        originalCallback(controller, key, position, shape, colour, group);
        return;
    }

    Capture capture = {};
    // Store the controller's vtable as an RVA, which tells which map
    // controller (world map or minimap) made this call.
    capture.controllerVtable = *static_cast<uintptr_t*>(controller) - imageBase;
    capture.callbackSerial = InterlockedIncrement(&callbackCount);
    capture.shape = shape;
    capture.colour = colour;
    capture.group = group;
    capture.key = key;
    capture.bellPositionOffset = -1;
    memcpy(capture.position, position, sizeof(capture.position));
    Queue(capture);

    Capture* previousCapture = activeCapture;
    activeCapture = &capture;
    // Forward every actual saved-pin event once, with its original arguments.
    originalCallback(controller, key, position, shape, colour, group);
    activeCapture = previousCapture;

    // Stop here unless ALL of these hold: preview is on; the controller is one
    // of the two known ones (world 0x566ff50, shared/minimap 0x5674e00); the
    // style is shape 4 / colour 14; the lookup saw icon type 1 with a matching
    // tag of kind 0x15; and the position is exactly the known Bell position.
    // (InterlockedCompareExchange(x, 0, 0) is just a safe way to read x.)
    if (InterlockedCompareExchange(&previewEnabled, 0, 0) != 1 ||
        (capture.controllerVtable != 0x566ff50 &&
         capture.controllerVtable != 0x5674e00) ||
        shape != 4 || colour != 14 || capture.iconType != 1 ||
        capture.nativeTag.key != key || capture.nativeTag.kind != 0x15 ||
        memcmp(position, kBellPositionBits, sizeof(kBellPositionBits)) != 0) {
        return;
    }

    // Use the exact tag/type layout observed during the original callback.
    // Query with a fresh controller-scoped lookup, not a retained icon pointer.
    NativeIconTag privateTag = capture.nativeTag;
    privateTag.key = collectibleKey;
    DWORD lookupIndex = 0;
    bool worldMap = capture.controllerVtable == 0x566ff50;
    IconLookup lookup = worldMap ? originalWorldLookup : originalSharedLookup;
    if (lookup(controller, &capture.iconType, &privateTag, &lookupIndex)) {
        // An icon already uses our private key: count it and leave it alone.
        InterlockedIncrement(&occupiedKeyCount);
        return;
    }

    // Get (or register once) the style class name for our chest. The game
    // turns the text name into a numeric id; that id is cached for reuse.
    LONG* cachedClass = worldMap ? &worldChestClass : &minimapChestClass;
    DWORD classId = static_cast<DWORD>(InterlockedCompareExchange(cachedClass, 0, 0));
    if (classId == 0) {
        registerNativeName(&classId, "pywel-atlas-chest-proof", 1, 0x2ffff);
        InterlockedCompareExchange(cachedClass, static_cast<LONG>(classId), 0);
    }
    if (classId == 0) {
        return;
    }

    // Build the record for the extra chest: same style as the Bell pin, but
    // our private key and the shifted preview position.
    Capture collectible = capture;
    collectible.key = collectibleKey;
    collectible.nativeTag = privateTag;
    collectible.previewApplied = true;
    collectible.chestClass = classId;
    collectible.bellPositionOffset = -1;
    memcpy(collectible.position, previewPosition, sizeof(collectible.position));
    InterlockedIncrement(&previewAppliedCount);
    InterlockedIncrement(&creationAttempts);
    Queue(collectible);

    // This is the traced presentation callback, not the save/model insertion
    // or network serializer. It runs synchronously on the game's UI thread.
    activeCapture = &collectible;
    originalCallback(controller, collectibleKey, previewPosition, shape, colour, group);
    activeCapture = previousCapture;
}

// Detour for the shape-to-style-class lookup. Normally returns the game's
// answer; only during our extra chest call (shape 4, group 0) it returns our
// registered chest class instead.
const DWORD* ObserveShapeClass(BYTE shape, BYTE group) {
    const DWORD* original = originalShapeClass(shape, group);
    if (!activeCapture || !activeCapture->previewApplied ||
        activeCapture->chestClass == 0 || shape != 4 || group != 0) {
        return original;
    }

    // The native caller consumes a pointer to an interned class identifier.
    // Keep that value in the pinned module, matching its normal cached lifetime.
    InterlockedIncrement(&chestClassCalls);
    return reinterpret_cast<const DWORD*>(activeCapture->controllerVtable == 0x566ff50
        ? &worldChestClass : &minimapChestClass);
}

// Detour for "add style class to icon". Always calls the real function; during
// our chest call it also checks the class really ended up in the icon's list.
bool ObserveAddCssClass(void* list, const DWORD* classId) {
    bool added = originalAddCssClass(list, classId);
    if (!activeCapture || !activeCapture->previewApplied ||
        *classId != activeCapture->chestClass) {
        return added;
    }

    // The traced routine returns true when it appends a new class and false
    // when already present. Confirm membership in its bounded DWORD vector;
    // this observes class assignment, not stylesheet resolution or rendering.
    // Observed list layout: pointer to the DWORD values at +0, count at +8.
    // The count <= 256 check is a safety limit before reading the values.
    const auto* bytes = static_cast<const unsigned char*>(list);
    DWORD count = *reinterpret_cast<const DWORD*>(bytes + 8);
    const DWORD* values = *reinterpret_cast<const DWORD* const*>(bytes);
    if (values && count <= 256) {
        for (DWORD index = 0; index < count; ++index) {
            if (values[index] == *classId) {
                InterlockedOr(&classAppliedMask,
                    activeCapture->controllerVtable == 0x566ff50 ? 1 : 2);
                break;
            }
        }
    }
    return added;
}

// Shared body for both icon-lookup detours. Calls the real lookup, and if it
// happens inside a pin callback we are watching (same key, kind 0x15), records
// the icon type, tag and the position stored inside the found icon.
// "path" says which lookup ran: 1 = world map, 2 = shared/minimap.
void* ObserveLookup(IconLookup original, unsigned path, void* controller,
    const WORD* type, const void* tag, const DWORD* index) {
    void* icon = original(controller, type, tag, index);
    if (!activeCapture) {
        return icon;
    }

    Capture capture = *activeCapture;
    NativeIconTag observedTag = {};
    memcpy(&observedTag, tag, sizeof(observedTag));
    if (observedTag.key != capture.key || observedTag.kind != 0x15) {
        return icon;
    }
    // Carry the actual native type and tag back to the outer callback before
    // considering a private marker. This avoids guessing a native type value.
    activeCapture->iconType = *type;
    activeCapture->nativeTag = observedTag;
    capture.controllerVtable = *static_cast<uintptr_t*>(controller) - imageBase;
    capture.lookupPath = path;
    capture.iconFound = icon != nullptr;
    capture.iconType = *type;
    InterlockedIncrement(&lookupCount);

    // The traced callback accesses the returned icon at +0x118. Restrict the
    // coordinate search to that established object range and known controllers.
    // X/Z are horizontal; Y is altitude. This only locates matching float bits.
    if (icon && (capture.controllerVtable == 0x566ff50 ||
                 capture.controllerVtable == 0x5674e00)) {
        const auto* bytes = static_cast<const unsigned char*>(icon);
        // v0.11 observed Bell XYZ at +0xe0 for both controllers. Static tracing
        // independently shows icon initialization writing it and map projection
        // reading X at +0xe0 and Z at +0xe8. Read back, without writing the icon.
        memcpy(capture.iconPosition, bytes + 0xe0, sizeof(capture.iconPosition));
        if (capture.previewApplied && memcmp(capture.iconPosition,
            previewPosition, sizeof(previewPosition)) == 0) {
            InterlockedOr(&previewReadbackMask,
                capture.controllerVtable == 0x566ff50 ? 1 : 2);
        }
        // Scan the first 0x120 bytes of the icon, 4 bytes at a time, for the
        // exact Bell XYZ bit pattern and record where it was found.
        for (unsigned offset = 0; offset + sizeof(kBellPositionBits) <= 0x120;
             offset += sizeof(DWORD)) {
            if (memcmp(bytes + offset, kBellPositionBits,
                sizeof(kBellPositionBits)) == 0) {
                capture.bellPositionOffset = static_cast<int>(offset);
                break;
            }
        }
    }
    Queue(capture);
    return icon;
}

// Detour for the world-map icon lookup (records path 1).
void* ObserveWorldLookup(void* controller, const WORD* type,
    const void* tag, const DWORD* index) {
    return ObserveLookup(originalWorldLookup, 1, controller, type, tag, index);
}

// Detour for the shared/minimap icon lookup (records path 2).
void* ObserveSharedLookup(void* controller, const WORD* type,
    const void* tag, const DWORD* index) {
    return ObserveLookup(originalSharedLookup, 2, controller, type, tag, index);
}

// ---------------------------------------------------------------------------
// Section: log file output (worker thread only)
// ---------------------------------------------------------------------------
// Writes one line to the log file and flushes it to disk right away.
void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

// Copies all queued records out under the lock (quickly), empties the buffer,
// then formats and logs each record without holding the lock.
void DrainCaptures() {
    Capture pending[128];
    AcquireSRWLockExclusive(&captureLock);
    unsigned count = captureCount;
    memcpy(pending, captures, count * sizeof(Capture));
    captureCount = 0;
    ReleaseSRWLockExclusive(&captureLock);
    for (unsigned index = 0; index < count; ++index) {
        const Capture& capture = pending[index];
        char line[560];
        sprintf_s(line,
            "callback=%u path=%u controller_vtable=0x%llx icon=%u type=%u "
            "xyz=(%.6f,%.6f,%.6f) style=%u/%u group=%u bell_xyz_offset=%d "
            "preview=%u icon_xyz=(%.6f,%.6f,%.6f) chest_class=0x%lx key=0x%llx",
            capture.callbackSerial, capture.lookupPath,
            static_cast<unsigned long long>(capture.controllerVtable),
            capture.iconFound ? 1u : 0u, static_cast<unsigned>(capture.iconType),
            capture.position[0], capture.position[1], capture.position[2],
            static_cast<unsigned>(capture.shape), static_cast<unsigned>(capture.colour),
            static_cast<unsigned>(capture.group), capture.bellPositionOffset,
            capture.previewApplied ? 1u : 0u, capture.iconPosition[0],
            capture.iconPosition[1], capture.iconPosition[2], capture.chestClass,
            static_cast<unsigned long long>(capture.key));
        Log(line);
    }
}

// ---------------------------------------------------------------------------
// Section: worker thread - startup checks, hook install, hotkey loop
// ---------------------------------------------------------------------------
// The background thread started from DllMain. It opens the log, refuses to
// run on an unknown game build, checks guard bytes, installs the hooks, then
// loops forever every 30 ms: writes buffered records and handles F6/F8/F10.
DWORD WINAPI Run(void* address) {
    // "Pin" this DLL so Windows never unloads it while hooks point into it.
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\native-map-inspect.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    Log("Pywel Atlas native chest proof v0.16 - private display key, saved Bell pin unchanged");

    // Read the game executable's PE header (the standard Windows header at the
    // start of every .exe) and compare its build timestamp and size with the
    // one build this probe was made for.
    auto* base = reinterpret_cast<unsigned char*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    const auto* dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    const auto* pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported game build; no hooks installed.");
        return 0;
    }
    // Validate every entry before installing any hook. These contexts were
    // generated from the same known on-disk executable used in static tracing.
    for (const auto& site : kInspectSites) {
        if (memcmp(base + site.rva, site.context, sizeof(site.context)) != 0) {
            Log("Native entry bytes changed; no hooks installed.");
            return 0;
        }
    }
    static_assert(_countof(kInspectSites) == 6, "Five hook sites and one call guard required");
    // Sites 0-4 are hooked; site 5 is only guarded and then called directly.
    registerNativeName = reinterpret_cast<RegisterNativeName>(base + kInspectSites[5].rva);
    if (MH_Initialize() != MH_OK) {
        Log("Could not initialize observation hooks.");
        return 0;
    }
    // Pair each detour with where MinHook should store the "call original"
    // pointer. Index N in both lists belongs to kInspectSites[N].
    void* detours[] = {reinterpret_cast<void*>(&ObservePin),
        reinterpret_cast<void*>(&ObserveWorldLookup),
        reinterpret_cast<void*>(&ObserveSharedLookup),
        reinterpret_cast<void*>(&ObserveShapeClass),
        reinterpret_cast<void*>(&ObserveAddCssClass)};
    void** originals[] = {reinterpret_cast<void**>(&originalCallback),
        reinterpret_cast<void**>(&originalWorldLookup),
        reinterpret_cast<void**>(&originalSharedLookup),
        reinterpret_cast<void**>(&originalShapeClass),
        reinterpret_cast<void**>(&originalAddCssClass)};
    for (unsigned index = 0; index < _countof(detours); ++index) {
        MH_STATUS status = MH_CreateHook(base + kInspectSites[index].rva,
            detours[index], originals[index]);
        char startupLine[160];
        sprintf_s(startupLine, "Create observation hook rva=0x%llx: %s",
            static_cast<unsigned long long>(kInspectSites[index].rva),
            MH_StatusToString(status));
        Log(startupLine);
        if (status != MH_OK) {
            MH_Uninitialize();
            return 0;
        }
    }
    // Hooks are created first and only switched on together here.
    MH_STATUS status = MH_EnableHook(MH_ALL_HOOKS);
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        return 0;
    }
    Log("Hooks active. F6 enables one extra display chest east of Bell for 3 minutes; reload Manual save 2.");
    Log("F8 captures state; F10 disables, then reload Manual save 2 for normal display.");
    Log("Loaded-save identity is manually scoped. No placement hotkeys or save access.");
    // Key states from the previous loop, so a held key only triggers once.
    bool previousF6 = false;
    bool previousF8 = false;
    bool previousF10 = false;
    ULONGLONG previewDeadline = 0;
    while (true) {
        DrainCaptures();
        // Hotkeys only count while the game window is the active window.
        DWORD foregroundProcess = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foregroundProcess);
        bool foreground = foregroundProcess == GetCurrentProcessId();
        bool f6 = (GetAsyncKeyState(VK_F6) & 0x8000) != 0;
        bool f8 = (GetAsyncKeyState(VK_F8) & 0x8000) != 0;
        bool f10 = (GetAsyncKeyState(VK_F10) & 0x8000) != 0;
        // F6: turn the preview on for 180000 ms (3 minutes).
        if (foreground && f6 && !previousF6) {
            previewDeadline = GetTickCount64() + 180000;
            InterlockedExchange(&previewReadbackMask, 0);
            InterlockedExchange(&classAppliedMask, 0);
            InterlockedExchange(&previewEnabled, 1);
            Log("Preview ON. Reload Manual save 2 within 3 minutes; no new pins needed.");
            MessageBeep(MB_OK);
        }
        // Turn the preview off when the game loses focus, F10 is pressed, or
        // the 3 minutes are up.
        if (InterlockedCompareExchange(&previewEnabled, 0, 0) == 1 &&
            (!foreground || (f10 && !previousF10) || GetTickCount64() >= previewDeadline)) {
            InterlockedExchange(&previewEnabled, 0);
            Log("Preview OFF. Reload Manual save 2 to restore normal icon coordinates.");
        }
        // F8: write one line with all counters (a "snapshot").
        if (f8 && !previousF8 && foreground) {
            char line[384];
            sprintf_s(line,
                "snapshot callbacks=%ld lookups=%ld dropped=%ld enabled=%ld applied=%ld readbackMask=%ld chestClassCalls=%ld classAppliedMask=%ld creationAttempts=%ld occupiedKey=%ld",
                InterlockedCompareExchange(&callbackCount, 0, 0),
                InterlockedCompareExchange(&lookupCount, 0, 0),
                InterlockedCompareExchange(&droppedCount, 0, 0),
                InterlockedCompareExchange(&previewEnabled, 0, 0),
                InterlockedCompareExchange(&previewAppliedCount, 0, 0),
                InterlockedCompareExchange(&previewReadbackMask, 0, 0),
                InterlockedCompareExchange(&chestClassCalls, 0, 0),
                InterlockedCompareExchange(&classAppliedMask, 0, 0),
                InterlockedCompareExchange(&creationAttempts, 0, 0),
                InterlockedCompareExchange(&occupiedKeyCount, 0, 0));
            Log(line);
        }
        previousF6 = f6;
        previousF8 = f8;
        previousF10 = f10;
        Sleep(30);
    }
}
} // namespace

// ---------------------------------------------------------------------------
// Section: DLL entry point
// ---------------------------------------------------------------------------
// Windows calls DllMain when the DLL is loaded into the game. It does almost
// nothing here (doing real work inside DllMain is unsafe); it just starts the
// worker thread Run() and returns.
BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(instance);
        HANDLE worker = CreateThread(nullptr, 0, Run, instance, 0, nullptr);
        if (worker) {
            CloseHandle(worker);
        }
    }
    return TRUE;
}
