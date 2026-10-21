// Parse one explicit proof definition with Windows' JSON runtime. Disk work
// happens on the plugin worker only; the game UI receives copied values.
#define NOMINMAX
#include "NativeMarkerDefinition.h"
#include "marker-default.h"
#include <roapi.h>
#include <windows.data.json.h>
#include <wrl.h>
#include <wrl/wrappers/corewrappers.h>
#include <cmath>
#include <cstdio>
#include <cstring>
#include <string>
#include <vector>

using ABI::Windows::Data::Json::IJsonObject;
using ABI::Windows::Data::Json::IJsonObjectStatics;
using Microsoft::WRL::ComPtr;
using Microsoft::WRL::Wrappers::HString;
using Microsoft::WRL::Wrappers::HStringReference;

namespace {
bool Reject(char (&error)[256], const char* reason) {
    strcpy_s(error, reason);
    return false;
}

bool ReadJson(const wchar_t* path, std::wstring& text, char (&error)[256]) {
    HANDLE file = CreateFileW(path, GENERIC_READ, FILE_SHARE_READ, nullptr,
        OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (file == INVALID_HANDLE_VALUE && GetLastError() == ERROR_FILE_NOT_FOUND) {
        // CREATE_NEW never replaces existing configuration, including when
        // another caller creates it between the failed read and this call.
        HANDLE seed = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
            CREATE_NEW, FILE_ATTRIBUTE_NORMAL, nullptr);
        if (seed != INVALID_HANDLE_VALUE) {
            DWORD written = 0;
            DWORD length = static_cast<DWORD>(strlen(kDefaultMarkerJson));
            bool complete = WriteFile(seed, kDefaultMarkerJson, length, &written,
                nullptr) && written == length;
            CloseHandle(seed);
            if (!complete) {
                return Reject(error, "Could not finish the default definition; file preserved for inspection.");
            }
        }
        file = CreateFileW(path, GENERIC_READ, FILE_SHARE_READ, nullptr,
            OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, nullptr);
    }
    if (file == INVALID_HANDLE_VALUE) {
        return Reject(error, "Cannot open local marker definition; finish saving it and retry F6.");
    }
    // Denying write/delete sharing prevents a partial edit or replacement
    // during this short read. No lock is held while parsing or touching UI.
    LARGE_INTEGER size = {};
    if (!GetFileSizeEx(file, &size) || size.QuadPart < 1 || size.QuadPart > 65536) {
        CloseHandle(file);
        return Reject(error, "Marker JSON must contain between 1 and 65536 bytes.");
    }
    DWORD length = static_cast<DWORD>(size.QuadPart);
    std::vector<char> bytes(length);
    DWORD count = 0;
    bool complete = ReadFile(file, bytes.data(), length, &count, nullptr) && count == length;
    CloseHandle(file);
    if (!complete) {
        return Reject(error, "Could not read a complete marker definition.");
    }
    unsigned start = length >= 3 && static_cast<unsigned char>(bytes[0]) == 0xef &&
        static_cast<unsigned char>(bytes[1]) == 0xbb &&
        static_cast<unsigned char>(bytes[2]) == 0xbf ? 3u : 0u;
    int characters = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS,
        bytes.data() + start, length - start, nullptr, 0);
    if (characters <= 0) {
        return Reject(error, "Marker JSON must be valid UTF-8.");
    }
    text.resize(characters);
    if (MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, bytes.data() + start,
        length - start, text.data(), characters) != characters) {
        return Reject(error, "Could not decode complete UTF-8 marker JSON.");
    }
    return true;
}

bool Equals(IJsonObject* object, const wchar_t* key, const wchar_t* expected) {
    HString value;
    if (FAILED(object->GetNamedString(HStringReference(key).Get(), value.GetAddressOf()))) {
        return false;
    }
    unsigned length = 0;
    const wchar_t* text = value.GetRawBuffer(&length);
    return length == wcslen(expected) && wmemcmp(text, expected, length) == 0;
}

bool Parse(const std::wstring& text, MarkerDefinition& output, char (&error)[256]) {
    ComPtr<IJsonObjectStatics> factory;
    HRESULT status = RoGetActivationFactory(
        HStringReference(RuntimeClass_Windows_Data_Json_JsonObject).Get(),
        IID_PPV_ARGS(&factory));
    HString input;
    ComPtr<IJsonObject> root;
    if (FAILED(status) || FAILED(input.Set(text.c_str(), static_cast<unsigned>(text.size()))) ||
        FAILED(factory->Parse(input.Get(), &root))) {
        return Reject(error, "Invalid JSON or Windows JSON runtime unavailable.");
    }
    double version = 0;
    if (FAILED(root->GetNamedNumber(HStringReference(L"schemaVersion").Get(), &version)) ||
        version != 1 || !Equals(root.Get(), L"id", L"atlas-chest-proof") ||
        !Equals(root.Get(), L"region", L"pywel") || !Equals(root.Get(), L"icon", L"chest")) {
        return Reject(error, "Expected schemaVersion 1, atlas-chest-proof, pywel and chest.");
    }
    ComPtr<IJsonObject> completion;
    if (FAILED(root->GetNamedObject(HStringReference(L"completion").Get(), &completion)) ||
        !Equals(completion.Get(), L"source", L"none")) {
        return Reject(error, "Only completion.source=none is supported; no discovery is inferred.");
    }
    boolean enabled = false;
    HString name;
    if (FAILED(root->GetNamedBoolean(HStringReference(L"enabled").Get(), &enabled)) ||
        FAILED(root->GetNamedString(HStringReference(L"name").Get(), name.GetAddressOf()))) {
        return Reject(error, "Definition needs boolean enabled and string name.");
    }
    unsigned nameLength = 0;
    const wchar_t* nameText = name.GetRawBuffer(&nameLength);
    if (!nameLength || nameLength > 127) {
        return Reject(error, "Name must be nonempty and fit in 127 UTF-8 bytes.");
    }
    for (unsigned character = 0; character < nameLength; ++character) {
        if (nameText[character] < 0x20) {
            return Reject(error, "Name must not contain control characters.");
        }
    }
    int written = WideCharToMultiByte(CP_UTF8, WC_ERR_INVALID_CHARS, nameText,
        nameLength, output.name, sizeof(output.name) - 1, nullptr, nullptr);
    if (written <= 0) {
        return Reject(error, "Name must be nonempty and fit in 127 UTF-8 bytes.");
    }
    output.name[written] = 0;
    output.enabled = enabled != 0;
    ComPtr<IJsonObject> position;
    if (FAILED(root->GetNamedObject(HStringReference(L"position").Get(), &position))) {
        return Reject(error, "Definition needs a position object with game x/y/z.");
    }
    const wchar_t* axes[] = {L"x", L"y", L"z"};
    for (unsigned axis = 0; axis < 3; ++axis) {
        double number = 0;
        if (FAILED(position->GetNamedNumber(HStringReference(axes[axis]).Get(), &number)) ||
            !std::isfinite(number) || std::abs(number) > 1000000) {
            // A conservative input limit protects later grid/projection math;
            // it is not a claim about the game's actual world boundaries.
            return Reject(error, "Each coordinate must be finite and within +/-1000000.");
        }
        output.position[axis] = static_cast<float>(number);
    }
    return true;
}
} // namespace

bool LoadMarkerDefinition(const wchar_t* path, MarkerDefinition& definition,
    char (&error)[256]) {
    error[0] = 0;
    std::wstring text;
    if (!ReadJson(path, text, error)) {
        return false;
    }
    HRESULT initialized = RoInitialize(RO_INIT_MULTITHREADED);
    if (FAILED(initialized)) {
        return Reject(error, "Could not initialize the worker's Windows JSON runtime.");
    }
    MarkerDefinition candidate = {};
    bool parsed = Parse(text, candidate, error);
    RoUninitialize();
    if (parsed) {
        definition = candidate;
    }
    return parsed;
}
