// Manually activated display-only proof for the verified Bell pin.
// The hook substitutes presentation argument pointers at the listener dispatch
// boundary. A module-lifetime preview payload separates overlapping glyphs.
// No source record, queued record, pin list or save is written by this hook.
#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cstddef>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include <initializer_list>
#include <vector>
#include "vendor/minhook/include/MinHook.h"
#include "display-profile.h"

namespace {
struct DisplayState {
    volatile LONG enabled;
    volatile LONG matched;
    volatile LONG styled;
    DWORD padding;
    uintptr_t caller;
    uint64_t key;
    DWORD position[3];
    DWORD shape;
    DWORD colour;
    DWORD group;
    DWORD previewX;
    volatile LONG keySeen;
    volatile LONG64 lastCaller;
    volatile LONG subscriberCount;
    DWORD listenerPadding;
    volatile LONG64 firstCallback;
    volatile LONG64 secondCallback;
    uintptr_t queuedCaller;
    DWORD previewPosition[3];
    BYTE previewShape;
    BYTE previewColour;
    BYTE payloadPadding[2];
    volatile LONG dispatchCalls;
    DWORD tailPadding;
};
static_assert(offsetof(DisplayState, caller) == 16, "Display caller offset changed");
static_assert(offsetof(DisplayState, key) == 24, "Display key offset changed");
static_assert(offsetof(DisplayState, position) == 32, "Display position offset changed");
static_assert(offsetof(DisplayState, group) == 52, "Display group offset changed");
static_assert(offsetof(DisplayState, previewX) == 56, "Preview X offset changed");
static_assert(offsetof(DisplayState, lastCaller) == 64, "Caller record offset changed");
static_assert(offsetof(DisplayState, queuedCaller) == 96, "Queued caller offset changed");
static_assert(offsetof(DisplayState, previewPosition) == 104, "Preview position offset changed");
static_assert(offsetof(DisplayState, previewShape) == 116, "Preview shape offset changed");
static_assert(offsetof(DisplayState, dispatchCalls) == 120, "Dispatch counter offset changed");
DisplayState state = {};
HANDLE logFile = INVALID_HANDLE_VALUE;
HWND toast = nullptr;
HFONT toastFont = nullptr;
ULONGLONG toastUntil = 0;

void Log(const char* message) {
    if (logFile == INVALID_HANDLE_VALUE) return;
    DWORD written = 0;
    WriteFile(logFile, message, static_cast<DWORD>(strlen(message)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

void OpenLog() {
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) return;
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\native-map-preview.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
}

void ShowStatus(const wchar_t* text) {
    // This is a non-activating Windows status toast for the experiment. It is
    // separate from the game's native marker and cannot take keyboard focus.
    if (!toast) {
        toast = CreateWindowExW(WS_EX_TOPMOST | WS_EX_NOACTIVATE |
            WS_EX_TOOLWINDOW | WS_EX_LAYERED, L"STATIC", L"",
            WS_POPUP | SS_CENTER | SS_CENTERIMAGE,
            0, 0, 680, 54, nullptr, nullptr, GetModuleHandleW(nullptr), nullptr);
        toastFont = CreateFontW(-21, 0, 0, 0, FW_SEMIBOLD, FALSE, FALSE, FALSE,
            DEFAULT_CHARSET, OUT_DEFAULT_PRECIS, CLIP_DEFAULT_PRECIS,
            CLEARTYPE_QUALITY, DEFAULT_PITCH, L"Segoe UI");
        if (toastFont) SendMessageW(toast, WM_SETFONT,
            reinterpret_cast<WPARAM>(toastFont), TRUE);
        if (toast) SetLayeredWindowAttributes(toast, 0, 240, LWA_ALPHA);
    }
    if (!toast) return;
    RECT bounds = {};
    GetWindowRect(GetForegroundWindow(), &bounds);
    SetWindowTextW(toast, text);
    SetWindowPos(toast, HWND_TOPMOST,
        bounds.left + (bounds.right - bounds.left - 680) / 2,
        bounds.top + 36, 680, 54, SWP_NOACTIVATE | SWP_SHOWWINDOW);
    toastUntil = GetTickCount64() + 6500;
}

void AppendAddress(std::vector<unsigned char>& bytes, const void* address) {
    uintptr_t value = reinterpret_cast<uintptr_t>(address);
    for (unsigned shift = 0; shift < 64; shift += 8) {
        bytes.push_back(static_cast<unsigned char>(value >> shift));
    }
}

void* MakeDisplayThunk(void* trampoline) {
    // Dispatch entry: RDX=listener list, R8=key pointer, R9=float3 pointer.
    // Stack +0x28/+0x30/+0x38 are shape/colour/group pointers. Thunk pushes
    // add 0x18. The dispatcher copies these values to each callback. Payload
    // pointers use this pinned module's lifetime, and original buffers stay intact.
    std::vector<unsigned char> bytes = {0x9c, 0x50, 0x41, 0x52, 0x48, 0xb8};
    AppendAddress(bytes, &state);
    auto emit = [&](std::initializer_list<unsigned char> values) {
        bytes.insert(bytes.end(), values.begin(), values.end());
    };
    std::vector<size_t> exits;
    auto requireEqual = [&]() {
        emit({0x0f, 0x85, 0, 0, 0, 0});
        exits.push_back(bytes.size() - 4);
    };
    emit({0xf0, 0xff, 0x40, 0x78});       // all dispatcher calls
    emit({0x4c, 0x8b, 0x50, 0x10});       // expected native caller
    emit({0x4c, 0x3b, 0x54, 0x24, 0x18});
    emit({0x0f, 0x84, 0, 0, 0, 0});
    size_t directCaller = bytes.size() - 4;
    emit({0x4c, 0x8b, 0x50, 0x60});       // alternate queued-delivery caller
    emit({0x4c, 0x3b, 0x54, 0x24, 0x18});
    requireEqual();
    int32_t distance = static_cast<int32_t>(bytes.size() - directCaller - 4);
    memcpy(bytes.data() + directCaller, &distance, sizeof(distance));
    emit({0x4d, 0x8b, 0x10});             // native 64-bit key from R8
    emit({0x4c, 0x3b, 0x50, 0x18});
    requireEqual();
    emit({0xf0, 0xff, 0x40, 0x3c});
    emit({0x4c, 0x8b, 0x54, 0x24, 0x18, 0x4c, 0x89, 0x50, 0x40});
    // Capture two subscriber addresses for follow-up tracing, with list bounds.
    emit({0x48, 0xc7, 0x40, 0x50, 0, 0, 0, 0});
    emit({0x48, 0xc7, 0x40, 0x58, 0, 0, 0, 0});
    emit({0x44, 0x8b, 0x52, 0x08, 0x44, 0x89, 0x50, 0x48});
    emit({0x45, 0x85, 0xd2, 0x0f, 0x84, 0, 0, 0, 0});
    size_t noListeners = bytes.size() - 4;
    emit({0x4c, 0x8b, 0x12, 0x4d, 0x8b, 0x52, 0x08, 0x4c, 0x89, 0x50, 0x50});
    emit({0x83, 0x78, 0x48, 0x01, 0x0f, 0x86, 0, 0, 0, 0});
    size_t onlyOneListener = bytes.size() - 4;
    emit({0x4c, 0x8b, 0x12, 0x4d, 0x8b, 0x52, 0x28, 0x4c, 0x89, 0x50, 0x58});
    for (size_t offset : {noListeners, onlyOneListener}) {
        distance = static_cast<int32_t>(bytes.size() - offset - 4);
        memcpy(bytes.data() + offset, &distance, sizeof(distance));
    }
    emit({0x45, 0x8b, 0x11, 0x44, 0x3b, 0x50, 0x20});
    requireEqual();
    emit({0x45, 0x8b, 0x51, 0x04, 0x44, 0x3b, 0x50, 0x24});
    requireEqual();
    emit({0x45, 0x8b, 0x51, 0x08, 0x44, 0x3b, 0x50, 0x28});
    requireEqual();
    emit({0x4c, 0x8b, 0x54, 0x24, 0x40, 0x45, 0x0f, 0xb6, 0x12});
    emit({0x44, 0x3b, 0x50, 0x2c});       // shape pointer contents
    requireEqual();
    emit({0x4c, 0x8b, 0x54, 0x24, 0x48, 0x45, 0x0f, 0xb6, 0x12});
    emit({0x44, 0x3b, 0x50, 0x30});       // original colour
    requireEqual();
    emit({0x4c, 0x8b, 0x54, 0x24, 0x50, 0x45, 0x0f, 0xb6, 0x12});
    emit({0x44, 0x3b, 0x50, 0x34});       // ordinary-pin group
    requireEqual();
    emit({0xf0, 0xff, 0x40, 0x04});       // count matched presentation calls
    emit({0x83, 0x38, 0x01});             // preview must be explicitly enabled
    requireEqual();
    emit({0x4c, 0x8d, 0x48, 0x68});       // R9 points to preview XYZ
    emit({0x4c, 0x8d, 0x50, 0x74, 0x4c, 0x89, 0x54, 0x24, 0x40});
    emit({0x4c, 0x8d, 0x50, 0x75, 0x4c, 0x89, 0x54, 0x24, 0x48});
    emit({0xf0, 0xff, 0x40, 0x08});       // count changed presentations
    for (size_t offset : exits) {
        int32_t branchDistance = static_cast<int32_t>(bytes.size() - offset - 4);
        memcpy(bytes.data() + offset, &branchDistance, sizeof(branchDistance));
    }
    emit({0x41, 0x5a, 0x58, 0x9d, 0xff, 0x25, 0, 0, 0, 0});
    AppendAddress(bytes, trampoline);
    void* code = VirtualAlloc(nullptr, bytes.size(), MEM_COMMIT | MEM_RESERVE,
        PAGE_READWRITE);
    if (!code) return nullptr;
    memcpy(code, bytes.data(), bytes.size());
    DWORD old = 0;
    if (!VirtualProtect(code, bytes.size(), PAGE_EXECUTE_READ, &old)) return nullptr;
    FlushInstructionCache(GetCurrentProcess(), code, bytes.size());
    return code;
}

void Snapshot() {
    char line[320];
    uintptr_t base = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
    auto relative = [base](LONG64 value) {
        return value ? static_cast<unsigned long long>(value - base) : 0ULL;
    };
    sprintf_s(line, "dispatch enabled=%ld total=%ld keySeen=%ld matched=%ld styled=%ld listeners=%ld caller_rva=0x%llx callbacks_rva=(0x%llx,0x%llx) pinKey=2",
        InterlockedCompareExchange(&state.enabled, 0, 0),
        InterlockedCompareExchange(&state.dispatchCalls, 0, 0),
        InterlockedCompareExchange(&state.keySeen, 0, 0),
        InterlockedCompareExchange(&state.matched, 0, 0),
        InterlockedCompareExchange(&state.styled, 0, 0),
        InterlockedCompareExchange(&state.subscriberCount, 0, 0),
        relative(InterlockedCompareExchange64(&state.lastCaller, 0, 0)),
        relative(InterlockedCompareExchange64(&state.firstCallback, 0, 0)),
        relative(InterlockedCompareExchange64(&state.secondCallback, 0, 0)));
    Log(line);
}

DWORD WINAPI Run(void* address) {
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    OpenLog();
    Log("Pywel Atlas native display preview v0.9 - subscriber dispatch boundary");
    auto base = reinterpret_cast<unsigned char*>(GetModuleHandleW(nullptr));
    auto dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    auto pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported game build. No display hook installed.");
        return 0;
    }
    state.caller = reinterpret_cast<uintptr_t>(base) + kAllowedDisplayCaller;
    state.queuedCaller = reinterpret_cast<uintptr_t>(base) + kQueuedDisplayCaller;
    state.key = kProofPinKey;
    memcpy(state.position, kPositionBits, sizeof(state.position));
    state.shape = kOriginalShape;
    state.colour = kOriginalColour;
    state.group = kOriginalGroup;
    state.previewX = kPreviewXBits;
    memcpy(state.previewPosition, kPositionBits, sizeof(state.previewPosition));
    state.previewPosition[0] = kPreviewXBits;
    void* site = nullptr;
    unsigned matches = 0;
    auto sections = IMAGE_FIRST_SECTION(pe);
    for (unsigned index = 0; index < pe->FileHeader.NumberOfSections; ++index) {
        if (!(sections[index].Characteristics & IMAGE_SCN_MEM_EXECUTE)) continue;
        auto start = base + sections[index].VirtualAddress;
        size_t length = sections[index].Misc.VirtualSize;
        for (size_t offset = 0; offset + sizeof(kDisplayContext) <= length; ++offset) {
            if (memcmp(start + offset, kDisplayContext, sizeof(kDisplayContext)) == 0) {
                site = start + offset;
                ++matches;
            }
        }
    }
    if (matches != 1) {
        Log("Display function missing, ambiguous or modified. No hook installed.");
        return 0;
    }
    MH_STATUS status = MH_Initialize();
    if (status != MH_OK) { Log(MH_StatusToString(status)); return 0; }
    void* reserved = VirtualAlloc(nullptr, 4096, MEM_COMMIT | MEM_RESERVE,
        PAGE_EXECUTE_READWRITE);
    void* trampoline = nullptr;
    if (!reserved) { Log("Display thunk allocation failed."); return 0; }
    status = MH_CreateHook(site, reserved, &trampoline);
    if (status != MH_OK) { Log(MH_StatusToString(status)); return 0; }
    void* generated = MakeDisplayThunk(trampoline);
    if (!generated) { Log("Display code generation failed."); return 0; }
    unsigned char jump[14] = {0xff, 0x25, 0, 0, 0, 0};
    memcpy(jump + 6, &generated, sizeof(generated));
    memcpy(reserved, jump, sizeof(jump));
    DWORD old = 0;
    if (!VirtualProtect(reserved, 4096, PAGE_EXECUTE_READ, &old)) {
        Log("Display code protection failed."); return 0;
    }
    FlushInstructionCache(GetCurrentProcess(), reserved, sizeof(jump));
    status = MH_EnableHook(site);
    if (status != MH_OK) { Log(MH_StatusToString(status)); return 0; }
    Log("Display hook active. F6 enables a 3-minute preview; reload Manual save 2.");
    Log("F10 disables preview; reload Manual save 2 to refresh normal appearance. F8 logs state.");
    Log("Ownership is manually scoped to this proof save. Loaded-save detection is not implemented.");
    bool previousF6 = false;
    bool previousF8 = false;
    bool previousF10 = false;
    ULONGLONG deadline = 0;
    LONG previousStyled = 0;
    while (true) {
        MSG message = {};
        while (PeekMessageW(&message, nullptr, 0, 0, PM_REMOVE)) {
            TranslateMessage(&message);
            DispatchMessageW(&message);
        }
        DWORD foregroundProcess = 0;
        GetWindowThreadProcessId(GetForegroundWindow(), &foregroundProcess);
        bool foreground = foregroundProcess == GetCurrentProcessId();
        bool f6 = (GetAsyncKeyState(VK_F6) & 0x8000) != 0;
        bool f8 = (GetAsyncKeyState(VK_F8) & 0x8000) != 0;
        bool f10 = (GetAsyncKeyState(VK_F10) & 0x8000) != 0;
        if (foreground && f6 && !previousF6) {
            deadline = GetTickCount64() + 180000;
            InterlockedExchange(&state.enabled, 1);
            Log("Display preview ON. Reload Manual save 2; do not create more pins.");
            ShowStatus(L"Display offset ON - reload Manual save 2, then look east of Bell");
        }
        bool enabled = InterlockedCompareExchange(&state.enabled, 0, 0) != 0;
        if (enabled && ((!foreground) || (f10 && !previousF10) ||
            GetTickCount64() >= deadline)) {
            InterlockedExchange(&state.enabled, 0);
            Log("Display preview OFF. Reload Manual save 2 to restore queued appearance.");
            if (foreground) ShowStatus(L"Preview OFF - reload Manual save 2 to restore");
        }
        if (foreground && f8 && !previousF8) Snapshot();
        LONG styled = InterlockedCompareExchange(&state.styled, 0, 0);
        if (styled != previousStyled) {
            Log("Owned-pin subscriber arguments substituted: +200 display X, style 0/0. Check visible result.");
            Snapshot();
            if (foreground) ShowStatus(L"Display preview applied - look east of Bell; F10 turns it off");
            previousStyled = styled;
        }
        previousF6 = f6;
        previousF8 = f8;
        previousF10 = f10;
        if (toast && GetTickCount64() >= toastUntil) ShowWindow(toast, SW_HIDE);
        Sleep(30);
    }
}
} // namespace

BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(instance);
        HANDLE worker = CreateThread(nullptr, 0, Run, instance, 0, nullptr);
        if (worker) CloseHandle(worker);
    }
    return TRUE;
}
