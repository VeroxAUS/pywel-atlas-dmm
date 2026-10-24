// MapPublicApi.cpp - what the other Pywel Atlas parts ask the map part (v0.122 split).
//
// What this file does:
// - The Pywel* functions the filter panel, route and completion widget call:
//   marker category status, show/hide, panel and widget settings, region
//   progress, route stops, finding one of our icons.
// - The worker start function (PywelMapMarkerRun), or in the old standalone
//   proof build, DllMain.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

// The map part's own names (MapMarkerShared.h).
using namespace pywel_map;

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

// v0.106 (src/pywel-atlas/MarkerFilter.h): true while a knowledge card is
// open on the world map (ours or the game's own). The card's screen rect is
// not read (no cheap source found), so rectOut is always zeros.
bool PywelMapKnowledgeCardState(float rectOut[4]) {
    rectOut[0] = rectOut[1] = rectOut[2] = rectOut[3] = 0.0f;
    return KnowledgeCardOpen();
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

// v0.110: the completion widget's saved place and options.
PywelHudSettings PywelGetHudSettings() {
    AcquireSRWLockShared(&statusLock);
    PywelHudSettings settings = hudSettings;
    ReleaseSRWLockShared(&statusLock);
    return settings;
}

// v0.110: stores the widget's place and options; saved by the worker.
void PywelSetHudSettings(const PywelHudSettings& settings) {
    AcquireSRWLockExclusive(&statusLock);
    hudSettings = settings;
    ReleaseSRWLockExclusive(&statusLock);
    InterlockedExchange(&filtersDirty, 1);
}

// v0.110: completion tracker (src/pywel-atlas/MarkerFilter.h).
// A row index into region-map.h's runs, so a lookup walks one row only: the
// run holding each row's first cell, and how many of that run's cells come
// before the row. Built once, on first use, with every marker's area.
static_assert(kRegionAreaCount < 255 && kRegionGroupCount <= kPywelMaxRegionGroups &&
    kRegionAreaCount <= kPywelMaxRegionAreas && kCategoryCount <= kPywelMaxHereCategories,
    "Region tables must fit the panel copy");
unsigned regionRowRun[kRegionGridSize];
unsigned regionRowSkip[kRegionGridSize];
unsigned char markerArea[kCategoryCount][kMaxCategoryMarkers]; // kRegionAreaCount = none.
INIT_ONCE regionIndexOnce = INIT_ONCE_STATIC_INIT;

// The area a world position (X, height Y, Z) is in: kRegionAbyssArea on the
// Abyss layer (or above kRegionAbyssHeight), kRegionAreaCount outside every
// area (the sea, prohibited zones).
unsigned RegionAreaAt(const float* position, bool abyssLayer) {
    if (abyssLayer || position[1] > kRegionAbyssHeight) {
        return kRegionAbyssArea;
    }
    float column = kRegionGridSize / 2 + (position[0] - kRegionCentreX) / kRegionCellSize;
    float row = kRegionGridSize / 2 - (position[2] - kRegionCentreZ) / kRegionCellSize;
    if (!(column >= 0.0f && column < kRegionGridSize && row >= 0.0f && row < kRegionGridSize)) {
        return kRegionAreaCount;
    }
    unsigned run = regionRowRun[static_cast<unsigned>(row)];
    unsigned skip = regionRowSkip[static_cast<unsigned>(row)] + static_cast<unsigned>(column);
    while (skip >= kRegionRuns[run * 2 + 1]) {
        skip -= kRegionRuns[run * 2 + 1];
        ++run;
    }
    unsigned area = kRegionAreaOfValue[kRegionRuns[run * 2]];
    return area < kRegionAreaCount ? area : kRegionAreaCount;
}

// InitOnce callback: builds the row index, then every marker's area.
BOOL CALLBACK BuildRegionIndex(PINIT_ONCE, void*, void**) {
    unsigned row = 0;
    unsigned cell = 0; // First cell of the current run.
    for (unsigned run = 0; run < kRegionRunCount && row < kRegionGridSize; ++run) {
        unsigned end = cell + kRegionRuns[run * 2 + 1];
        while (row < kRegionGridSize && row * kRegionGridSize < end) {
            regionRowRun[row] = run;
            regionRowSkip[row] = row * kRegionGridSize - cell;
            ++row;
        }
        cell = end;
    }
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        for (unsigned index = 0; index < kCategories[category].count; ++index) {
            markerArea[category][index] = static_cast<unsigned char>(RegionAreaAt(MarkerPosition(category, index), false));
        }
    }
    unsigned counted[kRegionAreaCount + 1] = {};
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        for (unsigned index = 0; index < kCategories[category].count; ++index) {
            ++counted[markerArea[category][index]];
        }
    }
    char line[160];
    sprintf_s(line, "Completion tracker: %u areas in %u groups; markers outside every area: %u",
        kRegionAreaCount, kRegionGroupCount, counted[kRegionAreaCount]);
    Log(line);
    return TRUE;
}

// v0.110: copies the completion state for the filter panel and widget.
bool PywelGetRegionProgress(PywelRegionProgress& progress) {
    InitOnceExecuteOnce(&regionIndexOnce, BuildRegionIndex, nullptr, nullptr);
    memset(&progress, 0, sizeof(progress));
    progress.groupCount = kRegionGroupCount;
    for (unsigned group = 0; group < kRegionGroupCount; ++group) {
        strcpy_s(progress.groups[group], kRegionGroupNames[group]);
    }
    progress.areaCount = kRegionAreaCount;
    for (unsigned area = 0; area < kRegionAreaCount; ++area) {
        strcpy_s(progress.areas[area].name, kRegionAreas[area].name);
        progress.areas[area].group = kRegionAreas[area].group;
    }

    // Where the player is, from the minimap hook.
    float position[3] = {};
    AcquireSRWLockShared(&positionLock);
    bool playerSeen = playerPosition.minimapUpdates > 0;
    memcpy(position, playerPosition.minimap, sizeof(position));
    bool abyss = playerPosition.abyssLayer != 0;
    ReleaseSRWLockShared(&positionLock);
    unsigned here = playerSeen ? RegionAreaAt(position, abyss) : kRegionAreaCount;
    progress.currentArea = here < kRegionAreaCount ? static_cast<int>(here) : -1;

    AcquireSRWLockShared(&statusLock);
    bool started = categoryStatus[0].name[0] != 0;
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        if (!kCategories[category].shown) {
            continue; // Paused categories are not counted.
        }
        bool known = categoryDoneKnown[category];
        progress.saveKnown = progress.saveKnown || known;
        PywelHereCategory hereCount = {};
        for (unsigned index = 0; index < kCategories[category].count; ++index) {
            unsigned area = markerArea[category][index];
            if (area >= kRegionAreaCount || IsDecoyMarker(category, index) ||
                categoryLockedMask[category].Test(index)) {
                continue;
            }
            unsigned done = known && categoryDoneMask[category].Test(index) ? 1u : 0u;
            ++progress.areas[area].total;
            progress.areas[area].done += done;
            if (area == here) {
                ++hereCount.total;
                hereCount.done += done;
            }
        }
        if (hereCount.total > 0 && progress.hereCategoryCount < kPywelMaxHereCategories) {
            strcpy_s(hereCount.name, categoryStatus[category].name);
            progress.hereCategories[progress.hereCategoryCount++] = hereCount;
        }
    }
    ReleaseSRWLockShared(&statusLock);
    return started;
}

// v0.104 (src/pywel-atlas/RouteSystem.h): copies the spots a route may visit
// (routeCandidates, set by UpdateMarkers). A spot is on the Abyss layer when
// it lies above the game's Abyss altitude threshold (global 0x6cde048, the
// value the minimap compares the player's height with for +0x569).
unsigned PywelGetRouteStops(PywelRouteStop* stops, unsigned capacity) {
    float altitude = 0.0f;
    if (!stops || !imageBase ||
        !Read(reinterpret_cast<const void*>(imageBase + 0x6cde048), &altitude, sizeof(altitude))) {
        return 0;
    }
    unsigned count = 0;
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        MarkerMask routable = LoadMask(routeCandidates[category]);
        for (unsigned index = 0; index < kCategories[category].count && count < capacity; ++index) {
            if (!routable.Test(index)) {
                continue;
            }
            const float* position = MarkerPosition(category, index);
            stops[count++] = {position[0], position[1], position[2], category, index, position[1] > altitude,
                MarkerName(category, index)};
        }
    }
    return count;
}

// v0.104: our own marker icon for a stop on this map (game thread only: it
// calls the game's lookup), checked to be exactly ours; null otherwise.
void* PywelFindMarkerIcon(void* controller, bool world, unsigned category, unsigned index) {
    if (!controller || category >= kCategoryCount || index >= kCategories[category].count) {
        return nullptr;
    }
    const MapSide& side = world ? worldSide : minimapSide;
    if (!*side.lookup) {
        return nullptr;
    }
    const MarkerCategory& kind = kCategories[category];
    NumericTag tag = {};
    tag.key = kind.keyBase + index;
    tag.kind = 0x15;
    DWORD lookupIndex = MarkerIndex(side, category, index);
    void* icon = (*side.lookup)(controller, &kind.type, &tag, &lookupIndex);
    return IsCategoryMarker(icon, category, index) ? icon : nullptr;
}

// v0.104: route settings changed; the worker saves filters.ini soon.
void PywelRequestFiltersSave() {
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
