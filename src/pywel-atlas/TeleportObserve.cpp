// =============================================================================
// Pywel Atlas - teleport observation, watch only (TeleportObserve.cpp, v0.55)
// =============================================================================
//
// WHAT THIS FILE IS
//   Phase 1 of the user-approved test-only teleporter (see
//   research/analysis/teleport.md). It moves nothing and calls no game
//   function. It only watches the game's own "move the player" functions while
//   the user fast travels, revives and rides, and writes what it sees to
//   %LOCALAPPDATA%\PywelAtlas\teleport-observe.log. The log answers:
//     - which of these functions the game really uses for fast travel and
//       revive, and from where (return address);
//     - on which thread (compared with the minimap thread, where a later test
//       build would make its own call);
//     - what the positions look like (packed sector form vs world).
//
// KEY IDEAS
//   Hook      - MinHook redirects a game function to ours. Ours copies the
//               arguments, calls the original with exactly the same arguments
//               (registers, float register and stack arguments), and returns
//               its result unchanged.
//   Guard     - the first 24 bytes of each function must match the supported
//               game build before it is hooked; otherwise that hook is skipped
//               and logged. A skipped hook never stops the others.
//   PackedPos - the game's position form: x, y, z offsets as floats, then two
//               16-bit "sector" numbers. World X = sectorX * 1000 + x, and
//               World Z = sectorZ * 1000 + z (Y is height, not packed).
//   Copies    - hooks copy bounded values with ReadProcessMemory on the game's
//               thread and queue them. The worker thread only formats copies;
//               it never reads game memory or keeps game pointers.
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <intrin.h>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include "../save-detection/vendor/minhook/include/MinHook.h"

// Latest minimap player position, provided by the map-marker part.
bool PywelGetMinimapPlayer(float (&xyz)[3], DWORD& thread, ULONGLONG& tick);

namespace {

// The supported game build (same values as the other parts).
constexpr DWORD kExpectedTimestamp = 1790086912u;
constexpr DWORD kExpectedImageSize = 389722112u;

uintptr_t imageBase = 0;
HANDLE logFile = INVALID_HANDLE_VALUE;

// Safely copy `size` bytes; false instead of a crash if not readable.
bool Read(const void* address, void* destination, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(), address,
        destination, size, &read) && read == size;
}

// Return address of the current hook as an offset inside the game, or the
// raw address if it is outside the game executable.
uintptr_t CallerRva(void* returnAddress) {
    auto value = reinterpret_cast<uintptr_t>(returnAddress);
    return value - imageBase < kExpectedImageSize ? value - imageBase : value;
}

// ---------------------------------------------------------------------------
// Section: queued observations
// ---------------------------------------------------------------------------

// Which hook produced an event.
enum EventKind : BYTE {
    kRequestMove = 1,   // 0x9fca60 queued set-position, move type 4 only
    kSetWithYaw,        // 0x9fe740 component slot 0x198
    kSetWithRotation,   // 0x9fe840 component slot 0x1a0
    kTeleportApply,     // 0x9fea40 server-ordered teleport apply (after return)
    kHandlerEnter,      // message handlers: entry
    kHandlerExit,       // message handlers: exit
};

// One observation, copies only.
struct Event {
    BYTE kind;
    BYTE handler;          // index into kHandlerNames for handler events
    DWORD thread;
    ULONGLONG tick;
    uintptr_t caller;      // return address (game RVA when inside the game)
    uintptr_t component;   // first argument, as a number only (never read later)
    bool positionRead;
    float world[3];        // decoded world position of the request
    BYTE moveType;
    BYTE hasVelocity;
    BYTE extra[2];         // a6/a7 (request) or rotMode/flag (wrappers)
    float yaw;
    bool rotationRead;
    float rotation[4];
    bool sessionRead;
    BYTE session[8];       // 0x9fea40 move-session value
    uintptr_t result;
    bool packetRead;
    BYTE packet[0x40];     // first bytes of a handler's message
    bool playerKnown;
    float player[3];       // minimap player position at this moment
    DWORD minimapThread;
};

SRWLOCK queueLock = SRWLOCK_INIT;
Event queue[256] = {};
unsigned queueCount = 0;
volatile LONG droppedEvents = 0;

// Fill in the shared parts and queue an event; never waits on a game thread.
void Queue(Event& event, void* returnAddress) {
    event.thread = GetCurrentThreadId();
    event.tick = GetTickCount64();
    event.caller = CallerRva(returnAddress);
    ULONGLONG minimapTick = 0;
    event.playerKnown = PywelGetMinimapPlayer(event.player, event.minimapThread, minimapTick);
    if (!TryAcquireSRWLockExclusive(&queueLock)) {
        InterlockedIncrement(&droppedEvents);
        return;
    }
    if (queueCount < _countof(queue)) {
        queue[queueCount++] = event;
    } else {
        InterlockedIncrement(&droppedEvents);
    }
    ReleaseSRWLockExclusive(&queueLock);
}

// Decode a PackedPos (see the file header) into world X, Y, Z.
bool ReadPackedPosition(const void* packed, float (&world)[3]) {
    BYTE bytes[16] = {};
    if (!Read(packed, bytes, sizeof(bytes))) {
        return false;
    }
    float offset[3] = {};
    int16_t sector[2] = {};
    memcpy(offset, bytes, sizeof(offset));
    memcpy(sector, bytes + 12, sizeof(sector));
    world[0] = sector[0] * 1000.0f + offset[0];
    world[1] = offset[1];
    world[2] = sector[1] * 1000.0f + offset[2];
    return true;
}

// Counts of every queued set-position call by (caller, move type), so the log
// shows how often each path runs without queueing every call.
struct RequestCount {
    uintptr_t caller;
    BYTE moveType;
    LONG count;
};
SRWLOCK countLock = SRWLOCK_INIT;
RequestCount requestCounts[96] = {};
unsigned requestCountUsed = 0;
volatile LONG requestCountOverflow = 0;

// Add one call to the per-(caller, type) table; drops it if busy or full.
void CountRequest(uintptr_t caller, BYTE moveType) {
    if (!TryAcquireSRWLockExclusive(&countLock)) {
        InterlockedIncrement(&requestCountOverflow);
        return;
    }
    unsigned index = 0;
    while (index < requestCountUsed &&
        (requestCounts[index].caller != caller || requestCounts[index].moveType != moveType)) {
        ++index;
    }
    if (index == requestCountUsed && requestCountUsed < _countof(requestCounts)) {
        requestCounts[requestCountUsed++] = {caller, moveType, 0};
    }
    if (index < requestCountUsed) {
        ++requestCounts[index].count;
    } else {
        InterlockedIncrement(&requestCountOverflow);
    }
    ReleaseSRWLockExclusive(&countLock);
}

// ---------------------------------------------------------------------------
// Section: the hooks (each forwards every argument and the result unchanged)
// ---------------------------------------------------------------------------

// 0x9fca60 queued set-position (Windows x64: rcx, rdx, r8b, r9b, then three
// stack arguments: velocity pointer, a6, a7). Very common, so only move type
// 4 ("Teleport") is queued in full; every call is counted.
using RequestMove = uintptr_t (*)(void*, const void*, BYTE, BYTE, const void*, BYTE, BYTE);
RequestMove originalRequestMove = nullptr;

uintptr_t ObserveRequestMove(void* component, const void* packed, BYTE moveType,
    BYTE hasVelocity, const void* velocity, BYTE a6, BYTE a7) {
    void* returnAddress = _ReturnAddress();
    CountRequest(CallerRva(returnAddress), moveType);
    if (moveType == 4) {
        Event event = {};
        event.kind = kRequestMove;
        event.component = reinterpret_cast<uintptr_t>(component);
        event.positionRead = ReadPackedPosition(packed, event.world);
        event.moveType = moveType;
        event.hasVelocity = hasVelocity;
        event.extra[0] = a6;
        event.extra[1] = a7;
        Queue(event, returnAddress);
    }
    return originalRequestMove(component, packed, moveType, hasVelocity, velocity, a6, a7);
}

// 0x9fe740 component slot 0x198: (T, PackedPos*, yaw in xmm2, moveType r9b,
// rotMode and flag on the stack).
using SetWithYaw = uintptr_t (*)(void*, const void*, float, BYTE, BYTE, BYTE);
SetWithYaw originalSetWithYaw = nullptr;

uintptr_t ObserveSetWithYaw(void* component, const void* packed, float yaw,
    BYTE moveType, BYTE rotMode, BYTE flag) {
    Event event = {};
    event.kind = kSetWithYaw;
    event.component = reinterpret_cast<uintptr_t>(component);
    event.positionRead = ReadPackedPosition(packed, event.world);
    event.yaw = yaw;
    event.moveType = moveType;
    event.extra[0] = rotMode;
    event.extra[1] = flag;
    Queue(event, _ReturnAddress());
    return originalSetWithYaw(component, packed, yaw, moveType, rotMode, flag);
}

// 0x9fe840 component slot 0x1a0: same, but a rotation pointer in r8.
using SetWithRotation = uintptr_t (*)(void*, const void*, const void*, BYTE, BYTE, BYTE);
SetWithRotation originalSetWithRotation = nullptr;

uintptr_t ObserveSetWithRotation(void* component, const void* packed, const void* rotation,
    BYTE moveType, BYTE rotMode, BYTE flag) {
    Event event = {};
    event.kind = kSetWithRotation;
    event.component = reinterpret_cast<uintptr_t>(component);
    event.positionRead = ReadPackedPosition(packed, event.world);
    event.rotationRead = Read(rotation, event.rotation, sizeof(event.rotation));
    event.moveType = moveType;
    event.extra[0] = rotMode;
    event.extra[1] = flag;
    Queue(event, _ReturnAddress());
    return originalSetWithRotation(component, packed, rotation, moveType, rotMode, flag);
}

// 0x9fea40 server-ordered teleport apply: (T, result*, pos3*, session*).
// Copies are taken before the call; the result after it.
using TeleportApply = uintptr_t (*)(void*, void*, const void*, const void*);
TeleportApply originalTeleportApply = nullptr;

uintptr_t ObserveTeleportApply(void* component, void* result, const void* position,
    const void* session) {
    Event event = {};
    event.kind = kTeleportApply;
    event.component = reinterpret_cast<uintptr_t>(component);
    event.positionRead = Read(position, event.world, sizeof(event.world));
    event.sessionRead = Read(session, event.session, sizeof(event.session));
    uintptr_t value = originalTeleportApply(component, result, position, session);
    event.result = value;
    Queue(event, _ReturnAddress());
    return value;
}

// Message handlers (field move, forced move, revive point, do-teleport ack).
// All take (handler, result*, message*); r9 is passed through unchanged.
using Handler = uintptr_t (*)(void*, void*, const void*, void*);
constexpr const char* kHandlerNames[] = {
    "DoTeleportAck 0xb61640", "MoveField 0xb87360", "MoveField 0xb882a0",
    "RevivePoint 0xbcc190", "MoveForce 0xb619c0"};
Handler originalHandlers[_countof(kHandlerNames)] = {};

// Shared body: log entry (with the first message bytes) and exit.
uintptr_t ObserveHandler(BYTE index, void* handler, void* result, const void* message,
    void* fourth, void* returnAddress) {
    Event enter = {};
    enter.kind = kHandlerEnter;
    enter.handler = index;
    enter.component = reinterpret_cast<uintptr_t>(handler);
    enter.packetRead = Read(message, enter.packet, sizeof(enter.packet));
    Queue(enter, returnAddress);
    uintptr_t value = originalHandlers[index](handler, result, message, fourth);
    Event exit = {};
    exit.kind = kHandlerExit;
    exit.handler = index;
    exit.result = value;
    Queue(exit, returnAddress);
    return value;
}

// One small entry function per handler, so each knows its own index.
uintptr_t ObserveHandler0(void* h, void* r, const void* m, void* f) { return ObserveHandler(0, h, r, m, f, _ReturnAddress()); }
uintptr_t ObserveHandler1(void* h, void* r, const void* m, void* f) { return ObserveHandler(1, h, r, m, f, _ReturnAddress()); }
uintptr_t ObserveHandler2(void* h, void* r, const void* m, void* f) { return ObserveHandler(2, h, r, m, f, _ReturnAddress()); }
uintptr_t ObserveHandler3(void* h, void* r, const void* m, void* f) { return ObserveHandler(3, h, r, m, f, _ReturnAddress()); }
uintptr_t ObserveHandler4(void* h, void* r, const void* m, void* f) { return ObserveHandler(4, h, r, m, f, _ReturnAddress()); }

// ---------------------------------------------------------------------------
// Section: hook table and installation
// ---------------------------------------------------------------------------

// One hooked function: where it is, its guard bytes, our replacement, and
// where MinHook stores the address of the original.
struct HookSite {
    const char* name;
    uintptr_t rva;
    BYTE guard[24];
    void* replacement;
    void** original;
};

// Guards: first 24 bytes of each function in the supported build, from
// research/analysis/teleport.md and checked again with pefile (2026-10-22).
const HookSite kSites[] = {
    {"RequestMove", 0x9fca60, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x6c, 0x24, 0x10, 0x48, 0x89,
        0x74, 0x24, 0x18, 0x57, 0x48, 0x83, 0xec, 0x30, 0x0f, 0xbf, 0x42, 0x0e},
        reinterpret_cast<void*>(&ObserveRequestMove), reinterpret_cast<void**>(&originalRequestMove)},
    {"SetWithYaw", 0x9fe740, {0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x6c, 0x24, 0x18, 0x48, 0x89,
        0x74, 0x24, 0x20, 0x57, 0x48, 0x83, 0xec, 0x60, 0xc5, 0xf8, 0x29, 0x74},
        reinterpret_cast<void*>(&ObserveSetWithYaw), reinterpret_cast<void**>(&originalSetWithYaw)},
    {"SetWithRotation", 0x9fe840, {0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x6c, 0x24, 0x18, 0x56, 0x57,
        0x41, 0x56, 0x48, 0x83, 0xec, 0x50, 0x41, 0x0f, 0xb6, 0xf1, 0x4d, 0x8b},
        reinterpret_cast<void*>(&ObserveSetWithRotation), reinterpret_cast<void**>(&originalSetWithRotation)},
    {"TeleportApply", 0x9fea40, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x74, 0x24, 0x10, 0x48, 0x89,
        0x7c, 0x24, 0x18, 0x55, 0x41, 0x56, 0x41, 0x57, 0x48, 0x8d, 0xac, 0x24},
        reinterpret_cast<void*>(&ObserveTeleportApply), reinterpret_cast<void**>(&originalTeleportApply)},
    {kHandlerNames[0], 0xb61640, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55,
        0x41, 0x56, 0x41, 0x57, 0x48, 0x8b, 0xec, 0x48, 0x81, 0xec, 0x10, 0x01},
        reinterpret_cast<void*>(&ObserveHandler0), reinterpret_cast<void**>(&originalHandlers[0])},
    {kHandlerNames[1], 0xb87360, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55,
        0x41, 0x56, 0x41, 0x57, 0x48, 0x8d, 0xac, 0x24, 0xd0, 0xef, 0xff, 0xff},
        reinterpret_cast<void*>(&ObserveHandler1), reinterpret_cast<void**>(&originalHandlers[1])},
    {kHandlerNames[2], 0xb882a0, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55,
        0x41, 0x56, 0x41, 0x57, 0x48, 0x8b, 0xec, 0x48, 0x81, 0xec, 0x10, 0x01},
        reinterpret_cast<void*>(&ObserveHandler2), reinterpret_cast<void**>(&originalHandlers[2])},
    {kHandlerNames[3], 0xbcc190, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55,
        0x41, 0x56, 0x41, 0x57, 0x48, 0x8d, 0x6c, 0x24, 0xd9, 0x48, 0x81, 0xec},
        reinterpret_cast<void*>(&ObserveHandler3), reinterpret_cast<void**>(&originalHandlers[3])},
    {kHandlerNames[4], 0xb619c0, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55,
        0x41, 0x56, 0x41, 0x57, 0x48, 0x8d, 0xac, 0x24, 0x10, 0xff, 0xff, 0xff},
        reinterpret_cast<void*>(&ObserveHandler4), reinterpret_cast<void**>(&originalHandlers[4])},
};

// Append one line to teleport-observe.log (worker thread only).
void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

// Check each guard and install that hook alone; a failure skips only it.
void InstallHooks(BYTE* base) {
    for (const auto& site : kSites) {
        char line[200];
        if (memcmp(base + site.rva, site.guard, sizeof(site.guard)) != 0) {
            sprintf_s(line, "hook %s rva=0x%llx: guard mismatch, not installed", site.name,
                static_cast<unsigned long long>(site.rva));
            Log(line);
            continue;
        }
        MH_STATUS status = MH_CreateHook(base + site.rva, site.replacement, site.original);
        if (status == MH_OK) {
            status = MH_EnableHook(base + site.rva);
            if (status != MH_OK) {
                MH_RemoveHook(base + site.rva);
            }
        }
        sprintf_s(line, "hook %s rva=0x%llx: %s", site.name,
            static_cast<unsigned long long>(site.rva), MH_StatusToString(status));
        Log(line);
    }
}

// ---------------------------------------------------------------------------
// Section: worker - formats queued copies into the log
// ---------------------------------------------------------------------------

// Writes one queued event as a single log line.
void LogEvent(const Event& event) {
    static constexpr const char* kKindNames[] = {"?", "request-move", "set-yaw",
        "set-rotation", "teleport-apply", "handler-enter", "handler-exit"};
    char line[1024];
    int length = sprintf_s(line, "t=%llu %s thread=%lu minimapThread=%lu caller=0x%llx",
        event.tick, kKindNames[event.kind < _countof(kKindNames) ? event.kind : 0],
        event.thread, event.minimapThread, static_cast<unsigned long long>(event.caller));
    auto append = [&](const char* format, auto... values) {
        if (length > 0 && length < static_cast<int>(sizeof(line))) {
            length += sprintf_s(line + length, sizeof(line) - length, format, values...);
        }
    };
    if (event.kind == kHandlerEnter || event.kind == kHandlerExit) {
        append(" handler=\"%s\"", kHandlerNames[event.handler]);
    } else {
        append(" component=0x%llx", static_cast<unsigned long long>(event.component));
    }
    if (event.positionRead) {
        append(" target=(%.2f, %.2f, %.2f)", event.world[0], event.world[1], event.world[2]);
    }
    if (event.kind == kRequestMove || event.kind == kSetWithYaw || event.kind == kSetWithRotation) {
        append(" moveType=%u extra=%u,%u", event.moveType, event.extra[0], event.extra[1]);
    }
    if (event.kind == kRequestMove) {
        append(" hasVelocity=%u", event.hasVelocity);
    }
    if (event.kind == kSetWithYaw) {
        append(" yaw=%.3f", event.yaw);
    }
    if (event.rotationRead) {
        append(" rotation=(%.3f, %.3f, %.3f, %.3f)", event.rotation[0], event.rotation[1],
            event.rotation[2], event.rotation[3]);
    }
    if (event.sessionRead) {
        append(" session=");
        for (BYTE value : event.session) {
            append("%02x", value);
        }
    }
    if (event.kind == kTeleportApply || event.kind == kHandlerExit) {
        append(" result=0x%llx", static_cast<unsigned long long>(event.result));
    }
    if (event.packetRead) {
        append(" message=");
        for (BYTE value : event.packet) {
            append("%02x", value);
        }
    }
    if (event.playerKnown) {
        append(" player=(%.2f, %.2f, %.2f)", event.player[0], event.player[1], event.player[2]);
    }
    Log(line);
}

// Logs the per-(caller, move type) counts of the queued set-position calls.
void LogRequestCounts() {
    RequestCount copy[_countof(requestCounts)] = {};
    unsigned used = 0;
    AcquireSRWLockShared(&countLock);
    used = requestCountUsed;
    memcpy(copy, requestCounts, sizeof(copy));
    ReleaseSRWLockShared(&countLock);
    char line[160];
    sprintf_s(line, "request-move counts (%u callers, overflow %ld):", used,
        InterlockedCompareExchange(&requestCountOverflow, 0, 0));
    Log(line);
    for (unsigned index = 0; index < used; ++index) {
        sprintf_s(line, "  caller=0x%llx moveType=%u count=%ld",
            static_cast<unsigned long long>(copy[index].caller), copy[index].moveType, copy[index].count);
        Log(line);
    }
}

// Worker: opens the log, checks the build, installs the hooks, then drains
// the queue every 100 ms and logs the player position and counts now and then.
DWORD WINAPI Run(void* address) {
    // Keep this DLL loaded for the life of the game, because hooks point into it.
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\teleport-observe.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    Log("Pywel Atlas combined v0.55 teleport observation - watch only: nothing is moved and no game function is called");

    auto* base = reinterpret_cast<BYTE*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    const auto* dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    const auto* pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported executable; no teleport observation hooks installed.");
        return 0;
    }
    // (MinHook was initialized once by PywelAtlas.cpp before this part started.)
    InstallHooks(base);

    ULONGLONG nextPosition = 0;
    ULONGLONG nextCounts = GetTickCount64() + 30000;
    LONG loggedDrops = 0;
    Event batch[_countof(queue)];
    for (;;) {
        unsigned count = 0;
        AcquireSRWLockExclusive(&queueLock);
        count = queueCount;
        memcpy(batch, queue, count * sizeof(Event));
        queueCount = 0;
        ReleaseSRWLockExclusive(&queueLock);
        for (unsigned index = 0; index < count; ++index) {
            LogEvent(batch[index]);
        }
        ULONGLONG now = GetTickCount64();
        LONG drops = InterlockedCompareExchange(&droppedEvents, 0, 0);
        if (drops != loggedDrops) {
            char line[96];
            sprintf_s(line, "dropped events so far: %ld", drops);
            Log(line);
            loggedDrops = drops;
        }
        if (now >= nextPosition) {
            // A position line every 5 s puts the player's movement between events.
            float xyz[3] = {};
            DWORD thread = 0;
            ULONGLONG tick = 0;
            if (PywelGetMinimapPlayer(xyz, thread, tick)) {
                char line[160];
                sprintf_s(line, "t=%llu player=(%.2f, %.2f, %.2f) minimapThread=%lu age=%llums",
                    now, xyz[0], xyz[1], xyz[2], thread, now - tick);
                Log(line);
            }
            nextPosition = now + 5000;
        }
        if (now >= nextCounts) {
            LogRequestCounts();
            nextCounts = now + 30000;
        }
        Sleep(100);
    }
}

} // namespace

// Combined build: started by src/pywel-atlas/PywelAtlas.cpp after MinHook is
// initialized.
DWORD WINAPI PywelTeleportObserveRun(void* address) {
    return Run(address);
}
