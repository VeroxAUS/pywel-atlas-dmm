// Native read-only save envelope/reflection reader, scoped to verified Bells.
// Save format interpretation is adapted from LukeFZ/pycrimson (MIT; bundled
// license). Only authenticated snapshots can produce completion confirmations.
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

namespace {
using Bytes = std::vector<uint8_t>;
constexpr size_t kMaximumSave = 32 * 1024 * 1024;
constexpr size_t kMaximumPlain = 128 * 1024 * 1024;

void Require(bool condition, const char* message) {
    if (!condition) {
        throw std::runtime_error(message);
    }
}

// Bounds-checked little-endian cursor. Every seek and length is validated;
// unsupported reflection versions/types fail rather than guessing completion.
struct Cursor {
    const Bytes& bytes;
    size_t offset = 0;
    size_t limit;
    explicit Cursor(const Bytes& input) : bytes(input), limit(input.size()) {}
    void Need(size_t count) const {
        Require(offset <= limit && count <= limit - offset, "Truncated save structure.");
    }
    const uint8_t* Take(size_t count) {
        Need(count);
        const uint8_t* result = bytes.data() + offset;
        offset += count;
        return result;
    }
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
    void Skip(size_t count) { Take(count); }
    std::string String() {
        uint32_t size = U32();
        Require(size <= 1024 * 1024, "Reflection string exceeds limit.");
        const auto* text = Take(size);
        return std::string(reinterpret_cast<const char*>(text), size);
    }
    void SeekForward(size_t target) {
        Require(target >= offset && target <= limit, "Invalid reflection object offset.");
        offset = target;
    }
};

uint32_t Load32(const uint8_t* value) {
    return static_cast<uint32_t>(value[0]) | (static_cast<uint32_t>(value[1]) << 8) |
        (static_cast<uint32_t>(value[2]) << 16) | (static_cast<uint32_t>(value[3]) << 24);
}

uint32_t Rotate(uint32_t value, unsigned bits) {
    return (value << bits) | (value >> (32 - bits));
}

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

Bytes Decrypt(const uint8_t* input, size_t size, const uint8_t* nonce,
    const std::array<uint8_t, 32>& key) {
    // Original ChaCha20: 64-bit counter then 64-bit nonce, as used by the
    // existing reader's cryptography.ChaCha20 16-byte nonce ABI (not IETF AEAD).
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
        if (++state[12] == 0) {
            ++state[13];
        }
    }
    return output;
}

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
        status = BCryptHashData(hash, const_cast<PUCHAR>(plain.data()), static_cast<ULONG>(plain.size()), 0);
    }
    if (status >= 0) {
        status = BCryptFinishHash(hash, digest.data(), static_cast<ULONG>(digest.size()), 0);
    }
    if (hash) {
        BCryptDestroyHash(hash);
    }
    BCryptCloseAlgorithmProvider(algorithm, 0);
    Require(status >= 0, "Windows HMAC calculation failed.");
    unsigned different = 0;
    for (unsigned index = 0; index < digest.size(); ++index) {
        different |= digest[index] ^ signature[index];
    }
    Require(different == 0, "Save authentication failed; no progress confirmed.");
}

Bytes Expand(const Bytes& input, size_t expected) {
    // Independent bounded decoder of the LZ4 block format. Match copying must
    // permit overlap. Format: https://github.com/lz4/lz4/blob/dev/doc/lz4_Block_format.md
    Cursor reader(input);
    Bytes output;
    output.reserve(expected);
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

Bytes Decode(const Bytes& file) {
    Cursor header(file);
    Require(file.size() >= 128 && memcmp(header.Take(4), "SAVE", 4) == 0, "Unsupported save magic.");
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
    constexpr uint8_t base[31] = {
        0xc4,0x1b,0x8e,0x73,0x0d,0xf2,0x59,0xa6,0x37,0xcc,0x04,0xe9,0xb1,0x2f,0x96,0x68,
        0xda,0x10,0x7a,0x85,0x3e,0x61,0xf9,0x22,0x4d,0xb8,0x0a,0xd7,0x5c,0x13,0xef
    };
    const std::string material = "^Pearl--#Abyss__@!!PRIVATE_HMAC_SECRET_CHECK";
    std::array<uint8_t, 32> key = {};
    for (unsigned index = 0; index < 31; ++index) {
        key[index] = base[index] ^ static_cast<uint8_t>(material[index]);
    }
    Bytes plain = Decrypt(file.data() + size, compressed, nonce, key);
    Authenticate(plain, key, signature);
    return compressed == expanded ? plain : Expand(plain, expanded);
}

struct Property {
    std::string name;
    std::string typeName;
    uint16_t kind;
    uint16_t size;
    uint32_t flags;
};
struct Type {
    std::string name;
    std::vector<Property> properties;
};
struct ObjectInfo {
    uint16_t type;
    uint32_t offset;
    uint32_t size;
};
struct Record {
    std::array<uint32_t, 4> uuid = {};
    uint32_t key = 0;
    bool uuidKnown = false;
    bool keyKnown = false;
    bool completed = false;
};
struct BellState {
    bool recorded = false;
    bool completed = false;
};

class Reflection {
    Cursor reader;
    uint32_t metadata = 0;
    uint32_t version = 0;
    std::vector<Type> types;
    std::array<BellState, _countof(kBellLinks)> states = {};
    size_t objectsVisited = 0;
    bool bellListVisited = false;

    uint32_t Count(uint32_t maximum = 1000000) {
        uint32_t count = reader.U32();
        Require(count <= maximum, "Reflection collection exceeds limit.");
        return count;
    }
    bool Array(uint16_t kind) { return kind == 3 || kind == 6 || kind == 7 || kind == 9 || kind == 10; }

    void Match(const Record& record) {
        if (!record.uuidKnown || !record.keyKnown) {
            return;
        }
        for (unsigned index = 0; index < _countof(kBellLinks); ++index) {
            const auto& link = kBellLinks[index];
            if (memcmp(link.uuid, record.uuid.data(), sizeof(link.uuid)) == 0 &&
                std::find(std::begin(link.keys), std::end(link.keys), record.key) != std::end(link.keys)) {
                states[index].recorded = true;
                states[index].completed |= record.completed;
            }
        }
    }

    void Scalar(const Property& property, size_t size, Record* record) {
        const uint8_t* value = reader.Take(size);
        if (!record) {
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

    void Object(unsigned depth, bool record, bool top, uint16_t knownType = 0, bool named = false) {
        Require(depth <= 64 && ++objectsVisited <= 1000000, "Reflection nesting/object limit exceeded.");
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
        Require(bitmapSize >= (type.properties.size() + 7) / 8, "Property bitmap too short.");
        size_t start = reader.offset;
        reader.Skip(1); // Version >=10 object flag.
        bool noTags = reader.U8() == 1;
        if (!noTags) {
            uint16_t tags = reader.U16();
            for (unsigned index = 0; index < tags; ++index) {
                Require(reader.U16() < type.properties.size(), "Invalid property tag.");
                reader.String();
            }
        }
        Record item;
        for (size_t index = 0; index < type.properties.size(); ++index) {
            const Property& property = type.properties[index];
            bool array = Array(property.kind);
            bool present = ((bitmap[index / 8] >> (index & 7)) & 1) != 0;
            if ((property.flags & 0x82) != 0 || (!array && !present)) {
                continue;
            }
            bool bellList = type.name == "DiscoveredLevelGimmickSceneObjectSaveData" &&
                property.name == "_discoveredLevelGimmickSceneObjectSaveDataList";
            if (bellList) {
                Require(property.kind == 6 || property.kind == 7, "Unsupported Bell list representation.");
                bellListVisited = true;
            }
            if (version >= 15 && array && reader.U8() == 1) {
                continue;
            }
            Record* capture = record ? &item : nullptr;
            switch (property.kind) {
            case 0:
            case 2:
                Scalar(property, property.size, capture);
                break;
            case 1:
                Scalar(property, Count(static_cast<uint32_t>(kMaximumPlain)), capture);
                break;
            case 3: {
                uint32_t count = Count();
                reader.Skip(static_cast<size_t>(count) * property.size);
                break;
            }
            case 4:
                Object(depth + 1, false, false);
                break;
            case 5:
                if (reader.U8() != 0) { Object(depth + 1, false, false); }
                break;
            case 6:
            case 7: {
                uint32_t count = Count();
                bool hasNames = version >= 14 && reader.U8() == 1;
                reader.Skip(8);
                int32_t unknownCount = static_cast<int32_t>(reader.U32());
                Require(unknownCount <= 1000000, "Invalid reflection array metadata.");
                if (unknownCount > 0) {
                    reader.Skip(static_cast<size_t>(unknownCount) * (hasNames ? 12 : 8));
                }
                for (uint32_t entry = 0; entry < count; ++entry) {
                    Object(depth + 1, bellList, false, 0, hasNames);
                }
                break;
            }
            case 10: {
                uint32_t count = Count();
                for (uint32_t entry = 0; entry < count; ++entry) {
                    reader.Skip(static_cast<size_t>(Count()) * property.size);
                }
                break;
            }
            default:
                throw std::runtime_error("Unsupported reflected property kind in Bell container.");
            }
        }
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
    auto Read() {
        Require(reader.U16() == 0xffff, "Unsupported legacy reflection header.");
        metadata = reader.U32();
        if (metadata < 3 || metadata > 4) {
            throw std::runtime_error("Unsupported native reflection metadata version: " + std::to_string(metadata));
        }
        if (metadata >= 4) { reader.Skip(8); }
        version = reader.U32();
        if (version < 11 || version > 15) {
            throw std::runtime_error("Unsupported native reflection serialization version: " + std::to_string(version));
        }
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
        if (version > 13) {
            uint32_t names = Count();
            for (uint32_t index = 0; index < names; ++index) { reader.String(); }
        }
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
                info.size <= reader.bytes.size() - info.offset, "Invalid reflection object table entry.");
            entries.push_back(info);
        }
        unsigned containers = 0;
        for (const auto& info : entries) {
            if (types[info.type].name != "DiscoveredLevelGimmickSceneObjectSaveData") { continue; }
            ++containers;
            reader.offset = info.offset;
            reader.limit = info.offset + info.size;
            Object(0, false, true, info.type);
        }
        Require(containers == 1 && bellListVisited, "Save has no unique supported Bell discovery container/list.");
        return states;
    }
};

bool Digits(const wchar_t* name) {
    if (!*name) { return false; }
    for (; *name; ++name) { if (*name < L'0' || *name > L'9') { return false; } }
    return true;
}

std::wstring SavePath(NativeSaveSummary& summary, unsigned slot) {
    Require(slot <= 999, "Selected save slot exceeds supported range.");
    wchar_t local[MAX_PATH] = {};
    Require(SUCCEEDED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, local)), "Local AppData unavailable.");
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

struct FileRead {
    Bytes bytes;
    FILETIME modified;
};
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
    bool complete = ReadFile(file, bytes.data(), static_cast<DWORD>(bytes.size()), &count, nullptr) && count == bytes.size();
    CloseHandle(file);
    Require(complete, "Save changed or could not be read completely.");
    return {std::move(bytes), modified};
}

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
} // namespace

bool ReadSelectedBellSave(const wchar_t* runtimeDirectory, unsigned slot, NativeSaveSummary& summary,
    char (&error)[256]) {
    summary = {};
    error[0] = 0;
    try {
        std::wstring source = SavePath(summary, slot);
        FileRead snapshot;
        bool stable = false;
        for (unsigned attempt = 0; attempt < 4; ++attempt) {
            FileRead first = ReadSource(source);
            Sleep(120);
            FileRead second = ReadSource(source);
            if (CompareFileTime(&first.modified, &second.modified) == 0 && first.bytes == second.bytes) {
                snapshot = std::move(second);
                stable = true;
                break;
            }
        }
        Require(stable, "Save is still changing; no completion was inferred.");
        // Only the stable copied bytes are decoded. The game's save directory
        // is never opened for write. Diagnostic files live under mod AppData.
        std::wstring runtime(runtimeDirectory);
        std::string profile(summary.profile);
        std::replace(profile.begin(), profile.end(), ':', '-');
        std::wstring snapshotName(profile.begin(), profile.end());
        WriteLocal(runtime + L"\\native-save-proof-" + snapshotName + L".save",
            snapshot.bytes.data(), snapshot.bytes.size());
        Bytes plain = Decode(snapshot.bytes);
        auto states = Reflection(plain).Read();
        summary.coverage = static_cast<unsigned>(states.size());
        std::ostringstream report;
        FILETIME now = {};
        GetSystemTimeAsFileTime(&now);
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
            if (strcmp(kBellLinks[index].id, "mg:543894") == 0) {
                summary.hernandCompleted = state.completed;
            }
            report << "    {\"id\":\"" << kBellLinks[index].id << "\",\"name\":\"" << kBellLinks[index].name
                   << "\",\"state\":\"" << (state.completed ? "completed" : state.recorded ? "recorded" : "unrecorded")
                   << "\",\"confirmed\":" << (state.completed ? "true" : "false") << "}"
                   << (index + 1 < states.size() ? "," : "") << "\n";
        }
        report << "  ]\n}\n";
        std::string output = report.str();
        WriteLocal(runtime + L"\\native-save-progress.json", output.data(), output.size());
        return true;
    } catch (const std::exception& exception) {
        strncpy_s(error, exception.what(), _TRUNCATE);
        return false;
    }
}

unsigned LoadNativeSaveSlot(const wchar_t* runtimeDirectory) {
    std::wstring path = std::wstring(runtimeDirectory) + L"\\native-save-selection.ini";
    unsigned slot = GetPrivateProfileIntW(L"Save", L"Slot", 101, path.c_str());
    return slot <= 999 ? slot : 101;
}

bool ChooseNativeSaveSlot(const wchar_t* runtimeDirectory, unsigned& slot, char (&error)[256]) {
    error[0] = 0;
    try {
        NativeSaveSummary summary = {};
        std::wstring source = SavePath(summary, slot);
        std::wstring accountPath = source.substr(0, source.find_last_of(L'\\'));
        accountPath.resize(accountPath.find_last_of(L'\\'));
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
        unsigned current = 0;
        for (unsigned index = 0; index < count; ++index) {
            if (slots[index].number == slot) { current = index; }
        }
        for (;;) {
            const SlotEntry& candidate = slots[current];
            FILETIME local = {};
            SYSTEMTIME time = {};
            Require(FileTimeToLocalFileTime(&candidate.modified, &local) &&
                FileTimeToSystemTime(&local, &time), "Save timestamp unavailable.");
            wchar_t label[64];
            if (candidate.number == 100 || candidate.number == 101) {
                swprintf_s(label, L"Manual save %u (slot%u)", candidate.number - 99, candidate.number);
            } else {
                swprintf_s(label, L"Save slot%u", candidate.number);
            }
            wchar_t message[640];
            swprintf_s(message, L"%ls\nLast modified: %04u-%02u-%02u %02u:%02u:%02u (local)\n\nSave %u of %u\n\nYes: select this save\nNo: show next save\nCancel: keep current selection\n\nChoose the slot you loaded in the game.\nLoaded-slot detection is not implemented.",
                label, time.wYear, time.wMonth, time.wDay, time.wHour, time.wMinute,
                time.wSecond, current + 1, count);
            int response = MessageBoxW(nullptr, message, L"Pywel Atlas - select save", MB_YESNOCANCEL | MB_ICONQUESTION);
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
