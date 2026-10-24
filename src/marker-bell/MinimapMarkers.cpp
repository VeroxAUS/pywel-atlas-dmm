// MinimapMarkers.cpp - the minimap hook and the player position (v0.122 split).
//
// What this file does (combined build only):
// - Hooks the game's minimap update: it keeps our markers on the minimap,
//   lets the route draw its minimap line, and copies the player's position.
// - Finds the game's minimap icon removal function.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

#ifdef PYWEL_ATLAS_COMBINED
UpdateMinimap originalMinimapUpdate = nullptr;
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
    // v0.104: copy the minimap's view for the route line (read-only).
    if (minimap) {
        PywelRouteCaptureMinimap(controller);
        // v0.115: add the route line to the minimap's own canvas, right after
        // the game's update drew its destination line (RouteCanvas.cpp).
        PywelRouteDrawMinimapCanvas(controller);
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
#endif

} // namespace pywel_map
