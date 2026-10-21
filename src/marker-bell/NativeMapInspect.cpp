// Create one experimental display-only chest with a private identifier, using
// a live, verified map callback as the controller-lifetime boundary. Original
// saved-pin callbacks remain intact. No saved-pin create/delete path is invoked.
// Captures are buffered; only the worker writes diagnostics to disk.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include "vendor/minhook/include/MinHook.h"
#include "inspect-profile.h"

namespace {
using PinCallback = void (*)(void*, uint64_t, const float*, BYTE, BYTE, BYTE);
using IconLookup = void* (*)(void*, const WORD*, const void*, const DWORD*);
using ShapeClassLookup = const DWORD* (*)(BYTE, BYTE);
using AddCssClass = bool (*)(void*, const DWORD*);
// Observed native calls pass output DWORD*, UTF-8 name, mode=1 and flags=0x2ffff.
// Registration runs on the native callback thread, never the polling worker.
using RegisterNativeName = void (*)(DWORD*, const char*, DWORD, DWORD);
PinCallback originalCallback = nullptr;
IconLookup originalWorldLookup = nullptr;
IconLookup originalSharedLookup = nullptr;
ShapeClassLookup originalShapeClass = nullptr;
AddCssClass originalAddCssClass = nullptr;
RegisterNativeName registerNativeName = nullptr;
LONG worldChestClass = 0;
LONG minimapChestClass = 0;
uintptr_t imageBase = 0;
HANDLE logFile = INVALID_HANDLE_VALUE;

struct NativeIconTag {
    uint64_t key;
    BYTE kind;
    BYTE padding[7];
};
static_assert(sizeof(NativeIconTag) == 16, "Native icon tag must remain 16 bytes");
// A private positive uint64, distinct from the observed ordinary keys 0, 1, 2.
// An existing native icon with this tag is never overwritten or adopted.
constexpr uint64_t collectibleKey = 0x5059415400000001ULL;

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
SRWLOCK captureLock = SRWLOCK_INIT;
Capture captures[128] = {};
unsigned captureCount = 0;
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

void ObservePin(void* controller, uint64_t key, const float* position,
    BYTE shape, BYTE colour, BYTE group) {
    if (key != 2 || group != 0 || !position) {
        originalCallback(controller, key, position, shape, colour, group);
        return;
    }

    Capture capture = {};
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
        InterlockedIncrement(&occupiedKeyCount);
        return;
    }

    LONG* cachedClass = worldMap ? &worldChestClass : &minimapChestClass;
    DWORD classId = static_cast<DWORD>(InterlockedCompareExchange(cachedClass, 0, 0));
    if (classId == 0) {
        registerNativeName(&classId, "pywel-atlas-chest-proof", 1, 0x2ffff);
        InterlockedCompareExchange(cachedClass, static_cast<LONG>(classId), 0);
    }
    if (classId == 0) {
        return;
    }

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

bool ObserveAddCssClass(void* list, const DWORD* classId) {
    bool added = originalAddCssClass(list, classId);
    if (!activeCapture || !activeCapture->previewApplied ||
        *classId != activeCapture->chestClass) {
        return added;
    }

    // The traced routine returns true when it appends a new class and false
    // when already present. Confirm membership in its bounded DWORD vector;
    // this observes class assignment, not stylesheet resolution or rendering.
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

void* ObserveWorldLookup(void* controller, const WORD* type,
    const void* tag, const DWORD* index) {
    return ObserveLookup(originalWorldLookup, 1, controller, type, tag, index);
}

void* ObserveSharedLookup(void* controller, const WORD* type,
    const void* tag, const DWORD* index) {
    return ObserveLookup(originalSharedLookup, 2, controller, type, tag, index);
}

void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

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
    wcscat_s(path, L"\\native-map-inspect.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    Log("Pywel Atlas native chest proof v0.16 - private display key, saved Bell pin unchanged");

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
    registerNativeName = reinterpret_cast<RegisterNativeName>(base + kInspectSites[5].rva);
    if (MH_Initialize() != MH_OK) {
        Log("Could not initialize observation hooks.");
        return 0;
    }
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
    MH_STATUS status = MH_EnableHook(MH_ALL_HOOKS);
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        return 0;
    }
    Log("Hooks active. F6 enables one extra display chest east of Bell for 3 minutes; reload Manual save 2.");
    Log("F8 captures state; F10 disables, then reload Manual save 2 for normal display.");
    Log("Loaded-save identity is manually scoped. No placement hotkeys or save access.");
    bool previousF6 = false;
    bool previousF8 = false;
    bool previousF10 = false;
    ULONGLONG previewDeadline = 0;
    while (true) {
        DrainCaptures();
        DWORD foregroundProcess = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foregroundProcess);
        bool foreground = foregroundProcess == GetCurrentProcessId();
        bool f6 = (GetAsyncKeyState(VK_F6) & 0x8000) != 0;
        bool f8 = (GetAsyncKeyState(VK_F8) & 0x8000) != 0;
        bool f10 = (GetAsyncKeyState(VK_F10) & 0x8000) != 0;
        if (foreground && f6 && !previousF6) {
            previewDeadline = GetTickCount64() + 180000;
            InterlockedExchange(&previewReadbackMask, 0);
            InterlockedExchange(&classAppliedMask, 0);
            InterlockedExchange(&previewEnabled, 1);
            Log("Preview ON. Reload Manual save 2 within 3 minutes; no new pins needed.");
            MessageBeep(MB_OK);
        }
        if (InterlockedCompareExchange(&previewEnabled, 0, 0) == 1 &&
            (!foreground || (f10 && !previousF10) || GetTickCount64() >= previewDeadline)) {
            InterlockedExchange(&previewEnabled, 0);
            Log("Preview OFF. Reload Manual save 2 to restore normal icon coordinates.");
        }
        if (f8 && !previousF8 && foreground) {
            char line[384];
            sprintf_s(line, "snapshot callbacks=%ld lookups=%ld dropped=%ld enabled=%ld applied=%ld readbackMask=%ld chestClassCalls=%ld classAppliedMask=%ld creationAttempts=%ld occupiedKey=%ld",
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
