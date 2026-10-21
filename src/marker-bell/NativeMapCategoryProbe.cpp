// NativeMapCategoryProbe.cpp - the main file of the Pywel Atlas native mod.
//
// What this file does, in short:
// - It is compiled into an ASI file (a DLL that a mod loader injects into the
//   game Crimson Desert). DllMain at the bottom starts one background thread,
//   called "the worker" in these comments, which runs Run().
// - Run() checks that the game executable is exactly the build this mod was
//   made for, then installs "hooks". A hook redirects one of the game's own
//   functions to a function in this file. Our function usually calls the
//   original game function unchanged, then looks at what happened. The hooks
//   use the MinHook library (vendor/minhook).
// - Most hooks only OBSERVE: they record diagnostic samples about map icons
//   (type, category, template name, visibility bits) into a small queue that
//   the worker writes to a log file.
// - One hook (ObserveWorldMapUpdate) runs on the game's own map/UI thread
//   after each world-map update. That is the only place where this mod asks
//   the game to CREATE its one test marker (the "proof chest") or REMOVE it.
// - Keys handled by the worker (only while the game window is focused):
//     F6  load the marker JSON (NativeMarkerDefinition.cpp) and request creation.
//     F7  read the selected save (NativeSaveReader.cpp) and enable Bell tracking.
//     F8  write a diagnostic snapshot and briefly capture render state.
//     F9  choose which save slot to read.
//     F10 stop generation and request removal.
// - If the save says the Hernand Bell is completed, the worker requests removal
//   of the proof chest (HideCompletedProof()).
//
// Words used below:
// - RVA ("relative virtual address"): an offset inside the game executable,
//   counted from where the executable is loaded in memory (imageBase).
//   Real address = imageBase + RVA. Hex numbers such as 0xdf88c0 in comments
//   are RVAs of game code that was studied (traced) offline.
// - vtable: the hidden table of function pointers at the start of many C++
//   objects. Comparing an object's first 8 bytes with a known vtable address
//   (e.g. imageBase + 0x566ff50) is how this file checks what kind of object it is.
// - Guard bytes: before hooking, the first 24 bytes at each target address are
//   compared with the bytes expected for this game build (category-profile.h).
//   Any difference means the game changed, so no hooks are installed.
// - Offsets such as "+0xde" or "+0x1e8": a field at that many bytes from the
//   start of a game object, found by studying the game's code.
// - ABI: the exact way a function receives its arguments and returns results.
//   Our replacement functions must match the game's ABI exactly.
// - "Interlocked..." calls: thread-safe reads/writes of a shared number.
//   SRWLOCK: a simple Windows lock that lets one thread at a time change data.
// - thread_local: a variable that has a separate copy on every thread.
//
// Original header notes:
// Observe native marker metadata and suppression-bit changes; optionally create
// one chest-type display from an armed live world-map update. Original
// events are unchanged. Save snapshots are read on the worker; only explicit
// completion may request removal of the session-owned proof object on the UI.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <intrin.h>
#include <cmath>
#include "vendor/minhook/include/MinHook.h"
#include "category-profile.h"
#include "NativeMarkerDefinition.h"
#include "NativeSaveReader.h"
#ifdef PYWEL_ATLAS_COMBINED
// The detected loaded save, published by the save-detection part.
#include "../pywel-atlas/LoadedSave.h"
#endif

namespace {
// ===========================================================================
// Section: shapes (signatures) of the game functions we call or hook
// Each "using X = ..." line describes the arguments and return type of one game
// function so that C++ can call it. Argument meanings are only what was traced;
// "opaque" means passed through untouched without knowing what it is.
// ===========================================================================

// The ten-argument creation ABI is traced from 0xdf88c0 and the shared callee's
// stack reads. Opaque arguments remain opaque; only optional XYZ is sampled.
using CreateIcon = uintptr_t (*)(void*, const WORD*, const void*, const DWORD*,
    const void*, const float*, const void*, BYTE, const void*, BYTE);
using LookupType = void* (*)(const WORD*);
using LookupIcon = void* (*)(void*, const WORD*, const void*, const DWORD*);
using SetVisibility = uintptr_t (*)(void*, BYTE, BYTE);
using InitializeIcon = BYTE (*)(void*, const void*, BYTE);
using ProjectWorld = uintptr_t (*)(void*, BYTE, void*, const void*, const void*, float);
using CalculateIconScale = float (*)(void*, float, BYTE, float);
using RemoveWorldIcon = void (*)(void*, WORD, const void*, DWORD);
using GetPresentation = const void* (*)(void*, DWORD);
using UpdateWorldMap = uintptr_t (*)(void*, float);
// World constructor's stack arguments are traced at 0xdb84a4..0xdb84ed.
// Slots 7/9 are unused by this entry; preserve them without assigning meaning.
using CreateWorldIcon = uintptr_t (*)(void*, const WORD*, const void*, const DWORD*,
    const float*, void*, uintptr_t, float, uintptr_t, const void*, const char*,
    const void*, const void*, BYTE);

// ===========================================================================
// Section: shared state
// "original..." pointers: after hooking, these let us call the real game
// function. Other function pointers are game functions we only call.
// The volatile LONG values are counters and request/outcome flags shared
// between the worker and the game's map thread (always via Interlocked calls).
// ===========================================================================

CreateIcon originalCreate = nullptr;
LookupType originalType = nullptr;
LookupType originalTemplate = nullptr;
LookupIcon worldLookup = nullptr; // Find an existing world-map icon by type + tag.
LookupIcon minimapLookup = nullptr; // Same, for the minimap controller.
SetVisibility originalVisibility = nullptr;
CreateWorldIcon originalWorldCreate = nullptr;
InitializeIcon originalInitialize = nullptr;
ProjectWorld originalProjectWorld = nullptr;
CalculateIconScale originalCalculateScale = nullptr;
RemoveWorldIcon removeWorldIcon = nullptr; // Native world-map icon removal.
UpdateWorldMap originalUpdateWorldMap = nullptr;
uintptr_t imageBase = 0; // Where the game executable is loaded in memory.
HANDLE logFile = INVALID_HANDLE_VALUE;
// Diagnostic counters (reported by F8).
volatile LONG creationCalls = 0;
volatile LONG sampledCalls = 0;
volatile LONG droppedSamples = 0;
volatile LONG namedSamples = 0;
volatile LONG generationEnabled = 0; // 1 while F6 creation is armed (up to 3 minutes).
volatile LONG generatedCalls = 0;
volatile LONG occupiedKeys = 0;
volatile LONG definitionRejected = 0;
volatile LONG generatedReadbackMask = 0;
volatile LONG worldProjectionCalls = 0;
volatile LONG worldMapUpdateCalls = 0;
volatile LONG privateScaleCalls = 0;
alignas(8) volatile LONG64 renderCaptureDeadline = 0; // F8 render capture ends at this tick.
// Removal state. removalRequested: 0 = none, 1 = requested, 2 = native removal
// called and waiting for the icon to disappear. removalOutcome indexes the
// "lifecycle outcome" messages logged in Run().
volatile LONG ownedChest = 0; // 1 once this session created and verified its chest.
volatile LONG removalRequested = 0;
volatile LONG removalServicing = 0;
volatile LONG removalAttempts = 0;
volatile LONG removalConfirmed = 0;
volatile LONG removalAbsent = 0;
volatile LONG removalRejected = 0;
volatile LONG removalOutcome = 0;
// Creation state. creationRequested: 0 = none, 1 = requested, 2 = being serviced.
// creationOutcome indexes the "independent outcome" messages logged in Run().
volatile LONG creationRequested = 0;
volatile LONG creationOutcome = 0;
alignas(8) volatile LONG64 removalWaitStarted = 0;
constexpr WORD chestType = 226; // Map icon type id this mod uses for its chest.
// Private numeric key for our chest. Read as ASCII, the high bytes spell "PYAT".
constexpr uint64_t chestKey = 0x5059415400000002ULL;
// The worker stages validated file values. The UI commits active identity only
// when no private object exists, so editing cannot change removal's coordinates
// beneath an already owned object. Locks protect copies only, never file I/O.
SRWLOCK definitionLock = SRWLOCK_INIT;
MarkerDefinition stagedDefinition = {}; // Latest F6 values, waiting to be used.
MarkerDefinition activeDefinition = {}; // Values of the chest actually created.
// The 16-byte identity "tag" the game uses to key a map icon: a number plus a
// kind byte. This mod always uses chestKey with kind 0x15.
struct NumericTag {
    uint64_t key;
    BYTE kind;
    BYTE padding[7];
};
static_assert(sizeof(NumericTag) == 16, "Native numeric tag must remain 16 bytes");

// ===========================================================================
// Section: diagnostic samples
// A Sample is a copy of facts about one icon creation (or render moment) that
// is queued for the log. It holds plain values only, never game pointers.
// ===========================================================================

// Everything logged about one icon. Field names match the log line in Drain().
struct Sample {
    uintptr_t controller; // Controller vtable as an RVA (world map or minimap).
    WORD type;
    DWORD category;
    bool categoryRead;
    bool positionRead;
    WORD templateType;
    bool templateTypeRead;
    char templateName[128];
    BYTE tag[16];
    float position[3];
    bool generated; // True for this mod's own chest.
    bool iconVerified;
    bool visibilityRead;
    BYTE visibility[3]; // The 24 suppression bits (see ObserveVisibility).
    bool ownerControllerPresent;
    BYTE creationFlag;
    BYTE finalFlag;
    bool containerRouted;
    bool initializationObserved;
    BYTE initializationResult;
    bool rootPresent;
    bool baseIconPresent;
    bool sizeRead;
    float size[2];
    BYTE phase; // 0 = creation, 1 = scale calculation, 2 = world projection.
    float calculatedScale;
    char markerName[128];
};

// One observed change of a suppression bit on our own chest.
struct VisibilityEvent {
    uintptr_t caller; // RVA of the game code that made the call.
    BYTE bit;
    BYTE enabled;
    BYTE before[3];
    BYTE after[3];
    bool afterRead;
};

// Associate only synchronous type queries with the live creation call. Nested
// calls restore the previous context; no controller/object pointer is retained.
thread_local Sample* activeSample = nullptr;
thread_local bool creatingChest = false;
// The requested parent is freshly resolved for one synchronous UI creation.
// Nested contexts restore it; no controller or parent reaches the worker.
thread_local void* requestedChestContainer = nullptr;
// Queues shared with the worker, protected by sampleLock. "pending" waits to be
// logged; "seen" remembers what was already queued so duplicates are skipped.
SRWLOCK sampleLock = SRWLOCK_INIT;
Sample pending[128] = {};
unsigned pendingCount = 0;
Sample seen[256] = {};
unsigned seenCount = 0;
VisibilityEvent visibilityPending[128] = {};
unsigned visibilityPendingCount = 0;
VisibilityEvent visibilitySeen[256] = {};
unsigned visibilitySeenCount = 0;

// Forward declarations: these functions are defined further down the file.
bool ChestDefinitionReady();
void CreateIndependentChest(void* controller, void* parent, const void* presentation,
    const MarkerDefinition& definition);
bool ResolveIndependentParent(void* controller, const float (&position)[3],
    void*& parent, uintptr_t& chestRecord);
bool ResolvePresentation(uintptr_t record, const void*& presentation);
void ServiceCreation(void* controller);
void Queue(const Sample& sample);
void ServiceRemoval(void* controller);

// ===========================================================================
// Section: small helpers
// ===========================================================================

// Safely copy `size` bytes from game memory. Returns false instead of crashing
// if the address is null or not readable (ReadProcessMemory on our own process).
bool Read(const void* address, void* destination, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(), address,
        destination, size, &read) && read == size;
}

// Take a locked copy of the active (true) or staged (false) marker definition.
MarkerDefinition CopyDefinition(bool active) {
    AcquireSRWLockShared(&definitionLock);
    MarkerDefinition copy = active ? activeDefinition : stagedDefinition;
    ReleaseSRWLockShared(&definitionLock);
    return copy;
}

// True only if `icon` is our own chest: right type (+0xde), our private tag
// (+0xc8) and exactly the active definition's position (+0xe0).
bool IsPrivateChest(void* icon) {
    WORD type = 0;
    NumericTag tag = {};
    float position[3] = {};
    auto* bytes = static_cast<const BYTE*>(icon);
    if (!icon || !Read(bytes + 0xde, &type, sizeof(type)) || type != chestType ||
        !Read(bytes + 0xc8, &tag, sizeof(tag)) || tag.key != chestKey || tag.kind != 0x15 ||
        !Read(bytes + 0xe0, position, sizeof(position))) {
        return false;
    }
    MarkerDefinition definition = CopyDefinition(true);
    return memcmp(position, definition.position, sizeof(position)) == 0;
}

// ===========================================================================
// Section: hooks on icon creation, initialization and rendering
// Each Observe.../Route... function replaces a game function. It calls the
// original (originalX) and returns its result, so the game behaves as before.
// ===========================================================================

// Hook on the world-map icon constructor. For every other icon it passes all
// arguments through. Only while our own chest is being created (and its type,
// tag and position match exactly) does it swap in the parent container that
// ResolveIndependentParent() chose.
uintptr_t RouteWorldContainer(void* controller, const WORD* type, const void* tag,
    const DWORD* index, const float* position, void* container, uintptr_t slot7,
    float scalar, uintptr_t slot9, const void* appearance, const char* templateName,
    const void* optional12, const void* optional13, BYTE finalFlag) {
    WORD actualType = 0;
    NumericTag actualTag = {};
    float actualPosition[3] = {};
    uintptr_t controllerTable = 0;
    bool readable = activeSample &&
        Read(controller, &controllerTable, sizeof(controllerTable)) &&
        controllerTable == imageBase + 0x566ff50 &&
        Read(type, &actualType, sizeof(actualType)) &&
        Read(tag, &actualTag, sizeof(actualTag)) &&
        Read(position, actualPosition, sizeof(actualPosition));
    if (readable && creatingChest && requestedChestContainer &&
        activeSample->generated && actualType == chestType &&
        actualTag.key == chestKey && actualTag.kind == 0x15 &&
        memcmp(actualPosition, activeSample->position, sizeof(actualPosition)) == 0) {
        container = requestedChestContainer;
        activeSample->containerRouted = true;
    }
    return originalWorldCreate(controller, type, tag, index, position, container,
        slot7, scalar, slot9, appearance, templateName, optional12, optional13, finalFlag);
}

// Copy a few fields of a live icon into `sample` (visibility bits, size, and
// whether certain pointers are non-null). Only reads; keeps no pointers.
void CaptureIconState(void* icon, Sample& sample) {
    auto* bytes = static_cast<const BYTE*>(icon);
    uintptr_t control = 0;
    if (icon) {
        sample.visibilityRead = Read(bytes + 0x1e8, sample.visibility,
            sizeof(sample.visibility));
        // db4420 writes its controller into descriptor+0x28; common init
        // copies that to +0x110. It is not the presentation field or UI root.
        sample.ownerControllerPresent = Read(bytes + 0x110, &control, sizeof(control)) && control;
        sample.rootPresent = Read(bytes + 8, &control, sizeof(control)) && control;
        sample.baseIconPresent = Read(bytes + 0x118, &control, sizeof(control)) && control;
        sample.sizeRead = Read(bytes + 0x104, sample.size, sizeof(sample.size));
    }
}

// Hook on the game's icon initialization. Records its result for the icon
// currently being sampled; the result itself is returned unchanged.
BYTE ObserveInitialize(void* icon, const void* description, BYTE flag) {
    BYTE result = originalInitialize(icon, description, flag);
    WORD type = 0;
    NumericTag tag = {};
    // Read identity only after native initialization assigns it. A matching
    // partial object may explain failure; never turn a failure into success.
    if (activeSample &&
        Read(static_cast<const BYTE*>(icon) + 0xde, &type, sizeof(type)) &&
        Read(static_cast<const BYTE*>(icon) + 0xc8, &tag, sizeof(tag)) &&
        type == activeSample->type &&
        memcmp(&tag, activeSample->tag, sizeof(tag)) == 0) {
        activeSample->initializationObserved = true;
        activeSample->initializationResult = result;
        CaptureIconState(icon, *activeSample);
    }
    return result;
}

// True during the short (2 second) window opened by F8.
bool RenderCaptureActive() {
    LONG64 deadline = InterlockedCompareExchange64(&renderCaptureDeadline, 0, 0);
    return deadline > 0 && GetTickCount64() < static_cast<ULONGLONG>(deadline);
}

// Queue a render-time sample of our chest (phase 1 = scale, 2 = projection),
// at most once per 100 ms per phase.
void QueueRenderState(void* icon, BYTE phase, float scale) {
    // Capture on the game's own UI callback thread, with no retained object
    // pointers. F8 opens a short observation window; throttle each phase so an
    // animated zoom cannot exhaust the bounded diagnostic queue in one frame.
    static thread_local ULONGLONG nextCapture[3] = {};
    if (!RenderCaptureActive() || phase < 1 || phase > 2 ||
        GetTickCount64() < nextCapture[phase] || !IsPrivateChest(icon)) {
        return;
    }
    nextCapture[phase] = GetTickCount64() + 100;
    Sample sample = {};
    sample.controller = 0x566ff50;
    sample.type = chestType;
    sample.generated = true;
    sample.iconVerified = true;
    sample.phase = phase;
    sample.calculatedScale = scale;
    Read(static_cast<const BYTE*>(icon) + 0xc8, sample.tag, sizeof(sample.tag));
    sample.positionRead = Read(static_cast<const BYTE*>(icon) + 0xe0,
        sample.position, sizeof(sample.position));
    CaptureIconState(icon, sample);
    Queue(sample);
}

// Hook on the icon scale calculation: records the scale computed for our chest.
float ObserveScale(void* icon, float zoom, BYTE mode, float mapScale) {
    float result = originalCalculateScale(icon, zoom, mode, mapScale);
    if (RenderCaptureActive() && IsPrivateChest(icon)) {
        InterlockedIncrement(&privateScaleCalls);
        QueueRenderState(icon, 1, result);
    }
    return result;
}

// Hook on the per-frame world projection (placing icons on the map). During an
// F8 window it looks up our chest and samples its state.
uintptr_t ObserveWorldProjection(void* controller, BYTE flag, void* layer,
    const void* data, const void* optional, float value) {
    // Six arguments are established by the frame function's saved registers
    // and its only incoming stack reads (+0x28 pointer, +0x30 float). Preserve
    // native results, scale calculations and direct visibility writes.
    uintptr_t result = originalProjectWorld(controller, flag, layer, data, optional, value);
    InterlockedIncrement(&worldProjectionCalls);
    uintptr_t table = 0;
    if (Read(controller, &table, sizeof(table)) &&
        table == imageBase + 0x566ff50) {
        if (RenderCaptureActive()) {
            NumericTag tag = {};
            tag.key = chestKey;
            tag.kind = 0x15;
            DWORD index = 0;
            void* icon = worldLookup(controller, &chestType, &tag, &index);
            QueueRenderState(icon, 2, 0);
        }
    }
    return result;
}

// Hook on the world-map update. This is the one safe moment, on the game's own
// map thread, where pending removal and creation requests are carried out.
uintptr_t ObserveWorldMapUpdate(void* controller, float elapsed) {
    // dabd10 consumes RCX and scalar XMM1. It owns the entire layer loop and
    // clears its update flag at dadc12. Service changes only after it returns,
    // so no per-layer callback is required and its finalizer cannot clear a
    // flag set by our newly created icon. No controller is cached on the worker.
    // (RCX and XMM1 are the CPU registers that carry the 1st argument and a
    // float 2nd argument in the Windows x64 calling convention.)
    uintptr_t result = originalUpdateWorldMap(controller, elapsed);
    InterlockedIncrement(&worldMapUpdateCalls);
    uintptr_t table = 0;
    if (Read(controller, &table, sizeof(table)) && table == imageBase + 0x566ff50) {
        ServiceRemoval(controller);
        ServiceCreation(controller);
    }
    return result;
}

// ===========================================================================
// Section: carrying out creation and removal (runs on the game's map thread)
// ===========================================================================

// If F6 requested a chest (and no removal is pending), resolve where it should
// go and create it. Each failure sets creationOutcome and gives up.
void ServiceCreation(void* controller) {
    if (InterlockedCompareExchange(&generationEnabled, 0, 0) != 1 ||
        InterlockedCompareExchange(&removalRequested, 0, 0) != 0 ||
        InterlockedCompareExchange(&creationRequested, 2, 1) != 1) {
        return;
    }
    void* parent = nullptr;
    uintptr_t record = 0;
    MarkerDefinition definition = CopyDefinition(false);
    if (!definition.enabled
        || !ResolveIndependentParent(controller, definition.position, parent, record)) {
        InterlockedExchange(&creationRequested, 0);
        InterlockedExchange(&creationOutcome, 3);
        InterlockedIncrement(&definitionRejected);
        return;
    }
    const void* presentation = nullptr;
    if (!ResolvePresentation(record, presentation)) {
        InterlockedExchange(&creationRequested, 0);
        InterlockedExchange(&creationOutcome, 5);
        return;
    }
    CreateIndependentChest(controller, parent, presentation, definition);
    InterlockedExchange(&creationRequested, 0);
}

// Remove our chest if removal was requested. Only an icon that this session
// owns and that still matches our exact identity is ever removed.
// Step 1 (request == 1): call the game's removal once. Step 2 (request == 2):
// on later updates, wait up to 3 seconds for the icon to disappear.
void ServiceRemovalInternal(void* controller) {
    LONG request = InterlockedCompareExchange(&removalRequested, 0, 0);
    if (!request || InterlockedCompareExchange(&generationEnabled, 0, 0) != 0) {
        return;
    }
    if (InterlockedCompareExchange(&ownedChest, 0, 0) != 1) {
        InterlockedExchange(&removalRequested, 0);
        InterlockedExchange(&removalOutcome, 5);
        return;
    }
    NumericTag tag = {};
    tag.key = chestKey;
    tag.kind = 0x15;
    DWORD index = 0;
    void* icon = worldLookup(controller, &chestType, &tag, &index);
    if (!icon) {
        InterlockedExchange(&ownedChest, 0);
        InterlockedExchange(&removalRequested, 0);
        InterlockedIncrement(request == 2 ? &removalConfirmed : &removalAbsent);
        InterlockedExchange(&removalOutcome, request == 2 ? 3 : 4);
        return;
    }
    if (!IsPrivateChest(icon) || !ChestDefinitionReady()) {
        // A key alone is not sufficient authority to remove a native object.
        // Refuse changed identity/definition; never adopt or rewrite that icon.
        InterlockedExchange(&ownedChest, 0);
        InterlockedExchange(&removalRequested, 0);
        InterlockedIncrement(&removalRejected);
        InterlockedExchange(&removalOutcome, 6);
        return;
    }
    if (request == 1) {
        InterlockedIncrement(&removalAttempts);
        InterlockedExchange64(&removalWaitStarted, static_cast<LONG64>(GetTickCount64()));
        InterlockedExchange(&removalRequested, 2);
        InterlockedExchange(&removalOutcome, 2);
        // This is the native UI removal entry used by the shared creator.
        // Type and index are passed by value, unlike the lookup ABI. Do not
        // bypass its native deferred-removal or registry cleanup branches.
        removeWorldIcon(controller, chestType, &tag, index);
        // The old icon may be freed now. Inspect only a fresh lookup result.
        if (!worldLookup(controller, &chestType, &tag, &index)) {
            InterlockedExchange(&ownedChest, 0);
            InterlockedExchange(&removalRequested, 0);
            InterlockedIncrement(&removalConfirmed);
            InterlockedExchange(&removalOutcome, 3);
        }
    } else {
        LONG64 started = InterlockedCompareExchange64(&removalWaitStarted, 0, 0);
        if (GetTickCount64() - static_cast<ULONGLONG>(started) >= 3000) {
            // A native call can defer removal. Poll rather than issuing it
            // repeatedly; if still present, report and leave reload as fallback.
            InterlockedExchange(&removalRequested, 0);
            InterlockedExchange(&removalOutcome, 7);
        }
    }
}

// Wrapper that makes sure only one removal attempt runs at a time.
void ServiceRemoval(void* controller) {
    // Native removal may re-enter UI callbacks. Serialize requests across any
    // nested callbacks without blocking the game's thread or retrying a call.
    if (InterlockedCompareExchange(&removalServicing, 1, 0) != 0) {
        return;
    }
    ServiceRemovalInternal(controller);
    InterlockedExchange(&removalServicing, 0);
}

// ===========================================================================
// Section: more observation hooks and the diagnostic queue
// ===========================================================================

// Hook on the game's "set one suppression bit" helper. Records before/after
// bits for our own chest only, and changes nothing.
uintptr_t ObserveVisibility(void* icon, BYTE bit, BYTE enabled) {
    // The native helper sets one of 24 suppression bits, then toggles the UI
    // only if their combined zero/nonzero state changed. Observe its arguments
    // and return value unchanged; never clear a bit to force an icon visible.
    VisibilityEvent event = {};
    event.caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    event.bit = bit;
    event.enabled = enabled;
    bool watched = IsPrivateChest(icon) &&
        Read(static_cast<const BYTE*>(icon) + 0x1e8, event.before, sizeof(event.before));
    uintptr_t result = originalVisibility(icon, bit, enabled);
    if (!watched) {
        return result;
    }
    // Recheck identity after the native callback; do not retain its pointer on
    // the worker or assume a UI callback guarantees the object's lifetime.
    event.afterRead = IsPrivateChest(icon) &&
        Read(static_cast<const BYTE*>(icon) + 0x1e8, event.after, sizeof(event.after));
    // Never wait for the lock on the game's thread: if busy, drop the event.
    if (!TryAcquireSRWLockExclusive(&sampleLock)) {
        InterlockedIncrement(&droppedSamples);
        return result;
    }
    bool duplicate = false;
    for (unsigned index = 0; index < visibilitySeenCount; ++index) {
        const auto& prior = visibilitySeen[index];
        if (prior.caller == event.caller && prior.bit == event.bit &&
            prior.enabled == event.enabled && prior.afterRead == event.afterRead &&
            memcmp(prior.before, event.before, sizeof(event.before)) == 0 &&
            memcmp(prior.after, event.after, sizeof(event.after)) == 0) {
            duplicate = true;
            break;
        }
    }
    if (!duplicate) {
        if (visibilitySeenCount < _countof(visibilitySeen) &&
            visibilityPendingCount < _countof(visibilityPending)) {
            visibilitySeen[visibilitySeenCount++] = event;
            visibilityPending[visibilityPendingCount++] = event;
        } else {
            InterlockedIncrement(&droppedSamples);
        }
    }
    ReleaseSRWLockExclusive(&sampleLock);
    return result;
}

// Read the name of a map-icon template (e.g. "MapIcon_Gimmick_LevelTreasureBox")
// from game memory. Accepts only letters, digits, '_' and '-', up to 127 chars.
bool ReadTemplateName(const void* record, char (&name)[128]) {
    const void* stringField = nullptr;
    const char* text = nullptr;
    if (!record || !Read(static_cast<const BYTE*>(record) + 0x18,
        &stringField, sizeof(stringField)) ||
        !Read(stringField, &text, sizeof(text)) || !text) {
        return false;
    }
    for (unsigned index = 0; index < sizeof(name); ++index) {
        char value = 0;
        if (!Read(text + index, &value, sizeof(value))) {
            return false;
        }
        if (value == '\0') {
            return index != 0;
        }
        if (!((value >= 'a' && value <= 'z') || (value >= 'A' && value <= 'Z') ||
              (value >= '0' && value <= '9') || value == '_' || value == '-')) {
            return false;
        }
        name[index] = value;
    }
    return false;
}

// Add a sample to the log queue unless an identical one was already queued.
void Queue(const Sample& sample) {
    // Do not block the game's map thread on diagnostic disk I/O or the worker.
    if (!TryAcquireSRWLockExclusive(&sampleLock)) {
        InterlockedIncrement(&droppedSamples);
        return;
    }
    bool duplicate = false;
    for (unsigned index = 0; index < seenCount; ++index) {
        const Sample& prior = seen[index];
        if (prior.controller == sample.controller && prior.type == sample.type &&
            prior.categoryRead == sample.categoryRead && prior.category == sample.category &&
            prior.tag[8] == sample.tag[8] &&
            prior.templateTypeRead == sample.templateTypeRead &&
            prior.templateType == sample.templateType &&
            prior.generated == sample.generated && prior.iconVerified == sample.iconVerified &&
            prior.visibilityRead == sample.visibilityRead &&
            memcmp(prior.visibility, sample.visibility, sizeof(sample.visibility)) == 0 &&
            prior.initializationObserved == sample.initializationObserved &&
            prior.initializationResult == sample.initializationResult &&
            prior.baseIconPresent == sample.baseIconPresent &&
            prior.phase == sample.phase && prior.calculatedScale == sample.calculatedScale &&
            (!sample.generated
                || memcmp(prior.position, sample.position, sizeof(sample.position)) == 0) &&
            strcmp(prior.markerName, sample.markerName) == 0 &&
            strcmp(prior.templateName, sample.templateName) == 0) {
            duplicate = true;
            break;
        }
    }
    if (!duplicate) {
        if (seenCount < _countof(seen) && pendingCount < _countof(pending)) {
            seen[seenCount++] = sample;
            pending[pendingCount++] = sample;
        } else {
            InterlockedIncrement(&droppedSamples);
        }
    }
    ReleaseSRWLockExclusive(&sampleLock);
}

// Hook on the "look up icon type definition" function. During a sampled
// creation, records the type's category (+0x2c) and template type (+0x20).
void* ObserveType(const WORD* type) {
    void* result = originalType(type);
    WORD requested = 0;
    if (activeSample && Read(type, &requested, sizeof(requested)) &&
        requested == activeSample->type && result) {
        // Native pin-selection code independently reads category at info+0x2c.
        // A failed read stays unknown; no category is inferred from a texture.
        DWORD category = 0;
        if (Read(static_cast<const BYTE*>(result) + 0x2c,
            &category, sizeof(category))) {
            activeSample->category = category;
            activeSample->categoryRead = true;
        }
        activeSample->templateTypeRead = Read(static_cast<const BYTE*>(result) + 0x20,
            &activeSample->templateType, sizeof(activeSample->templateType));
    }
    return result;
}

// Hook on the "look up icon template" function. During a sampled creation,
// records the template's name.
void* ObserveTemplate(const WORD* type) {
    void* result = originalTemplate(type);
    WORD requested = 0;
    if (!activeSample || !activeSample->templateTypeRead || !result ||
        !Read(type, &requested, sizeof(requested)) || requested != activeSample->templateType) {
        return result;
    }

    // The shared native creator reads [template record+0x18], then dereferences
    // that field to obtain its template name. Follow only these two traced
    // pointers using bounded self-process reads, without invoking native code.
    char name[128] = {};
    if (ReadTemplateName(result, name)) {
        memcpy(activeSample->templateName, name, sizeof(name));
    }
    return result;
}

// Hook on the shared icon-creation function used by the world map (vtable
// RVA 0x566ff50) and the minimap (0x5674e00). It samples each creation for the
// log; calls from any other controller are passed straight through.
uintptr_t ObserveCreate(void* controller, const WORD* type, const void* tag,
    const DWORD* index, const void* scale, const float* position,
    const void* appearance, BYTE flag, const void* data, BYTE finalFlag) {
    InterlockedIncrement(&creationCalls);
    uintptr_t table = 0;
    WORD typeValue = 0;
    bool supported = Read(controller, &table, sizeof(table)) &&
        (table == imageBase + 0x566ff50 || table == imageBase + 0x5674e00) &&
        Read(type, &typeValue, sizeof(typeValue));
    if (!supported) {
        return originalCreate(controller, type, tag, index, scale, position,
            appearance, flag, data, finalFlag);
    }

    Sample sample = {};
    sample.controller = table - imageBase;
    sample.type = typeValue;
    sample.creationFlag = flag;
    sample.finalFlag = finalFlag;
    Read(tag, sample.tag, sizeof(sample.tag));
    sample.positionRead = Read(position, sample.position, sizeof(sample.position));
    // While the original runs, the other hooks fill in this sample.
    Sample* previous = activeSample;
    activeSample = &sample;
    uintptr_t result = originalCreate(controller, type, tag, index, scale,
        position, appearance, flag, data, finalFlag);
    activeSample = previous;
    DWORD actualIndex = 0;
    if (Read(index, &actualIndex, sizeof(actualIndex))) {
        LookupIcon lookup = sample.controller == 0x566ff50 ? worldLookup : minimapLookup;
        CaptureIconState(lookup(controller, type, tag, index), sample);
    }
    InterlockedIncrement(&sampledCalls);
    if (sample.templateName[0]) {
        InterlockedIncrement(&namedSamples);
    }
    Queue(sample);
    return result;
}

// ===========================================================================
// Section: creating the proof chest (map thread, called by ServiceCreation)
// ===========================================================================

// Ask the game to create our chest at the definition's position, then look it
// up again to confirm it really exists with our identity. Ownership (and thus
// permission to remove it later) is taken only after that confirmation.
void CreateIndependentChest(void* controller, void* parent, const void* presentation,
    const MarkerDefinition& definition) {
    if (creatingChest || InterlockedCompareExchange(&generationEnabled, 0, 0) != 1) {
        return;
    }

    // Keep a private numeric identity, not an invented scene-object UUID.
    // Its category/template is now the verified chest definition, not a pin.
    NumericTag tag = {};
    tag.key = chestKey;
    tag.kind = 0x15;
    DWORD lookupIndex = 0;
    LookupIcon lookup = worldLookup;
    if (lookup(controller, &chestType, &tag, &lookupIndex)) {
        InterlockedIncrement(&occupiedKeys);
        InterlockedExchange(&creationOutcome, 2);
        return;
    }
    AcquireSRWLockExclusive(&definitionLock);
    activeDefinition = definition;
    ReleaseSRWLockExclusive(&definitionLock);

    Sample generated = {};
    generated.controller = 0x566ff50;
    generated.type = chestType;
    generated.generated = true;
    generated.finalFlag = 1;
    generated.positionRead = true;
    memcpy(generated.tag, &tag, sizeof(tag));
    memcpy(generated.position, definition.position, sizeof(definition.position));
    strcpy_s(generated.markerName, definition.name);
    Sample* previous = activeSample;
    void* previousRequestedContainer = requestedChestContainer;
    requestedChestContainer = parent;
    activeSample = &generated;
    creatingChest = true;
    // The native pin callback zero-initializes this 0x28-byte collection before
    // adding an optional property. An empty collection has no allocation or
    // element vtables to invent and count/entries stay zero. No borrowed pin
    // property, pin identity, saved record or capture hook is needed here.
    alignas(8) BYTE emptyProperties[0x28] = {};
    float scalar = 0;
    originalCreate(controller, &chestType, &tag, &lookupIndex, &scalar,
        definition.position, presentation, 0, emptyProperties, 1);
    creatingChest = false;
    activeSample = previous;
    requestedChestContainer = previousRequestedContainer;
    InterlockedIncrement(&generatedCalls);

    // Read back: find the icon again and check type, tag and position.
    void* icon = lookup(controller, &chestType, &tag, &lookupIndex);
    CaptureIconState(icon, generated);
    WORD actualType = 0;
    NumericTag actualTag = {};
    float actualPosition[3] = {};
    if (icon && Read(static_cast<const BYTE*>(icon) + 0xde, &actualType, sizeof(actualType)) &&
        Read(static_cast<const BYTE*>(icon) + 0xc8, &actualTag, sizeof(actualTag)) &&
        Read(static_cast<const BYTE*>(icon) + 0xe0, actualPosition, sizeof(actualPosition)) &&
        actualType == chestType && actualTag.key == chestKey && actualTag.kind == 0x15 &&
        memcmp(actualPosition, definition.position, sizeof(definition.position)) == 0) {
        generated.iconVerified = true;
        InterlockedOr(&generatedReadbackMask, 1);
        if (generated.containerRouted) {
            // Ownership is acquired only after our own creation/readback,
            // never by discovering an already occupied private key.
            InterlockedExchange(&ownedChest, 1);
            InterlockedExchange(&creationOutcome, 1);
            if (InterlockedCompareExchange(&generationEnabled, 0, 0) == 0) {
                // F10/focus loss can race an in-flight native creation.
                InterlockedExchange(&removalRequested, 1);
                InterlockedExchange(&removalOutcome, 1);
            }
        }
    }
    if (!generated.iconVerified || !generated.containerRouted) {
        InterlockedExchange(&creationOutcome, 6);
    }
    Queue(generated);
}

// ===========================================================================
// Section: logging and the "Bell completed" action
// ===========================================================================

// Append one line to native-map-categories.log (worker thread only).
void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

// Called only by the worker. Native removal stays on the map thread and uses
// its existing ownership/identity checks; this never touches built-in pins.
// (It only sets flags; ServiceRemoval() does the actual work on the map thread.)
void HideCompletedProof() {
    InterlockedExchange(&generationEnabled, 0);
    InterlockedExchange(&creationRequested, 0);
    InterlockedExchange(&removalRequested, 1);
    InterlockedExchange(&removalOutcome, 1);
    Log("Hernand Bell explicitly completed in selected save; proof creation blocked and scoped removal requested.");
}

#ifdef PYWEL_ATLAS_COMBINED
// ===========================================================================
// Section: combined build - the marker follows the detected loaded save
// ---------------------------------------------------------------------------
// In the combined Pywel Atlas mod, the save-detection part says which save is
// loaded and publishes the Bells read from the slot the game last saved it to
// (see src/pywel-atlas/LoadedSave.h). This replaces the hand-picked slot
// (F9) and the manual read (F7). Rules:
//   - Only an accepted ("valid") result can decide anything. While nothing
//     is known (just after a load, or if a read failed), F6 is withheld and
//     no "completed" decision is made: unknown never means "not completed".
//   - If the linked Bell is completed in the loaded save, the proof chest is
//     removed and cannot be created again for that save.
//   - When a different save is loaded (a new load scope), the old save's
//     chest is removed, and the new save's result decides from then on.
// ===========================================================================

// Same flags as HideCompletedProof, with a caller-specific log line.
void RequestProofRemoval(const char* reason) {
    InterlockedExchange(&generationEnabled, 0);
    InterlockedExchange(&creationRequested, 0);
    InterlockedExchange(&removalRequested, 1);
    InterlockedExchange(&removalOutcome, 1);
    Log(reason);
}

// The worker's memory of the last decision it made from a detected result.
struct DetectedLink {
    int bell; // Index of the linked Bell (FindBellIndex); Hernand until F6 loads a definition.
    bool known; // A valid detected result has been applied at least once.
    LONG loadScope; // Load the last decision belonged to.
    unsigned serial; // Selection serial of that result.
    unsigned readSlot; // Slot it was read from.
    bool completed; // Whether the linked Bell was completed in it.
};

// Is the linked Bell explicitly completed in this detected result?
bool LinkedBellCompleted(const LoadedSaveBell& loaded, const DetectedLink& link) {
    return link.bell >= 0 && ((loaded.bell.completedMask >> link.bell) & 1u) != 0;
}

// Called every worker loop: applies a new detected result to the marker.
void FollowLoadedSave(DetectedLink& link) {
    LoadedSaveBell loaded = {};
    if (!PywelGetLoadedSaveBell(loaded)) {
        return; // Not known right now: keep the last decision; F6 checks again.
    }
    bool completed = LinkedBellCompleted(loaded, link);
    bool newLoad = link.known && loaded.loadScope != link.loadScope;
    if (link.known && !newLoad && loaded.serial == link.serial &&
        loaded.readSlot == link.readSlot && completed == link.completed) {
        return; // Nothing new.
    }
    char line[256];
    sprintf_s(line, "Detected save: serial=%u loadScope=%ld loadedSlot=%u readSlot=%u bell=%s completed=%u newLoad=%u",
        loaded.serial, loaded.loadScope, loaded.loadedSlot, loaded.readSlot, BellName(link.bell),
        completed ? 1u : 0u, newLoad ? 1u : 0u);
    Log(line);
    if (newLoad && !completed) {
        RequestProofRemoval("A different save was loaded; the previous save's proof chest is removed.");
    }
    if (completed && (!link.known || !link.completed || newLoad)) {
        sprintf_s(line, "%s is explicitly completed in the loaded save; proof creation blocked and scoped removal requested.",
            BellName(link.bell));
        RequestProofRemoval(line);
    }
    link.known = true;
    link.loadScope = loaded.loadScope;
    link.serial = loaded.serial;
    link.readSlot = loaded.readSlot;
    link.completed = completed;
}

// F6 in the combined build: load the marker JSON (which names its Bell), then
// show the chest only if the detected loaded save says that Bell is not
// completed. `generationDeadline` is the worker's 3-minute display limit.
void ShowMarkerFromDetectedSave(const wchar_t* definitionPath, DetectedLink& link,
    ULONGLONG& generationDeadline) {
    if (InterlockedCompareExchange(&removalRequested, 0, 0) != 0) {
        Log("F6 skipped: removal pending. Keep/open Pywel so its UI callback can finish cleanup.");
        return;
    }
    MarkerDefinition definition = {};
    char error[256] = {};
    if (!LoadMarkerDefinition(definitionPath, definition, error)) {
        char line[320];
        sprintf_s(line, "Definition rejected; existing state retained: %s", error);
        Log(line);
        MessageBeep(MB_ICONWARNING);
        return;
    }
    // The definition names its Bell; "none" keeps the original Hernand link.
    int bell = FindBellIndex(definition.completionBell[0] ? definition.completionBell : "mg:543894");
    if (bell != link.bell) {
        link.bell = bell;
        link.known = false; // Re-decide from the next detected result for the new Bell.
    }
    if (!definition.enabled) {
        RequestProofRemoval("Definition enabled=false; generation OFF and scoped removal requested.");
        return;
    }
    LoadedSaveBell loaded = {};
    if (!PywelGetLoadedSaveBell(loaded)) {
        Log("F6 withheld: the loaded save is not confirmed yet (no accepted Bell read). Try again in a few seconds.");
        MessageBeep(MB_ICONWARNING);
        return;
    }
    if (LinkedBellCompleted(loaded, link)) {
        char line[256];
        sprintf_s(line, "F6 withheld: %s is explicitly completed in the loaded save (slot %u).",
            BellName(link.bell), loaded.readSlot);
        RequestProofRemoval(line);
        MessageBeep(MB_OK);
        return;
    }
    AcquireSRWLockExclusive(&definitionLock);
    stagedDefinition = definition;
    ReleaseSRWLockExclusive(&definitionLock);
    generationDeadline = GetTickCount64() + 180000;
    InterlockedExchange(&generatedReadbackMask, 0);
    InterlockedExchange(&generationEnabled, 1);
    InterlockedExchange(&creationOutcome, 0);
    InterlockedExchange(&creationRequested, 1);
    char line[384];
    sprintf_s(line,
        "Definition loaded name=%s XYZ=(%.6f,%.6f,%.6f); %s not completed in loaded save slot %u (serial %u); creation requested.",
        definition.name, definition.position[0], definition.position[1], definition.position[2],
        BellName(link.bell), loaded.readSlot, loaded.serial);
    Log(line);
    MessageBeep(MB_OK);
}
#endif

// ===========================================================================
// Section: reading the game's icon definition tables (read-only)
// The game keeps arrays ("tables") of icon type definitions and templates.
// These helpers read them to confirm the chest type looks exactly as expected.
// ===========================================================================

// A snapshot of one table header: table address, entry count, entry array.
struct TableView {
    uintptr_t table;
    DWORD count;
    uintptr_t cache;
};

// Read the table whose pointer is stored at `pointerRva`. Fails if anything is
// missing or the count is 0 or above `maximum`.
bool ReadTable(uintptr_t pointerRva, DWORD maximum, TableView& view) {
    if (!Read(reinterpret_cast<const void*>(imageBase + pointerRva),
        &view.table, sizeof(view.table)) || !view.table ||
        !Read(reinterpret_cast<const void*>(view.table + 8), &view.count, sizeof(view.count)) ||
        !view.count || view.count > maximum ||
        !Read(reinterpret_cast<const void*>(view.table + 0x58), &view.cache, sizeof(view.cache))) {
        return false;
    }
    return view.cache != 0;
}

// True if two table snapshots are identical (the table did not change between them).
bool SameTable(const TableView& left, const TableView& right) {
    return left.table == right.table && left.count == right.count && left.cache == right.cache;
}

// True only if icon type 226 is already loaded and matches the verified chest:
// template type 28852, category 0xffffffff, template "MapIcon_Gimmick_LevelTreasureBox".
bool ChestDefinitionReady() {
    TableView icons = {};
    TableView templates = {};
    uintptr_t record = 0;
    uintptr_t templateRecord = 0;
    WORD secondary = 0;
    DWORD category = 0;
    char name[128] = {};
    return ReadTable(kIconTablePointerRva, 4096, icons) && chestType < icons.count &&
        ReadTable(kTemplateTablePointerRva, 65536, templates) &&
        Read(reinterpret_cast<const void*>(icons.cache + chestType * sizeof(uintptr_t)),
            &record, sizeof(record)) && record &&
        Read(reinterpret_cast<const void*>(record + 0x20), &secondary, sizeof(secondary)) &&
        secondary == 28852 && secondary < templates.count &&
        Read(reinterpret_cast<const void*>(record + 0x2c), &category, sizeof(category)) &&
        category == 0xffffffff &&
        Read(reinterpret_cast<const void*>(templates.cache + secondary * sizeof(uintptr_t)),
            &templateRecord, sizeof(templateRecord)) &&
        ReadTemplateName(reinterpret_cast<const void*>(templateRecord), name) &&
        strcmp(name, "MapIcon_Gimmick_LevelTreasureBox") == 0;
}

// Choose which map layer ("parent container") the chest is created in, the
// same way the game's own code chooses (as traced). Uses icon type 1's
// definition as configuration, plus the game's live altitude threshold: at or
// above it, container 3 is used instead.
bool ResolveIndependentParent(void* controller, const float (&position)[3],
    void*& parent, uintptr_t& chestRecord) {
    TableView icons = {};
    uintptr_t pinRecord = 0;
    BYTE selector = 0;
    BYTE altitudeBranch = 0;
    DWORD category = 0;
    float threshold = 0;
    uintptr_t containers = 0;
    DWORD containerCount = 0;
    uintptr_t parentTable = 0;
    if (!ChestDefinitionReady() || !ReadTable(kIconTablePointerRva, 4096, icons) ||
        !Read(reinterpret_cast<const void*>(icons.cache + chestType * sizeof(uintptr_t)),
            &chestRecord, sizeof(chestRecord)) ||
        !Read(reinterpret_cast<const void*>(icons.cache + sizeof(uintptr_t)),
            &pinRecord, sizeof(pinRecord)) || !pinRecord ||
        !Read(reinterpret_cast<const void*>(pinRecord + 0x2c), &category, sizeof(category)) ||
        category != 0x25 ||
        !Read(reinterpret_cast<const void*>(pinRecord + 0x2a), &selector, sizeof(selector)) ||
        selector != 1 ||
        !Read(reinterpret_cast<const void*>(pinRecord + 0xb7),
            &altitudeBranch, sizeof(altitudeBranch)) ||
        altitudeBranch != 1 ||
        !Read(reinterpret_cast<const void*>(imageBase + kParentAltitudeThresholdRva),
            &threshold, sizeof(threshold)) || !std::isfinite(threshold)) {
        return false;
    }
    // Replicate the traced native parent selection, using cached definition 1
    // as configuration only. No saved pin, Bell callback or position is read.
    // The threshold is a live native value, not a guessed Pywel/Abyss boundary.
    if (position[1] >= threshold) {
        selector = 3;
    }
    // Pick container[selector] from the controller (+0x398 array, +0x3a0 count)
    // and check that its vtable lies inside the game executable.
    return Read(static_cast<const BYTE*>(controller) + 0x3a0,
            &containerCount, sizeof(containerCount)) &&
        containerCount > selector && containerCount <= 16 &&
        Read(static_cast<const BYTE*>(controller) + 0x398,
            &containers, sizeof(containers)) && containers &&
        Read(reinterpret_cast<const void*>(containers + selector * sizeof(uintptr_t)),
            &parent, sizeof(parent)) && parent &&
        Read(parent, &parentTable, sizeof(parentTable)) &&
        parentTable >= imageBase && parentTable < imageBase + kExpectedImageSize;
}

// Get the chest's "presentation" value by calling the provider object found at
// record+0x68 (2nd vtable entry). Before calling, checks that the target is
// inside the game executable and in committed, executable, non-guard memory.
bool ResolvePresentation(uintptr_t record, const void*& presentation) {
    void* provider = nullptr;
    uintptr_t table = 0;
    uintptr_t method = 0;
    if (!Read(reinterpret_cast<const void*>(record + 0x68), &provider, sizeof(provider)) ||
        !provider || !Read(provider, &table, sizeof(table)) ||
        !Read(reinterpret_cast<const void*>(table + 8), &method, sizeof(method)) ||
        method < imageBase || method >= imageBase + kExpectedImageSize) {
        return false;
    }
    MEMORY_BASIC_INFORMATION memory = {};
    if (!VirtualQuery(reinterpret_cast<const void*>(method), &memory, sizeof(memory)) ||
        memory.State != MEM_COMMIT || (memory.Protect & (PAGE_GUARD | PAGE_NOACCESS)) ||
        !(memory.Protect & (PAGE_EXECUTE | PAGE_EXECUTE_READ |
            PAGE_EXECUTE_READWRITE | PAGE_EXECUTE_WRITECOPY))) {
        return false;
    }
    // Native df88c0 and common init both use this exact provider ABI. Resolve
    // the chest's own stable metadata field on the UI thread; never retain a
    // value borrowed from a personal-pin callback across events.
    presentation = reinterpret_cast<GetPresentation>(method)(provider, 0);
    return presentation != nullptr;
}

// F8 diagnostic (only while generation is off): log already-loaded icon
// definitions whose template names look relevant, plus raw bytes for a few
// selected type ids (1, 226-229, 360).
void SnapshotCachedDefinitions() {
    // This reads only existing metadata cache entries. It never calls the lazy
    // loaders for missing IDs. The worker touches no scene/controller objects.
    // Recheck table headers to flag a snapshot that overlapped a cache change.
    TableView icons = {};
    TableView templates = {};
    if (!ReadTable(kIconTablePointerRva, 4096, icons) ||
        !ReadTable(kTemplateTablePointerRva, 65536, templates)) {
        Log("catalogue unavailable: metadata caches not ready or outside supported bounds");
        return;
    }
    Log("catalogue begin: cached metadata only; entries do not imply a scene marker exists");
    unsigned loaded = 0;
    unsigned named = 0;
    unsigned relevant = 0;
    for (DWORD index = 0; index < icons.count; ++index) {
        uintptr_t record = 0;
        if (!Read(reinterpret_cast<const void*>(icons.cache + index * sizeof(uintptr_t)),
            &record, sizeof(record)) || !record) {
            continue;
        }
        ++loaded;
        WORD templateType = 0;
        DWORD category = 0;
        uintptr_t templateRecord = 0;
        char name[128] = {};
        if (!Read(reinterpret_cast<const void*>(record + 0x20), &templateType, sizeof(templateType)) ||
            !Read(reinterpret_cast<const void*>(record + 0x2c), &category, sizeof(category)) ||
            templateType >= templates.count ||
            !Read(reinterpret_cast<const void*>(templates.cache + templateType * sizeof(uintptr_t)),
                &templateRecord, sizeof(templateRecord)) ||
            !ReadTemplateName(reinterpret_cast<const void*>(templateRecord), name)) {
            continue;
        }
        ++named;
        if (index == 1 || (index >= 226 && index <= 229) || index == 360) {
            // Equal template names do not imply equal map placement behaviour.
            // World creation selects a container with byte +0x2a; projection
            // branches on +0xb0 and altitude placement on +0xb7. Preserve the
            // bounded raw definition bytes to examine other fields offline.
            BYTE definition[0xa0] = {};
            if (Read(reinterpret_cast<const void*>(record + 0x20),
                definition, sizeof(definition))) {
                char details[512];
                sprintf_s(details, "definition type=%lu containerSelector=%u "
                    "projectionBranch=%u altitudeBranch=%u raw20toBF=",
                    index, definition[0x0a], definition[0x90], definition[0x97]);
                size_t length = strlen(details);
                for (unsigned byte = 0; byte < sizeof(definition); ++byte) {
                    sprintf_s(details + length, sizeof(details) - length,
                        "%02x", definition[byte]);
                    length += 2;
                }
                Log(details);
            } else {
                Log("definition bytes unavailable; no native loader invoked");
            }
        }
        if (!strstr(name, "Gimmick") && !strstr(name, "Treasure") &&
            !strstr(name, "Pin_Marker")) {
            continue;
        }
        ++relevant;
        char line[256];
        sprintf_s(line, "catalogue type=%lu category=0x%lx templateType=%u template=%s",
            index, category, static_cast<unsigned>(templateType), name);
        Log(line);
    }
    TableView afterIcons = {};
    TableView afterTemplates = {};
    bool stable = ReadTable(kIconTablePointerRva, 4096, afterIcons) &&
        ReadTable(kTemplateTablePointerRva, 65536, afterTemplates) &&
        SameTable(icons, afterIcons) && SameTable(templates, afterTemplates);
    char line[256];
    sprintf_s(line, "catalogue end types=%lu cached=%u named=%u relevant=%u headersStable=%u",
        icons.count, loaded, named, relevant, stable ? 1u : 0u);
    Log(line);
}

// ===========================================================================
// Section: the worker thread
// ===========================================================================

// Move all queued samples and visibility events out (under the lock), then
// write them to the log (outside the lock, so the game is never kept waiting).
void Drain() {
    Sample batch[128];
    VisibilityEvent visibilityBatch[128];
    AcquireSRWLockExclusive(&sampleLock);
    unsigned count = pendingCount;
    memcpy(batch, pending, count * sizeof(Sample));
    pendingCount = 0;
    unsigned visibilityCount = visibilityPendingCount;
    memcpy(visibilityBatch, visibilityPending, visibilityCount * sizeof(VisibilityEvent));
    visibilityPendingCount = 0;
    ReleaseSRWLockExclusive(&sampleLock);
    for (unsigned index = 0; index < count; ++index) {
        const Sample& sample = batch[index];
        uint64_t rawTag[2];
        memcpy(rawTag, sample.tag, sizeof(rawTag));
        char line[1024];
        sprintf_s(line,
            "controller=0x%llx type=%u categoryKnown=%u category=0x%lx "
            "tag=(0x%llx,0x%llx) tagByte8=0x%x xyzKnown=%u xyz=(%.6f,%.6f,%.6f) "
            "templateTypeKnown=%u templateType=%u template=%s generated=%u iconVerified=%u "
            "visibilityKnown=%u suppression=%02x%02x%02x ownerControllerPresent=%u creationFlag=%u finalFlag=%u containerRouted=%u "
            "initObserved=%u initResult=%u rootPresent=%u baseIconPresent=%u sizeKnown=%u size=(%.6f,%.6f) "
            "phase=%u calculatedScale=%.6f markerName=%s",
            static_cast<unsigned long long>(sample.controller),
            static_cast<unsigned>(sample.type), sample.categoryRead ? 1u : 0u,
            sample.category, static_cast<unsigned long long>(rawTag[0]),
            static_cast<unsigned long long>(rawTag[1]),
            static_cast<unsigned>(sample.tag[8]), sample.positionRead ? 1u : 0u,
            sample.position[0], sample.position[1], sample.position[2],
            sample.templateTypeRead ? 1u : 0u, static_cast<unsigned>(sample.templateType),
            sample.templateName[0] ? sample.templateName : "unknown",
            sample.generated ? 1u : 0u, sample.iconVerified ? 1u : 0u,
            sample.visibilityRead ? 1u : 0u, sample.visibility[0], sample.visibility[1],
            sample.visibility[2], sample.ownerControllerPresent ? 1u : 0u,
            sample.creationFlag, sample.finalFlag, sample.containerRouted ? 1u : 0u,
            sample.initializationObserved ? 1u : 0u, sample.initializationResult,
            sample.rootPresent ? 1u : 0u, sample.baseIconPresent ? 1u : 0u,
            sample.sizeRead ? 1u : 0u, sample.size[0], sample.size[1],
            sample.phase, sample.calculatedScale, sample.markerName);
        Log(line);
    }
    for (unsigned index = 0; index < visibilityCount; ++index) {
        const auto& event = visibilityBatch[index];
        char line[256];
        sprintf_s(line, "private-chest visibility caller=0x%llx bit=%u enabled=%u "
            "before=%02x%02x%02x afterKnown=%u after=%02x%02x%02x",
            static_cast<unsigned long long>(event.caller), event.bit, event.enabled,
            event.before[0], event.before[1], event.before[2], event.afterRead ? 1u : 0u,
            event.after[0], event.after[1], event.after[2]);
        Log(line);
    }
}

// The worker thread's main function. Part 1: set up the log, check the game
// build and guard bytes, install hooks. Part 2: loop forever every 30 ms,
// handling hotkeys, periodic save refresh, outcome messages and the log queue.
DWORD WINAPI Run(void* address) {
    // Keep this DLL loaded for the life of the game ("pin" it), because hooks
    // point into it.
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    // All mod files live in %LOCALAPPDATA%\PywelAtlas.
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wchar_t definitionPath[MAX_PATH] = {};
    wcscpy_s(definitionPath, path);
    wcscat_s(definitionPath, L"\\native-map-marker.json");
    wchar_t runtimeDirectory[MAX_PATH] = {};
    wcscpy_s(runtimeDirectory, path);
    wcscat_s(path, L"\\native-map-categories.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
#ifdef PYWEL_ATLAS_COMBINED
    Log("Pywel Atlas combined v0.51 map marker - follows the detected loaded save; F9 and the manual save read are off");
#else
    Log("Pywel Atlas selected-save refresh proof v0.32 - F9 selects a slot; F7 enables Bell tracking");
#endif
    // Check the game executable's build timestamp and size from its PE header
    // (the standard header at the start of every Windows .exe).
    auto* base = reinterpret_cast<BYTE*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    const auto* dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    const auto* pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported executable; no hooks installed.");
        return 0;
    }
    // Guard bytes: every hooked or called site must still contain the expected code.
    for (const auto& site : kInspectSites) {
        if (memcmp(base + site.rva, site.context, sizeof(site.context)) != 0) {
            Log("Native entry changed; no hooks installed.");
            return 0;
        }
    }
#ifndef PYWEL_ATLAS_COMBINED
    if (MH_Initialize() != MH_OK) {
        Log("Could not initialize observation hooks.");
        return 0;
    }
#endif
    // (In the combined Pywel Atlas build, src/pywel-atlas/PywelAtlas.cpp
    // initializes MinHook once for both parts before starting this worker.)
    // kInspectSites index map (category-profile.h): 0-2, 5-9 and 12 are hooked
    // (see hookSites below); 3, 4 and 10 are game functions we call (world
    // lookup, minimap lookup, removal); 11 is only checked as a guard.
    static_assert(_countof(kInspectSites) == 13,
        "Nine hooks, three guarded calls and one parent-selection guard required");
    worldLookup = reinterpret_cast<LookupIcon>(base + kInspectSites[3].rva);
    minimapLookup = reinterpret_cast<LookupIcon>(base + kInspectSites[4].rva);
    removeWorldIcon = reinterpret_cast<RemoveWorldIcon>(base + kInspectSites[10].rva);
    // hooks[i] is our replacement; originals[i] receives the address to call the
    // real game function; hookSites[i] says which kInspectSites entry it hooks.
    void* hooks[] = {reinterpret_cast<void*>(&ObserveCreate),
        reinterpret_cast<void*>(&ObserveType), reinterpret_cast<void*>(&ObserveTemplate),
        reinterpret_cast<void*>(&ObserveVisibility), reinterpret_cast<void*>(&RouteWorldContainer),
        reinterpret_cast<void*>(&ObserveInitialize), reinterpret_cast<void*>(&ObserveWorldProjection),
        reinterpret_cast<void*>(&ObserveScale), reinterpret_cast<void*>(&ObserveWorldMapUpdate)};
    void** originals[] = {reinterpret_cast<void**>(&originalCreate),
        reinterpret_cast<void**>(&originalType), reinterpret_cast<void**>(&originalTemplate),
        reinterpret_cast<void**>(&originalVisibility), reinterpret_cast<void**>(&originalWorldCreate),
        reinterpret_cast<void**>(&originalInitialize), reinterpret_cast<void**>(&originalProjectWorld),
        reinterpret_cast<void**>(&originalCalculateScale),
        reinterpret_cast<void**>(&originalUpdateWorldMap)};
    constexpr unsigned hookSites[] = {0, 1, 2, 5, 6, 7, 8, 9, 12};
    static_assert(_countof(hookSites) == _countof(hooks), "Every hook needs an explicit site");
    for (unsigned index = 0; index < _countof(hooks); ++index) {
        unsigned siteIndex = hookSites[index];
        MH_STATUS status = MH_CreateHook(base + kInspectSites[siteIndex].rva,
            hooks[index], originals[index]);
        char line[160];
        sprintf_s(line, "Create observation hook rva=0x%llx: %s",
            static_cast<unsigned long long>(kInspectSites[siteIndex].rva), MH_StatusToString(status));
        Log(line);
        if (status != MH_OK) {
#ifdef PYWEL_ATLAS_COMBINED
            // Shared MinHook: remove only the hooks this part created.
            for (unsigned created = 0; created < index; ++created) {
                MH_RemoveHook(base + kInspectSites[hookSites[created]].rva);
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
    for (unsigned index = 0; index < _countof(hooks) && status == MH_OK; ++index) {
        status = MH_EnableHook(base + kInspectSites[hookSites[index]].rva);
    }
#else
    // Switch all hooks on at once.
    MH_STATUS status = MH_EnableHook(MH_ALL_HOOKS);
#endif
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        return 0;
    }
    Log("F6 requests one private chest for 3 minutes; open Pywel. No reload or saved pin is needed.");
    Log("F8 captures state. F10 disables and requests removal; keep/open Pywel to service it. Save identity is manual.");
    // previousFx: was the key down on the last loop? A key "press" is down now
    // but not before, so holding a key does not repeat its action.
    bool previousF6 = false;
    bool previousF8 = false;
    bool previousF7 = false;
    bool previousF9 = false;
    bool previousF10 = false;
    ULONGLONG generationDeadline = 0;
    bool renderWindowPending = false;
    LONG lastRemovalOutcome = 0;
    LONG lastCreationOutcome = 0;
    // All selection/reader state belongs to this worker. Slot changes disable
    // the link and remove the old session object before any new-slot creation.
    // Only copied marker/removal requests cross to the map thread.
    unsigned selectedSlot = LoadNativeSaveSlot(runtimeDirectory);
    bool bellLinkEnabled = false;
    bool lastRefreshCompleted = false;
    ULONGLONG nextSaveRefresh = 0;
#ifdef PYWEL_ATLAS_COMBINED
    // Combined build: the marker's Bell decision follows the detected save.
    DetectedLink link = {};
    link.bell = FindBellIndex("mg:543894"); // Hernand until F6 loads a definition.
#endif
    while (true) {
        Drain();
#ifdef PYWEL_ATLAS_COMBINED
        FollowLoadedSave(link);
#endif
        // Hotkeys count only while the game window is in front.
        DWORD foreground = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foreground);
        bool focused = foreground == GetCurrentProcessId();
        bool f6 = (GetAsyncKeyState(VK_F6) & 0x8000) != 0;
        bool f8 = (GetAsyncKeyState(VK_F8) & 0x8000) != 0;
        bool f7 = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
#ifdef PYWEL_ATLAS_COMBINED
        // Combined build: plain F7 is the save-detection checkpoint, so this
        // part's "read the selected save" action moves to Shift+F7.
        f7 = f7 && (GetAsyncKeyState(VK_SHIFT) & 0x8000) != 0;
#endif
        bool f9 = (GetAsyncKeyState(VK_F9) & 0x8000) != 0;
        bool f10 = (GetAsyncKeyState(VK_F10) & 0x8000) != 0;
#ifdef PYWEL_ATLAS_COMBINED
        // --- F6 (combined build): decide from the detected loaded save. ---
        if (focused && f6 && !previousF6) {
            ShowMarkerFromDetectedSave(definitionPath, link, generationDeadline);
        }
#else
        // --- F6: (if Bell tracking is on, re-check the save first) then load
        // the marker JSON and request creation for up to 3 minutes. ---
        if (focused && f6 && !previousF6) {
            bool visibilityAllowed = true;
            if (bellLinkEnabled) {
                NativeSaveSummary summary = {};
                char error[256] = {};
                if (!ReadSelectedBellSave(runtimeDirectory, selectedSlot, summary, error)) {
                    char line[384];
                    sprintf_s(line, "F6 save refresh failed; creation withheld, existing state retained: %s",
                        error);
                    Log(line);
                    MessageBeep(MB_ICONWARNING);
                    visibilityAllowed = false;
                } else {
                    lastRefreshCompleted = summary.hernandCompleted;
                    if (summary.hernandCompleted) {
                        HideCompletedProof();
                        MessageBeep(MB_OK);
                        visibilityAllowed = false;
                    }
                }
            }
            if (visibilityAllowed && InterlockedCompareExchange(&removalRequested, 0, 0) != 0) {
                Log("F6 skipped: removal pending. Keep/open Pywel so its UI callback can finish cleanup.");
            } else if (visibilityAllowed) {
                MarkerDefinition definition = {};
                char error[256] = {};
                if (!LoadMarkerDefinition(definitionPath, definition, error)) {
                    char line[320];
                    sprintf_s(line, "Definition rejected; existing state retained: %s", error);
                    Log(line);
                    MessageBeep(MB_ICONWARNING);
                } else if (!definition.enabled) {
                    InterlockedExchange(&generationEnabled, 0);
                    InterlockedExchange(&creationRequested, 0);
                    InterlockedExchange(&removalRequested, 1);
                    InterlockedExchange(&removalOutcome, 1);
                    Log("Definition enabled=false; generation OFF and scoped removal requested.");
                } else {
                    AcquireSRWLockExclusive(&definitionLock);
                    stagedDefinition = definition;
                    ReleaseSRWLockExclusive(&definitionLock);
                    generationDeadline = GetTickCount64() + 180000;
                    InterlockedExchange(&generatedReadbackMask, 0);
                    InterlockedExchange(&generationEnabled, 1);
                    InterlockedExchange(&creationOutcome, 0);
                    InterlockedExchange(&creationRequested, 1);
                    char line[320];
                    sprintf_s(line,
                        "Definition loaded name=%s XYZ=(%.6f,%.6f,%.6f); independent creation requested.",
                        definition.name, definition.position[0], definition.position[1],
                        definition.position[2]);
                    Log(line);
                    MessageBeep(MB_OK);
                }
            }
        }
        // --- F7: read the selected save now, enable Bell tracking, and show
        // the result in a message box. ---
        if (focused && f7 && !previousF7) {
            Log("Selected-slot save refresh requested; selection does not detect the loaded slot.");
            NativeSaveSummary summary = {};
            char error[256] = {};
            if (ReadSelectedBellSave(runtimeDirectory, selectedSlot, summary, error)) {
                bellLinkEnabled = true;
                lastRefreshCompleted = summary.hernandCompleted;
                nextSaveRefresh = GetTickCount64() + 5000;
                if (summary.hernandCompleted) {
                    HideCompletedProof();
                }
                char line[384];
                sprintf_s(line,
                    "Native save ready profile=%s coverage=%u recorded=%u completed=%u hernandConfirmed=%u; loadedSaveDetected=0",
                    summary.profile, summary.coverage, summary.recorded, summary.completed,
                    summary.hernandCompleted ? 1u : 0u);
                Log(line);
                wchar_t message[768];
                swprintf_s(message,
                    L"Selected slot%u read inside the mod.\n\nBells recorded: %u of %u\nExplicitly completed: %u\nHernand Bell: %ls\n\nSession proof link enabled: chest -> Hernand Bell.\n%ls\n\nOpen Pywel after dismissing this dialog to apply removal.\nF6 re-reads this slot; tracking refreshes every 5 seconds.\nLoaded-slot detection is not implemented.",
                    selectedSlot, summary.recorded, summary.coverage, summary.completed,
                    summary.hernandCompleted ? L"Save confirmed" : L"No explicit completion confirmed",
                    summary.hernandCompleted
                        ? L"Completed: proof chest removal requested; recreation blocked." :
                        L"Unconfirmed: no completion removal requested; F6 may show the chest.");
                MessageBoxW(nullptr, message, L"Pywel Atlas - native save proof",
                    MB_OK | MB_ICONINFORMATION);
            } else {
                char line[320];
                sprintf_s(line, "Native save proof rejected: %s", error);
                Log(line);
                wchar_t message[512] = {};
                MultiByteToWideChar(CP_UTF8, 0, error, -1, message, _countof(message));
                MessageBoxW(nullptr, message, L"Pywel Atlas - native save proof unavailable",
                    MB_OK | MB_ICONWARNING);
            }
            // The dialog runs on this worker, never the game's map thread.
            // Holding the hotkey while dismissing it must not repeat a read.
            f7 = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
        }
        // --- F9: choose a save slot. Changing slot turns Bell tracking off and
        // requests removal of the old chest. ---
        if (focused && f9 && !previousF9) {
            unsigned previousSlot = selectedSlot;
            char error[256] = {};
            if (ChooseNativeSaveSlot(runtimeDirectory, selectedSlot, error)) {
                if (selectedSlot != previousSlot) {
                    bellLinkEnabled = false;
                    lastRefreshCompleted = false;
                    InterlockedExchange(&generationEnabled, 0);
                    InterlockedExchange(&creationRequested, 0);
                    InterlockedExchange(&removalRequested, 1);
                    InterlockedExchange(&removalOutcome, 1);
                    Log("Slot changed: old link cleared; old owned marker cleanup requested. F7 enables the new slot.");
                }
                char line[160];
                sprintf_s(line, "Selected slot%u persisted locally; loadedSaveDetected=0.", selectedSlot);
                Log(line);
            } else if (error[0]) {
                Log(error);
                wchar_t message[512] = {};
                MultiByteToWideChar(CP_UTF8, 0, error, -1, message, _countof(message));
                MessageBoxW(nullptr, message, L"Pywel Atlas - save selection unavailable",
                    MB_OK | MB_ICONWARNING);
            }
            f9 = (GetAsyncKeyState(VK_F9) & 0x8000) != 0;
        }
#endif
        // (Combined build: F6 above replaces the hand-picked F9 slot, the
        // Shift+F7 manual read and the 5-second refresh below, which stays
        // off because bellLinkEnabled is never set.)
        // --- Every 5 seconds while Bell tracking is on: re-read the save and
        // request removal when the Hernand Bell newly reads as completed. ---
        // Serialized worker reads cannot finish against a newer selection:
        // selection and refresh never run concurrently. Failed reads supply no
        // completion decision and cannot consume the previous report as input.
        if (bellLinkEnabled && GetTickCount64() >= nextSaveRefresh) {
            NativeSaveSummary summary = {};
            char error[256] = {};
            if (ReadSelectedBellSave(runtimeDirectory, selectedSlot, summary, error)) {
                if (summary.hernandCompleted && !lastRefreshCompleted) {
                    HideCompletedProof();
                }
                lastRefreshCompleted = summary.hernandCompleted;
            } else {
                char line[384];
                sprintf_s(line, "Periodic save refresh unavailable; no visibility decision: %s", error);
                Log(line);
            }
            nextSaveRefresh = GetTickCount64() + 5000;
        }
        // --- F10, loss of game focus, or the 3-minute timeout: stop generation
        // and request removal. ---
        bool stopRequested = focused && f10 && !previousF10;
        if (stopRequested || (InterlockedCompareExchange(&generationEnabled, 0, 0) == 1 &&
            (!focused || GetTickCount64() >= generationDeadline))) {
            InterlockedExchange(&generationEnabled, 0);
            InterlockedExchange(&creationRequested, 0);
            const char* reason = !focused ? "game focus lost" :
                ((f10 && !previousF10) ? "F10" : "three-minute timeout");
            char line[192];
            sprintf_s(line, "Chest generation OFF (%s). Scoped removal requested; keep/open Pywel.", reason);
            Log(line);
            InterlockedExchange(&removalRequested, 1);
            InterlockedExchange(&removalOutcome, 1);
        }
        // --- Log removal/creation outcome codes when they change.
        // These message lists are the meaning of each removalOutcome /
        // creationOutcome number set elsewhere in this file. ---
        LONG outcome = InterlockedCompareExchange(&removalOutcome, 0, 0);
        if (outcome != lastRemovalOutcome) {
            const char* messages[] = {"idle", "pending UI callback", "native removal called; waiting for absence",
                "typed lookup confirms absence after native removal", "already absent; no removal called",
                "no marker owned by this session; no removal called", "identity/definition rejected; no removal called",
                "still present after three seconds of UI callbacks; use reload fallback"};
            if (outcome >= 0 && outcome < static_cast<LONG>(_countof(messages))) {
                char line[256];
                sprintf_s(line, "lifecycle outcome=%ld: %s", outcome, messages[outcome]);
                Log(line);
            }
            lastRemovalOutcome = outcome;
        }
        LONG creation = InterlockedCompareExchange(&creationOutcome, 0, 0);
        if (creation != lastCreationOutcome) {
            const char* messages[] = {"pending map callback", "independent object created and read back",
                "private key occupied; no creation or adoption", "definition/parent resolution rejected",
                "reserved previous layer-wait outcome", "native presentation provider rejected",
                "creation attempted but route/readback incomplete"};
            if (creation >= 0 && creation < static_cast<LONG>(_countof(messages))) {
                char line[256];
                sprintf_s(line, "independent outcome=%ld: %s", creation, messages[creation]);
                Log(line);
            }
            lastCreationOutcome = creation;
        }
        // --- F8: open a 2-second render capture window and log all counters. ---
        if (f8 && !previousF8 && focused) {
            InterlockedExchange64(&renderCaptureDeadline, static_cast<LONG64>(GetTickCount64() + 2000));
            renderWindowPending = true;
            char line[320];
            sprintf_s(line,
                "snapshot creates=%ld sampled=%ld dropped=%ld named=%ld enabled=%ld generated=%ld occupied=%ld definitionRejected=%ld readbackMask=%ld",
                InterlockedCompareExchange(&creationCalls, 0, 0),
                InterlockedCompareExchange(&sampledCalls, 0, 0),
                InterlockedCompareExchange(&droppedSamples, 0, 0),
                InterlockedCompareExchange(&namedSamples, 0, 0),
                InterlockedCompareExchange(&generationEnabled, 0, 0),
                InterlockedCompareExchange(&generatedCalls, 0, 0),
                InterlockedCompareExchange(&occupiedKeys, 0, 0),
                InterlockedCompareExchange(&definitionRejected, 0, 0),
                InterlockedCompareExchange(&generatedReadbackMask, 0, 0));
            Log(line);
            sprintf_s(line,
                "lifecycle owned=%ld request=%ld attempts=%ld confirmedAbsent=%ld alreadyAbsent=%ld rejected=%ld outcome=%ld",
                InterlockedCompareExchange(&ownedChest, 0, 0),
                InterlockedCompareExchange(&removalRequested, 0, 0),
                InterlockedCompareExchange(&removalAttempts, 0, 0),
                InterlockedCompareExchange(&removalConfirmed, 0, 0),
                InterlockedCompareExchange(&removalAbsent, 0, 0),
                InterlockedCompareExchange(&removalRejected, 0, 0),
                InterlockedCompareExchange(&removalOutcome, 0, 0));
            Log(line);
            sprintf_s(line, "independent request=%ld outcome=%ld worldMapUpdateCalls=%ld",
                InterlockedCompareExchange(&creationRequested, 0, 0),
                InterlockedCompareExchange(&creationOutcome, 0, 0),
                InterlockedCompareExchange(&worldMapUpdateCalls, 0, 0));
            Log(line);
            if (InterlockedCompareExchange(&generationEnabled, 0, 0) == 0) {
                SnapshotCachedDefinitions();
            }
        }
        // When the F8 window has closed, log how many render calls it saw.
        if (renderWindowPending && !RenderCaptureActive()) {
            renderWindowPending = false;
            char line[192];
            sprintf_s(line, "render-window complete worldProjectionCalls=%ld privateScaleCalls=%ld",
                InterlockedCompareExchange(&worldProjectionCalls, 0, 0),
                InterlockedCompareExchange(&privateScaleCalls, 0, 0));
            Log(line);
        }
        previousF6 = f6;
        previousF8 = f8;
        previousF7 = f7;
        previousF9 = f9;
        previousF10 = f10;
        Sleep(30);
    }
}
} // namespace

// ===========================================================================
// Section: DLL entry point
// ===========================================================================

#ifdef PYWEL_ATLAS_COMBINED
// Combined Pywel Atlas build: src/pywel-atlas/PywelAtlas.cpp owns DllMain and
// starts this part's worker through this entry point.
DWORD WINAPI PywelMapMarkerRun(void* address) {
    return Run(address);
}
#else
// Windows calls this when the mod DLL is loaded. It does as little as possible
// here (Windows restricts what is safe inside DllMain) and starts the worker
// thread, which runs Run().
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
