// =============================================================================
// Pywel Atlas - save-detection observation probe (NativeSaveLoadProbe.cpp)
// =============================================================================
//
// WHAT THIS FILE IS
//   The source for a small mod file (an ".asi") that the game loads at startup
//   through DMM. Its only job is to WATCH how Crimson Desert loads a save, and
//   write what it sees to a log file. It never changes the game.
//
// WHY IT EXISTS
//   The finished mod must know which account and which save slot is actually
//   loaded, so it can read the right save and show the right map markers.
//   This probe collects evidence about how to work that out safely.
//
// KEY IDEAS (plain-language definitions)
//   Hook        - We ask the game to call one of our functions first whenever it
//                 calls a particular game function. Our function copies a few
//                 values, then calls the real game function with exactly the
//                 same inputs and hands back exactly the same result. The game
//                 behaves as if we were not there. (The MinHook library does the
//                 redirecting.)
//   RVA         - "Relative virtual address": where something sits inside the
//                 game's .exe, counted from the start of the .exe in memory.
//                 Written as hex numbers like 0x186f570.
//   Guard bytes - The first 24 bytes of each game function we hook, copied from
//                 the installed .exe (see save-load-profile.h). If a game update
//                 changes them, the probe refuses to install anything.
//   vtable      - A hidden pointer at the start of a C++ object that says what
//                 type it is. We compare it with known values so we only read
//                 fields from objects whose type we are sure of.
//   Client/server actors - The game keeps two copies of the player: a "client"
//                 copy (what you see) and a "server" copy (the game rules and the
//                 loaded save). We need to prove they belong together.
//   User key    - A number (seen as 0x90100000) the game uses to look up the
//                 player's "user" record on each side. Both sides use the same
//                 key, which links them. It identifies the local player in one
//                 loaded world, NOT a particular save (it changes after a
//                 return to the title screen).
//   Load scope  - A number we give each save-load call, so the read, apply and
//                 finish steps of one load can be matched up.
//   Epoch / generation - A counter that goes up on every load, cleanup or lost
//                 record. Evidence from an older epoch no longer counts.
//   Queue drop  - If our small in-memory queue is busy or full, a record is
//                 thrown away and counted, rather than slowing the game down.
//
// HOW IT RUNS
//   1. When the game starts, DllMain starts our own "worker" thread (Run).
//   2. The worker checks the .exe is the exact supported version, checks every
//      guard, then installs the hooks.
//   3. Hooks run on the game's threads. They only copy small values into a
//      queue. They never write files or wait.
//   4. Every 30 ms the worker empties the queue, writes log lines, and matches
//      the evidence together (load chain, client/server link, selection).
//   5. Pressing F7 in the game writes a CHECKPOINT line and shows a popup on a
//      separate thread, so logging never stops while the popup is open.
//   6. While a selection exists, a separate low-priority "Bell reader" thread
//      reads that slot's save file (read-only) and counts completed Bells.
//      Each result carries the selection serial and is thrown away if the
//      selection changed meanwhile (section 5b).
//   7. When the game saves (hook on its save-to-slot function), a save by the
//      same loaded world moves the Bell reads to the slot just written, since
//      autosaves usually go to a different slot than the one loaded.
//   8. (v0.60) If the game set up its save storage before our start-up hook
//      was installed, the save folder is copied instead from the storage
//      object's file methods, which run on every save load and save.
//
// SAFETY RULES THIS FILE FOLLOWS
//   - Never loads saves, never calls game functions on its own, never writes
//     game data. Save files are only opened for reading. It only writes its
//     own log:
//     %LOCALAPPDATA%\PywelAtlas\native-save-detection.log
//     (development builds only, v0.129; the release build writes only the
//     version, start-up and error lines to pywel-atlas.log, ReleaseLog.h).
//   - F7 (the checkpoint popup) exists only in development builds
//     (PYWEL_ATLAS_DEV, defined by build.ps1 and build.ps1 -Test).
//   - Every hook passes all inputs through unchanged, returns the game's own
//     result, and preserves the Windows "last error" value.
//   - The worker and popup threads never follow (dereference) game pointers;
//     they only see copies made while the game objects were alive.
//   - Nothing here is trusted yet: every "trusted" flag in the log stays 0.
// =============================================================================

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
// The existing read-only Bell save reader, shared with src/marker-bell.
#include "../marker-bell/NativeSaveReader.h"
#ifdef PYWEL_ATLAS_COMBINED
// What this part tells the map-marker part in the combined mod.
#include "../pywel-atlas/LoadedSave.h"
// v0.129: the short player log (pywel-atlas.log) shared by all parts.
#include "../pywel-atlas/ReleaseLog.h"
#else
// The standalone probe build has no player log.
inline void PywelReleaseLog(const char*, ...) {}
#endif

namespace {

// =============================================================================
// 1. Native function types
// -----------------------------------------------------------------------------
// Each "using" line describes the exact inputs and output of one game function
// we hook, so we can call the real one with identical arguments. The comments
// use Windows x64 register names (RCX, RDX, R8, R9 = arguments 1-4; extra
// arguments go on the stack; RAX/AL = the result). "Opaque" means we do not
// know what the value is, so we just pass it along untouched.
// =============================================================================

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
// Statically inspected field-loading paths. All stack arguments are forwarded:
// 219d7f0 consumes a fifth byte and sixth pointer; 28f82a0 consumes two
// additional stack bytes. 294d5b0 consumes four integer/pointer arguments.
// 77a220 consumes RCX/RDX, returns AL. 7797f0 consumes RCX and XMM1 (float).
// (The float matters: replacing it with an integer would corrupt the call.)
using BeginFieldLoad = void* (*)(void*, void*, uintptr_t, uintptr_t, BYTE, uintptr_t);
using TransitionFieldSix = void* (*)(void*, void*, uintptr_t, uintptr_t, BYTE, BYTE);
using TransitionField = void* (*)(void*, void*, uintptr_t, uintptr_t);
using ResetClientLoading = BYTE (*)(void*, void*, uintptr_t, uintptr_t);
using UpdateLoadingController = void (*)(void*, float, uintptr_t, uintptr_t);
// 17ef9c0: actor resolver. RCX source actor, RDX output reference wrapper.
// Returns the wrapper pointer, NOT a status code.
using ResolveGameplayActor = void* (*)(void*, void*, uintptr_t, uintptr_t);
// ClientActorManager 8ae390 / ServerActorManager 2a82590 (virtual +0x30):
// RCX manager, RDX output reference wrapper, R8D tagged actor key. Neither
// consumes R9; it is forwarded opaquely. Both return the output wrapper.
using LookupUserActor = void* (*)(void*, void*, unsigned, uintptr_t);
// 186e450: save game data to a slot (counterpart of read 186f570). RCX
// manager, RDX result storage, R8D slot, R9 save object (its +a0 user and its
// own +60 ActorKey are logged by the game on failure). Callers also pass a
// fifth stack argument, forwarded opaquely. Returns result storage; its DWORD
// is zero on success.
using WriteSave = void* (*)(void*, void*, unsigned, void*, uintptr_t);
// v0.60: the Steam save storage object's file methods (function table
// 59840c0, slots 3-6: 2356e20, ef601b0 (slot 4 jumps there), 23571d0,
// 2357c60). Each is BYTE method(storage, request): RCX storage object, RDX
// file request. None reads R8/R9 before writing them, and none takes stack
// arguments; R8/R9 are still forwarded untouched. Result in AL.
using StorageFileMethod = BYTE (*)(void*, void*, uintptr_t, uintptr_t);

// =============================================================================
// 2. Shared state
// -----------------------------------------------------------------------------
// "original..." pointers: MinHook fills these in. Calling one runs the real
// game function (our hook calls it to pass the call through).
// =============================================================================

ReadSave originalRead = nullptr;
ApplySave originalApply = nullptr;
LoadSave originalLoad = nullptr;
CleanupContext originalCleanup = nullptr;
InitializeStorage originalStorage = nullptr;
BeginFieldLoad originalFieldBegin = nullptr;
ResetClientLoading originalClientReset = nullptr;
TransitionFieldSix originalFieldTransition = nullptr;
TransitionField originalFieldReload = nullptr;
UpdateLoadingController originalControllerUpdate = nullptr;
ResolveGameplayActor originalResolveActor = nullptr;
LookupUserActor originalClientLookup = nullptr;
LookupUserActor originalServerLookup = nullptr;
WriteSave originalWrite = nullptr;
// v0.60: the four storage file methods, in slot order 3, 4, 5, 6.
StorageFileMethod originalStorageUse[4] = {};
// Where the game's .exe starts in memory (RVA 0). Every RVA is added to this.
uintptr_t imageBase = 0;
// Our append-only log file, written by the worker thread only.
HANDLE logFile = INVALID_HANDLE_VALUE;
// Lock protecting the event queue below.
SRWLOCK eventLock = SRWLOCK_INIT;
// Count of records thrown away (queue busy or full).
volatile LONG dropped = 0;
// Running number given to each record, so log lines can be put in order.
volatile LONG nextSequence = 0;
// Observation epoch. Load and cleanup hooks advance it on the game thread;
// the worker advances it when records were dropped. Every event carries the
// epoch at capture, and change-only caches re-emit when it changes, so stale
// values cannot be resurrected into a later load generation.
volatile LONG epoch = 1;

// =============================================================================
// 3. Event records and the queue
// =============================================================================

// Which step a record describes. Most hooks produce a "Start" record before
// calling the game and an "End" record after it returns.
enum class Stage {
    ReadStart, ReadEnd, ApplyStart, ApplyEnd, LoadStart, LoadEnd,
    CleanupStart, CleanupEnd, StorageStart, StorageEnd,
    FieldBeginStart, FieldBeginEnd, ClientResetStart, ClientResetEnd,
    FieldTransitionStart, FieldTransitionEnd, FieldReloadStart, FieldReloadEnd,
    ControllerSnapshot, ActorLink, KeyLookup, WriteStart, WriteEnd,
    StorageUse };
// Correlation belongs to this synchronous native call chain only. Restoring
// outer scope handles nested loads; no thread-local game pointer is retained.
// (thread_local = each game thread has its own copy.)
thread_local LONG loadScope = 0;
thread_local unsigned scopeSlot = 0xffffffffu;

// One observation, copied while the game objects were still alive. The worker
// only ever reads these copies. Addresses inside are for the log only and are
// never followed by the worker.
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
    bool fieldFlagRead;
    BYTE fieldFlag;
    uintptr_t manager;
    uintptr_t selectedChild;
    bool selectedChildRead;
    uintptr_t controller;
    BYTE controllerPhase;
    BYTE previousControllerPhase;
    bool controllerPhaseRead;
    uintptr_t peerActor;
    uintptr_t peerVtable;
    uintptr_t resolvedManager;
    uintptr_t resolvedChild;
    BYTE resolvedValid;
    bool nativeLinkRead;
    LONG epoch;
    BYTE side; // KeyLookup only: 1 client manager, 2 server manager.
    unsigned lookupKey;
    unsigned actorKey; // Diagnostic +60 DWORD of an exact-typed actor.
    bool actorKeyRead;
    BYTE storageMethod; // StorageUse only: function-table slot 3-6.
    char fileName[64]; // StorageUse only: the request's file name (log only).
    char root[512];
};
// The queue: hooks add records here; the worker empties it every 30 ms.
Event pending[128] = {};
unsigned pendingCount = 0;

// Safely copies `size` bytes from a game address. Returns false instead of
// crashing if the memory cannot be read.
bool ReadMemory(uintptr_t address, void* output, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(),
        reinterpret_cast<const void*>(address), output, size, &read) && read == size;
}

// Copies the player actor's "field loading done" flag (+c3) and which actor
// its user record has selected (+d0), but only for actor types we recognise.
void CaptureFieldState(Event& event) {
    // Both child layouts are identified through RTTI. Their native shared
    // getters use c3/a0, but their client/server addresses are never equated.
    uintptr_t table = 0;
    event.fieldFlagRead = false;
    event.selectedChildRead = false;
    event.manager = 0;
    event.selectedChild = 0;
    if (!event.object || !ReadMemory(event.object, &table, sizeof(table)) ||
        (table != imageBase + 0x5b1e2b0 && table != imageBase + 0x5585c40)) {
        return;
    }
    event.fieldFlagRead = ReadMemory(event.object + 0xc3,
        &event.fieldFlag, sizeof(event.fieldFlag));
    uintptr_t managerTable = 0;
    if (ReadMemory(event.object + 0xa0, &event.manager, sizeof(event.manager)) &&
        event.manager && ReadMemory(event.manager, &managerTable, sizeof(managerTable)) &&
        (managerTable == imageBase + 0x5b257a8 || managerTable == imageBase + 0x55b59f0)) {
        event.selectedChildRead = ReadMemory(event.manager + 0xd0,
            &event.selectedChild, sizeof(event.selectedChild));
    }
}

// Adds a record to the queue without ever making the game wait.
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

// Starts a new record: numbers it, stamps the thread/time/caller, and copies
// the object's type (vtable) and basic state.
Event Begin(Stage stage, uintptr_t caller, uintptr_t object, unsigned slot) {
    Event event = {};
    event.stage = stage;
    event.sequence = InterlockedIncrement(&nextSequence);
    event.thread = GetCurrentThreadId();
    event.tick = GetTickCount64();
    // Record who called the game function, as an RVA (0 if outside the .exe).
    event.callerRva = caller >= imageBase && caller - imageBase < kLoadImageSize
        ? caller - imageBase
        : 0;
    event.object = object;
    event.requestedSlot = slot;
    event.scope = loadScope;
    event.droppedAtCapture = InterlockedCompareExchange(&dropped, 0, 0);
    event.epoch = InterlockedCompareExchange(&epoch, 0, 0);
    // The storage object is not a game entity, so its +5e is not sampled.
    if (object && stage != Stage::StorageStart && stage != Stage::StorageUse) {
        uintptr_t table = 0;
        if (ReadMemory(object, &table, sizeof(table)) && table >= imageBase &&
            table - imageBase < kLoadImageSize) {
            event.vtableRva = table - imageBase;
        }
        // Raw entity lifecycle bits, not a world-ready claim. +60 was an
        // unrelated identity in v0.33 and is deliberately no longer sampled.
        event.lifecycleRead = ReadMemory(object + 0x5e,
            &event.lifecycleBits, sizeof(event.lifecycleBits));
    }
    CaptureFieldState(event);
    return event;
}

// Completes a record after the game function returned: copies its result code
// and the object's updated state, then queues it.
void Finish(Event& event, Stage stage, void* result) {
    event.stage = stage;
    event.tick = GetTickCount64();
    event.statusRead = ReadMemory(reinterpret_cast<uintptr_t>(result),
        &event.status, sizeof(event.status));
    event.lifecycleRead = event.object && ReadMemory(event.object + 0x5e,
        &event.lifecycleBits, sizeof(event.lifecycleBits));
    event.droppedAtCapture = InterlockedCompareExchange(&dropped, 0, 0);
    CaptureFieldState(event);
    Queue(event);
}

// Many game "wrapper" objects keep the real object at offset +8; this reads it.
uintptr_t WrappedObject(void* wrapper) {
    uintptr_t object = 0;
    if (wrapper) {
        ReadMemory(reinterpret_cast<uintptr_t>(wrapper) + 8, &object, sizeof(object));
    }
    return object;
}

// =============================================================================
// 4. Hook callbacks
// -----------------------------------------------------------------------------
// Every hook follows the same pattern:
//   save Windows' last-error value -> copy a few values -> restore last-error
//   -> call the real game function with the same arguments -> copy results
//   -> restore the game's last-error value -> return the game's own result.
// =============================================================================

// Hook for 219d7f0: a "field ready" step during world loading. Also records
// the actor passed as the 4th argument. (The name "FieldBegin" is a legacy
// label; it is not proof of when loading starts.)
void* ObserveFieldBegin(void* component, void* result, uintptr_t context,
    uintptr_t actor, BYTE flag, uintptr_t extra) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::FieldBeginStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        WrappedObject(component), 0xffffffffu);
    event.peerActor = actor;
    uintptr_t peerTable = 0;
    if (ReadMemory(actor, &peerTable, sizeof(peerTable)) && peerTable >= imageBase &&
        peerTable - imageBase < kLoadImageSize) {
        event.peerVtable = peerTable - imageBase;
    }
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalFieldBegin(component, result, context, actor, flag, extra);
    DWORD originalError = GetLastError();
    Finish(event, Stage::FieldBeginEnd, returned);
    SetLastError(originalError);
    return returned;
}

// Hook for 17ef9c0: the game's "find the player actor for this actor" lookup.
// v0.37 proved it stays on one side (client->client, server->server), so it
// cannot link the two sides by itself. We still log the player's own lookups.
void* ObserveResolveActor(void* actor, void* result, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    SetLastError(incomingError);
    void* returned = originalResolveActor(actor, result, opaque3, opaque4);
    DWORD originalError = GetLastError();
    Event event = Begin(Stage::ActorLink, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(actor), 0xffffffffu);
    uintptr_t output = reinterpret_cast<uintptr_t>(returned);
    // This native getter returns a live reference wrapper, not DWORD status.
    // Its selected world actor can be passed to native 17ee020, which follows
    // a0 -> manager+d0. Copy that path without invoking any additional getter.
    bool wrapperRead = ReadMemory(output + 0x10, &event.resolvedValid, 1) &&
        ReadMemory(output + 8, &event.peerActor, sizeof(event.peerActor));
    uintptr_t table = 0;
    if (wrapperRead && event.resolvedValid == 1 && event.peerActor &&
        ReadMemory(event.peerActor, &table, sizeof(table)) && table >= imageBase &&
        table - imageBase < kLoadImageSize) {
        event.peerVtable = table - imageBase;
        uintptr_t managerTable = 0;
        uintptr_t childTable = 0;
        uintptr_t childManager = 0;
        // Follow peer -> its server user record -> that record's selected
        // server actor, checking each object's exact type on the way.
        if (ReadMemory(event.peerActor + 0xa0, &event.resolvedManager, sizeof(uintptr_t)) &&
            ReadMemory(event.resolvedManager, &managerTable, sizeof(uintptr_t)) &&
            managerTable == imageBase + 0x5b257a8 &&
            ReadMemory(event.resolvedManager + 0xd0, &event.resolvedChild, sizeof(uintptr_t)) &&
            ReadMemory(event.resolvedChild, &childTable, sizeof(uintptr_t)) &&
            childTable == imageBase + 0x5b1e2b0 &&
            ReadMemory(event.resolvedChild + 0xa0, &childManager, sizeof(uintptr_t)) &&
            childManager == event.resolvedManager) {
            event.nativeLinkRead = event.vtableRva == 0x5585c40;
        }
    }
    // v0.37 showed ~1000 non-player client/server actor sources alternating
    // through this resolver, which defeated the change-only cache and dropped
    // load records. Only exact child-actor sources are queued now; the others
    // resolved to the same side-local child and add no relationship evidence.
    bool childSource = event.vtableRva == 0x5585c40 || event.vtableRva == 0x5b1e2b0;
    if (childSource) {
        event.actorKeyRead = ReadMemory(event.object + 0x60,
            &event.actorKey, sizeof(event.actorKey));
    }
    // Native conditions can query every frame. Omit unchanged resolver output;
    // each changing association is still tied to a native call, never timing.
    thread_local uintptr_t previousActor = 0;
    thread_local uintptr_t previousPeer = 0;
    thread_local uintptr_t previousChild = 0;
    thread_local unsigned previousValid = 0xffffffffu;
    thread_local LONG previousEpoch = 0;
    if (childSource && (event.object != previousActor || event.peerActor != previousPeer ||
        event.resolvedChild != previousChild || event.resolvedValid != previousValid ||
        event.epoch != previousEpoch)) {
        Queue(event);
        previousActor = event.object;
        previousPeer = event.peerActor;
        previousChild = event.resolvedChild;
        previousValid = event.resolvedValid;
        previousEpoch = event.epoch;
    }
    SetLastError(originalError);
    return returned;
}

// Remembers the last user-key result per side (index 0 = client, 1 = server),
// so the same answer is only logged once per epoch.
// Per-side change cache for user-key lookups. The lock is only try-acquired;
// contention emits a duplicate record rather than blocking or missing a change.
struct KeyCache {
    SRWLOCK lock;
    LONG epoch;
    unsigned key;
    uintptr_t user;
    uintptr_t child;
    BYTE valid;
};
KeyCache keyCaches[2] = {
    {SRWLOCK_INIT, 0, 0, 0, 0, 0xff},
    {SRWLOCK_INIT, 0, 0, 0, 0, 0xff}};

// Shared body of the two user-key hooks below. When the resolver asks a
// side's actor manager "which user record has this key?", we copy the key,
// the user record found, which actor it has selected, and the key stored in
// the user record itself (+60).
void* ObserveKeyLookup(BYTE side, void* manager, void* result, unsigned key,
    uintptr_t opaque4, uintptr_t caller) {
    LookupUserActor original = side == 1 ? originalClientLookup : originalServerLookup;
    // Only the resolver's registry call (17efaa0, returning to 17efaa3) is
    // sampled. All other actor lookups pass through without any memory read.
    if (caller != imageBase + 0x17efaa3) {
        return original(manager, result, key, opaque4);
    }
    DWORD incomingError = GetLastError();
    SetLastError(incomingError);
    void* returned = original(manager, result, key, opaque4);
    DWORD originalError = GetLastError();
    uintptr_t output = reinterpret_cast<uintptr_t>(returned);
    BYTE valid = 0;
    uintptr_t user = 0;
    uintptr_t table = 0;
    uintptr_t child = 0;
    // The user record must be exactly ClientUserActor (client) or
    // ServerUserActor (server), checked by its vtable.
    uintptr_t expected = imageBase + (side == 1 ? 0x55b59f0 : 0x5b257a8);
    bool exactUser = ReadMemory(output + 0x10, &valid, 1) && valid == 1 &&
        ReadMemory(output + 8, &user, sizeof(user)) && user &&
        ReadMemory(user, &table, sizeof(table)) && table == expected;
    if (exactUser) {
        ReadMemory(user + 0xd0, &child, sizeof(child));
    }
    // Only queue a record if something changed since the last one.
    LONG currentEpoch = InterlockedCompareExchange(&epoch, 0, 0);
    KeyCache& cache = keyCaches[side - 1];
    bool changed = true;
    if (TryAcquireSRWLockExclusive(&cache.lock)) {
        changed = cache.epoch != currentEpoch || cache.key != key || cache.user != user ||
            cache.child != child || cache.valid != valid;
        cache.epoch = currentEpoch;
        cache.key = key;
        cache.user = user;
        cache.child = child;
        cache.valid = valid;
        ReleaseSRWLockExclusive(&cache.lock);
    }
    if (changed) {
        Event event = Begin(Stage::KeyLookup, caller, exactUser ? user : 0, 0xffffffffu);
        event.side = side;
        event.lookupKey = key;
        event.resolvedValid = valid;
        event.peerActor = user;
        event.resolvedManager = reinterpret_cast<uintptr_t>(manager);
        event.resolvedChild = child;
        if (exactUser) {
            event.actorKeyRead = ReadMemory(user + 0x60,
                &event.actorKey, sizeof(event.actorKey));
        }
        Queue(event);
    }
    SetLastError(originalError);
    return returned;
}

// Hook for 8ae390: the client-side actor manager's user lookup.
void* ObserveClientLookup(void* manager, void* result, unsigned key, uintptr_t opaque4) {
    return ObserveKeyLookup(1, manager, result, key, opaque4,
        reinterpret_cast<uintptr_t>(_ReturnAddress()));
}

// Hook for 2a82590: the server-side actor manager's user lookup.
void* ObserveServerLookup(void* manager, void* result, unsigned key, uintptr_t opaque4) {
    return ObserveKeyLookup(2, manager, result, key, opaque4,
        reinterpret_cast<uintptr_t>(_ReturnAddress()));
}

// Hook for 77a220: an early loading step that resets the client actor's
// "field loading done" flag. Early in loading, not a sign loading finished.
BYTE ObserveClientReset(void* controller, void* object, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::ClientResetStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(object), 0xffffffffu);
    Queue(event);
    SetLastError(incomingError);
    BYTE returned = originalClientReset(controller, object, opaque3, opaque4);
    DWORD originalError = GetLastError();
    event.stage = Stage::ClientResetEnd;
    event.tick = GetTickCount64();
    event.statusRead = true;
    event.status = returned; // AL boolean, not a DWORD result pointer.
    event.droppedAtCapture = InterlockedCompareExchange(&dropped, 0, 0);
    CaptureFieldState(event);
    Queue(event);
    SetLastError(originalError);
    return returned;
}

// Hook for 28f82a0: a world/field transition step. Takes six arguments; the
// two extra byte arguments must be passed through.
void* ObserveFieldTransition(void* object, void* result, uintptr_t context,
    uintptr_t extra, BYTE flag5, BYTE flag6) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::FieldTransitionStart,
        reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(object), 0xffffffffu);
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalFieldTransition(object, result, context, extra, flag5, flag6);
    DWORD originalError = GetLastError();
    Finish(event, Stage::FieldTransitionEnd, returned);
    SetLastError(originalError);
    return returned;
}

// Takes a snapshot of the loading controller: its current loading phase
// (+15c; phase 24 = loading sequence finished) and its client player actor.
Event ControllerState(void* controller) {
    uintptr_t address = reinterpret_cast<uintptr_t>(controller);
    uintptr_t component = 0;
    uintptr_t object = 0;
    // The native update obtains the current child through controller+b8,+50.
    // No game getter is called by this observer, and the worker receives only
    // copied values. Object field reads still require the exact actor vtable.
    if (ReadMemory(address + 0xb8, &component, sizeof(component)) && component) {
        ReadMemory(component + 0x50, &object, sizeof(object));
    }
    Event event = Begin(Stage::ControllerSnapshot, 0, object, 0xffffffffu);
    event.controller = address;
    event.controllerPhaseRead = ReadMemory(address + 0x15c,
        &event.controllerPhase, sizeof(event.controllerPhase));
    return event;
}

// Hook for 7797f0: the loading controller's per-frame update. Its second
// argument is a float (elapsed time) and must stay a float.
void ObserveControllerUpdate(void* controller, float elapsed, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    BYTE before = 0;
    bool beforeRead = ReadMemory(reinterpret_cast<uintptr_t>(controller) + 0x15c,
        &before, sizeof(before));
    SetLastError(incomingError);
    originalControllerUpdate(controller, elapsed, opaque3, opaque4);
    DWORD originalError = GetLastError();
    Event event = ControllerState(controller);
    event.previousControllerPhase = before;
    // This update is per frame. Queue changes only; no file I/O or retained
    // game pointer is used for asynchronous memory reads. Repeated same-phase
    // frames are omitted, never used as an inferred readiness timer.
    thread_local uintptr_t lastController = 0;
    thread_local uintptr_t lastObject = 0;
    thread_local unsigned lastPhase = 0xffffffffu;
    thread_local unsigned lastFlag = 0xffffffffu;
    thread_local LONG lastEpoch = 0;
    unsigned phase = event.controllerPhaseRead ? event.controllerPhase : 0xffffffffu;
    unsigned flag = event.fieldFlagRead ? event.fieldFlag : 0xffffffffu;
    if (event.controller != lastController || event.object != lastObject ||
        phase != lastPhase || flag != lastFlag || (beforeRead && before != phase) ||
        event.epoch != lastEpoch) {
        Queue(event);
        lastController = event.controller;
        lastObject = event.object;
        lastPhase = phase;
        lastFlag = flag;
        lastEpoch = event.epoch;
    }
    SetLastError(originalError);
}

// Hook for 294d5b0: a field reload step.
void* ObserveFieldReload(void* wrapper, void* result, uintptr_t context, uintptr_t extra) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::FieldReloadStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        WrappedObject(wrapper), 0xffffffffu);
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalFieldReload(wrapper, result, context, extra);
    DWORD originalError = GetLastError();
    Finish(event, Stage::FieldReloadEnd, returned);
    SetLastError(originalError);
    return returned;
}

// Hook for 186f570: the game reads a save slot from disk. Records the slot
// number requested and whether the read succeeded (result 0 = success).
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

// Hook for 186e450: the game saves game data to a slot (autosave or manual
// save). Records the slot it writes, the save object, and whether the write
// succeeded (result 0 = success). It does not change the epoch: saving does
// not replace the loaded world.
void* ObserveWrite(void* manager, void* result, unsigned slot, void* object, uintptr_t extra) {
    DWORD incomingError = GetLastError();
    Event event = Begin(Stage::WriteStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        reinterpret_cast<uintptr_t>(object), slot);
    // For the known server child type, also copy its +60 key (the game's own
    // failure message calls it ActorKey).
    if (event.vtableRva == 0x5b1e2b0) {
        event.actorKeyRead = ReadMemory(event.object + 0x60, &event.actorKey, sizeof(event.actorKey));
    }
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalWrite(manager, result, slot, object, extra);
    DWORD originalError = GetLastError();
    Finish(event, Stage::WriteEnd, returned);
    SetLastError(originalError);
    return returned;
}

// Hook for 2941020: the game applies the save it just read to the world.
void* ObserveApply(void* wrapper, void* result, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    uintptr_t object = 0;
    if (wrapper) {
        ReadMemory(reinterpret_cast<uintptr_t>(wrapper) + 8, &object, sizeof(object));
    }
    Event event = Begin(Stage::ApplyStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        object, scopeSlot);
    Queue(event);
    SetLastError(incomingError);
    void* returned = originalApply(wrapper, result, opaque3, opaque4);
    DWORD originalError = GetLastError();
    Finish(event, Stage::ApplyEnd, returned);
    SetLastError(originalError);
    return returned;
}

// Hook for 1042aaf0: the outer "load this slot" call that contains the read
// and apply steps. Starts a new load scope and a new epoch.
void* ObserveLoad(void* wrapper, void* result, uintptr_t context, unsigned slot) {
    DWORD incomingError = GetLastError();
    uintptr_t object = 0;
    if (wrapper) {
        ReadMemory(reinterpret_cast<uintptr_t>(wrapper) + 8, &object, sizeof(object));
    }
    InterlockedIncrement(&epoch); // New load generation; carried by load-start.
    Event event = Begin(Stage::LoadStart, reinterpret_cast<uintptr_t>(_ReturnAddress()),
        object, slot);
    // Remember the outer scope so a nested load restores it afterwards.
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

// Hook for 206b750: the game cleans up (unloads) an actor context, e.g. when
// returning to the title screen or loading another save.
uintptr_t ObserveCleanup(void* manager, void* object, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    // Conservative: any context cleanup invalidates cached associations.
    InterlockedIncrement(&epoch);
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

// Copies the save folder path (e.g. ".../CD/save/60062761") out of the game's
// Steam storage object, character by character, stopping at bad data.
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

// Hook for ef62160: Steam save storage start-up. Records success (1) and the
// account save folder the game uses.
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

// -----------------------------------------------------------------------------
// v0.60: storage file methods (start-up race fallback)
// -----------------------------------------------------------------------------
// In one session the game started its save storage before our start-up hook
// (ef62160) was installed, so the save folder ("storage root") was never
// copied and no selection could form. The storage object's file methods run
// on every save load and save, so they give a second chance to copy the same
// root. They are watch-only: inputs are forwarded unchanged and the game's
// own result is returned. Nothing here calls a game function on its own.

// Hook-side throttle: these methods can run many times per load (one call per
// file), so an event is queued only when the root or the epoch differs from
// the last event of the same method. A busy lock simply skips the event: the
// thread holding it is queuing the same information. Without this, a burst
// could fill the queue, and a queue drop starts a new epoch (and so retires
// the selection).
SRWLOCK storageUseLock = SRWLOCK_INIT;
LONG storageUseEpoch[4] = {}; // Epoch of the last queued event, per method.
unsigned storageUseHash[4] = {}; // Root fingerprint of that event, per method.

// A short fingerprint of a root path (FNV-1a hash), so the throttle can compare
// roots without keeping four 512-byte copies. 0 means "root not copied".
unsigned RootFingerprint(const Event& event) {
    if (!event.rootRead) {
        return 0;
    }
    unsigned hash = 2166136261u;
    for (const char* character = event.root; *character; ++character) {
        hash = (hash ^ static_cast<unsigned char>(*character)) * 16777619u;
    }
    return hash ? hash : 1;
}

// Decides whether this method's event is new enough to queue (see above).
bool ShouldQueueStorageUse(unsigned method, const Event& event) {
    if (!TryAcquireSRWLockExclusive(&storageUseLock)) {
        return false;
    }
    unsigned index = method - 3;
    unsigned fingerprint = RootFingerprint(event);
    bool changed = storageUseEpoch[index] != event.epoch || storageUseHash[index] != fingerprint;
    if (changed) {
        storageUseEpoch[index] = event.epoch;
        storageUseHash[index] = fingerprint;
    }
    ReleaseSRWLockExclusive(&storageUseLock);
    return changed;
}

// Copies the file name of a storage request for the log: inline text at
// request +28, or a longer heap copy whose pointer is at +b0 (as all four
// methods build their "<root>/<file>" path). Diagnostic only, never used for
// a decision; anything that is not plain printable text is dropped.
void CopyRequestFileName(uintptr_t request, char (&text)[64]) {
    text[0] = 0;
    uintptr_t heap = 0;
    if (!request || !ReadMemory(request + 0xb0, &heap, sizeof(heap))) {
        return;
    }
    uintptr_t start = heap ? heap : request + 0x28;
    for (size_t index = 0; index + 1 < sizeof(text); ++index) {
        char character = 0;
        if (!ReadMemory(start + index, &character, 1) ||
            (character && (character < 0x20 || character > 0x7e))) {
            text[0] = 0;
            return;
        }
        text[index] = character;
        if (!character) {
            return;
        }
    }
    text[sizeof(text) - 1] = 0;
}

// Shared body of the four storage file-method hooks. `method` is the
// function-table slot (3-6), `caller` the hook's return address. The root is
// copied BEFORE the game call, while the storage object is certainly live.
BYTE ObserveStorageUse(unsigned method, StorageFileMethod original, uintptr_t caller,
    void* storage, void* request, uintptr_t opaque3, uintptr_t opaque4) {
    DWORD incomingError = GetLastError();
    // Only the exact Steam storage type (function table 59840c0) is read.
    uintptr_t table = 0;
    uintptr_t object = reinterpret_cast<uintptr_t>(storage);
    if (ReadMemory(object, &table, sizeof(table)) && table == imageBase + 0x59840c0) {
        Event event = Begin(Stage::StorageUse, caller, object, 0xffffffffu);
        event.vtableRva = 0x59840c0;
        event.storageMethod = static_cast<BYTE>(method);
        event.rootRead = CopyStorageRoot(object, event.root);
        CopyRequestFileName(reinterpret_cast<uintptr_t>(request), event.fileName);
        if (ShouldQueueStorageUse(method, event)) {
            Queue(event);
        }
    }
    SetLastError(incomingError);
    BYTE returned = original(storage, request, opaque3, opaque4);
    DWORD originalError = GetLastError();
    SetLastError(originalError);
    return returned;
}

// Hook for 2356e20 (storage slot 3): builds a file path and opens it.
BYTE ObserveStorageSlot3(void* storage, void* request, uintptr_t opaque3, uintptr_t opaque4) {
    return ObserveStorageUse(3, originalStorageUse[0], reinterpret_cast<uintptr_t>(_ReturnAddress()),
        storage, request, opaque3, opaque4);
}

// Hook for ef601b0 (storage slot 4, reached through a jump at 2356f40): read
// or recover a save file ("[SaveData] restore failed" on failure).
BYTE ObserveStorageSlot4(void* storage, void* request, uintptr_t opaque3, uintptr_t opaque4) {
    return ObserveStorageUse(4, originalStorageUse[1], reinterpret_cast<uintptr_t>(_ReturnAddress()),
        storage, request, opaque3, opaque4);
}

// Hook for 23571d0 (storage slot 5): read or recover a save file.
BYTE ObserveStorageSlot5(void* storage, void* request, uintptr_t opaque3, uintptr_t opaque4) {
    return ObserveStorageUse(5, originalStorageUse[2], reinterpret_cast<uintptr_t>(_ReturnAddress()),
        storage, request, opaque3, opaque4);
}

// Hook for 2357c60 (storage slot 6): writes the request's buffer to a file.
BYTE ObserveStorageSlot6(void* storage, void* request, uintptr_t opaque3, uintptr_t opaque4) {
    return ObserveStorageUse(6, originalStorageUse[3], reinterpret_cast<uintptr_t>(_ReturnAddress()),
        storage, request, opaque3, opaque4);
}

// =============================================================================
// 5. Worker: logging, correlation and the diagnostic selection
// -----------------------------------------------------------------------------
// Everything from here down runs on our own worker thread, never on the
// game's threads, and works only on copied records.
// =============================================================================

// Writes one line to the log file and flushes it straight to disk.
void Log(const char* text) {
    DWORD written = 0;
    if (logFile != INVALID_HANDLE_VALUE) {
        WriteFile(logFile, text, static_cast<DWORD>(strlen(text)), &written, nullptr);
        WriteFile(logFile, "\r\n", 2, &written, nullptr);
        FlushFileBuffers(logFile);
    }
}

// Worker-owned loaded-save selection: an immutable snapshot formed only from a
// matched boundary in the current epoch plus a validated Steam account root.
// The diagnostic Bell reader (section 5b) tags each read with `serial` and
// discards results whose serial is no longer active. Actor addresses are
// diagnostic copies and are never dereferenced. Still diagnostic: nothing
// changes markers from it, and the trusted-state flags remain zero.
// (In short: "which account and slot we think is loaded", plus when we decided.)
struct Selection {
    bool active;
    unsigned serial;
    LONG generation;
    LONG loadScope;
    unsigned slot;
    unsigned userKey;
    uintptr_t serverChild;
    uintptr_t clientChild;
    char account[24];
    char root[512];
    // v0.60: true when `root` came from a storage file method because the
    // start-up record was missing or unreadable (log: rootSource=use).
    bool rootFromUse;
    // Save writes linked to this selection (v0.42). `readSlot` starts as the
    // loaded slot and follows each successful write by the same server child,
    // because the game can save the loaded world to a different slot.
    unsigned readSlot;
    unsigned linkedWrites;
};

// Everything the worker has learned so far: counts, the latest record of each
// kind, and the current match results.
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
    // v0.60: storage file-method events (throttled) and the latest one whose
    // root was copied. Used only when the start-up record is missing.
    unsigned storageUses;
    Event lastStorageUse;
    bool correlatedCandidate;
    unsigned clientResets;
    unsigned fieldBegins;
    unsigned fieldTransitions;
    unsigned fieldReloads;
    Event lastClientReset;
    Event lastController;
    unsigned controllerChanges;
    Event lastActorLink;
    unsigned actorLinks;
    LONG chainDrops;
    bool clientBoundaryCandidate;
    LONG generation; // Latest observation epoch the worker has accepted.
    unsigned keyLookups;
    Event lastClientKey;
    Event lastServerKey;
    bool keyIdentityMatch;
    Selection selection;
    unsigned selectionSerial;
    LONG withheldGeneration; // Generation whose withheld reason was logged.
    unsigned saveWrites; // Completed save-write calls seen (any object).
    Event lastWrite;
    // Diagnostic Bell reads (see section 5b).
    unsigned watchSerial; // Selection serial the file watch below belongs to.
    unsigned watchSlot; // Slot the watch path points at.
    unsigned watchWrites; // selection.linkedWrites when the watch was last updated.
    wchar_t watchPath[700]; // That selection's slot<N>\save.save path.
    FILETIME watchModified; // File time when the last read was requested.
    unsigned watchRetries; // Retries used after failed reads for watchSerial.
    unsigned bellRequests;
    unsigned bellAccepted;
    unsigned bellStale;
    unsigned bellFailed;
    bool bellValid; // True once a read for the current selection was accepted.
    unsigned bellSerial; // Selection serial of the accepted result below.
    unsigned bellSlot;
    NativeSaveSummary bell; // Latest accepted result.
};

// Tracks one load in progress: did its read succeed, then its apply, for the
// same object and slot?
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

// True for slot numbers the game itself accepts (0-3, 100-108, 200-207).
bool SupportedSlot(unsigned slot) {
    return slot <= 3 || (slot >= 100 && slot <= 108) || (slot >= 200 && slot <= 207);
}

// Re-checks whether all the evidence lines up for "this client player belongs
// to the save that was just loaded" (the late boundary).
// v0.37 runtime showed resolver 17ef9c0 is side-local, so its client result
// can never name the server child. v0.38 runtime showed both side-specific
// registries queried with the identical full user key (0x90100000), and both
// user actors storing that key at +60. The match therefore requires full-key
// equality and each user's own +60 equal to that key; a masked 20-bit index
// is not used (it is 0 for this key and would match unrelated keys). The key
// is a local-user identity, not a save identity; v0.39 showed it changes when
// the world is rebuilt after a title return. Every component must
// carry the current epoch; millisecond ticks are not used for ordering.
void RefreshBoundary(Summary& summary) {
    const Event& controller = summary.lastController;
    const Event& client = summary.lastClientKey;
    const Event& server = summary.lastServerKey;
    LONG current = summary.generation;
    // Step 1: client and server user records share the same key.
    // object is set only for an exact ClientUserActor / ServerUserActor result.
    summary.keyIdentityMatch = client.resolvedValid == 1 && server.resolvedValid == 1 &&
        client.object && server.object && client.epoch == current && server.epoch == current &&
        client.lookupKey == server.lookupKey &&
        client.actorKeyRead && client.actorKey == client.lookupKey &&
        server.actorKeyRead && server.actorKey == server.lookupKey;
    // Step 2: plus a successful load, loading finished (phase 24, flag 1), the
    // client user selects the controller's actor, the server user selects the
    // loaded actor, and no records were lost along the way.
    summary.clientBoundaryCandidate = summary.correlatedCandidate &&
        summary.lastLoad.epoch <= current && summary.keyIdentityMatch &&
        controller.epoch == current && controller.controllerPhaseRead &&
        controller.controllerPhase == 24 &&
        controller.fieldFlagRead && controller.fieldFlag == 1 &&
        controller.selectedChildRead && controller.selectedChild == controller.object &&
        client.resolvedChild == controller.object &&
        server.resolvedChild == summary.lastLoad.object &&
        controller.droppedAtCapture == summary.chainDrops &&
        client.droppedAtCapture == summary.chainDrops &&
        server.droppedAtCapture == summary.chainDrops;
}

// Takes one record from the queue and updates the summary: counts it, links
// read/apply/load steps of the same load, and logs match results.
void Correlate(const Event& event, Summary& summary) {
    // Load/cleanup hooks and the worker's drop handling advance the epoch; any
    // record captured later reveals it, so older associations stop qualifying
    // even when queue order differs from capture order across threads.
    if (event.epoch > summary.generation) {
        summary.generation = event.epoch;
        // Recheck the boundary right away. Otherwise its cached "matched"
        // result from the old generation lingers until the next key lookup
        // or controller snapshot, and UpdateSelection could re-form a
        // selection from stale evidence (seen in the v0.39 title teardown).
        RefreshBoundary(summary);
    }
    if (event.stage == Stage::ActorLink) {
        ++summary.actorLinks;
        summary.lastActorLink = event;
    }
    if (event.stage == Stage::KeyLookup) {
        ++summary.keyLookups;
        (event.side == 1 ? summary.lastClientKey : summary.lastServerKey) = event;
        RefreshBoundary(summary);
        char line[384];
        sprintf_s(line, "KEY_LINK seq=%ld side=%s key=0x%08x user=0x%llx userVtable=0x%llx valid=%u userKeyRead=%u userKey=0x%08x selectedChild=0x%llx epoch=%ld generation=%ld keyMatch=%u drops=%ld",
            event.sequence, event.side == 1 ? "client" : "server", event.lookupKey,
            static_cast<unsigned long long>(event.peerActor),
            static_cast<unsigned long long>(event.vtableRva), static_cast<unsigned>(event.resolvedValid),
            event.actorKeyRead ? 1u : 0u, event.actorKey,
            static_cast<unsigned long long>(event.resolvedChild), event.epoch, summary.generation,
            summary.keyIdentityMatch ? 1u : 0u, event.droppedAtCapture);
        Log(line);
    }
    // Any newly observed loading operation requires fresh boundary evidence.
    // Do not reinterpret an in-memory retry as a new disk-slot read.
    if (event.stage == Stage::LoadStart || event.stage == Stage::FieldBeginStart ||
        event.stage == Stage::FieldTransitionStart || event.stage == Stage::FieldReloadStart ||
        (event.stage == Stage::ControllerSnapshot &&
            (!event.controllerPhaseRead || event.controllerPhase != 24))) {
        summary.clientBoundaryCandidate = false;
    }
    if (event.stage == Stage::ClientResetEnd) {
        ++summary.clientResets;
        summary.lastClientReset = event;
    }
    if (event.stage == Stage::ControllerSnapshot) {
        ++summary.controllerChanges;
        summary.lastController = event;
        RefreshBoundary(summary);
        char line[256];
        sprintf_s(line, "CLIENT_BOUNDARY seq=%ld loadScope=%ld slot=%u matched=%u worldReadyTrusted=0 accountTrusted=0",
            event.sequence, summary.lastLoad.scope, summary.lastLoad.requestedSlot,
            summary.clientBoundaryCandidate ? 1u : 0u);
        Log(line);
    }
    // A new load starts: open a tracking record for it.
    if (event.stage == Stage::LoadStart) {
        summary.lastActorLink = {};
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
    // The loaded save's actor is being unloaded: forget it.
    if (event.stage == Stage::CleanupStart && event.object == summary.lastLoad.object) {
        summary.lastActorLink = {};
        summary.correlatedCandidate = false;
        summary.clientBoundaryCandidate = false;
        Log("Last load object entered context cleanup; diagnostic candidate cleared.");
    }
    // Read / apply / load-end records: update the matching load's tracking
    // record. A load is "correlated" only if read and apply both succeeded for
    // the same object and slot, the outer load succeeded, and nothing was lost.
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
                record.applySucceeded && !record.rejected &&
                record.initialDrops == event.droppedAtCapture;
            summary.chainDrops = event.droppedAtCapture;
            char line[192];
            sprintf_s(line, "LOAD_CHAIN scope=%ld slot=%u correlated=%u worldReadyTrusted=0 accountTrusted=0",
                event.scope, event.requestedSlot, summary.correlatedCandidate ? 1u : 0u);
            Log(line);
            record = {};
        }
        return;
    }
}

// Checks the save folder path the game reported. On success, copies the
// account number (the folder name) into `account`; on failure, sets `reason`.
// Accept only <LOCALAPPDATA>\Pearl Abyss\CD\save\<digits> exactly as reported
// by the game's own Steam storage handler, and require the loaded slot's save
// file to exist. Attribute queries only: nothing is opened, and existence is
// a consistency check, never a way to choose an account, slot or newest file.
bool ValidateAccountRoot(const char* root, unsigned slot, char (&account)[24],
    const char*& reason) {
    // Build the expected parent folder: <LOCALAPPDATA>\Pearl Abyss\CD\save\ .
    wchar_t base[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, base)) ||
        wcscat_s(base, L"\\Pearl Abyss\\CD\\save\\") != 0) {
        reason = "local-appdata-unavailable";
        return false;
    }
    // Convert the reported path to Windows form (UTF-16, backslashes).
    wchar_t path[600] = {};
    if (!MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, root, -1, path, _countof(path))) {
        reason = "root-not-utf8";
        return false;
    }
    for (wchar_t& character : path) {
        if (character == L'/') {
            character = L'\\';
        }
    }
    // It must sit directly inside the expected folder (case-insensitive).
    int baseLength = static_cast<int>(wcslen(base));
    if (static_cast<int>(wcslen(path)) <= baseLength ||
        CompareStringOrdinal(path, baseLength, base, baseLength, TRUE) != CSTR_EQUAL) {
        reason = "root-outside-save-folder";
        return false;
    }
    // The remaining part is the account folder name: digits only.
    const wchar_t* name = path + baseLength;
    size_t nameLength = wcslen(name);
    if (nameLength >= _countof(account)) {
        reason = "account-name-too-long";
        return false;
    }
    for (size_t index = 0; index < nameLength; ++index) {
        if (name[index] < L'0' || name[index] > L'9') {
            reason = "account-not-numeric";
            return false;
        }
        account[index] = static_cast<char>(name[index]);
    }
    account[nameLength] = 0;
    // The account folder, and slot<N>\save.save inside it, must exist.
    DWORD attributes = GetFileAttributesW(path);
    if (attributes == INVALID_FILE_ATTRIBUTES || !(attributes & FILE_ATTRIBUTE_DIRECTORY)) {
        reason = "account-folder-missing";
        return false;
    }
    wchar_t save[700] = {};
    swprintf_s(save, L"%ls\\slot%u\\save.save", path, slot);
    attributes = GetFileAttributesW(save);
    if (attributes == INVALID_FILE_ATTRIBUTES || (attributes & FILE_ATTRIBUTE_DIRECTORY)) {
        reason = "slot-save-missing";
        return false;
    }
    return true;
}

// Ends the current selection (if any) and logs why.
void RetireSelection(Summary& summary, const char* reason) {
    Selection& selection = summary.selection;
    if (!selection.active) {
        return;
    }
    char line[256];
    sprintf_s(line, "SELECTION retired serial=%u generation=%ld currentGeneration=%ld reason=%s",
        selection.serial, selection.generation, summary.generation, reason);
    Log(line);
    selection.active = false;
}

// Decides whether to start, keep or end the "which account and slot is
// loaded" selection.
// Activation and invalidation policy (diagnostic):
// - Forms when the matched boundary holds in the current generation and the
//   captured storage root validates (start-up record first; v0.60 falls back
//   to a storage file-method root). Each formation gets a new serial, even
//   for an identity equal to a retired one.
// - Retires on any generation change (load start, any context cleanup, queue
//   drop), a storage re-initialization with a different/unreadable root, or
//   (v0.60) a storage file method using a different root.
// - Is deliberately NOT retired by later loading stages or a phase below 24
//   alone: v0.36 showed death/retry reusing the loaded world without a disk
//   load or cleanup, so save identity outlives player-control transitions.
// - A re-formation in the same world (same load scope, server child and
//   root) keeps the retired record's last-saved read slot (v0.44).
void UpdateSelection(Summary& summary) {
    Selection& selection = summary.selection;
    if (selection.active && selection.generation != summary.generation) {
        RetireSelection(summary, "generation-changed");
    }
    if (selection.active || !summary.clientBoundaryCandidate) {
        return;
    }
    // Choose the save folder evidence (v0.60). The start-up record stays the
    // first choice. When it is missing or unreadable (start-up race), a root
    // copied by a storage file method this session is used instead, after the
    // same checks. If both exist and differ, nothing is chosen.
    const Event& startup = summary.lastStorage;
    const Event& use = summary.lastStorageUse;
    bool startupUsable = startup.rootRead && startup.status == 1;
    bool useUsable = use.rootRead;
    const char* root = nullptr;
    bool rootFromUse = false;
    const char* reason = "storage-root-unavailable";
    if (startupUsable && useUsable && strcmp(startup.root, use.root) != 0) {
        reason = "storage-root-conflict";
    } else if (startupUsable) {
        root = startup.root;
    } else if (useUsable) {
        root = use.root;
        rootFromUse = true;
    }
    char account[24] = {};
    bool valid = root &&
        ValidateAccountRoot(root, summary.lastLoad.requestedSlot, account, reason);
    if (!valid) {
        // Log the reason once per generation, not every 30 ms.
        if (summary.withheldGeneration != summary.generation) {
            summary.withheldGeneration = summary.generation;
            char line[256];
            sprintf_s(line, "SELECTION withheld generation=%ld loadScope=%ld slot=%u reason=%s",
                summary.generation, summary.lastLoad.scope, summary.lastLoad.requestedSlot, reason);
            Log(line);
        }
        return;
    }
    // All checks passed: record a new selection with a fresh serial number.
    // Keep a copy of the retired record: if this is the same world (same
    // load scope, server child and storage root, so no load happened in
    // between), the slot the game last saved to still holds its progress.
    // v0.43 showed unrelated cleanups during travel re-forming the selection
    // this way, which reset the read slot to the older loaded slot.
    const Selection previous = selection;
    bool sameWorld = previous.serial != 0 &&
        previous.loadScope == summary.lastLoad.scope &&
        previous.serverChild == summary.lastLoad.object &&
        strcmp(previous.root, root) == 0;
    selection = {};
    selection.active = true;
    selection.serial = ++summary.selectionSerial;
    selection.generation = summary.generation;
    selection.loadScope = summary.lastLoad.scope;
    selection.slot = summary.lastLoad.requestedSlot;
    selection.readSlot = selection.slot;
    selection.userKey = summary.lastServerKey.lookupKey;
    selection.serverChild = summary.lastLoad.object;
    selection.clientChild = summary.lastController.object;
    strcpy_s(selection.account, account);
    strcpy_s(selection.root, root);
    selection.rootFromUse = rootFromUse;
    if (sameWorld) {
        selection.readSlot = previous.readSlot;
        selection.linkedWrites = previous.linkedWrites;
    }
    char line[768];
    sprintf_s(line, "SELECTION formed serial=%u generation=%ld loadScope=%ld slot=%u readSlot=%u sameWorld=%u account=%s userKey=0x%08x serverChild=0x%llx clientChild=0x%llx rootSource=%s root=%s diagnostic=1 automaticLoadedSaveTrusted=0",
        selection.serial, selection.generation, selection.loadScope, selection.slot, selection.readSlot,
        sameWorld ? 1u : 0u, selection.account,
        selection.userKey, static_cast<unsigned long long>(selection.serverChild),
        static_cast<unsigned long long>(selection.clientChild),
        rootFromUse ? "use" : "startup", selection.root);
    Log(line);
}

// Decides whether a finished save write belongs to the active selection and,
// if so, points the selection's Bell reads at the slot that was written.
// Linked only when ALL hold: a selection is active; the write succeeded
// (result 0) for a save-file slot (0-3 or 100-108); the saved object is the exact server
// child type and the same (copied) address the selection's load produced; and
// the write was captured in the selection's generation (no load or cleanup in
// between). Addresses are compared as numbers and never dereferenced.
void LinkSaveWrite(const Event& event, Summary& summary) {
    ++summary.saveWrites;
    summary.lastWrite = event;
    Selection& selection = summary.selection;
    const char* reason = "linked";
    // Between a retirement and the next formation there is briefly no active
    // selection. A save by the same server child in that gap is kept on the
    // retired record, and is carried over only if the next selection turns
    // out to be the same world (see UpdateSelection).
    bool retiredSameObject = !selection.active && selection.serial != 0 &&
        event.object == selection.serverChild;
    if (!selection.active && !retiredSameObject) {
        reason = "no-selection";
    } else if (!event.statusRead || event.status != 0) {
        reason = "write-failed";
    } else if (!SupportedSlot(event.requestedSlot)) {
        reason = "unsupported-slot";
    } else if (event.requestedSlot >= 200) {
        // v0.42: every autosave also wrote slot 206 about 50 ms after the real
        // autosave slot, and no slot206 file exists. Only slots 0-3
        // (autosave) and 100-108 (manual) are save files we can read.
        reason = "instance-slot";
    } else if (event.vtableRva != 0x5b1e2b0 || event.object != selection.serverChild) {
        reason = "different-object";
    } else if (retiredSameObject) {
        reason = "linked-to-retired";
    } else if (event.epoch != selection.generation) {
        reason = "different-generation";
    }
    bool linked = strcmp(reason, "linked") == 0 || strcmp(reason, "linked-to-retired") == 0;
    if (linked) {
        selection.readSlot = event.requestedSlot;
        ++selection.linkedWrites;
    }
    char line[384];
    sprintf_s(line, "SAVE_WRITE seq=%ld slot=%u statusRead=%u status=%lu object=0x%llx vtableRva=0x%llx actorKeyRead=%u actorKey=0x%08x epoch=%ld callerRva=0x%llx linked=%u reason=%s selectionSerial=%u selectionActive=%u readSlot=%u",
        event.sequence, event.requestedSlot, event.statusRead ? 1u : 0u, event.status,
        static_cast<unsigned long long>(event.object), static_cast<unsigned long long>(event.vtableRva),
        event.actorKeyRead ? 1u : 0u, event.actorKey, event.epoch,
        static_cast<unsigned long long>(event.callerRva), linked ? 1u : 0u, reason,
        selection.serial, selection.active ? 1u : 0u,
        selection.serial ? selection.readSlot : 0xffffffffu);
    Log(line);
}

// =============================================================================
// 5b. Diagnostic Bell reads tied to the selection
// =============================================================================
//
// When a selection exists, a separate "Bell reader" thread reads that slot's
// save file (read-only) with the existing marker-bell reader and counts the
// Bells it records as completed.
// - Reading and decoding takes a while, so it runs on its own thread; the
//   worker keeps draining hook records meanwhile.
// - Every request carries the selection serial. A finished read only counts
//   if that same selection is still active; otherwise it is logged as stale
//   and thrown away.
// - Reads happen when a selection forms, on F7, and when the slot file's
//   last-modified time changes (for example after an autosave). A changed
//   time only triggers a re-read; it never counts as progress on its own.
// - The reader thread never touches game memory and writes no files; only the
//   worker writes log lines.

// One read request (a copy of the selection's identity).
struct BellRequest {
    unsigned serial;
    unsigned slot;
    char account[24];
    wchar_t folder[600];
    const char* trigger; // Why it was asked for (a constant string).
};

// One finished read, handed back to the worker.
struct BellResult {
    unsigned serial;
    unsigned slot;
    bool succeeded;
    NativeSaveSummary summary;
    FILETIME modified;
    char error[256];
    const char* trigger;
};

// Shared between the worker and the reader thread, guarded by bellLock.
// Only the newest request is kept: an older unstarted request is replaced.
SRWLOCK bellLock = SRWLOCK_INIT;
bool bellRequestPending = false;
BellRequest bellRequest = {};
bool bellResultReady = false;
BellResult bellResult = {};
HANDLE bellWake = nullptr; // Auto-reset event: "a new request is waiting".

// The reader thread: waits for a request, reads the save, posts the result.
DWORD WINAPI RunBellReader(void*) {
    // Lower priority so decoding never competes with the game for the CPU.
    SetThreadPriority(GetCurrentThread(), THREAD_PRIORITY_BELOW_NORMAL);
    while (true) {
        WaitForSingleObject(bellWake, INFINITE);
        while (true) {
            // Take the waiting request, if any.
            BellRequest request = {};
            AcquireSRWLockExclusive(&bellLock);
            bool have = bellRequestPending;
            if (have) {
                request = bellRequest;
                bellRequestPending = false;
            }
            ReleaseSRWLockExclusive(&bellLock);
            if (!have) {
                break;
            }
            // The slow part: read, check stability, decrypt and count Bells.
            BellResult result = {};
            result.serial = request.serial;
            result.slot = request.slot;
            result.trigger = request.trigger;
            result.succeeded = ReadBellSaveAt(request.folder, request.account, request.slot,
                result.summary, result.modified, result.error);
            // Hand it back. If the worker has not collected the previous
            // result yet, this newer one replaces it (the worker counts it).
            AcquireSRWLockExclusive(&bellLock);
            bellResult = result;
            bellResultReady = true;
            ReleaseSRWLockExclusive(&bellLock);
        }
    }
}

// Converts a selection root ("C:/Users/.../save/<digits>", UTF-8) into a
// Windows path with backslashes. Returns false if it cannot be converted.
bool WideFolder(const char* root, wchar_t (&folder)[600]) {
    if (!MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, root, -1, folder, _countof(folder))) {
        return false;
    }
    for (wchar_t& character : folder) {
        if (character == L'/') {
            character = L'\\';
        }
    }
    return true;
}

// Reads the slot file's last-modified time (an attribute query; the file is
// not opened). Returns a zero time if it is unavailable.
FILETIME SlotFileTime(const wchar_t* path) {
    WIN32_FILE_ATTRIBUTE_DATA data = {};
    if (!GetFileAttributesExW(path, GetFileExInfoStandard, &data)) {
        return {};
    }
    return data.ftLastWriteTime;
}

// Asks the reader thread to read the active selection's slot.
void RequestBellRead(Summary& summary, const char* trigger) {
    const Selection& selection = summary.selection;
    if (!selection.active) {
        return;
    }
    BellRequest request = {};
    request.serial = selection.serial;
    // The loaded slot, or the slot of the latest linked save write.
    request.slot = selection.readSlot;
    request.trigger = trigger;
    strcpy_s(request.account, selection.account);
    if (!WideFolder(selection.root, request.folder)) {
        Log("BELL_READ request skipped: selection root could not be converted.");
        return;
    }
    AcquireSRWLockExclusive(&bellLock);
    bellRequest = request;
    bellRequestPending = true;
    ReleaseSRWLockExclusive(&bellLock);
    SetEvent(bellWake);
    ++summary.bellRequests;
    // Remember the file time now, so the watch only re-reads after a newer write.
    summary.watchModified = SlotFileTime(summary.watchPath);
    char line[160];
    sprintf_s(line, "BELL_REQUEST serial=%u slot=%u trigger=%s", request.serial, request.slot, trigger);
    Log(line);
}

// Called by the worker every loop: starts reads for a new selection, re-reads
// when the slot file changes, and collects finished results.
// `pollFile` is true roughly every 3 seconds.
void UpdateBellReads(Summary& summary, bool pollFile) {
    const Selection& selection = summary.selection;
    // A result from an older or retired selection no longer describes the
    // loaded save.
    if (summary.bellValid && (!selection.active || selection.serial != summary.bellSerial ||
        selection.readSlot != summary.bellSlot)) {
        summary.bellValid = false;
    }
    // A new selection, or a linked save write: point the watch at the slot
    // to read and read it now.
    if (selection.active && (selection.serial != summary.watchSerial ||
        selection.readSlot != summary.watchSlot || selection.linkedWrites != summary.watchWrites)) {
        const char* trigger = selection.serial != summary.watchSerial ? "selection-formed" : "save-write";
        summary.watchSerial = selection.serial;
        summary.watchSlot = selection.readSlot;
        summary.watchWrites = selection.linkedWrites;
        summary.watchRetries = 0;
        summary.watchPath[0] = 0;
        wchar_t folder[600] = {};
        if (WideFolder(selection.root, folder)) {
            swprintf_s(summary.watchPath, L"%ls\\slot%u\\save.save", folder, selection.readSlot);
        }
        RequestBellRead(summary, trigger);
    }
    // The slot file was rewritten (e.g. an autosave): read it again.
    if (pollFile && selection.active && selection.serial == summary.watchSerial &&
        summary.watchPath[0]) {
        FILETIME now = SlotFileTime(summary.watchPath);
        if (CompareFileTime(&now, &summary.watchModified) != 0) {
            RequestBellRead(summary, summary.watchModified.dwLowDateTime ||
                summary.watchModified.dwHighDateTime ? "file-changed" : "retry");
        }
    }
    // Collect a finished read, if any.
    BellResult result = {};
    AcquireSRWLockExclusive(&bellLock);
    bool have = bellResultReady;
    if (have) {
        result = bellResult;
        bellResultReady = false;
    }
    ReleaseSRWLockExclusive(&bellLock);
    if (!have) {
        return;
    }
    // Accept it only if the selection it was read for is still the active one
    // and the slot is still the one to read (a later save write may have
    // moved it; the older slot's result is then "superseded").
    bool current = selection.active && selection.serial == result.serial;
    bool sameSlot = current && selection.readSlot == result.slot;
    const char* outcome = !current ? "stale" : !sameSlot ? "superseded"
        : result.succeeded ? "accepted" : "failed";
    if (!sameSlot) {
        ++summary.bellStale;
    } else if (result.succeeded) {
        ++summary.bellAccepted;
        summary.bellValid = true;
        summary.bellSerial = result.serial;
        summary.bellSlot = result.slot;
        summary.bell = result.summary;
        summary.watchRetries = 0;
    } else {
        ++summary.bellFailed;
        // A failed read (often "still changing" during a save) is retried a
        // few times: clearing the remembered time makes the next poll re-read.
        if (summary.watchRetries < 3) {
            ++summary.watchRetries;
            summary.watchModified = {};
        }
    }
    // Convert the decoded file's time to readable local time for the log.
    SYSTEMTIME utc = {};
    SYSTEMTIME local = {};
    FileTimeToSystemTime(&result.modified, &utc);
    SystemTimeToTzSpecificLocalTime(nullptr, &utc, &local);
    // sprintf_s aborts on overflow; the error text alone can be 255 characters.
    char line[1024];
    sprintf_s(line, "BELL_READ serial=%u slot=%u trigger=%s outcome=%s profile=%s coverage=%u recorded=%u completed=%u hernandCompleted=%u saveModified=%04u-%02u-%02u %02u:%02u:%02u error=%s activeSerial=%u diagnostic=1 bellTrusted=0",
        result.serial, result.slot, result.trigger, outcome,
        result.summary.profile[0] ? result.summary.profile : "-",
        result.summary.coverage, result.summary.recorded, result.summary.completed,
        result.summary.hernandCompleted ? 1u : 0u,
        local.wYear, local.wMonth, local.wDay, local.wHour, local.wMinute, local.wSecond,
        result.error[0] ? result.error : "none", selection.active ? selection.serial : 0u);
    Log(line);
    // v0.56: the shrine pass from the same read (independent of the Bell
    // result; valid=0 means unknown, never "not found").
    if (result.succeeded) {
        sprintf_s(line, "SHRINE_READ serial=%u slot=%u valid=%u coverage=%u found=%u foundMask=0x%x seenMask=0x%x error=%s",
            result.serial, result.slot, result.summary.shrinesValid ? 1u : 0u,
            result.summary.shrineCoverage, result.summary.shrinesFound,
            result.summary.shrineFoundMask, result.summary.shrineSeenMask,
            result.summary.shrineError[0] ? result.summary.shrineError : "none");
        Log(line);
        // v0.58: chests from the Bell pass (same list and validity as Bells).
        unsigned seen = 0;
        for (unsigned word : result.summary.chestSeenMask) {
            seen += static_cast<unsigned>(__popcnt(word));
        }
        // v0.68: strongboxes also use the field-object pass; unknown boxes
        // stay hidden (fieldValid=0 means that pass failed, see error).
        sprintf_s(line, "CHEST_READ serial=%u slot=%u coverage=%u seen=%u opened=%u unknown=%u fieldValid=%u fieldRecords=%u error=%s",
            result.serial, result.slot, result.summary.chestCoverage, seen, result.summary.chestsOpened,
            result.summary.chestsUnknown, result.summary.chestFieldValid ? 1u : 0u,
            result.summary.chestFieldRecords,
            result.summary.chestFieldError[0] ? result.summary.chestFieldError : "none");
        Log(line);
        // v0.69: Abyss chests from the same Bell pass.
        unsigned abyssSeen = 0;
        for (unsigned word : result.summary.abyssChestSeenMask) {
            abyssSeen += static_cast<unsigned>(__popcnt(word));
        }
        sprintf_s(line, "ABYSS_CHEST_READ serial=%u slot=%u coverage=%u seen=%u opened=%u",
            result.serial, result.slot, result.summary.abyssChestCoverage, abyssSeen,
            result.summary.abyssChestsOpened);
        Log(line);
        // v0.79: surface Abyss Nexuses (discovered from the Bell pass,
        // activated from the field pass; unknown ones stay hidden).
        unsigned nexusSeen = 0;
        for (unsigned word : result.summary.nexusSeenMask) {
            nexusSeen += static_cast<unsigned>(__popcnt(word));
        }
        sprintf_s(line, "NEXUS_READ serial=%u slot=%u coverage=%u discovered=%u activated=%u unknown=%u",
            result.serial, result.slot, result.summary.nexusCoverage, nexusSeen,
            result.summary.nexusesActivated, result.summary.nexusesUnknown);
        Log(line);
        // v0.95: Abyss-island Nexuses, the same rule and passes as above.
        unsigned islandSeen = 0;
        for (unsigned word : result.summary.islandNexusSeenMask) {
            islandSeen += static_cast<unsigned>(__popcnt(word));
        }
        sprintf_s(line, "ISLAND_NEXUS_READ serial=%u slot=%u coverage=%u discovered=%u activated=%u unknown=%u",
            result.serial, result.slot, result.summary.islandNexusCoverage, islandSeen,
            result.summary.islandNexusesActivated, result.summary.islandNexusesUnknown);
        Log(line);
        // v0.88: Sealed Abyss Artifacts (their own pass; unknown ones stay hidden).
        sprintf_s(line, "SEALED_READ serial=%u slot=%u valid=%u coverage=%u pickedUp=%u unknown=%u error=%s",
            result.serial, result.slot, result.summary.artifactsValid ? 1u : 0u, result.summary.artifactCoverage,
            result.summary.artifactsPickedUp, result.summary.artifactsUnknown,
            result.summary.artifactError[0] ? result.summary.artifactError : "none");
        Log(line);
        // v0.108: unique gear (reward items from the quest pass, ground and
        // quest items from the field pass; unknown ones stay hidden).
        sprintf_s(line, "UNIQUE_GEAR_READ serial=%u slot=%u coverage=%u collected=%u unknown=%u",
            result.serial, result.slot, result.summary.uniqueGearCoverage, result.summary.uniqueGearCollected,
            result.summary.uniqueGearUnknown);
        Log(line);
    }
}

#ifdef PYWEL_ATLAS_COMBINED
// The result shared with the map-marker part (see LoadedSave.h), guarded by
// publishedLock. Only the worker writes it; the marker's thread copies it.
SRWLOCK publishedLock = SRWLOCK_INIT;
LoadedSaveBell published = {};

// Called by the worker every loop, after UpdateBellReads: publishes the
// accepted Bell result for the active selection, or "not known".
void PublishLoadedSave(const Summary& summary) {
    const Selection& selection = summary.selection;
    LoadedSaveBell current = {};
    current.valid = summary.bellValid && selection.active &&
        summary.bellSerial == selection.serial && summary.bellSlot == selection.readSlot;
    if (current.valid) {
        current.serial = selection.serial;
        current.loadScope = selection.loadScope;
        current.loadedSlot = selection.slot;
        current.readSlot = summary.bellSlot;
        current.bell = summary.bell;
    }
    AcquireSRWLockExclusive(&publishedLock);
    published = current;
    ReleaseSRWLockExclusive(&publishedLock);
}
#endif

#ifdef PYWEL_ATLAS_DEV
// =============================================================================
// 6. F7 checkpoint popup (development builds only, v0.129)
// =============================================================================

// One copied notification snapshot at a time. The worker acquires ownership by
// changing popupActive from 0 to 1; only the notification thread releases it
// after MessageBox returns. No game object pointers reach this thread.
volatile LONG popupActive = 0;
// swprintf_s aborts on overflow; keep ample room for the selection line.
wchar_t popupText[2048] = {};

// Runs on its own short-lived thread: shows the popup and waits for OK.
DWORD WINAPI ShowCheckpointPopup(void*) {
    // Foreground and topmost flags make the confirmation visible over the game.
    // No owner avoids disabling the game window while it awaits dismissal.
    MessageBoxW(nullptr, popupText, L"Pywel Atlas - checkpoint recorded",
        MB_OK | MB_ICONINFORMATION | MB_TOPMOST | MB_SETFOREGROUND);
    InterlockedExchange(&popupActive, 0);
    return 0;
}

// Fills in the popup text from the summary and starts the popup thread
// (unless a popup is already open).
void NotifyCheckpoint(const Summary& summary) {
    if (InterlockedCompareExchange(&popupActive, 1, 0) != 0) {
        Log("Checkpoint recorded; existing confirmation still open, no duplicate popup created.");
        return;
    }
    // The latest accepted Bell result for the current selection, if any.
    wchar_t bellLine[768] = {}; // v0.101: room for the quest-locked count.
    if (summary.bellValid) {
        // v0.56: shrines come from the same read ("unknown" if their pass failed).
        wchar_t shrines[64] = L"Greymane Shrines unknown";
        if (summary.bell.shrinesValid) {
            swprintf_s(shrines, L"%u of %u Greymane Shrines found",
                summary.bell.shrinesFound, summary.bell.shrineCoverage);
        }
        // v0.88: Sealed Abyss Artifacts, likewise from their own pass.
        wchar_t artifacts[80] = L"Sealed Abyss Artifacts unknown";
        if (summary.bell.artifactsValid) {
            swprintf_s(artifacts, L"%u of %u Sealed Abyss Artifacts picked up",
                summary.bell.artifactsPickedUp, summary.bell.artifactCoverage);
        }
        swprintf_s(bellLine, L"slot %u, serial %u: %u of %u Bells recorded, %u completed; Hernand Bell %ls; %ls; "
            L"%u of %u chests opened (%u unknown); %u of %u Abyss chests opened (%u more after a quest); %u of %u Abyss Nexuses activated; "
            L"%u of %u Abyss-island Nexuses activated; %ls; Unique gear: %u/%u collected",
            summary.bellSlot, summary.bellSerial, summary.bell.recorded, summary.bell.coverage,
            summary.bell.completed, summary.bell.hernandCompleted ? L"completed" : L"not completed", shrines,
            summary.bell.chestsOpened, summary.bell.chestCoverage, summary.bell.chestsUnknown,
            // v0.101: quest-locked Abyss chests are not counted as missing.
            summary.bell.abyssChestsOpened, summary.bell.abyssChestCoverage - summary.bell.abyssChestsLocked,
            summary.bell.abyssChestsLocked,
            summary.bell.nexusesActivated, summary.bell.nexusCoverage,
            summary.bell.islandNexusesActivated, summary.bell.islandNexusCoverage, artifacts,
            summary.bell.uniqueGearCollected, summary.bell.uniqueGearCoverage); // v0.108.
    } else {
        swprintf_s(bellLine, L"none accepted yet for this selection");
    }
    swprintf_s(popupText,
        L"F7 checkpoint recorded.\n\n"
        L"Bell read (diagnostic): %ls\n"
        L"Loaded slot %u; reading slot %u; linked save writes %u (all save writes seen %u, last slot %u)\n"
        L"Bell reads requested / accepted / stale / failed: %u / %u / %u / %u\n"
        L"(A new read was also requested now; it is written to the log.)\n\n"
        L"Read completions: %u\nLast requested slot: %u\n"
        L"Apply completions: %u\nOuter load completions: %u\n"
        L"Correlated read/apply/load: %ls\nClient reset calls: %u\n"
        L"Controller phase: %u (24 is the late boundary candidate)\n"
        L"Native actor-link observations: %u\n"
        L"User-key lookups: %u (client/server full-key match: %ls)\n"
        L"Matching late boundary: %ls\n"
        L"Diagnostic selection: %hs (slot %u, serial %u)\n"
        L"Field begin / transition / reload: %u / %u / %u\n"
        L"Context cleanups: %u\nStorage root: %ls\nDropped records: %ld\n\n"
        L"Logging continues while this confirmation is open.\n"
        L"Press OK, then continue the loading sequence.\n\n"
        L"Observation only; loaded-save detection is not yet trusted.",
        bellLine,
        summary.selection.active ? summary.selection.slot : 0xffffffffu,
        summary.selection.active ? summary.selection.readSlot : 0xffffffffu,
        summary.selection.active ? summary.selection.linkedWrites : 0u, summary.saveWrites,
        summary.saveWrites ? summary.lastWrite.requestedSlot : 0xffffffffu,
        summary.bellRequests, summary.bellAccepted, summary.bellStale, summary.bellFailed,
        summary.reads, summary.reads ? summary.lastRead.requestedSlot : 0xffffffffu,
        summary.applies, summary.loads, summary.correlatedCandidate ? L"yes" : L"no",
        summary.clientResets,
        summary.lastController.controllerPhaseRead ? summary.lastController.controllerPhase : 0xffffffffu,
        summary.actorLinks,
        summary.keyLookups, summary.keyIdentityMatch ? L"yes" : L"no",
        summary.clientBoundaryCandidate ? L"yes" : L"no",
        summary.selection.active ? summary.selection.account : "none",
        summary.selection.active ? summary.selection.slot : 0xffffffffu, summary.selection.serial,
        summary.fieldBegins, summary.fieldTransitions, summary.fieldReloads,
        summary.cleanups,
        summary.lastStorage.rootRead ? L"start-up record"
            : summary.lastStorageUse.rootRead ? L"save-file use (start-up missed)" : L"not copied",
        InterlockedCompareExchange(&dropped, 0, 0));
    HANDLE notification = CreateThread(nullptr, 0, ShowCheckpointPopup, nullptr, 0, nullptr);
    if (notification) {
        CloseHandle(notification);
    } else {
        InterlockedExchange(&popupActive, 0);
        Log("Confirmation thread unavailable; checkpoint remains recorded and logging continues.");
    }
}
#endif

// Empties the queue: copies all waiting records out (holding the lock only
// briefly), writes their log lines, and feeds each one to Correlate.
void Drain(Summary& summary) {
    Event events[128];
    AcquireSRWLockExclusive(&eventLock);
    unsigned count = pendingCount;
    memcpy(events, pending, count * sizeof(Event));
    pendingCount = 0;
    ReleaseSRWLockExclusive(&eventLock);
    // Log names for each Stage, in the same order as the enum.
    const char* stages[] = {"read-start", "read-end", "apply-start", "apply-end",
        "load-start", "load-end", "cleanup-start", "cleanup-end", "storage-start", "storage-end",
        "field-begin-start", "field-begin-end", "client-reset-start", "client-reset-end",
        "field-transition-start", "field-transition-end", "field-reload-start", "field-reload-end",
        "controller-snapshot", "actor-link", "key-lookup", "write-start", "write-end",
        "storage-use"};
    static_assert(_countof(stages) == static_cast<unsigned>(Stage::StorageUse) + 1,
        "Every stage needs a log name");
    for (unsigned index = 0; index < count; ++index) {
        const Event& event = events[index];
        char line[768];
        // The general "stage=" line written for every record.
        sprintf_s(line, "stage=%s seq=%ld scope=%ld thread=%lu tick=%llu callerRva=0x%llx object=0x%llx requestedSlot=%u vtableRva=0x%llx lifecycleRead=%u lifecycleBits=0x%x statusRead=%u status=%lu",
            stages[static_cast<unsigned>(event.stage)], event.sequence, event.scope, event.thread,
            event.tick, static_cast<unsigned long long>(event.callerRva),
            static_cast<unsigned long long>(event.object), event.requestedSlot,
            static_cast<unsigned long long>(event.vtableRva), event.lifecycleRead ? 1u : 0u,
            static_cast<unsigned>(event.lifecycleBits),
            event.statusRead ? 1u : 0u, event.status);
        Log(line);
        // Extra detail lines for particular kinds of record.
        // (Field-begin records share the ACTOR_LINK format but carry no
        // resolver data; their valid/sourceKey fields are 0.)
        if (event.stage == Stage::ActorLink || event.stage == Stage::FieldBeginEnd) {
            sprintf_s(line, "ACTOR_LINK seq=%ld source=0x%llx sourceVtable=0x%llx sourceKeyRead=%u sourceKey=0x%08x peer=0x%llx peerVtable=0x%llx valid=%u manager=0x%llx serverChild=0x%llx nativeLinkRead=%u epoch=%ld drops=%ld",
                event.sequence, static_cast<unsigned long long>(event.object),
                static_cast<unsigned long long>(event.vtableRva),
                event.actorKeyRead ? 1u : 0u, event.actorKey,
                static_cast<unsigned long long>(event.peerActor),
                static_cast<unsigned long long>(event.peerVtable), static_cast<unsigned>(event.resolvedValid),
                static_cast<unsigned long long>(event.resolvedManager),
                static_cast<unsigned long long>(event.resolvedChild), event.nativeLinkRead ? 1u : 0u,
                event.epoch, event.droppedAtCapture);
            Log(line);
        }
        if (event.stage == Stage::ControllerSnapshot) {
            sprintf_s(line, "CONTROLLER seq=%ld controller=0x%llx phaseRead=%u before=%u after=%u object=0x%llx",
                event.sequence, static_cast<unsigned long long>(event.controller),
                event.controllerPhaseRead ? 1u : 0u,
                static_cast<unsigned>(event.previousControllerPhase),
                static_cast<unsigned>(event.controllerPhase),
                static_cast<unsigned long long>(event.object));
            Log(line);
        }
        if (event.fieldFlagRead || event.stage == Stage::ClientResetStart ||
            event.stage == Stage::ClientResetEnd) {
            sprintf_s(line, "FIELD_STATE seq=%ld stage=%s fieldFlagRead=%u fieldFlag=%u manager=0x%llx selectedChildRead=%u selectedChild=0x%llx selectedSelf=%u drops=%ld",
                event.sequence, stages[static_cast<unsigned>(event.stage)],
                event.fieldFlagRead ? 1u : 0u, static_cast<unsigned>(event.fieldFlag),
                static_cast<unsigned long long>(event.manager), event.selectedChildRead ? 1u : 0u,
                static_cast<unsigned long long>(event.selectedChild),
                event.selectedChildRead && event.selectedChild == event.object ? 1u : 0u,
                event.droppedAtCapture);
            Log(line);
        }
        Correlate(event, summary);
        // Keep simple counts and the latest record of each kind.
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
        } else if (event.stage == Stage::FieldBeginEnd) {
            ++summary.fieldBegins;
        } else if (event.stage == Stage::FieldTransitionEnd) {
            ++summary.fieldTransitions;
        } else if (event.stage == Stage::FieldReloadEnd) {
            ++summary.fieldReloads;
        } else if (event.stage == Stage::WriteEnd) {
            LinkSaveWrite(event, summary);
        } else if (event.stage == Stage::StorageEnd) {
            ++summary.storageInitializations;
            // A re-initialized handler may belong to another account; the
            // selection is bound to the exact root it was validated against.
            if (summary.selection.active &&
                (!event.rootRead || strcmp(event.root, summary.selection.root) != 0)) {
                RetireSelection(summary, "storage-root-changed");
            }
            summary.lastStorage = event;
            // Forget the root seen by earlier file methods: it belongs to the
            // old storage object and must not be chosen again as a fallback.
            summary.lastStorageUse = {};
            sprintf_s(line, "STORAGE_ROOT copied=%u booleanResult=%lu root=%s",
                event.rootRead ? 1u : 0u, event.status, event.rootRead ? event.root : "<unavailable>");
            Log(line);
        } else if (event.stage == Stage::StorageUse) {
            // v0.60: a storage file method ran (throttled to one record per
            // method, root and epoch). A different root ends the selection,
            // like a re-initialized storage object.
            ++summary.storageUses;
            if (event.rootRead) {
                if (summary.selection.active && strcmp(event.root, summary.selection.root) != 0) {
                    RetireSelection(summary, "storage-root-changed");
                }
                summary.lastStorageUse = event;
            }
            bool sameAsStartup = event.rootRead && summary.lastStorage.rootRead &&
                strcmp(event.root, summary.lastStorage.root) == 0;
            sprintf_s(line, "STORAGE_USE seq=%ld method=%u file=%s copied=%u startupRootCopied=%u sameAsStartup=%u epoch=%ld root=%.400s",
                event.sequence, static_cast<unsigned>(event.storageMethod),
                event.fileName[0] ? event.fileName : "<unavailable>", event.rootRead ? 1u : 0u,
                summary.lastStorage.rootRead ? 1u : 0u, sameAsStartup ? 1u : 0u, event.epoch,
                event.rootRead ? event.root : "<unavailable>");
            Log(line);
        }
    }
    UpdateSelection(summary);
}

// =============================================================================
// 7. Startup and the worker loop
// =============================================================================

// The worker thread. Opens the log, checks the game version and guard bytes,
// installs all hooks, then loops forever: drain the queue, handle lost
// records, and (development builds) watch for F7.
DWORD WINAPI Run(void* address) {
    // Installed detours retain code addresses for process lifetime. Live ASI
    // unloading is unsupported; pin the module before any hook is installed.
    HMODULE pinned = nullptr;
    if (!GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned)) {
        return 0;
    }
#ifdef PYWEL_ATLAS_DEV
    // Open (or create) %LOCALAPPDATA%\PywelAtlas\native-save-detection.log.
    // The release build has no detailed log: Log() then writes nothing.
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\native-save-detection.log");
    logFile = CreateFileW(path, FILE_APPEND_DATA, FILE_SHARE_READ, nullptr,
        OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (logFile == INVALID_HANDLE_VALUE) {
        return 0;
    }
#endif
    char line[192];
    sprintf_s(line, "SESSION native save-load observation v0.60 pid=%lu tick=%llu; automaticLoadedSaveTrusted=0",
        GetCurrentProcessId(), GetTickCount64());
    Log(line);
    // Check this is the exact supported game build (timestamp and size).
    auto* base = reinterpret_cast<BYTE*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    auto* dos = reinterpret_cast<const IMAGE_DOS_HEADER*>(base);
    auto* pe = reinterpret_cast<const IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kLoadTimestamp ||
        pe->OptionalHeader.SizeOfImage != kLoadImageSize) {
        Log("Unsupported executable; no observation installed.");
        PywelReleaseLog("Save detection: unsupported game version; save detection is off.");
        return 0;
    }
    // Check every hooked function still starts with the expected guard bytes.
    for (const auto& site : kSaveLoadSites) {
        if (memcmp(base + site.rva, site.bytes, sizeof(site.bytes)) != 0) {
            Log("Save-load entry changed; no observation installed.");
            PywelReleaseLog("Save detection: game code changed (guard bytes); save detection is off.");
            return 0;
        }
    }
#ifndef PYWEL_ATLAS_COMBINED
    if (MH_Initialize() != MH_OK) {
        Log("MinHook initialization rejected.");
        return 0;
    }
#endif
    // (In the combined Pywel Atlas build, src/pywel-atlas/PywelAtlas.cpp
    // initializes MinHook once for both parts before starting this worker.)
    // Our hook functions, in the SAME order as kSaveLoadSites in
    // save-load-profile.h. The static_assert only checks the count, so keep
    // the order aligned by hand.
    void* callbacks[] = {
        reinterpret_cast<void*>(&ObserveRead),
        reinterpret_cast<void*>(&ObserveApply),
        reinterpret_cast<void*>(&ObserveLoad),
        reinterpret_cast<void*>(&ObserveCleanup),
        reinterpret_cast<void*>(&ObserveStorage),
        reinterpret_cast<void*>(&ObserveFieldBegin),
        reinterpret_cast<void*>(&ObserveClientReset),
        reinterpret_cast<void*>(&ObserveFieldTransition),
        reinterpret_cast<void*>(&ObserveFieldReload),
        reinterpret_cast<void*>(&ObserveControllerUpdate),
        reinterpret_cast<void*>(&ObserveResolveActor),
        reinterpret_cast<void*>(&ObserveClientLookup),
        reinterpret_cast<void*>(&ObserveServerLookup),
        reinterpret_cast<void*>(&ObserveWrite),
        reinterpret_cast<void*>(&ObserveStorageSlot3),
        reinterpret_cast<void*>(&ObserveStorageSlot4),
        reinterpret_cast<void*>(&ObserveStorageSlot5),
        reinterpret_cast<void*>(&ObserveStorageSlot6)};
    // Where MinHook stores the "call the real game function" pointers, same order.
    void** originals[] = {
        reinterpret_cast<void**>(&originalRead),
        reinterpret_cast<void**>(&originalApply),
        reinterpret_cast<void**>(&originalLoad),
        reinterpret_cast<void**>(&originalCleanup),
        reinterpret_cast<void**>(&originalStorage),
        reinterpret_cast<void**>(&originalFieldBegin),
        reinterpret_cast<void**>(&originalClientReset),
        reinterpret_cast<void**>(&originalFieldTransition),
        reinterpret_cast<void**>(&originalFieldReload),
        reinterpret_cast<void**>(&originalControllerUpdate),
        reinterpret_cast<void**>(&originalResolveActor),
        reinterpret_cast<void**>(&originalClientLookup),
        reinterpret_cast<void**>(&originalServerLookup),
        reinterpret_cast<void**>(&originalWrite),
        reinterpret_cast<void**>(&originalStorageUse[0]),
        reinterpret_cast<void**>(&originalStorageUse[1]),
        reinterpret_cast<void**>(&originalStorageUse[2]),
        reinterpret_cast<void**>(&originalStorageUse[3])};
    static_assert(_countof(callbacks) == _countof(kSaveLoadSites),
        "Every observed lifecycle site needs an explicit callback");
    // Create every hook first; if any fails, install none.
    for (unsigned index = 0; index < _countof(callbacks); ++index) {
        MH_STATUS status = MH_CreateHook(base + kSaveLoadSites[index].rva,
            callbacks[index], originals[index]);
        if (status != MH_OK) {
            Log(MH_StatusToString(status));
            PywelReleaseLog("Save detection: could not create its hooks (%s); save detection is off.",
                MH_StatusToString(status));
#ifdef PYWEL_ATLAS_COMBINED
            // Shared MinHook: remove only the hooks this part created.
            for (unsigned created = 0; created < index; ++created) {
                MH_RemoveHook(base + kSaveLoadSites[created].rva);
            }
#else
            MH_Uninitialize();
#endif
            return 0;
        }
    }
#ifdef PYWEL_ATLAS_COMBINED
    // Shared MinHook: switch on only this part's hooks, never the other part's.
    MH_STATUS status = MH_OK;
    for (unsigned index = 0; index < _countof(callbacks) && status == MH_OK; ++index) {
        status = MH_EnableHook(base + kSaveLoadSites[index].rva);
    }
#else
    MH_STATUS status = MH_EnableHook(MH_ALL_HOOKS);
#endif
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        PywelReleaseLog("Save detection: could not switch on its hooks (%s); save detection is off.",
            MH_StatusToString(status));
        return 0;
    }
    // Start the Bell reader thread (section 5b). If it cannot start, the probe
    // keeps observing; Bell requests then simply never complete.
    bellWake = CreateEventW(nullptr, FALSE, FALSE, nullptr);
    HANDLE reader = bellWake ? CreateThread(nullptr, 0, RunBellReader, nullptr, 0, nullptr) : nullptr;
    if (reader) {
        CloseHandle(reader);
    } else {
        Log("Bell reader thread unavailable; observation continues without Bell reads.");
        PywelReleaseLog("Save detection: save reader thread could not start; progress will not update.");
    }
    PywelReleaseLog("Save detection started.");
#ifdef PYWEL_ATLAS_DEV
    Log("READY v0.60: eighteen guarded hooks (v0.60: four watch-only storage file methods copy the save folder when the start-up record is missing; rootSource=startup or use; conflicting roots withhold the selection); 200-range save writes ignored; last saved slot carried over when the selection re-forms in the same world; full user-key identity match and worker-owned diagnostic account/slot selection; boundary rechecked on every generation change. Diagnostic read-only Bell reads tagged with the selection serial; stale results discarded. Save writes by the selection's server child retarget Bell reads to the written slot. F7 foreground confirmation retained. No marker hooks or save writes.");
#endif
    Summary summary = {};
    summary.generation = 1;
    LONG observedDrops = 0;
#ifdef PYWEL_ATLAS_DEV
    bool previousF7 = false;
#endif
    unsigned loops = 0;
    // Main loop, every 30 ms.
    while (true) {
        Drain(summary);
        // Bell reads; check the slot file's time about every 3 s (100 loops).
        UpdateBellReads(summary, ++loops % 100 == 0);
#ifdef PYWEL_ATLAS_COMBINED
        // Tell the map-marker part what is known about the loaded save.
        PublishLoadedSave(summary);
#endif
        // If records were lost, the evidence is incomplete: clear the matches.
        LONG currentDrops = InterlockedCompareExchange(&dropped, 0, 0);
        if (currentDrops != summary.chainDrops) {
            summary.correlatedCandidate = false;
            summary.clientBoundaryCandidate = false;
        }
        if (currentDrops != observedDrops) {
            // Lost records may have carried an invalidation; start a new epoch
            // once per change so cached associations must be observed again.
            observedDrops = currentDrops;
            summary.generation = InterlockedIncrement(&epoch);
            summary.keyIdentityMatch = false;
            UpdateSelection(summary);
        }
#ifdef PYWEL_ATLAS_DEV
        // F7 only counts while the game window is in front, once per press.
        // Development builds only (v0.129): the release has no F7 at all.
        DWORD foreground = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foreground);
        bool f7 = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
#ifdef PYWEL_ATLAS_COMBINED
        // Combined build: Shift+F7 belongs to the map-marker part.
        f7 = f7 && (GetAsyncKeyState(VK_SHIFT) & 0x8000) == 0;
#endif
        if (foreground == GetCurrentProcessId() && f7 && !previousF7) {
            bool sameObject = summary.reads && summary.applies && summary.lastRead.object &&
                summary.lastRead.object == summary.lastApply.object;
            // Record first, then notify on another thread. An undisclosed or
            // undismissed popup must never stop draining later load events.
            char checkpoint[2048];
            sprintf_s(checkpoint,
                "CHECKPOINT F7 readCount=%u applyCount=%u sameObject=%u dropped=%ld "
                "lastRequestedSlot=%u readStatusReadable=%u readStatus=%lu "
                "applyStatusReadable=%u applyStatus=%lu loadCount=%u cleanupCount=%u correlated=%u storageRootCopied=%u storageUseRootCopied=%u storageUses=%u "
                "clientResetCount=%u clientBoundary=%u fieldBeginCount=%u fieldTransitionCount=%u fieldReloadCount=%u "
                "controllerChanges=%u phaseReadable=%u controllerPhase=%u actorLinkCount=%u nativeLinkRead=%u "
                "keyLookupCount=%u clientKey=0x%08x clientKeyEpoch=%ld clientUser=0x%llx clientSelected=0x%llx "
                "serverKey=0x%08x serverKeyEpoch=%ld serverUser=0x%llx serverSelected=0x%llx "
                "keyIdentityMatch=%u generation=%ld loadEpoch=%ld "
                "selectionActive=%u selectionSerial=%u selectionGeneration=%ld selectionScope=%ld "
                "selectionSlot=%u selectionAccount=%s "
                "readSlot=%u linkedWrites=%u saveWrites=%u lastWriteSlot=%u "
                "bellValid=%u bellSerial=%u bellSlot=%u bellCoverage=%u bellRecorded=%u bellCompleted=%u "
                "hernandCompleted=%u bellRequests=%u bellAccepted=%u bellStale=%u bellFailed=%u "
                "boundaryObject=0x%llx loadedObject=0x%llx worldReadyTrusted=0 accountTrusted=0 bellTrusted=0",
                summary.reads, summary.applies, sameObject ? 1u : 0u,
                InterlockedCompareExchange(&dropped, 0, 0),
                summary.reads ? summary.lastRead.requestedSlot : 0xffffffffu,
                summary.lastRead.statusRead ? 1u : 0u, summary.lastRead.status,
                summary.lastApply.statusRead ? 1u : 0u, summary.lastApply.status,
                summary.loads, summary.cleanups, summary.correlatedCandidate ? 1u : 0u,
                summary.lastStorage.rootRead ? 1u : 0u,
                summary.lastStorageUse.rootRead ? 1u : 0u, summary.storageUses, summary.clientResets,
                summary.clientBoundaryCandidate ? 1u : 0u,
                summary.fieldBegins, summary.fieldTransitions, summary.fieldReloads,
                summary.controllerChanges, summary.lastController.controllerPhaseRead ? 1u : 0u,
                static_cast<unsigned>(summary.lastController.controllerPhase),
                summary.actorLinks, summary.lastActorLink.nativeLinkRead ? 1u : 0u,
                summary.keyLookups, summary.lastClientKey.lookupKey, summary.lastClientKey.epoch,
                static_cast<unsigned long long>(summary.lastClientKey.peerActor),
                static_cast<unsigned long long>(summary.lastClientKey.resolvedChild),
                summary.lastServerKey.lookupKey, summary.lastServerKey.epoch,
                static_cast<unsigned long long>(summary.lastServerKey.peerActor),
                static_cast<unsigned long long>(summary.lastServerKey.resolvedChild),
                summary.keyIdentityMatch ? 1u : 0u, summary.generation, summary.lastLoad.epoch,
                summary.selection.active ? 1u : 0u, summary.selection.serial,
                summary.selection.generation, summary.selection.loadScope, summary.selection.slot,
                summary.selection.active ? summary.selection.account : "none",
                summary.selection.active ? summary.selection.readSlot : 0xffffffffu,
                summary.selection.active ? summary.selection.linkedWrites : 0u, summary.saveWrites,
                summary.saveWrites ? summary.lastWrite.requestedSlot : 0xffffffffu,
                summary.bellValid ? 1u : 0u, summary.bellSerial, summary.bellSlot,
                summary.bell.coverage, summary.bell.recorded, summary.bell.completed,
                summary.bell.hernandCompleted ? 1u : 0u, summary.bellRequests, summary.bellAccepted,
                summary.bellStale, summary.bellFailed,
                static_cast<unsigned long long>(summary.lastController.object),
                static_cast<unsigned long long>(summary.lastLoad.object));
            Log(checkpoint);
            NotifyCheckpoint(summary);
            // Also read the save again now; the result follows in the log.
            RequestBellRead(summary, "f7");
            f7 = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
        }
        previousF7 = f7;
#endif
        Sleep(30);
    }
}
} // namespace

#ifdef PYWEL_ATLAS_COMBINED
// Combined Pywel Atlas build: src/pywel-atlas/PywelAtlas.cpp owns DllMain and
// starts this part's worker through this entry point.
DWORD WINAPI PywelSaveDetectionRun(void* address) {
    return Run(address);
}

// Copies the latest published loaded-save Bell result (see LoadedSave.h).
bool PywelGetLoadedSaveBell(LoadedSaveBell& out) {
    AcquireSRWLockShared(&publishedLock);
    out = published;
    ReleaseSRWLockShared(&publishedLock);
    return out.valid;
}
#else
// Windows calls this when the game loads our .asi. We only start the worker
// thread here; all real work happens in Run.
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
#endif

