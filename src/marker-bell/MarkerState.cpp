// MarkerState.cpp - deciding which markers should show (v0.122 split).
//
// What this file does (combined build only):
// - The filter panel's choices and their file filters.ini.
// - Reads the detected save's result per category: which markers are done
//   (DoneMask) and which are locked behind a quest (LockedMask).
// - UpdateMarkers (run by the worker): turns those into the "wanted" masks
//   the map thread follows, and the status the panel shows.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

#ifdef PYWEL_ATLAS_COMBINED
volatile LONG categoryShown[kCategoryCount] = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}; // The user's choice (1 = show).
volatile LONG markersEnabled = 1; // Copy of MarkerState::enabled for the panel.
volatile LONG filtersDirty = 0; // A choice or the panel geometry changed; save soon.
SRWLOCK statusLock = SRWLOCK_INIT; // Guards categoryStatus and panelGeometry.
PywelMarkerCategoryStatus categoryStatus[kCategoryCount] = {};
// v0.110: completion tracker. Per category, the markers the save marks as
// done and those locked behind a quest (not counted), copied in
// UpdateMarkers for PywelGetRegionProgress. Guarded by statusLock.
MarkerMask categoryDoneMask[kCategoryCount] = {};
MarkerMask categoryLockedMask[kCategoryCount] = {};
bool categoryDoneKnown[kCategoryCount] = {};
float panelGeometry[4] = {}; // x, y, width, height as screen fractions.
bool panelGeometryKnown = false;
// v0.110: the always-on completion widget's place (screen fractions) and
// options. Guarded by statusLock.
PywelHudSettings hudSettings = {false, 0.0f, 0.0f, 0.0f, true, false};

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
        // v0.104: route choices (route=, routeStops=, ...).
        PywelRouteLoadSetting(line, value);
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
        // v0.110: the completion widget ("hud=x,y,width", "hudShown=", "hudExpanded=").
        if (strcmp(line, "hud") == 0 &&
            sscanf_s(value, "%f,%f,%f", &geometry[0], &geometry[1], &geometry[2]) == 3 &&
            geometry[0] >= 0.0f && geometry[0] < 1.0f && geometry[1] >= 0.0f && geometry[1] < 1.0f &&
            geometry[2] > 0.0f && geometry[2] <= 1.0f) {
            AcquireSRWLockExclusive(&statusLock);
            hudSettings.known = true;
            hudSettings.x = geometry[0];
            hudSettings.y = geometry[1];
            hudSettings.width = geometry[2];
            ReleaseSRWLockExclusive(&statusLock);
        }
        bool hudShown = strcmp(line, "hudShown") == 0;
        bool hudExpanded = strcmp(line, "hudExpanded") == 0;
        if ((hudShown || hudExpanded) && (value[0] == '0' || value[0] == '1')) {
            AcquireSRWLockExclusive(&statusLock);
            (hudShown ? hudSettings.shown : hudSettings.expanded) = value[0] == '1';
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
    PywelRouteWriteSettings(file); // v0.104: route choices.
    AcquireSRWLockShared(&statusLock);
    bool known = panelGeometryKnown;
    float geometry[4];
    memcpy(geometry, panelGeometry, sizeof(geometry));
    PywelHudSettings hud = hudSettings;
    ReleaseSRWLockShared(&statusLock);
    if (known) {
        fprintf(file, "panel=%.4f,%.4f,%.4f,%.4f\n", geometry[0], geometry[1], geometry[2], geometry[3]);
    }
    // v0.110: the completion widget.
    if (hud.known) {
        fprintf(file, "hud=%.4f,%.4f,%.4f\n", hud.x, hud.y, hud.width);
    }
    fprintf(file, "hudShown=%d\nhudExpanded=%d\n", hud.shown ? 1 : 0, hud.expanded ? 1 : 0);
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
    } else if (category == kIslandNexusCategory) {
        // v0.95: Abyss-island Nexuses: the surface Nexus rule (field pass).
        static_assert(_countof(loaded.bell.islandNexusActivatedMask) == kMaskWords, "Nexus mask size must match");
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.islandNexusActivatedMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.islandNexusUnknownMask[word]);
        }
    } else if (category == kArtifactCategory) {
        // v0.88: Sealed Abyss Artifacts: done = picked up (their own pass);
        // that pass failing makes the whole category unknown, and single
        // undecided artifacts are unknown and get no marker.
        static_assert(_countof(loaded.bell.artifactPickedUpMask) == kMaskWords, "Artifact mask size must match");
        valid = saveValid && loaded.bell.artifactsValid;
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.artifactPickedUpMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.artifactUnknownMask[word]);
        }
    } else if (category == kCressetCategory) {
        // v0.105: Abyss Cressets: done = challenge mission completed (quest
        // pass); that pass failing makes the whole category unknown, and a
        // cresset whose mission has no record is unknown and gets no marker.
        static_assert(_countof(loaded.bell.cressetDoneMask) == kMaskWords, "Cresset mask size must match");
        valid = saveValid && loaded.bell.questsValid;
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.cressetDoneMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.cressetUnknownMask[word]);
        }
    } else if (category == kConstellationCategory) {
        // v0.114: Constellations: the cressets' rule (quest pass, mission
        // completed = done, no record = unknown and no marker).
        static_assert(_countof(loaded.bell.constellationDoneMask) == kMaskWords, "Constellation mask size must match");
        valid = saveValid && loaded.bell.questsValid;
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.constellationDoneMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.constellationUnknownMask[word]);
        }
    } else if (category == kUniqueGearCategory) {
        // v0.108: unique gear: reward items from the quest pass (stage
        // completed), ground and quest items from the field pass (picked
        // up). A failed pass makes its items unknown: no marker.
        static_assert(_countof(loaded.bell.uniqueGearCollectedMask) == kMaskWords, "Unique gear mask size must match");
        for (unsigned word = 0; word < kMaskWords; ++word) {
            done.words[word] = static_cast<LONG>(loaded.bell.uniqueGearCollectedMask[word]);
            unknown.words[word] = static_cast<LONG>(loaded.bell.uniqueGearUnknownMask[word]);
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

// v0.101: Abyss chests behind a quest gate (chest-links.h kChestGates). A
// chest is "locked" (no marker, not counted as done) when its gate is closed
// and the save has neither a seen nor an opened record for it; such a record
// always wins (and, with the gate closed, is a rule mismatch). If the quest
// pass failed, every gated chest without such a record is unknown (hidden).
MarkerMask LockedMask(unsigned category, const LoadedSaveBell& loaded, MarkerMask& unknown, MarkerMask& mismatch) {
    MarkerMask locked = {};
    if (category != kAbyssChestCategory) {
        return locked;
    }
    for (unsigned index = 0; index < kCategories[category].count; ++index) {
        uint8_t gate = kAbyssChestLinks[index].gate;
        if (gate == kNoChestGate) {
            continue;
        }
        unsigned bit = 1u << (index % 32);
        bool recorded = ((loaded.bell.abyssChestSeenMask[index / 32] | loaded.bell.abyssChestOpenedMask[index / 32]) & bit) != 0;
        if (!loaded.bell.questsValid) {
            if (!recorded) {
                unknown.Set(index);
            }
            continue;
        }
        bool open = (loaded.bell.gateOpenMask >> gate) & 1u;
        if (!open && recorded) {
            mismatch.Set(index);
        } else if (!open) {
            locked.Set(index);
        }
    }
    return locked;
}

// v0.101, worker: logs the quest-locked chests and any rule mismatch when
// they (or the quest pass result) change.
void LogQuestLocks(unsigned category, const LoadedSaveBell& loaded, const MarkerMask& locked,
    const MarkerMask& mismatch) {
    static MarkerMask lastLocked[kCategoryCount] = {};
    static MarkerMask lastMismatch[kCategoryCount] = {};
    static int lastValid[kCategoryCount] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
    if (category != kAbyssChestCategory) {
        return;
    }
    int questsValid = loaded.bell.questsValid ? 1 : 0;
    if (locked.Same(lastLocked[category]) && mismatch.Same(lastMismatch[category]) && questsValid == lastValid[category]) {
        return;
    }
    lastLocked[category] = locked;
    lastMismatch[category] = mismatch;
    lastValid[category] = questsValid;
    char names[640];
    char line[1100];
    MarkerNames(category, locked, names);
    sprintf_s(line, "%ss: locked by quest (hidden, not counted as done) %u [%s]; quest pass %s%s (gates open mask 0x%x)",
        kCategories[category].label, locked.Count(), names, questsValid ? "ok" : "failed: ",
        questsValid ? "" : loaded.bell.questError, loaded.bell.gateOpenMask);
    Log(line);
    if (mismatch.Count()) {
        MarkerNames(category, mismatch, names);
        sprintf_s(line, "%ss: rule mismatch, gate closed but the save has a seen/opened record (kept as the save says) %u [%s]",
            kCategories[category].label, mismatch.Count(), names);
        Log(line);
    }
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
        MarkerMask mismatch = {};
        MarkerMask locked = valid ? LockedMask(category, loaded, unknown, mismatch) : MarkerMask{};
        MarkerMask all = {};
        for (unsigned index = 0; index < kind.count; ++index) {
            // v0.99: decoys are never wanted, hidden or counted.
            if (!IsDecoyMarker(category, index)) {
                all.Set(index);
            }
        }
        MarkerMask wanted = current.wanted;
        if ((!state.enabled || !chosen) && !hideByChoice) {
            wanted = {};
        } else if (valid) {
            // Show every spot the save does NOT explicitly mark as done,
            // except spots whose state is unknown (v0.68) or that are locked
            // behind a quest (v0.101).
            for (unsigned word = 0; word < kMaskWords; ++word) {
                wanted.words[word] = all.words[word] & ~done.words[word] & ~unknown.words[word] & ~locked.words[word];
            }
            LogQuestLocks(category, loaded, locked, mismatch);
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
        // v0.104: route stops follow the same rule as shown markers, but
        // never keep stale spots while the result is unknown.
        MarkerMask routable = {};
        if (state.enabled && chosen && valid) {
            for (unsigned word = 0; word < kMaskWords; ++word) {
                routable.words[word] = all.words[word] & ~done.words[word] & ~unknown.words[word] & ~locked.words[word];
            }
        }
        StoreMask(routeCandidates[category], routable);
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
                // v0.90: artifacts report their own pass, (v0.105) cressets
                // the quest pass, the others the chest field pass; (v0.108)
                // unique gear the quest pass if it failed, else the field pass;
                // (v0.114) constellations the quest pass.
                bool artifacts = category == kArtifactCategory;
                bool cressets = category == kCressetCategory || category == kConstellationCategory ||
                    (category == kUniqueGearCategory && !loaded.bell.questsValid);
                bool passValid = artifacts ? loaded.bell.artifactsValid
                    : cressets ? loaded.bell.questsValid : loaded.bell.chestFieldValid;
                const char* passError = artifacts ? loaded.bell.artifactError
                    : cressets ? loaded.bell.questError : loaded.bell.chestFieldError;
                sprintf_s(line, "Detected save serial=%u readSlot=%u %ss: unknown (hidden, not counted as done) %u [%s]; %s pass %s (%s)",
                    loaded.serial, loaded.readSlot, kind.label, unknownMask.Count(), names,
                    artifacts ? "artifact" : cressets ? "quest" : "field", passValid ? "ok" : "failed",
                    passError[0] ? passError : "unexpected record");
                Log(line);
            }
            current.known = true;
            current.unknownLogged = false;
            current.serial = loaded.serial;
            current.readSlot = loaded.readSlot;
        } else if (!valid && saveValid && (changedRead || !current.unknownLogged)) {
            // The save read was accepted but this category's pass failed.
            // v0.90: each pass has its own error text (artifacts their own).
            const char* passError = category == kArtifactCategory ? loaded.bell.artifactError
                : category == kCressetCategory || category == kConstellationCategory ? loaded.bell.questError
                                                                                     : loaded.bell.shrineError;
            sprintf_s(line, "Detected save serial=%u readSlot=%u: %s result unknown (%s); keeping current markers, creating none.",
                loaded.serial, loaded.readSlot, kind.label, passError[0] ? passError : "no reason given");
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
            status.locked = locked.Count(); // v0.101.
            categoryDoneMask[category] = hiddenMask; // v0.110: completion tracker.
            categoryLockedMask[category] = locked;
            categoryDoneKnown[category] = true;
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
    char line[1200]; // v0.114: was 640, too small for a full `parts` (1024).

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
    // v0.109: room for all 9 categories (each part is up to about 60 bytes);
    // v0.114: 10 categories, and `line` above holds all of parts plus its prefix.
    char parts[1024] = {};
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

} // namespace pywel_map
