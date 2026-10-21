// Native map research probe for the installed Steam build.
//
// This ASI observes functions traced from the native map's action selectors.
// F9 arms a one-shot destination redirect; F7 arms a new saved pin at the Bell.
// It runs inside the game's existing map call; it never calls game functions
// from this worker, moves the character, or opens save files.

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cmath>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <iterator>
#include <vector>
#include "vendor/minhook/include/MinHook.h"
#include "build-profile.h"

namespace {
constexpr size_t kCandidateCount = 5;
constexpr size_t kPositionCapture = 1;
constexpr size_t kPinPositionCapture = 3;
constexpr size_t kPinInsertCapture = 4;
const char* const kCaptureNames[] = {
    "find-path-action", "destination-handoff", "saved-pin-action",
    "saved-pin-handoff", "new-pin-insert"
};
uintptr_t imageBase = 0;
uint64_t sessionStarted = 0;
DWORD pendingReceiptSerial = 0;
ULONGLONG receiptDeadline = 0;

// The generated thunk accesses these exact offsets. The guard is shared with
// the worker: a busy capture is skipped rather than stalling a game thread.
struct alignas(16) Capture {
    float x;
    float y;
    float z;
    DWORD copies;
    volatile LONG guard;
    DWORD padding;
    uintptr_t caller;
    uint64_t pinKey;
    DWORD style;
    DWORD placementSerial;
    DWORD pinGroup;
    DWORD reserved;
    DWORD alignmentPadding[2];
};
static_assert(offsetof(Capture, guard) == 16, "Thunk layout changed");
static_assert(offsetof(Capture, caller) == 24, "Caller layout changed");
static_assert(offsetof(Capture, pinKey) == 32, "Pin key layout changed");
static_assert(offsetof(Capture, placementSerial) == 44, "Serial layout changed");
Capture captures[kCandidateCount] = {};
HANDLE logFile = INVALID_HANDLE_VALUE;
wchar_t receiptPath[MAX_PATH] = {};

struct RedirectState {
    volatile LONG armed;
    volatile LONG applied;
    uintptr_t allowedCaller;
    DWORD positionBits[3];
    DWORD padding;
};
static_assert(offsetof(RedirectState, allowedCaller) == 8, "Redirect layout changed");
static_assert(offsetof(RedirectState, positionBits) == 16, "Position layout changed");
RedirectState redirectState = {};
RedirectState pinRedirectState = {};

void AppendPositionRedirect(std::vector<unsigned char>& bytes, bool savedPin) {
    // RAX/R10 and flags are already saved by the surrounding capture thunk.
    // Each mode checks its traced caller and exact stack-local arguments.
    // Destination mode requires an unbound ground identity; pin mode requires
    // an unassigned ID so edits/removals cannot consume a new-pin arming.
    auto emit = [&](std::initializer_list<unsigned char> values) {
        bytes.insert(bytes.end(), values.begin(), values.end());
    };
    std::vector<size_t> skipBranches;
    auto skipUnlessEqual = [&]() {
        emit({0x0f, 0x85, 0, 0, 0, 0}); // jne end, patched below
        skipBranches.push_back(bytes.size() - 4);
    };
    emit({0x48, 0xb8});
    // Encode the state address without changing any additional registers.
    uintptr_t stateAddress = reinterpret_cast<uintptr_t>(
        savedPin ? &pinRedirectState : &redirectState);
    for (unsigned shift = 0; shift < 64; shift += 8) {
        bytes.push_back(static_cast<unsigned char>(stateAddress >> shift));
    }
    emit({0x4c, 0x8b, 0x50, 0x08});       // mov r10, [rax+8]: allowed caller
    emit({0x4c, 0x3b, 0x54, 0x24, 0x18}); // cmp r10, [rsp+24]: actual caller
    if (savedPin) {
        // The game's pin action has two feature-mode branches, both forwarding
        // owned XYZ scratch at RBP-0x59 with an unassigned pin ID. Accept only
        // the two call sites traced in that same action.
        emit({0x0f, 0x84, 0, 0, 0, 0});
        size_t primaryMatch = bytes.size() - 4;
        emit({0x49, 0xba});             // mov r10, alternate caller
        uintptr_t alternateCaller = imageBase + 0xd92157;
        for (unsigned shift = 0; shift < 64; shift += 8) {
            bytes.push_back(static_cast<unsigned char>(alternateCaller >> shift));
        }
        emit({0x4c, 0x3b, 0x54, 0x24, 0x18});
        skipUnlessEqual();
        int32_t distance = static_cast<int32_t>(bytes.size() - primaryMatch - 4);
        memcpy(bytes.data() + primaryMatch, &distance, sizeof(distance));
        emit({0x4c, 0x8d, 0x55, 0xa7}); // lea r10, [rbp-0x59]: pin XYZ
        emit({0x4d, 0x39, 0xd1});       // cmp r9, r10
        skipUnlessEqual();
        emit({0x4c, 0x8d, 0x55, 0x9f}); // lea r10, [rbp-0x61]: normal pin ID
        emit({0x4d, 0x39, 0xd0});       // cmp r8, r10
        emit({0x0f, 0x84, 0, 0, 0, 0});
        size_t primaryIdentity = bytes.size() - 4;
        emit({0x4c, 0x8d, 0x55, 0x87}); // lea r10, [rbp-0x79]: alternate pin ID
        emit({0x4d, 0x39, 0xd0});
        skipUnlessEqual();
        distance = static_cast<int32_t>(bytes.size() - primaryIdentity - 4);
        memcpy(bytes.data() + primaryIdentity, &distance, sizeof(distance));
        emit({0x49, 0x83, 0x38, 0xff}); // cmp qword [r8], -1: new pin only
    } else {
    skipUnlessEqual();
    emit({0x4c, 0x8d, 0x55, 0xbf});       // lea r10, [rbp-0x41]: caller XYZ local
    emit({0x4d, 0x39, 0xd0});             // cmp r8, r10
    skipUnlessEqual();
    emit({0x4c, 0x8d, 0x55, 0xe7});       // lea r10, [rbp-0x19]: caller identity local
    emit({0x4c, 0x39, 0xd2});             // cmp rdx, r10
    skipUnlessEqual();
    emit({0x48, 0x83, 0x3a, 0xff});       // cmp qword [rdx], -1: no selected icon
    skipUnlessEqual();
    emit({0x80, 0x7a, 0x08, 0x15});       // cmp byte [rdx+8], 0x15: ground identity
    }
    skipUnlessEqual();
    emit({0x45, 0x33, 0xd2});             // xor r10d, r10d
    emit({0x44, 0x87, 0x10});             // xchg [rax], r10d: consume arming atomically
    emit({0x41, 0x83, 0xfa, 0x01});       // cmp r10d, 1
    skipUnlessEqual();
    // Replace only this call's owned XYZ scratch values. Keeping its existing
    // pointer avoids guessing how long the receiving game code retains it.
    if (savedPin) {
        emit({0x44, 0x8b, 0x50, 0x10, 0x45, 0x89, 0x11});
        emit({0x44, 0x8b, 0x50, 0x14, 0x45, 0x89, 0x51, 0x04});
        emit({0x44, 0x8b, 0x50, 0x18, 0x45, 0x89, 0x51, 0x08});
    } else {
        emit({0x44, 0x8b, 0x50, 0x10, 0x45, 0x89, 0x10});
        emit({0x44, 0x8b, 0x50, 0x14, 0x45, 0x89, 0x50, 0x04});
        emit({0x44, 0x8b, 0x50, 0x18, 0x45, 0x89, 0x50, 0x08});
    }
    emit({0xf0, 0xff, 0x40, 0x04});       // lock inc dword [rax+4]: applied count
    for (size_t displacementOffset : skipBranches) {
        int32_t distance = static_cast<int32_t>(bytes.size() - displacementOffset - 4);
        memcpy(bytes.data() + displacementOffset, &distance, sizeof(distance));
    }
}

void Log(const char* message) {
    if (logFile == INVALID_HANDLE_VALUE) return;
    DWORD written = 0;
    WriteFile(logFile, message, static_cast<DWORD>(strlen(message)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

void LogHookStatus(const char* operation, size_t candidate, MH_STATUS status) {
    char line[256];
    sprintf_s(line, "%s function=%s status=%s (%d)",
        operation, kCaptureNames[candidate], MH_StatusToString(status),
        static_cast<int>(status));
    Log(line);
}

void OpenLog() {
    wchar_t directory[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, directory))) return;
    wcscat_s(directory, L"\\PywelAtlas");
    CreateDirectoryW(directory, nullptr);
    wcscpy_s(receiptPath, directory);
    wcscat_s(receiptPath, L"\\native-map-pin-receipt.json");
    wcscat_s(directory, L"\\native-map-probe.log");
    logFile = CreateFileW(directory, GENERIC_WRITE, FILE_SHARE_READ,
        nullptr, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
}

void AppendAddress(std::vector<unsigned char>& bytes, const void* address) {
    auto value = reinterpret_cast<uintptr_t>(address);
    for (unsigned shift = 0; shift < 64; shift += 8) {
        bytes.push_back(static_cast<unsigned char>(value >> shift));
    }
}

void* MakeCaptureThunk(Capture* capture, void* trampoline, size_t captureIndex) {
    bool savedPin = captureIndex == kPinPositionCapture;
    bool insertedPin = captureIndex == kPinInsertCapture;
    bool capturePosition = captureIndex == kPositionCapture || savedPin;
    // Preserve flags and scratch registers. At the destination hand-off's
    // entry, R8 points to three floats; the pin hand-off uses R9 instead.
    // Other observed functions only count calls.
    std::vector<unsigned char> bytes = {0x9c, 0x50, 0x41, 0x52, 0x48, 0xb8};
    AppendAddress(bytes, capture);
    const unsigned char acquire[] = {0xf0, 0x0f, 0xba, 0x68, 0x10, 0x00, 0x72, 0x00};
    bytes.insert(bytes.end(), std::begin(acquire), std::end(acquire));
    size_t busyBranch = bytes.size() - 1;
    if (insertedPin) {
        // This is the new-ID branch inside native pin apply, not its entry.
        // R15 addresses one 24-byte record: key, float3, shape, colour, padding.
        const unsigned char record[] = {
            0x4d, 0x8b, 0x17, 0x4c, 0x89, 0x50, 0x20,
            0x4d, 0x8b, 0x57, 0x08, 0x4c, 0x89, 0x10,
            0x45, 0x8b, 0x57, 0x10, 0x44, 0x89, 0x50, 0x08,
            0x45, 0x0f, 0xb7, 0x57, 0x14, 0x44, 0x89, 0x50, 0x28,
            // Caller entry RSP is +0xf8 from this branch; thunk pushes +0x18.
            0x4c, 0x8b, 0x94, 0x24, 0x10, 0x01, 0, 0,
            0x4c, 0x89, 0x50, 0x18,
            // Saved R8b group lived in the entry home area at entry RSP+0x18.
            0x44, 0x0f, 0xb6, 0x94, 0x24, 0x28, 0x01, 0, 0,
            0x44, 0x89, 0x50, 0x30,
            0x49, 0xba
        };
        bytes.insert(bytes.end(), std::begin(record), std::end(record));
        AppendAddress(bytes, &pinRedirectState);
        const unsigned char serial[] = {
            0x45, 0x8b, 0x52, 0x04, 0x44, 0x89, 0x50, 0x2c
        };
        bytes.insert(bytes.end(), std::begin(serial), std::end(serial));
    }
    if (capturePosition) {
        unsigned char copy[] = {
        0x4d, 0x8b, 0x10,             // mov r10, [r8] (or [r9] for pin position)
        0x4c, 0x89, 0x10,             // mov [rax], r10
        0x45, 0x8b, 0x50, 0x08,       // mov r10d, [r8+8]: third float bits
        0x44, 0x89, 0x50, 0x08,       // mov [rax+8], r10d
        };
        if (savedPin) {
            copy[2] = 0x11;
            copy[8] = 0x51;
        }
        bytes.insert(bytes.end(), std::begin(copy), std::end(copy));
    }
    const unsigned char caller[] = {
        0x4c, 0x8b, 0x54, 0x24, 0x18, // mov r10, [rsp+24]: original return address
        0x4c, 0x89, 0x50, 0x18,       // mov [rax+24], r10
    };
    if (!insertedPin) {
        bytes.insert(bytes.end(), std::begin(caller), std::end(caller));
    }
    const unsigned char finish[] = {
        0xff, 0x40, 0x0c,             // inc dword [rax+12]
        0xc7, 0x40, 0x10, 0, 0, 0, 0 // release guard
    };
    bytes.insert(bytes.end(), std::begin(finish), std::end(finish));
    bytes[busyBranch] = static_cast<unsigned char>(bytes.size() - busyBranch - 1);
    if (capturePosition) AppendPositionRedirect(bytes, savedPin);
    const unsigned char restore[] = {0x41, 0x5a, 0x58, 0x9d, 0xff, 0x25, 0, 0, 0, 0};
    bytes.insert(bytes.end(), std::begin(restore), std::end(restore));
    AppendAddress(bytes, trampoline);
    void* memory = VirtualAlloc(nullptr, bytes.size(), MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    if (!memory) return nullptr;
    memcpy(memory, bytes.data(), bytes.size());
    DWORD previous = 0;
    if (!VirtualProtect(memory, bytes.size(), PAGE_EXECUTE_READ, &previous)) {
        VirtualFree(memory, 0, MEM_RELEASE);
        return nullptr;
    }
    FlushInstructionCache(GetCurrentProcess(), memory, bytes.size());
    return memory;
}

bool Snapshot(const char* reason) {
    Log(reason);
    char redirectLine[160];
    sprintf_s(redirectLine, "bell_redirect armed=%ld applied=%ld",
        InterlockedCompareExchange(&redirectState.armed, 0, 0),
        InterlockedCompareExchange(&redirectState.applied, 0, 0));
    Log(redirectLine);
    sprintf_s(redirectLine, "bell_pin armed=%ld applied=%ld",
        InterlockedCompareExchange(&pinRedirectState.armed, 0, 0),
        InterlockedCompareExchange(&pinRedirectState.applied, 0, 0));
    Log(redirectLine);
    for (size_t index = 0; index < kCandidateCount; ++index) {
        auto& capture = captures[index];
        if (InterlockedCompareExchange(&capture.guard, 1, 0) != 0) continue;
        float x = capture.x;
        float y = capture.y;
        float z = capture.z;
        DWORD copies = capture.copies;
        uintptr_t caller = capture.caller;
        uint64_t pinKey = capture.pinKey;
        DWORD style = capture.style;
        DWORD serial = capture.placementSerial;
        DWORD group = capture.pinGroup;
        InterlockedExchange(&capture.guard, 0);
        char line[256];
        if (index == kPinInsertCapture && copies) {
            sprintf_s(line,
                "new_pin key=%llu calls=%lu serial=%lu group=%lu shape=%lu colour=%lu xyz=(%.6f, %.6f, %.6f) caller_rva=0x%llx",
                static_cast<unsigned long long>(pinKey), copies, serial, group,
                style & 0xff, (style >> 8) & 0xff, x, y, z,
                static_cast<unsigned long long>(caller - imageBase));
        } else if ((index == kPositionCapture || index == kPinPositionCapture) && copies &&
            std::isfinite(x) && std::isfinite(y) && std::isfinite(z)) {
            sprintf_s(line,
                "function=%s calls=%lu caller_rva=0x%llx raw_xyz=(%.6f, %.6f, %.6f)",
                kCaptureNames[index], copies,
                static_cast<unsigned long long>(caller - imageBase), x, y, z);
        } else {
            sprintf_s(line, "function=%s calls=%lu", kCaptureNames[index], copies);
        }
        Log(line);
    }
    return true;
}

void ObserveOwnershipReceipt() {
    static DWORD previousCount = 0;
    static DWORD recordedSerial = 0;
    auto& source = captures[kPinInsertCapture];
    if (InterlockedCompareExchange(&source.guard, 1, 0) != 0) return;
    Capture sample = source;
    InterlockedExchange(&source.guard, 0);
    if (sample.copies == previousCount) return;
    DWORD events = sample.copies - previousCount;
    previousCount = sample.copies;
    // A position match alone never claims ownership. Require a new insertion
    // acknowledged by the known handler after an explicitly applied F7 action.
    // If several insertions were coalesced, keep observations but claim none.
    const float bell[3] = {-10702.4970703125f, 631.1273193359375f, -3833.85888671875f};
    if (events != 1 || pendingReceiptSerial == 0 ||
        sample.placementSerial != pendingReceiptSerial ||
        GetTickCount64() > receiptDeadline || sample.placementSerial == 0 ||
        sample.placementSerial <= recordedSerial ||
        sample.caller != imageBase + 0xb9ddd3 ||
        sample.x != bell[0] || sample.y != bell[1] || sample.z != bell[2]) {
        return;
    }
    recordedSerial = sample.placementSerial;
    pendingReceiptSerial = 0;
    char json[1800];
    sprintf_s(json,
        "{\n  \"schemaVersion\": 1,\n  \"status\": \"candidate\",\n"
        "  \"poiId\": \"mg:543894\",\n  \"name\": \"Hernand Bell\",\n"
        "  \"pinKey\": \"%llu\",\n  \"pinGroup\": %lu,\n"
        "  \"shapeIndex\": %lu,\n  \"colorIndex\": %lu,\n"
        "  \"placementSerial\": %lu,\n  \"processId\": %lu,\n"
        "  \"sessionStarted\": %llu,\n  \"saveProfile\": null,\n"
        "  \"position\": [-10702.4970703125, 631.1273193359375, -3833.85888671875],\n"
        "  \"evidence\": \"Explicit F7 redirect followed by a new-key insertion from the creation acknowledgement.\",\n"
        "  \"scope\": \"Observation candidate only; save identity and reload persistence are not verified. No hiding or deletion authorized by this receipt.\"\n}\n",
        static_cast<unsigned long long>(sample.pinKey), sample.pinGroup,
        sample.style & 0xff, (sample.style >> 8) & 0xff,
        sample.placementSerial, GetCurrentProcessId(),
        static_cast<unsigned long long>(sessionStarted));
    HANDLE file = CreateFileW(receiptPath, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
    if (file == INVALID_HANDLE_VALUE) {
        Log("Ownership candidate observed, but receipt could not be written.");
        return;
    }
    DWORD written = 0;
    bool saved = WriteFile(file, json, static_cast<DWORD>(strlen(json)), &written, nullptr)
        && written == strlen(json);
    CloseHandle(file);
    Log(saved ? "New pin ownership CANDIDATE recorded; save/reload identity still unverified."
        : "Ownership receipt write was incomplete; do not use it.");
}

DWORD WINAPI Run(void* moduleAddress) {
    // DMM must remove the ASI only with the game closed. Pinning its module also
    // prevents an unexpected FreeLibrary from invalidating an active trampoline.
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS | GET_MODULE_HANDLE_EX_FLAG_PIN,
        reinterpret_cast<LPCWSTR>(moduleAddress), &pinned);
    OpenLog();
    Log("Pywel Atlas native map probe v0.6 - observe acknowledged pin ownership");
    FILETIME started = {};
    GetSystemTimeAsFileTime(&started);
    sessionStarted = (static_cast<uint64_t>(started.dwHighDateTime) << 32)
        | started.dwLowDateTime;
    auto base = reinterpret_cast<unsigned char*>(GetModuleHandleW(nullptr));
    imageBase = reinterpret_cast<uintptr_t>(base);
    auto dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    auto pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported executable build. No hooks installed.");
        return 0;
    }
    redirectState.allowedCaller = imageBase + 0xdc352f;
    pinRedirectState.allowedCaller = imageBase + 0xd922d6;
    // Same float coordinates observed in the v0.3 Bell hand-off and mapped
    // independently from the Hernand Bell scene object in bell-save-links.json.
    const float bellPosition[3] = {-10702.4970703125f, 631.1273193359375f, -3833.85888671875f};
    memcpy(redirectState.positionBits, bellPosition, sizeof(bellPosition));
    memcpy(pinRedirectState.positionBits, bellPosition, sizeof(bellPosition));

    void* sites[kCandidateCount] = {};
    auto section = IMAGE_FIRST_SECTION(pe);
    // Match complete function entry contexts in executable sections only.
    for (size_t candidate = 0; candidate < kCandidateCount; ++candidate) {
        unsigned matches = 0;
        for (unsigned index = 0; index < pe->FileHeader.NumberOfSections; ++index) {
            if (!(section[index].Characteristics & IMAGE_SCN_MEM_EXECUTE)) continue;
            auto start = base + section[index].VirtualAddress;
            size_t length = section[index].Misc.VirtualSize;
            for (size_t offset = 0; offset + kContextLength <= length; ++offset) {
                if (memcmp(start + offset, kCandidateContexts[candidate],
                    kContextLength) == 0) {
                    // These entries start with ordinary MOV instructions,
                    // avoiding the old AVX decoding issue.
                    sites[candidate] = start + offset;
                    ++matches;
                }
            }
        }
        if (matches != 1) {
            Log("Candidate missing, ambiguous, or already modified. No hooks installed.");
            return 0;
        }
    }

    MH_STATUS initializeStatus = MH_Initialize();
    if (initializeStatus != MH_OK) {
        LogHookStatus("Initialize", 0, initializeStatus);
        Log("Hook library unavailable. No hooks installed.");
        return 0;
    }
    // CreateHook needs the detour address before returning its trampoline. Give
    // it a reserved thunk, then populate that thunk before enabling any hook.
    for (size_t index = 0; index < kCandidateCount; ++index) {
        // MinHook checks that its detour is executable during preparation.
        // This page is changed to RX immediately after its jump is populated.
        void* reserved = VirtualAlloc(nullptr, 4096, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);
        void* trampoline = nullptr;
        if (!reserved) {
            char line[128];
            sprintf_s(line, "Capture allocation failed: Windows error %lu", GetLastError());
            Log(line);
            MH_Uninitialize();
            Log("Could not reserve capture code. None enabled.");
            return 0;
        }
        MH_STATUS createStatus = MH_CreateHook(sites[index], reserved, &trampoline);
        LogHookStatus("Prepare", index, createStatus);
        if (createStatus != MH_OK) {
            MH_Uninitialize();
            Log("Could not prepare capture hooks. None enabled.");
            return 0;
        }
        void* generated = MakeCaptureThunk(
            &captures[index], trampoline, index);
        if (!generated) {
            MH_Uninitialize();
            Log("Could not prepare capture code. None enabled.");
            return 0;
        }
        // A register-neutral absolute jump to the final capture code.
        unsigned char jump[14] = {0xff, 0x25, 0, 0, 0, 0};
        auto destination = reinterpret_cast<uintptr_t>(generated);
        memcpy(jump + 6, &destination, sizeof(destination));
        memcpy(reserved, jump, sizeof(jump));
        DWORD previous = 0;
        if (!VirtualProtect(reserved, 4096, PAGE_EXECUTE_READ, &previous)) {
            MH_Uninitialize();
            Log("Could not protect capture code. None enabled.");
            return 0;
        }
        FlushInstructionCache(GetCurrentProcess(), reserved, 14);
        MH_STATUS queueStatus = MH_QueueEnableHook(sites[index]);
        if (queueStatus != MH_OK) {
            LogHookStatus("Queue", index, queueStatus);
            MH_Uninitialize();
            Log("Could not queue capture hooks. None enabled.");
            return 0;
        }
    }
    MH_STATUS enableStatus = MH_ApplyQueued();
    if (enableStatus != MH_OK) {
        LogHookStatus("Enable", 0, enableStatus);
        // MinHook reports failures; remove any partially enabled hooks normally.
        MH_DisableHook(MH_ALL_HOOKS);
        MH_Uninitialize();
        Log("Could not enable capture hooks. Capture stopped.");
        return 0;
    }
    Log("Five traced capture points active. Press F8 after each map action.");
    Log("F9: arm Bell redirect for 30 seconds; F10/Escape: cancel. Game must be foreground.");
    Log("F7: arm one NEW saved pin at the Bell. Uses normal game pin capacity and persistence.");
    bool previousDown = false;
    bool previousArmDown = false;
    ULONGLONG armDeadline = 0;
    LONG previousApplied = 0;
    bool previousPinDown = false;
    ULONGLONG pinDeadline = 0;
    LONG previousPinApplied = 0;
    DWORD previousCalls[kCandidateCount] = {};
    unsigned automaticSnapshots = 0;
    while (true) {
        DWORD foregroundProcess = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foregroundProcess);
        bool gameForeground = foregroundProcess == GetCurrentProcessId();
        bool armDown = (GetAsyncKeyState(VK_F9) & 0x8000) != 0;
        if (gameForeground && armDown && !previousArmDown) {
            InterlockedExchange(&pinRedirectState.armed, 0);
            armDeadline = GetTickCount64() + 30000;
            InterlockedExchange(&redirectState.armed, 1);
            Log("Bell redirect armed: right-click EMPTY GROUND within 30 seconds.");
        }
        previousArmDown = armDown;
        bool pinDown = (GetAsyncKeyState(VK_F7) & 0x8000) != 0;
        if (gameForeground && pinDown && !previousPinDown) {
            InterlockedExchange(&redirectState.armed, 0);
            pinDeadline = GetTickCount64() + 30000;
            InterlockedExchange(&pinRedirectState.armed, 1);
            Log("Bell pin armed: create ONE new saved pin on empty ground within 30 seconds.");
        }
        previousPinDown = pinDown;
        bool cancelDown = ((GetAsyncKeyState(VK_F10) |
            GetAsyncKeyState(VK_ESCAPE)) & 0x8000) != 0;
        bool armed = InterlockedCompareExchange(&redirectState.armed, 0, 0) != 0;
        if (armed && (!gameForeground || cancelDown || GetTickCount64() >= armDeadline)) {
            if (InterlockedExchange(&redirectState.armed, 0) == 1) {
                Log("Bell redirect cancelled or expired without placement.");
            }
        }
        bool pinArmed = InterlockedCompareExchange(&pinRedirectState.armed, 0, 0) != 0;
        if (pinArmed && (!gameForeground || cancelDown || GetTickCount64() >= pinDeadline)) {
            if (InterlockedExchange(&pinRedirectState.armed, 0) == 1) {
                Log("Bell pin arming cancelled or expired without placement.");
            }
        }
        LONG pinApplied = InterlockedCompareExchange(&pinRedirectState.applied, 0, 0);
        if (pinApplied != previousPinApplied) {
            Log("Bell saved-pin position applied once. Confirm native creation and display visually.");
            pendingReceiptSerial = static_cast<DWORD>(pinApplied);
            receiptDeadline = GetTickCount64() + 10000;
            previousPinApplied = pinApplied;
        }
        ObserveOwnershipReceipt();
        LONG applied = InterlockedCompareExchange(&redirectState.applied, 0, 0);
        if (applied != previousApplied) {
            Log("Bell redirect applied to one ground destination: XYZ=(-10702.497070, 631.127319, -3833.858887).");
            previousApplied = applied;
        }
        bool down = (GetAsyncKeyState(VK_F8) & 0x8000) != 0;
        if (down && !previousDown) Snapshot("F8 snapshot");
        previousDown = down;
        // Observe every changed action count automatically as well as F8.
        // Disk writes stay on this worker, never inside the game's map calls.
        bool changed = false;
        for (size_t index = 0; index < kCandidateCount; ++index) {
            auto& capture = captures[index];
            if (InterlockedCompareExchange(&capture.guard, 1, 0) == 0) {
                DWORD calls = capture.copies;
                InterlockedExchange(&capture.guard, 0);
                if (calls != previousCalls[index]) changed = true;
                previousCalls[index] = calls;
            }
        }
        if (changed && automaticSnapshots < 1000) {
            Snapshot("Map action observed");
            ++automaticSnapshots;
        }
        Sleep(30);
    }
}
} // namespace

BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(instance);
        // Do archive scans, logging, and hook setup outside the loader lock.
        HANDLE thread = CreateThread(nullptr, 0, Run, instance, 0, nullptr);
        if (thread) CloseHandle(thread);
    }
    return TRUE;
}
