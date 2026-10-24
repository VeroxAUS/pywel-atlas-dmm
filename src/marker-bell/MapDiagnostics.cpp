// MapDiagnostics.cpp - map observation for the logs (v0.122 split).
//
// What this file does (combined build only):
// - Records zoom windows per icon type, the map zoom while F8 is active, and
//   why the game refuses a world-map icon (world-create probe), and writes
//   them to native-map-categories.log (LogZoomAndPosition).
// - Diagnostics only: nothing here changes the map. v0.129: compiled only in
//   the development builds (PYWEL_ATLAS_DEV); the release build leaves the
//   whole file out, and its callers skip these calls.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

#if defined(PYWEL_ATLAS_COMBINED) && defined(PYWEL_ATLAS_DEV)

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
        // First 3 tries per marker; only the first for the large categories
        // (190 chests, 74 Abyss chests, 215 Nexuses, v0.88 141 artifacts,
        // v0.95 51 island Nexuses, v0.105 101 cressets, v0.114 13 constellations).
        watched = InterlockedIncrement(&createOursLogged[category][index]) <=
            (category == kChestCategory || category == kAbyssChestCategory || category == kNexusCategory ||
                    category == kArtifactCategory || category == kIslandNexusCategory ||
                    category == kCressetCategory || category == kConstellationCategory
                ? 1
                : 3);
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

} // namespace pywel_map
