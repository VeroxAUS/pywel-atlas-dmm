// Manually activated display-only proof for the verified Bell pin.
// The hook substitutes presentation argument pointers at the listener dispatch
// boundary. A module-lifetime preview payload separates overlapping glyphs.
// No source record, queued record, pin list or save is written by this hook.
//
// ===========================================================================
// NativeMapPreview.cpp - plain-language overview ("Preview" build mode)
// ===========================================================================
// What this is:
//   An earlier research probe for Pywel Atlas. It is not the current mod.
//   build.ps1 -Mode Preview compiles it into PywelAtlasMapProbe.asi, a DLL
//   that the mod manager (DMM) loads into the game Crimson Desert.
//   Its log (version string "native display preview v0.9") goes to
//   %LOCALAPPDATA%\PywelAtlas\native-map-preview.log.
//
// What it does, in short:
//   1. It checks the game is the exact build it was made for, and finds one
//      game function (the "display dispatcher" that hands a map pin's details
//      to its listeners) by searching for its exact expected bytes.
//   2. It "hooks" that function: calls to it are first sent through a tiny
//      piece of machine code that this file writes into memory at startup
//      (a "thunk"). The thunk checks whether the call is about the one
//      verified Bell pin, counts what it sees, and then continues into the
//      real function.
//   3. While the user enables the preview with F6, the thunk swaps the pin's
//      position (moved +200 along X) and its shape/colour (to 0/0) for the
//      game's display only. Nothing in the save or pin list is changed.
//   4. A small always-on-top Windows popup ("toast") shows status messages.
//
// How it relates to the rest:
//   Same folder as the other map probes (NativeMapInspect.cpp,
//   NativeMapProbe.cpp). Game addresses and expected bytes come from the
//   generated header display-profile.h.
//
// Words used below:
//   hook     - redirecting calls to a game function through our code first.
//              MinHook is the library that installs the redirect; it also
//              gives back a "trampoline": a way to call the real function.
//   RVA      - an offset inside the game executable (base address + RVA =
//              real address this run).
//   register (RDX, R8, R9, RAX, R10) - a small fast storage slot inside the
//              CPU. On 64-bit Windows the first four function arguments
//              arrive in RCX, RDX, R8, R9; later ones are on the stack. This
//              rule is part of the "ABI" (the low-level calling convention).
//   offset   - a distance in bytes from the start of something (e.g. +0x18).
//   0x...    - a number written in hexadecimal (base 16).
// ===========================================================================
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

// Everything up to the closing "} // namespace" is private to this file.
namespace {
// ---------------------------------------------------------------------------
// Section: shared state between the machine-code thunk and C++ code
// ---------------------------------------------------------------------------
// All values the generated thunk reads and writes. The thunk addresses fields
// by fixed byte offsets (e.g. +0x78 = dispatchCalls), so the layout must never
// change; the static_assert lines below stop the build if it does.
// Holds: the expected caller(s), Bell key/position/style to match, the
// preview position/style to substitute, and counters for diagnostics.
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
// The status popup window, its font, and when it should hide again.
HWND toast = nullptr;
HFONT toastFont = nullptr;
ULONGLONG toastUntil = 0;

// ---------------------------------------------------------------------------
// Section: log file and on-screen status popup
// ---------------------------------------------------------------------------
// Writes one line to the log file and flushes it to disk right away.
void Log(const char* message) {
    if (logFile == INVALID_HANDLE_VALUE) return;
    DWORD written = 0;
    WriteFile(logFile, message, static_cast<DWORD>(strlen(message)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

// Creates (or empties) %LOCALAPPDATA%\PywelAtlas\native-map-preview.log.
void OpenLog() {
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) return;
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
    wcscat_s(path, L"\\native-map-preview.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
}

// Shows a message in a small popup near the top of the active window for
// 6.5 seconds (the worker loop hides it afterwards).
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

// ---------------------------------------------------------------------------
// Section: generating the machine-code thunk
// ---------------------------------------------------------------------------
// Appends a 64-bit address to the byte list, lowest byte first (the byte
// order x64 CPUs use).
void AppendAddress(std::vector<unsigned char>& bytes, const void* address) {
    uintptr_t value = reinterpret_cast<uintptr_t>(address);
    for (unsigned shift = 0; shift < 64; shift += 8) {
        bytes.push_back(static_cast<unsigned char>(value >> shift));
    }
}

// Builds the small machine-code routine that runs first on every call to the
// display dispatcher, and returns its address (or null on failure).
// In plain words, the routine: counts the call; checks it came from one of the
// two expected callers; checks the key, XYZ, shape, colour and group exactly
// match the verified Bell pin; and only if preview is enabled, points the
// position/shape/colour arguments at our preview values. Then it restores the
// registers it used and jumps to "trampoline" (the real function).
// The byte comments below are a reading of the x64 instructions emitted.
void* MakeDisplayThunk(void* trampoline) {
    // Dispatch entry: RDX=listener list, R8=key pointer, R9=float3 pointer.
    // Stack +0x28/+0x30/+0x38 are shape/colour/group pointers. Thunk pushes
    // add 0x18. The dispatcher copies these values to each callback. Payload
    // pointers use this pinned module's lifetime, and original buffers stay intact.
    // (So inside the thunk: [rsp+0x18] is the return address = who called the
    // dispatcher, and shape/colour/group pointers are at +0x40/+0x48/+0x50.)
    // Start: save flags, RAX and R10 (pushfq; push rax; push r10), then load
    // RAX with the address of "state" (mov rax, imm64).
    std::vector<unsigned char> bytes = {0x9c, 0x50, 0x41, 0x52, 0x48, 0xb8};
    AppendAddress(bytes, &state);
    // emit: append raw instruction bytes.
    auto emit = [&](std::initializer_list<unsigned char> values) {
        bytes.insert(bytes.end(), values.begin(), values.end());
    };
    // Positions of "jump to exit" distances that are filled in at the end,
    // once the exit position is known.
    std::vector<size_t> exits;
    // requireEqual: "if the last comparison was not equal, skip to the exit"
    // (jne with a placeholder distance).
    auto requireEqual = [&]() {
        emit({0x0f, 0x85, 0, 0, 0, 0});
        exits.push_back(bytes.size() - 4);
    };
    emit({0xf0, 0xff, 0x40, 0x78});       // all dispatcher calls
    emit({0x4c, 0x8b, 0x50, 0x10});       // expected native caller
    emit({0x4c, 0x3b, 0x54, 0x24, 0x18});
    // If it is the expected direct caller, skip the alternate-caller check.
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
    emit({0xf0, 0xff, 0x40, 0x3c});       // count keySeen
    // Record the caller's return address in state.lastCaller.
    emit({0x4c, 0x8b, 0x54, 0x24, 0x18, 0x4c, 0x89, 0x50, 0x40});
    // Capture two subscriber addresses for follow-up tracing, with list bounds.
    // (A "subscriber"/listener is a function registered to receive this
    // dispatch.) First clear both saved callback addresses to 0.
    emit({0x48, 0xc7, 0x40, 0x50, 0, 0, 0, 0});
    emit({0x48, 0xc7, 0x40, 0x58, 0, 0, 0, 0});
    // Listener count from the list (RDX+8) -> state.subscriberCount;
    // if it is zero, skip ahead.
    emit({0x44, 0x8b, 0x52, 0x08, 0x44, 0x89, 0x50, 0x48});
    emit({0x45, 0x85, 0xd2, 0x0f, 0x84, 0, 0, 0, 0});
    size_t noListeners = bytes.size() - 4;
    // First listener's callback address -> state.firstCallback.
    emit({0x4c, 0x8b, 0x12, 0x4d, 0x8b, 0x52, 0x08, 0x4c, 0x89, 0x50, 0x50});
    // If there is only one listener, skip ahead.
    emit({0x83, 0x78, 0x48, 0x01, 0x0f, 0x86, 0, 0, 0, 0});
    size_t onlyOneListener = bytes.size() - 4;
    // Second listener's callback address -> state.secondCallback.
    emit({0x4c, 0x8b, 0x12, 0x4d, 0x8b, 0x52, 0x28, 0x4c, 0x89, 0x50, 0x58});
    // Fill in the two "skip ahead" distances to land here.
    for (size_t offset : {noListeners, onlyOneListener}) {
        distance = static_cast<int32_t>(bytes.size() - offset - 4);
        memcpy(bytes.data() + offset, &distance, sizeof(distance));
    }
    // Compare the X, Y, Z values (as exact bit patterns) at R9 with the
    // expected Bell position.
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
    // Shape and colour argument pointers now point at state.previewShape and
    // state.previewColour (both left at 0, hence "style 0/0" in the log).
    emit({0x4c, 0x8d, 0x50, 0x74, 0x4c, 0x89, 0x54, 0x24, 0x40});
    emit({0x4c, 0x8d, 0x50, 0x75, 0x4c, 0x89, 0x54, 0x24, 0x48});
    emit({0xf0, 0xff, 0x40, 0x08});       // count changed presentations
    // Exit point: make every "skip to exit" jump land here.
    for (size_t offset : exits) {
        int32_t branchDistance = static_cast<int32_t>(bytes.size() - offset - 4);
        memcpy(bytes.data() + offset, &branchDistance, sizeof(branchDistance));
    }
    // Restore R10, RAX and flags (pop r10; pop rax; popfq), then jump to the
    // trampoline address stored right after this instruction (jmp [rip+0]).
    emit({0x41, 0x5a, 0x58, 0x9d, 0xff, 0x25, 0, 0, 0, 0});
    AppendAddress(bytes, trampoline);
    // Copy the bytes into new memory, then switch that memory from writable
    // to executable-and-read-only so the CPU may run it.
    void* code = VirtualAlloc(nullptr, bytes.size(), MEM_COMMIT | MEM_RESERVE,
        PAGE_READWRITE);
    if (!code) return nullptr;
    memcpy(code, bytes.data(), bytes.size());
    DWORD old = 0;
    if (!VirtualProtect(code, bytes.size(), PAGE_EXECUTE_READ, &old)) return nullptr;
    FlushInstructionCache(GetCurrentProcess(), code, bytes.size());
    return code;
}

// ---------------------------------------------------------------------------
// Section: diagnostics snapshot
// ---------------------------------------------------------------------------
// Logs all counters, plus caller/callback addresses converted to RVAs so they
// can be compared with static analysis of the executable.
void Snapshot() {
    char line[320];
    uintptr_t base = reinterpret_cast<uintptr_t>(GetModuleHandleW(nullptr));
    auto relative = [base](LONG64 value) {
        return value ? static_cast<unsigned long long>(value - base) : 0ULL;
    };
    sprintf_s(line,
        "dispatch enabled=%ld total=%ld keySeen=%ld matched=%ld styled=%ld listeners=%ld caller_rva=0x%llx callbacks_rva=(0x%llx,0x%llx) pinKey=2",
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

// ---------------------------------------------------------------------------
// Section: worker thread - startup checks, hook install, hotkey loop
// ---------------------------------------------------------------------------
// The background thread started from DllMain. It checks the game build, fills
// in "state", finds the dispatcher, installs the hook, then loops every 30 ms
// handling F6 (preview on, 3 minutes), F10 (off), F8 (snapshot) and the popup.
DWORD WINAPI Run(void* address) {
    // "Pin" this DLL so Windows never unloads it while the hook points into it.
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    OpenLog();
    Log("Pywel Atlas native display preview v0.9 - subscriber dispatch boundary");
    // Compare the executable's PE header (standard Windows .exe header) build
    // timestamp and size with the one build this probe was made for.
    auto base = reinterpret_cast<unsigned char*>(GetModuleHandleW(nullptr));
    auto dos = reinterpret_cast<IMAGE_DOS_HEADER*>(base);
    auto pe = reinterpret_cast<IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    if (pe->FileHeader.TimeDateStamp != kExpectedTimestamp ||
        pe->OptionalHeader.SizeOfImage != kExpectedImageSize) {
        Log("Unsupported game build. No display hook installed.");
        return 0;
    }
    // Fill in what the thunk should match (expected callers, Bell key,
    // position and style) and the preview position (same, but new X).
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
    // Search every executable section of the game for the exact expected
    // function bytes (kDisplayContext). It must be found exactly once; if it
    // is missing or appears twice, nothing is hooked (safety check).
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
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        return 0;
    }
    // The thunk needs the trampoline address, but MinHook only gives that out
    // when the hook is created. So: reserve a 4 KB block first, create the hook
    // pointing at that block, generate the thunk, then put a jump to the thunk
    // into the block.
    void* reserved = VirtualAlloc(nullptr, 4096, MEM_COMMIT | MEM_RESERVE,
        PAGE_EXECUTE_READWRITE);
    void* trampoline = nullptr;
    if (!reserved) {
        Log("Display thunk allocation failed.");
        return 0;
    }
    status = MH_CreateHook(site, reserved, &trampoline);
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        return 0;
    }
    void* generated = MakeDisplayThunk(trampoline);
    if (!generated) {
        Log("Display code generation failed.");
        return 0;
    }
    // 14-byte "jmp [rip+0]" followed by the thunk's 8-byte address.
    unsigned char jump[14] = {0xff, 0x25, 0, 0, 0, 0};
    memcpy(jump + 6, &generated, sizeof(generated));
    memcpy(reserved, jump, sizeof(jump));
    DWORD old = 0;
    if (!VirtualProtect(reserved, 4096, PAGE_EXECUTE_READ, &old)) {
        Log("Display code protection failed.");
        return 0;
    }
    FlushInstructionCache(GetCurrentProcess(), reserved, sizeof(jump));
    // Switch the hook on: from now on, game calls go through the thunk.
    status = MH_EnableHook(site);
    if (status != MH_OK) {
        Log(MH_StatusToString(status));
        return 0;
    }
    Log("Display hook active. F6 enables a 3-minute preview; reload Manual save 2.");
    Log("F10 disables preview; reload Manual save 2 to refresh normal appearance. F8 logs state.");
    Log("Ownership is manually scoped to this proof save. Loaded-save detection is not implemented.");
    // Key states from the previous loop, so a held key only triggers once.
    bool previousF6 = false;
    bool previousF8 = false;
    bool previousF10 = false;
    ULONGLONG deadline = 0;
    LONG previousStyled = 0;
    while (true) {
        // Process pending window messages so the popup window keeps working.
        MSG message = {};
        while (PeekMessageW(&message, nullptr, 0, 0, PM_REMOVE)) {
            TranslateMessage(&message);
            DispatchMessageW(&message);
        }
        // Hotkeys only count while the game window is the active window.
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
        // Turn the preview off when the game loses focus, F10 is pressed, or
        // the 3 minutes are up. (InterlockedCompareExchange(x, 0, 0) is just
        // a thread-safe way to read x.)
        bool enabled = InterlockedCompareExchange(&state.enabled, 0, 0) != 0;
        if (enabled && ((!foreground) || (f10 && !previousF10) ||
            GetTickCount64() >= deadline)) {
            InterlockedExchange(&state.enabled, 0);
            Log("Display preview OFF. Reload Manual save 2 to restore queued appearance.");
            if (foreground) ShowStatus(L"Preview OFF - reload Manual save 2 to restore");
        }
        if (foreground && f8 && !previousF8) Snapshot();
        // If the thunk substituted arguments since the last loop, report it.
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

// ---------------------------------------------------------------------------
// Section: DLL entry point
// ---------------------------------------------------------------------------
// Windows calls DllMain when the DLL is loaded into the game. Real work in
// DllMain is unsafe, so it only starts the worker thread Run() and returns.
BOOL WINAPI DllMain(HINSTANCE instance, DWORD reason, LPVOID) {
    if (reason == DLL_PROCESS_ATTACH) {
        DisableThreadLibraryCalls(instance);
        HANDLE worker = CreateThread(nullptr, 0, Run, instance, 0, nullptr);
        if (worker) CloseHandle(worker);
    }
    return TRUE;
}
