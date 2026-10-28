// IconDefinitions.cpp - reading the game's map icon definitions (v0.122 split).
//
// What this file does:
// - Reads (never writes) the game's tables of map icon types, to check that
//   each icon type our markers use still looks exactly as studied before it
//   is used, and finds the parent and look ("presentation") a new icon needs.
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

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
// gimmick icons, 0x20 for the Abyss Nexus icon). v0.105: an expected template
// id of 0 (cresset icon, id not traced yet) accepts the loaded id, but the
// template name and group must still match exactly.
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
        (expectedTemplate == 0 || secondary == expectedTemplate) && secondary < templates.count &&
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
// icon (Bell 360, Greymane Shrine 186, Abyss Nexus 234, v0.88 Sealed Abyss
// Artifact 187, v0.97 Abyss-island Nexus 234 too). The game loads a definition only once
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
        // v0.105: also the cresset icons, to learn their template ids.
        // 0.29.0: and the item icons, for the Memory Fragment icon's (222).
        if (!strstr(name, "Gimmick") && !strstr(name, "Treasure") &&
            !strstr(name, "Pin_Marker") && !strstr(name, "StandStone") && !strstr(name, "Item")) {
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

} // namespace pywel_map
