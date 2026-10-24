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
//
// v0.122: this file used to hold the whole map part (4,700 lines). It was
// split into files by job, with no change in what the code does
// (research/scripts/check_map_split.py checks that code was only moved).
// This file now holds the worker thread (Run, Drain, the keys). The others:
//   MapMarkerShared.h   shared types, settings (kCategories) and declarations
//   MapHooks.cpp        shared state, the icon hooks, the proof chest, Log
//   MapCategories.cpp   marker names, positions, masks, "is this ours" checks
//   MarkerService.cpp   creating and removing markers on the map thread,
//                       with MapTooltips.h, MapKnowledgeCard.h, MarkerIconSize.h
//   MarkerState.cpp     filters.ini, done / locked masks, UpdateMarkers
//   IconDefinitions.cpp reading the game's icon definition tables
//   MapDiagnostics.cpp  zoom and world-create logging (diagnostics only)
//   MinimapMarkers.cpp  the minimap hook and the player position
//   MapPublicApi.cpp    the Pywel* functions other parts call, and DllMain
//   ("DllMain at the bottom" and "this file" in the notes above now mean
//   these files together.)
#include "MapMarkerShared.h"

namespace pywel_map {

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
    Log("Pywel Atlas combined v0.122 map markers (v0.122: no map-marker change (map code split into files); v0.121: no map-marker change (route line on its own canvases); v0.120: our markers share one zoom size curve (the Sealed Abyss Artifact's: 1.0 zoomed in to 0.7 zoomed out) instead of each icon type's own, so they stay the same size while zooming; v0.119: markers on / off keys rebindable in the panel's Keys section, keybinds.ini saved here; v0.118: no map-marker change (route line fixes only); v0.117: our markers' pictures get the class \"pywel-marker\" so the UI add-on v0.84 can give every category the same visible size (the game's own icons unchanged); markers load all at once: while any are missing, each map update checks every marker and creates as many as fit in 3 ms, instead of one per update; v0.116: no map-marker change (completion widget default place only); v0.115: route line on the minimap's own canvas too, called after each minimap update; v0.114: Constellation markers (13, game test icon type 409 with the Pywel Atlas star picture from the UI add-on v0.82, hidden once their challenge mission is completed); v0.113: no map-marker change (completion widget placement only); v0.112: unique gear markers open a knowledge card (item name, picture, stats, description) like the chests, and their label is just the item name; Defense Efficiency stat rows get the guard icon (UI add-on v0.81); v0.111: route line on the world map's own canvas, called after each world-map update; v0.110: completion tracker: per-region collected counts for the filter panel and the always-on widget (game regions, region-map.h), widget place and options in filters.ini; v0.109: chest card stat lines restyled like the inventory tooltip (style 3: two-column stat rows with stat icons, effect lines in the buff style with their own game icon, needs UI add-on v0.80), no blank lines; Vigor effect fixed (buff levels matched by number); v0.108: unique gear markers (chest icon type 226, 43 one-of-a-kind items, hidden once collected: reward items when their reward stage is completed, ground and quest items when picked up); v0.107: route line drawn with small stop dots and hidden on the world map while a knowledge card is open (route files only); Abyss Cresset hover text is just \"Abyss Cresset\"; v0.106: chest and Abyss chest knowledge cards list the item base stats (Attack, Defense, stat levels, gear effects) in the inventory tooltip font, siphon gear with a one-line explanation; v0.105: Abyss Cresset markers (game icon type 340, 101 cressets, hidden once their challenge mission is completed; F8 catalogue also lists the StandStone icons); v0.104: route line support: route stops (spots shown and not done, unknown or quest-locked) and read-only world-map and minimap view copies for the route overlay; v0.103: chest and Abyss chest card icons get a size class (pywel-icon-60..90, drawn by the UI add-on v0.79) so they look about the same size; v0.102: Abyss chest labels name their item; Abyss chests open the knowledge card (item, description, also-contains, item icon); v0.101: Abyss chests behind a quest stay hidden until it is done (quest pass over QuestSaveData); chest card picture via the name-copy hook 0x3d5f80, since 0x388e00 differed in memory; v0.100: chest knowledge cards show the item's inventory icon (stringinfo row swap at the card's picture lookup, name-checked); v0.99: Hernand strongbox 1 (sliding jigsaw) is an empty decoy: no marker, not counted; v0.98: our knowledge cards get their whole description as markup, one line per part with real line breaks (artifact steps and reward, recipe lines); v0.97: Abyss-island Nexus markers use the surface Nexus icon (type 234; type 235 followed the map camera); v0.96: knowledge card markup observation, logs only (format-text 0x647cb0, set-markup 0x3ed7f90 inside the card layout); v0.95: Abyss-island Nexus markers (type 235, 51 on the Abyss map, hidden once activated; the 2 Nexuses at Kliff's houses join the surface Nexuses, now 215); v0.94: lines inside a card paragraph joined with a middle dot (the card shows no line breaks); v0.93: Sealed Abyss Artifact markers open a knowledge card (challenge name, steps, reward); v0.92: chest card description as two paragraphs (item type, item text), no markup, generic chest paragraph blanked; v0.91: chest markers with a known item open the map's knowledge card (Treasure Chest card, item name as title, type and item description); v0.90: Sealed Abyss Artifact save read fixed (it rejected saves with two field containers, so every artifact was unknown); v0.89: knowledge card observation, logs only: focus fields, card fill, knowledge key, card layout texts; v0.88: Sealed Abyss Artifact markers (type 187, 141 artifacts, hidden once picked up; tooltip with the artifact's name); v0.87: chest contents on a second map-label line through <br>; v0.86: map tooltip texts on one line; Bells and Nexuses show their name only; v0.85: map tooltips for our markers (chest contents, Bell/shrine names, Nexus) through the game's own map label; v0.84: map tooltip observation, phase 0: logs tooltip text requests and map focus changes, no visible change; v0.83: Abyss Nexus markers turned off in the panel or with F10 are hidden with the game's own hide-reason function (bit 23) instead of removed, and shown again when turned on; read-only observation: layer settings of our icon types, hide bits of our world-map markers right after creation, Abyss Nexus hide-bit changes by name, 4 watched Nexus, 2 chest and 2 Abyss chest markers per round at 3 s / 10 s and on layer changes, with picture objects, container-list check and raw copies; markers on the world map and the minimap; surface Abyss Nexus markers (game icon type 234) until activated; minimap markers created with their own number and adopted once the game has built them; Greymane Shrine markers on, world map needs the Shrine Icons file mod; F8 lists icon types with a world-map look; game type 186/40/41 creations logged, our own markers left out of the sample list) - one native Bell icon (type 360) per not-completed Bell, one chest icon (type 226) per not-opened chest of the game's dedicated chest levels, caves/dungeons, puzzle strongboxes and house chests (190 chests; strongboxes from the save's field-object list, unknown ones hidden) and one chest icon (type 226) per not-opened Abyss chest (74, Abyss map layer) in the detected save, shown at every map zoom (zoom limit off on our own markers only); Greymane Shrine markers on (game shrine icon, type 186); up to 256 markers per category, checked 32 per map update (all of them while any are missing); F10 hides all, F6 shows again. A failed marker is retried every 5 s without blocking others. Observation: zoom windows per icon type, map zoom on F8, player position from the minimap, world-create records (ours and the game's own shrine/Bell icons)");
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
    // v0.84: map tooltips, phase 0 (logs only); v0.85: phase 1, our text
    // for our markers (see MapTooltips.h).
    InstallTooltipHook(base);
    InstallCardHooks(base);
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
    // v0.109: room for every category (9 since v0.108 overflowed 160 bytes and
    // strcat_s stopped the game at start-up).
    char filterLine[512] = "Filter panel choices:";
    AcquireSRWLockExclusive(&statusLock);
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        PywelMarkerCategoryStatus& panelStatus = categoryStatus[category];
        strcpy_s(panelStatus.name, kPanelNames[category]);
        panelStatus.available = kCategories[category].shown;
        panelStatus.total = RealMarkerCount(category);
        markers.shownLogged[category] = InterlockedCompareExchange(&categoryShown[category], 0, 0) != 0;
        char part[48];
        sprintf_s(part, " %s=%s", kCategories[category].label, markers.shownLogged[category] ? "on" : "off");
        strcat_s(filterLine, part);
    }
    ReleaseSRWLockExclusive(&statusLock);
    Log(filterLine);
    ULONGLONG nextFiltersSave = 0;
    // v0.119: the player's keys from keybinds.ini, logged one action per line
    // (short lines; the category line above once overflowed its buffer).
    unsigned skippedKeyLines = PywelKeybindsLoad();
    for (unsigned action = 0; action < kKeyActionCount; ++action) {
        char keyText[32];
        char keyLine[96];
        PywelFormatKeybind(PywelGetKeybind(static_cast<PywelKeyAction>(action)), keyText, sizeof(keyText));
        sprintf_s(keyLine, "Key: %s = %s", PywelKeyActionLabel(static_cast<PywelKeyAction>(action)), keyText);
        Log(keyLine);
    }
    if (skippedKeyLines) {
        char keyLine[96];
        sprintf_s(keyLine, "keybinds.ini: %u line(s) not understood; their defaults are used.", skippedKeyLines);
        Log(keyLine);
    }
    ULONGLONG nextKeysSave = 0;
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
        // v0.119: save changed keys (Keys section), at most once a second.
        if (GetTickCount64() >= nextKeysSave) {
            if (!PywelKeybindsSaveIfDirty()) {
                Log("keybinds.ini could not be written; trying again in a second.");
            }
            nextKeysSave = GetTickCount64() + 1000;
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
        // v0.119: markers on / off use the player's keys (Keybinds.h; F6 and
        // F10 by default). The f6 / f10 names are kept for the code below.
        f6 = PywelKeybindDown(kKeyMarkersOn);
        f10 = PywelKeybindDown(kKeyMarkersOff);
        // --- F6 / F10 (combined build): turn all markers on / off. ---
        if (focused && f6 && !previousF6 && !markers.enabled) {
            markers.enabled = true;
            Log("Markers turned on (markers-on key); they follow the detected save.");
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
            LogTooltipCounts();
            LogCardCounts();
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

} // namespace pywel_map
