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
//   (Combined build: all collectible markers. v0.73 test build: the minimap's
//   update hook, ObserveMinimapUpdate, keeps the same markers on the minimap.)
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
// v0.56: the checked Greymane Shrine list (names, game positions).
#include "shrine-links.h"
// v0.58: the treasure chests of the game's dedicated chest levels;
// v0.59: plus the cave and dungeon chests of the game's chest list.
#include "chest-links.h"
#include "nexus-links.h"
// v0.64: per-category choices shared with the in-game filter panel.
#include "../pywel-atlas/MarkerFilter.h"
#endif
#ifdef PYWEL_ATLAS_TELEPORT
// Test build only (src/pywel-atlas/TestTeleporter.cpp): runs on the minimap thread.
void PywelTeleporterService();
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
    // v0.80: set for an Abyss Nexus marker, which is then logged by name and
    // every time (not only the first time this exact change is seen).
    bool named;
    WORD markerIndex;
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
// v0.57: one watched world-icon creation (see BeginWorldCreateProbe).
struct WorldCreateRecord {
    WORD type;
    uint64_t key; // Tag number (our "PYAT" keys, or the game's own).
    BYTE kind; // Tag kind (0x15 = ours; the game uses e.g. 0xc for shrines).
    bool ours; // Our own marker, routed to its map layer.
    char templateName[96]; // Text at the template-name argument ("" if unreadable).
    bool templateRead;
    bool appearancePresent; // Presentation argument non-null.
    uintptr_t slot7; // Opaque arguments, logged raw for comparison.
    float scalar;
    uintptr_t slot9;
    bool optional12Present;
    bool optional13Present;
    BYTE finalFlag;
    BYTE waitingFlag; // Controller +0xaf7 (allows queueing a not-ready element).
    DWORD waitingBefore; // Controller +0x578: elements waiting to be finished.
    DWORD waitingAfter;
    bool created; // The constructor returned an icon (non-zero).
};
bool BeginWorldCreateProbe(void* controller, const WORD* type, const void* tag, uintptr_t slot7,
    float scalar, uintptr_t slot9, const void* appearance, const char* templateName,
    const void* optional12, const void* optional13, BYTE finalFlag, bool ours,
    WorldCreateRecord& record);
void FinishWorldCreateProbe(void* controller, uintptr_t result, WorldCreateRecord& record);
void ServiceMarkers(void* controller);
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
// Combined build: one native map marker per known collectible that the
// detected save does not mark as done. Each collectible kind is a "category":
//   0 = Bells (bell-proof-links.h), the game's own Bell icon (v0.54);
//   1 = Greymane Shrines (shrine-links.h), the game's own shrine icon (v0.56;
//       paused in v0.58 because the game refuses to create that icon);
//   2 = treasure chests from the game's dedicated chest levels (v0.58) and
//       caves/dungeons (v0.59) (chest-links.h), the chest icon our markers
//       have used since v0.31;
//   3 = Abyss chests (v0.69; chest-links.h kAbyssChestLinks), the chest icon
//       (v0.70; the game refuses its own Abyss chest icon). Their positions
//       are above the game's Abyss altitude threshold, so they go to the
//       Abyss map layer (see ResolveIndependentParent);
//   4 = surface Abyss Nexuses (v0.79; nexus-links.h), the game's own Abyss
//       Nexus icon (type 234 "MapIcon_Abyss_Ruins", icon group 0x20).
// Marker i of a category uses private key keyBase + i (high bytes spell
// "PYAT", like the proof chest) and sits exactly at that spot's game position.
// Each native icon type's definition must still match exactly what was
// traced (template id, template name, icon group) before it is used.
struct MarkerCategory {
    const char* label; // For the log: "Bell", "Greymane Shrine", "Chest".
    WORD type; // The game's own map icon type the markers use.
    WORD templateType; // Its expected UI template id...
    const char* templateName; // ...and template name.
    uint64_t keyBase; // Private key of marker 0 in this category.
    unsigned count; // How many markers this category has.
    bool shown; // False = this build never creates markers for it (paused).
    // v0.79: the icon's group in its definition (+0x2c): 0xffffffff for the
    // gimmick icons, 0x20 for the Abyss Nexus icon.
    DWORD iconGroup;
};
constexpr unsigned kBellCategory = 0;
constexpr unsigned kShrineCategory = 1;
constexpr unsigned kChestCategory = 2;
constexpr unsigned kAbyssChestCategory = 3;
constexpr unsigned kNexusCategory = 4;
constexpr unsigned kCategoryCount = 5;
// v0.58: up to 256 markers per category, held as 8 words of 32 bits
// ("masks"; bit i of word i / 32 = marker i).
constexpr unsigned kMaxCategoryMarkers = 256;
constexpr unsigned kMaskWords = kMaxCategoryMarkers / 32;
// Greymane Shrine markers (history): the game refused our shrine icon on the
// world map in v0.56-v0.73, because the world map's layout file
// (ui/xml/gamemain/template/worldmapicon.thtml) has no shrine layout; only
// the minimap's has one (found in the game files, 2026-10-22). The Pywel
// Atlas Shrine Icons file mod (src/pywel-atlas-ui/, installed through DMM)
// adds that layout; with it the v0.77 test run created all 11 shrine markers.
// v0.78: shrine markers are on in every build. Without the file mod the game
// keeps refusing them on the world map; the mod then stops trying there and
// the panel says the add-on is needed (see kShrineAddonRefusals).
constexpr bool kShrineMarkersShown = true;
// v0.73 (test build) / v0.78 (every build): the same markers are also kept
// on the minimap (user request, 2026-10-22).
constexpr bool kMinimapMarkers = true;
constexpr MarkerCategory kCategories[kCategoryCount] = {
    {"Bell", 360, 29084, "MapIcon_Gimmick_Bell_01", 0x5059415400000100ULL, _countof(kBellLinks), true,
        0xffffffff},
    // Type 186 as the game itself created it for Deepfog Basin (trace
    // research/traces/pywel-atlas-test-v0.55-deepfog-map-marker.log). Paused
    // (user, 2026-10-22): v0.56/v0.57 showed the game refuses to build it.
    // v0.78: on again; needs the Shrine Icons file mod on the world map (see
    // kShrineMarkersShown).
    {"Greymane Shrine", 186, 28812, "MapIcon_Gimmick_GreyManeTemple", 0x5059415400000200ULL,
        _countof(kShrineLinks), kShrineMarkersShown, 0xffffffff},
    // Type 226, the chest icon of the proof chest (v0.31 onwards). Keys
    // 0x...0300 + i stay below 0x...0400 for up to 256 chests.
    {"Chest", 226, 28852, "MapIcon_Gimmick_LevelTreasureBox", 0x5059415400000300ULL,
        _countof(kChestLinks), true, 0xffffffff},
    // v0.69 tried type 40, the game's own Abyss chest icon: the game refused
    // all 74 creations (like the shrine icon). v0.70 (user, 2026-10-22, also
    // for the final version): the normal chest icon 226. Keys 0x...0400 + i.
    {"Abyss Chest", 226, 28852, "MapIcon_Gimmick_LevelTreasureBox", 0x5059415400000400ULL,
        _countof(kAbyssChestLinks), true, 0xffffffff},
    // v0.79: type 234, the game's own Abyss Nexus icon (template 28866
    // "MapIcon_Abyss_Ruins", group 0x20; seen on the game's own discovered
    // Nexuses, world map and minimap). Keys 0x...0500 + i.
    {"Abyss Nexus", 234, 28866, "MapIcon_Abyss_Ruins", 0x5059415400000500ULL,
        _countof(kNexusLinks), true, 0x20},
};
static_assert(_countof(kBellLinks) <= kMaxCategoryMarkers && _countof(kShrineLinks) <= kMaxCategoryMarkers &&
    _countof(kChestLinks) <= kMaxCategoryMarkers && _countof(kAbyssChestLinks) <= kMaxCategoryMarkers &&
    _countof(kNexusLinks) <= kMaxCategoryMarkers,
    "Marker masks hold at most 256 markers per category");

// Display name of marker `index` in `category` ("Calphade Bell").
const char* MarkerName(unsigned category, unsigned index) {
    if (category == kBellCategory) {
        return kBellLinks[index].name;
    }
    if (category == kAbyssChestCategory) {
        return kAbyssChestLinks[index].name;
    }
    if (category == kNexusCategory) {
        return kNexusLinks[index].name;
    }
    return category == kShrineCategory ? kShrineLinks[index].name : kChestLinks[index].name;
}

// Game position (X, height Y, Z) of marker `index` in `category`.
const float* MarkerPosition(unsigned category, unsigned index) {
    if (category == kBellCategory) {
        return kBellLinks[index].position;
    }
    if (category == kAbyssChestCategory) {
        return kAbyssChestLinks[index].position;
    }
    if (category == kNexusCategory) {
        return kNexusLinks[index].position;
    }
    return category == kShrineCategory ? kShrineLinks[index].position : kChestLinks[index].position;
}

// A fixed-size set of marker bits, one per marker of a category.
struct MarkerMask {
    LONG words[kMaskWords];

    // True if marker `index` is in the set.
    bool Test(unsigned index) const { return (words[index / 32] >> (index % 32)) & 1; }
    // Add or remove marker `index`.
    void Set(unsigned index) { words[index / 32] |= static_cast<LONG>(1UL << (index % 32)); }
    void Clear(unsigned index) { words[index / 32] &= ~static_cast<LONG>(1UL << (index % 32)); }
    // True if both sets hold exactly the same markers.
    bool Same(const MarkerMask& other) const { return memcmp(words, other.words, sizeof(words)) == 0; }
    // How many markers are in the set.
    unsigned Count() const {
        unsigned total = 0;
        for (LONG word : words) {
            total += static_cast<unsigned>(__popcnt(static_cast<unsigned>(word)));
        }
        return total;
    }
};

// Read a mask shared between threads, one word at a time. Each word is read
// atomically; a mask changing during the read can mix old and new words, but
// every bit is then still either its old or its new value.
MarkerMask LoadMask(volatile LONG (&shared)[kMaskWords]) {
    MarkerMask mask = {};
    for (unsigned word = 0; word < kMaskWords; ++word) {
        mask.words[word] = InterlockedCompareExchange(&shared[word], 0, 0);
    }
    return mask;
}

// Replace a shared mask, one word at a time.
void StoreMask(volatile LONG (&shared)[kMaskWords], const MarkerMask& mask) {
    for (unsigned word = 0; word < kMaskWords; ++word) {
        InterlockedExchange(&shared[word], mask.words[word]);
    }
}

// Add or remove one marker in a shared mask.
void SetSharedBit(volatile LONG (&shared)[kMaskWords], unsigned index, bool on) {
    LONG bit = static_cast<LONG>(1UL << (index % 32));
    if (on) {
        InterlockedOr(&shared[index / 32], bit);
    } else {
        InterlockedAnd(&shared[index / 32], ~bit);
    }
}

// Finds which category and marker a private key belongs to; false if none.
bool FindMarker(uint64_t key, unsigned& category, unsigned& index) {
    for (unsigned item = 0; item < kCategoryCount; ++item) {
        const MarkerCategory& kind = kCategories[item];
        if (key >= kind.keyBase && key < kind.keyBase + kind.count) {
            category = item;
            index = static_cast<unsigned>(key - kind.keyBase);
            return true;
        }
    }
    return false;
}

// True only if `icon` is our marker `index` of `category`: right type, its
// private key and kind, and exactly that spot's position. Anything else is
// never touched.
bool IsCategoryMarker(void* icon, unsigned category, unsigned index) {
    WORD type = 0;
    NumericTag tag = {};
    float position[3] = {};
    auto* bytes = static_cast<const BYTE*>(icon);
    if (!icon || category >= kCategoryCount || index >= kCategories[category].count) {
        return false;
    }
    const MarkerCategory& kind = kCategories[category];
    return Read(bytes + 0xde, &type, sizeof(type)) && type == kind.type &&
        Read(bytes + 0xc8, &tag, sizeof(tag)) &&
        tag.key == kind.keyBase + index && tag.kind == 0x15 &&
        Read(bytes + 0xe0, position, sizeof(position)) &&
        memcmp(position, MarkerPosition(category, index), sizeof(position)) == 0;
}
#endif

// True for a private key this mod uses: the proof chest's, or (combined
// build) one of the category markers'.
bool IsOwnMarkerKey(uint64_t key) {
#ifdef PYWEL_ATLAS_COMBINED
    unsigned category = 0;
    unsigned index = 0;
    if (FindMarker(key, category, index)) {
        return true;
    }
#endif
    return key == chestKey;
}

// The icon type this mod creates for one of its private keys: the category's
// native icon for a marker (combined build), the chest for the proof chest.
WORD OwnMarkerType(uint64_t key) {
#ifdef PYWEL_ATLAS_COMBINED
    unsigned category = 0;
    unsigned index = 0;
    if (FindMarker(key, category, index)) {
        return kCategories[category].type;
    }
#else
    (void)key; // Standalone build: only the proof chest exists.
#endif
    return chestType;
}

// True only if `icon` is our own chest: right type (+0xde), our private tag
// (+0xc8) and exactly the active definition's position (+0xe0). In the
// combined build a category marker counts too (diagnostic hooks use this).
bool IsPrivateChest(void* icon) {
#ifdef PYWEL_ATLAS_COMBINED
    NumericTag probe = {};
    if (icon && Read(static_cast<const BYTE*>(icon) + 0xc8, &probe, sizeof(probe))) {
        unsigned category = 0;
        unsigned index = 0;
        if (FindMarker(probe.key, category, index)) {
            return IsCategoryMarker(icon, category, index);
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
        // Combined build: keep the markers matching what the worker wants.
        ServiceMarkers(controller);
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

#ifdef PYWEL_ATLAS_COMBINED
// ===========================================================================
// Section: combined build - one map marker per collectible, following the
// loaded save
// ---------------------------------------------------------------------------
// In the combined Pywel Atlas mod, the save-detection part says which save is
// loaded and publishes what the slot the game last saved it to says about
// Bells, (v0.56) Greymane Shrines and (v0.58) treasure chests (see
// src/pywel-atlas/LoadedSave.h). This part shows one marker at each known
// Bell / chest the save does NOT mark as done, and removes it once it is.
// Each category (kCategories) is handled the same way, with its own masks.
//
// How it works ("desired state"):
//   - The worker decides which markers SHOULD exist (markerWanted, one bit
//     per marker per category) and whether new ones may be created
//     (markerCreateAllowed, per category).
//   - On every world-map update (the game's map thread), ServiceMarkers
//     compares that with what is really on the map and fixes the difference,
//     for a rotating slice of markers per update (v0.58): it creates at most
//     one missing marker per update and removes unwanted ones. A removal with
//     nothing to remove is simply nothing to do, so it can never block a
//     later creation (the v0.51 "press F6 twice" quirk).
//   - Markers stay until they are unwanted. There is no 3-minute limit and
//     losing game focus does nothing (the v0.51 focus-loss quirk).
// Safety rules:
//   - Only an accepted ("valid") detected result can make a marker appear.
//     While nothing is known (just after loading, or if a read or the shrine
//     pass failed), existing markers are kept but no new ones are created.
//     Unknown never means "not done".
//   - Only icons with our own private key, type and exact position are ever
//     removed; anything else (including the game's own icons) is left alone.
// ===========================================================================

// Shared between the worker (writes wanted/allowed) and the map thread
// (writes present). One bit per marker, in the category's list order
// (v0.58: kMaskWords words per category; see MarkerMask).
volatile LONG markerWanted[kCategoryCount][kMaskWords] = {};
volatile LONG markerCreateAllowed[kCategoryCount] = {};
// v0.83: 1 = keep this category's markers but hide them (the user turned it
// off; only categories where HidesInsteadOfRemoving is true).
volatile LONG markerHiddenByChoice[kCategoryCount] = {};
volatile LONG markerPresent[kCategoryCount][kMaskWords] = {}; // Markers this session created and still sees.
volatile LONG markerStuck[kCategoryCount][kMaskWords] = {}; // Markers still present 3 s after removal.
volatile LONG markerFailed[kCategoryCount][kMaskWords] = {}; // Last creation try failed (v0.57; retried every 5 s).
volatile LONG markerCreations = 0; // Successful creations (diagnostic count).
volatile LONG markerRemovals = 0; // Native removal calls (diagnostic count).
volatile LONG markerFailures = 0; // Creations that could not be completed.
volatile LONG markerZoomWindowWrites = 0; // Zoom-limit bytes switched off (diagnostic count).
volatile LONG markerZoomWindowFailures = 0; // Writes the system refused (diagnostic count).

// Each map icon copies up to three "zoom windows" from its UI template when it
// is set up: a zoom range in which the icon is shown (main icon at +0x1f8,
// image at +0x20c, text at +0x220; 0x14 bytes each, the byte at +0x10 of each
// = enabled). Outside that range the game hides the icon. The native Bell icon
// is only shown near full zoom-in (v0.53 runtime log). With the user's
// approval, this switches the enabled bytes off on OUR OWN markers only, so
// the game treats them like personal pins (no zoom limit). It never touches
// the shared icon type, the template, or any icon the caller has not just
// verified as ours (IsCategoryMarker), and runs only on the game's map thread.
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
            InterlockedIncrement(&markerZoomWindowWrites);
        } else {
            InterlockedIncrement(&markerZoomWindowFailures);
        }
    }
}

// v0.73: the same markers can be kept on two maps. A "map side" holds what
// differs between them: the game's own find/remove functions for that map
// and this side's bookkeeping. The world map is always served; the minimap
// too (v0.73 test build, v0.78 every build). Each side is used only on
// its own map's update (the game's UI thread), never from the worker.
struct MapSide {
    const char* name; // For the log: "world map" or "minimap".
    uintptr_t controllerTable; // The controller's vtable RVA (0x566ff50 / 0x5674e00).
    bool world; // World map: our layer routing and zoom-limit-off apply.
    LookupIcon* lookup; // The game's own "find icon" function for this map.
    RemoveWorldIcon* remove; // The game's own "remove icon" function for this map.
    volatile LONG (*present)[kMaskWords]; // Markers created, verified and still seen.
    volatile LONG (*stuck)[kMaskWords]; // Still there 3 s after removal.
    volatile LONG (*failed)[kMaskWords]; // Last creation try failed.
    volatile LONG (*hidden)[kMaskWords]; // v0.83: hidden by the user's choice (see SetChoiceHidden).
    volatile LONG* creations;
    volatile LONG* removals;
    volatile LONG* failures;
    // Map thread only: when each removal was issued (a removal the game
    // defers is checked again instead of being issued repeatedly), and
    // (v0.57) when a failed marker may be tried again (5 s later, so one
    // failing marker cannot take every update's single creation slot).
    ULONGLONG removalIssued[kCategoryCount][kMaxCategoryMarkers];
    ULONGLONG retryAfter[kCategoryCount][kMaxCategoryMarkers];
    unsigned cursor; // Position of the next marker to check (all shown categories in order).
};

// v0.73 minimap bookkeeping. Written only on the minimap's
// update; the worker reads the masks for its log.
volatile LONG minimapPresent[kCategoryCount][kMaskWords] = {};
volatile LONG minimapStuck[kCategoryCount][kMaskWords] = {};
volatile LONG minimapFailed[kCategoryCount][kMaskWords] = {};
volatile LONG minimapCreations = 0;
volatile LONG minimapRemovals = 0;
volatile LONG minimapFailures = 0;
// The minimap's own remove function (0xe09fc0, slot 0x558 of the minimap
// controller's vtable). Set only when its guard bytes and both vtable slots
// match the studied build (see InstallMinimapMarkers); null = minimap off.
RemoveWorldIcon removeMinimapIcon = nullptr;

// v0.83: our markers each map currently keeps hidden (written on that map's
// thread, read by the worker for the log).
volatile LONG worldHidden[kCategoryCount][kMaskWords] = {};
volatile LONG minimapHidden[kCategoryCount][kMaskWords] = {};

MapSide worldSide = {"world map", 0x566ff50, true, &worldLookup, &removeWorldIcon,
    markerPresent, markerStuck, markerFailed, worldHidden, &markerCreations, &markerRemovals, &markerFailures,
    {}, {}, 0};
MapSide minimapSide = {"minimap", 0x5674e00, false, &minimapLookup, &removeMinimapIcon,
    minimapPresent, minimapStuck, minimapFailed, minimapHidden, &minimapCreations, &minimapRemovals,
    &minimapFailures, {}, {}, 0};

// ---------------------------------------------------------------------------
// v0.83: hiding instead of removing (Abyss Nexus markers)
// ---------------------------------------------------------------------------
// v0.79-v0.82 runtime: Abyss Nexus markers that were removed (filter panel
// off) and created again (filter on) exist, sit in the map's picture lists
// and have no hide reason set, yet the game never draws them, even with a
// fresh key; re-created chests do show. The game reuses the removed markers'
// picture parts, and the Nexus icon has a second ("small") picture that
// chests lack, so the reused parts probably keep a state that creation does
// not reset (not proven). So Nexus markers are no longer removed when the
// user turns them off (panel or F10): they are hidden and shown again with
// the game's own "set one hide reason" function, 0xdeca40, the same one the
// game uses to hide its own icons (for example icons of the other map
// layer). It sets one of the icon's 24 hide-reason bits (+0x1e8) and, if
// that changes whether any bit is set, tells the icon's picture to hide or
// show. Markers of completed spots are still removed as before.
// Allowed by the user's "free rein" decision (2026-10-23).

// The hide-reason bit we use: 23, which no game call sets with a fixed bit
// number (static scan of all 0xdeca40 calls; 9 calls pass a computed number).
constexpr BYTE kChoiceHideBit = 23;

// True for categories whose markers are hidden, not removed, when the user
// turns them off.
bool HidesInsteadOfRemoving(unsigned category) {
    return category == kNexusCategory;
}

// Reads our hide-reason bit from one of our own verified markers into
// `isHidden`. False if the read fails.
bool ReadChoiceHidden(const void* icon, bool& isHidden) {
    BYTE bits[3] = {};
    if (!Read(static_cast<const BYTE*>(icon) + 0x1e8, bits, sizeof(bits))) {
        return false;
    }
    isHidden = ((bits[kChoiceHideBit / 8] >> (kChoiceHideBit % 8)) & 1) != 0;
    return true;
}

// Hides (`hide` true) or shows one of our own verified markers through the
// game's own function, then checks the bit. Runs only on that map's own
// thread, right after the caller verified `icon` (IsCategoryMarker).
// `originalVisibility` is the original 0xdeca40 behind our observation hook,
// so it exists only when that hook's guard bytes matched.
bool SetChoiceHidden(void* icon, bool hide) {
    if (!originalVisibility) {
        return false;
    }
    originalVisibility(icon, kChoiceHideBit, hide ? 1 : 0);
    bool isHidden = false;
    return ReadChoiceHidden(icon, isHidden) && isHidden == hide;
}

// The icon type's definition record, or 0 (defined after ReadTable below).
uintptr_t IconRecord(WORD type);

// ---------------------------------------------------------------------------
// v0.80 observation (read-only): why re-created Abyss Nexus markers stay hidden
// ---------------------------------------------------------------------------
// v0.79 runtime: Nexus markers were shown at first, but after the filter
// panel turned them off and on again (map open, player in the Abyss), the
// game accepted every new marker yet never drew one, even after reopening
// the map. Chests went through the same off/on and came back.
// Every map icon has 24 "hide reason" bits at +0x1e8; it is drawn only while
// all of them are clear. From the game code (0xdb6e95..0xdb6ec9, 0xd8bf00):
// when an icon is set up, the game works out its map layer ("layer class";
// 3 = Abyss) from the icon type's definition and sets hide bit 12 if the
// world-map controller's "layer showing" byte for that class is 0
// (controller +0x468 points at one byte per class). If that is what happens
// to our Nexus markers, these lines will show it. Everything here only reads
// game memory and queues log lines; it changes nothing.
// v0.80 runtime: it is not that. Re-created Nexus markers exist, on layer
// class 1 (surface), with all 24 hide bits clear, and still are not drawn.
// v0.81 therefore also logs each watched marker's picture objects and raw
// copies of a visible (first round) and an invisible (later round) marker,
// with chest markers (which do come back) for comparison.

// Queues one finished log line from the game's map thread for the worker.
// Never waits for the lock on the game's thread: if it is busy, the line is
// dropped (counted like a dropped sample).
void QueueObservation(const char* line) {
    if (!TryAcquireSRWLockExclusive(&sampleLock)) {
        InterlockedIncrement(&droppedSamples);
        return;
    }
    if (observationLineCount < _countof(observationLines)) {
        strcpy_s(observationLines[observationLineCount++], line);
    } else {
        InterlockedIncrement(&droppedSamples);
    }
    ReleaseSRWLockExclusive(&sampleLock);
}

// The layer class the game gives `icon`, worked out the same way as the
// game's own function 0xd8bf00 (which is read here, never called). False if
// any value is unreadable.
bool IconLayerClass(const void* icon, BYTE& layerClass) {
    auto* bytes = static_cast<const BYTE*>(icon);
    WORD alternateType = 0xffff;
    WORD type = 0;
    if (!Read(bytes + 0x288, &alternateType, sizeof(alternateType)) ||
        !Read(bytes + 0xde, &type, sizeof(type))) {
        return false;
    }

    // The class comes from +0x2a of the icon's type definition (the second
    // type number at +0x288 is used instead unless it is 0xffff).
    uintptr_t classRecord = IconRecord(alternateType != 0xffff ? alternateType : type);
    if (!classRecord || !Read(reinterpret_cast<const void*>(classRecord + 0x2a), &layerClass, sizeof(layerClass))) {
        return false;
    }
    if (layerClass >= 3) {
        return true;
    }

    // Below 3, a type whose +0xb7 flag is set moves to class 3 when the icon
    // is at or above the game's Abyss height limit.
    uintptr_t ownRecord = IconRecord(type);
    BYTE followsHeight = 0;
    if (!ownRecord || !Read(reinterpret_cast<const void*>(ownRecord + 0xb7), &followsHeight, sizeof(followsHeight))) {
        return false;
    }
    if (!followsHeight) {
        return true;
    }
    float height = 0;
    float threshold = 0;
    if (!Read(bytes + 0xe4, &height, sizeof(height)) ||
        !Read(reinterpret_cast<const void*>(imageBase + kParentAltitudeThresholdRva), &threshold, sizeof(threshold))) {
        return false;
    }
    if (height >= threshold) {
        layerClass = 3;
    }
    return true;
}

// Copies the world-map controller's "layer showing" bytes for classes 0-4
// (controller +0x468 points at them). False if unreadable.
bool ReadLayersShowing(void* controller, BYTE (&showing)[5]) {
    uintptr_t table = 0;
    return Read(static_cast<const BYTE*>(controller) + 0x468, &table, sizeof(table)) && table &&
        Read(reinterpret_cast<const void*>(table), showing, sizeof(showing));
}

// World-map creations of our markers, per category, by their hide bits right
// after creation: all clear, any set, and bit 12 ("layer not showing") set.
// Written on the map thread, logged by the worker.
volatile LONG createdClear[kCategoryCount] = {};
volatile LONG createdHidden[kCategoryCount] = {};
volatile LONG createdLayerHidden[kCategoryCount] = {};

// A few markers whose state is logged again later (map thread only): 3 s
// and 10 s after creation, and whenever the layer bytes change. v0.81: 4 Nexus
// markers and (for comparison, since re-created chests do show) 2 chest
// markers. Each category's list starts again each time its markers become
// wanted again (filter turned on).
struct MarkerWatch {
    bool used;
    unsigned category;
    unsigned index;
    ULONGLONG created;
    unsigned checks; // 0 = only the creation line so far, 1 = 3 s line done, 2 = 10 s line done.
};
// v0.82: Abyss chests (same chest icon) are watched too.
constexpr unsigned kWatchedCategories[3] = {kNexusCategory, kChestCategory, kAbyssChestCategory};
constexpr unsigned kWatchSlots[3] = {4, 2, 2}; // Markers watched per round, per watched category.
MarkerWatch markerWatch[3][4] = {};
bool watchWantedBefore[3] = {}; // Any marker of the category wanted at the last world-map update.
unsigned watchRound[3] = {}; // Counts the rounds (1 = the markers made after loading).
BYTE layersBefore[5] = {}; // Layer bytes at the last world-map update...
bool layersKnown = false; // ...once read.

// v0.81: queues a raw hex copy of `size` bytes at `address` (game memory),
// 0x80 bytes per log line, so a visible and an invisible marker can be
// compared byte by byte offline. Pointers in it are only numbers in the log.
void QueueDump(const char* what, const char* name, unsigned round, const void* address, unsigned size) {
    for (unsigned offset = 0; offset < size; offset += 0x80) {
        BYTE bytes[0x80] = {};
        unsigned length = size - offset < 0x80 ? size - offset : 0x80;
        char line[400];
        int used = sprintf_s(line, "layer-dump round=%u %s marker=%s +0x%03x ", round, what, name, offset);
        if (used < 0) {
            return;
        }
        if (!Read(static_cast<const BYTE*>(address) + offset, bytes, length)) {
            strcat_s(line, "unreadable");
        } else {
            for (unsigned byte = 0; byte < length; ++byte) {
                sprintf_s(line + used, sizeof(line) - used, "%02x", bytes[byte]);
                used += 2;
            }
        }
        QueueObservation(line);
    }
}

// v0.82: looks for `root` (an icon's interface picture, icon +0x8) in the
// world map's layer containers. The game's per-frame icon update (0xd94040,
// called once per container by 0xdabd10) walks each container's list of
// child pictures (+0x40 array, +0x48 count) and takes each child's icon from
// child +0xd8; an icon whose picture is in no list is never updated or drawn.
// Read-only. Returns false if `root` is in no container list.
bool FindPictureInContainers(void* controller, uintptr_t root, unsigned& container, unsigned& slot) {
    DWORD containerCount = 0;
    uintptr_t containers = 0;
    if (!root || !Read(static_cast<const BYTE*>(controller) + 0x3a0, &containerCount, sizeof(containerCount)) ||
        containerCount == 0 || containerCount > 16 ||
        !Read(static_cast<const BYTE*>(controller) + 0x398, &containers, sizeof(containers)) || !containers) {
        return false;
    }
    for (container = 0; container < containerCount; ++container) {
        uintptr_t layer = 0;
        uintptr_t children = 0;
        DWORD childCount = 0;
        if (!Read(reinterpret_cast<const void*>(containers + container * sizeof(uintptr_t)), &layer, sizeof(layer)) ||
            !layer || !Read(reinterpret_cast<const void*>(layer + 0x40), &children, sizeof(children)) || !children ||
            !Read(reinterpret_cast<const void*>(layer + 0x48), &childCount, sizeof(childCount)) || childCount > 65536) {
            continue;
        }
        // Read the list in blocks of 512 entries.
        uintptr_t block[512];
        for (DWORD start = 0; start < childCount; start += _countof(block)) {
            DWORD length = childCount - start < _countof(block) ? childCount - start : _countof(block);
            if (!Read(reinterpret_cast<const void*>(children + start * sizeof(uintptr_t)), block,
                length * sizeof(uintptr_t))) {
                break;
            }
            for (DWORD entry = 0; entry < length; ++entry) {
                if (block[entry] == root) {
                    slot = start + entry;
                    return true;
                }
            }
        }
    }
    return false;
}

// Queues one line describing a watched marker: its 24 hide bits, its layer
// class, the controller's layer bytes and (v0.81) its picture objects (+0x8
// interface root, +0x118 base icon, +0x260 second element; addresses only).
// With `dump`, also raw copies of the icon and of its first two picture
// objects. `icon` may be null (the marker was looked up and not found).
void DescribeMarker(void* controller, void* icon, const MarkerWatch& watch, unsigned round, const char* moment,
    bool dump) {
    auto* bytes = static_cast<const BYTE*>(icon);
    BYTE hide[3] = {};
    BYTE layerClass = 0xff;
    BYTE showing[5] = {};
    uintptr_t root = 0;
    uintptr_t baseIcon = 0;
    uintptr_t second = 0;
    bool hideRead = icon && Read(bytes + 0x1e8, hide, sizeof(hide));
    bool classRead = icon && IconLayerClass(icon, layerClass);
    bool showingRead = ReadLayersShowing(controller, showing);
    bool picturesRead = icon && Read(bytes + 8, &root, sizeof(root)) &&
        Read(bytes + 0x118, &baseIcon, sizeof(baseIcon)) && Read(bytes + 0x260, &second, sizeof(second));
    const char* name = MarkerName(watch.category, watch.index);
    char line[400];
    sprintf_s(line, "layer-watch round=%u %s %s marker=%s found=%u hide=%s%02x%02x%02x layerClass=%s%u "
        "layersShowing=%s%u%u%u%u%u pictures%s root=0x%llx baseIcon=0x%llx second=0x%llx",
        round, moment, kCategories[watch.category].label, name, icon ? 1u : 0u, hideRead ? "" : "?",
        hide[0], hide[1], hide[2], classRead ? "" : "?", layerClass, showingRead ? "" : "?",
        showing[0], showing[1], showing[2], showing[3], showing[4], picturesRead ? "" : "?",
        static_cast<unsigned long long>(root), static_cast<unsigned long long>(baseIcon),
        static_cast<unsigned long long>(second));
    QueueObservation(line);

    // v0.82: is the picture in a layer container's list (so the game's
    // per-frame update reaches it), and does it point back at this icon?
    if (icon && root) {
        uintptr_t owner = 0;
        uintptr_t reference = 0;
        uintptr_t referenceUse = 0;
        BYTE needsRefresh = 0;
        unsigned container = 0;
        unsigned slot = 0;
        Read(reinterpret_cast<const void*>(root + 0xd8), &owner, sizeof(owner));
        // The per-frame update skips a child whose +0xa0 object has a non-zero +0x8.
        if (Read(reinterpret_cast<const void*>(root + 0xa0), &reference, sizeof(reference)) && reference) {
            Read(reinterpret_cast<const void*>(reference + 8), &referenceUse, sizeof(referenceUse));
        }
        Read(bytes + 0x1ed, &needsRefresh, sizeof(needsRefresh));
        bool listed = FindPictureInContainers(controller, root, container, slot);
        char where[48] = "none";
        if (listed) {
            sprintf_s(where, "container %u slot %u", container, slot);
        }
        sprintf_s(line, "layer-attach round=%u %s %s marker=%s icon=0x%llx key=0x%llx pictureOwner=0x%llx ownerMatches=%u "
            "picture+0xa0=0x%llx (+0x8=0x%llx) needsRefresh=%u inContainerList=%s",
            round, moment, kCategories[watch.category].label, name,
            static_cast<unsigned long long>(reinterpret_cast<uintptr_t>(icon)),
            static_cast<unsigned long long>(kCategories[watch.category].keyBase + watch.index),
            static_cast<unsigned long long>(owner), owner == reinterpret_cast<uintptr_t>(icon) ? 1u : 0u,
            static_cast<unsigned long long>(reference), static_cast<unsigned long long>(referenceUse),
            needsRefresh, where);
        QueueObservation(line);
    }
    if (!dump || !icon) {
        return;
    }
    QueueDump("icon", name, round, icon, 0x2c0);
    if (root) {
        QueueDump("root", name, round, reinterpret_cast<const void*>(root), 0x100);
    }
    if (baseIcon) {
        QueueDump("baseIcon", name, round, reinterpret_cast<const void*>(baseIcon), 0x100);
    }
}

// Called on the map thread after one of our markers was created on the world
// map and verified: counts its hide bits, and may start watching it.
void NoteWorldCreation(void* controller, void* icon, unsigned category, unsigned index) {
    BYTE hide[3] = {};
    if (Read(static_cast<const BYTE*>(icon) + 0x1e8, hide, sizeof(hide))) {
        if (hide[0] | hide[1] | hide[2]) {
            InterlockedIncrement(&createdHidden[category]);
        } else {
            InterlockedIncrement(&createdClear[category]);
        }
        // Bit 12 = bit 4 of the second byte.
        if (hide[1] & 0x10) {
            InterlockedIncrement(&createdLayerHidden[category]);
        }
    }
    for (unsigned watched = 0; watched < _countof(kWatchedCategories); ++watched) {
        if (kWatchedCategories[watched] != category) {
            continue;
        }
        for (unsigned slot = 0; slot < kWatchSlots[watched]; ++slot) {
            MarkerWatch& watch = markerWatch[watched][slot];
            if (!watch.used) {
                watch = {true, category, index, GetTickCount64(), 0};
                DescribeMarker(controller, icon, watch, watchRound[watched], "created", false);
                return;
            }
        }
    }
}

// Finds our marker `index` of `category` on the world map, or null (also
// null if what is found is not exactly ours).
void* FindWorldMarker(void* controller, unsigned category, unsigned index) {
    const MarkerCategory& kind = kCategories[category];
    NumericTag tag = {};
    tag.key = kind.keyBase + index;
    tag.kind = 0x15;
    DWORD lookupIndex = 0;
    if (!worldLookup) {
        return nullptr;
    }
    void* icon = worldLookup(controller, &kind.type, &tag, &lookupIndex);
    return IsCategoryMarker(icon, category, index) ? icon : nullptr;
}

// Runs on the map thread after each world-map update: logs layer byte
// changes and the watched markers' later states.
void ObserveNexusLayers(void* controller) {
    // A new round of watching each time a watched category becomes wanted again.
    for (unsigned watched = 0; watched < _countof(kWatchedCategories); ++watched) {
        unsigned category = kWatchedCategories[watched];
        bool wanted = LoadMask(markerWanted[category]).Count() != 0;
        if (wanted && !watchWantedBefore[watched]) {
            for (MarkerWatch& watch : markerWatch[watched]) {
                watch.used = false;
            }
            ++watchRound[watched];
            char line[160];
            sprintf_s(line, "layer-watch: %s markers wanted (round %u); watching the next %u created",
                kCategories[category].label, watchRound[watched], kWatchSlots[watched]);
            QueueObservation(line);
        }
        watchWantedBefore[watched] = wanted;
    }

    // The layer bytes changed (map opened or closed, or another layer shown?).
    BYTE showing[5] = {};
    bool layersChanged = ReadLayersShowing(controller, showing) &&
        (!layersKnown || memcmp(showing, layersBefore, sizeof(showing)) != 0);
    if (layersChanged) {
        char line[160];
        sprintf_s(line, "layer-watch: layers showing changed to %u%u%u%u%u (classes 0-4)",
            showing[0], showing[1], showing[2], showing[3], showing[4]);
        QueueObservation(line);
        memcpy(layersBefore, showing, sizeof(showing));
        layersKnown = true;
    }

    // Layer changes, and the 3 s (with raw copies) and 10 s checks.
    ULONGLONG now = GetTickCount64();
    for (unsigned watched = 0; watched < _countof(kWatchedCategories); ++watched) {
        for (MarkerWatch& watch : markerWatch[watched]) {
            if (!watch.used) {
                continue;
            }
            unsigned round = watchRound[watched];
            if (layersChanged) {
                DescribeMarker(controller, FindWorldMarker(controller, watch.category, watch.index), watch, round,
                    "layers-changed", true);
            }
            if (watch.checks == 0 && now - watch.created >= 3000) {
                watch.checks = 1;
                DescribeMarker(controller, FindWorldMarker(controller, watch.category, watch.index), watch, round,
                    "after-3s", true);
            } else if (watch.checks == 1 && now - watch.created >= 10000) {
                watch.checks = 2;
                DescribeMarker(controller, FindWorldMarker(controller, watch.category, watch.index), watch, round,
                    "after-10s", false);
            }
        }
    }
}

// v0.74: the number ("index") a marker is created and looked up with. The
// world map finds our markers by their tag, so they use 0 (as since v0.31).
// The minimap's find function (0xdeffa0) returns nothing for index 0, and
// the shared create function (0xdeeb60) treats 0 as "replace whatever has
// this tag" (v0.73 log: every minimap marker "not found", recreated every
// 5 s and never removed). So minimap markers get their own non-zero number:
// 0x50590000 ("PY" in the high bytes, like our keys) + category * 0x100 +
// marker. The find and create functions also compare type and tag, so a
// number the game happens to use too never matches one of its icons.
DWORD MarkerIndex(const MapSide& side, unsigned category, unsigned index) {
    return side.world ? 0u : 0x50590000u + category * 0x100u + index;
}

// v0.76: the first few minimap icons found by lookup but not yet owned
// (adopted when they have our exact identity) are logged per category.
volatile LONG minimapAdoptLogged[kCategoryCount] = {};

// v0.73: the first few minimap creation attempts per category are logged
// (what the find function returned and whether it matched our identity).
volatile LONG minimapCreateLogged[kCategoryCount] = {};

// v0.78: what one creation attempt achieved.
enum class CreateResult {
    Created, // Exists now and is confirmed as ours.
    Pending, // Minimap: asked for; the game builds it a moment later (adopted then).
    Failed, // Could not be created or confirmed (retried after 5 s).
};

// v0.78: world-map creations the game refused (its icon constructor ran but
// returned no icon) and creations that worked, per category. Written on the
// map thread, read by the worker. The shrine icon is refused on the world map
// unless the Shrine Icons file mod is installed.
volatile LONG worldRefusals[kCategoryCount] = {};
volatile LONG worldSuccesses[kCategoryCount] = {};
// After this many refusals with no success, a category is treated as "needs
// its icon add-on": no more world-map tries this session (the worker sets
// worldCreateBlocked). The minimap has its own shrine layout and keeps going.
constexpr LONG kShrineAddonRefusals = 3;
volatile LONG worldCreateBlocked[kCategoryCount] = {};

// Ask the game to create marker `index` of `category` at that spot's
// position on one map, then look it up again to confirm it exists with our
// identity. Returns true only after that confirmation (same steps as
// CreateIndependentChest). World map: our map layer is chosen (see
// ResolveIndependentParent). Minimap (v0.73): the minimap's own creation
// passes its own containers, so no layer is chosen here.
CreateResult CreateMarker(void* controller, unsigned category, unsigned index, const MapSide& side) {
    if (creatingChest) {
        return CreateResult::Failed;
    }
    const MarkerCategory& kind = kCategories[category];
    const float* position = MarkerPosition(category, index);
    float place[3] = {position[0], position[1], position[2]};
    void* parent = nullptr;
    uintptr_t record = 0;
    const void* presentation = nullptr;
    if (side.world) {
        if (!ResolveIndependentParent(controller, kind.type, place, parent, record)) {
            return CreateResult::Failed;
        }
    } else {
        if (!MarkerDefinitionReady(kind.type)) {
            return CreateResult::Failed;
        }
        record = IconRecord(kind.type);
    }
    if (!record || !ResolvePresentation(record, presentation)) {
        return CreateResult::Failed;
    }
    NumericTag tag = {};
    tag.key = kind.keyBase + index;
    tag.kind = 0x15;
    DWORD lookupIndex = MarkerIndex(side, category, index);
    Sample generated = {};
    generated.controller = side.controllerTable;
    generated.type = kind.type;
    generated.generated = true;
    generated.finalFlag = 1;
    generated.positionRead = true;
    memcpy(generated.tag, &tag, sizeof(tag));
    memcpy(generated.position, place, sizeof(place));
    strcpy_s(generated.markerName, MarkerName(category, index));
    Sample* previous = activeSample;
    void* previousRequestedContainer = requestedChestContainer;
    requestedChestContainer = parent; // Null on the minimap: no layer routing.
    activeSample = &generated;
    creatingChest = true;
    // Same empty property collection as the proof chest (see
    // CreateIndependentChest for why it is safe).
    alignas(8) BYTE emptyProperties[0x28] = {};
    float scalar = 0;
    originalCreate(controller, &kind.type, &tag, &lookupIndex, &scalar,
        place, presentation, 0, emptyProperties, 1);
    creatingChest = false;
    activeSample = previous;
    requestedChestContainer = previousRequestedContainer;
    // Read back: it must exist with our type, key and exact position (and on
    // the world map, our parent-container routing must have happened).
    void* icon = (*side.lookup)(controller, &kind.type, &tag, &lookupIndex);
    CaptureIconState(icon, generated);
    generated.iconVerified = IsCategoryMarker(icon, category, index);
    // v0.72: our own markers are not added to the sample list (264 chests
    // filled it); their world-create lines and the counts log them.
    if (!side.world && InterlockedIncrement(&minimapCreateLogged[category]) <= 3) {
        char line[320];
        sprintf_s(line, "minimap-create %s marker=%s found=%u verified=%u",
            kind.label, MarkerName(category, index), icon ? 1u : 0u, generated.iconVerified ? 1u : 0u);
        Log(line);
    }
    if (!side.world && !icon) {
        // v0.76/v0.78: the minimap builds it a moment later; it is adopted
        // then (see ServiceMarkersOn). Not a failure.
        return CreateResult::Pending;
    }
    if (side.world && !icon && generated.containerRouted) {
        // The world-map icon constructor ran and gave no icon: refused.
        InterlockedIncrement(&worldRefusals[category]);
    }
    if (!generated.iconVerified || (side.world && !generated.containerRouted)) {
        return CreateResult::Failed;
    }
    // World map, ours and confirmed: remove its zoom limit straight away.
    if (side.world) {
        InterlockedIncrement(&worldSuccesses[category]);
        DisableZoomWindows(icon);
        // v0.80 observation: its hide bits right after creation.
        NoteWorldCreation(controller, icon, category, index);
    }
    return CreateResult::Created;
}

// v0.58: how many markers a map update checks. With ~170 markers, checking
// all of them every frame would mean ~170 lookups per frame; a rotating
// slice keeps each frame light, and every marker is still checked every few
// updates.
constexpr unsigned kServicePerUpdate = 32;

// Runs on the game's UI thread after one map's update: makes our markers on
// that map match what the worker wants, a slice at a time.
void ServiceMarkersOn(void* controller, MapSide& side) {
    unsigned total = 0;
    for (const MarkerCategory& kind : kCategories) {
        total += kind.shown ? kind.count : 0;
    }
    if (total == 0) {
        return;
    }
    // Copy the shared masks once per update.
    MarkerMask wanted[kCategoryCount];
    MarkerMask present[kCategoryCount];
    MarkerMask hidden[kCategoryCount]; // v0.83: which present markers we hid.
    bool createAllowed[kCategoryCount];
    bool hideAll[kCategoryCount]; // v0.83: the user turned this category off (hide, keep).
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        wanted[category] = LoadMask(markerWanted[category]);
        present[category] = LoadMask(side.present[category]);
        hidden[category] = LoadMask(side.hidden[category]);
        createAllowed[category] = InterlockedCompareExchange(&markerCreateAllowed[category], 0, 0) != 0;
        hideAll[category] = InterlockedCompareExchange(&markerHiddenByChoice[category], 0, 0) != 0;
    }
    ULONGLONG now = GetTickCount64();
    // At most one creation per update (across all categories) keeps each
    // frame light.
    bool createdThisUpdate = false;
    unsigned steps = total < kServicePerUpdate ? total : kServicePerUpdate;
    for (unsigned step = 0; step < steps; ++step) {
        // Turn the running position into (category, index).
        unsigned flat = side.cursor % total;
        side.cursor = (flat + 1) % total;
        unsigned category = 0;
        while (!kCategories[category].shown || flat >= kCategories[category].count) {
            flat -= kCategories[category].shown ? kCategories[category].count : 0;
            ++category;
        }
        unsigned index = flat;
        const MarkerCategory& kind = kCategories[category];
        NumericTag tag = {};
        tag.key = kind.keyBase + index;
        tag.kind = 0x15;
        DWORD lookupIndex = MarkerIndex(side, category, index);
        void* icon = (*side.lookup)(controller, &kind.type, &tag, &lookupIndex);
        if (!icon) {
            // Gone: removed by us, or the map was rebuilt (e.g. after a load).
            present[category].Clear(index);
            hidden[category].Clear(index);
            side.removalIssued[category][index] = 0;
            bool blocked = side.world && InterlockedCompareExchange(&worldCreateBlocked[category], 0, 0) != 0;
            if (wanted[category].Test(index) && createAllowed[category] && !blocked && !createdThisUpdate &&
                now >= side.retryAfter[category][index]) {
                createdThisUpdate = true;
                CreateResult created = CreateMarker(controller, category, index, side);
                if (created == CreateResult::Created) {
                    present[category].Set(index);
                    side.retryAfter[category][index] = 0;
                    SetSharedBit(side.failed[category], index, false);
                    InterlockedIncrement(side.creations);
                    // v0.83: created while its category is turned off: hide
                    // it at once (fresh lookup; the icon must be ours).
                    void* fresh = (*side.lookup)(controller, &kind.type, &tag, &lookupIndex);
                    if (hideAll[category] && IsCategoryMarker(fresh, category, index) && SetChoiceHidden(fresh, true)) {
                        hidden[category].Set(index);
                    }
                } else if (created == CreateResult::Pending) {
                    // Asked again only if it has not appeared within 5 s.
                    side.retryAfter[category][index] = now + 5000;
                } else {
                    side.retryAfter[category][index] = now + 5000;
                    SetSharedBit(side.failed[category], index, true);
                    InterlockedIncrement(side.failures);
                }
            }
            continue;
        }
        bool ours = IsCategoryMarker(icon, category, index);
        if (!present[category].Test(index) && !side.world) {
            // v0.76: the minimap's create function (0xe08d70) passes the
            // request on and the icon is built a moment later, so the check
            // right after creating finds nothing (v0.73-v0.75 logs). Adopt
            // it once it appears with our exact private key, type and
            // position: no other icon can have that identity.
            if (InterlockedIncrement(&minimapAdoptLogged[category]) <= 3) {
                char line[320];
                sprintf_s(line, "minimap-adopt %s marker=%s verified=%u", kind.label,
                    MarkerName(category, index), ours ? 1u : 0u);
                Log(line);
            }
            if (ours) {
                present[category].Set(index);
                side.retryAfter[category][index] = 0;
                SetSharedBit(side.failed[category], index, false);
                InterlockedIncrement(side.creations);
            }
        }
        if (!present[category].Test(index) || !ours) {
            // Not one we created and verified this session: never touch it.
            continue;
        }
        if (wanted[category].Test(index)) {
            // Wanted and present. World map: keep its zoom limit off (see
            // DisableZoomWindows; this also covers a re-initialised icon).
            if (side.world) {
                DisableZoomWindows(icon);
            }
            // v0.83: hidden or shown as the user chose (Nexus markers).
            // Compare with the icon's bit itself, not our list: the game may
            // clear it (e.g. when it sets the icon up again).
            if (HidesInsteadOfRemoving(category)) {
                bool isHidden = hidden[category].Test(index);
                ReadChoiceHidden(icon, isHidden);
                if (hideAll[category] != isHidden && SetChoiceHidden(icon, hideAll[category])) {
                    isHidden = hideAll[category];
                }
                if (isHidden) {
                    hidden[category].Set(index);
                } else {
                    hidden[category].Clear(index);
                }
            }
            continue;
        }
        // Present but no longer wanted (e.g. its Bell is now completed or its
        // chest opened).
        if (!side.removalIssued[category][index]) {
            if (!MarkerDefinitionReady(kind.type)) {
                continue; // Icon definitions changed: refuse to remove.
            }
            side.removalIssued[category][index] = GetTickCount64();
            InterlockedIncrement(side.removals);
            // Native removal: type and index by value, like the proof chest.
            (*side.remove)(controller, kind.type, &tag, lookupIndex);
            // The old icon may be freed now; inspect only a fresh lookup.
            if (!(*side.lookup)(controller, &kind.type, &tag, &lookupIndex)) {
                present[category].Clear(index);
                hidden[category].Clear(index);
                side.removalIssued[category][index] = 0;
            }
        } else if (GetTickCount64() - side.removalIssued[category][index] >= 3000) {
            // The game deferred removal and it is still there after 3 s.
            // Do not call removal again; report it and leave reload as fallback.
            SetSharedBit(side.stuck[category], index, true);
        }
    }
    // Only this thread writes this side's present and hidden masks.
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        StoreMask(side.present[category], present[category]);
        StoreMask(side.hidden[category], hidden[category]);
    }
}

// Runs on the game's map thread after each world-map update.
void ServiceMarkers(void* controller) {
    ServiceMarkersOn(controller, worldSide);
    // v0.80 observation (read-only).
    ObserveNexusLayers(controller);
}

// v0.73: runs on the game's UI thread after each minimap
// update, when the minimap's remove function passed its checks.
void ServiceMinimapMarkers(void* controller) {
    if (removeMinimapIcon && minimapLookup) {
        ServiceMarkersOn(controller, minimapSide);
    }
}

// Lists the names in `mask` for one category, e.g. "Calphade Bell, Varnia
// Bell". Long lists (chests) end with "... (+N more)" so the text always fits.
void MarkerNames(unsigned category, const MarkerMask& mask, char (&text)[640]) {
    text[0] = 0;
    unsigned skipped = 0;
    for (unsigned index = 0; index < kCategories[category].count; ++index) {
        if (!mask.Test(index)) {
            continue;
        }
        const char* name = MarkerName(category, index);
        // Leave room for ", ", the name and a closing "... (+NNN more)".
        if (strlen(text) + strlen(name) + 2 + 24 >= sizeof(text)) {
            ++skipped;
            continue;
        }
        if (text[0]) {
            strcat_s(text, ", ");
        }
        strcat_s(text, name);
    }
    if (skipped) {
        char more[24];
        sprintf_s(more, "... (+%u more)", skipped);
        strcat_s(text, more);
    }
    if (!text[0]) {
        strcpy_s(text, "none");
    }
}

// The worker's view of one category's markers.
struct CategoryState {
    bool known; // A valid result for this category has been seen at least once.
    bool unknownLogged; // "Result unknown" already logged for the current read.
    unsigned serial; // Selection serial of the last result logged.
    unsigned readSlot; // Slot of the last result logged.
    MarkerMask wanted; // Last wanted mask sent to the map thread.
    MarkerMask present; // Last present mask logged.
    MarkerMask stuck; // Last stuck mask logged.
    MarkerMask failed; // Last failed mask logged (v0.57).
    MarkerMask minimapPresent; // v0.73: last minimap mask logged.
    MarkerMask minimapFailed; // v0.73: last minimap failed mask logged.
    unsigned worldHiddenCount; // v0.83: last hidden counts logged (world map, minimap).
    unsigned minimapHiddenCount;
};

// The worker's view of all markers.
struct MarkerState {
    bool enabled; // F10 turns all markers off; F6 turns them back on.
    CategoryState categories[kCategoryCount];
    bool shownLogged[kCategoryCount]; // Choice last logged per category (v0.64).
};

// ---------------------------------------------------------------------------
// v0.64: filter panel choices (see src/pywel-atlas/MarkerFilter.h)
// ---------------------------------------------------------------------------
// The panel (render thread) writes the choices; this part's worker applies
// them in UpdateMarkers and saves them to filters.ini. The status copy below
// is refreshed by the worker for the panel to show.
static_assert(kPywelMarkerCategories == kCategoryCount, "The panel lists every marker category");
// Names shown in the panel, in category order.
constexpr const char* kPanelNames[kCategoryCount] = {"Bells", "Greymane Shrines", "Treasure chests", "Abyss chests",
    "Abyss Nexus"};
volatile LONG categoryShown[kCategoryCount] = {1, 1, 1, 1, 1}; // The user's choice (1 = show).
volatile LONG markersEnabled = 1; // Copy of MarkerState::enabled for the panel.
volatile LONG filtersDirty = 0; // A choice or the panel geometry changed; save soon.
SRWLOCK statusLock = SRWLOCK_INIT; // Guards categoryStatus and panelGeometry.
PywelMarkerCategoryStatus categoryStatus[kCategoryCount] = {};
float panelGeometry[4] = {}; // x, y, width, height as screen fractions.
bool panelGeometryKnown = false;

// Full path of %LOCALAPPDATA%\PywelAtlas\filters.ini (false if unavailable).
bool FiltersPath(wchar_t (&path)[MAX_PATH]) {
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return false;
    }
    return wcscat_s(path, L"\\PywelAtlas\\filters.ini") == 0;
}

// Reads filters.ini at start-up: one "<category>=0/1" line per category (by
// its log label, e.g. "Chest=0") and "panel=x,y,width,height". Unknown or
// malformed lines are ignored, so a damaged file only loses those lines.
void LoadFilters() {
    wchar_t path[MAX_PATH] = {};
    FILE* file = nullptr;
    if (!FiltersPath(path) || _wfopen_s(&file, path, L"r") != 0 || !file) {
        return; // No file yet: everything is shown.
    }
    char line[256];
    while (fgets(line, sizeof(line), file)) {
        char* equals = strchr(line, '=');
        if (line[0] == '#' || !equals) {
            continue;
        }
        *equals = 0;
        const char* value = equals + 1;
        for (unsigned category = 0; category < kCategoryCount; ++category) {
            if (strcmp(line, kCategories[category].label) == 0 && (value[0] == '0' || value[0] == '1')) {
                InterlockedExchange(&categoryShown[category], value[0] == '1' ? 1 : 0);
            }
        }
        float geometry[4] = {};
        if (strcmp(line, "panel") == 0 &&
            sscanf_s(value, "%f,%f,%f,%f", &geometry[0], &geometry[1], &geometry[2], &geometry[3]) == 4 &&
            geometry[0] >= 0.0f && geometry[0] < 1.0f && geometry[1] >= 0.0f && geometry[1] < 1.0f &&
            geometry[2] > 0.0f && geometry[2] <= 1.0f && geometry[3] > 0.0f && geometry[3] <= 1.0f) {
            AcquireSRWLockExclusive(&statusLock);
            memcpy(panelGeometry, geometry, sizeof(geometry));
            panelGeometryKnown = true;
            ReleaseSRWLockExclusive(&statusLock);
        }
    }
    fclose(file);
}

// Writes filters.ini (worker thread only), first to a temporary file that
// then replaces the old one, so a crash mid-write never leaves half a file.
// False if anything failed; the old file is then kept.
bool SaveFilters() {
    wchar_t path[MAX_PATH] = {};
    wchar_t temporary[MAX_PATH + 8] = {};
    FILE* file = nullptr;
    if (!FiltersPath(path) || swprintf_s(temporary, L"%ls.tmp", path) < 0 ||
        _wfopen_s(&file, temporary, L"w") != 0 || !file) {
        return false;
    }
    fputs("# Pywel Atlas filter panel choices (written automatically; 1 = shown)\n", file);
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        fprintf(file, "%s=%ld\n", kCategories[category].label,
            InterlockedCompareExchange(&categoryShown[category], 0, 0));
    }
    AcquireSRWLockShared(&statusLock);
    bool known = panelGeometryKnown;
    float geometry[4];
    memcpy(geometry, panelGeometry, sizeof(geometry));
    ReleaseSRWLockShared(&statusLock);
    if (known) {
        fprintf(file, "panel=%.4f,%.4f,%.4f,%.4f\n", geometry[0], geometry[1], geometry[2], geometry[3]);
    }
    // Replace the old file only with a complete copy (a full disk would
    // otherwise leave a cut-off file).
    bool written = !ferror(file);
    if (fclose(file) != 0 || !written) {
        DeleteFileW(temporary);
        return false;
    }
    return MoveFileExW(temporary, path, MOVEFILE_REPLACE_EXISTING) != 0;
}


// What the detected save says is done for one category, and whether that is
// known: Bells and chests come from the Bell pass, shrines from their own.
// `unknown` (v0.68) lists single spots whose state is not known (strongboxes
// whose field record could not be decided): they get no marker either.
MarkerMask DoneMask(unsigned category, const LoadedSaveBell& loaded, bool saveValid, bool& valid,
    MarkerMask& unknown) {
    MarkerMask done = {};
    unknown = {};
    valid = saveValid;
    if (category == kBellCategory) {
        done.words[0] = static_cast<LONG>(loaded.bell.completedMask);
    } else if (category == kShrineCategory) {
        valid = saveValid && loaded.bell.shrinesValid;
        done.words[0] = static_cast<LONG>(loaded.bell.shrineFoundMask);
    } else if (category == kNexusCategory) {
        // v0.79: Abyss Nexuses: done = activated (field pass); undecided ones
        // are unknown and get no marker.
        static_assert(_countof(loaded.bell.nexusActivatedMask) == kMaskWords, "Nexus mask size must match");
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.nexusActivatedMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.nexusUnknownMask[word]);
        }
    } else if (category == kAbyssChestCategory) {
        // v0.69: Abyss chests come from the Bell pass, like the other chests.
        static_assert(_countof(loaded.bell.abyssChestOpenedMask) == kMaskWords, "Chest mask size must match");
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.abyssChestOpenedMask[word]);
        }
    } else {
        static_assert(_countof(loaded.bell.chestOpenedMask) == kMaskWords, "Chest mask size must match");
        static_assert(_countof(loaded.bell.chestUnknownMask) == kMaskWords, "Chest mask size must match");
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.chestOpenedMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.chestUnknownMask[word]);
        }
    }
    return done;
}

// Called every worker loop: works out which markers should exist from the
// detected save, tells the map thread, and logs changes.
void UpdateMarkers(MarkerState& state) {
    LoadedSaveBell loaded = {};
    bool saveValid = PywelGetLoadedSaveBell(loaded);
    char names[640];
    char hidden[640];
    char line[1600];
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        CategoryState& current = state.categories[category];
        const MarkerCategory& kind = kCategories[category];
        if (!kind.shown) {
            continue; // Paused category: never wanted, never created.
        }
        // v0.64: the filter panel's choice for this category.
        bool chosen = InterlockedCompareExchange(&categoryShown[category], 0, 0) != 0;
        // v0.83: Nexus markers are hidden, not removed, when turned off.
        bool hideByChoice = HidesInsteadOfRemoving(category) && (!state.enabled || !chosen);
        if (chosen != state.shownLogged[category]) {
            sprintf_s(line, "%s markers turned %s (filter panel)%s", kind.label, chosen ? "on" : "off",
                chosen ? "; they follow the detected save"
                       : (hideByChoice ? "; all are being hidden (kept, game hide reason 23)" : "; all are being removed"));
            Log(line);
            state.shownLogged[category] = chosen;
        }
        bool valid = false;
        MarkerMask unknown = {};
        MarkerMask done = DoneMask(category, loaded, saveValid, valid, unknown);
        MarkerMask all = {};
        for (unsigned index = 0; index < kind.count; ++index) {
            all.Set(index);
        }
        MarkerMask wanted = current.wanted;
        if ((!state.enabled || !chosen) && !hideByChoice) {
            wanted = {};
        } else if (valid) {
            // Show every spot the save does NOT explicitly mark as done,
            // except spots whose state is unknown (v0.68).
            for (unsigned word = 0; word < kMaskWords; ++word) {
                wanted.words[word] = all.words[word] & ~done.words[word] & ~unknown.words[word];
            }
        }
        MarkerMask hiddenMask = {};
        MarkerMask unknownMask = {};
        for (unsigned word = 0; word < kMaskWords; ++word) {
            hiddenMask.words[word] = all.words[word] & done.words[word];
            unknownMask.words[word] = all.words[word] & unknown.words[word];
        }
        // While nothing is known, keep the current markers but create no new ones.
        // v0.83: a hidden category still creates (and then hides) missing markers.
        InterlockedExchange(&markerCreateAllowed[category], ((state.enabled && chosen) || hideByChoice) && valid ? 1 : 0);
        InterlockedExchange(&markerHiddenByChoice[category], hideByChoice ? 1 : 0);
        StoreMask(markerWanted[category], wanted);
        bool changedRead = loaded.serial != current.serial || loaded.readSlot != current.readSlot;
        if (valid && (!current.known || changedRead || !wanted.Same(current.wanted))) {
            MarkerNames(category, wanted, names);
            MarkerNames(category, hiddenMask, hidden);
            sprintf_s(line, "Detected save serial=%u loadedSlot=%u readSlot=%u %ss: show %u [%s]; done (hidden) %u [%s]",
                loaded.serial, loaded.loadedSlot, loaded.readSlot, kind.label, wanted.Count(), names,
                hiddenMask.Count(), hidden);
            Log(line);
            if (category == kChestCategory) {
                // v0.68: the field-rule boxes (puzzle strongboxes and house
                // chests) on their own line; they come last in the chest list,
                // so the line above often cuts them off.
                MarkerMask fieldShown = {};
                MarkerMask fieldDone = {};
                for (unsigned index = 0; index < kind.count; ++index) {
                    if (kChestLinks[index].rule != kChestRuleField) {
                        continue;
                    }
                    if (wanted.Test(index)) {
                        fieldShown.Set(index);
                    }
                    if (hiddenMask.Test(index)) {
                        fieldDone.Set(index);
                    }
                }
                MarkerNames(category, fieldShown, names);
                MarkerNames(category, fieldDone, hidden);
                sprintf_s(line, "Detected save serial=%u readSlot=%u strongboxes and house chests: show %u [%s]; opened (hidden) %u [%s]",
                    loaded.serial, loaded.readSlot, fieldShown.Count(), names, fieldDone.Count(), hidden);
                Log(line);
            }
            if (unknownMask.Count()) {
                // v0.68: undecided strongboxes, hidden but not counted as done.
                MarkerNames(category, unknownMask, names);
                sprintf_s(line, "Detected save serial=%u readSlot=%u %ss: unknown (hidden, not counted as done) %u [%s]; field pass %s (%s)",
                    loaded.serial, loaded.readSlot, kind.label, unknownMask.Count(), names,
                    loaded.bell.chestFieldValid ? "ok" : "failed",
                    loaded.bell.chestFieldError[0] ? loaded.bell.chestFieldError : "unexpected record");
                Log(line);
            }
            current.known = true;
            current.unknownLogged = false;
            current.serial = loaded.serial;
            current.readSlot = loaded.readSlot;
        } else if (!valid && saveValid && (changedRead || !current.unknownLogged)) {
            // The save read was accepted but this category's pass failed.
            sprintf_s(line, "Detected save serial=%u readSlot=%u: %s result unknown (%s); keeping current markers, creating none.",
                loaded.serial, loaded.readSlot, kind.label,
                loaded.bell.shrineError[0] ? loaded.bell.shrineError : "no reason given");
            Log(line);
            current.unknownLogged = true;
            current.serial = loaded.serial;
            current.readSlot = loaded.readSlot;
        } else if (!state.enabled && !wanted.Same(current.wanted)) {
            sprintf_s(line, "%s markers turned off (F10); all are being removed.", kind.label);
            Log(line);
        }
        current.wanted = wanted;
        MarkerMask present = LoadMask(markerPresent[category]);
        // v0.64: refresh the copy the filter panel shows.
        AcquireSRWLockExclusive(&statusLock);
        // v0.78: the world map keeps refusing this category's icon and never
        // accepted one (the Greymane Shrine icon without the Shrine Icons
        // file mod): stop world-map tries for this session and tell the panel.
        bool needsAddon = category == kShrineCategory &&
            InterlockedCompareExchange(&worldSuccesses[category], 0, 0) == 0 &&
            InterlockedCompareExchange(&worldRefusals[category], 0, 0) >= kShrineAddonRefusals;
        if (needsAddon && !InterlockedExchange(&worldCreateBlocked[category], 1)) {
            sprintf_s(line, "%s markers: the game refused the first %ld on the world map and accepted none, so the Pywel Atlas Shrine Icons file mod is probably not installed; no more world-map tries this session (minimap markers continue).",
                kind.label, InterlockedCompareExchange(&worldRefusals[category], 0, 0));
            Log(line);
        }
        PywelMarkerCategoryStatus& status = categoryStatus[category];
        status.needsAddon = needsAddon;
        status.saveKnown = valid || current.known;
        if (valid) {
            status.done = hiddenMask.Count();
        }
        // v0.83: markers kept but hidden do not count as on the map.
        unsigned worldHiddenNow = LoadMask(worldHidden[category]).Count();
        status.onMap = present.Count() - (worldHiddenNow < present.Count() ? worldHiddenNow : present.Count());
        ReleaseSRWLockExclusive(&statusLock);
        unsigned minimapHiddenNow = LoadMask(minimapHidden[category]).Count();
        if (worldHiddenNow != current.worldHiddenCount || minimapHiddenNow != current.minimapHiddenCount) {
            sprintf_s(line, "%s markers hidden by choice now: %u on the world map, %u on the minimap", kind.label,
                worldHiddenNow, minimapHiddenNow);
            Log(line);
            current.worldHiddenCount = worldHiddenNow;
            current.minimapHiddenCount = minimapHiddenNow;
        }
        if (!present.Same(current.present)) {
            MarkerNames(category, present, names);
            sprintf_s(line, "%s markers on the map now: %u [%s] (all categories: creations=%ld removals=%ld failures=%ld zoomLimitOff=%ld zoomLimitRefused=%ld)",
                kind.label, present.Count(), names, InterlockedCompareExchange(&markerCreations, 0, 0),
                InterlockedCompareExchange(&markerRemovals, 0, 0),
                InterlockedCompareExchange(&markerFailures, 0, 0),
                InterlockedCompareExchange(&markerZoomWindowWrites, 0, 0),
                InterlockedCompareExchange(&markerZoomWindowFailures, 0, 0));
            Log(line);
            current.present = present;
        }
        MarkerMask stuck = LoadMask(markerStuck[category]);
        if (!stuck.Same(current.stuck)) {
            MarkerNames(category, stuck, names);
            sprintf_s(line, "%s markers still present 3 s after removal (reload clears them): %u [%s]",
                kind.label, stuck.Count(), names);
            Log(line);
            current.stuck = stuck;
        }
        MarkerMask failed = LoadMask(markerFailed[category]);
        if (!failed.Same(current.failed)) {
            MarkerNames(category, failed, names);
            sprintf_s(line, "%s markers whose last creation failed (retried every 5 s): %u [%s] (failures=%ld)",
                kind.label, failed.Count(), names, InterlockedCompareExchange(&markerFailures, 0, 0));
            Log(line);
            current.failed = failed;
        }
        if (kMinimapMarkers) {
            // v0.73: the same markers on the minimap.
            MarkerMask minimapNow = LoadMask(minimapPresent[category]);
            if (!minimapNow.Same(current.minimapPresent)) {
                sprintf_s(line, "%s markers on the minimap now: %u (minimap creations=%ld removals=%ld failures=%ld)",
                    kind.label, minimapNow.Count(), InterlockedCompareExchange(&minimapCreations, 0, 0),
                    InterlockedCompareExchange(&minimapRemovals, 0, 0),
                    InterlockedCompareExchange(&minimapFailures, 0, 0));
                Log(line);
                current.minimapPresent = minimapNow;
            }
            MarkerMask minimapFailedNow = LoadMask(minimapFailed[category]);
            if (!minimapFailedNow.Same(current.minimapFailed)) {
                MarkerNames(category, minimapFailedNow, names);
                sprintf_s(line, "%s minimap markers whose last creation failed (retried every 5 s): %u [%s]",
                    kind.label, minimapFailedNow.Count(), names);
                Log(line);
                current.minimapFailed = minimapFailedNow;
            }
        }
    }
}

// v0.80 observation (worker): logs once the layer settings of the icon types
// our markers use, and (at most once a second, when they change) how many
// world-map creations started hidden. See "v0.80 observation" above.
void LogLayerObservation() {
    static bool definitionsLogged = false;
    static LONG lastTotals[kCategoryCount][3] = {};
    static ULONGLONG nextSummary = 0;
    char line[640];

    // 1 = personal pin (our layer routing copies its settings), 226 = chest,
    // 234 = Abyss Nexus, 334 = the game's fog Nexus icon, 360 = Bell.
    if (!definitionsLogged) {
        static constexpr WORD kTypes[] = {1, 226, 234, 334, 360};
        float threshold = 0;
        bool all = Read(reinterpret_cast<const void*>(imageBase + kParentAltitudeThresholdRva), &threshold,
            sizeof(threshold));
        char types[512] = {};
        for (WORD type : kTypes) {
            uintptr_t record = IconRecord(type);
            BYTE layerSelector = 0;
            BYTE flagB5 = 0;
            BYTE followsHeight = 0;
            DWORD group = 0;
            if (!record || !Read(reinterpret_cast<const void*>(record + 0x2a), &layerSelector, sizeof(layerSelector)) ||
                !Read(reinterpret_cast<const void*>(record + 0xb5), &flagB5, sizeof(flagB5)) ||
                !Read(reinterpret_cast<const void*>(record + 0xb7), &followsHeight, sizeof(followsHeight)) ||
                !Read(reinterpret_cast<const void*>(record + 0x2c), &group, sizeof(group))) {
                // Only the Nexus type is required; the others are for comparison.
                if (type == 234) {
                    all = false;
                    break;
                }
                char missing[48];
                sprintf_s(missing, " type%u: not loaded;", type);
                strcat_s(types, missing);
                continue;
            }
            char part[96];
            sprintf_s(part, " type%u: layer=%u followsHeight=%u b5=%u group=0x%lx;", type, layerSelector, followsHeight,
                flagB5, group);
            strcat_s(types, part);
        }
        if (all) {
            sprintf_s(line, "layer-watch: icon type layer settings (+0x2a layer, +0xb7 follows height, +0xb5, +0x2c group):%s Abyss height limit=%.1f",
                types, threshold);
            Log(line);
            definitionsLogged = true;
        }
    }

    // Creation counts by hide bits, per category.
    if (GetTickCount64() < nextSummary) {
        return;
    }
    bool changed = false;
    char parts[480] = {};
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        LONG totals[3] = {InterlockedCompareExchange(&createdClear[category], 0, 0),
            InterlockedCompareExchange(&createdHidden[category], 0, 0),
            InterlockedCompareExchange(&createdLayerHidden[category], 0, 0)};
        if (memcmp(totals, lastTotals[category], sizeof(totals)) != 0) {
            changed = true;
            memcpy(lastTotals[category], totals, sizeof(totals));
        }
        if (totals[0] || totals[1]) {
            char part[96];
            sprintf_s(part, " %s clear=%ld hidden=%ld (bit 12: %ld);", kCategories[category].label, totals[0],
                totals[1], totals[2]);
            strcat_s(parts, part);
        }
    }
    if (changed) {
        sprintf_s(line, "layer-watch: world-map creations by hide bits right after creation:%s", parts);
        Log(line);
        nextSummary = GetTickCount64() + 1000;
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
// template type id, template name and (v0.79) icon group (0xffffffff for the
// gimmick icons, 0x20 for the Abyss Nexus icon).
bool IconDefinitionReady(WORD type, WORD expectedTemplate, const char* expectedName, DWORD expectedGroup) {
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
        category == expectedGroup &&
        Read(reinterpret_cast<const void*>(templates.cache + secondary * sizeof(uintptr_t)),
            &templateRecord, sizeof(templateRecord)) &&
        ReadTemplateName(reinterpret_cast<const void*>(templateRecord), name) &&
        strcmp(name, expectedName) == 0;
}

// True only if icon type 226 is already loaded and matches the verified chest:
// template type 28852, category 0xffffffff, template "MapIcon_Gimmick_LevelTreasureBox".
bool ChestDefinitionReady() {
    return IconDefinitionReady(chestType, 28852, "MapIcon_Gimmick_LevelTreasureBox", 0xffffffff);
}

// True only if `type` is one this mod creates and its definition is loaded
// and matches: the chest (226), or in the combined build a category's native
// icon (Bell 360, Greymane Shrine 186, Abyss Nexus 234). The game loads a definition only once
// it needs it, and this never asks it to; until then creation is refused.
bool MarkerDefinitionReady(WORD type) {
#ifdef PYWEL_ATLAS_COMBINED
    for (const MarkerCategory& kind : kCategories) {
        if (type == kind.type) {
            return IconDefinitionReady(kind.type, kind.templateType, kind.templateName, kind.iconGroup);
        }
    }
#endif
    return type == chestType && ChestDefinitionReady();
}

// The icon type's definition record (from the game's icon table), or 0.
uintptr_t IconRecord(WORD type) {
    TableView icons = {};
    uintptr_t record = 0;
    if (!ReadTable(kIconTablePointerRva, 4096, icons) || type >= icons.count ||
        !Read(reinterpret_cast<const void*>(icons.cache + type * sizeof(uintptr_t)), &record, sizeof(record))) {
        return 0;
    }
    return record;
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
// selected type ids (1, 40, 41, 186, 226-229, 360), and (v0.75) every type
// with a world-map look.
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
    unsigned withLook = 0; // v0.75: types with a world-map look (see below).
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
        // 186 = Greymane Shrine icon (v0.56), 360 = Bell icon, 40/41 = Abyss
        // chest closed/opened (v0.69).
        if (index == 1 || index == 40 || index == 41 || index == 186 || (index >= 226 && index <= 229) ||
            index == 360) {
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
        // v0.75: every loaded icon type with a value at +0x30. The icons our
        // markers can use (chest 226 0x16fc, Bell 360 0x16f6) have one; the
        // refused shrine (186) and Abyss chest (40) icons have 0xffff, so
        // this is probably the world-map look. The list gives candidate
        // icons for the shrine pins.
        WORD look = 0xffff;
        if (Read(reinterpret_cast<const void*>(record + 0x30), &look, sizeof(look)) && look != 0xffff) {
            ++withLook;
            char lookLine[256];
            sprintf_s(lookLine, "worldlook type=%lu look=0x%x category=0x%lx template=%s",
                index, static_cast<unsigned>(look), category, name);
            Log(lookLine);
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
    sprintf_s(line, "catalogue end types=%lu cached=%u named=%u relevant=%u worldLook=%u headersStable=%u",
        icons.count, loaded, named, relevant, withLook, stable ? 1u : 0u);
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
    LONG markers[kCategoryCount]; // Markers inspected (bit per marker, per category)
    // Per marker of each category (v0.58: only the first 32 of each, to
    // keep this record small on the game's thread):
    struct {
        BYTE windowResult; // icon+0x2b9
        BYTE onScreen; // icon+0x1eb
        DWORD elementFlags; // (icon+8)->+0xb4; bit 8 = hidden
        BYTE windowEnabled; // icon+0x208 (main zoom window enabled)
        DWORD actorId; // icon+0x1c0 (actor the icon follows; 0 = none)
    } marker[kCategoryCount][32];
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
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        const MarkerCategory& kind = kCategories[category];
        MarkerMask present = LoadMask(markerPresent[category]);
        for (unsigned index = 0; index < kind.count && index < 32; ++index) {
            if (!present.Test(index)) {
                continue;
            }
            NumericTag tag = {};
            tag.key = kind.keyBase + index;
            tag.kind = 0x15;
            DWORD lookupIndex = 0;
            void* icon = worldLookup(controller, &kind.type, &tag, &lookupIndex);
            if (!IsCategoryMarker(icon, category, index)) {
                continue;
            }
            auto* iconBytes = static_cast<const BYTE*>(icon);
            auto& marker = record.marker[category][index];
            uintptr_t element = 0;
            Read(iconBytes + 0x2b9, &marker.windowResult, 1);
            // v0.54: the main zoom window's enabled byte (0 = our limit is
            // off), and the actor id the native icon type may follow (0 = none).
            Read(iconBytes + 0x1f8 + 0x10, &marker.windowEnabled, 1);
            Read(iconBytes + 0x1c0, &marker.actorId, sizeof(DWORD));
            Read(iconBytes + 0x1eb, &marker.onScreen, 1);
            if (Read(iconBytes + 8, &element, sizeof(element)) && element) {
                Read(reinterpret_cast<const void*>(element + 0xb4), &marker.elementFlags, sizeof(DWORD));
            }
            record.markers[category] |= static_cast<LONG>(1UL << index);
        }
    }
    if (!TryAcquireSRWLockExclusive(&zoomLock)) {
        return;
    }
    if (zoomFrameCount < _countof(zoomFrames)) {
        zoomFrames[zoomFrameCount++] = record;
    }
    ReleaseSRWLockExclusive(&zoomLock);
}

// --- 2b. Why a world-icon creation is refused (v0.57) --------------------
// The world icon constructor (0xdb3bd0, hooked as RouteWorldContainer) builds
// a UI element from the template-name argument. Static reading: if that
// element is not ready, it either parks it on the controller's waiting list
// (+0x570 array, +0x578 count, only when +0xaf7 is set) or throws it away,
// and returns 0 without setting the icon up. v0.56 saw exactly that for our
// shrine marker. These records compare our attempts with the game's own
// shrine and Bell creations. Copies only; nothing is changed.

SRWLOCK createLock = SRWLOCK_INIT;
WorldCreateRecord createRecords[64] = {}; // Waiting to be logged by the worker.
unsigned createRecordCount = 0;
volatile LONG createDropped = 0;
// How many records were taken per source, to keep the log short:
volatile LONG createOursLogged[kCategoryCount][kMaxCategoryMarkers] = {}; // First 3 per marker.
volatile LONG createGameShrineLogged = 0; // Game's own type 186: first 32.
volatile LONG createGameBellLogged = 0; // Game's own type 360: first 4.
volatile LONG createGameAbyssChestLogged = 0; // v0.71: game's own type 40/41: first 32.

// Copy a short text from game memory into `text`, 16 bytes at a time, so an
// unreadable page after the text cannot fail the whole copy. Stops at the
// first zero byte; anything unprintable becomes '?'. False if nothing readable.
bool ReadShortText(const char* source, char (&text)[96]) {
    text[0] = 0;
    if (!source) {
        return false;
    }
    size_t length = 0;
    while (length + 16 < sizeof(text)) {
        char chunk[16] = {};
        if (!Read(source + length, chunk, sizeof(chunk))) {
            break;
        }
        for (char value : chunk) {
            if (value == 0) {
                text[length] = 0;
                return true;
            }
            text[length++] = (value >= 0x20 && value < 0x7f) ? value : '?';
        }
    }
    text[length] = 0;
    return length > 0;
}

// Called just before the original constructor runs. Decides whether this
// creation is watched (ours, or the game's own shrine/Bell/Abyss chest within budget) and
// copies its arguments. Returns false (watch nothing) for everything else.
bool BeginWorldCreateProbe(void* controller, const WORD* type, const void* tag, uintptr_t slot7,
    float scalar, uintptr_t slot9, const void* appearance, const char* templateName,
    const void* optional12, const void* optional13, BYTE finalFlag, bool ours,
    WorldCreateRecord& record) {
    NumericTag actualTag = {};
    WORD actualType = 0;
    uintptr_t table = 0;
    if (!Read(controller, &table, sizeof(table)) || table != imageBase + 0x566ff50 ||
        !Read(type, &actualType, sizeof(actualType)) || !Read(tag, &actualTag, sizeof(actualTag))) {
        return false;
    }
    unsigned category = 0;
    unsigned index = 0;
    bool watched = false;
    if (ours && FindMarker(actualTag.key, category, index)) {
        // First 3 tries per marker; only the first per chest (190 chests, 74 Abyss chests).
        watched = InterlockedIncrement(&createOursLogged[category][index]) <= (category == kChestCategory || category == kAbyssChestCategory || category == kNexusCategory ? 1 : 3);
    } else if (!ours && actualType == kCategories[kShrineCategory].type) {
        watched = InterlockedIncrement(&createGameShrineLogged) <= 32;
    } else if (!ours && actualType == kCategories[kBellCategory].type) {
        watched = InterlockedIncrement(&createGameBellLogged) <= 4;
    } else if (!ours && (actualType == 40 || actualType == 41)) {
        // v0.71: the game's own Abyss chest icons (closed 40, opened 41), to
        // compare with our refused type-40 attempts in v0.69.
        watched = InterlockedIncrement(&createGameAbyssChestLogged) <= 32;
    }
    if (!watched) {
        return false;
    }
    auto* bytes = static_cast<const BYTE*>(controller);
    record.type = actualType;
    record.key = actualTag.key;
    record.kind = actualTag.kind;
    record.ours = ours;
    record.templateRead = ReadShortText(templateName, record.templateName);
    record.appearancePresent = appearance != nullptr;
    record.slot7 = slot7;
    record.scalar = scalar;
    record.slot9 = slot9;
    record.optional12Present = optional12 != nullptr;
    record.optional13Present = optional13 != nullptr;
    record.finalFlag = finalFlag;
    Read(bytes + 0xaf7, &record.waitingFlag, sizeof(record.waitingFlag));
    Read(bytes + 0x578, &record.waitingBefore, sizeof(record.waitingBefore));
    return true;
}

// Called right after the original constructor returned: notes whether it made
// an icon and the waiting-list count, then queues the record for the log.
void FinishWorldCreateProbe(void* controller, uintptr_t result, WorldCreateRecord& record) {
    record.created = result != 0;
    Read(static_cast<const BYTE*>(controller) + 0x578, &record.waitingAfter, sizeof(record.waitingAfter));
    // Never wait on the game's thread: if busy or full, count it as dropped.
    if (!TryAcquireSRWLockExclusive(&createLock)) {
        InterlockedIncrement(&createDropped);
        return;
    }
    if (createRecordCount < _countof(createRecords)) {
        createRecords[createRecordCount++] = record;
    } else {
        InterlockedIncrement(&createDropped);
    }
    ReleaseSRWLockExclusive(&createLock);
}

// Worker: log the queued creation records.
void LogWorldCreates() {
    WorldCreateRecord batch[_countof(createRecords)];
    AcquireSRWLockExclusive(&createLock);
    unsigned count = createRecordCount;
    memcpy(batch, createRecords, count * sizeof(WorldCreateRecord));
    createRecordCount = 0;
    ReleaseSRWLockExclusive(&createLock);
    for (unsigned item = 0; item < count; ++item) {
        const WorldCreateRecord& record = batch[item];
        unsigned category = 0;
        unsigned index = 0;
        const char* name = record.ours && FindMarker(record.key, category, index)
            ? MarkerName(category, index) : "-";
        char line[512];
        sprintf_s(line, "world-create %s type=%u tag=(0x%llx,0x%x) marker=%s created=%u template=%s "
            "appearance=%u slot7=0x%llx scalar=%g slot9=0x%llx opt12=%u opt13=%u finalFlag=%u "
            "waitingFlag=%u waiting=%lu->%lu dropped=%ld",
            record.ours ? "ours" : "game", static_cast<unsigned>(record.type),
            static_cast<unsigned long long>(record.key), static_cast<unsigned>(record.kind), name,
            record.created ? 1u : 0u, record.templateRead ? record.templateName : "(unreadable)",
            record.appearancePresent ? 1u : 0u, static_cast<unsigned long long>(record.slot7),
            record.scalar, static_cast<unsigned long long>(record.slot9),
            record.optional12Present ? 1u : 0u, record.optional13Present ? 1u : 0u,
            record.finalFlag, record.waitingFlag, record.waitingBefore, record.waitingAfter,
            InterlockedCompareExchange(&createDropped, 0, 0));
        Log(line);
    }
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
// position it just stored. Watch only (in the test build it also gives the
// test teleporter its turn; see src/pywel-atlas/TestTeleporter.cpp).
uintptr_t ObserveMinimapUpdate(void* controller, float elapsed) {
    uintptr_t result = originalMinimapUpdate(controller, elapsed);
    uintptr_t table = 0;
    float position[3] = {};
    BYTE abyss = 0;
    bool minimap = Read(controller, &table, sizeof(table)) && table == imageBase + 0x5674e00;
    if (minimap &&
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
    // v0.73: keep our markers on the minimap too, right after
    // its own update (like the world map, see ObserveWorldMapUpdate).
    if (minimap && kMinimapMarkers) {
        ServiceMinimapMarkers(controller);
    }
#ifdef PYWEL_ATLAS_TELEPORT
    // Test build only: the game's own teleports run on this thread, after the
    // minimap update. The teleporter checks its own request state.
    if (minimap) {
        PywelTeleporterService();
    }
#endif
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

// v0.73: the minimap's own "remove icon" function (minimap controller vtable
// slot 0x558; the world map's is 0xdb8a60 in the same slot). Arguments as the
// world one: controller, icon type, tag, index. Its first 24 bytes in the
// supported build (read from the installed executable with pefile, 2026-10-22).
constexpr uintptr_t kMinimapRemoveRva = 0xe09fc0;
constexpr BYTE kMinimapRemoveGuard[24] = {
    0x48, 0x89, 0x5c, 0x24, 0x08, 0x48, 0x89, 0x74,
    0x24, 0x18, 0x44, 0x89, 0x4c, 0x24, 0x20, 0x66,
    0x89, 0x54, 0x24, 0x10, 0x57, 0x41, 0x54, 0x41,
};

// v0.73: switches minimap markers on only if the remove
// function's guard bytes match and the minimap controller's vtable really
// points at the studied find (0x548) and remove (0x558) functions.
void PrepareMinimapMarkers(BYTE* base) {
    if (!kMinimapMarkers) {
        return;
    }
    uintptr_t lookupSlot = 0;
    uintptr_t removeSlot = 0;
    bool guard = memcmp(base + kMinimapRemoveRva, kMinimapRemoveGuard, sizeof(kMinimapRemoveGuard)) == 0;
    bool slots = Read(base + 0x5674e00 + 0x548, &lookupSlot, sizeof(lookupSlot)) &&
        Read(base + 0x5674e00 + 0x558, &removeSlot, sizeof(removeSlot)) &&
        lookupSlot == reinterpret_cast<uintptr_t>(base + kInspectSites[4].rva) &&
        removeSlot == reinterpret_cast<uintptr_t>(base + kMinimapRemoveRva);
    if (guard && slots) {
        removeMinimapIcon = reinterpret_cast<RemoveWorldIcon>(base + kMinimapRemoveRva);
    }
    char line[200];
    sprintf_s(line, "Minimap markers: %s (remove guard %s, vtable slots %s)",
        removeMinimapIcon ? "on" : "off", guard ? "matched" : "changed", slots ? "matched" : "changed");
    Log(line);
}

// Installs the minimap watch hook, after checking its guard bytes. A failure
// only disables position logging; the markers keep working.
void InstallMinimapHook(BYTE* base) {
    PrepareMinimapMarkers(base);
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
        for (unsigned category = 0; category < kCategoryCount; ++category) {
            for (unsigned item = 0; item < kCategories[category].count && item < 32; ++item) {
                if (!(frame.markers[category] & static_cast<LONG>(1UL << item))) {
                    continue;
                }
                const auto& marker = frame.marker[category][item];
                sprintf_s(line, "  zoom-marker %s type=%u windowResult=0x%02x onScreen=%u elementFlags=0x%lx hidden=%u zoomLimitEnabled=%u actorId=%lu",
                    MarkerName(category, item), static_cast<unsigned>(kCategories[category].type),
                    marker.windowResult, marker.onScreen, marker.elementFlags,
                    (marker.elementFlags & 8) ? 1u : 0u, marker.windowEnabled, marker.actorId);
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
    for (unsigned bell = 0; bell < _countof(kBellLinks); ++bell) {
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
    VisibilityEvent visibilityBatch[_countof(visibilityPending)];
    // Static: too large for the stack next to the batches above (worker only).
    static char lineBatch[_countof(observationLines)][_countof(observationLines[0])];
    AcquireSRWLockExclusive(&sampleLock);
    unsigned count = pendingCount;
    memcpy(batch, pending, count * sizeof(Sample));
    pendingCount = 0;
    unsigned visibilityCount = visibilityPendingCount;
    memcpy(visibilityBatch, visibilityPending, visibilityCount * sizeof(VisibilityEvent));
    visibilityPendingCount = 0;
    unsigned lineCount = observationLineCount;
    memcpy(lineBatch, observationLines, lineCount * sizeof(observationLines[0]));
    observationLineCount = 0;
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
        char line[320];
        sprintf_s(line, "private-chest visibility caller=0x%llx bit=%u enabled=%u "
            "before=%02x%02x%02x afterKnown=%u after=%02x%02x%02x",
            static_cast<unsigned long long>(event.caller), event.bit, event.enabled,
            event.before[0], event.before[1], event.before[2], event.afterRead ? 1u : 0u,
            event.after[0], event.after[1], event.after[2]);
#ifdef PYWEL_ATLAS_COMBINED
        if (event.named) {
            // v0.80: which Nexus marker it was.
            strcat_s(line, " marker=");
            strcat_s(line, MarkerName(kNexusCategory, event.markerIndex));
        }
#endif
        Log(line);
    }
    // v0.80: lines written on the game's map thread.
    for (unsigned index = 0; index < lineCount; ++index) {
        Log(lineBatch[index]);
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
    Log("Pywel Atlas combined v0.83 map markers (v0.83: Abyss Nexus markers turned off in the panel or with F10 are hidden with the game's own hide-reason function (bit 23) instead of removed, and shown again when turned on; read-only observation: layer settings of our icon types, hide bits of our world-map markers right after creation, Abyss Nexus hide-bit changes by name, 4 watched Nexus, 2 chest and 2 Abyss chest markers per round at 3 s / 10 s and on layer changes, with picture objects, container-list check and raw copies; markers on the world map and the minimap; surface Abyss Nexus markers (game icon type 234) until activated; minimap markers created with their own number and adopted once the game has built them; Greymane Shrine markers on, world map needs the Shrine Icons file mod; F8 lists icon types with a world-map look; game type 186/40/41 creations logged, our own markers left out of the sample list) - one native Bell icon (type 360) per not-completed Bell, one chest icon (type 226) per not-opened chest of the game's dedicated chest levels, caves/dungeons, puzzle strongboxes and house chests (190 chests; strongboxes from the save's field-object list, unknown ones hidden) and one chest icon (type 226) per not-opened Abyss chest (74, Abyss map layer) in the detected save, shown at every map zoom (zoom limit off on our own markers only); Greymane Shrine markers on (game shrine icon, type 186); up to 256 markers per category, checked 32 per map update; F10 hides all, F6 shows again. A failed marker is retried every 5 s without blocking others. Observation: zoom windows per icon type, map zoom on F8, player position from the minimap, world-create records (ours and the game's own shrine/Bell icons)");
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
    // Combined build: one marker per Bell and per Greymane Shrine, following
    // the detected save. Markers are on from the start; F10 turns them all
    // off, F6 back on. v0.64: the filter panel (F9) switches each category,
    // and its choices are loaded from filters.ini here.
    MarkerState markers = {};
    markers.enabled = true;
    LoadFilters();
    char filterLine[160] = "Filter panel choices:";
    AcquireSRWLockExclusive(&statusLock);
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        PywelMarkerCategoryStatus& panelStatus = categoryStatus[category];
        strcpy_s(panelStatus.name, kPanelNames[category]);
        panelStatus.available = kCategories[category].shown;
        panelStatus.total = kCategories[category].count;
        markers.shownLogged[category] = InterlockedCompareExchange(&categoryShown[category], 0, 0) != 0;
        char part[48];
        sprintf_s(part, " %s=%s", kCategories[category].label, markers.shownLogged[category] ? "on" : "off");
        strcat_s(filterLine, part);
    }
    ReleaseSRWLockExclusive(&statusLock);
    Log(filterLine);
    ULONGLONG nextFiltersSave = 0;
#endif
    while (true) {
        Drain();
#ifdef PYWEL_ATLAS_COMBINED
        UpdateMarkers(markers);
        LogLayerObservation();
        InterlockedExchange(&markersEnabled, markers.enabled ? 1 : 0);
        // v0.64: save changed panel choices, at most once a second.
        if (InterlockedCompareExchange(&filtersDirty, 0, 0) && GetTickCount64() >= nextFiltersSave) {
            InterlockedExchange(&filtersDirty, 0);
            if (!SaveFilters()) {
                InterlockedExchange(&filtersDirty, 1); // Try again in a second.
            }
            nextFiltersSave = GetTickCount64() + 1000;
        }
        // v0.53 observation: zoom records and player position (F8 also logs
        // the position at once; see the F8 block below).
        LogZoomAndPosition(false);
        // v0.57 observation: why world-icon creations are refused.
        LogWorldCreates();
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
        // --- F6 / F10 (combined build): turn all markers on / off. ---
        if (focused && f6 && !previousF6 && !markers.enabled) {
            markers.enabled = true;
            Log("Markers turned on (F6); they follow the detected save.");
            MessageBeep(MB_OK);
        }
        if (focused && f10 && !previousF10 && markers.enabled) {
            markers.enabled = false;
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

// Combined build: lets another part (the v0.55 teleport observation) read the
// latest copy of the player position taken in the minimap update hook, and
// which thread took it. Never waits: returns false if the copy is busy or
// none was taken yet.
bool PywelGetMinimapPlayer(float (&xyz)[3], DWORD& thread, ULONGLONG& tick) {
    if (!TryAcquireSRWLockShared(&positionLock)) {
        return false;
    }
    memcpy(xyz, playerPosition.minimap, sizeof(xyz));
    thread = playerPosition.minimapThread;
    tick = playerPosition.minimapTick;
    bool known = playerPosition.minimapUpdates > 0;
    ReleaseSRWLockShared(&positionLock);
    return known;
}

// v0.64 (src/pywel-atlas/MarkerFilter.h): copies one category's state for
// the filter panel.
bool PywelGetMarkerCategory(unsigned category, PywelMarkerCategoryStatus& status) {
    if (category >= kCategoryCount) {
        return false;
    }
    AcquireSRWLockShared(&statusLock);
    status = categoryStatus[category];
    ReleaseSRWLockShared(&statusLock);
    status.shown = InterlockedCompareExchange(&categoryShown[category], 0, 0) != 0;
    return status.name[0] != 0; // Empty until this part's worker has started.
}

// v0.64: the filter panel switches a category on or off. Paused categories
// cannot be switched on. The worker applies it and saves filters.ini.
void PywelSetMarkerCategoryShown(unsigned category, bool shown) {
    if (category >= kCategoryCount || (shown && !kCategories[category].shown)) {
        return;
    }
    if (InterlockedExchange(&categoryShown[category], shown ? 1 : 0) != (shown ? 1 : 0)) {
        InterlockedExchange(&filtersDirty, 1);
    }
}

// v0.64: false while F10 has turned all markers off.
bool PywelMarkersEnabled() {
    return InterlockedCompareExchange(&markersEnabled, 0, 0) != 0;
}

// v0.64: the panel's saved position and size (screen fractions).
bool PywelGetPanelGeometry(float (&geometry)[4]) {
    AcquireSRWLockShared(&statusLock);
    bool known = panelGeometryKnown;
    memcpy(geometry, panelGeometry, sizeof(geometry));
    ReleaseSRWLockShared(&statusLock);
    return known;
}

// v0.64: stores the panel's new position and size; saved by the worker.
void PywelSetPanelGeometry(const float (&geometry)[4]) {
    AcquireSRWLockExclusive(&statusLock);
    memcpy(panelGeometry, geometry, sizeof(panelGeometry));
    panelGeometryKnown = true;
    ReleaseSRWLockExclusive(&statusLock);
    InterlockedExchange(&filtersDirty, 1);
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
