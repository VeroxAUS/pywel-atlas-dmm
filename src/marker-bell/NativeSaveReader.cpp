// NativeSaveReader.cpp - read the game's save file (never write it) and report
// Bells and (v0.56) Greymane Shrines.
//
// What this file does, in order:
// 1. Finds the save file: %LOCALAPPDATA%\Pearl Abyss\CD\save\<steam id>\slot<N>\save.save.
// 2. Reads it twice, a moment apart, and only continues if both copies match
//    (so we never decode a file the game is in the middle of writing).
// 3. Decodes the file "envelope": decrypts it (ChaCha20, a standard cipher),
//    verifies it was not altered or corrupted (HMAC-SHA256, a keyed checksum),
//    and decompresses it (LZ4, a fast compression format).
// 4. Walks the decoded "reflection" data. Reflection data here means the save
//    describes its own layout: it first lists every type name and field name,
//    then stores objects using that list. We use the list to find one specific
//    container of discovered "level gimmick" records and skip everything else.
// 5. Matches those records against the known Bells (from bell-proof-links.h) by
//    their UUID (a 16-byte unique ID for each object placed in the game world)
//    and a numeric type key, and notes which are recorded and which completed.
//    v0.58: the same records also cover treasure chests from the game's
//    dedicated chest levels and (v0.59) caves and dungeons (chest-links.h,
//    type key 1000007 "TreasureBox"), and (v0.69) the Abyss chests, and
//    (v0.79) which surface Abyss Nexuses are discovered (nexus-links.h, type
//    key 1000001 "AbyssRuins_Field"; v0.95: also the 2 at Kliff's houses,
//    key 1000053 "AbyssRuins_Housing"), and (v0.95) which Abyss-island
//    Nexuses are discovered (island-nexus-links.h, type key 1000008 or
//    1000114, one per row).
// 6. v0.56: walks the same decoded data a second, separate time, this time
//    only the player's "knowledge" list, and notes which Greymane Shrines the
//    save records as found (knowledge entry at level 2; shrine-links.h). If
//    that pass fails, shrines are reported as unknown and Bells are unaffected.
// 7. v0.68: a third separate walk reads only the field-object list (objects
//    placed in the world whose state the game remembers) and notes which
//    puzzle strongboxes and surface itemboxes are opened, and (v0.79) which
//    Abyss Nexuses are activated (v0.95: also the Abyss-island Nexuses). If
//    that pass fails, those boxes and the Nexuses are reported as unknown;
//    Bells and other chests are unaffected.
// 7b. v0.88: a fourth separate walk of the same field-object list notes which
//    Sealed Abyss Artifacts are picked up (artifact-links.h). If it fails,
//    only the artifacts are reported as unknown.
// 8. Writes a small JSON report and a diagnostic copy of the save into the mod's
//    own folder, and returns a summary to NativeMapCategoryProbe.cpp.
// It also contains the F9 save-slot chooser and the remembered-slot loader.
//
// Native read-only save envelope/reflection reader, scoped to verified Bells.
// Save format interpretation is adapted from LukeFZ/pycrimson (MIT; bundled
// license). Only authenticated snapshots can produce completion confirmations.
// (If the HMAC check fails, nothing is reported as completed.)
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include "NativeSaveReader.h"
#include <shlobj.h>
#include <bcrypt.h>
#include <algorithm>
#include <array>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <sstream>
#include <stdexcept>
#include <string>
#include <vector>
#include "bell-proof-links.h"
#include "shrine-links.h"
#include "chest-links.h"
#include "nexus-links.h"
#include "island-nexus-links.h"
#include "artifact-links.h"
#include "cresset-links.h"
#include "unique-gear-links.h"
#include "constellation-links.h"
#include "treasure-map-links.h"
#include "legendary-animal-links.h"
#include "memory-fragment-links.h"
#include "sanctum-core-links.h"
#include "kuku-pot-item-links.h"
#include "egg-links.h"

namespace {
// ===========================================================================
// Section: basic helpers and limits
// ===========================================================================

using Bytes = std::vector<uint8_t>;
constexpr size_t kMaximumSave = 32 * 1024 * 1024; // Largest save file accepted on disk (32 MiB).
constexpr size_t kMaximumPlain = 128 * 1024 * 1024; // Largest decompressed size accepted (128 MiB).

// Stop with an error message if `condition` is false. The message is thrown as
// an exception and caught at the public entry points, which copy it to `error`.
void Require(bool condition, const char* message) {
    if (!condition) {
        throw std::runtime_error(message);
    }
}

// Bounds-checked little-endian cursor. Every seek and length is validated;
// unsupported reflection versions/types fail rather than guessing completion.
// (A cursor is a read position that moves forward through a byte buffer.
// "Little-endian" means multi-byte numbers are stored lowest byte first.)
struct Cursor {
    const Bytes& bytes;
    size_t offset = 0; // Current read position.
    size_t limit; // Reads may not go past this position.
    explicit Cursor(const Bytes& input) : bytes(input), limit(input.size()) {}
    // Fail unless `count` more bytes are available before `limit`.
    void Need(size_t count) const {
        Require(offset <= limit && count <= limit - offset, "Truncated save structure.");
    }
    // Return a pointer to the next `count` bytes and move past them.
    const uint8_t* Take(size_t count) {
        Need(count);
        const uint8_t* result = bytes.data() + offset;
        offset += count;
        return result;
    }
    // Read a 1-, 2- or 4-byte unsigned number.
    uint8_t U8() { return *Take(1); }
    uint16_t U16() {
        const uint8_t* value = Take(2);
        return static_cast<uint16_t>(value[0] | (value[1] << 8));
    }
    uint32_t U32() {
        const uint8_t* value = Take(4);
        return static_cast<uint32_t>(value[0]) | (static_cast<uint32_t>(value[1]) << 8) |
            (static_cast<uint32_t>(value[2]) << 16) | (static_cast<uint32_t>(value[3]) << 24);
    }
    // Move past `count` bytes without looking at them.
    void Skip(size_t count) { Take(count); }
    // Read a text string stored as a 4-byte length followed by that many bytes.
    std::string String() {
        uint32_t size = U32();
        Require(size <= 1024 * 1024, "Reflection string exceeds limit.");
        const auto* text = Take(size);
        return std::string(reinterpret_cast<const char*>(text), size);
    }
    // Jump forward (never backward) to `target`, which must stay within `limit`.
    void SeekForward(size_t target) {
        Require(target >= offset && target <= limit, "Invalid reflection object offset.");
        offset = target;
    }
};

// Read a little-endian 4-byte number from raw memory.
uint32_t Load32(const uint8_t* value) {
    return static_cast<uint32_t>(value[0]) | (static_cast<uint32_t>(value[1]) << 8) |
        (static_cast<uint32_t>(value[2]) << 16) | (static_cast<uint32_t>(value[3]) << 24);
}

// ===========================================================================
// Section: decrypt (ChaCha20)
// ChaCha20 is a standard stream cipher: it turns a 32-byte key and a nonce
// (a per-file "number used once") into a stream of pseudo-random bytes, which
// are XOR-ed with the encrypted bytes to recover the original bytes.
// ===========================================================================

// Rotate the bits of a 32-bit number left by `bits` (a ChaCha20 building block).
uint32_t Rotate(uint32_t value, unsigned bits) {
    return (value << bits) | (value >> (32 - bits));
}

// The ChaCha20 "quarter round": mixes four 32-bit words together.
void Quarter(uint32_t& a, uint32_t& b, uint32_t& c, uint32_t& d) {
    a += b;
    d = Rotate(d ^ a, 16);
    c += d;
    b = Rotate(b ^ c, 12);
    a += b;
    d = Rotate(d ^ a, 8);
    c += d;
    b = Rotate(b ^ c, 7);
}

// Decrypt `size` bytes from `input` using `key` and the 16-byte `nonce`.
// Works in 64-byte blocks; the block counter increases by one per block.
Bytes Decrypt(const uint8_t* input, size_t size, const uint8_t* nonce,
    const std::array<uint8_t, 32>& key) {
    // Original ChaCha20: 64-bit counter then 64-bit nonce, as used by the
    // existing reader's cryptography.ChaCha20 16-byte nonce ABI (not IETF AEAD).
    // (The 16 nonce bytes fill state words 12..15. Words 12..13 act as the block
    // counter, matching the Python "cryptography" library's ChaCha20 layout.
    // The first four constants spell "expand 32-byte k", as the standard requires.)
    uint32_t state[16] = {0x61707865, 0x3320646e, 0x79622d32, 0x6b206574};
    for (unsigned word = 0; word < 8; ++word) {
        state[4 + word] = Load32(key.data() + word * 4);
    }
    for (unsigned word = 0; word < 4; ++word) {
        state[12 + word] = Load32(nonce + word * 4);
    }
    Bytes output(size);
    for (size_t start = 0; start < size; start += 64) {
        uint32_t block[16];
        memcpy(block, state, sizeof(block));
        // 10 double rounds = the standard 20 rounds of ChaCha20.
        for (unsigned round = 0; round < 10; ++round) {
            Quarter(block[0], block[4], block[8], block[12]);
            Quarter(block[1], block[5], block[9], block[13]);
            Quarter(block[2], block[6], block[10], block[14]);
            Quarter(block[3], block[7], block[11], block[15]);
            Quarter(block[0], block[5], block[10], block[15]);
            Quarter(block[1], block[6], block[11], block[12]);
            Quarter(block[2], block[7], block[8], block[13]);
            Quarter(block[3], block[4], block[9], block[14]);
        }
        for (unsigned word = 0; word < 16; ++word) {
            block[word] += state[word];
        }
        for (size_t index = 0; index < 64 && start + index < size; ++index) {
            uint8_t stream = static_cast<uint8_t>(block[index / 4] >> ((index % 4) * 8));
            output[start + index] = input[start + index] ^ stream;
        }
        // Advance the 64-bit block counter (low word, then carry into high word).
        if (++state[12] == 0) {
            ++state[13];
        }
    }
    return output;
}

// ===========================================================================
// Section: verify (HMAC-SHA256)
// An HMAC is a checksum that can only be computed with the key. If our
// checksum of the decrypted bytes matches the one stored in the file, the
// data is genuine and complete. Windows' own crypto library (BCrypt) does it.
// ===========================================================================

// Throw unless HMAC-SHA256(key, plain) equals the 32-byte `signature`.
void Authenticate(const Bytes& plain, const std::array<uint8_t, 32>& key,
    const uint8_t* signature) {
    BCRYPT_ALG_HANDLE algorithm = nullptr;
    BCRYPT_HASH_HANDLE hash = nullptr;
    NTSTATUS status = BCryptOpenAlgorithmProvider(&algorithm, BCRYPT_SHA256_ALGORITHM,
        nullptr, BCRYPT_ALG_HANDLE_HMAC_FLAG);
    Require(status >= 0, "Windows HMAC provider unavailable.");
    std::array<uint8_t, 32> digest = {};
    status = BCryptCreateHash(algorithm, &hash, nullptr, 0,
        const_cast<PUCHAR>(key.data()), static_cast<ULONG>(key.size()), 0);
    if (status >= 0) {
        status = BCryptHashData(hash, const_cast<PUCHAR>(plain.data()),
            static_cast<ULONG>(plain.size()), 0);
    }
    if (status >= 0) {
        status = BCryptFinishHash(hash, digest.data(), static_cast<ULONG>(digest.size()), 0);
    }
    if (hash) {
        BCryptDestroyHash(hash);
    }
    BCryptCloseAlgorithmProvider(algorithm, 0);
    Require(status >= 0, "Windows HMAC calculation failed.");
    // Compare all 32 bytes without stopping early at the first difference.
    unsigned different = 0;
    for (unsigned index = 0; index < digest.size(); ++index) {
        different |= digest[index] ^ signature[index];
    }
    Require(different == 0, "Save authentication failed; no progress confirmed.");
}

// ===========================================================================
// Section: decompress (LZ4)
// LZ4 stores data as "literals" (bytes copied as-is) and "matches" (copy N
// bytes from earlier in the output). Every length is checked against limits.
// ===========================================================================

// Decompress LZ4 block data in `input`; the result must be exactly `expected` bytes.
Bytes Expand(const Bytes& input, size_t expected) {
    // Independent bounded decoder of the LZ4 block format. Match copying must
    // permit overlap. Format: https://github.com/lz4/lz4/blob/dev/doc/lz4_Block_format.md
    // ("Overlap" = a match may copy bytes it has only just written, so copy one
    // byte at a time rather than with memcpy.)
    Cursor reader(input);
    Bytes output;
    output.reserve(expected);
    // LZ4 length rule: a 4-bit value of 15 means "keep adding the following
    // bytes until one is not 255".
    auto length = [&](size_t initial) {
        size_t result = initial;
        if (initial == 15) {
            uint8_t extra;
            do {
                extra = reader.U8();
                Require(result <= expected && extra <= expected - result, "LZ4 length overflow.");
                result += extra;
            } while (extra == 255);
        }
        return result;
    };
    while (reader.offset < input.size()) {
        uint8_t token = reader.U8();
        size_t literal = length(token >> 4);
        Require(literal <= expected - output.size(), "LZ4 literal exceeds output.");
        const uint8_t* start = reader.Take(literal);
        output.insert(output.end(), start, start + literal);
        if (reader.offset == input.size()) {
            break;
        }
        size_t distance = reader.U16();
        Require(distance > 0 && distance <= output.size(), "Invalid LZ4 match offset.");
        size_t count = length(token & 15) + 4;
        Require(count <= expected - output.size(), "LZ4 match exceeds output.");
        for (size_t index = 0; index < count; ++index) {
            output.push_back(output[output.size() - distance]);
        }
    }
    Require(output.size() == expected, "LZ4 expanded length mismatch.");
    return output;
}

// ===========================================================================
// Section: the save "envelope" (128-byte header + encrypted body)
// ===========================================================================

// Turn the raw save file bytes into the decoded (plain) reflection data.
// Header layout as read below: "SAVE", version (2), header size (128),
// 10 skipped bytes, decompressed size, stored size, 16-byte nonce, 32-byte HMAC.
Bytes Decode(const Bytes& file) {
    Cursor header(file);
    Require(file.size() >= 128 && memcmp(header.Take(4), "SAVE", 4) == 0,
        "Unsupported save magic.");
    uint16_t version = header.U16();
    uint16_t size = header.U16();
    Require(version == 2 && size == 128, "Native proof supports save envelope version 2 only.");
    header.Skip(10);
    uint32_t expanded = header.U32();
    uint32_t compressed = header.U32();
    const uint8_t* nonce = header.Take(16);
    const uint8_t* signature = header.Take(32);
    Require(expanded > 0 && expanded <= kMaximumPlain && compressed > 0 &&
        compressed == file.size() - size, "Save payload size is outside supported bounds.");
    // The key is built by XOR-ing these 31 fixed bytes with the first 31
    // characters of the text below; the 32nd key byte stays zero. The same key
    // is used for both decryption and the HMAC check. (Format adapted from the
    // pycrimson reader credited at the top of this file.)
    constexpr uint8_t base[31] = {
        0xc4,0x1b,0x8e,0x73,0x0d,0xf2,0x59,0xa6,0x37,0xcc,0x04,0xe9,0xb1,0x2f,0x96,0x68,
        0xda,0x10,0x7a,0x85,0x3e,0x61,0xf9,0x22,0x4d,0xb8,0x0a,0xd7,0x5c,0x13,0xef
    };
    const std::string material = "^Pearl--#Abyss__@!!PRIVATE_HMAC_SECRET_CHECK";
    std::array<uint8_t, 32> key = {};
    for (unsigned index = 0; index < 31; ++index) {
        key[index] = base[index] ^ static_cast<uint8_t>(material[index]);
    }
    // Decrypt, then verify, then decompress (only if the sizes say it is compressed).
    Bytes plain = Decrypt(file.data() + size, compressed, nonce, key);
    Authenticate(plain, key, signature);
    return compressed == expanded ? plain : Expand(plain, expanded);
}

// ===========================================================================
// Section: reflection data model
// These structs hold the save's own description of its types, plus what we
// collect about each Bell.
// ===========================================================================

// One field of a reflected type, as described by the save itself.
struct Property {
    std::string name; // Field name, e.g. "_isCompleted".
    std::string typeName; // Field's type name, e.g. "bool" or "uint4".
    uint16_t kind; // How the value is stored (scalar, array, nested object...).
    uint16_t size; // Byte size of one value, for fixed-size kinds.
    uint32_t flags; // Format flags; some values mean "not stored" (see Object()).
};
// One reflected type: its name and its list of fields.
struct Type {
    std::string name;
    std::vector<Property> properties;
};
// One entry of the top-level object table: which type, and where its bytes are.
struct ObjectInfo {
    uint16_t type;
    uint32_t offset;
    uint32_t size;
};
// The fields we pick out of one discovered record while parsing it.
struct Record {
    std::array<uint32_t, 4> uuid = {}; // _sceneObjectUuid (16 bytes).
    uint32_t key = 0; // _levelGimmickSceneObjectInfoKey.
    bool uuidKnown = false;
    bool keyKnown = false;
    bool completed = false; // _isCompleted.
    // Knowledge pass (v0.56): one KnowledgeElementSaveData entry.
    uint32_t knowledgeKey = 0; // _key.
    uint32_t level = 0; // _level (1 = heard of, 2 = found, for shrines).
    bool knowledgeKeyKnown = false;
    bool levelKnown = false;
    // Field pass (v0.68): one FieldGimmickSaveData entry.
    std::array<uint32_t, 4> origin = {}; // _levelOriginSceneObjectUuid.
    uint32_t reason = 0; // _fieldSaveDataReason (1 for the boxes studied).
    uint64_t reset = 0; // _resetTimeSecondsOfDays (largest value = never refills).
    uint32_t stateHash = 0; // _initStateNameHash (closed / opened, see kBoxOpened...).
    bool originKnown = false;
    bool reasonKnown = false;
    bool resetKnown = false;
    bool stateKnown = false;
    // Artifact pass (v0.88): the record's gimmick type, and whether its list
    // of objects removed from the world holds its own origin UUID.
    uint32_t gimmickKey = 0; // _gimmickInfoKey.
    bool gimmickKnown = false;
    std::vector<std::array<uint32_t, 4>> disabled; // _levelOrigin_disabledSceneObjectUuidList.
    // Quest pass (v0.101): one MissionStateData or QuestStateData entry.
    bool quest = false; // A QuestStateData entry (else MissionStateData).
    bool stage = false; // v0.108: a StageStateData entry (_key is a StageKey).
    uint32_t progressKey = 0; // _key (MissionKey or, v0.108, StageKey) or _questKey (QuestKey).
    uint8_t progressState = 0; // _state (QuestStateType; 5 = completed). Absent = 0.
    bool progressKeyKnown = false;
};
// What the save says about one known Bell.
struct BellState {
    bool recorded = false; // A matching record exists in the save.
    bool completed = false; // That record explicitly says completed.
};
// What the save says about one known treasure chest (v0.58).
struct ChestState {
    bool seen = false; // A matching record exists (the player came near).
    bool opened = false; // That record explicitly says completed (opened).
};
// What the field-object list says about one field-rule chest (v0.68).
struct FieldChestState {
    unsigned records = 0; // Matching records (normally 0 or 1).
    bool opened = false; // A record in an opened state.
    bool closed = false; // A record in the closed state.
    bool unexpected = false; // A record unlike any studied one (makes it unknown).
};
// Field-record values from the strongbox save tests (2026-10-22).
constexpr uint32_t kBoxReasonSaved = 1; // _fieldSaveDataReason of every box record seen.
constexpr uint64_t kBoxResetNever = 0xFFFFFFFFFFFFFFFFull; // Refill time "never".
constexpr uint32_t kBoxClosed = 2255254665u; // Closed (also the common initial state).
constexpr uint32_t kBoxOpenedStolen = 353047760u; // Opened with a steal prompt.
constexpr uint32_t kBoxOpenedLooted = 1537827618u; // Opened and looted normally.
// What the field-object list says about one Sealed Abyss Artifact (v0.88).
struct ArtifactState {
    unsigned records = 0; // Matching records (normally 0 or 1).
    bool pickedUp = false; // A record in the studied "picked up" shape.
    bool unexpected = false; // A record unlike that shape (makes it unknown).
};
// What the save says about one known Abyss Cresset (v0.105, quest pass);
// (v0.114) also used for the Constellations and (0.29.0) the Legendary
// Animals, which follow the same rule.
struct CressetState {
    bool recorded = false; // Its challenge mission has a record.
    bool done = false; // That record has state 5 (completed).
};
// v0.108: a ground or quest unique gear item that was picked up has a
// field record with this reason that never resets (the user's saves).
constexpr uint32_t kGearReasonPickedUp = 2;
// What the save says about one known Greymane Shrine.
struct ShrineState {
    bool seen = false; // Its knowledge entry exists (any level).
    bool found = false; // Its knowledge entry is at level 2 or more.
};
// Which part of the save one parse looks at. Each pass is a separate,
// complete parse, so a failure in one never changes the other's result.
enum class Pass {
    Bells, // DiscoveredLevelGimmickSceneObjectSaveData._discoveredLevelGimmickSceneObjectSaveDataList
    Knowledge, // KnowledgeSaveData._list (Greymane Shrines; 0.29.0: Treasure Map pieces)
    Field, // FieldSaveData._fieldGimmickSaveDataList (strongboxes, v0.68)
    Artifacts, // The same list, read again for Sealed Abyss Artifacts (v0.88)
    Quests, // QuestSaveData._missionStateList and _questStateList (chest gates, v0.101), _stageStateData (v0.108)
};
// Mission and quest state that has a completion time in the saves studied.
constexpr uint8_t kProgressCompleted = 5;

// ===========================================================================
// Section: reflection parser
// Walks the decoded data, but descends into only one container type: the
// Bell container ("DiscoveredLevelGimmickSceneObjectSaveData"), for the
// shrine pass the knowledge container ("KnowledgeSaveData") or, for the field
// pass, the field containers ("FieldSaveData"). Everything else is skipped.
// ===========================================================================

// Parses one decoded save. Read() returns one BellState per entry in
// kBellLinks; ReadShrines() returns one ShrineState per entry in kShrineLinks.
class Reflection {
    Cursor reader;
    Pass pass = Pass::Bells; // Which container this parse descends into.
    uint32_t metadata = 0; // Reflection metadata version (3 or 4 supported).
    uint32_t version = 0; // Serialization version (11..15 supported).
    std::vector<Type> types; // The save's type table.
    std::array<BellState, _countof(kBellLinks)> states = {};
    std::array<ShrineState, _countof(kShrineLinks)> shrines = {};
    std::array<ChestState, _countof(kChestLinks)> chests = {};
    std::array<FieldChestState, _countof(kChestLinks)> fieldChests = {};
    std::array<ChestState, _countof(kAbyssChestLinks)> abyssChests = {}; // v0.69.
    std::array<ChestState, _countof(kNexusLinks)> nexuses = {}; // v0.79, Bell pass: discovered.
    std::array<FieldChestState, _countof(kNexusLinks)> fieldNexuses = {}; // v0.79, field pass: activated.
    std::array<ChestState, _countof(kIslandNexusLinks)> islandNexuses = {}; // v0.95, Bell pass: discovered.
    std::array<FieldChestState, _countof(kIslandNexusLinks)> fieldIslandNexuses = {}; // v0.95, field pass.
    std::array<ArtifactState, _countof(kArtifactLinks)> artifacts = {}; // v0.88, artifact pass.
    std::array<bool, kChestGateCount + 1> gatesOpen = {}; // v0.101, quest pass (+1: never zero-sized).
    std::array<CressetState, _countof(kCressetLinks)> cressets = {}; // v0.105, quest pass.
    std::array<CressetState, _countof(kConstellationLinks)> constellations = {}; // v0.114, quest pass.
    std::array<CressetState, _countof(kLegendaryAnimalLinks)> legendaryAnimals = {}; // 0.29.0, quest pass.
    std::array<bool, _countof(kTreasureMapLinks)> treasureMaps = {}; // 0.29.0, knowledge pass: collected.
    std::array<bool, _countof(kMemoryFragmentLinks)> memoryFragments = {}; // 0.29.0, knowledge pass: collected.
    std::array<CressetState, _countof(kSanctumCoreLinks)> sanctumCores = {}; // Quest pass: Witch mission.
    std::array<ArtifactState, _countof(kKukuPotItemLinks)> kukuPotItems = {}; // Artifact pass: taken.
    std::array<ArtifactState, _countof(kEggLinks)> eggs = {}; // Artifact pass: taken.
    // v0.108: unique gear collected: reward rows from the quest pass's stage
    // list, ground and quest rows from the field pass.
    std::array<bool, _countof(kUniqueGearLinks)> uniqueGear = {};
    size_t objectsVisited = 0; // Safety counter against huge or looping data.
    bool listVisited = false; // Did we actually see the list field this pass needs?
    bool questListVisited = false; // Quest pass: the second list (_questStateList).
    bool readingQuestList = false; // Quest pass: entries being read are quest (not mission) entries.
    bool stageListVisited = false; // Quest pass (v0.108): the stage list (_stageStateData).
    bool readingStageList = false; // Quest pass: entries being read are stage entries.

    // Read a 4-byte element count and reject anything above `maximum`.
    uint32_t Count(uint32_t maximum = 1000000) {
        uint32_t count = reader.U32();
        Require(count <= maximum, "Reflection collection exceeds limit.");
        return count;
    }
    // Field pass: note one field-object record's state for a box or Nexus.
    // Only the exact shape seen in the save tests counts; anything else
    // (another reason, a refill timer, no state) makes it unknown.
    static void NoteFieldState(FieldChestState& state, const Record& record) {
        ++state.records;
        bool studied = record.reasonKnown && record.reason == kBoxReasonSaved &&
            record.resetKnown && record.reset == kBoxResetNever && record.stateKnown;
        if (studied && (record.stateHash == kBoxOpenedStolen || record.stateHash == kBoxOpenedLooted)) {
            state.opened = true;
        } else if (studied && record.stateHash == kBoxClosed) {
            state.closed = true;
        } else {
            state.unexpected = true;
        }
    }

    // Artifact pass: note one field-object record for a Sealed Abyss Artifact.
    // "Picked up" is only the exact shape seen for artifacts 0001 and 0016:
    // the artifact gimmick, reason 1, never refills, the common initial state,
    // and its own UUID in the list of objects removed from the world.
    // Anything else makes the artifact unknown (hidden), never "not picked up".
    static void NoteArtifactState(ArtifactState& state, const Record& record) {
        ++state.records;
        bool removed = std::find(record.disabled.begin(), record.disabled.end(), record.origin)
            != record.disabled.end();
        bool studied = record.gimmickKnown && record.gimmickKey == kArtifactGimmickKey &&
            record.reasonKnown && record.reason == kBoxReasonSaved &&
            record.resetKnown && record.reset == kBoxResetNever &&
            record.stateKnown && record.stateHash == kBoxClosed && removed;
        if (studied) {
            state.pickedUp = true;
        } else {
            state.unexpected = true;
        }
    }

    // Artifact pass: note one field-object record for a Kuku Pot item. "Taken"
    // is the exact shape seen in the user's saves for Abyss Cells, Power
    // Cores (reason 2) and Aeserion Scales (reason 1): the item's own gimmick,
    // never refills, and its own UUID in the list of objects removed from the
    // world. Anything else makes the item unknown (hidden), never "not taken".
    static void NoteKukuPotItemState(ArtifactState& state, const Record& record, uint32_t gimmickKey) {
        ++state.records;
        bool removed = std::find(record.disabled.begin(), record.disabled.end(), record.origin)
            != record.disabled.end();
        bool studied = record.gimmickKnown && record.gimmickKey == gimmickKey &&
            record.reasonKnown && (record.reason == 1 || record.reason == kGearReasonPickedUp) &&
            record.resetKnown && record.reset == kBoxResetNever && removed;
        if (studied) {
            state.pickedUp = true;
        } else {
            state.unexpected = true;
        }
    }

    // True for property kinds that are stored as arrays (lists of values).
    bool Array(uint16_t kind) { return kind == 3 || kind == 6 || kind == 7 || kind == 9 || kind == 10; }

    // Bell pass: if this record's UUID and type key both match a known Bell,
    // mark that Bell as recorded, and as completed if the record says so.
    // Knowledge pass: if the entry's key is a shrine's knowledge key, mark that
    // shrine as seen, and as found at level 2 or more.
    // Field pass: if the entry came from a field-rule chest or (v0.79) an
    // Abyss Nexus (all four UUID numbers equal; parts use other fourth
    // numbers), note its state.
    void Match(const Record& record) {
        if (pass == Pass::Quests) {
            // v0.108: a reward item is collected when its reward scene's
            // stage is completed. Stage keys are their own numbers, so stage
            // entries never count as missions or quests below.
            if (record.stage) {
                if (!record.progressKeyKnown || record.progressState != kProgressCompleted) {
                    return;
                }
                for (unsigned index = 0; index < uniqueGear.size(); ++index) {
                    const auto& link = kUniqueGearLinks[index];
                    if (link.source == kUniqueGearReward && link.stageKey == record.progressKey) {
                        uniqueGear[index] = true;
                    }
                }
                return;
            }
            // v0.105: a cresset's challenge is a mission: any record of it
            // makes the cresset known, state 5 makes it done.
            if (record.progressKeyKnown && !record.quest) {
                for (unsigned index = 0; index < cressets.size(); ++index) {
                    if (kCressetLinks[index].missionKey == record.progressKey) {
                        cressets[index].recorded = true;
                        cressets[index].done = cressets[index].done || record.progressState == kProgressCompleted;
                    }
                }
                // v0.114: a constellation's challenge is a mission too.
                for (unsigned index = 0; index < constellations.size(); ++index) {
                    if (kConstellationLinks[index].missionKey == record.progressKey) {
                        constellations[index].recorded = true;
                        constellations[index].done =
                            constellations[index].done || record.progressState == kProgressCompleted;
                    }
                }
                // A Sanctum Core's Sanctum is cleansed when its Witch mission
                // is completed (missionKey 0 = no mission: nothing to match).
                for (unsigned index = 0; index < sanctumCores.size(); ++index) {
                    if (kSanctumCoreLinks[index].missionKey != 0 &&
                        kSanctumCoreLinks[index].missionKey == record.progressKey) {
                        sanctumCores[index].recorded = true;
                        sanctumCores[index].done =
                            sanctumCores[index].done || record.progressState == kProgressCompleted;
                    }
                }
                // 0.29.0: so is a Legendary Animal's.
                for (unsigned index = 0; index < legendaryAnimals.size(); ++index) {
                    if (kLegendaryAnimalLinks[index].missionKey == record.progressKey) {
                        legendaryAnimals[index].recorded = true;
                        legendaryAnimals[index].done =
                            legendaryAnimals[index].done || record.progressState == kProgressCompleted;
                    }
                }
            }
            // v0.101: a gate is open when its mission (or quest) record says completed.
            if (!record.progressKeyKnown || record.progressState != kProgressCompleted) {
                return;
            }
            for (unsigned gate = 0; gate < kChestGateCount; ++gate) {
                bool kindFits = kChestGates[gate].kind == (record.quest ? kChestGateQuestCompleted : kChestGateMissionCompleted);
                if (kindFits && kChestGates[gate].key == record.progressKey) {
                    gatesOpen[gate] = true;
                }
            }
            return;
        }
        if (pass == Pass::Artifacts) {
            if (!record.originKnown) {
                return;
            }
            for (unsigned index = 0; index < _countof(kArtifactLinks); ++index) {
                if (memcmp(kArtifactLinks[index].uuid, record.origin.data(), sizeof(kArtifactLinks[index].uuid)) == 0) {
                    NoteArtifactState(artifacts[index], record);
                }
            }
            for (unsigned index = 0; index < _countof(kKukuPotItemLinks); ++index) {
                const auto& link = kKukuPotItemLinks[index];
                if (memcmp(link.uuid, record.origin.data(), sizeof(link.uuid)) == 0) {
                    NoteKukuPotItemState(kukuPotItems[index], record, link.gimmickKey);
                }
            }
            for (unsigned index = 0; index < _countof(kEggLinks); ++index) {
                const auto& link = kEggLinks[index];
                if (memcmp(link.uuid, record.origin.data(), sizeof(link.uuid)) == 0) {
                    NoteKukuPotItemState(eggs[index], record, link.gimmickKey);
                }
            }
            return;
        }
        if (pass == Pass::Field) {
            if (!record.originKnown) {
                return;
            }
            for (unsigned index = 0; index < _countof(kChestLinks); ++index) {
                if (kChestLinks[index].rule == kChestRuleField &&
                    memcmp(kChestLinks[index].uuid, record.origin.data(), sizeof(kChestLinks[index].uuid)) == 0) {
                    NoteFieldState(fieldChests[index], record);
                }
            }
            // v0.79: an activated Nexus ("abyssruins_useartifact_01") has the
            // same record shape and "opened" state as an opened strongbox.
            for (unsigned index = 0; index < _countof(kNexusLinks); ++index) {
                if (memcmp(kNexusLinks[index].uuid, record.origin.data(), sizeof(kNexusLinks[index].uuid)) == 0) {
                    NoteFieldState(fieldNexuses[index], record);
                }
            }
            // v0.95: an activated Abyss-island Nexus ("abyssruins_useartifact_04")
            // has the same record shape and "opened" state (the user's saves).
            for (unsigned index = 0; index < _countof(kIslandNexusLinks); ++index) {
                const auto& link = kIslandNexusLinks[index];
                if (memcmp(link.uuid, record.origin.data(), sizeof(link.uuid)) == 0) {
                    NoteFieldState(fieldIslandNexuses[index], record);
                }
            }
            // v0.108: a picked-up ground or quest item: its UUID's first 3
            // numbers, reason 2, never resets. Other records leave it "not
            // collected" (one that resets would not be a one-only item).
            bool pickedUp = record.reasonKnown && record.reason == kGearReasonPickedUp &&
                record.resetKnown && record.reset == kBoxResetNever;
            for (unsigned index = 0; pickedUp && index < uniqueGear.size(); ++index) {
                const auto& link = kUniqueGearLinks[index];
                if (link.source != kUniqueGearReward && memcmp(link.uuid, record.origin.data(), sizeof(link.uuid)) == 0) {
                    uniqueGear[index] = true;
                }
            }
            return;
        }
        if (pass == Pass::Knowledge) {
            // Both fields must have been read; otherwise the entry says nothing.
            if (!record.knowledgeKeyKnown || !record.levelKnown) {
                return;
            }
            for (unsigned index = 0; index < _countof(kShrineLinks); ++index) {
                if (kShrineLinks[index].knowledgeKey == record.knowledgeKey) {
                    shrines[index].seen = true;
                    shrines[index].found |= record.level >= 2;
                }
            }
            // 0.29.0: a Treasure Map piece is collected once its knowledge
            // entry exists, at any level (the full save has every piece, the
            // chest copies of pieces 6 and 8 included; research 2026-10-25).
            for (unsigned index = 0; index < _countof(kTreasureMapLinks); ++index) {
                if (kTreasureMapLinks[index].knowledgeKey == record.knowledgeKey) {
                    treasureMaps[index] = true;
                }
            }
            // 0.29.0: a Memory Fragment is collected once its knowledge entry
            // exists, at any level (missing = not collected).
            for (unsigned index = 0; index < _countof(kMemoryFragmentLinks); ++index) {
                if (kMemoryFragmentLinks[index].knowledgeKey == record.knowledgeKey) {
                    memoryFragments[index] = true;
                }
            }
            return;
        }
        if (!record.uuidKnown || !record.keyKnown) {
            return;
        }
        // v0.58: a treasure chest needs the exact chest type key and UUID.
        // v0.68: field-rule boxes may also use the "TreasureBox_Sector" key
        // (seen on the Hernand itembox when it was opened).
        if (record.key == kChestInfoKey || record.key == kSectorChestInfoKey) {
            for (unsigned index = 0; index < _countof(kChestLinks); ++index) {
                bool keyFits = record.key == kChestInfoKey || kChestLinks[index].rule == kChestRuleField;
                if (keyFits &&
                    memcmp(kChestLinks[index].uuid, record.uuid.data(), sizeof(kChestLinks[index].uuid)) == 0) {
                    chests[index].seen = true;
                    chests[index].opened |= record.completed;
                }
            }
        }
        // v0.79: a discovered Abyss Nexus: its own key and UUID, no flags.
        // v0.95: the housing Nexuses (last rows) have their own key.
        if (record.key == kNexusInfoKey || record.key == kHousingNexusInfoKey) {
            for (unsigned index = 0; index < _countof(kNexusLinks); ++index) {
                if (memcmp(kNexusLinks[index].uuid, record.uuid.data(), sizeof(kNexusLinks[index].uuid)) == 0) {
                    nexuses[index].seen = true;
                }
            }
        }
        // v0.95: a discovered Abyss-island Nexus: its row's own key and UUID, no flags.
        for (unsigned index = 0; index < _countof(kIslandNexusLinks); ++index) {
            const auto& link = kIslandNexusLinks[index];
            if (record.key == link.infoKey && memcmp(link.uuid, record.uuid.data(), sizeof(link.uuid)) == 0) {
                islandNexuses[index].seen = true;
            }
        }
        // v0.69: Abyss chests use the same "TreasureBox" key and UUID rule.
        if (record.key == kChestInfoKey) {
            for (unsigned index = 0; index < _countof(kAbyssChestLinks); ++index) {
                if (memcmp(kAbyssChestLinks[index].uuid, record.uuid.data(), sizeof(kAbyssChestLinks[index].uuid)) == 0) {
                    abyssChests[index].seen = true;
                    abyssChests[index].opened |= record.completed;
                }
            }
        }
        for (unsigned index = 0; index < _countof(kBellLinks); ++index) {
            const auto& link = kBellLinks[index];
            if (memcmp(link.uuid, record.uuid.data(), sizeof(link.uuid)) == 0 &&
                std::find(std::begin(link.keys), std::end(link.keys), record.key)
                    != std::end(link.keys)) {
                states[index].recorded = true;
                states[index].completed |= record.completed;
            }
        }
    }

    // Read one plain value of `size` bytes. If we are inside a Bell record,
    // keep the three fields we care about (knowledge entry: its two fields);
    // each must have the exact expected shape or parsing stops with an error.
    void Scalar(const Property& property, size_t size, Record* record) {
        const uint8_t* value = reader.Take(size);
        if (!record) {
            return;
        }
        if (pass == Pass::Quests) {
            // v0.101: the entry's key and state, each in its exact studied shape.
            if (property.name == "_key" || property.name == "_questKey") {
                bool fits = record->quest ? property.name == "_questKey" && property.typeName == "QuestKey"
                    : record->stage ? property.name == "_key" && property.typeName == "StageKey"
                                    : property.name == "_key" && property.typeName == "MissionKey";
                Require(fits && size == 4, "Unexpected quest/mission key representation.");
                record->progressKey = Load32(value);
                record->progressKeyKnown = true;
            } else if (property.name == "_state") {
                Require(property.typeName == "QuestStateType" && size == 1 && value[0] <= 16,
                    "Unexpected quest/mission state representation.");
                record->progressState = value[0];
            }
            return;
        }
        if (pass == Pass::Field || pass == Pass::Artifacts) {
            // v0.88: the artifact rule also needs the record's gimmick type.
            if (pass == Pass::Artifacts && property.name == "_gimmickInfoKey") {
                Require(property.typeName == "GimmickInfoKey" && size == 4, "Unexpected field gimmick representation.");
                record->gimmickKey = Load32(value);
                record->gimmickKnown = true;
                return;
            }
            // The four fields the box rule needs, each in its exact studied shape.
            if (property.name == "_levelOriginSceneObjectUuid") {
                Require(property.typeName == "uint4" && size == 16, "Unexpected field origin UUID representation.");
                for (unsigned word = 0; word < 4; ++word) {
                    record->origin[word] = Load32(value + word * 4);
                }
                record->originKnown = true;
            } else if (property.name == "_fieldSaveDataReason") {
                Require(property.typeName == "FieldSaveDataReason" && size == 1,
                    "Unexpected field save reason representation.");
                record->reason = value[0];
                record->reasonKnown = true;
            } else if (property.name == "_resetTimeSecondsOfDays") {
                Require(property.typeName == "uint64" && size == 8, "Unexpected field reset representation.");
                record->reset = Load32(value) | (static_cast<uint64_t>(Load32(value + 4)) << 32);
                record->resetKnown = true;
            } else if (property.name == "_initStateNameHash") {
                Require(property.typeName == "HashCode32" && size == 4, "Unexpected field state representation.");
                record->stateHash = Load32(value);
                record->stateKnown = true;
            }
            return;
        }
        if (pass == Pass::Knowledge) {
            if (property.name == "_key") {
                Require(property.typeName == "KnowledgeKey" && size == 4,
                    "Unexpected knowledge key representation.");
                record->knowledgeKey = Load32(value);
                record->knowledgeKeyKnown = true;
            } else if (property.name == "_level") {
                // Levels seen in saves are 1 and 2; a huge value means the
                // layout is not what was studied.
                Require(property.typeName == "TLevel" && size == 4 && Load32(value) <= 1000,
                    "Unexpected knowledge level representation.");
                record->level = Load32(value);
                record->levelKnown = true;
            }
            return;
        }
        if (property.name == "_sceneObjectUuid") {
            Require(property.typeName == "uint4" && size == 16, "Unexpected Bell UUID representation.");
            for (unsigned word = 0; word < 4; ++word) {
                record->uuid[word] = Load32(value + word * 4);
            }
            record->uuidKnown = true;
        } else if (property.name == "_levelGimmickSceneObjectInfoKey") {
            Require(size == 4, "Unexpected Bell type-key representation.");
            record->key = Load32(value);
            record->keyKnown = true;
        } else if (property.name == "_isCompleted") {
            Require(property.typeName == "bool" && size == 1 && value[0] <= 1,
                "Unexpected Bell completion representation.");
            record->completed = value[0] == 1;
        }
    }

    // Parse one reflected object (and, recursively, any objects inside it).
    // depth: nesting level (limited to 64). record: collect Bell fields from
    // this object. top: a top-level object, whose header was in the object
    // table. knownType: type index for top-level objects. named: whether array
    // entries carry 4 extra header bytes (only skipped; format version 14+).
    void Object(unsigned depth, bool record, bool top, uint16_t knownType = 0, bool named = false) {
        Require(depth <= 64 && ++objectsVisited <= 1000000,
            "Reflection nesting/object limit exceeded.");
        // A bitmap: one bit per field, saying whether that field is present.
        uint16_t bitmapSize = reader.U16();
        const uint8_t* bitmap = reader.Take(bitmapSize);
        uint16_t typeIndex = knownType;
        if (!top) {
            typeIndex = reader.U16();
            reader.Skip(9); // Version >=11: one flag and signed 64-bit identity.
            if (version >= 14 && named) {
                reader.Skip(4);
            }
            reader.SeekForward(reader.U32());
        }
        Require(typeIndex < types.size(), "Invalid reflection type index.");
        const Type& type = types[typeIndex];
        // Knowledge pass: every entry of the knowledge list must be exactly a
        // KnowledgeElementSaveData object, or the pass is rejected.
        Require(!record || pass != Pass::Knowledge || type.name == "KnowledgeElementSaveData",
            "Unexpected knowledge entry type.");
        // Field and artifact passes: likewise, every entry must be a FieldGimmickSaveData.
        Require(!record || (pass != Pass::Field && pass != Pass::Artifacts) || type.name == "FieldGimmickSaveData",
            "Unexpected field entry type.");
        // Quest pass (v0.101): mission-list entries must be MissionStateData,
        // quest-list entries QuestStateData, (v0.108) stage-list entries StageStateData.
        Require(!record || pass != Pass::Quests ||
            type.name == (readingQuestList ? "QuestStateData" : readingStageList ? "StageStateData" : "MissionStateData"),
            "Unexpected quest/mission entry type.");
        Require(bitmapSize >= (type.properties.size() + 7) / 8, "Property bitmap too short.");
        size_t start = reader.offset;
        reader.Skip(1); // Version >=10 object flag.
        // Optional list of property "tags" (index + text); read and ignored.
        bool noTags = reader.U8() == 1;
        if (!noTags) {
            uint16_t tags = reader.U16();
            for (unsigned index = 0; index < tags; ++index) {
                Require(reader.U16() < type.properties.size(), "Invalid property tag.");
                reader.String();
            }
        }
        Record item;
        item.quest = pass == Pass::Quests && readingQuestList;
        item.stage = pass == Pass::Quests && readingStageList;
        for (size_t index = 0; index < type.properties.size(); ++index) {
            const Property& property = type.properties[index];
            bool array = Array(property.kind);
            bool present = ((bitmap[index / 8] >> (index & 7)) & 1) != 0;
            // Fields with flag bits 0x02 or 0x80 are not read here, nor are
            // absent non-array fields (literal description of the format rule).
            if ((property.flags & 0x82) != 0 || (!array && !present)) {
                continue;
            }
            // The one list this pass cares about: the discovered-gimmick records
            // list (Bells), the knowledge list (shrines) or the field-object
            // list (strongboxes).
            bool captureList = false;
            if (pass == Pass::Bells) {
                captureList = type.name == "DiscoveredLevelGimmickSceneObjectSaveData" &&
                    property.name == "_discoveredLevelGimmickSceneObjectSaveDataList";
            } else if (pass == Pass::Knowledge) {
                captureList = type.name == "KnowledgeSaveData" && property.name == "_list";
            } else if (pass == Pass::Quests) {
                // v0.101: both lists of the quest container; v0.108: its stage list too.
                captureList = type.name == "QuestSaveData" && (property.name == "_missionStateList" ||
                    property.name == "_questStateList" || property.name == "_stageStateData");
            } else {
                // Field and artifact passes read the same list.
                captureList = type.name == "FieldSaveData" && property.name == "_fieldGimmickSaveDataList";
            }
            if (captureList) {
                Require(property.kind == 6 || property.kind == 7, "Unsupported record list representation.");
                if (pass == Pass::Quests && property.name == "_questStateList") {
                    questListVisited = true;
                } else if (pass == Pass::Quests && property.name == "_stageStateData") {
                    stageListVisited = true;
                } else {
                    listVisited = true;
                }
            }
            // Version 15+: arrays start with a 1-byte marker; 1 means "nothing stored".
            if (version >= 15 && array && reader.U8() == 1) {
                continue;
            }
            Record* capture = record ? &item : nullptr;
            // Read (or skip) the field according to its storage kind.
            switch (property.kind) {
            case 0:
            case 2:
                // Fixed-size value.
                Scalar(property, property.size, capture);
                break;
            case 1:
                // Variable-size value with a 4-byte length prefix.
                Scalar(property, Count(static_cast<uint32_t>(kMaximumPlain)), capture);
                break;
            case 3: {
                // Array of fixed-size values: skipped, except (v0.88) the list
                // of objects a field record removed from the world.
                uint32_t count = Count();
                if (pass == Pass::Artifacts && capture && property.name == "_levelOrigin_disabledSceneObjectUuidList") {
                    Require(property.typeName == "uint4" && property.size == 16 && count <= 4096,
                        "Unexpected field disabled-list representation.");
                    for (uint32_t entry = 0; entry < count; ++entry) {
                        const uint8_t* value = reader.Take(16);
                        std::array<uint32_t, 4> uuid = {};
                        for (unsigned word = 0; word < 4; ++word) {
                            uuid[word] = Load32(value + word * 4);
                        }
                        capture->disabled.push_back(uuid);
                    }
                    break;
                }
                reader.Skip(static_cast<size_t>(count) * property.size);
                break;
            }
            case 4:
                // Nested object.
                Object(depth + 1, false, false);
                break;
            case 5:
                // Optional nested object (1-byte "present" flag first).
                if (reader.U8() != 0) { Object(depth + 1, false, false); }
                break;
            case 6:
            case 7: {
                // Array of objects. Entries are captured records only when this
                // is the list found above.
                uint32_t count = Count();
                bool hasNames = version >= 14 && reader.U8() == 1;
                reader.Skip(8);
                int32_t unknownCount = static_cast<int32_t>(reader.U32());
                Require(unknownCount <= 1000000, "Invalid reflection array metadata.");
                if (unknownCount > 0) {
                    reader.Skip(static_cast<size_t>(unknownCount) * (hasNames ? 12 : 8));
                }
                // Quest pass: entries know which of its lists they are in.
                bool outerQuestList = readingQuestList;
                bool outerStageList = readingStageList;
                if (captureList && pass == Pass::Quests) {
                    readingQuestList = property.name == "_questStateList";
                    readingStageList = property.name == "_stageStateData";
                }
                for (uint32_t entry = 0; entry < count; ++entry) {
                    Object(depth + 1, captureList, false, 0, hasNames);
                }
                readingQuestList = outerQuestList;
                readingStageList = outerStageList;
                break;
            }
            case 10: {
                // Array of arrays of fixed-size values: skipped.
                uint32_t count = Count();
                for (uint32_t entry = 0; entry < count; ++entry) {
                    reader.Skip(static_cast<size_t>(Count()) * property.size);
                }
                break;
            }
            default:
                // Any other kind (including 9) is refused rather than guessed.
                throw std::runtime_error("Unsupported reflected property kind in save container.");
            }
        }
        // Nested objects end with their own byte size; it must match what we read.
        if (!top) {
            size_t end = reader.offset;
            uint32_t declared = reader.U32();
            Require(declared == end - start, "Nested reflection object size mismatch.");
        }
        if (record) {
            Match(item);
        }
    }

public:
    explicit Reflection(const Bytes& plain) : reader(plain) {}

    // Parse the decoded save and return the per-Bell results.
    auto Read() {
        pass = Pass::Bells;
        Parse("DiscoveredLevelGimmickSceneObjectSaveData");
        return states;
    }

    // Per-chest results of the last Read() (v0.58; same pass as the Bells).
    const auto& Chests() const { return chests; }

    // Per-Abyss-chest results of the last Read() (v0.69; same pass).
    const auto& AbyssChests() const { return abyssChests; }

    // Per-Nexus "discovered" results of the last Read() (v0.79; same pass).
    const auto& Nexuses() const { return nexuses; }

    // Per-Nexus field records of the last ReadFieldChests() (v0.79).
    const auto& FieldNexuses() const { return fieldNexuses; }

    // Per-island-Nexus "discovered" results of the last Read() (v0.95; same pass).
    const auto& IslandNexuses() const { return islandNexuses; }

    // Per-island-Nexus field records of the last ReadFieldChests() (v0.95).
    const auto& FieldIslandNexuses() const { return fieldIslandNexuses; }

    // Parse the decoded save and return the per-shrine results (v0.56).
    auto ReadShrines() {
        pass = Pass::Knowledge;
        Parse("KnowledgeSaveData");
        return shrines;
    }

    // The Treasure Map results of the last knowledge pass (0.29.0; call
    // after ReadShrines).
    const auto& TreasureMaps() const { return treasureMaps; }
    // The Memory Fragment results of the last knowledge pass (0.29.0; call
    // after ReadShrines).
    const auto& MemoryFragments() const { return memoryFragments; }

    // Parse the decoded save and return what the field-object list says
    // about each field-rule chest (v0.68; other chest rows stay empty).
    auto ReadFieldChests() {
        pass = Pass::Field;
        Parse("FieldSaveData");
        return fieldChests;
    }

    // Parse the decoded save and return what the field-object list says
    // about each Sealed Abyss Artifact (v0.88).
    auto ReadArtifacts() {
        pass = Pass::Artifacts;
        Parse("FieldSaveData");
        return artifacts;
    }

    // The Kuku Pot item results of the last artifact pass (call after
    // ReadArtifacts).
    const auto& KukuPotItems() const {
        return kukuPotItems;
    }

    // The Egg results of the last artifact pass (call after ReadArtifacts).
    const auto& Eggs() const {
        return eggs;
    }

    // Parse the decoded save and return, per chest gate, whether its mission
    // or quest is completed (v0.101).
    auto ReadQuests() {
        pass = Pass::Quests;
        Parse("QuestSaveData");
        return gatesOpen;
    }

    // The Abyss Cresset results of the last quest pass (v0.105; call after
    // ReadQuests).
    const auto& Cressets() const {
        return cressets;
    }

    // The Constellation results of the last quest pass (v0.114; call after
    // ReadQuests).
    const auto& Constellations() const {
        return constellations;
    }

    // The Sanctum Core results of the last quest pass (call after ReadQuests).
    const auto& SanctumCores() const {
        return sanctumCores;
    }

    // The Legendary Animal results of the last quest pass (0.29.0; call
    // after ReadQuests).
    const auto& LegendaryAnimals() const {
        return legendaryAnimals;
    }

    // v0.108: unique gear collected: reward rows after ReadQuests, ground
    // and quest rows after ReadFieldChests.
    const auto& UniqueGear() const { return uniqueGear; }

    // v0.108: did the last ReadQuests see the stage list? (Not required for
    // the quest pass, so a save without it only makes reward items unknown.)
    bool StageListVisited() const { return stageListVisited; }

private:
    // Order: header and versions, type table, optional name table, object
    // table, then the single `container` object this pass needs.
    void Parse(const char* container) {
        Require(reader.U16() == 0xffff, "Unsupported legacy reflection header.");
        metadata = reader.U32();
        if (metadata < 3 || metadata > 4) {
            throw std::runtime_error("Unsupported native reflection metadata version: "
                + std::to_string(metadata));
        }
        if (metadata >= 4) { reader.Skip(8); }
        version = reader.U32();
        if (version < 11 || version > 15) {
            throw std::runtime_error("Unsupported native reflection serialization version: "
                + std::to_string(version));
        }
        // Type table: every type name with its fields.
        uint16_t count = reader.U16();
        Require(count > 0 && count <= 16384, "Reflection type count exceeds limit.");
        for (unsigned index = 0; index < count; ++index) {
            Type type;
            type.name = reader.String();
            uint16_t properties = reader.U16();
            Require(properties <= 4096, "Reflection property count exceeds limit.");
            for (unsigned item = 0; item < properties; ++item) {
                Property property;
                property.name = reader.String();
                property.typeName = reader.String();
                property.kind = reader.U16();
                property.size = reader.U16();
                property.flags = reader.U32();
                type.properties.push_back(std::move(property));
            }
            types.push_back(std::move(type));
        }
        // Version 14+: a list of strings (read and ignored).
        if (version > 13) {
            uint32_t names = Count();
            for (uint32_t index = 0; index < names; ++index) { reader.String(); }
        }
        // Object table: type, position and size of each top-level object.
        uint32_t objects = Count();
        reader.U32(); // Metadata end offset, retained by the format but not needed for selective parsing.
        std::vector<ObjectInfo> entries;
        for (uint32_t index = 0; index < objects; ++index) {
            ObjectInfo info;
            info.type = reader.U16();
            reader.Skip(10);
            info.offset = reader.U32();
            info.size = reader.U32();
            Require(info.type < types.size() && info.offset <= reader.bytes.size() &&
                info.size <= reader.bytes.size() - info.offset,
                "Invalid reflection object table entry.");
            entries.push_back(info);
        }
        // Parse only this pass's container; there must be exactly one, and it
        // must contain the needed list, or the whole pass is rejected. The
        // field pass is the exception: saves hold one field container per
        // world (two in the saves studied), and all of them are read. So is
        // the artifact pass, which reads the same containers (v0.90: v0.88
        // required exactly one here and so rejected every save).
        unsigned containers = 0;
        for (const auto& info : entries) {
            if (types[info.type].name != container) { continue; }
            ++containers;
            reader.offset = info.offset;
            reader.limit = info.offset + info.size;
            Object(0, false, true, info.type);
        }
        bool fieldList = pass == Pass::Field || pass == Pass::Artifacts;
        bool containersFit = fieldList ? containers >= 1 && containers <= 8 : containers == 1;
        const char* failure = "Save has no unique supported Bell discovery container/list.";
        if (pass == Pass::Knowledge) {
            failure = "Save has no unique supported knowledge container/list.";
        } else if (fieldList) {
            failure = "Save has no supported field-object container/list.";
        } else if (pass == Pass::Quests) {
            failure = "Save has no unique supported quest container/lists.";
        }
        Require(containersFit && listVisited && (pass != Pass::Quests || questListVisited), failure);
    }
};

// ===========================================================================
// Section: finding and reading save files (read-only), writing our own files
// ===========================================================================

// True if `name` is non-empty and made only of digits 0-9 (a Steam account folder).
bool Digits(const wchar_t* name) {
    if (!*name) { return false; }
    for (; *name; ++name) { if (*name < L'0' || *name > L'9') { return false; } }
    return true;
}

// Build the full path of slot `slot`'s save.save. Requires exactly one numeric
// Steam account folder (it never guesses between several). Also fills
// summary.profile with "<account>:slot<N>".
std::wstring SavePath(NativeSaveSummary& summary, unsigned slot) {
    Require(slot <= 999, "Selected save slot exceeds supported range.");
    wchar_t local[MAX_PATH] = {};
    Require(SUCCEEDED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, local)),
        "Local AppData unavailable.");
    std::wstring root = std::wstring(local) + L"\\Pearl Abyss\\CD\\save";
    WIN32_FIND_DATAW entry = {};
    HANDLE search = FindFirstFileW((root + L"\\*").c_str(), &entry);
    Require(search != INVALID_HANDLE_VALUE, "Steam save directory not found.");
    std::wstring account;
    unsigned accounts = 0;
    do {
        if ((entry.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) && Digits(entry.cFileName)) {
            account = entry.cFileName;
            ++accounts;
        }
    } while (FindNextFileW(search, &entry));
    FindClose(search);
    Require(accounts == 1, "Native proof requires exactly one Steam account; no account was guessed.");
    std::string narrow;
    for (wchar_t digit : account) {
        narrow.push_back(static_cast<char>(digit)); // Digits() already restricts this to ASCII.
    }
    Require(narrow.size() < 40, "Account identifier exceeds supported length.");
    sprintf_s(summary.profile, "%s:slot%u", narrow.c_str(), slot);
    return root + L"\\" + account + L"\\slot" + std::to_wstring(slot) + L"\\save.save";
}

// The bytes of one save file read plus its last-modified time.
struct FileRead {
    Bytes bytes;
    FILETIME modified;
};
// Read a whole save file. Opened for reading only, and with full sharing so the
// game can keep writing/replacing it meanwhile (we never block the game).
FileRead ReadSource(const std::wstring& path) {
    HANDLE file = CreateFileW(path.c_str(), GENERIC_READ,
        FILE_SHARE_READ | FILE_SHARE_WRITE | FILE_SHARE_DELETE, nullptr,
        OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
    Require(file != INVALID_HANDLE_VALUE, "Cannot open the selected save slot for read-only access.");
    LARGE_INTEGER size = {};
    FILETIME modified = {};
    if (!GetFileSizeEx(file, &size) || size.QuadPart < 128 || size.QuadPart > kMaximumSave ||
        !GetFileTime(file, nullptr, nullptr, &modified)) {
        CloseHandle(file);
        throw std::runtime_error("Save size or timestamp unavailable/outside bounds.");
    }
    Bytes bytes(static_cast<size_t>(size.QuadPart));
    DWORD count = 0;
    bool complete = ReadFile(file, bytes.data(), static_cast<DWORD>(bytes.size()), &count, nullptr)
        && count == bytes.size();
    CloseHandle(file);
    Require(complete, "Save changed or could not be read completely.");
    return {std::move(bytes), modified};
}

// Write one of the mod's OWN output files (never a game file). Writes to a
// ".tmp" file first, then swaps it into place, so a half-written file is never
// left behind under the real name.
void WriteLocal(const std::wstring& path, const void* data, size_t size) {
    std::wstring temporary = path + L".tmp";
    HANDLE file = CreateFileW(temporary.c_str(), GENERIC_WRITE, FILE_SHARE_READ,
        nullptr, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    Require(file != INVALID_HANDLE_VALUE, "Cannot write native diagnostic output.");
    DWORD count = 0;
    bool complete = WriteFile(file, data, static_cast<DWORD>(size), &count, nullptr) && count == size;
    if (complete) { complete = FlushFileBuffers(file) != 0; }
    CloseHandle(file);
    Require(complete && MoveFileExW(temporary.c_str(), path.c_str(),
        MOVEFILE_REPLACE_EXISTING | MOVEFILE_WRITE_THROUGH), "Cannot finish native diagnostic output.");
}

// Read the save twice, 120 ms apart, and accept it only if the bytes and the
// timestamp match both times. Up to 4 attempts. This avoids decoding a file
// the game is half-way through rewriting.
FileRead ReadStable(const std::wstring& source) {
    for (unsigned attempt = 0; attempt < 4; ++attempt) {
        FileRead first = ReadSource(source);
        Sleep(120);
        FileRead second = ReadSource(source);
        if (CompareFileTime(&first.modified, &second.modified) == 0 && first.bytes == second.bytes) {
            return second;
        }
    }
    throw std::runtime_error("Save is still changing; no completion was inferred.");
}
// v0.108: notes one unique gear row's result in `summary`.
void NoteUniqueGear(NativeSaveSummary& summary, unsigned index, bool collected, bool unknown) {
    unsigned bit = 1u << (index % 32);
    summary.uniqueGearCollected += collected ? 1 : 0;
    summary.uniqueGearUnknown += unknown ? 1 : 0;
    summary.uniqueGearCollectedMask[index / 32] |= collected ? bit : 0u;
    summary.uniqueGearUnknownMask[index / 32] |= unknown ? bit : 0u;
}

// Copy the per-chest results of a successful Bell pass into `summary` (v0.58),
// then (v0.68) add the field-object pass for field-rule chests and (v0.79)
// Abyss Nexuses, (v0.95) also the Abyss-island Nexuses. That pass is a
// separate parse: if it fails, only field-rule chests not already opened by
// the Bells' list, and the Nexuses, become unknown; it never throws.
template <typename States, typename NexusStates, typename IslandStates>
void FillChests(const States& chests, const NexusStates& nexuses, const IslandStates& islandNexuses,
    const Bytes& plain, NativeSaveSummary& summary) {
    static_assert(_countof(kChestLinks) <= 32 * _countof(summary.chestSeenMask),
        "Chest masks hold at most 256 chests");
    static_assert(_countof(kNexusLinks) <= 32 * _countof(summary.nexusSeenMask),
        "Nexus masks hold at most 256 Nexuses");
    static_assert(_countof(kIslandNexusLinks) <= 32 * _countof(summary.islandNexusSeenMask),
        "Island Nexus masks hold at most 256 Nexuses");
    std::array<FieldChestState, _countof(kChestLinks)> field = {};
    std::array<FieldChestState, _countof(kNexusLinks)> nexusField = {};
    std::array<FieldChestState, _countof(kIslandNexusLinks)> islandField = {};
    std::array<bool, _countof(kUniqueGearLinks)> gear = {}; // v0.108.
    summary.chestFieldValid = false;
    try {
        Reflection fieldReader(plain);
        field = fieldReader.ReadFieldChests();
        nexusField = fieldReader.FieldNexuses();
        islandField = fieldReader.FieldIslandNexuses();
        gear = fieldReader.UniqueGear();
        summary.chestFieldValid = true;
    } catch (const std::exception& exception) {
        strncpy_s(summary.chestFieldError, exception.what(), _TRUNCATE);
    }
    // v0.108: ground and quest unique gear (the reward rows come from FillQuests).
    static_assert(_countof(kUniqueGearLinks) <= 32 * _countof(summary.uniqueGearCollectedMask),
        "Unique gear masks hold at most 256 items");
    summary.uniqueGearCoverage = static_cast<unsigned>(_countof(kUniqueGearLinks));
    for (unsigned index = 0; index < gear.size(); ++index) {
        if (kUniqueGearLinks[index].source != kUniqueGearReward) {
            NoteUniqueGear(summary, index, summary.chestFieldValid && gear[index], !summary.chestFieldValid);
        }
    }
    // v0.79: Nexuses. Activated only by an explicit "opened" field record.
    summary.nexusCoverage = static_cast<unsigned>(nexuses.size());
    for (unsigned index = 0; index < nexuses.size(); ++index) {
        unsigned bit = 1u << (index % 32);
        const FieldChestState& state = nexusField[index];
        bool unknown = !summary.chestFieldValid || state.unexpected || (state.opened && state.closed);
        bool activated = !unknown && state.opened;
        bool seen = nexuses[index].seen || state.records > 0;
        summary.nexusesActivated += activated ? 1 : 0;
        summary.nexusesUnknown += unknown ? 1 : 0;
        summary.nexusSeenMask[index / 32] |= seen ? bit : 0u;
        summary.nexusActivatedMask[index / 32] |= activated ? bit : 0u;
        summary.nexusUnknownMask[index / 32] |= unknown ? bit : 0u;
    }
    // v0.95: Abyss-island Nexuses, the same rule as the surface Nexuses.
    summary.islandNexusCoverage = static_cast<unsigned>(islandNexuses.size());
    for (unsigned index = 0; index < islandNexuses.size(); ++index) {
        unsigned bit = 1u << (index % 32);
        const FieldChestState& state = islandField[index];
        bool unknown = !summary.chestFieldValid || state.unexpected || (state.opened && state.closed);
        bool activated = !unknown && state.opened;
        bool seen = islandNexuses[index].seen || state.records > 0;
        summary.islandNexusesActivated += activated ? 1 : 0;
        summary.islandNexusesUnknown += unknown ? 1 : 0;
        summary.islandNexusSeenMask[index / 32] |= seen ? bit : 0u;
        summary.islandNexusActivatedMask[index / 32] |= activated ? bit : 0u;
        summary.islandNexusUnknownMask[index / 32] |= unknown ? bit : 0u;
    }
    summary.chestCoverage = 0;
    for (unsigned index = 0; index < chests.size(); ++index) {
        // v0.99: decoy rows (a placed chest that holds nothing) are not counted.
        if (kChestLinks[index].decoy) {
            continue;
        }
        ++summary.chestCoverage;
        unsigned bit = 1u << (index % 32);
        bool seen = chests[index].seen || field[index].records > 0;
        bool opened = chests[index].opened;
        bool unknown = false;
        if (kChestLinks[index].rule == kChestRuleField && !opened) {
            const FieldChestState& state = field[index];
            if (!summary.chestFieldValid || state.unexpected || (state.opened && state.closed)) {
                unknown = true; // Undecided: hidden, never shown as "not opened".
            } else {
                opened = state.opened;
            }
        }
        summary.chestFieldRecords += field[index].records;
        summary.chestsOpened += opened ? 1 : 0;
        summary.chestsUnknown += unknown ? 1 : 0;
        summary.chestSeenMask[index / 32] |= seen ? bit : 0u;
        summary.chestOpenedMask[index / 32] |= opened ? bit : 0u;
        summary.chestUnknownMask[index / 32] |= unknown ? bit : 0u;
    }
}

// Copy the per-Abyss-chest results of a successful Bell pass into `summary` (v0.69).
template <typename States>
void FillAbyssChests(const States& chests, NativeSaveSummary& summary) {
    static_assert(_countof(kAbyssChestLinks) <= 32 * _countof(summary.abyssChestSeenMask),
        "Abyss chest masks hold at most 256 chests");
    summary.abyssChestCoverage = static_cast<unsigned>(chests.size());
    for (unsigned index = 0; index < chests.size(); ++index) {
        unsigned bit = 1u << (index % 32);
        summary.abyssChestsOpened += chests[index].opened ? 1 : 0;
        summary.abyssChestSeenMask[index / 32] |= chests[index].seen ? bit : 0u;
        summary.abyssChestOpenedMask[index / 32] |= chests[index].opened ? bit : 0u;
    }
}

// Second, independent pass (v0.56): read the Greymane Shrines (0.29.0: and
// the Treasure Map pieces) from the same decoded bytes into `summary`. A
// failure here leaves shrinesValid false (unknown) with the reason in
// shrineError; it never throws, so the Bell result already in `summary` is
// kept as it is.
void FillShrines(const Bytes& plain, NativeSaveSummary& summary) {
    static_assert(_countof(kShrineLinks) <= 32, "Shrine masks hold at most 32 shrines");
    static_assert(_countof(kTreasureMapLinks) <= 32 * _countof(summary.treasureMapCollectedMask),
        "The treasure map mask holds at most 256 pieces");
    summary.treasureMapCoverage = static_cast<unsigned>(_countof(kTreasureMapLinks));
    static_assert(_countof(kMemoryFragmentLinks) <= 32 * _countof(summary.memoryFragmentCollectedMask),
        "The Memory Fragment mask holds at most 256 fragments");
    summary.memoryFragmentCoverage = static_cast<unsigned>(_countof(kMemoryFragmentLinks));
    try {
        Reflection reflection(plain);
        auto shrines = reflection.ReadShrines();
        summary.shrineCoverage = static_cast<unsigned>(shrines.size());
        for (unsigned index = 0; index < shrines.size(); ++index) {
            summary.shrinesFound += shrines[index].found ? 1 : 0;
            summary.shrineFoundMask |= shrines[index].found ? 1u << index : 0u;
            summary.shrineSeenMask |= shrines[index].seen ? 1u << index : 0u;
        }
        // 0.29.0: Treasure Map pieces: collected = knowledge entry present;
        // none = not collected yet (the pass read the whole list).
        const auto& maps = reflection.TreasureMaps();
        for (unsigned index = 0; index < maps.size(); ++index) {
            summary.treasureMapsCollected += maps[index] ? 1 : 0;
            summary.treasureMapCollectedMask[index / 32] |= maps[index] ? 1u << (index % 32) : 0u;
        }
        // 0.29.0: Memory Fragments, the same rule as the Treasure Map pieces.
        const auto& fragments = reflection.MemoryFragments();
        for (unsigned index = 0; index < fragments.size(); ++index) {
            summary.memoryFragmentsCollected += fragments[index] ? 1 : 0;
            summary.memoryFragmentCollectedMask[index / 32] |= fragments[index] ? 1u << (index % 32) : 0u;
        }
        summary.shrinesValid = true;
    } catch (const std::exception& exception) {
        summary.shrinesValid = false;
        summary.shrinesFound = 0;
        summary.shrineFoundMask = 0;
        summary.shrineSeenMask = 0;
        summary.treasureMapsCollected = 0;
        for (unsigned word = 0; word < _countof(summary.treasureMapCollectedMask); ++word) {
            summary.treasureMapCollectedMask[word] = 0;
        }
        summary.memoryFragmentsCollected = 0;
        for (unsigned word = 0; word < _countof(summary.memoryFragmentCollectedMask); ++word) {
            summary.memoryFragmentCollectedMask[word] = 0;
        }
        strncpy_s(summary.shrineError, exception.what(), _TRUNCATE);
    }
}

// Fourth, independent pass (v0.88): read the Sealed Abyss Artifacts from the
// field-object list into `summary`. A failure here leaves artifactsValid false
// (every artifact unknown) with the reason in artifactError; it never throws,
// so every other result already in `summary` is kept as it is.
void FillArtifacts(const Bytes& plain, NativeSaveSummary& summary) {
    static_assert(_countof(kArtifactLinks) <= 32 * _countof(summary.artifactPickedUpMask),
        "Artifact masks hold at most 256 artifacts");
    summary.artifactCoverage = static_cast<unsigned>(_countof(kArtifactLinks));
    static_assert(_countof(kKukuPotItemLinks) <= 32 * _countof(summary.kukuPotItemTakenMask),
        "The Kuku Pot item masks hold at most 256 items");
    summary.kukuPotItemCoverage = static_cast<unsigned>(_countof(kKukuPotItemLinks));
    static_assert(_countof(kEggLinks) <= 32 * _countof(summary.eggTakenMask), "The Egg masks hold at most 256 eggs");
    summary.eggCoverage = static_cast<unsigned>(_countof(kEggLinks));
    try {
        Reflection reflection(plain);
        auto artifacts = reflection.ReadArtifacts();
        for (unsigned index = 0; index < artifacts.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool unknown = artifacts[index].unexpected;
            bool pickedUp = !unknown && artifacts[index].pickedUp;
            summary.artifactsPickedUp += pickedUp ? 1 : 0;
            summary.artifactsUnknown += unknown ? 1 : 0;
            summary.artifactPickedUpMask[index / 32] |= pickedUp ? bit : 0u;
            summary.artifactUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        // Kuku Pot items: same parse, same rule shape.
        const auto& kukuPotItems = reflection.KukuPotItems();
        for (unsigned index = 0; index < kukuPotItems.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool unknown = kukuPotItems[index].unexpected;
            bool taken = !unknown && kukuPotItems[index].pickedUp;
            summary.kukuPotItemsTaken += taken ? 1 : 0;
            summary.kukuPotItemsUnknown += unknown ? 1 : 0;
            summary.kukuPotItemTakenMask[index / 32] |= taken ? bit : 0u;
            summary.kukuPotItemUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        // Eggs: the same rule again.
        const auto& eggs = reflection.Eggs();
        for (unsigned index = 0; index < eggs.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool unknown = eggs[index].unexpected;
            bool taken = !unknown && eggs[index].pickedUp;
            summary.eggsTaken += taken ? 1 : 0;
            summary.eggsUnknown += unknown ? 1 : 0;
            summary.eggTakenMask[index / 32] |= taken ? bit : 0u;
            summary.eggUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        summary.artifactsValid = true;
    } catch (const std::exception& exception) {
        summary.artifactsValid = false;
        summary.artifactsPickedUp = 0;
        summary.artifactsUnknown = summary.artifactCoverage;
        for (unsigned word = 0; word < _countof(summary.artifactPickedUpMask); ++word) {
            summary.artifactPickedUpMask[word] = 0;
            summary.artifactUnknownMask[word] = 0xFFFFFFFFu;
        }
        summary.eggsTaken = 0;
        summary.eggsUnknown = summary.eggCoverage;
        for (unsigned word = 0; word < _countof(summary.eggTakenMask); ++word) {
            summary.eggTakenMask[word] = 0;
            summary.eggUnknownMask[word] = 0xFFFFFFFFu;
        }
        summary.kukuPotItemsTaken = 0;
        summary.kukuPotItemsUnknown = summary.kukuPotItemCoverage;
        for (unsigned word = 0; word < _countof(summary.kukuPotItemTakenMask); ++word) {
            summary.kukuPotItemTakenMask[word] = 0;
            summary.kukuPotItemUnknownMask[word] = 0xFFFFFFFFu;
        }
        strncpy_s(summary.artifactError, exception.what(), _TRUNCATE);
    }
}

// Fifth, independent pass (v0.101): which chest quest gates are open, and
// (v0.105) which Abyss Cressets are done. A failure here leaves questsValid
// false (gated chests and every cresset unknown) with the reason in
// questError; it never throws, so every other result is kept as it is.
void FillQuests(const Bytes& plain, NativeSaveSummary& summary) {
    static_assert(kChestGateCount <= 32, "The gate mask holds at most 32 gates");
    static_assert(_countof(kCressetLinks) <= 32 * _countof(summary.cressetDoneMask),
        "The cresset masks hold at most 256 cressets");
    summary.cressetCoverage = static_cast<unsigned>(_countof(kCressetLinks));
    static_assert(_countof(kConstellationLinks) <= 32 * _countof(summary.constellationDoneMask),
        "The constellation masks hold at most 256 constellations");
    summary.constellationCoverage = static_cast<unsigned>(_countof(kConstellationLinks));
    static_assert(_countof(kLegendaryAnimalLinks) <= 32 * _countof(summary.legendaryAnimalDoneMask),
        "The Legendary Animal masks hold at most 256 animals");
    summary.legendaryAnimalCoverage = static_cast<unsigned>(_countof(kLegendaryAnimalLinks));
    static_assert(_countof(kSanctumCoreLinks) <= 32 * _countof(summary.sanctumCoreDoneMask),
        "The Sanctum Core masks hold at most 256 cores");
    summary.sanctumCoreCoverage = static_cast<unsigned>(_countof(kSanctumCoreLinks));
    try {
        Reflection reflection(plain);
        auto gates = reflection.ReadQuests();
        for (unsigned gate = 0; gate < kChestGateCount; ++gate) {
            summary.gateOpenMask |= gates[gate] ? 1u << gate : 0u;
        }
        // Same rule as the markers: gate closed and no seen/opened record.
        for (unsigned index = 0; index < _countof(kAbyssChestLinks); ++index) {
            uint8_t gate = kAbyssChestLinks[index].gate;
            unsigned bit = 1u << (index % 32);
            bool recorded = ((summary.abyssChestSeenMask[index / 32] | summary.abyssChestOpenedMask[index / 32]) & bit) != 0;
            if (gate != kNoChestGate && !((summary.gateOpenMask >> gate) & 1u) && !recorded) {
                ++summary.abyssChestsLocked;
            }
        }
        // v0.105: cressets: done = mission completed; no mission record = unknown.
        const auto& cressets = reflection.Cressets();
        for (unsigned index = 0; index < cressets.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool unknown = !cressets[index].recorded;
            bool done = !unknown && cressets[index].done;
            summary.cressetsDone += done ? 1 : 0;
            summary.cressetsUnknown += unknown ? 1 : 0;
            summary.cressetDoneMask[index / 32] |= done ? bit : 0u;
            summary.cressetUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        // v0.114: constellations: the same rule as the cressets.
        const auto& constellations = reflection.Constellations();
        for (unsigned index = 0; index < constellations.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool unknown = !constellations[index].recorded;
            bool done = !unknown && constellations[index].done;
            summary.constellationsDone += done ? 1 : 0;
            summary.constellationsUnknown += unknown ? 1 : 0;
            summary.constellationDoneMask[index / 32] |= done ? bit : 0u;
            summary.constellationUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        // 0.29.0: Legendary Animals: the same rule as the cressets.
        const auto& animals = reflection.LegendaryAnimals();
        for (unsigned index = 0; index < animals.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool unknown = !animals[index].recorded;
            bool done = !unknown && animals[index].done;
            summary.legendaryAnimalsDone += done ? 1 : 0;
            summary.legendaryAnimalsUnknown += unknown ? 1 : 0;
            summary.legendaryAnimalDoneMask[index / 32] |= done ? bit : 0u;
            summary.legendaryAnimalUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        // Sanctum Cores: the cressets' rule on the Witch missions; a Sanctum
        // with no mission (missionKey 0) is neither done nor unknown.
        const auto& cores = reflection.SanctumCores();
        for (unsigned index = 0; index < cores.size(); ++index) {
            unsigned bit = 1u << (index % 32);
            bool ruled = kSanctumCoreLinks[index].missionKey != 0;
            bool unknown = ruled && !cores[index].recorded;
            bool done = ruled && !unknown && cores[index].done;
            summary.sanctumCoresDone += done ? 1 : 0;
            summary.sanctumCoresUnknown += unknown ? 1 : 0;
            summary.sanctumCoreDoneMask[index / 32] |= done ? bit : 0u;
            summary.sanctumCoreUnknownMask[index / 32] |= unknown ? bit : 0u;
        }
        // v0.108: reward unique gear: collected = its stage completed; no
        // stage list in the save = unknown.
        bool stagesKnown = reflection.StageListVisited();
        const auto& gear = reflection.UniqueGear();
        for (unsigned index = 0; index < gear.size(); ++index) {
            if (kUniqueGearLinks[index].source == kUniqueGearReward) {
                NoteUniqueGear(summary, index, stagesKnown && gear[index], !stagesKnown);
            }
        }
        summary.questsValid = true;
    } catch (const std::exception& exception) {
        summary.questsValid = false;
        summary.gateOpenMask = 0;
        summary.abyssChestsLocked = 0;
        summary.cressetsDone = 0;
        summary.cressetsUnknown = summary.cressetCoverage;
        for (unsigned word = 0; word < _countof(summary.cressetDoneMask); ++word) {
            summary.cressetDoneMask[word] = 0;
            summary.cressetUnknownMask[word] = 0xFFFFFFFFu;
        }
        summary.constellationsDone = 0;
        summary.constellationsUnknown = summary.constellationCoverage;
        for (unsigned word = 0; word < _countof(summary.constellationDoneMask); ++word) {
            summary.constellationDoneMask[word] = 0;
            summary.constellationUnknownMask[word] = 0xFFFFFFFFu;
        }
        summary.sanctumCoresDone = 0;
        summary.sanctumCoresUnknown = summary.sanctumCoreCoverage;
        for (unsigned word = 0; word < _countof(summary.sanctumCoreDoneMask); ++word) {
            summary.sanctumCoreDoneMask[word] = 0;
            summary.sanctumCoreUnknownMask[word] = 0xFFFFFFFFu;
        }
        summary.legendaryAnimalsDone = 0;
        summary.legendaryAnimalsUnknown = summary.legendaryAnimalCoverage;
        for (unsigned word = 0; word < _countof(summary.legendaryAnimalDoneMask); ++word) {
            summary.legendaryAnimalDoneMask[word] = 0;
            summary.legendaryAnimalUnknownMask[word] = 0xFFFFFFFFu;
        }
        // v0.108: reward unique gear unknown too (ground rows keep their field result).
        for (unsigned index = 0; index < _countof(kUniqueGearLinks); ++index) {
            if (kUniqueGearLinks[index].source == kUniqueGearReward) {
                NoteUniqueGear(summary, index, false, true);
            }
        }
        strncpy_s(summary.questError, exception.what(), _TRUNCATE);
    }
}
} // namespace

// ===========================================================================
// Section: public entry points (declared in NativeSaveReader.h)
// ===========================================================================

// Read the selected slot, decode it, check the Bells, and write a JSON report
// (native-save-progress.json) plus a copy of the save into the mod's folder.
bool ReadSelectedBellSave(const wchar_t* runtimeDirectory, unsigned slot, NativeSaveSummary& summary,
    char (&error)[256]) {
    summary = {};
    error[0] = 0;
    try {
        std::wstring source = SavePath(summary, slot);
        FileRead snapshot = ReadStable(source);
        // Only the stable copied bytes are decoded. The game's save directory
        // is never opened for write. Diagnostic files live under mod AppData.
        std::wstring runtime(runtimeDirectory);
        std::string profile(summary.profile);
        std::replace(profile.begin(), profile.end(), ':', '-');
        std::wstring snapshotName(profile.begin(), profile.end());
        WriteLocal(runtime + L"\\native-save-proof-" + snapshotName + L".save",
            snapshot.bytes.data(), snapshot.bytes.size());
        Bytes plain = Decode(snapshot.bytes);
        Reflection reflection(plain);
        auto states = reflection.Read();
        // v0.58: chests come from the same pass and list as the Bells;
        // v0.68: strongboxes also from their own field-object pass.
        FillChests(reflection.Chests(), reflection.Nexuses(), reflection.IslandNexuses(), plain, summary);
        FillAbyssChests(reflection.AbyssChests(), summary);
        summary.coverage = static_cast<unsigned>(states.size());
        FillShrines(plain, summary);
        FillArtifacts(plain, summary);
        FillQuests(plain, summary); // v0.101: chest quest gates.
        // Build the JSON report text by hand.
        std::ostringstream report;
        FILETIME now = {};
        GetSystemTimeAsFileTime(&now);
        // Convert a Windows FILETIME (100 ns ticks since 1601) to Unix seconds (since 1970).
        auto unixTime = [](FILETIME value) {
            uint64_t ticks = (static_cast<uint64_t>(value.dwHighDateTime) << 32) | value.dwLowDateTime;
            return (ticks - 116444736000000000ULL) / 10000000ULL;
        };
        report << "{\n  \"version\": 1,\n  \"source\": \"native-mod\",\n  \"profile\": \""
               << summary.profile << "\",\n  \"selectedSlot\": " << slot << ",\n"
               << "  \"loadedSaveDetected\": false,\n  \"readTime\": " << unixTime(now)
               << ",\n  \"saveModifiedTime\": " << unixTime(snapshot.modified)
               << ",\n  \"locations\": [\n";
        for (unsigned index = 0; index < states.size(); ++index) {
            const auto& state = states[index];
            summary.recorded += state.recorded ? 1 : 0;
            summary.completed += state.completed ? 1 : 0;
            summary.recordedMask |= state.recorded ? 1u << index : 0u;
            summary.completedMask |= state.completed ? 1u << index : 0u;
            // "mg:543894" is the id of the Hernand Bell in kBellLinks.
            if (strcmp(kBellLinks[index].id, "mg:543894") == 0) {
                summary.hernandCompleted = state.completed;
            }
            report << "    {\"id\":\"" << kBellLinks[index].id << "\",\"name\":\"" << kBellLinks[index].name
                   << "\",\"state\":\""
                   << (state.completed ? "completed" : state.recorded ? "recorded" : "unrecorded")
                   << "\",\"confirmed\":" << (state.completed ? "true" : "false") << "}"
                   << (index + 1 < states.size() ? "," : "") << "\n";
        }
        report << "  ]\n}\n";
        std::string output = report.str();
        WriteLocal(runtime + L"\\native-save-progress.json", output.data(), output.size());
        return true;
    } catch (const std::exception& exception) {
        // Any failure above lands here; its message becomes the error text.
        strncpy_s(error, exception.what(), _TRUNCATE);
        return false;
    }
}

// Read one slot inside an exact account folder that the caller already
// validated (the save-detection selection). Unlike ReadSelectedBellSave it
// never searches for an account and writes no files at all.
bool ReadBellSaveAt(const wchar_t* accountFolder, const char* account, unsigned slot,
    NativeSaveSummary& summary, FILETIME& modified, char (&error)[256]) {
    summary = {};
    modified = {};
    error[0] = 0;
    try {
        Require(slot <= 999, "Selected save slot exceeds supported range.");
        Require(strlen(account) < 40, "Account identifier exceeds supported length.");
        sprintf_s(summary.profile, "%s:slot%u", account, slot);
        std::wstring source = std::wstring(accountFolder) + L"\\slot" + std::to_wstring(slot) +
            L"\\save.save";
        FileRead snapshot = ReadStable(source);
        // Only the stable copied bytes are decoded; the game's file is never
        // opened for write.
        Bytes plain = Decode(snapshot.bytes);
        Reflection reflection(plain);
        auto states = reflection.Read();
        // v0.58: chests come from the same pass and list as the Bells;
        // v0.68: strongboxes also from their own field-object pass.
        FillChests(reflection.Chests(), reflection.Nexuses(), reflection.IslandNexuses(), plain, summary);
        FillAbyssChests(reflection.AbyssChests(), summary);
        summary.coverage = static_cast<unsigned>(states.size());
        static_assert(_countof(kBellLinks) <= 32, "Bell masks hold at most 32 Bells");
        for (unsigned index = 0; index < states.size(); ++index) {
            summary.recorded += states[index].recorded ? 1 : 0;
            summary.completed += states[index].completed ? 1 : 0;
            summary.recordedMask |= states[index].recorded ? 1u << index : 0u;
            summary.completedMask |= states[index].completed ? 1u << index : 0u;
            // "mg:543894" is the id of the Hernand Bell in kBellLinks.
            if (strcmp(kBellLinks[index].id, "mg:543894") == 0) {
                summary.hernandCompleted = states[index].completed;
            }
        }
        // Shrines: a separate pass that cannot change the Bell result above.
        FillShrines(plain, summary);
        // v0.88: Sealed Abyss Artifacts, likewise a separate pass.
        FillArtifacts(plain, summary);
        FillQuests(plain, summary); // v0.101: chest quest gates.
        modified = snapshot.modified;
        return true;
    } catch (const std::exception& exception) {
        strncpy_s(error, exception.what(), _TRUNCATE);
        return false;
    }
}

// Find a Bell's position in kBellLinks by its id; -1 if unknown.
int FindBellIndex(const char* id) {
    for (unsigned index = 0; index < _countof(kBellLinks); ++index) {
        if (id && strcmp(kBellLinks[index].id, id) == 0) {
            return static_cast<int>(index);
        }
    }
    return -1;
}

// A Bell's display name by index, or "" if the index is out of range.
const char* BellName(int index) {
    return index >= 0 && index < static_cast<int>(_countof(kBellLinks)) ? kBellLinks[index].name : "";
}

// A chest's display name by index, or "" if the index is out of range.
const char* ChestName(int index) {
    return index >= 0 && index < static_cast<int>(_countof(kChestLinks)) ? kChestLinks[index].name : "";
}

// A shrine's display name by index, or "" if the index is out of range.
const char* ShrineName(int index) {
    return index >= 0 && index < static_cast<int>(_countof(kShrineLinks)) ? kShrineLinks[index].name : "";
}

// Read the remembered slot from native-save-selection.ini in the mod's folder.
// Defaults to 101 if nothing is stored or the stored value is out of range.
unsigned LoadNativeSaveSlot(const wchar_t* runtimeDirectory) {
    std::wstring path = std::wstring(runtimeDirectory) + L"\\native-save-selection.ini";
    unsigned slot = GetPrivateProfileIntW(L"Save", L"Slot", 101, path.c_str());
    return slot <= 999 ? slot : 101;
}

// Let the user pick a save slot with a series of Yes/No/Cancel message boxes,
// one per existing save. On "Yes" the choice is stored in the mod's .ini file.
bool ChooseNativeSaveSlot(const wchar_t* runtimeDirectory, unsigned& slot, char (&error)[256]) {
    error[0] = 0;
    try {
        // Reuse SavePath() to find the account folder, then strip "\slotN\save.save".
        NativeSaveSummary summary = {};
        std::wstring source = SavePath(summary, slot);
        std::wstring accountPath = source.substr(0, source.find_last_of(L'\\'));
        accountPath.resize(accountPath.find_last_of(L'\\'));
        // One existing save: its slot number and last-modified time.
        struct SlotEntry { unsigned number; FILETIME modified; };
        SlotEntry slots[128] = {};
        unsigned count = 0;
        // Only existing slotNNN/save.save files are offered. Candidate paths
        // use bounded numeric values; no user text becomes a filesystem path.
        for (unsigned candidate = 0; candidate <= 999; ++candidate) {
            std::wstring path = accountPath + L"\\slot" + std::to_wstring(candidate) + L"\\save.save";
            WIN32_FILE_ATTRIBUTE_DATA attributes = {};
            if (GetFileAttributesExW(path.c_str(), GetFileExInfoStandard, &attributes) &&
                !(attributes.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY)) {
                Require(count < 128, "More than 128 save slots; selection was not changed.");
                slots[count++] = {candidate, attributes.ftLastWriteTime};
            }
        }
        Require(count != 0, "No existing save files are available for selection.");
        // Start the dialog at the currently selected slot, if it exists.
        unsigned current = 0;
        for (unsigned index = 0; index < count; ++index) {
            if (slots[index].number == slot) { current = index; }
        }
        // Show one save at a time: Yes selects it, No moves to the next one
        // (wrapping around), Cancel stops without changing anything.
        for (;;) {
            const SlotEntry& candidate = slots[current];
            FILETIME local = {};
            SYSTEMTIME time = {};
            Require(FileTimeToLocalFileTime(&candidate.modified, &local) &&
                FileTimeToSystemTime(&local, &time), "Save timestamp unavailable.");
            wchar_t label[64];
            // Slots 100 and 101 are shown as "Manual save 1/2" (a labelling choice).
            if (candidate.number == 100 || candidate.number == 101) {
                swprintf_s(label, L"Manual save %u (slot%u)", candidate.number - 99, candidate.number);
            } else {
                swprintf_s(label, L"Save slot%u", candidate.number);
            }
            wchar_t message[640];
            swprintf_s(message,
                L"%ls\nLast modified: %04u-%02u-%02u %02u:%02u:%02u (local)\n\nSave %u of %u\n\nYes: select this save\nNo: show next save\nCancel: keep current selection\n\nChoose the slot you loaded in the game.\nLoaded-slot detection is not implemented.",
                label, time.wYear, time.wMonth, time.wDay, time.wHour, time.wMinute,
                time.wSecond, current + 1, count);
            int response = MessageBoxW(nullptr, message, L"Pywel Atlas - select save",
                MB_YESNOCANCEL | MB_ICONQUESTION);
            if (response == IDCANCEL || response == 0) { return false; }
            if (response == IDYES) {
                std::wstring path = std::wstring(runtimeDirectory) + L"\\native-save-selection.ini";
                std::wstring value = std::to_wstring(candidate.number);
                Require(WritePrivateProfileStringW(L"Save", L"Slot", value.c_str(), path.c_str()) != 0,
                    "Cannot store selected slot; selection was not changed.");
                slot = candidate.number;
                return true;
            }
            current = (current + 1) % count;
        }
    } catch (const std::exception& exception) {
        strncpy_s(error, exception.what(), _TRUNCATE);
        return false;
    }
}
