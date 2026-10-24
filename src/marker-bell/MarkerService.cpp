// MarkerService.cpp - creating and removing our markers on the maps (v0.122 split).
//
// What this file does (combined build only):
// - On every world-map and minimap update (the game's map thread), compares
//   which markers should exist with which do, and creates or removes a few
//   (ServiceMarkersOn, CreateMarker).
// - Switches off the zoom limit on our own markers, hides instead of removing
//   where the game needs it (Abyss Nexuses), and the Nexus layer watch.
// - Includes the tooltip, knowledge card, marker size and height arrow parts
//   (MapTooltips.h, MapKnowledgeCard.h, MarkerIconSize.h, MarkerHeightArrow.h).
//   Those files hold their own state, so only this file may include them.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

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
// v0.104: the spots a route may visit (written by the worker, read by
// PywelGetRouteStops): category on, markers on, save known, and not done,
// unknown or quest-locked.
volatile LONG routeCandidates[kCategoryCount][kMaskWords] = {};
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
    {}, {}, 0, true};
MapSide minimapSide = {"minimap", 0x5674e00, false, &minimapLookup, &removeMinimapIcon,
    minimapPresent, minimapStuck, minimapFailed, minimapHidden, &minimapCreations, &minimapRemovals,
    &minimapFailures, {}, {}, 0, true};

// True for categories whose markers are hidden, not removed, when the user
// turns them off.
// v0.95: the island Nexus icon shares the Nexus template, so it is treated
// the same way.
bool HidesInsteadOfRemoving(unsigned category) {
    return category == kNexusCategory || category == kIslandNexusCategory;
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
MarkerWatch markerWatch[3][4] = {};
bool watchWantedBefore[3] = {}; // Any marker of the category wanted at the last world-map update.
unsigned watchRound[3] = {}; // Counts the rounds (1 = the markers made after loading).
BYTE layersBefore[5] = {}; // Layer bytes at the last world-map update...
bool layersKnown = false; // ...once read.

#ifdef PYWEL_ATLAS_DEV
// v0.81: queues a raw hex copy of `size` bytes at `address` (game memory),
// 0x80 bytes per log line, so a visible and an invisible marker can be
// compared byte by byte offline. Pointers in it are only numbers in the log.
// (Development builds only, v0.129, like the layer watch below.)
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
#endif

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

#ifdef PYWEL_ATLAS_DEV
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
#endif

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
#ifdef PYWEL_ATLAS_DEV
    // The layer watch (logs only): development builds only (v0.129).
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
#else
    (void)controller;
    (void)index;
#endif
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

#ifdef PYWEL_ATLAS_DEV
// Runs on the map thread after each world-map update: logs layer byte
// changes and the watched markers' later states (development builds only).
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
#endif

// v0.84: map tooltips, phase 0 (observe only); v0.85: phase 1 (our text).
// Hook, element table, texts and focus logging live in their own file.
#include "MapTooltips.h"
// v0.89: knowledge card observation (logs only); v0.91: the chest card.
#include "MapKnowledgeCard.h"
// v0.117: even icon sizes for our markers (class for the UI add-on's rules).
#include "MarkerIconSize.h"
// v0.126: up / down arrows on markers above or below the player.
#include "MarkerHeightArrow.h"

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

// v0.78: world-map creations the game refused (its icon constructor ran but
// returned no icon) and creations that worked, per category. Written on the
// map thread, read by the worker. The shrine icon is refused on the world map
// unless the Shrine Icons file mod is installed.
volatile LONG worldRefusals[kCategoryCount] = {};
volatile LONG worldSuccesses[kCategoryCount] = {};
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

// Microseconds since some fixed moment (a high-resolution clock, unlike
// GetTickCount64, whose steps are about 15 ms).
LONGLONG MicrosecondsNow() {
    static LARGE_INTEGER frequency = {};
    if (frequency.QuadPart == 0) {
        QueryPerformanceFrequency(&frequency);
    }
    LARGE_INTEGER counter;
    QueryPerformanceCounter(&counter);
    return counter.QuadPart / frequency.QuadPart * 1000000 +
        counter.QuadPart % frequency.QuadPart * 1000000 / frequency.QuadPart;
}

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
    // v0.117: creations stop once this update has used its time budget
    // (was: at most one creation per update).
    LONGLONG createDeadline = MicrosecondsNow() + kCreateBudgetMicroseconds;
    bool budgetUsed = false;
    // Set when a marker was created or had to wait for the budget: more
    // may be missing, so the next update checks every marker again.
    bool moreToCreate = false;
    // Catch-up mode checks every marker; otherwise a rotating slice of 32.
    unsigned steps = side.catchUp || total < kServicePerUpdate ? total : kServicePerUpdate;
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
            ForgetMarkerSize(category, index, side.world); // v0.117.
            ForgetHeightArrow(category, index, side.world); // v0.126.
            if (side.world) {
                ForgetMarkerElement(category, index); // v0.84 tooltips.
                evenScaleIcons[category][index] = nullptr; // v0.120.
            }
            bool blocked = side.world && InterlockedCompareExchange(&worldCreateBlocked[category], 0, 0) != 0;
            bool mayCreate = wanted[category].Test(index) && createAllowed[category] && !blocked &&
                now >= side.retryAfter[category][index];
            if (mayCreate && !budgetUsed && MicrosecondsNow() >= createDeadline) {
                budgetUsed = true;
            }
            if (mayCreate && budgetUsed) {
                moreToCreate = true; // Left for the next update.
            }
            if (mayCreate && !budgetUsed) {
                moreToCreate = true;
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
            // v0.117: our size class on its picture (once per icon object).
            ApplyMarkerSize(icon, category, index, side.world);
            // v0.126: its height arrow class (changed only when the state changes).
            ApplyHeightArrow(icon, category, index, side.world);
            // Wanted and present. World map: keep its zoom limit off (see
            // DisableZoomWindows; this also covers a re-initialised icon).
            if (side.world) {
                DisableZoomWindows(icon);
                // v0.120: verified, so the scale hook gives it the shared curve.
                evenScaleIcons[category][index] = icon;
                // v0.84: remember its UI element for the tooltip hook.
                NoteMarkerElement(category, index, icon);
                // v0.91: chests with a known item open the knowledge card.
                MarkChestForCard(category, index, icon);
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
                ForgetMarkerSize(category, index, side.world); // v0.117.
                ForgetHeightArrow(category, index, side.world); // v0.126.
                if (side.world) {
                    ForgetMarkerElement(category, index); // v0.84 tooltips.
                    evenScaleIcons[category][index] = nullptr; // v0.120.
                }
            }
        } else if (GetTickCount64() - side.removalIssued[category][index] >= 3000) {
            // The game deferred removal and it is still there after 3 s.
            // Do not call removal again; report it and leave reload as fallback.
            SetSharedBit(side.stuck[category], index, true);
        }
    }
    // v0.117: stay in catch-up mode while anything was created or left over;
    // a full pass with nothing to create returns to the light rotating slice.
    side.catchUp = moreToCreate;
    // Only this thread writes this side's present and hidden masks.
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        StoreMask(side.present[category], present[category]);
        StoreMask(side.hidden[category], hidden[category]);
    }
}

// Runs on the game's map thread after each world-map update.
void ServiceMarkers(void* controller) {
    ServiceMarkersOn(controller, worldSide);
    // v0.84 tooltips, phase 0: log focus changes (read-only).
    ObserveTooltipFocus(controller);
    // v0.89: knowledge card observation (MapKnowledgeCard.h; read-only here).
    ObserveMapCard(controller);
#ifdef PYWEL_ATLAS_DEV
    // v0.80 observation (read-only, logs only).
    ObserveNexusLayers(controller);
#endif
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
#endif

} // namespace pywel_map
