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
// The verified Bell list (ids, names, game positions) for one marker per Bell.
#include "bell-proof-links.h"
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
bool MarkerDefinitionReady(WORD type);
void CreateIndependentChest(void* controller, void* parent, const void* presentation,
    const MarkerDefinition& definition);
bool ResolveIndependentParent(void* controller, WORD type, const float (&position)[3],
    void*& parent, uintptr_t& chestRecord);
bool ResolvePresentation(uintptr_t record, const void*& presentation);
void ServiceCreation(void* controller);
void Queue(const Sample& sample);
void ServiceRemoval(void* controller);
#ifdef PYWEL_ATLAS_COMBINED
void ServiceBellMarkers(void* controller);
void RecordIconZoomType(void* icon);
void RecordZoomFrame(void* controller);
void RecordMapViewPosition(const void* playerXyz, float heading);
#endif

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

#ifdef PYWEL_ATLAS_COMBINED
// Combined build: one map marker per known Bell. Marker i uses private key
// kBellMarkerKeyBase + i (high bytes spell "PYAT", like the proof chest) and
// sits exactly at that Bell's game position from bell-proof-links.h.
constexpr uint64_t kBellMarkerKeyBase = 0x5059415400000100ULL;
constexpr unsigned kBellMarkerCount = _countof(kBellLinks);
static_assert(kBellMarkerCount <= 31, "Bell marker masks hold at most 31 markers");
// v0.54: Bell markers use the game's own Bell map icon (type 360), so they
// look native. Its definition must still match exactly what was traced:
// template type 29084 named "MapIcon_Gimmick_Bell_01", category 0xffffffff.
constexpr WORD bellMarkerType = 360;
constexpr WORD kBellTemplateType = 29084;
constexpr const char* kBellTemplateName = "MapIcon_Gimmick_Bell_01";

// Returns which Bell marker a private key belongs to, or -1 if none.
int BellMarkerIndex(uint64_t key) {
    return key >= kBellMarkerKeyBase && key < kBellMarkerKeyBase + kBellMarkerCount
        ? static_cast<int>(key - kBellMarkerKeyBase) : -1;
}

// True only if `icon` is our Bell marker `index`: right type, its private key
// and kind, and exactly that Bell's position. Anything else is never touched.
bool IsBellMarker(void* icon, unsigned index) {
    WORD type = 0;
    NumericTag tag = {};
    float position[3] = {};
    auto* bytes = static_cast<const BYTE*>(icon);
    return icon && index < kBellMarkerCount &&
        Read(bytes + 0xde, &type, sizeof(type)) && type == bellMarkerType &&
        Read(bytes + 0xc8, &tag, sizeof(tag)) &&
        tag.key == kBellMarkerKeyBase + index && tag.kind == 0x15 &&
        Read(bytes + 0xe0, position, sizeof(position)) &&
        memcmp(position, kBellLinks[index].position, sizeof(position)) == 0;
}
#endif

// True for a private key this mod uses: the proof chest's, or (combined
// build) one of the Bell markers'.
bool IsOwnMarkerKey(uint64_t key) {
#ifdef PYWEL_ATLAS_COMBINED
    if (BellMarkerIndex(key) >= 0) {
        return true;
    }
#endif
    return key == chestKey;
}

// The icon type this mod creates for one of its private keys: the native Bell
// icon for a Bell marker (combined build), the chest for the proof chest.
WORD OwnMarkerType(uint64_t key) {
#ifdef PYWEL_ATLAS_COMBINED
    if (BellMarkerIndex(key) >= 0) {
        return bellMarkerType;
    }
#else
    (void)key; // Standalone build: only the proof chest exists.
#endif
    return chestType;
}

// True only if `icon` is our own chest: right type (+0xde), our private tag
// (+0xc8) and exactly the active definition's position (+0xe0). In the
// combined build a Bell marker counts too (diagnostic hooks use this).
bool IsPrivateChest(void* icon) {
#ifdef PYWEL_ATLAS_COMBINED
    NumericTag probe = {};
    if (icon && Read(static_cast<const BYTE*>(icon) + 0xc8, &probe, sizeof(probe))) {
        int bell = BellMarkerIndex(probe.key);
        if (bell >= 0) {
            return IsBellMarker(icon, static_cast<unsigned>(bell));
        }
    }
#endif
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
        activeSample->generated && IsOwnMarkerKey(actualTag.key) &&
        actualType == OwnMarkerType(actualTag.key) && actualTag.kind == 0x15 &&
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
#ifdef PYWEL_ATLAS_COMBINED
    // v0.53 observation: log this icon type's zoom window once.
    RecordIconZoomType(icon);
#endif
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
    sample.generated = true;
    sample.iconVerified = true;
    sample.phase = phase;
    // The proof chest or a Bell marker (native Bell icon): log the real type.
    Read(static_cast<const BYTE*>(icon) + 0xde, &sample.type, sizeof(sample.type));
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
#ifdef PYWEL_ATLAS_COMBINED
        // v0.53 observation: `optional` points at the player's xyz and
        // `value` is the heading (static research); copy them, and during F8
        // record the map zoom state.
        RecordMapViewPosition(optional, value);
        RecordZoomFrame(controller);
#endif
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
#ifdef PYWEL_ATLAS_COMBINED
        // Combined build: keep the Bell markers matching what the worker wants.
        ServiceBellMarkers(controller);
#else
        ServiceRemoval(controller);
        ServiceCreation(controller);
#endif
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
        || !ResolveIndependentParent(controller, chestType, definition.position, parent, record)) {
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
// Section: combined build - one map marker per Bell, following the loaded save
// ---------------------------------------------------------------------------
// In the combined Pywel Atlas mod, the save-detection part says which save is
// loaded and publishes the Bells read from the slot the game last saved it to
// (see src/pywel-atlas/LoadedSave.h). This part shows one marker at each known
// Bell whose save record is NOT completed, and removes it once it is.
//
// How it works ("desired state"):
//   - The worker decides which markers SHOULD exist (bellMarkerWanted, one bit
//     per Bell) and whether new ones may be created (bellMarkerCreateAllowed).
//   - On every world-map update (the game's map thread), ServiceBellMarkers
//     compares that with what is really on the map and fixes the difference:
//     it creates at most one missing marker per update and removes unwanted
//     ones. A removal with nothing to remove is simply nothing to do, so it
//     can never block a later creation (the v0.51 "press F6 twice" quirk).
//   - Markers stay until they are unwanted. There is no 3-minute limit and
//     losing game focus does nothing (the v0.51 focus-loss quirk).
// Safety rules:
//   - Only an accepted ("valid") detected result can make a marker appear.
//     While nothing is known (just after loading, or if a read failed),
//     existing markers are kept but no new ones are created. Unknown never
//     means "not completed".
//   - Only icons with our own private key, type and exact Bell position are
//     ever removed; anything else is left alone.
// ===========================================================================

// Shared between the worker (writes wanted/allowed) and the map thread
// (writes present). One bit per Bell, in kBellLinks order.
volatile LONG bellMarkerWanted = 0;
volatile LONG bellMarkerCreateAllowed = 0;
volatile LONG bellMarkerPresent = 0; // Markers this session created and still sees.
volatile LONG bellMarkerCreations = 0; // Successful creations (diagnostic count).
volatile LONG bellMarkerRemovals = 0; // Native removal calls (diagnostic count).
volatile LONG bellMarkerFailures = 0; // Creations that could not be completed.
volatile LONG bellMarkerStuck = 0; // Markers still present 3 s after removal.
volatile LONG bellZoomWindowWrites = 0; // Zoom-limit bytes switched off (diagnostic count).
volatile LONG bellZoomWindowFailures = 0; // Writes the system refused (diagnostic count).

// Each map icon copies up to three "zoom windows" from its UI template when it
// is set up: a zoom range in which the icon is shown (main icon at +0x1f8,
// image at +0x20c, text at +0x220; 0x14 bytes each, the byte at +0x10 of each
// = enabled). Outside that range the game hides the icon. The native Bell icon
// is only shown near full zoom-in (v0.53 runtime log). With the user's
// approval, this switches the enabled bytes off on OUR OWN Bell markers only,
// so the game treats them like personal pins (no zoom limit). It never touches
// the shared icon type, the template, or any icon the caller has not just
// verified as ours (IsBellMarker), and runs only on the game's map thread.
void DisableZoomWindows(void* icon) {
    static constexpr unsigned kEnabledOffsets[3] = {0x1f8 + 0x10, 0x20c + 0x10, 0x220 + 0x10};
    for (unsigned offset : kEnabledOffsets) {
        BYTE* enabled = static_cast<BYTE*>(icon) + offset;
        BYTE value = 0;
        // Only an "enabled" byte (exactly 1) is changed; anything else is left as is.
        if (!Read(enabled, &value, sizeof(value)) || value != 1) {
            continue;
        }
        const BYTE off = 0;
        SIZE_T written = 0;
        // WriteProcessMemory on our own process fails cleanly instead of
        // crashing if the memory is not writable.
        if (WriteProcessMemory(GetCurrentProcess(), enabled, &off, sizeof(off), &written) &&
            written == sizeof(off)) {
            InterlockedIncrement(&bellZoomWindowWrites);
        } else {
            InterlockedIncrement(&bellZoomWindowFailures);
        }
    }
}

// Ask the game to create Bell marker `index` at that Bell's position, then
// look it up again to confirm it exists with our identity. Returns true only
// after that confirmation (same steps as CreateIndependentChest).
bool CreateBellMarker(void* controller, unsigned index) {
    if (creatingChest) {
        return false;
    }
    const float* position = kBellLinks[index].position;
    float place[3] = {position[0], position[1], position[2]};
    void* parent = nullptr;
    uintptr_t record = 0;
    const void* presentation = nullptr;
    if (!ResolveIndependentParent(controller, bellMarkerType, place, parent, record) ||
        !ResolvePresentation(record, presentation)) {
        return false;
    }
    NumericTag tag = {};
    tag.key = kBellMarkerKeyBase + index;
    tag.kind = 0x15;
    DWORD lookupIndex = 0;
    Sample generated = {};
    generated.controller = 0x566ff50;
    generated.type = bellMarkerType;
    generated.generated = true;
    generated.finalFlag = 1;
    generated.positionRead = true;
    memcpy(generated.tag, &tag, sizeof(tag));
    memcpy(generated.position, place, sizeof(place));
    strcpy_s(generated.markerName, kBellLinks[index].name);
    Sample* previous = activeSample;
    void* previousRequestedContainer = requestedChestContainer;
    requestedChestContainer = parent;
    activeSample = &generated;
    creatingChest = true;
    // Same empty property collection as the proof chest (see
    // CreateIndependentChest for why it is safe).
    alignas(8) BYTE emptyProperties[0x28] = {};
    float scalar = 0;
    originalCreate(controller, &bellMarkerType, &tag, &lookupIndex, &scalar,
        place, presentation, 0, emptyProperties, 1);
    creatingChest = false;
    activeSample = previous;
    requestedChestContainer = previousRequestedContainer;
    // Read back: it must exist with our type, key and exact position, and our
    // parent-container routing must have happened.
    void* icon = worldLookup(controller, &bellMarkerType, &tag, &lookupIndex);
    CaptureIconState(icon, generated);
    generated.iconVerified = IsBellMarker(icon, index);
    Queue(generated);
    if (!generated.iconVerified || !generated.containerRouted) {
        return false;
    }
    // Ours and confirmed: remove its zoom limit straight away.
    DisableZoomWindows(icon);
    return true;
}

// Runs on the game's map thread after each world-map update: makes the Bell
// markers on the map match what the worker wants.
void ServiceBellMarkers(void* controller) {
    // Remember when each removal was issued (map thread only), so a removal
    // the game defers is checked again instead of being issued repeatedly.
    static ULONGLONG removalIssued[kBellMarkerCount] = {};
    LONG wanted = InterlockedCompareExchange(&bellMarkerWanted, 0, 0);
    bool createAllowed = InterlockedCompareExchange(&bellMarkerCreateAllowed, 0, 0) != 0;
    LONG present = InterlockedCompareExchange(&bellMarkerPresent, 0, 0);
    bool createdThisUpdate = false;
    for (unsigned index = 0; index < kBellMarkerCount; ++index) {
        LONG bit = 1L << index;
        NumericTag tag = {};
        tag.key = kBellMarkerKeyBase + index;
        tag.kind = 0x15;
        DWORD lookupIndex = 0;
        void* icon = worldLookup(controller, &bellMarkerType, &tag, &lookupIndex);
        if (!icon) {
            // Gone: removed by us, or the map was rebuilt (e.g. after a load).
            present &= ~bit;
            removalIssued[index] = 0;
            if ((wanted & bit) && createAllowed && !createdThisUpdate) {
                // At most one creation per update keeps each frame light.
                createdThisUpdate = true;
                if (CreateBellMarker(controller, index)) {
                    present |= bit;
                    InterlockedIncrement(&bellMarkerCreations);
                } else {
                    InterlockedIncrement(&bellMarkerFailures);
                }
            }
            continue;
        }
        if (!(present & bit) || !IsBellMarker(icon, index)) {
            // Not one we created and verified this session: never touch it.
            continue;
        }
        if (wanted & bit) {
            // Wanted and present: keep its zoom limit off (see
            // DisableZoomWindows; this also covers a re-initialised icon).
            DisableZoomWindows(icon);
            continue;
        }
        // Present but no longer wanted (e.g. its Bell is now completed).
        if (!removalIssued[index]) {
            if (!MarkerDefinitionReady(bellMarkerType)) {
                continue; // Icon definitions changed: refuse to remove.
            }
            removalIssued[index] = GetTickCount64();
            InterlockedIncrement(&bellMarkerRemovals);
            // Native removal: type and index by value, like the proof chest.
            removeWorldIcon(controller, bellMarkerType, &tag, lookupIndex);
            // The old icon may be freed now; inspect only a fresh lookup.
            if (!worldLookup(controller, &bellMarkerType, &tag, &lookupIndex)) {
                present &= ~bit;
                removalIssued[index] = 0;
            }
        } else if (GetTickCount64() - removalIssued[index] >= 3000) {
            // The game deferred removal and it is still there after 3 s.
            // Do not call removal again; report it and leave reload as fallback.
            InterlockedOr(&bellMarkerStuck, bit);
        }
    }
    InterlockedExchange(&bellMarkerPresent, present);
}

// Lists the Bell names whose bit is set in `mask`, e.g. "Calphade, Varnia".
void BellNames(LONG mask, char (&text)[256]) {
    text[0] = 0;
    for (unsigned index = 0; index < kBellMarkerCount; ++index) {
        if (mask & (1L << index)) {
            if (text[0]) {
                strcat_s(text, ", ");
            }
            strcat_s(text, kBellLinks[index].name);
        }
    }
    if (!text[0]) {
        strcpy_s(text, "none");
    }
}

// The worker's view of the Bell markers.
struct BellMarkerState {
    bool enabled; // F10 turns all markers off; F6 turns them back on.
    bool known; // A valid detected result has been seen at least once.
    unsigned serial; // Selection serial of the last result logged.
    unsigned readSlot; // Slot of the last result logged.
    LONG wanted; // Last wanted mask sent to the map thread.
    LONG present; // Last present mask logged.
    LONG stuck; // Last stuck mask logged.
};

// Called every worker loop: works out which markers should exist from the
// detected save, tells the map thread, and logs changes.
void UpdateBellMarkers(BellMarkerState& state) {
    LoadedSaveBell loaded = {};
    bool valid = PywelGetLoadedSaveBell(loaded);
    LONG all = static_cast<LONG>((1UL << kBellMarkerCount) - 1);
    LONG wanted = state.wanted;
    if (!state.enabled) {
        wanted = 0;
    } else if (valid) {
        // Show every Bell the save does NOT explicitly mark as completed.
        wanted = all & ~static_cast<LONG>(loaded.bell.completedMask);
    }
    // While nothing is known, keep the current markers but create no new ones.
    InterlockedExchange(&bellMarkerCreateAllowed, state.enabled && valid ? 1 : 0);
    InterlockedExchange(&bellMarkerWanted, wanted);
    char names[256];
    char line[512];
    if (valid && (!state.known || loaded.serial != state.serial ||
        loaded.readSlot != state.readSlot || wanted != state.wanted)) {
        char hidden[256];
        BellNames(wanted, names);
        BellNames(all & static_cast<LONG>(loaded.bell.completedMask), hidden);
        sprintf_s(line, "Detected save serial=%u loadedSlot=%u readSlot=%u: show [%s]; completed (hidden) [%s]",
            loaded.serial, loaded.loadedSlot, loaded.readSlot, names, hidden);
        Log(line);
        state.known = true;
        state.serial = loaded.serial;
        state.readSlot = loaded.readSlot;
    } else if (!state.enabled && wanted != state.wanted) {
        Log("Bell markers turned off (F10); all are being removed.");
    }
    state.wanted = wanted;
    LONG present = InterlockedCompareExchange(&bellMarkerPresent, 0, 0);
    if (present != state.present) {
        BellNames(present, names);
        sprintf_s(line, "Bell markers on the map now: [%s] (creations=%ld removals=%ld failures=%ld zoomLimitOff=%ld zoomLimitRefused=%ld)",
            names, InterlockedCompareExchange(&bellMarkerCreations, 0, 0),
            InterlockedCompareExchange(&bellMarkerRemovals, 0, 0),
            InterlockedCompareExchange(&bellMarkerFailures, 0, 0),
            InterlockedCompareExchange(&bellZoomWindowWrites, 0, 0),
            InterlockedCompareExchange(&bellZoomWindowFailures, 0, 0));
        Log(line);
        state.present = present;
    }
    LONG stuck = InterlockedCompareExchange(&bellMarkerStuck, 0, 0);
    if (stuck != state.stuck) {
        BellNames(stuck, names);
        sprintf_s(line, "Bell markers still present 3 s after removal (reload clears them): [%s]", names);
        Log(line);
        state.stuck = stuck;
    }
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

// True only if icon `type` is already loaded with exactly the expected
// template type id and template name, and category 0xffffffff.
bool IconDefinitionReady(WORD type, WORD expectedTemplate, const char* expectedName) {
    TableView icons = {};
    TableView templates = {};
    uintptr_t record = 0;
    uintptr_t templateRecord = 0;
    WORD secondary = 0;
    DWORD category = 0;
    char name[128] = {};
    return ReadTable(kIconTablePointerRva, 4096, icons) && type < icons.count &&
        ReadTable(kTemplateTablePointerRva, 65536, templates) &&
        Read(reinterpret_cast<const void*>(icons.cache + type * sizeof(uintptr_t)),
            &record, sizeof(record)) && record &&
        Read(reinterpret_cast<const void*>(record + 0x20), &secondary, sizeof(secondary)) &&
        secondary == expectedTemplate && secondary < templates.count &&
        Read(reinterpret_cast<const void*>(record + 0x2c), &category, sizeof(category)) &&
        category == 0xffffffff &&
        Read(reinterpret_cast<const void*>(templates.cache + secondary * sizeof(uintptr_t)),
            &templateRecord, sizeof(templateRecord)) &&
        ReadTemplateName(reinterpret_cast<const void*>(templateRecord), name) &&
        strcmp(name, expectedName) == 0;
}

// True only if icon type 226 is already loaded and matches the verified chest:
// template type 28852, category 0xffffffff, template "MapIcon_Gimmick_LevelTreasureBox".
bool ChestDefinitionReady() {
    return IconDefinitionReady(chestType, 28852, "MapIcon_Gimmick_LevelTreasureBox");
}

// True only if `type` is one this mod creates and its definition is loaded
// and matches: the chest (226), or in the combined build the native Bell (360).
bool MarkerDefinitionReady(WORD type) {
#ifdef PYWEL_ATLAS_COMBINED
    if (type == bellMarkerType) {
        return IconDefinitionReady(bellMarkerType, kBellTemplateType, kBellTemplateName);
    }
#endif
    return type == chestType && ChestDefinitionReady();
}

// Choose which map layer ("parent container") the chest is created in, the
// same way the game's own code chooses (as traced). Uses icon type 1's
// definition as configuration, plus the game's live altitude threshold: at or
// above it, container 3 is used instead. `type` is the icon type being created
// (chest or native Bell); its record is returned for the presentation lookup.
bool ResolveIndependentParent(void* controller, WORD type, const float (&position)[3],
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
    if (!MarkerDefinitionReady(type) || !ReadTable(kIconTablePointerRva, 4096, icons) ||
        !Read(reinterpret_cast<const void*>(icons.cache + type * sizeof(uintptr_t)),
            &chestRecord, sizeof(chestRecord)) || !chestRecord ||
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

#ifdef PYWEL_ATLAS_COMBINED
// ===========================================================================
// Section: combined build v0.53 - zoom and player-position observation
// ---------------------------------------------------------------------------
// Logging only: nothing here changes any icon or game value. It answers two
// questions from the static research (research/analysis/map-zoom-visibility.md
// and player-position.md):
//   1. Why do our Bell markers fade or vanish at some map zooms? Each icon's
//      UI template can set a "zoom window" (changePoint): outside it, the game
//      hides the icon. We log each icon type's window values once, and while
//      F8 is active, the map's current zoom and whether our markers were hidden.
//   2. Where can the mod read the player's position (for a radius filter)?
//      The minimap's own update stores it at minimap controller +0x330. We hook
//      that update (watch only) and log it, next to the position the world map
//      passes to its drawing step, and the distance to the nearest Bell.
// All reads are bounded copies on the game's own thread; the worker only
// receives the copies.
// ===========================================================================

// --- 1. Zoom windows, once per icon type -----------------------------------

// One icon type's zoom-related values, copied when the game set up an icon.
struct ZoomTypeRecord {
    WORD type;
    DWORD category;
    bool categoryRead;
    char templateName[128];
    BYTE windows[0x3c]; // icon+0x1f8..+0x233: three 0x14-byte zoom windows.
    bool windowsRead;
    BYTE iconFlags[0x10]; // icon+0x2b0..+0x2bf: exemption/scale flags.
    bool iconFlagsRead;
    BYTE record[0x60]; // type record +0x60..+0xbf: size curve and exemptions.
    bool recordRead;
};

SRWLOCK zoomLock = SRWLOCK_INIT;
ZoomTypeRecord zoomTypes[64] = {}; // Waiting to be logged by the worker.
unsigned zoomTypeCount = 0;
volatile LONG zoomTypeSeen[4096 / 32] = {}; // One bit per icon type already queued.
volatile LONG zoomTypeDropped = 0;

// Called from ObserveInitialize after the game set up an icon: queues that
// icon type's zoom values the first time the type is seen.
void RecordIconZoomType(void* icon) {
    WORD type = 0;
    auto* bytes = static_cast<const BYTE*>(icon);
    if (!icon || !Read(bytes + 0xde, &type, sizeof(type)) || type >= 4096 ||
        InterlockedBitTestAndSet(&zoomTypeSeen[type / 32], type % 32)) {
        return;
    }
    ZoomTypeRecord record = {};
    record.type = type;
    record.windowsRead = Read(bytes + 0x1f8, record.windows, sizeof(record.windows));
    record.iconFlagsRead = Read(bytes + 0x2b0, record.iconFlags, sizeof(record.iconFlags));
    // The type's definition record, from the same table ChestDefinitionReady reads.
    TableView icons = {};
    TableView templates = {};
    uintptr_t definition = 0;
    WORD templateType = 0;
    uintptr_t templateRecord = 0;
    if (ReadTable(kIconTablePointerRva, 4096, icons) && type < icons.count &&
        Read(reinterpret_cast<const void*>(icons.cache + type * sizeof(uintptr_t)),
            &definition, sizeof(definition)) && definition) {
        record.categoryRead = Read(reinterpret_cast<const void*>(definition + 0x2c),
            &record.category, sizeof(record.category));
        record.recordRead = Read(reinterpret_cast<const void*>(definition + 0x60),
            record.record, sizeof(record.record));
        if (Read(reinterpret_cast<const void*>(definition + 0x20), &templateType, sizeof(templateType)) &&
            ReadTable(kTemplateTablePointerRva, 65536, templates) && templateType < templates.count &&
            Read(reinterpret_cast<const void*>(templates.cache + templateType * sizeof(uintptr_t)),
                &templateRecord, sizeof(templateRecord))) {
            ReadTemplateName(reinterpret_cast<const void*>(templateRecord), record.templateName);
        }
    }
    // Never wait on the game's thread: if busy or full, count it as dropped.
    if (!TryAcquireSRWLockExclusive(&zoomLock)) {
        InterlockedIncrement(&zoomTypeDropped);
        return;
    }
    if (zoomTypeCount < _countof(zoomTypes)) {
        zoomTypes[zoomTypeCount++] = record;
    } else {
        InterlockedIncrement(&zoomTypeDropped);
    }
    ReleaseSRWLockExclusive(&zoomLock);
}

// --- 2. Map zoom state while F8 is active ----------------------------------

// The world map's zoom values and our markers' visibility at one moment.
struct ZoomFrameRecord {
    float cameraDistance; // ctrl+0xaa0
    float sizeInput; // ctrl+0xabc (input to the icon size curve)
    float valueA9c; // ctrl+0xa9c
    float valueAe4; // ctrl+0xae4
    DWORD mode; // ctrl+0xbf8 (map mode)
    BYTE firstUpdate; // ctrl+0xace
    float nearDistance; // global 0x6cab9e8
    float farDistance; // global 0x6caba88
    float zoomT; // 1 - (distance - near) / (far - near), as the game computes it
    LONG markers; // Bell markers inspected (bit per Bell)
    BYTE windowResult[32]; // icon+0x2b9 per Bell
    BYTE onScreen[32]; // icon+0x1eb per Bell
    DWORD elementFlags[32]; // (icon+8)->+0xb4 per Bell; bit 8 = hidden
    BYTE windowEnabled[32]; // icon+0x208 per Bell (main zoom window enabled)
    DWORD actorId[32]; // icon+0x1c0 per Bell (actor the icon follows; 0 = none)
};

ZoomFrameRecord zoomFrames[16] = {};
unsigned zoomFrameCount = 0;

// Called from ObserveWorldProjection (world map, map thread) during F8:
// records the zoom state and our markers' window result at most every 250 ms.
void RecordZoomFrame(void* controller) {
    static thread_local ULONGLONG nextFrame = 0;
    if (!RenderCaptureActive() || GetTickCount64() < nextFrame) {
        return;
    }
    nextFrame = GetTickCount64() + 250;
    auto* bytes = static_cast<const BYTE*>(controller);
    ZoomFrameRecord record = {};
    Read(bytes + 0xaa0, &record.cameraDistance, sizeof(float));
    Read(bytes + 0xabc, &record.sizeInput, sizeof(float));
    Read(bytes + 0xa9c, &record.valueA9c, sizeof(float));
    Read(bytes + 0xae4, &record.valueAe4, sizeof(float));
    Read(bytes + 0xbf8, &record.mode, sizeof(record.mode));
    Read(bytes + 0xace, &record.firstUpdate, sizeof(record.firstUpdate));
    Read(reinterpret_cast<const void*>(imageBase + 0x6cab9e8), &record.nearDistance, sizeof(float));
    Read(reinterpret_cast<const void*>(imageBase + 0x6caba88), &record.farDistance, sizeof(float));
    float span = record.farDistance - record.nearDistance;
    record.zoomT = span != 0 ? 1.0f - (record.cameraDistance - record.nearDistance) / span : -1.0f;
    LONG present = InterlockedCompareExchange(&bellMarkerPresent, 0, 0);
    for (unsigned index = 0; index < kBellMarkerCount; ++index) {
        if (!(present & (1L << index))) {
            continue;
        }
        NumericTag tag = {};
        tag.key = kBellMarkerKeyBase + index;
        tag.kind = 0x15;
        DWORD lookupIndex = 0;
        void* icon = worldLookup(controller, &bellMarkerType, &tag, &lookupIndex);
        if (!IsBellMarker(icon, index)) {
            continue;
        }
        auto* iconBytes = static_cast<const BYTE*>(icon);
        uintptr_t element = 0;
        Read(iconBytes + 0x2b9, &record.windowResult[index], 1);
        // v0.54: the main zoom window's enabled byte (0 = our limit is off),
        // and the actor id the native Bell type may follow (0 = none).
        Read(iconBytes + 0x1f8 + 0x10, &record.windowEnabled[index], 1);
        Read(iconBytes + 0x1c0, &record.actorId[index], sizeof(DWORD));
        Read(iconBytes + 0x1eb, &record.onScreen[index], 1);
        if (Read(iconBytes + 8, &element, sizeof(element)) && element) {
            Read(reinterpret_cast<const void*>(element + 0xb4), &record.elementFlags[index], sizeof(DWORD));
        }
        record.markers |= 1L << index;
    }
    if (!TryAcquireSRWLockExclusive(&zoomLock)) {
        return;
    }
    if (zoomFrameCount < _countof(zoomFrames)) {
        zoomFrames[zoomFrameCount++] = record;
    }
    ReleaseSRWLockExclusive(&zoomLock);
}

// --- 3. Player position ----------------------------------------------------

// 0xe13cf0: the minimap controller's own update (vtable 0x5674e00, slot
// 0x118). RCX controller, XMM1 elapsed time, like the world update 0xdabd10.
using UpdateMinimap = uintptr_t (*)(void*, float);
UpdateMinimap originalMinimapUpdate = nullptr;
// Its first 24 bytes in the supported build (checked before hooking; verified
// against the installed executable with pefile on 2026-10-22).
constexpr uintptr_t kMinimapUpdateRva = 0xe13cf0;
constexpr BYTE kMinimapUpdateGuard[24] = {
    0x48, 0x8b, 0xc4, 0x48, 0x89, 0x58, 0x08, 0x55,
    0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56,
    0x41, 0x57, 0x48, 0x8d, 0xa8, 0x08, 0xff, 0xff,
};

// Latest copied positions, guarded by positionLock.
struct PlayerPosition {
    float minimap[3]; // Minimap controller +0x330 (player world X, Y, Z).
    BYTE abyssLayer; // Minimap controller +0x569 (player above the altitude threshold).
    ULONGLONG minimapTick;
    DWORD minimapThread;
    LONG minimapUpdates;
    float mapView[3]; // Player xyz the world map passes to its drawing step.
    float heading; // Heading in degrees, from the same call.
    ULONGLONG mapViewTick;
};
SRWLOCK positionLock = SRWLOCK_INIT;
PlayerPosition playerPosition = {};

// Hook on the minimap update: calls it unchanged, then copies the player
// position it just stored. Watch only.
uintptr_t ObserveMinimapUpdate(void* controller, float elapsed) {
    uintptr_t result = originalMinimapUpdate(controller, elapsed);
    uintptr_t table = 0;
    float position[3] = {};
    BYTE abyss = 0;
    if (Read(controller, &table, sizeof(table)) && table == imageBase + 0x5674e00 &&
        Read(static_cast<const BYTE*>(controller) + 0x330, position, sizeof(position)) &&
        Read(static_cast<const BYTE*>(controller) + 0x569, &abyss, sizeof(abyss)) &&
        TryAcquireSRWLockExclusive(&positionLock)) {
        memcpy(playerPosition.minimap, position, sizeof(position));
        playerPosition.abyssLayer = abyss;
        playerPosition.minimapTick = GetTickCount64();
        playerPosition.minimapThread = GetCurrentThreadId();
        ++playerPosition.minimapUpdates;
        ReleaseSRWLockExclusive(&positionLock);
    }
    return result;
}

// Called from ObserveWorldProjection: copies the player xyz and heading the
// world map passes to its drawing step (only while the map is open).
void RecordMapViewPosition(const void* playerXyz, float heading) {
    static thread_local ULONGLONG nextCopy = 0;
    float position[3] = {};
    if (GetTickCount64() < nextCopy || !Read(playerXyz, position, sizeof(position))) {
        return;
    }
    nextCopy = GetTickCount64() + 200;
    if (TryAcquireSRWLockExclusive(&positionLock)) {
        memcpy(playerPosition.mapView, position, sizeof(position));
        playerPosition.heading = heading;
        playerPosition.mapViewTick = GetTickCount64();
        ReleaseSRWLockExclusive(&positionLock);
    }
}

// Installs the minimap watch hook, after checking its guard bytes. A failure
// only disables position logging; the markers keep working.
void InstallMinimapHook(BYTE* base) {
    if (memcmp(base + kMinimapUpdateRva, kMinimapUpdateGuard, sizeof(kMinimapUpdateGuard)) != 0) {
        Log("Minimap update entry changed; position observation not installed.");
        return;
    }
    MH_STATUS status = MH_CreateHook(base + kMinimapUpdateRva,
        reinterpret_cast<void*>(&ObserveMinimapUpdate), reinterpret_cast<void**>(&originalMinimapUpdate));
    if (status == MH_OK) {
        status = MH_EnableHook(base + kMinimapUpdateRva);
    }
    char line[160];
    sprintf_s(line, "Minimap position watch hook rva=0x%llx: %s",
        static_cast<unsigned long long>(kMinimapUpdateRva), MH_StatusToString(status));
    Log(line);
}

// --- 4. Worker: write the observations to the log --------------------------

// Formats one 0x14-byte zoom window: 4 floats, enabled byte, fade byte.
void FormatWindow(const BYTE* window, char (&text)[128]) {
    float points[4] = {};
    memcpy(points, window, sizeof(points));
    sprintf_s(text, "[%g %g %g %g en=%u fade=%u]", points[0], points[1], points[2], points[3],
        window[0x10], window[0x11]);
}

// Called every worker loop: logs queued zoom records, the player position
// about every 2 seconds (or at once when `now` is true, e.g. on F8), and the
// position-related game settings once.
void LogZoomAndPosition(bool now) {
    static bool settingsLogged = false;
    static ULONGLONG nextPosition = 0;
    static float lastLogged[3] = {};
    char line[1024];
    if (!settingsLogged) {
        settingsLogged = true;
        int cellSize = 0;
        int cellWindow = 0;
        float nativeRadius = 0;
        float altitude = 0;
        Read(reinterpret_cast<const void*>(imageBase + 0x6cad108), &cellSize, sizeof(cellSize));
        Read(reinterpret_cast<const void*>(imageBase + 0x6cad158), &cellWindow, sizeof(cellWindow));
        Read(reinterpret_cast<const void*>(imageBase + 0x6cae808), &nativeRadius, sizeof(nativeRadius));
        Read(reinterpret_cast<const void*>(imageBase + 0x6cde048), &altitude, sizeof(altitude));
        sprintf_s(line, "position settings at start: cellSize=%d cellWindow=%d nativeRadius=%g altitudeThreshold=%g",
            cellSize, cellWindow, nativeRadius, altitude);
        Log(line);
    }
    // Take the queued zoom records out under the lock, then log them.
    ZoomTypeRecord types[_countof(zoomTypes)];
    ZoomFrameRecord frames[_countof(zoomFrames)];
    AcquireSRWLockExclusive(&zoomLock);
    unsigned typeCount = zoomTypeCount;
    unsigned frameCount = zoomFrameCount;
    memcpy(types, zoomTypes, typeCount * sizeof(ZoomTypeRecord));
    memcpy(frames, zoomFrames, frameCount * sizeof(ZoomFrameRecord));
    zoomTypeCount = 0;
    zoomFrameCount = 0;
    ReleaseSRWLockExclusive(&zoomLock);
    for (unsigned index = 0; index < typeCount; ++index) {
        const ZoomTypeRecord& type = types[index];
        char window[128];
        char image[128];
        char text[128];
        FormatWindow(type.windows, window);
        FormatWindow(type.windows + 0x14, image);
        FormatWindow(type.windows + 0x28, text);
        float curve[7] = {}; // record +0x8c..+0xa4 (size curve)
        memcpy(curve, type.record + 0x2c, sizeof(curve));
        DWORD exemption = 0; // record +0xbc
        memcpy(&exemption, type.record + 0x5c, sizeof(exemption));
        sprintf_s(line, "zoom-type type=%u category=0x%lx template=%s windowsRead=%u window=%s image=%s text=%s "
            "icon2b0..2bf=%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x "
            "rec60=%u rec61=%u curve8c..a4=[%g %g %g %g %g %g %g] recA8=%u recB0=%u recB1=%u recB4=%u recB5=%u recB6=%u recBC=0x%lx",
            type.type, type.categoryRead ? type.category : 0xffffffffUL,
            type.templateName[0] ? type.templateName : "-", type.windowsRead ? 1u : 0u, window, image, text,
            type.iconFlags[0], type.iconFlags[1], type.iconFlags[2], type.iconFlags[3], type.iconFlags[4],
            type.iconFlags[5], type.iconFlags[6], type.iconFlags[7], type.iconFlags[8], type.iconFlags[9],
            type.iconFlags[10], type.iconFlags[11], type.iconFlags[12], type.iconFlags[13],
            type.iconFlags[14], type.iconFlags[15],
            type.record[0], type.record[1], curve[0], curve[1], curve[2], curve[3], curve[4], curve[5], curve[6],
            type.record[0x48], type.record[0x50], type.record[0x51], type.record[0x54], type.record[0x55],
            type.record[0x56], exemption);
        Log(line);
    }
    for (unsigned index = 0; index < frameCount; ++index) {
        const ZoomFrameRecord& frame = frames[index];
        sprintf_s(line, "zoom-frame cameraDistance=%g near=%g far=%g zoomT=%g sizeInput=%g a9c=%g ae4=%g mode=%lu firstUpdate=%u",
            frame.cameraDistance, frame.nearDistance, frame.farDistance, frame.zoomT, frame.sizeInput,
            frame.valueA9c, frame.valueAe4, frame.mode, frame.firstUpdate);
        Log(line);
        for (unsigned bell = 0; bell < kBellMarkerCount; ++bell) {
            if (frame.markers & (1L << bell)) {
                sprintf_s(line, "  zoom-marker %s windowResult=0x%02x onScreen=%u elementFlags=0x%lx hidden=%u zoomLimitEnabled=%u actorId=%lu",
                    kBellLinks[bell].name, frame.windowResult[bell], frame.onScreen[bell],
                    frame.elementFlags[bell], (frame.elementFlags[bell] & 8) ? 1u : 0u,
                    frame.windowEnabled[bell], frame.actorId[bell]);
                Log(line);
            }
        }
    }
    // Player position, compared with the nearest Bell.
    PlayerPosition position = {};
    AcquireSRWLockShared(&positionLock);
    position = playerPosition;
    ReleaseSRWLockShared(&positionLock);
    float dx = position.minimap[0] - lastLogged[0];
    float dz = position.minimap[2] - lastLogged[2];
    bool moved = dx * dx + dz * dz > 1.0f;
    if (!now && (GetTickCount64() < nextPosition || (!moved && position.minimapUpdates == 0))) {
        return;
    }
    if (!now && !moved) {
        nextPosition = GetTickCount64() + 10000; // Standing still: log only every 10 s.
    } else {
        nextPosition = GetTickCount64() + 2000;
    }
    memcpy(lastLogged, position.minimap, sizeof(lastLogged));
    int nearest = -1;
    float nearestDistance = 0;
    for (unsigned bell = 0; bell < kBellMarkerCount; ++bell) {
        float bx = kBellLinks[bell].position[0] - position.minimap[0];
        float bz = kBellLinks[bell].position[2] - position.minimap[2];
        float distance = sqrtf(bx * bx + bz * bz);
        if (nearest < 0 || distance < nearestDistance) {
            nearest = static_cast<int>(bell);
            nearestDistance = distance;
        }
    }
    ULONGLONG tick = GetTickCount64();
    sprintf_s(line, "position%s minimap=(%.2f, %.2f, %.2f) abyssLayer=%u age=%llums updates=%ld thread=%lu "
        "| mapView=(%.2f, %.2f, %.2f) heading=%.1f age=%llums | nearest Bell %s %.1f m",
        now ? " (F8)" : "", position.minimap[0], position.minimap[1], position.minimap[2], position.abyssLayer,
        position.minimapTick ? tick - position.minimapTick : 0ULL, position.minimapUpdates, position.minimapThread,
        position.mapView[0], position.mapView[1], position.mapView[2], position.heading,
        position.mapViewTick ? tick - position.mapViewTick : 0ULL,
        nearest >= 0 ? kBellLinks[nearest].name : "-", nearestDistance);
    Log(line);
}
#endif

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
    Log("Pywel Atlas combined v0.54 map markers - one native Bell icon (type 360) per Bell, shown at every map zoom (zoom limit off on our own markers only) while the detected save has it not completed; F10 hides all, F6 shows again. Observation: zoom windows per icon type, map zoom on F8, player position from the minimap");
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
#ifdef PYWEL_ATLAS_COMBINED
    // v0.53 observation: watch the minimap update for the player position.
    InstallMinimapHook(base);
#endif
    Log("F6 requests one private chest for 3 minutes; open Pywel. No reload or saved pin is needed.");
    Log("F8 captures state. F10 disables and requests removal; keep/open Pywel to service it. Save identity is manual.");
    // previousFx: was the key down on the last loop? A key "press" is down now
    // but not before, so holding a key does not repeat its action.
    bool previousF6 = false;
    bool previousF8 = false;
    bool previousF7 = false;
    bool previousF9 = false;
    bool previousF10 = false;
#ifndef PYWEL_ATLAS_COMBINED
    ULONGLONG generationDeadline = 0; // Proof chest's 3-minute limit (not used combined).
#endif
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
    // Combined build: one marker per Bell, following the detected save.
    // Markers are on from the start; F10 turns them off, F6 back on.
    BellMarkerState bellMarkers = {};
    bellMarkers.enabled = true;
#endif
    while (true) {
        Drain();
#ifdef PYWEL_ATLAS_COMBINED
        UpdateBellMarkers(bellMarkers);
        // v0.53 observation: zoom records and player position (F8 also logs
        // the position at once; see the F8 block below).
        LogZoomAndPosition(false);
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
        // --- F6 / F10 (combined build): turn the Bell markers on / off. ---
        if (focused && f6 && !previousF6 && !bellMarkers.enabled) {
            bellMarkers.enabled = true;
            Log("Bell markers turned on (F6); they follow the detected save.");
            MessageBeep(MB_OK);
        }
        if (focused && f10 && !previousF10 && bellMarkers.enabled) {
            bellMarkers.enabled = false;
            MessageBeep(MB_OK);
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
#ifndef PYWEL_ATLAS_COMBINED
        // (Not in the combined build: its Bell markers have no time limit,
        // ignore focus loss, and use F10 above.)
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
#endif
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
#ifdef PYWEL_ATLAS_COMBINED
            LogZoomAndPosition(true);
#endif
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
