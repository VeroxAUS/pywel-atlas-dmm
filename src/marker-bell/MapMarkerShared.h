// MapMarkerShared.h - what the map-marker files share (v0.122).
//
// The map-marker part of Pywel Atlas used to be one 4,700-line file
// (NativeMapCategoryProbe.cpp). v0.122 splits it into several files by job,
// without changing what the code does. This header is what they all include:
// - the game-function shapes, small data types and fixed settings
//   (constants), for example the marker category table kCategories;
// - one line per shared variable or function, saying it exists and which file
//   holds it ("extern" = "defined in another file"; a function line ending in
//   ";" is a declaration, the body is in the named file).
// Everything sits in the namespace pywel_map, a name prefix that keeps these
// names apart from the other Pywel Atlas parts. The game never sees it.
// Note for src/pywel-atlas-ui/build_ui_patch.py: it reads kCategories from
// this file (CATEGORY_SOURCE), so keep the table's form unchanged.
#pragma once
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
// v0.95: the Abyss-island Nexus list (names, game positions).
#include "island-nexus-links.h"
// v0.88: the Sealed Abyss Artifact list (names, game positions).
#include "artifact-links.h"
// v0.105: the Abyss Cresset list (names, game positions, challenge missions).
#include "cresset-links.h"
// v0.108: the unique gear list (names, game positions).
#include "unique-gear-links.h"
// v0.114: the Constellation list (names, game positions, challenge missions).
#include "constellation-links.h"
#include "region-map.h" // v0.110: completion tracker.
// v0.64: per-category choices shared with the in-game filter panel.
#include "../pywel-atlas/MarkerFilter.h"
// v0.104: the route line (stops, map snapshots; see RouteSystem.h).
#include "../pywel-atlas/RouteSystem.h"
// v0.111: the route line on the world map's own canvas (RouteCanvas.cpp).
#include "../pywel-atlas/RouteCanvas.h"
// v0.119: rebindable keys (markers on / off; this worker saves keybinds.ini).
#include "../pywel-atlas/Keybinds.h"
#endif
#ifdef PYWEL_ATLAS_TELEPORT
// Test build only (src/pywel-atlas/TestTeleporter.cpp): runs on the minimap thread.
void PywelTeleporterService();
#endif


namespace pywel_map {

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
constexpr WORD chestType = 226; // Map icon type id this mod uses for its chest.
// Private numeric key for our chest. Read as ASCII, the high bytes spell "PYAT".
constexpr uint64_t chestKey = 0x5059415400000002ULL;
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
//   4 = surface Abyss Nexuses (v0.79; nexus-links.h; v0.95: plus the 2 at
//       Kliff's houses), the game's own Abyss Nexus icon (type 234
//       "MapIcon_Abyss_Ruins", icon group 0x20);
//   5 = Sealed Abyss Artifacts (v0.88; artifact-links.h), the game's own
//       artifact icon (type 187 "MapIcon_Gimmick_SealedArtifact");
//   6 = Abyss-island Nexuses (v0.95; island-nexus-links.h), the Abyss Nexus
//       icon (v0.97: type 234 like category 4; see the kCategories entry).
//       Their positions are on the Abyss map layer, like the Abyss chests.
//   7 = Abyss Cressets (v0.105; cresset-links.h), the game's own cresset
//       icon (type 340 "MapIcon_StandStone"); hidden once their challenge
//       mission is completed.
//   8 = unique gear (v0.108; unique-gear-links.h), one-of-a-kind missable
//       gear, the chest icon (type 226, like categories 2 and 3); hidden once
//       collected. Its 2 Abyss items go to the Abyss map layer by altitude.
//   9 = Constellations (v0.114, trial; constellation-links.h), the game's
//       unused test icon (type 409 "MapIcon_TestGimmick11"), drawn as the
//       Pywel Atlas star picture by the UI add-on v0.82; hidden once their
//       challenge mission is completed.
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
    // gimmick icons, 0x20 for the Abyss Nexus icon (v0.95: 0x21 for the
    // Abyss-island Nexus icon).
    DWORD iconGroup;
};
constexpr unsigned kBellCategory = 0;
constexpr unsigned kShrineCategory = 1;
constexpr unsigned kChestCategory = 2;
constexpr unsigned kAbyssChestCategory = 3;
constexpr unsigned kNexusCategory = 4;
constexpr unsigned kArtifactCategory = 5;
constexpr unsigned kIslandNexusCategory = 6;
constexpr unsigned kCressetCategory = 7;
constexpr unsigned kUniqueGearCategory = 8;
constexpr unsigned kConstellationCategory = 9;
constexpr unsigned kCategoryCount = 10;
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
    // v0.88: type 187, the game's own Sealed Abyss Artifact icon (template
    // 28813 "MapIcon_Gimmick_SealedArtifact", group 0xffffffff like the other
    // gimmick icons; from the icon catalogue in the v0.53+ map traces). Its
    // world layout has the Bell icon's zoom window, so our markers get the
    // same zoom-window fix. Keys 0x...0600 + i.
    {"Sealed Abyss Artifact", 187, 28813, "MapIcon_Gimmick_SealedArtifact", 0x5059415400000600ULL,
        _countof(kArtifactLinks), true, 0xffffffff},
    // v0.95 used type 235, the game's own Abyss-island Nexus icon (same
    // template, group 0x21). v0.97 runtime (user, 2026-10-23): those markers
    // moved with the map camera. Type 235's definition has +0xb5 = 1 (234
    // has 0), which appears to make the icon take its position from a linked
    // game object our markers do not have. v0.97: type 234, the surface Nexus
    // icon, which stays at its given position; the altitude still routes it
    // to the Abyss map layer. Keys 0x...0700 + i.
    {"Abyss-island Nexus", 234, 28866, "MapIcon_Abyss_Ruins", 0x5059415400000700ULL,
        _countof(kIslandNexusLinks), true, 0x20},
    // v0.105: type 340, the game's own Abyss Cresset icon (template
    // "MapIcon_StandStone", group 0xffffffff, world look 0x16f0 in the v0.103
    // F8 trace). Its template id is not in the traces (the F8 catalogue
    // listed only Gimmick/Treasure names until v0.105), so 0 here means:
    // accept the id the loaded definition has, as long as the template name
    // and group match exactly (see IconDefinitionReady). Its world layout has
    // the Bell icon's zoom window, so the same zoom-window fix applies. Keys
    // 0x...0800 + i.
    {"Abyss Cresset", 340, 0, "MapIcon_StandStone", 0x5059415400000800ULL,
        _countof(kCressetLinks), true, 0xffffffff},
    // v0.108: type 226, the chest icon (verified since v0.31 on both maps and
    // the Abyss layer; no traced game icon fits gear). Keys 0x...0900 + i.
    {"Unique gear", 226, 28852, "MapIcon_Gimmick_LevelTreasureBox", 0x5059415400000900ULL,
        _countof(kUniqueGearLinks), true, 0xffffffff},
    // v0.114: type 409, the game's unused test icon (template 29133
    // "MapIcon_TestGimmick11", group 0xffffffff, from the v0.103 F8
    // catalogue). No game spot uses it; the UI add-on v0.82 gives it our
    // star picture on both maps. Keys 0x...0A00 + i.
    {"Constellation", 409, 29133, "MapIcon_TestGimmick11", 0x5059415400000A00ULL,
        _countof(kConstellationLinks), true, 0xffffffff},
};
static_assert(_countof(kBellLinks) <= kMaxCategoryMarkers && _countof(kShrineLinks) <= kMaxCategoryMarkers &&
    _countof(kChestLinks) <= kMaxCategoryMarkers && _countof(kAbyssChestLinks) <= kMaxCategoryMarkers &&
    _countof(kNexusLinks) <= kMaxCategoryMarkers && _countof(kArtifactLinks) <= kMaxCategoryMarkers &&
    _countof(kIslandNexusLinks) <= kMaxCategoryMarkers && _countof(kCressetLinks) <= kMaxCategoryMarkers &&
    _countof(kUniqueGearLinks) <= kMaxCategoryMarkers && _countof(kConstellationLinks) <= kMaxCategoryMarkers,
    "Marker masks hold at most 256 markers per category");

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
// v0.120: one zoom size curve for all our markers.
//
// The game sizes each world-map icon with a curve from its icon type
// (research/analysis/map-zoom-visibility.md, section 2): Bells, Greymane
// Shrines and (by the user's v0.117 test) Abyss Cressets keep a fixed scale
// of 1, chests and Sealed Abyss Artifacts shrink from 1 (zoomed in) to 0.7
// (zoomed out), and Abyss Nexuses stay at 1.7-1.8. So our markers drifted
// apart in size while zooming (Thomas, 2026-10-24). For OUR verified world-map
// markers only, the scale hook now returns the Sealed Abyss Artifact's curve
// (type 187 record: maximum +0x8c = 1.0, minimum +0x90 = 0.7, no shrink
// ramp; v0.53+ zoom-type log lines), whatever their icon type. The game's own
// icons keep their own curves.
constexpr bool kEvenMarkerScaleOn = true;
// Defined further down (queues one log line for the worker).
void QueueObservation(const char* line);
constexpr float kEvenScaleMaximum = 1.0f;
constexpr float kEvenScaleMinimum = 0.7f;

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
    // v0.117: catch-up mode. True while markers may still be missing (map
    // just opened, save just loaded): each update then checks every marker
    // and creates as many as fit in its time budget, instead of one.
    bool catchUp;
};

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

// The icon type's definition record, or 0 (defined after ReadTable below).
uintptr_t IconRecord(WORD type);

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

// v0.78: what one creation attempt achieved.
enum class CreateResult {
    Created, // Exists now and is confirmed as ours.
    Pending, // Minimap: asked for; the game builds it a moment later (adopted then).
    Failed, // Could not be created or confirmed (retried after 5 s).
};
// After this many refusals with no success, a category is treated as "needs
// its icon add-on": no more world-map tries this session (the worker sets
// worldCreateBlocked). The minimap has its own shrine layout and keeps going.
constexpr LONG kShrineAddonRefusals = 3;

// v0.58: how many markers a map update checks. With ~170 markers, checking
// all of them every frame would mean ~170 lookups per frame; a rotating
// slice keeps each frame light, and every marker is still checked every few
// updates.
constexpr unsigned kServicePerUpdate = 32;

// v0.117: how long one map update may spend creating markers, in
// microseconds. Before, each update created at most one marker, so ~850
// markers appeared one per frame over 10-15 s. Now an update keeps creating
// until this budget is used up, so they all appear within a few frames.
constexpr LONGLONG kCreateBudgetMicroseconds = 3000;

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
    "Abyss Nexus", "Sealed Abyss Artifacts", "Abyss-island Nexus", "Abyss Cressets", "Unique gear", "Constellations"};
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

// --- 3. Player position ----------------------------------------------------

// 0xe13cf0: the minimap controller's own update (vtable 0x5674e00, slot
// 0x118). RCX controller, XMM1 elapsed time, like the world update 0xdabd10.
using UpdateMinimap = uintptr_t (*)(void*, float);
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
#endif

// ===========================================================================
// Shared variables and functions, listed by the file that holds them
// ===========================================================================

// MapHooks.cpp
extern CreateIcon originalCreate;
extern LookupType originalType;
extern LookupType originalTemplate;
extern LookupIcon worldLookup;
extern LookupIcon minimapLookup;
extern SetVisibility originalVisibility;
extern CreateWorldIcon originalWorldCreate;
extern InitializeIcon originalInitialize;
extern ProjectWorld originalProjectWorld;
extern CalculateIconScale originalCalculateScale;
extern RemoveWorldIcon removeWorldIcon;
extern UpdateWorldMap originalUpdateWorldMap;
extern uintptr_t imageBase;
extern HANDLE logFile;
extern volatile LONG creationCalls;
extern volatile LONG sampledCalls;
extern volatile LONG droppedSamples;
extern volatile LONG namedSamples;
extern volatile LONG generationEnabled;
extern volatile LONG generatedCalls;
extern volatile LONG occupiedKeys;
extern volatile LONG definitionRejected;
extern volatile LONG generatedReadbackMask;
extern volatile LONG worldProjectionCalls;
extern volatile LONG worldMapUpdateCalls;
extern volatile LONG privateScaleCalls;
extern volatile LONG64 renderCaptureDeadline;
extern volatile LONG ownedChest;
extern volatile LONG removalRequested;
extern volatile LONG removalServicing;
extern volatile LONG removalAttempts;
extern volatile LONG removalConfirmed;
extern volatile LONG removalAbsent;
extern volatile LONG removalRejected;
extern volatile LONG removalOutcome;
extern volatile LONG creationRequested;
extern volatile LONG creationOutcome;
extern volatile LONG64 removalWaitStarted;
extern SRWLOCK definitionLock;
extern MarkerDefinition stagedDefinition;
extern MarkerDefinition activeDefinition;
extern thread_local Sample* activeSample;
extern thread_local bool creatingChest;
extern thread_local void* requestedChestContainer;
extern SRWLOCK sampleLock;
extern Sample pending[128];
extern unsigned pendingCount;
extern Sample seen[256];
extern unsigned seenCount;
extern VisibilityEvent visibilityPending[512];
extern unsigned visibilityPendingCount;
extern VisibilityEvent visibilitySeen[256];
extern unsigned visibilitySeenCount;
extern char observationLines[160][400];
extern unsigned observationLineCount;
uintptr_t RouteWorldContainer(void* controller, const WORD* type, const void* tag,
    const DWORD* index, const float* position, void* container, uintptr_t slot7,
    float scalar, uintptr_t slot9, const void* appearance, const char* templateName,
    const void* optional12, const void* optional13, BYTE finalFlag);
void CaptureIconState(void* icon, Sample& sample);
BYTE ObserveInitialize(void* icon, const void* description, BYTE flag);
bool RenderCaptureActive();
void QueueRenderState(void* icon, BYTE phase, float scale);
#ifdef PYWEL_ATLAS_COMBINED
extern void* volatile evenScaleIcons[kCategoryCount][kMaxCategoryMarkers];
extern volatile LONG evenScaleLogged[kCategoryCount];
#endif
float ObserveScale(void* icon, float zoom, BYTE mode, float mapScale);
uintptr_t ObserveWorldProjection(void* controller, BYTE flag, void* layer,
    const void* data, const void* optional, float value);
uintptr_t ObserveWorldMapUpdate(void* controller, float elapsed);
void ServiceCreation(void* controller);
void ServiceRemovalInternal(void* controller);
void ServiceRemoval(void* controller);
uintptr_t ObserveVisibility(void* icon, BYTE bit, BYTE enabled);
bool ReadTemplateName(const void* record, char (&name)[128]);
void Queue(const Sample& sample);
void* ObserveType(const WORD* type);
void* ObserveTemplate(const WORD* type);
uintptr_t ObserveCreate(void* controller, const WORD* type, const void* tag,
    const DWORD* index, const void* scale, const float* position,
    const void* appearance, BYTE flag, const void* data, BYTE finalFlag);
void CreateIndependentChest(void* controller, void* parent, const void* presentation,
    const MarkerDefinition& definition);
void Log(const char* line);
void HideCompletedProof();

// MapCategories.cpp
bool Read(const void* address, void* destination, SIZE_T size);
MarkerDefinition CopyDefinition(bool active);
#ifdef PYWEL_ATLAS_COMBINED
bool IsDecoyMarker(unsigned category, unsigned index);
unsigned RealMarkerCount(unsigned category);
const char* MarkerName(unsigned category, unsigned index);
const float* MarkerPosition(unsigned category, unsigned index);
MarkerMask LoadMask(volatile LONG (&shared)[kMaskWords]);
void StoreMask(volatile LONG (&shared)[kMaskWords], const MarkerMask& mask);
void SetSharedBit(volatile LONG (&shared)[kMaskWords], unsigned index, bool on);
bool FindMarker(uint64_t key, unsigned& category, unsigned& index);
bool IsCategoryMarker(void* icon, unsigned category, unsigned index);
#endif
bool IsOwnMarkerKey(uint64_t key);
WORD OwnMarkerType(uint64_t key);
bool IsPrivateChest(void* icon);

// MarkerService.cpp
#ifdef PYWEL_ATLAS_COMBINED
extern volatile LONG markerWanted[kCategoryCount][kMaskWords];
extern volatile LONG routeCandidates[kCategoryCount][kMaskWords];
extern volatile LONG markerCreateAllowed[kCategoryCount];
extern volatile LONG markerHiddenByChoice[kCategoryCount];
extern volatile LONG markerPresent[kCategoryCount][kMaskWords];
extern volatile LONG markerStuck[kCategoryCount][kMaskWords];
extern volatile LONG markerFailed[kCategoryCount][kMaskWords];
extern volatile LONG markerCreations;
extern volatile LONG markerRemovals;
extern volatile LONG markerFailures;
extern volatile LONG markerZoomWindowWrites;
extern volatile LONG markerZoomWindowFailures;
void DisableZoomWindows(void* icon);
extern volatile LONG minimapPresent[kCategoryCount][kMaskWords];
extern volatile LONG minimapStuck[kCategoryCount][kMaskWords];
extern volatile LONG minimapFailed[kCategoryCount][kMaskWords];
extern volatile LONG minimapCreations;
extern volatile LONG minimapRemovals;
extern volatile LONG minimapFailures;
extern RemoveWorldIcon removeMinimapIcon;
extern volatile LONG worldHidden[kCategoryCount][kMaskWords];
extern volatile LONG minimapHidden[kCategoryCount][kMaskWords];
extern MapSide worldSide;
extern MapSide minimapSide;
bool HidesInsteadOfRemoving(unsigned category);
bool ReadChoiceHidden(const void* icon, bool& isHidden);
bool SetChoiceHidden(void* icon, bool hide);
void QueueObservation(const char* line);
bool IconLayerClass(const void* icon, BYTE& layerClass);
bool ReadLayersShowing(void* controller, BYTE (&showing)[5]);
extern volatile LONG createdClear[kCategoryCount];
extern volatile LONG createdHidden[kCategoryCount];
extern volatile LONG createdLayerHidden[kCategoryCount];
extern MarkerWatch markerWatch[3][4];
extern bool watchWantedBefore[3];
extern unsigned watchRound[3];
extern BYTE layersBefore[5];
extern bool layersKnown;
void QueueDump(const char* what, const char* name, unsigned round, const void* address, unsigned size);
bool FindPictureInContainers(void* controller, uintptr_t root, unsigned& container, unsigned& slot);
void DescribeMarker(void* controller, void* icon, const MarkerWatch& watch, unsigned round, const char* moment,
    bool dump);
void NoteWorldCreation(void* controller, void* icon, unsigned category, unsigned index);
void* FindWorldMarker(void* controller, unsigned category, unsigned index);
void ObserveNexusLayers(void* controller);
DWORD MarkerIndex(const MapSide& side, unsigned category, unsigned index);
extern volatile LONG minimapAdoptLogged[kCategoryCount];
extern volatile LONG minimapCreateLogged[kCategoryCount];
extern volatile LONG worldRefusals[kCategoryCount];
extern volatile LONG worldSuccesses[kCategoryCount];
extern volatile LONG worldCreateBlocked[kCategoryCount];
CreateResult CreateMarker(void* controller, unsigned category, unsigned index, const MapSide& side);
LONGLONG MicrosecondsNow();
void ServiceMarkersOn(void* controller, MapSide& side);
void ServiceMarkers(void* controller);
void ServiceMinimapMarkers(void* controller);
void MarkerNames(unsigned category, const MarkerMask& mask, char (&text)[640]);
#endif

// MarkerState.cpp
#ifdef PYWEL_ATLAS_COMBINED
extern volatile LONG categoryShown[kCategoryCount];
extern volatile LONG markersEnabled;
extern volatile LONG filtersDirty;
extern SRWLOCK statusLock;
extern PywelMarkerCategoryStatus categoryStatus[kCategoryCount];
extern MarkerMask categoryDoneMask[kCategoryCount];
extern MarkerMask categoryLockedMask[kCategoryCount];
extern bool categoryDoneKnown[kCategoryCount];
extern float panelGeometry[4];
extern bool panelGeometryKnown;
extern PywelHudSettings hudSettings;
bool FiltersPath(wchar_t (&path)[MAX_PATH]);
void LoadFilters();
bool SaveFilters();
MarkerMask DoneMask(unsigned category, const LoadedSaveBell& loaded, bool saveValid, bool& valid,
    MarkerMask& unknown);
MarkerMask LockedMask(unsigned category, const LoadedSaveBell& loaded, MarkerMask& unknown, MarkerMask& mismatch);
void LogQuestLocks(unsigned category, const LoadedSaveBell& loaded, const MarkerMask& locked,
    const MarkerMask& mismatch);
void UpdateMarkers(MarkerState& state);
void LogLayerObservation();
#endif

// IconDefinitions.cpp
bool ReadTable(uintptr_t pointerRva, DWORD maximum, TableView& view);
bool SameTable(const TableView& left, const TableView& right);
bool IconDefinitionReady(WORD type, WORD expectedTemplate, const char* expectedName, DWORD expectedGroup);
bool ChestDefinitionReady();
bool MarkerDefinitionReady(WORD type);
uintptr_t IconRecord(WORD type);
bool ResolveIndependentParent(void* controller, WORD type, const float (&position)[3],
    void*& parent, uintptr_t& chestRecord);
bool ResolvePresentation(uintptr_t record, const void*& presentation);
void SnapshotCachedDefinitions();

// MapDiagnostics.cpp
#ifdef PYWEL_ATLAS_COMBINED
extern SRWLOCK zoomLock;
extern ZoomTypeRecord zoomTypes[64];
extern unsigned zoomTypeCount;
extern volatile LONG zoomTypeSeen[4096 / 32];
extern volatile LONG zoomTypeDropped;
void RecordIconZoomType(void* icon);
extern ZoomFrameRecord zoomFrames[16];
extern unsigned zoomFrameCount;
void RecordZoomFrame(void* controller);
extern SRWLOCK createLock;
extern WorldCreateRecord createRecords[64];
extern unsigned createRecordCount;
extern volatile LONG createDropped;
extern volatile LONG createOursLogged[kCategoryCount][kMaxCategoryMarkers];
extern volatile LONG createGameShrineLogged;
extern volatile LONG createGameBellLogged;
extern volatile LONG createGameAbyssChestLogged;
bool ReadShortText(const char* source, char (&text)[96]);
bool BeginWorldCreateProbe(void* controller, const WORD* type, const void* tag, uintptr_t slot7,
    float scalar, uintptr_t slot9, const void* appearance, const char* templateName,
    const void* optional12, const void* optional13, BYTE finalFlag, bool ours,
    WorldCreateRecord& record);
void FinishWorldCreateProbe(void* controller, uintptr_t result, WorldCreateRecord& record);
void LogWorldCreates();
void FormatWindow(const BYTE* window, char (&text)[128]);
void LogZoomAndPosition(bool now);
#endif

// MinimapMarkers.cpp
#ifdef PYWEL_ATLAS_COMBINED
extern UpdateMinimap originalMinimapUpdate;
extern SRWLOCK positionLock;
extern PlayerPosition playerPosition;
uintptr_t ObserveMinimapUpdate(void* controller, float elapsed);
void RecordMapViewPosition(const void* playerXyz, float heading);
void PrepareMinimapMarkers(BYTE* base);
void InstallMinimapHook(BYTE* base);
#endif

// NativeMapCategoryProbe.cpp
void Drain();
DWORD WINAPI Run(void* address);

// MarkerService.cpp, from the parts it includes (MapTooltips.h, MapKnowledgeCard.h)
#ifdef PYWEL_ATLAS_COMBINED
void InstallTooltipHook(BYTE* base);
void LogTooltipCounts();
void InstallCardHooks(BYTE* base);
void LogCardCounts();
bool KnowledgeCardOpen();
#endif

} // namespace pywel_map
