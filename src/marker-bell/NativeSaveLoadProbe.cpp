// Passive observation of native save reads and the later apply candidate.
// Hooks preserve every argument/result. They never invoke loads, create pins,
// change progress, or write game data. The worker owns file writes; a separate
// notification thread shows copied confirmation text without blocking logging.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <intrin.h>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include "vendor/minhook/include/MinHook.h"
#include "save-load-profile.h"

namespace {
// RVA 186f570: RCX manager, RDX result storage, R8D requested slot, R9 save object.
// Returns result storage; callers branch on its DWORD (zero follows success).
using ReadSave = void* (*)(void*, void*, unsigned, void*);
// RVA 2941020: RCX wrapper (save object at +8), RDX result storage. The compiler
// saves R8/R9 home slots but does not consume them; forward them as opaque values.
using ApplySave = void* (*)(void*, void*, uintptr_t, uintptr_t);
// Outer read/apply wrapper: RCX wrapper, RDX result, R8 opaque context,
// R9D slot. Context cleanup returns an unspecified register value, forwarded
// verbatim; storage initialization consumes RCX/RDX and returns a boolean AL.
using LoadSave = void* (*)(void*, void*, uintptr_t, unsigned);
using CleanupContext = uintptr_t (*)(void*, void*, uintptr_t, uintptr_t);
using InitializeStorage = BYTE (*)(void*, void*, uintptr_t, uintptr_t);
ReadSave originalRead = nullptr;
ApplySave originalApply = nullptr;
LoadSave originalLoad = nullptr;
CleanupContext originalCleanup = nullptr;
InitializeStorage originalStorage = nullptr;
uintptr_t imageBase = 0;
HANDLE logFile = INVALID_HANDLE_VALUE;
SRWLOCK eventLock = SRWLOCK_INIT;
volatile LONG dropped = 0;
volatile LONG nextSequence = 0;

enum class Stage { ReadStart, ReadEnd, ApplyStart, ApplyEnd, LoadStart, LoadEnd,
    CleanupStart, CleanupEnd, StorageStart, StorageEnd };
// Correlation belongs to this synchronous native call chain only. Restoring
// outer scope handles nested loads; no thread-local game pointer is retained.
thread_local LONG loadScope = 0;
thread_local unsigned scopeSlot = 0xffffffffu;
struct Event {
    Stage stage;
    LONG sequence;
    DWORD thread;
    ULONGLONG tick;
    uintptr_t callerRva;
    uintptr_t object;
    unsigned requestedSlot;
    LONG scope;
    LONG droppedAtCapture;
    uintptr_t vtableRva;
    WORD lifecycleBits;
    DWORD status;
    bool lifecycleRead;
    bool statusRead;
    bool rootRead;
    char root[512];
};
Event pending[128] = {};
unsigned pendingCount = 0;

bool ReadMemory(uintptr_t address, void* output, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(),
        reinterpret_cast<const void*>(address), output, size, &read) && read == size;
}

// Callbacks copy bounded values while their objects are live. The worker never
// dereferences these diagnostic addresses. Contention drops a record instead of
// blocking a game thread; the drop counter makes incomplete traces explicit.
void Queue(const Event& event) {
    if (!TryAcquireSRWLockExclusive(&eventLock)) {
        InterlockedIncrement(&dropped);
        return;
    }
    if (pendingCount < _countof(pending)) {
        pending[pendingCount++] = event;
    } else {
        InterlockedIncrement(&dropped);
    }
    ReleaseSRWLockExclusive(&eventLock);
}

Event Begin(Stage stage, uintptr_t caller, uintptr_t object, unsigned slot) {
    Event event = {};
    event.stage = stage;
    event.sequence = InterlockedIncrement(&nextSequence);
    event.thread = GetCurrentThreadId();
    event.tick = GetTickCount64();
    event.callerRva = caller >= imageBase && caller - imageBase < kLoadImageSize ? caller - imageBase : 0;
    event.object = object;
    event.requestedSlot = slot;
    event.scope = loadScope;
    event.droppedAtCapture = InterlockedCompareExchange(&dropped, 0, 0);
    if (object && stage != Stage::StorageStart) {
        uintptr_t table = 0;
        if (ReadMemory(object, &table, sizeof(table)) && table >= imageBase &&
            table - imageBase < kLoadImageSize) {
            event.vtableRva = table - imageBase;
        }
        // Raw entity lifecycle bits, not a world-ready claim. +60 was an
        // unrelated identity in v0.33 and is deliberately no longer sampled.
        event.lifecycleRead = ReadMemory(object + 0x5e, &event.lifecycleBits, sizeof(event.lifecycleBits));
    }
    return event;
}

void Finish(Event& event, Stage stage, void* result) {
    event.stage = stage;
    event.tick = GetTickCount64();
    event.statusRead = ReadMemory(reinterpret_cast<uintptr_t>(result), &event.status, sizeof(event.status));
    event.lifecycleRead = event.object && ReadMemory(event.object + 0x5e,
        &event.lifecycleBits, sizeof(event.lifecycleBits));
    event.droppedAtCapture = InterlockedCompareExchange(&dropped, 0, 0);
    Queue(event);
}

void* ObserveRead(void* manager, void* result, unsigned slot, void* object) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::ReadStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(object), slot);
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalRead(manager, result, slot, object);
    DWORD originalError = GetLastError();
    Finish(event, Stage::ReadEnd, returned);
    SetLastError(originalError);
    return returned;
}

void* ObserveApply(void* wrapper, void* result, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    uintptr_t object = 0;
    if (wrapper) {
        ReadMemory(reinterpret_cast<uintptr_t>(wrapper) + 8, &object, sizeof(object));
    }
    Event event = Begin(Stage::ApplyStart, reinterpret_cast<uintptr_t>(_ReturnAddress()), object, scopeSlot);
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalApply(wrapper, result, opaque3, opaque4);
    DWORD originalError = GetLastError();
    Finish(event, Stage::ApplyEnd, returned);
    SetLastError(originalError);
    return returned;
}

void* ObserveLoad(void* wrapper, void* result, uintptr_t context, unsigned slot) {
    DWORD incomingError = GetLastError();
    uintptr_t object = 0;
    if (wrapper) {
        ReadMemory(reinterpret_cast<uintptr_t>(wrapper) + 8, &object, sizeof(object));
    }
    Event event = Begin(Stage::LoadStart, reinterpret_cast<uintptr_t>(_ReturnAddress()), object, slot);
    LONG previousScope = loadScope;
    unsigned previousSlot = scopeSlot;
    event.scope = event.sequence;
    loadScope = event.scope;
    scopeSlot = slot;
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalLoad(wrapper, result, context, slot);
    DWORD originalError = GetLastError();
    Finish(event, Stage::LoadEnd, returned);
    loadScope = previousScope;
    scopeSlot = previousSlot;
    SetLastError(originalError);
    return returned;
}

uintptr_t ObserveCleanup(void* manager, void* object, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::CleanupStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(object), scopeSlot);
    Queue(event);
    SetLastError(incomingError);
    uintptr_t returned = originalCleanup(manager, object, opaque3, opaque4);
    DWORD originalError = GetLastError();
    // Cleanup may destroy the object. Retain only the pre-call snapshot and
    // never sample its fields after the native call returns.
    event.stage = Stage::CleanupEnd;
    event.tick = GetTickCount64();
    Queue(event);
    SetLastError(originalError);
    return returned;
}

bool CopyStorageRoot(uintptr_t handler, char (&text)[512]) {
    uintptr_t table = 0;
    uintptr_t pointer = 0;
    if (!handler || !ReadMemory(handler, &table, sizeof(table)) ||
        table != imageBase + 0x59840c0 ||
        !ReadMemory(handler + 0x128, &pointer, sizeof(pointer))) {
        return false;
    }
    // The Steam handler formats its root into an inline byte string at +20,
    // or a heap buffer selected by +128. This is copied while the handler is
    // live. A path is evidence only; it never selects an account by itself.
    size_t limit = pointer ? sizeof(text) : 0x108;
    uintptr_t start = pointer ? pointer : handler + 0x20;
    for (size_t index = 0; index < limit; ++index) {
        char character = 0;
        if (!ReadMemory(start + index, &character, 1) ||
            (character && static_cast<unsigned char>(character) < 0x20)) {
            text[0] = 0;
            return false;
        }
        text[index] = character;
        if (!character) {
            return index != 0;
        }
    }
    text[0] = 0;
    return false;
}

BYTE ObserveStorage(void* handler, void* context, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::StorageStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(handler), 0xffffffffu);
    Queue(event);
    SetLastError(incomingError);
    BYTE returned = originalStorage(handler, context, opaque3, opaque4);
    DWORD originalError = GetLastError();
    event.stage = Stage::StorageEnd;
    event.tick = GetTickCount64();
    event.statusRead = true;
    event.status = returned; // Storage init uses boolean success, unlike DWORD result storage.
    event.rootRead = CopyStorageRoot(reinterpret_cast<uintptr_t>(handler), event.root);
    Queue(event);
    SetLastError(originalError);
    return returned;
}

void Log(const char* text) {
    DWORD written = 0;
    if (logFile != INVALID_HANDLE_VALUE) {
        WriteFile(logFile, text, static_cast<DWORD>(strlen(text)), &written, nullptr);
        WriteFile(logFile, "\r\n", 2, &written, nullptr);
        FlushFileBuffers(logFile);
    }
}

// Worker-owned summaries are observations, not a cached loaded-slot claim.
struct Summary {
    unsigned reads;
    unsigned applies;
    unsigned loads;
    unsigned cleanups;
    unsigned storageInitializations;
    Event lastRead;
    Event lastApply;
    Event lastLoad;
    Event lastStorage;
    bool correlatedCandidate;
};

// Worker-owned bounded correlation records. Scope IDs are captured on the
// loading thread, so address reuse or unrelated reads cannot pair two loads.
struct Correlation {
    LONG scope;
    LONG initialDrops;
    uintptr_t object;
    unsigned slot;
    bool readSucceeded;
    bool applySucceeded;
    bool rejected;
};
Correlation correlations[16] = {};

bool SupportedSlot(unsigned slot) {
    return slot <= 3 || (slot >= 100 && slot <= 108) || (slot >= 200 && slot <= 207);
}

void Correlate(const Event& event, Summary& summary) {
    if (event.stage == Stage::LoadStart) {
        summary.correlatedCandidate = false;
        for (auto& record : correlations) {
            if (!record.scope) {
                record = {event.scope, event.droppedAtCapture, event.object, event.requestedSlot,
                    false, false, !event.object || !SupportedSlot(event.requestedSlot)};
                return;
            }
        }
        Log("Load scope capacity exceeded; candidate withheld.");
        return;
    }
    if (event.stage == Stage::CleanupStart && event.object == summary.lastLoad.object) {
        summary.correlatedCandidate = false;
        Log("Last load object entered context cleanup; diagnostic candidate cleared.");
    }
    for (auto& record : correlations) {
        if (!event.scope || record.scope != event.scope) {
            continue;
        }
        bool sameIdentity = event.object == record.object && event.requestedSlot == record.slot;
        bool success = event.statusRead && event.status == 0;
        if (event.stage == Stage::ReadEnd && sameIdentity) {
            record.readSucceeded = success;
            record.rejected |= !success;
        } else if (event.stage == Stage::ApplyEnd && sameIdentity) {
            record.applySucceeded = success && record.readSucceeded;
            record.rejected |= !success;
        } else if (event.stage == Stage::LoadEnd) {
            summary.correlatedCandidate = sameIdentity && success && record.readSucceeded &&
                record.applySucceeded && !record.rejected && record.initialDrops == event.droppedAtCapture;
            char line[192];
            sprintf_s(line, "LOAD_CHAIN scope=%ld slot=%u correlated=%u worldReadyTrusted=0 accountTrusted=0",
                event.scope, event.requestedSlot, summary.correlatedCandidate ? 1u : 0u);
            Log(line);
            record = {};
        }
        return;
    }
}

// One copied notification snapshot at a time. The worker acquires ownership by
// changing popupActive from 0 to 1; only the notification thread releases it
// after MessageBox returns. No game object pointers reach this thread.
volatile LONG popupActive = 0;
wchar_t popupText[640] = {};

DWORD WINAPI ShowCheckpointPopup(void*) {
    // Foreground and topmost flags make the confirmation visible over the game.
    // No owner avoids disabling the game window while it awaits dismissal.
    MessageBoxW(nullptr, popupText, L"Pywel Atlas - checkpoint recorded",
        MB_OK | MB_ICONINFORMATION | MB_TOPMOST | MB_SETFOREGROUND);
    InterlockedExchange(&popupActive, 0);
    return 0;
}

void NotifyCheckpoint(const Summary& summary) {
    if (InterlockedCompareExchange(&popupActive, 1, 0) != 0) {
        Log("Checkpoint recorded; existing confirmation still open, no duplicate popup created.");
        return;
    }
    swprintf_s(popupText,
        L"F7 checkpoint recorded.\n\nRead completions: %u\nLast requested slot: %u\n"
        L"Apply completions: %u\nOuter load completions: %u\n"
        L"Correlated read/apply/load: %ls\nContext cleanups: %u\nStorage root copied: %ls\n\n"
        L"Logging continues while this confirmation is open.\n"
        L"Press OK, then continue the loading sequence.\n\n"
        L"Observation only; loaded-save detection is not yet trusted.",
        summary.reads, summary.reads ? summary.lastRead.requestedSlot : 0xffffffffu,
        summary.applies, summary.loads, summary.correlatedCandidate ? L"yes" : L"no",
        summary.cleanups, summary.lastStorage.rootRead ? L"yes" : L"no");
    HANDLE notification = CreateThread(nullptr, 0, ShowCheckpointPopup, nullptr, 0, nullptr);
    if (notification) {
        CloseHandle(notification);
    } else {
        InterlockedExchange(&popupActive, 0);
        Log("Confirmation thread unavailable; checkpoint remains recorded and logging continues.");
    }
}

void Drain(Summary& summary) {
    Event events[128];
    AcquireSRWLockExclusive(&eventLock);
    unsigned count = pendingCount;
    memcpy(events, pending, count * sizeof(Event));
    pendingCount = 0;
    ReleaseSRWLockExclusive(&eventLock);
    const char* stages[] = {"read-start", "read-end", "apply-start", "apply-end",
        "load-start", "load-end", "cleanup-start", "cleanup-end", "storage-start", "storage-end"};
    for (unsigned index = 0; index < count; ++index) {
        const Event& event = events[index];
        char line[768];
        sprintf_s(line, "stage=%s seq=%ld scope=%ld thread=%lu tick=%llu callerRva=0x%llx object=0x%llx requestedSlot=%u vtableRva=0x%llx lifecycleRead=%u lifecycleBits=0x%x statusRead=%u status=%lu",
            stages[static_cast<unsigned>(event.stage)], event.sequence, event.scope, event.thread,
            event.tick, static_cast<unsigned long long>(event.callerRva),
            static_cast<unsigned long long>(event.object), event.requestedSlot,
            static_cast<unsigned long long>(event.vtableRva), event.lifecycleRead ? 1u : 0u,
            static_cast<unsigned>(event.lifecycleBits),
            event.statusRead ? 1u : 0u, event.status);
        Log(line);
        Correlate(event, summary);
        if (event.stage == Stage::ReadEnd) {
            ++summary.reads;
            summary.lastRead = event;
        } else if (event.stage == Stage::ApplyEnd) {
            ++summary.applies;
            summary.lastApply = event;
        } else if (event.stage == Stage::LoadEnd) {
            ++summary.loads;
            summary.lastLoad = event;
        } else if (event.stage == Stage::CleanupEnd) {
            ++summary.cleanups;
        } else if (event.stage == Stage::StorageEnd) {
            ++summary.storageInitializations;
            summary.lastStorage = event;
            sprintf_s(line, "STORAGE_ROOT copied=%u booleanResult=%lu root=%s",
                event.rootRead ? 1u : 0u, event.status, event.rootRead ? event.root : "<unavailable>");
            Log(line);
        }
    }
}

DWORD WINAPI Run(void* address) {
    // Installed detours retain code addresses for process lifetime. Live ASI
    // unloading is unsupported; pin the module before any hook is installed.
    HMODULE pinned = nullptr;
    if (!GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned)) {
        return 0;
    }
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\native-save-detection.log");
    logFile = CreateFileW(path, FILE_APPEND_DATA, FILE_SHARE_READ, nullptr,
        OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (logFile == INVALID_HANDLE_VALUE) { return 0; }
    char line[192];
    sprintf_s(line, "SESSION native save-load observation v0.35 pid=%lu tick=%llu; automaticLoadedSaveTrusted=0",
        GetCurrentProcessId(), GetTickCount64());
    Log(line);
    auto* base = reinterpret_cast<BYTE*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    auto* dos = reinterpret_cast<const IMAGE_DOS_HEADER*>(base);
    auto* pe = reinterpret_cast<const IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kLoadTimestamp || pe->OptionalHeader.SizeOfImage != kLoadImageSize) {
        Log("Unsupported executable; no observation installed.");
        return 0;
    }
    for (const auto& site : kSaveLoadSites) {
        if (memcmp(base + site.rva, site.bytes, sizeof(site.bytes)) != 0) {
            Log("Save-load entry changed; no observation installed.");
            return 0;
        }
    }
    if (MH_Initialize() != MH_OK) { Log("MinHook initialization rejected."); return 0; }
    void* callbacks[] = {reinterpret_cast<void*>(&ObserveRead), reinterpret_cast<void*>(&ObserveApply),
        reinterpret_cast<void*>(&ObserveLoad), reinterpret_cast<void*>(&ObserveCleanup),
        reinterpret_cast<void*>(&ObserveStorage)};
    void** originals[] = {reinterpret_cast<void**>(&originalRead), reinterpret_cast<void**>(&originalApply),
        reinterpret_cast<void**>(&originalLoad), reinterpret_cast<void**>(&originalCleanup),
        reinterpret_cast<void**>(&originalStorage)};
    static_assert(_countof(callbacks) == _countof(kSaveLoadSites), "Every observed lifecycle site needs an explicit callback");
    for (unsigned index = 0; index < _countof(callbacks); ++index) {
        MH_STATUS status = MH_CreateHook(base + kSaveLoadSites[index].rva, callbacks[index], originals[index]);
        if (status != MH_OK) {
            Log(MH_StatusToString(status));
            MH_Uninitialize();
            return 0;
        }
    }
    MH_STATUS status = MH_EnableHook(MH_ALL_HOOKS);
    if (status != MH_OK) { Log(MH_StatusToString(status)); return 0; }
    Log("READY: read/apply/outer-load/cleanup/storage observation installed. F7 records a checkpoint and requests a foreground/topmost confirmation on a separate thread. No marker hooks or save writes.");
    Summary summary = {};
    bool previousF7 = false;
    while (true) {
        Drain(summary);
        DWORD foreground = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foreground);
        bool f7 = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
        if (foreground == GetCurrentProcessId() && f7 && !previousF7) {
            bool sameObject = summary.reads && summary.applies && summary.lastRead.object &&
                summary.lastRead.object == summary.lastApply.object;
            // Record first, then notify on another thread. An undisclosed or
            // undismissed popup must never stop draining later load events.
            char checkpoint[512];
            sprintf_s(checkpoint,
                "CHECKPOINT F7 readCount=%u applyCount=%u sameObject=%u dropped=%ld "
                "lastRequestedSlot=%u readStatusReadable=%u readStatus=%lu "
                "applyStatusReadable=%u applyStatus=%lu loadCount=%u cleanupCount=%u correlated=%u storageRootCopied=%u",
                summary.reads, summary.applies, sameObject ? 1u : 0u,
                InterlockedCompareExchange(&dropped, 0, 0),
                summary.reads ? summary.lastRead.requestedSlot : 0xffffffffu,
                summary.lastRead.statusRead ? 1u : 0u, summary.lastRead.status,
                summary.lastApply.statusRead ? 1u : 0u, summary.lastApply.status,
                summary.loads, summary.cleanups, summary.correlatedCandidate ? 1u : 0u,
                summary.lastStorage.rootRead ? 1u : 0u);
            Log(checkpoint);
            NotifyCheckpoint(summary);
            f7 = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
        }
        previousF7 = f7;
        Sleep(30);
    }
}
} // namespace

BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(instance);
        HANDLE worker = CreateThread(nullptr, 0, Run, instance, 0, nullptr);
        if (worker) { CloseHandle(worker); }
    }
    return TRUE;
}
