// MapCategories.cpp - looking up our markers (v0.122 split).
//
// What this file does:
// - Small memory helpers (Read, CopyDefinition).
// - Per marker category (Bells, chests, Abyss Nexuses and so on; the table
//   kCategories is in MapMarkerShared.h): marker names and game positions,
//   the bit masks (one bit per marker) shared between threads, and checks
//   that an icon on the map really is one of ours (private key, type, place).
// Moved unchanged from NativeMapCategoryProbe.cpp in v0.122.
#include "MapMarkerShared.h"

namespace pywel_map {

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

// v0.99: a chest row flagged "decoy" (a placed chest that holds nothing, e.g.
// Hernand strongbox 1) keeps its row but is never marked or counted.
bool IsDecoyMarker(unsigned category, unsigned index) {
    return category == kChestCategory && kChestLinks[index].decoy;
}

// Markers a category really has: its rows minus decoys (filter panel total).
unsigned RealMarkerCount(unsigned category) {
    unsigned count = 0;
    for (unsigned index = 0; index < kCategories[category].count; ++index) {
        count += IsDecoyMarker(category, index) ? 0u : 1u;
    }
    return count;
}

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
    if (category == kArtifactCategory) {
        return kArtifactLinks[index].name;
    }
    if (category == kIslandNexusCategory) {
        return kIslandNexusLinks[index].name;
    }
    if (category == kCressetCategory) {
        return kCressetLinks[index].name;
    }
    if (category == kUniqueGearCategory) {
        return kUniqueGearLinks[index].name;
    }
    if (category == kConstellationCategory) {
        return kConstellationLinks[index].name;
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
    if (category == kArtifactCategory) {
        return kArtifactLinks[index].position;
    }
    if (category == kIslandNexusCategory) {
        return kIslandNexusLinks[index].position;
    }
    if (category == kCressetCategory) {
        return kCressetLinks[index].position;
    }
    if (category == kUniqueGearCategory) {
        return kUniqueGearLinks[index].position;
    }
    if (category == kConstellationCategory) {
        return kConstellationLinks[index].position;
    }
    return category == kShrineCategory ? kShrineLinks[index].position : kChestLinks[index].position;
}

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

} // namespace pywel_map
