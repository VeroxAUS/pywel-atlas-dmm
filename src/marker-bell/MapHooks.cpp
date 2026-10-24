// MapHooks.cpp - the map part's hooks and shared state (v0.122 split).
//
// What this file does:
// - Holds the shared state: the saved original game functions, counters,
//   and the diagnostic sample queues.
// - The "hooks": our replacement functions for the game's map icon functions
//   (create, initialize, visibility, scale, world projection, world-map update).
//   A hook runs instead of a game function; ours call the original unchanged
//   and then look at, or add to, what happened.
// - On the game's map thread: creating and removing the old proof chest, and
//   the diagnostic sample queue the worker writes to the log.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

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
// The worker stages validated file values. The UI commits active identity only
// when no private object exists, so editing cannot change removal's coordinates
// beneath an already owned object. Locks protect copies only, never file I/O.
SRWLOCK definitionLock = SRWLOCK_INIT;
MarkerDefinition stagedDefinition = {}; // Latest F6 values, waiting to be used.
MarkerDefinition activeDefinition = {}; // Values of the chest actually created.

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
// v0.80: 512 pending events, because one layer switch can touch all 210
// Nexus markers within a single frame.
VisibilityEvent visibilityPending[512] = {};
unsigned visibilityPendingCount = 0;
VisibilityEvent visibilitySeen[256] = {};
unsigned visibilitySeenCount = 0;
// v0.80: finished log lines from the game's map thread (layer observation),
// written to the log by the worker. Also protected by sampleLock. v0.81:
// 160 lines of up to 400 characters, room for the raw copies (QueueDump).
char observationLines[160][400] = {};
unsigned observationLineCount = 0;

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
    bool ours = false;
    if (readable && creatingChest && requestedChestContainer &&
        activeSample->generated && IsOwnMarkerKey(actualTag.key) &&
        actualType == OwnMarkerType(actualTag.key) && actualTag.kind == 0x15 &&
        memcmp(actualPosition, activeSample->position, sizeof(actualPosition)) == 0) {
        container = requestedChestContainer;
        activeSample->containerRouted = true;
        ours = true;
    }
#ifdef PYWEL_ATLAS_COMBINED
    // v0.57 observation: for our own markers and the game's own shrine/Bell
    // icons, copy the arguments and the controller's waiting list before and
    // after the call, to see why a creation is refused. Changes nothing.
    WorldCreateRecord probe = {};
    bool watched = BeginWorldCreateProbe(controller, type, tag, slot7, scalar, slot9,
        appearance, templateName, optional12, optional13, finalFlag, ours, probe);
#endif
    uintptr_t result = originalWorldCreate(controller, type, tag, index, position, container,
        slot7, scalar, slot9, appearance, templateName, optional12, optional13, finalFlag);
#ifdef PYWEL_ATLAS_COMBINED
    if (watched) {
        FinishWorldCreateProbe(controller, result, probe);
    }
#endif
    return result;
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
#ifdef PYWEL_ATLAS_COMBINED
// Our verified world-map marker icons (set and cleared by ServiceMarkersOn on
// the map thread), so the per-frame hook needs no memory checks beyond the key.
void* volatile evenScaleIcons[kCategoryCount][kMaxCategoryMarkers] = {};
volatile LONG evenScaleLogged[kCategoryCount] = {}; // Log lines written per category.
#endif

// Hook on the icon scale calculation: records the scale computed for our chest.
// v0.120: also gives our own markers one shared size curve (see above).
float ObserveScale(void* icon, float zoom, BYTE mode, float mapScale) {
    float result = originalCalculateScale(icon, zoom, mode, mapScale);
#ifdef PYWEL_ATLAS_COMBINED
    if (kEvenMarkerScaleOn && icon) {
        // The game passes a live icon, so its tag can be read directly here
        // (this runs for every icon every frame). Only an icon ServiceMarkersOn
        // verified as this exact marker gets the shared curve.
        const NumericTag* tag = reinterpret_cast<const NumericTag*>(static_cast<const BYTE*>(icon) + 0xc8);
        unsigned category = 0;
        unsigned index = 0;
        if (tag->kind == 0x15 && (tag->key >> 32) == (kCategories[0].keyBase >> 32) &&
            FindMarker(tag->key, category, index) && evenScaleIcons[category][index] == icon) {
            float even = zoom > kEvenScaleMaximum ? kEvenScaleMaximum
                : zoom < kEvenScaleMinimum ? kEvenScaleMinimum : zoom;
            // Log the first few per category (game's value vs ours) for the runtime check.
            if (InterlockedIncrement(&evenScaleLogged[category]) <= 2) {
                char line[200];
                sprintf_s(line, "even-scale %s marker=%s input=%.4f game=%.4f ours=%.4f", kCategories[category].label,
                    MarkerName(category, index), zoom, result, even);
                QueueObservation(line);
            }
            result = even;
        }
    }
#endif
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
        // v0.104: copy the map's view for the route line (read-only).
        PywelRouteCaptureWorldMap(controller);
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
        // Combined build: keep the markers matching what the worker wants.
        ServiceMarkers(controller);
        // v0.111: add the route line to the map's canvas, which the update
        // just cleared (map thread; RouteCanvas.cpp checks its own guards).
        PywelRouteDrawWorldCanvas(controller);
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
#ifdef PYWEL_ATLAS_COMBINED
    // v0.80: an Abyss Nexus marker is logged by name, every time.
    if (watched) {
        NumericTag tag = {};
        unsigned category = 0;
        unsigned index = 0;
        if (Read(static_cast<const BYTE*>(icon) + 0xc8, &tag, sizeof(tag)) &&
            FindMarker(tag.key, category, index) && category == kNexusCategory) {
            event.named = true;
            event.markerIndex = static_cast<WORD>(index);
        }
    }
#endif
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
    if (event.named) {
        // v0.80: Nexus markers skip the duplicate check (up to a session cap).
        static LONG namedLogged = 0;
        if (namedLogged < 3000 && visibilityPendingCount < _countof(visibilityPending)) {
            ++namedLogged;
            visibilityPending[visibilityPendingCount++] = event;
        } else {
            InterlockedIncrement(&droppedSamples);
        }
        ReleaseSRWLockExclusive(&sampleLock);
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
#ifdef PYWEL_ATLAS_COMBINED
    // v0.72: our own category markers are not sampled here (their world-create
    // lines log them). With 264 chests they filled the 256-entry sample list
    // in v0.71, so the game's own shrine icon was never logged.
    uint64_t sampleKey = 0;
    memcpy(&sampleKey, sample.tag, sizeof(sampleKey));
    unsigned ownCategory = 0;
    unsigned ownIndex = 0;
    if (FindMarker(sampleKey, ownCategory, ownIndex)) {
        return result;
    }
#endif
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

} // namespace pywel_map
