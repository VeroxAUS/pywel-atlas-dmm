// =============================================================================
// Pywel Atlas - in-game filter panel (FilterPanel.cpp, v0.62-v0.133)
// =============================================================================
//
// WHAT THIS FILE IS
//   The user-approved in-game filter panel. It draws a small Dear ImGui
//   window inside the game's own frames. F9 opens and closes it (Esc also
//   closes it; v0.119: the panel key and the others can be changed in its
//   Keys section, Keybinds.h). Since v0.64 its checkboxes switch each marker category on or
//   off (MarkerFilter.h; the map-marker part applies and saves the choices);
//   v0.65 gives it a game-matching look, an X button and a width-only drag
//   corner that scales everything. It keeps the v0.61 observation lines and
//   writes everything to %LOCALAPPDATA%\PywelAtlas\filter-panel.log.
//
// HOW FRAMES REACH THE SCREEN (v0.61 evidence, research/traces)
//   The game, or a frame-generation library (NVIDIA DLSS-G, AMD FSR, Intel
//   XeSS-FG), creates a "swapchain" with a GPU queue and then calls Present
//   on it once per shown frame. Every frame-generation change throws the old
//   swapchain away and creates a new one, often with a different queue.
//
// KEY IDEAS
//   DXGI      - the Windows layer (dxgi.dll) that shows finished frames.
//   Swapchain - the few screen images ("back buffers") the game draws into.
//   Queue     - the GPU command queue a swapchain was created with. The panel
//               sends its drawing through that same queue, just before the
//               frame is shown, so it lands on top of the finished image.
//   Fence     - a GPU counter. We note a value after our drawing and wait for
//               it before reusing that frame's memory or releasing images.
//   Dear ImGui - a small open-source library (MIT) that builds the panel's
//               triangles; its DirectX 12 "backend" sends them to the GPU.
//   Window procedure - the function Windows calls with the game window's
//               keyboard and mouse messages. While the panel is open, ours
//               holds those messages back so the game does not react.
//   Hook      - MinHook redirects a function to ours. Ours calls the original
//               with exactly the same arguments and returns its result.
//
// SAFETY
//   - Hooks only Windows' DXGI functions (each address must lie inside
//     dxgi.dll), never game code. No game memory is written and no game
//     function is called.
//   - While the panel is closed nothing is drawn, except (v0.104) the route
//     line while the route is on and a map is visible (RouteOverlay.cpp); no
//     input is taken then. Otherwise the hooks only count.
//   - Before a swapchain is resized or replaced, every reference this part
//     holds to its images is released (after waiting for our GPU work), so
//     the game's own resize or re-creation never fails because of us.
//   - All drawing state is guarded by one lock (renderLock).
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <intrin.h>
#include <d3d12.h>
#include <dxgi1_6.h>
#include <cmath>
#include <cstdarg>
#include <cstdint>
#include <cstdio>
#include <cstring>
#include "../save-detection/vendor/minhook/include/MinHook.h"
#include "vendor/imgui/imgui.h"
#include "vendor/imgui/backends/imgui_impl_dx12.h"
// v0.64: the marker categories, their counts and the saved choices.
#include "MarkerFilter.h"
// v0.104: the route line overlay and the panel's Route section.
#include "RouteOverlay.h"
// v0.110: the map views (is a map on screen?) and the minimap circle, for
// the completion widget.
#include "RouteSystem.h"
// v0.119: rebindable keys (the Keys section and the panel's hotkeys).
#include "Keybinds.h"
// v0.129: the short player log (pywel-atlas.log).
#include "ReleaseLog.h"

namespace {

// ---------------------------------------------------------------------------
// Section: function types (exact Windows signatures, so calls forward as-is)
// ---------------------------------------------------------------------------

// IDXGIFactory::CreateSwapChain (factory vtable slot 10).
using CreateSwapChainFn = HRESULT (STDMETHODCALLTYPE*)(IDXGIFactory*, IUnknown*,
    DXGI_SWAP_CHAIN_DESC*, IDXGISwapChain**);
// IDXGIFactory2::CreateSwapChainForHwnd (slot 15; 7 arguments, 3 on the stack).
using CreateSwapChainForHwndFn = HRESULT (STDMETHODCALLTYPE*)(IDXGIFactory2*, IUnknown*, HWND,
    const DXGI_SWAP_CHAIN_DESC1*, const DXGI_SWAP_CHAIN_FULLSCREEN_DESC*, IDXGIOutput*,
    IDXGISwapChain1**);
// IDXGISwapChain::Present (swapchain vtable slot 8).
using PresentFn = HRESULT (STDMETHODCALLTYPE*)(IDXGISwapChain*, UINT, UINT);
// IDXGISwapChain1::Present1 (slot 22).
using Present1Fn = HRESULT (STDMETHODCALLTYPE*)(IDXGISwapChain1*, UINT, UINT,
    const DXGI_PRESENT_PARAMETERS*);
// IDXGISwapChain::ResizeBuffers (slot 13; 6 arguments).
using ResizeBuffersFn = HRESULT (STDMETHODCALLTYPE*)(IDXGISwapChain*, UINT, UINT, UINT,
    DXGI_FORMAT, UINT);
// IDXGISwapChain3::ResizeBuffers1 (slot 39; 8 arguments).
using ResizeBuffers1Fn = HRESULT (STDMETHODCALLTYPE*)(IDXGISwapChain3*, UINT, UINT, UINT,
    DXGI_FORMAT, UINT, const UINT*, IUnknown* const*);
// IDXGISwapChain3::SetColorSpace1 (slot 38): tells us if the image is HDR.
using SetColorSpace1Fn = HRESULT (STDMETHODCALLTYPE*)(IDXGISwapChain3*, DXGI_COLOR_SPACE_TYPE);

// Vtable slot numbers (fixed by the COM interface definitions).
constexpr unsigned kFactoryCreateSwapChain = 10;
constexpr unsigned kFactoryCreateSwapChainForHwnd = 15;
constexpr unsigned kSwapPresent = 8;
constexpr unsigned kSwapResizeBuffers = 13;
constexpr unsigned kSwapPresent1 = 22;
constexpr unsigned kSwapSetColorSpace1 = 38;
constexpr unsigned kSwapResizeBuffers1 = 39;

// The swapchain methods we hook, in this order everywhere below.
enum SwapMethod : unsigned { kPresent, kPresent1, kResize, kResize1, kSetColorSpace, kSwapMethodCount };
constexpr const char* kSwapMethodNames[kSwapMethodCount] = {
    "Present", "Present1", "ResizeBuffers", "ResizeBuffers1", "SetColorSpace1"};

// Most back buffers any swapchain is expected to have (the game uses 2 or 3).
constexpr UINT kMaxBuffers = 8;
// Descriptors in our shader-visible heap (ImGui needs one per texture).
constexpr UINT kSrvDescriptors = 8;

// ---------------------------------------------------------------------------
// Section: shared state
// ---------------------------------------------------------------------------

HANDLE logFile = INVALID_HANDLE_VALUE;
// Where Windows' dxgi.dll sits in memory; every hooked address must be inside.
uintptr_t dxgiStart = 0;
uintptr_t dxgiEnd = 0;

// "original..." pointers: MinHook fills these; calling one runs the real method.
CreateSwapChainFn originalCreateSwapChain = nullptr;
CreateSwapChainForHwndFn originalCreateSwapChainForHwnd = nullptr;
PresentFn originalPresent = nullptr;
Present1Fn originalPresent1 = nullptr;
ResizeBuffersFn originalResize = nullptr;
ResizeBuffers1Fn originalResize1 = nullptr;
SetColorSpace1Fn originalSetColorSpace = nullptr;

// Guards the swapchain hook installation (done once, on the first swapchain).
SRWLOCK hookLock = SRWLOCK_INIT;
// The address hooked for each swapchain method (0 = not hooked).
uintptr_t hookedSwapMethod[kSwapMethodCount] = {};

// Swapchains seen being created, newest last (a small ring). The queue
// pointer is valid as long as its swapchain lives, because the swapchain
// keeps its own reference to it; we never use it for any other swapchain.
struct KnownSwapchain {
    void* swapchain;
    ID3D12CommandQueue* queue;
    HWND window;
    DXGI_COLOR_SPACE_TYPE colorSpace;
};
SRWLOCK knownLock = SRWLOCK_INIT;
KnownSwapchain known[8] = {};
unsigned knownNext = 0; // Ring position of the next entry.
void* newestSwapchain = nullptr; // Only this swapchain gets the panel.

// Per-swapchain counters (as in v0.61), filled by the Present/Resize hooks.
struct SwapCounters {
    void* volatile swapchain; // Identifier only.
    volatile LONG calls[kSwapMethodCount];
    volatile LONG lastSync;
    volatile LONG lastFlags;
    volatile LONG threads[4];
    volatile LONG64 callers[4];
};
SwapCounters counters[16] = {};
volatile LONG countersFull = 0;

// Events from hooks to the worker, which writes them to the log.
enum EventKind : BYTE { kCreated = 1, kResized, kNewCaller, kNote };
struct Event {
    EventKind kind;
    ULONGLONG tick;
    DWORD thread;
    uintptr_t caller;
    void* swapchain;
    const char* factoryMethod;
    HRESULT result;
    void* device;
    bool queueKnown;
    D3D12_COMMAND_LIST_TYPE queueType;
    HWND window;
    UINT width;
    UINT height;
    DXGI_FORMAT format;
    UINT bufferCount;
    DXGI_SWAP_EFFECT swapEffect;
    UINT flags;
    uintptr_t methods[kSwapMethodCount];
    unsigned method;
    UINT resizeCount;
    UINT resizeWidth;
    UINT resizeHeight;
    DXGI_FORMAT resizeFormat;
    UINT resizeFlags;
    char note[200]; // kNote: a ready-made line from the panel code.
};
SRWLOCK queueLock = SRWLOCK_INIT;
Event queue[64] = {};
unsigned queueCount = 0;
volatile LONG droppedEvents = 0;

// Panel visibility (toggled by F9 on the presenting thread, read everywhere).
volatile LONG panelVisible = 0;
// Swapchain creations in progress. While one is running the panel draws
// nothing, so it never takes new references to the old swapchain's images
// (Windows allows only one swapchain per window at a time).
volatile LONG creatingSwapchain = 0;
// Mouse wheel turns seen by our window procedure, handed to ImGui per frame.
volatile LONG pendingWheel = 0;
// v0.63: mouse movement (raw input counts) seen by our window procedure while
// the panel is open. During play the game locks the Windows cursor in place,
// so the panel's own cursor is moved by these amounts instead.
volatile LONG pendingMouseX = 0;
volatile LONG pendingMouseY = 0;
// Set when the panel opens, so the panel cursor starts from a sensible spot.
volatile LONG panelJustOpened = 0;

// Everything used to draw on the current swapchain. Guarded by renderLock.
struct Renderer {
    void* swapchain; // The swapchain these resources belong to (0 = none).
    HWND window;
    ID3D12CommandQueue* queue; // Not owned (see KnownSwapchain).
    ID3D12Device* device; // Owned reference.
    DXGI_FORMAT format;
    UINT width;
    UINT height;
    UINT bufferCount;
    DXGI_COLOR_SPACE_TYPE colorSpace;
    ID3D12DescriptorHeap* rtvHeap; // One render-target view per back buffer.
    UINT rtvStride;
    ID3D12DescriptorHeap* srvHeap; // Shader-visible; ImGui's textures.
    UINT srvStride;
    bool srvUsed[kSrvDescriptors];
    ID3D12Resource* buffers[kMaxBuffers]; // Our references to the back buffers.
    bool buffersReady;
    ID3D12CommandAllocator* allocators[kMaxBuffers];
    ID3D12GraphicsCommandList* list;
    ID3D12Fence* fence;
    HANDLE fenceEvent;
    UINT64 fenceValue; // Last value we asked the GPU to reach.
    UINT64 slotFence[kMaxBuffers]; // Fence value of each slot's last use.
    UINT64 frames; // Frames drawn with these resources.
    bool backendReady; // ImGui's DirectX 12 backend is initialized.
};
SRWLOCK renderLock = SRWLOCK_INIT;
Renderer renderer = {};
bool imguiReady = false; // ImGui context created (once, under renderLock).
ImGuiStyle baseStyle; // Unscaled style, re-scaled for each swapchain size.
LARGE_INTEGER lastFrameTime = {};
LARGE_INTEGER timerFrequency = {};
// Our window procedure is installed on these windows (never removed: another
// program may have hooked in after us).
HWND subclassed[4] = {};
WNDPROC previousWndProc[4] = {};
// The panel's width at zoom 1 (before the screen-height scaling). v0.65: the
// drag corner changes the width only; everything is zoomed with it and the
// height always fits the contents.
constexpr float kPanelBaseWidth = 380.0f;
// Height of the contents, measured at the end of the last frame; the size
// constraint below makes the window exactly this tall.
float panelContentHeight = 0.0f;
// The saved geometry is applied once per ImGui context (it survives the
// swapchain changes of frame generation), then the panel reports changes.
bool panelGeometryApplied = false;
float panelReported[4] = {};

// ---------------------------------------------------------------------------
// Section: small helpers
// ---------------------------------------------------------------------------

// Adds an event without ever making a game thread wait; drops (and counts) it
// if the queue is busy or full.
void Queue(const Event& event) {
    if (!TryAcquireSRWLockExclusive(&queueLock)) {
        InterlockedIncrement(&droppedEvents);
        return;
    }
    if (queueCount < _countof(queue)) {
        queue[queueCount++] = event;
    } else {
        InterlockedIncrement(&droppedEvents);
    }
    ReleaseSRWLockExclusive(&queueLock);
}

// Queues a ready-made log line from the panel code (any thread).
void Note(const char* format, ...) {
    Event event = {};
    event.kind = kNote;
    event.tick = GetTickCount64();
    event.thread = GetCurrentThreadId();
    va_list arguments;
    va_start(arguments, format);
    // v0.127: a note longer than the buffer is cut short (vsprintf_s would
    // stop the game, like the route log's start-up line did in v0.124-v0.126).
    _vsnprintf_s(event.note, _TRUNCATE, format, arguments);
    va_end(arguments);
    Queue(event);
}

// Safely copies `size` bytes; false instead of a crash if not readable.
bool Read(const void* address, void* destination, SIZE_T size) {
    SIZE_T read = 0;
    return address && ReadProcessMemory(GetCurrentProcess(), address,
        destination, size, &read) && read == size;
}

// Reads slot `slot` of a COM object's vtable (0 if unreadable).
uintptr_t VtableEntry(const void* object, unsigned slot) {
    uintptr_t table = 0;
    uintptr_t entry = 0;
    if (!Read(object, &table, sizeof(table)) ||
        !Read(reinterpret_cast<const void*>(table + slot * sizeof(uintptr_t)), &entry, sizeof(entry))) {
        return 0;
    }
    return entry;
}

// True when an address lies inside Windows' dxgi.dll.
bool InDxgi(uintptr_t address) {
    return address >= dxgiStart && address < dxgiEnd;
}

// Releases a COM reference and clears the pointer.
template <typename T> void SafeRelease(T*& object) {
    if (object) {
        object->Release();
        object = nullptr;
    }
}

// True when the window in front belongs to the game (this process).
bool GameInFront() {
    DWORD process = 0;
    GetWindowThreadProcessId(GetForegroundWindow(), &process);
    return process == GetCurrentProcessId();
}

// ---------------------------------------------------------------------------
// Section: counting (as in v0.61)
// ---------------------------------------------------------------------------

// Finds (or takes) the counter slot of a swapchain; nullptr if all are taken.
SwapCounters* CountersFor(void* swapchain) {
    for (SwapCounters& slot : counters) {
        void* current = slot.swapchain;
        if (current == swapchain) {
            return &slot;
        }
        if (!current &&
            InterlockedCompareExchangePointer(const_cast<void**>(&slot.swapchain), swapchain, nullptr) == nullptr) {
            return &slot;
        }
        if (slot.swapchain == swapchain) {
            return &slot;
        }
    }
    InterlockedIncrement(&countersFull);
    return nullptr;
}

// True only the first time a Present return address is seen for a swapchain.
bool NoteCaller(SwapCounters& slot, uintptr_t caller) {
    LONG64 value = static_cast<LONG64>(caller);
    for (volatile LONG64& entry : slot.callers) {
        LONG64 current = entry;
        if (current == value) {
            return false;
        }
        if (current == 0 && InterlockedCompareExchange64(&entry, value, 0) == 0) {
            return true;
        }
        if (entry == value) {
            return false;
        }
    }
    return false;
}

// Remembers which threads present (first 4 distinct ones).
void NoteThread(SwapCounters& slot, DWORD thread) {
    for (volatile LONG& entry : slot.threads) {
        LONG current = entry;
        if (current == static_cast<LONG>(thread)) {
            return;
        }
        if (current == 0 &&
            InterlockedCompareExchange(&entry, static_cast<LONG>(thread), 0) == 0) {
            return;
        }
    }
}

// Counts one Present/Present1 call and queues an event for a new caller.
void CountPresent(void* swapchain, unsigned method, UINT sync, UINT flags, uintptr_t caller) {
    SwapCounters* slot = CountersFor(swapchain);
    if (!slot) {
        return;
    }
    InterlockedIncrement(&slot->calls[method]);
    InterlockedExchange(&slot->lastSync, static_cast<LONG>(sync));
    InterlockedExchange(&slot->lastFlags, static_cast<LONG>(flags));
    DWORD thread = GetCurrentThreadId();
    NoteThread(*slot, thread);
    if (NoteCaller(*slot, caller)) {
        Event event = {};
        event.kind = kNewCaller;
        event.tick = GetTickCount64();
        event.thread = thread;
        event.caller = caller;
        event.swapchain = swapchain;
        event.method = method;
        Queue(event);
    }
}

// ---------------------------------------------------------------------------
// Section: drawing resources (all called with renderLock held)
// ---------------------------------------------------------------------------

// Waits (at most 2 s) until the GPU has finished all of our drawing, so our
// memory and image references can be reused or released safely.
void WaitForOurGpuWork() {
    if (!renderer.fence || !renderer.fenceValue) {
        return;
    }
    if (renderer.fence->GetCompletedValue() < renderer.fenceValue &&
        SUCCEEDED(renderer.fence->SetEventOnCompletion(renderer.fenceValue, renderer.fenceEvent))) {
        WaitForSingleObject(renderer.fenceEvent, 2000);
    }
}

// Drops our references to the back buffers (before a resize or replacement).
void ReleaseBuffers() {
    WaitForOurGpuWork();
    for (ID3D12Resource*& buffer : renderer.buffers) {
        SafeRelease(buffer);
    }
    renderer.buffersReady = false;
}

// Frees everything that belongs to the current swapchain, including ImGui's
// DirectX 12 backend (it is re-created for the next swapchain).
void Teardown(const char* reason) {
    if (!renderer.swapchain) {
        return;
    }
    ReleaseBuffers();
    if (renderer.backendReady) {
        ImGui_ImplDX12_Shutdown();
    }
    for (ID3D12CommandAllocator*& allocator : renderer.allocators) {
        SafeRelease(allocator);
    }
    SafeRelease(renderer.list);
    SafeRelease(renderer.fence);
    if (renderer.fenceEvent) {
        CloseHandle(renderer.fenceEvent);
    }
    SafeRelease(renderer.rtvHeap);
    SafeRelease(renderer.srvHeap);
    SafeRelease(renderer.device);
    Note("panel resources released for swapchain 0x%llx (%s)",
        reinterpret_cast<unsigned long long>(renderer.swapchain), reason);
    renderer = {};
}

// ImGui asks for a shader-visible descriptor (one per texture, e.g. the font).
void AllocateSrv(ImGui_ImplDX12_InitInfo*, D3D12_CPU_DESCRIPTOR_HANDLE* cpu,
    D3D12_GPU_DESCRIPTOR_HANDLE* gpu) {
    for (UINT index = 0; index < kSrvDescriptors; ++index) {
        if (!renderer.srvUsed[index]) {
            renderer.srvUsed[index] = true;
            cpu->ptr = renderer.srvHeap->GetCPUDescriptorHandleForHeapStart().ptr +
                static_cast<SIZE_T>(index) * renderer.srvStride;
            gpu->ptr = renderer.srvHeap->GetGPUDescriptorHandleForHeapStart().ptr +
                static_cast<UINT64>(index) * renderer.srvStride;
            return;
        }
    }
    // All taken: hand out the first one again (only happens if ImGui makes
    // more than kSrvDescriptors textures, which this small panel does not).
    *cpu = renderer.srvHeap->GetCPUDescriptorHandleForHeapStart();
    *gpu = renderer.srvHeap->GetGPUDescriptorHandleForHeapStart();
}

// ImGui gives a descriptor back.
void FreeSrv(ImGui_ImplDX12_InitInfo*, D3D12_CPU_DESCRIPTOR_HANDLE cpu, D3D12_GPU_DESCRIPTOR_HANDLE) {
    SIZE_T start = renderer.srvHeap->GetCPUDescriptorHandleForHeapStart().ptr;
    UINT index = static_cast<UINT>((cpu.ptr - start) / renderer.srvStride);
    if (index < kSrvDescriptors) {
        renderer.srvUsed[index] = false;
    }
}

// Converts one colour channel from normal screen brightness (sRGB) to the
// HDR10 (PQ) encoding, aiming white at about 200 nits so the panel is not
// blinding on an HDR screen.
float SrgbToPq(float value) {
    float linear = value <= 0.04045f ? value / 12.92f : std::pow((value + 0.055f) / 1.055f, 2.4f);
    float nits = linear * 200.0f;
    float y = std::pow(nits / 10000.0f, 0.1593017578125f);
    return std::pow((0.8359375f + 18.8515625f * y) / (1.0f + 18.6875f * y), 78.84375f);
}

// v0.104: one colour in this frame's encoding (HDR10 converted, like the
// panel's own colours in ApplyStyle), for the route line overlay.
ImU32 FrameColour(const ImVec4& colour) {
    ImVec4 encoded = colour;
    if (renderer.colorSpace == DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020) {
        encoded.x = SrgbToPq(colour.x);
        encoded.y = SrgbToPq(colour.y);
        encoded.z = SrgbToPq(colour.z);
    }
    return ImGui::ColorConvertFloat4ToU32(encoded);
}

// v0.65: the panel's zoom, set from its width (see BuildPanel) and applied
// to everything (text, spacing, boxes) on the next frame.
float panelZoom = 1.0f;

// Sets the panel style for this frame: every size scaled by the screen height
// (1080 lines = 1x) times the panel zoom, and colours converted when the
// image is HDR10. Rebuilt from the unscaled baseStyle each frame (cheap).
void ApplyStyle() {
    ImGuiStyle& style = ImGui::GetStyle();
    style = baseStyle;
    float scale = renderer.height > 1080 ? renderer.height / 1080.0f : 1.0f;
    style.ScaleAllSizes(scale * panelZoom);
    style.FontScaleDpi = scale;
    style.FontScaleMain = panelZoom;
    if (renderer.colorSpace == DXGI_COLOR_SPACE_RGB_FULL_G2084_NONE_P2020) {
        for (ImVec4& colour : style.Colors) {
            colour.x = SrgbToPq(colour.x);
            colour.y = SrgbToPq(colour.y);
            colour.z = SrgbToPq(colour.z);
        }
    }
}

// Creates the ImGui context once: no .ini or log files, keyboard navigation
// on, a software mouse cursor (drawn only during play, see UpdatePanelMouse),
// and the Segoe UI font when Windows has it.
void CreateImGuiOnce() {
    if (imguiReady) {
        return;
    }
    ImGui::CreateContext();
    ImGuiIO& io = ImGui::GetIO();
    io.IniFilename = nullptr;
    io.LogFilename = nullptr;
    io.ConfigFlags |= ImGuiConfigFlags_NavEnableKeyboard;
    io.MouseDrawCursor = true;
    io.BackendPlatformName = "pywel_atlas_polling";
    char font[MAX_PATH] = {};
    if (GetWindowsDirectoryA(font, MAX_PATH) && strcat_s(font, "\\Fonts\\segoeui.ttf") == 0 &&
        GetFileAttributesA(font) != INVALID_FILE_ATTRIBUTES) {
        io.Fonts->AddFontFromFileTTF(font, 18.0f);
        ImGui::GetStyle().FontSizeBase = 18.0f;
    }
    // v0.65 theme: dark, warm and slightly see-through, with a thin muted gold
    // border and gold marks, to sit well beside the game's own interface.
    ImGui::StyleColorsDark();
    ImGuiStyle& style = ImGui::GetStyle();
    style.WindowRounding = 8.0f;
    style.WindowBorderSize = 1.0f;
    style.WindowPadding = ImVec2(14.0f, 12.0f);
    style.FramePadding = ImVec2(5.0f, 3.0f);
    style.FrameRounding = 3.0f;
    style.FrameBorderSize = 1.0f;
    style.ItemSpacing = ImVec2(10.0f, 6.0f);
    style.ItemInnerSpacing = ImVec2(8.0f, 4.0f);
    style.TabRounding = 3.0f; // v0.125: like the buttons.
    ImVec4* colors = style.Colors;
    const ImVec4 gold(0.847f, 0.702f, 0.416f, 1.0f); // #d8b36a, headings and marks.
    const ImVec4 bronze(0.420f, 0.337f, 0.192f, 1.0f); // #6b5631, borders.
    colors[ImGuiCol_WindowBg] = ImVec4(0.078f, 0.067f, 0.051f, 0.92f); // #14110d
    colors[ImGuiCol_Border] = bronze;
    colors[ImGuiCol_Text] = ImVec4(0.914f, 0.886f, 0.816f, 1.0f); // #e9e2d0
    colors[ImGuiCol_TextDisabled] = ImVec4(0.490f, 0.459f, 0.392f, 1.0f); // #7d7564
    colors[ImGuiCol_FrameBg] = ImVec4(0.180f, 0.157f, 0.125f, 1.0f); // #2e2820, boxes and bar tracks.
    colors[ImGuiCol_FrameBgHovered] = ImVec4(0.420f, 0.337f, 0.192f, 0.45f);
    colors[ImGuiCol_FrameBgActive] = ImVec4(0.420f, 0.337f, 0.192f, 0.65f);
    colors[ImGuiCol_CheckMark] = gold;
    colors[ImGuiCol_Button] = ImVec4(0.420f, 0.337f, 0.192f, 0.20f);
    colors[ImGuiCol_ButtonHovered] = ImVec4(0.420f, 0.337f, 0.192f, 0.50f);
    colors[ImGuiCol_ButtonActive] = ImVec4(0.420f, 0.337f, 0.192f, 0.75f);
    colors[ImGuiCol_Separator] = bronze;
    colors[ImGuiCol_ResizeGrip] = ImVec4(0.420f, 0.337f, 0.192f, 0.35f);
    colors[ImGuiCol_ResizeGripHovered] = ImVec4(0.722f, 0.576f, 0.306f, 0.70f);
    colors[ImGuiCol_ResizeGripActive] = gold;
    colors[ImGuiCol_NavCursor] = gold;
    colors[ImGuiCol_PlotHistogram] = gold; // Progress bars, header and the F10 notice.
    colors[ImGuiCol_PopupBg] = ImVec4(0.078f, 0.067f, 0.051f, 0.96f); // Tooltips.
    // v0.125: the tabs, the slider handle and the region list's highlight were
    // still ImGui's default blue; they now use the same bronze and gold as the
    // buttons. The selected tab is filled bronze with a gold top line, and the
    // line under the tab bar is the selected tab's colour.
    colors[ImGuiCol_Tab] = ImVec4(0.420f, 0.337f, 0.192f, 0.20f);
    colors[ImGuiCol_TabHovered] = ImVec4(0.420f, 0.337f, 0.192f, 0.60f);
    colors[ImGuiCol_TabSelected] = ImVec4(0.420f, 0.337f, 0.192f, 0.80f);
    colors[ImGuiCol_TabSelectedOverline] = gold;
    colors[ImGuiCol_TabDimmed] = ImVec4(0.420f, 0.337f, 0.192f, 0.15f);
    colors[ImGuiCol_TabDimmedSelected] = ImVec4(0.420f, 0.337f, 0.192f, 0.55f);
    colors[ImGuiCol_TabDimmedSelectedOverline] = bronze;
    colors[ImGuiCol_SliderGrab] = ImVec4(0.722f, 0.576f, 0.306f, 1.0f); // #b8934e
    colors[ImGuiCol_SliderGrabActive] = gold;
    colors[ImGuiCol_Header] = ImVec4(0.420f, 0.337f, 0.192f, 0.30f);
    colors[ImGuiCol_HeaderHovered] = ImVec4(0.420f, 0.337f, 0.192f, 0.50f);
    colors[ImGuiCol_HeaderActive] = ImVec4(0.420f, 0.337f, 0.192f, 0.75f);
    colors[ImGuiCol_TextSelectedBg] = ImVec4(0.420f, 0.337f, 0.192f, 0.50f);
    baseStyle = style;
    QueryPerformanceFrequency(&timerFrequency);
    QueryPerformanceCounter(&lastFrameTime);
    imguiReady = true;
}

// Builds all drawing resources for `swapchain` (created with `queue`).
// Returns false (and frees what was made) if anything fails.
bool CreateRenderer(void* swapchain, const KnownSwapchain& entry) {
    IDXGISwapChain3* swapchain3 = nullptr;
    if (FAILED(static_cast<IUnknown*>(swapchain)->QueryInterface(__uuidof(IDXGISwapChain3),
        reinterpret_cast<void**>(&swapchain3))) || !swapchain3) {
        Note("panel: swapchain 0x%llx has no IDXGISwapChain3; not drawn",
            reinterpret_cast<unsigned long long>(swapchain));
        return false;
    }
    DXGI_SWAP_CHAIN_DESC1 description = {};
    HRESULT result = swapchain3->GetDesc1(&description);
    swapchain3->Release();
    if (FAILED(result) || description.BufferCount == 0 || description.BufferCount > kMaxBuffers) {
        Note("panel: swapchain description unusable (0x%08lx, %u buffers)",
            static_cast<unsigned long>(result), description.BufferCount);
        return false;
    }
    renderer.swapchain = swapchain;
    renderer.window = entry.window;
    renderer.queue = entry.queue;
    renderer.format = description.Format;
    renderer.width = description.Width;
    renderer.height = description.Height;
    renderer.bufferCount = description.BufferCount;
    renderer.colorSpace = entry.colorSpace;

    bool ok = SUCCEEDED(entry.queue->GetDevice(__uuidof(ID3D12Device),
        reinterpret_cast<void**>(&renderer.device)));
    D3D12_DESCRIPTOR_HEAP_DESC rtvDescription = {};
    rtvDescription.Type = D3D12_DESCRIPTOR_HEAP_TYPE_RTV;
    rtvDescription.NumDescriptors = renderer.bufferCount;
    ok = ok && SUCCEEDED(renderer.device->CreateDescriptorHeap(&rtvDescription,
        __uuidof(ID3D12DescriptorHeap), reinterpret_cast<void**>(&renderer.rtvHeap)));
    D3D12_DESCRIPTOR_HEAP_DESC srvDescription = {};
    srvDescription.Type = D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV;
    srvDescription.NumDescriptors = kSrvDescriptors;
    srvDescription.Flags = D3D12_DESCRIPTOR_HEAP_FLAG_SHADER_VISIBLE;
    ok = ok && SUCCEEDED(renderer.device->CreateDescriptorHeap(&srvDescription,
        __uuidof(ID3D12DescriptorHeap), reinterpret_cast<void**>(&renderer.srvHeap)));
    for (UINT index = 0; ok && index < renderer.bufferCount; ++index) {
        ok = SUCCEEDED(renderer.device->CreateCommandAllocator(D3D12_COMMAND_LIST_TYPE_DIRECT,
            __uuidof(ID3D12CommandAllocator), reinterpret_cast<void**>(&renderer.allocators[index])));
    }
    ok = ok && SUCCEEDED(renderer.device->CreateCommandList(0, D3D12_COMMAND_LIST_TYPE_DIRECT,
        renderer.allocators[0], nullptr, __uuidof(ID3D12GraphicsCommandList),
        reinterpret_cast<void**>(&renderer.list)));
    ok = ok && SUCCEEDED(renderer.list->Close());
    ok = ok && SUCCEEDED(renderer.device->CreateFence(0, D3D12_FENCE_FLAG_NONE,
        __uuidof(ID3D12Fence), reinterpret_cast<void**>(&renderer.fence)));
    renderer.fenceEvent = ok ? CreateEventW(nullptr, FALSE, FALSE, nullptr) : nullptr;
    ok = ok && renderer.fenceEvent;
    if (!ok) {
        Note("panel: could not create drawing resources for swapchain 0x%llx",
            reinterpret_cast<unsigned long long>(swapchain));
        PywelReleaseLog("Panel: could not create its drawing resources; the panel cannot be shown.");
        Teardown("creation failed");
        return false;
    }
    renderer.rtvStride = renderer.device->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_RTV);
    renderer.srvStride = renderer.device->GetDescriptorHandleIncrementSize(
        D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV);

    CreateImGuiOnce();
    ImGui_ImplDX12_InitInfo info;
    info.Device = renderer.device;
    info.CommandQueue = renderer.queue;
    info.NumFramesInFlight = static_cast<int>(renderer.bufferCount);
    info.RTVFormat = renderer.format;
    info.DSVFormat = DXGI_FORMAT_UNKNOWN;
    info.SrvDescriptorHeap = renderer.srvHeap;
    info.SrvDescriptorAllocFn = AllocateSrv;
    info.SrvDescriptorFreeFn = FreeSrv;
    if (!ImGui_ImplDX12_Init(&info)) {
        Note("panel: ImGui DirectX 12 backend refused to start");
        PywelReleaseLog("Panel: the DirectX 12 drawing backend refused to start; the panel cannot be shown.");
        Teardown("backend failed");
        return false;
    }
    renderer.backendReady = true;
    ApplyStyle();
    Note("panel resources created for swapchain 0x%llx: %ux%u format=%d buffers=%u colorSpace=%d queue=0x%llx",
        reinterpret_cast<unsigned long long>(swapchain), renderer.width, renderer.height,
        static_cast<int>(renderer.format), renderer.bufferCount, static_cast<int>(renderer.colorSpace),
        reinterpret_cast<unsigned long long>(renderer.queue));
    return true;
}

// Takes references to the back buffers and makes a render-target view for each.
bool AcquireBuffers(IDXGISwapChain3* swapchain) {
    D3D12_CPU_DESCRIPTOR_HANDLE handle = renderer.rtvHeap->GetCPUDescriptorHandleForHeapStart();
    for (UINT index = 0; index < renderer.bufferCount; ++index) {
        if (FAILED(swapchain->GetBuffer(index, __uuidof(ID3D12Resource),
            reinterpret_cast<void**>(&renderer.buffers[index])))) {
            Note("panel: could not get back buffer %u", index);
            ReleaseBuffers();
            return false;
        }
        D3D12_CPU_DESCRIPTOR_HANDLE view = handle;
        view.ptr += static_cast<SIZE_T>(index) * renderer.rtvStride;
        renderer.device->CreateRenderTargetView(renderer.buffers[index], nullptr, view);
    }
    renderer.buffersReady = true;
    return true;
}

// ---------------------------------------------------------------------------
// Section: input (polled each drawn frame; the window procedure only holds
// messages back from the game while the panel is open)
// ---------------------------------------------------------------------------

// Keys the panel listens to, with the ImGui key each one becomes.
struct KeyMap { int virtualKey; ImGuiKey key; };
constexpr KeyMap kKeys[] = {
    {VK_UP, ImGuiKey_UpArrow}, {VK_DOWN, ImGuiKey_DownArrow},
    {VK_LEFT, ImGuiKey_LeftArrow}, {VK_RIGHT, ImGuiKey_RightArrow},
    {VK_RETURN, ImGuiKey_Enter}, {VK_SPACE, ImGuiKey_Space}, {VK_TAB, ImGuiKey_Tab}};
bool keyWasDown[_countof(kKeys)] = {};
bool mouseWasDown[2] = {};
// The panel cursor, in back buffer pixels.
float panelMouseX = 0.0f;
float panelMouseY = 0.0f;

// v0.67: the Windows cursor counts as "free" (menus) only after it has looked
// free for this long, and as "locked" (play) only after it has looked locked
// for this long. A state that flips every frame then cannot make the panel's
// own cursor blink on and off.
constexpr ULONGLONG kCursorSettleMs = 250;
bool cursorFree = false; // The settled state; true = follow the Windows cursor.
ULONGLONG cursorDisagreeSince = 0; // When the raw state first differed (0 = agrees).

// v0.67 cursor diagnostics, summed while the panel is open and written once
// per second as a "cursor" log line, to see what the game's cursor does in
// menus and during play.
struct CursorStats {
    ULONGLONG since; // Start of the current one-second window (0 = not started).
    unsigned frames;
    unsigned shownFrames; // Windows reported its cursor as showing.
    unsigned movedFrames; // The Windows cursor position changed since last frame.
    unsigned imageChanges; // The cursor image (handle) changed since last frame.
    unsigned modeChanges; // The settled free/locked state changed.
    unsigned drawnFrames; // The panel drew its own cursor.
    LONG rawX; // Raw mouse movement summed over the window.
    LONG rawY;
    HCURSOR lastImage;
    POINT lastPos;
    bool lastPosKnown;
};
CursorStats cursorStats = {};

// Writes and restarts the one-second cursor summary (panel open only).
void CountCursorFrame(bool shown, bool moved, HCURSOR image, bool drawn, LONG rawX, LONG rawY) {
    ULONGLONG now = GetTickCount64();
    if (!cursorStats.since) {
        cursorStats.since = now;
    }
    cursorStats.frames++;
    cursorStats.shownFrames += shown ? 1 : 0;
    cursorStats.movedFrames += moved ? 1 : 0;
    cursorStats.imageChanges += (cursorStats.frames > 1 && image != cursorStats.lastImage) ? 1 : 0;
    cursorStats.drawnFrames += drawn ? 1 : 0;
    cursorStats.rawX += rawX;
    cursorStats.rawY += rawY;
    cursorStats.lastImage = image;
    if (now - cursorStats.since >= 1000) {
#ifdef PYWEL_ATLAS_DEV
        // The "cursor" log line: development builds only (v0.129).
        RECT clip = {};
        GetClipCursor(&clip);
        Note("cursor frames=%u shown=%u moved=%u imageChanges=%u image=0x%llx settled=%s modeChanges=%u "
             "panelCursorDrawn=%u raw=(%ld,%ld) clip=(%ld,%ld)-(%ld,%ld)",
            cursorStats.frames, cursorStats.shownFrames, cursorStats.movedFrames, cursorStats.imageChanges,
            reinterpret_cast<unsigned long long>(image), cursorFree ? "free" : "locked",
            cursorStats.modeChanges, cursorStats.drawnFrames, cursorStats.rawX, cursorStats.rawY,
            clip.left, clip.top, clip.right, clip.bottom);
#endif
        HCURSOR keepImage = cursorStats.lastImage;
        POINT keepPos = cursorStats.lastPos;
        bool keepPosKnown = cursorStats.lastPosKnown;
        cursorStats = {};
        cursorStats.lastImage = keepImage;
        cursorStats.lastPos = keepPos;
        cursorStats.lastPosKnown = keepPosKnown;
    }
}

// Moves the panel cursor. While Windows shows its cursor (the game's menus
// leave it free), the panel cursor follows it. While the cursor is hidden
// (during play the game hides and locks it, and may keep re-centring it),
// the raw mouse movement is added instead.
void UpdatePanelMouse(ImGuiIO& io, bool front) {
    LONG moveX = InterlockedExchange(&pendingMouseX, 0);
    LONG moveY = InterlockedExchange(&pendingMouseY, 0);
    POINT screen = {};
    POINT cursor = {};
    RECT client = {};
    bool cursorKnown = front && GetCursorPos(&screen);
    cursor = screen;
    cursorKnown = cursorKnown && ScreenToClient(renderer.window, &cursor) &&
        GetClientRect(renderer.window, &client) && client.right > 0 && client.bottom > 0;
    float scaleX = cursorKnown ? static_cast<float>(renderer.width) / client.right : 1.0f;
    float scaleY = cursorKnown ? static_cast<float>(renderer.height) / client.bottom : 1.0f;
    CURSORINFO info = {};
    info.cbSize = sizeof(info);
    bool cursorShown = GetCursorInfo(&info) && (info.flags & CURSOR_SHOWING);
    bool moved = cursorKnown && cursorStats.lastPosKnown &&
        (screen.x != cursorStats.lastPos.x || screen.y != cursorStats.lastPos.y);
    cursorStats.lastPos = screen;
    cursorStats.lastPosKnown = cursorKnown;

    // v0.66 drew the panel's own cursor only while Windows hides its cursor.
    // v0.67 keeps that rule but lets the free/locked state settle first (see
    // kCursorSettleMs). A fresh panel takes the current state at once.
    bool rawFree = cursorKnown && cursorShown;
    ULONGLONG now = GetTickCount64();
    bool justOpened = InterlockedExchange(&panelJustOpened, 0) != 0;
    if (justOpened) {
        cursorFree = rawFree;
        cursorDisagreeSince = 0;
        cursorStats = {};
    } else if (rawFree == cursorFree) {
        cursorDisagreeSince = 0;
    } else if (!cursorDisagreeSince) {
        cursorDisagreeSince = now;
    } else if (now - cursorDisagreeSince >= kCursorSettleMs) {
        cursorFree = rawFree;
        cursorDisagreeSince = 0;
        cursorStats.modeChanges++;
        if (!cursorFree) {
            // Just became locked: carry on from where the Windows cursor was.
            moveX = 0;
            moveY = 0;
        }
    }
    io.MouseDrawCursor = !cursorFree;
    CountCursorFrame(cursorShown, moved, info.hCursor, !cursorFree, moveX, moveY);

    if (cursorFree && cursorKnown) {
        panelMouseX = cursor.x * scaleX;
        panelMouseY = cursor.y * scaleY;
    } else if (justOpened) {
        // Hidden cursor: start in the middle of the screen.
        panelMouseX = renderer.width * 0.5f;
        panelMouseY = renderer.height * 0.5f;
    } else if (front) {
        panelMouseX += moveX * scaleX;
        panelMouseY += moveY * scaleY;
    }
    panelMouseX = panelMouseX < 0.0f ? 0.0f : (panelMouseX > renderer.width - 1.0f ? renderer.width - 1.0f : panelMouseX);
    panelMouseY = panelMouseY < 0.0f ? 0.0f : (panelMouseY > renderer.height - 1.0f ? renderer.height - 1.0f : panelMouseY);
    io.AddMousePosEvent(panelMouseX, panelMouseY);
}

// Hands keyboard and mouse state to ImGui (game window in front only).
void FeedInput(ImGuiIO& io) {
    bool front = GameInFront();
    // v0.119: while the Keys section waits for a new key, that key must not
    // also press a panel button (Enter, Space) or move the selection.
    bool keysFree = front && !PywelKeybindsCapturing();
    for (unsigned index = 0; index < _countof(kKeys); ++index) {
        bool down = keysFree && (GetAsyncKeyState(kKeys[index].virtualKey) & 0x8000) != 0;
        if (down != keyWasDown[index]) {
            io.AddKeyEvent(kKeys[index].key, down);
            keyWasDown[index] = down;
        }
    }
    UpdatePanelMouse(io, front);
    const int buttons[2] = {VK_LBUTTON, VK_RBUTTON};
    for (int button = 0; button < 2; ++button) {
        bool down = front && (GetAsyncKeyState(buttons[button]) & 0x8000) != 0;
        if (down != mouseWasDown[button]) {
            io.AddMouseButtonEvent(button, down);
            mouseWasDown[button] = down;
        }
    }
    LONG wheel = InterlockedExchange(&pendingWheel, 0);
    if (wheel) {
        io.AddMouseWheelEvent(0.0f, wheel / static_cast<float>(WHEEL_DELTA));
    }
}

// Our window procedure: while the panel is open, keyboard and mouse messages
// (including raw input) are held back from the game. Alt+F4 and key/button
// releases still go through.
// Everything else goes to the previous window procedure unchanged.
LRESULT CALLBACK PanelWndProc(HWND window, UINT message, WPARAM wParam, LPARAM lParam) {
    WNDPROC previous = nullptr;
    for (unsigned index = 0; index < _countof(subclassed); ++index) {
        if (subclassed[index] == window) {
            previous = previousWndProc[index];
        }
    }
    if (InterlockedCompareExchange(&panelVisible, 0, 0)) {
        bool altF4 = message == WM_SYSKEYDOWN && wParam == VK_F4;
        if (message == WM_INPUT) {
            // v0.63: take the mouse movement and wheel for the panel cursor.
            // Only this message's own data is read; it is not passed on.
            RAWINPUT raw = {};
            UINT size = sizeof(raw);
            bool rawRead = GetRawInputData(reinterpret_cast<HRAWINPUT>(lParam), RID_INPUT, &raw, &size,
                sizeof(RAWINPUTHEADER)) != static_cast<UINT>(-1);

            // Key and button releases still reach the game, so a key held
            // while the panel opened is not stuck "down" after it closes.
            const USHORT buttonUpFlags = RI_MOUSE_LEFT_BUTTON_UP | RI_MOUSE_RIGHT_BUTTON_UP
                | RI_MOUSE_MIDDLE_BUTTON_UP | RI_MOUSE_BUTTON_4_UP | RI_MOUSE_BUTTON_5_UP;
            bool rawRelease = rawRead
                && ((raw.header.dwType == RIM_TYPEKEYBOARD && (raw.data.keyboard.Flags & RI_KEY_BREAK))
                    || (raw.header.dwType == RIM_TYPEMOUSE && (raw.data.mouse.usButtonFlags & buttonUpFlags)));
            if (rawRelease) {
                return previous ? CallWindowProcW(previous, window, message, wParam, lParam)
                                : DefWindowProcW(window, message, wParam, lParam);
            }

            if (rawRead && raw.header.dwType == RIM_TYPEMOUSE) {
                if (!(raw.data.mouse.usFlags & MOUSE_MOVE_ABSOLUTE)) {
                    InterlockedExchangeAdd(&pendingMouseX, raw.data.mouse.lLastX);
                    InterlockedExchangeAdd(&pendingMouseY, raw.data.mouse.lLastY);
                }
                if (raw.data.mouse.usButtonFlags & RI_MOUSE_WHEEL) {
                    InterlockedExchangeAdd(&pendingWheel, static_cast<SHORT>(raw.data.mouse.usButtonData));
                }
            }
            // Raw input must still be passed to DefWindowProc for clean-up.
            return DefWindowProcW(window, message, wParam, lParam);
        }
        if (message == WM_MOUSEWHEEL) {
            InterlockedExchangeAdd(&pendingWheel, GET_WHEEL_DELTA_WPARAM(wParam));
            return 0;
        }
        bool keyboard = message >= WM_KEYFIRST && message <= WM_KEYLAST;
        bool mouse = message >= WM_MOUSEFIRST && message <= WM_MOUSELAST;
        bool release = message == WM_KEYUP || message == WM_SYSKEYUP || message == WM_LBUTTONUP
            || message == WM_RBUTTONUP || message == WM_MBUTTONUP || message == WM_XBUTTONUP;
        if (((keyboard && !altF4) || mouse) && !release) {
            return 0;
        }
    }
    return previous ? CallWindowProcW(previous, window, message, wParam, lParam)
                    : DefWindowProcW(window, message, wParam, lParam);
}

// Installs our window procedure on a game window once.
void SubclassOnce(HWND window) {
    if (!window || !IsWindow(window)) {
        return;
    }
    for (unsigned index = 0; index < _countof(subclassed); ++index) {
        if (subclassed[index] == window) {
            return;
        }
    }
    for (unsigned index = 0; index < _countof(subclassed); ++index) {
        if (!subclassed[index]) {
            // Record the window first, so a message arriving during the swap
            // already finds its entry (previous is filled right after).
            subclassed[index] = window;
            previousWndProc[index] = reinterpret_cast<WNDPROC>(SetWindowLongPtrW(window, GWLP_WNDPROC,
                reinterpret_cast<LONG_PTR>(&PanelWndProc)));
            Note("panel: input hold-back installed on window 0x%llx (previous procedure 0x%llx)",
                reinterpret_cast<unsigned long long>(window),
                reinterpret_cast<unsigned long long>(previousWndProc[index]));
            return;
        }
    }
}

// ---------------------------------------------------------------------------
// Section: drawing (called from the Present hooks)
// ---------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Section: v0.119 Keys section (rebinding the mod's hotkeys, Keybinds.h)
// ---------------------------------------------------------------------------

// Which action waits for a new key (kKeyActionCount = none), and the keys
// already held when it started: only fresh presses count, so the click or
// Enter that started the wait is never taken as the new key.
PywelKeyAction captureAction = kKeyActionCount;
bool captureHeld[256] = {};
// A new key that another action already uses: the row that asked, the other
// action, and the key. The row then offers Swap or Cancel.
PywelKeyAction clashAction = kKeyActionCount;
PywelKeyAction clashWith = kKeyActionCount;
PywelKeyBinding clashBinding = {};

// True for keys that cannot be bound on their own: mouse buttons (the panel
// uses them), the Shift / Ctrl / Alt keys themselves and the Windows keys.
bool NotBindable(int key) {
    return key == VK_LBUTTON || key == VK_RBUTTON || key == VK_CANCEL || key == VK_MBUTTON ||
        key == VK_XBUTTON1 || key == VK_XBUTTON2 || key == VK_SHIFT || key == VK_CONTROL ||
        key == VK_MENU || (key >= VK_LSHIFT && key <= VK_RMENU) || key == VK_LWIN ||
        key == VK_RWIN || key == VK_APPS;
}

// v0.125: the frame in which the Hotkeys tab was last drawn. A key wait whose
// tab is no longer shown (the player picked another tab) is cancelled, the
// same as pressing Esc.
int keysTabFrame = -1;

// Starts waiting for a new key for `action`.
void StartCapture(PywelKeyAction action) {
    for (int key = 0; key < 256; ++key) {
        captureHeld[key] = (GetAsyncKeyState(key) & 0x8000) != 0;
    }
    captureAction = action;
    clashAction = kKeyActionCount;
    PywelKeybindsSetCapturing(true);
}

// Stops waiting for a new key (also when the panel closes).
void EndCapture() {
    if (captureAction != kKeyActionCount) {
        captureAction = kKeyActionCount;
        PywelKeybindsSetCapturing(false);
    }
}

// The Shift / Ctrl / Alt keys held right now, as Keybinds.h bits.
unsigned char HeldModifiers() {
    unsigned modifiers = 0;
    modifiers |= (GetAsyncKeyState(VK_SHIFT) & 0x8000) ? kKeyShift : 0u;
    modifiers |= (GetAsyncKeyState(VK_CONTROL) & 0x8000) ? kKeyCtrl : 0u;
    modifiers |= (GetAsyncKeyState(VK_MENU) & 0x8000) ? kKeyAlt : 0u;
    return static_cast<unsigned char>(modifiers);
}

// Called every drawn frame while the panel is open. While an action waits,
// the first freshly pressed key (with the Shift / Ctrl / Alt held) becomes
// its new key. Esc cancels; Backspace sets "no key" (not for the panel key,
// which must always have one). A key another action uses asks first.
void PollCapture() {
    if (captureAction == kKeyActionCount) {
        return;
    }
    if (!GameInFront()) {
        EndCapture();
        return;
    }
    int pressed = 0;
    for (int key = 1; key < 256; ++key) {
        bool down = (GetAsyncKeyState(key) & 0x8000) != 0;
        if (down && !captureHeld[key] && !NotBindable(key) && !pressed) {
            pressed = key;
        }
        captureHeld[key] = down;
    }
    if (!pressed) {
        return;
    }
    PywelKeyAction action = captureAction;
    EndCapture();
    if (pressed == VK_ESCAPE || (pressed == VK_BACK && action == kKeyOpenPanel)) {
        return;
    }
    PywelKeyBinding binding = {};
    if (pressed != VK_BACK) {
        binding.virtualKey = static_cast<unsigned short>(pressed);
        binding.modifiers = HeldModifiers();
    }
    PywelKeyAction other = PywelKeybindUsedBy(binding, action);
    if (other != kKeyActionCount) {
        clashAction = action;
        clashWith = other;
        clashBinding = binding;
        return;
    }
    PywelSetKeybind(action, binding);
    char text[32];
    PywelFormatKeybind(binding, text, sizeof(text));
    Note("key: %s = %s", PywelKeyActionLabel(action), text);
}

// One Keys row: the action's name, and its key on a button that starts
// waiting for a new key. Under it: a hint while waiting, a warning for keys
// the game also uses, or the Swap / Cancel choice after a clash.
void BuildKeyRow(PywelKeyAction action) {
    const ImVec4 gold = ImGui::GetStyleColorVec4(ImGuiCol_PlotHistogram);
    PywelKeyBinding binding = PywelGetKeybind(action);
    char text[32];
    if (captureAction == action) {
        strcpy_s(text, "Press a key...");
    } else {
        PywelFormatKeybind(binding, text, sizeof(text));
    }
    ImGui::PushID(static_cast<int>(action));
    // The key buttons line up in a column a little past the middle.
    float column = ImGui::GetCursorPosX() + ImGui::GetContentRegionAvail().x * 0.58f;
    ImGui::AlignTextToFramePadding();
    ImGui::TextUnformatted(PywelKeyActionLabel(action));
    ImGui::SameLine(column);
    if (ImGui::Button(text, ImVec2(-1.0f, 0.0f)) && captureAction == kKeyActionCount) {
        StartCapture(action);
    }
    if (captureAction == action) {
        ImGui::TextDisabled(action == kKeyOpenPanel ? "Esc cancels" : "Esc cancels \xc2\xb7 Backspace sets no key");
    } else if (binding.virtualKey && !binding.modifiers && PywelKeyUsedByGame(binding.virtualKey)) {
        ImGui::TextColored(gold, "The game also uses this key.");
    }
    if (clashAction == action) {
        char wanted[32];
        PywelFormatKeybind(clashBinding, wanted, sizeof(wanted));
        ImGui::TextColored(gold, "%s is used by %s.", wanted, PywelKeyActionLabel(clashWith));
        if (ImGui::SmallButton("Swap")) {
            // The other action takes this row's old key; the panel key can
            // never be left without one (PywelSetKeybind refuses "None").
            PywelSetKeybind(clashWith, binding);
            PywelSetKeybind(action, clashBinding);
            clashAction = kKeyActionCount;
            Note("key: %s = %s (swapped with %s)", PywelKeyActionLabel(action), wanted,
                PywelKeyActionLabel(clashWith));
        }
        ImGui::SameLine();
        if (ImGui::SmallButton("Cancel")) {
            clashAction = kKeyActionCount;
        }
    }
    ImGui::PopID();
}

// The Keys section (v0.123: the Hotkeys tab): one row per action and a
// button that puts every key back to its default. Changes are saved by the
// map-marker worker within about a second. Choosing another tab cancels a
// key wait (BuildPanelContents).
void BuildKeysSection() {
    keysTabFrame = ImGui::GetFrameCount();
    PollCapture();
    for (unsigned action = 0; action < kKeyActionCount; ++action) {
        BuildKeyRow(static_cast<PywelKeyAction>(action));
    }
    if (ImGui::Button("Reset to defaults")) {
        EndCapture();
        clashAction = kKeyActionCount;
        PywelResetKeybinds();
        Note("keys reset to defaults");
    }
}

// The current key of an action as text ("F9"), for the panel's hints.
void KeyName(PywelKeyAction action, char (&text)[32]) {
    PywelFormatKeybind(PywelGetKeybind(action), text, sizeof(text));
}

// Last seen key states. Swapped atomically, because with frame generation
// two threads can present at once and only one of them may see a key press.
volatile LONG f9WasDown = 0;
volatile LONG escapeWasDown = 0;
volatile LONG shiftF9WasDown = 0; // v0.110.

// F9 toggles the panel and Esc closes it (game window in front only).
// v0.110: Shift+F9 toggles the completion widget's details instead, so plain
// F9 ignores presses while Shift is held.
// v0.119: both keys come from Keybinds.h (the f9 / shiftF9 names are kept);
// their Shift / Ctrl / Alt must match exactly, so they never overlap. Esc
// stays fixed. While the Keys section waits for a new key, nothing here
// reacts, so pressing the panel key or Esc there does not close the panel.
void PollHotkeys() {
    bool front = GameInFront();
    bool capturing = PywelKeybindsCapturing();
    LONG f9 = PywelKeybindDown(kKeyOpenPanel) ? 1 : 0;
    LONG shiftF9 = PywelKeybindDown(kKeyWidgetSize) ? 1 : 0;
    LONG escape = !capturing && front && (GetAsyncKeyState(VK_ESCAPE) & 0x8000) != 0;
    if (capturing) {
        // Count the keys as already held: the key just pressed as the new
        // binding (say F9) must be let go before it can close the panel.
        InterlockedExchange(&f9WasDown, 1);
        InterlockedExchange(&shiftF9WasDown, 1);
        InterlockedExchange(&escapeWasDown, 1);
    }
    if (shiftF9 && !InterlockedExchange(&shiftF9WasDown, shiftF9)) {
        PywelHudSettings hud = PywelGetHudSettings();
        hud.expanded = !hud.expanded;
        PywelSetHudSettings(hud);
        Note("completion widget %s (widget key)", hud.expanded ? "expanded" : "compact");
    } else if (!shiftF9) {
        InterlockedExchange(&shiftF9WasDown, 0);
    }
    if (f9 && !InterlockedExchange(&f9WasDown, f9)) {
        LONG now = InterlockedCompareExchange(&panelVisible, 0, 0) ? 0 : 1;
        if (now) {
            // Fresh start for the panel cursor; drop movement from before.
            InterlockedExchange(&pendingMouseX, 0);
            InterlockedExchange(&pendingMouseY, 0);
            InterlockedExchange(&panelJustOpened, 1);
        }
        InterlockedExchange(&panelVisible, now);
        Note("panel %s (panel key)", now ? "opened" : "closed");
    } else if (!f9) {
        InterlockedExchange(&f9WasDown, 0);
    }
    if (escape && !InterlockedExchange(&escapeWasDown, escape)) {
        if (InterlockedExchange(&panelVisible, 0)) {
            Note("panel closed (Esc)");
        }
    } else if (!escape) {
        InterlockedExchange(&escapeWasDown, 0);
    }
    // v0.119: tell Keybinds.h whether the panel is open (other mod keys wait
    // while it is), and stop waiting for a new key once it has closed.
    bool open = InterlockedCompareExchange(&panelVisible, 0, 0) != 0;
    PywelKeybindsSetPanelOpen(open);
    if (!open) {
        EndCapture();
    }
}

// Closes the panel (the X button; F9 and Esc are handled in PollHotkeys).
void ClosePanel(const char* how) {
    if (InterlockedExchange(&panelVisible, 0)) {
        Note("panel closed (%s)", how);
    }
}

// The header row: "Pywel Atlas" in gold on the left, an X on the right.
void BuildHeader() {
    const ImVec4 gold = ImGui::GetStyleColorVec4(ImGuiCol_PlotHistogram);
    ImGui::TextColored(gold, "Pywel Atlas");
    float size = ImGui::GetTextLineHeight();
    ImGui::SameLine();
    ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetContentRegionAvail().x - size);
    ImVec2 corner = ImGui::GetCursorScreenPos();
    if (ImGui::InvisibleButton("close", ImVec2(size, size))) {
        ClosePanel("X");
    }
    char panelKey[32];
    KeyName(kKeyOpenPanel, panelKey);
    ImGui::SetItemTooltip("Close (%s or Esc)", panelKey); // v0.119: current panel key.
    // Draw the X: dim normally, gold when the mouse is over it.
    ImU32 colour = ImGui::GetColorU32(ImGui::IsItemHovered() ? ImGuiCol_PlotHistogram : ImGuiCol_TextDisabled);
    float inset = size * 0.25f;
    float thickness = size * 0.1f > 1.0f ? size * 0.1f : 1.0f;
    ImDrawList* draw = ImGui::GetWindowDrawList();
    draw->AddLine(ImVec2(corner.x + inset, corner.y + inset),
        ImVec2(corner.x + size - inset, corner.y + size - inset), colour, thickness);
    draw->AddLine(ImVec2(corner.x + size - inset, corner.y + inset),
        ImVec2(corner.x + inset, corner.y + size - inset), colour, thickness);
}

// One category row: checkbox and name, the done count on the right, and a
// thin progress bar (done / total) under the name.
void BuildCategoryRow(unsigned category, const PywelMarkerCategoryStatus& status) {
    bool value = status.available && status.shown;
    ImGui::BeginDisabled(!status.available);
    if (ImGui::Checkbox(status.name, &value)) {
        PywelSetMarkerCategoryShown(category, value);
    }
    ImGui::EndDisabled();

    // The count, right-aligned on the same line.
    char count[48];
    if (!status.available) {
        strcpy_s(count, "paused");
    } else if (status.needsAddon) {
        // v0.78: Greymane Shrines without the Shrine Icons file mod.
        strcpy_s(count, "needs add-on");
    } else if (!status.saveKnown) {
        strcpy_s(count, "-");
    } else {
        // v0.101: quest-locked spots are neither done nor counted yet.
        unsigned reachable = status.total - (status.locked < status.total ? status.locked : status.total);
        if (status.locked) {
            sprintf_s(count, "%u / %u, %u after a quest", status.done, reachable, status.locked);
        } else {
            sprintf_s(count, "%u / %u", status.done, reachable);
        }
    }
    ImGui::SameLine();
    float width = ImGui::CalcTextSize(count).x;
    ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetContentRegionAvail().x - width);
    ImGui::TextDisabled("%s", count);
    if (status.needsAddon) {
        ImGui::SetItemTooltip("World-map pins need the Pywel Atlas Shrine Icons file mod (install it in DMM). Minimap pins still work.");
    } else if (status.available && status.saveKnown && status.locked) {
        ImGui::SetItemTooltip("%u done, %u on the map, %u unlock after a quest", status.done, status.onMap,
            status.locked);
    } else if (status.available && status.saveKnown) {
        ImGui::SetItemTooltip("%u done, %u on the map", status.done, status.onMap);
    }

    // The progress bar, from under the name to the right edge.
    ImGuiStyle& style = ImGui::GetStyle();
    float height = style.FramePadding.y; // Thin; scales with the panel.
    ImVec2 start = ImGui::GetCursorScreenPos();
    start.x += ImGui::GetFrameHeight() + style.ItemInnerSpacing.x;
    start.y -= style.ItemSpacing.y * 0.5f;
    float end = ImGui::GetCursorScreenPos().x + ImGui::GetContentRegionAvail().x;
    if (status.available && status.total > 0) {
        ImDrawList* draw = ImGui::GetWindowDrawList();
        draw->AddRectFilled(start, ImVec2(end, start.y + height), ImGui::GetColorU32(ImGuiCol_FrameBg), height);
        unsigned reachable = status.total - (status.locked < status.total ? status.locked : status.total);
        float filled = status.saveKnown && reachable ? static_cast<float>(status.done) / reachable : 0.0f;
        if (filled > 0.0f) {
            float barEnd = start.x + (end - start.x) * filled;
            barEnd = barEnd - start.x < height ? start.x + height : barEnd; // Always visible once started.
            draw->AddRectFilled(start, ImVec2(barEnd, start.y + height),
                ImGui::GetColorU32(ImGuiCol_PlotHistogram), height);
        }
    }
    ImGui::Dummy(ImVec2(0.0f, height));
}

// ---------------------------------------------------------------------------
// Section: v0.110 completion tracker (panel section and always-on widget)
// ---------------------------------------------------------------------------
//
// The marker part counts collected spots per game region (MarkerFilter.h,
// PywelGetRegionProgress). The panel lists them; the widget shows the area
// the player is in, right under the minimap. Everything here runs on the
// presenting thread under renderLock.

// The widget's base widths at 1080 lines and zoom 1: the compact strip and
// the expanded card. The saved width is always the compact one, so both
// looks share one zoom.
constexpr float kHudCompactWidth = 240.0f;
constexpr float kHudExpandedWidth = 280.0f;
// A map view copy younger than this means that map is on screen.
constexpr ULONGLONG kHudFreshMs = 200;

PywelRegionProgress hudProgress; // This frame's copy for the widget (large).
float hudZoom = 1.0f; // Set from the widget window's width (like panelZoom).
PywelHudSettings hudApplied = {}; // Settings the widget window last took or reported.
bool hudAppliedValid = false;
float hudReported[3] = {}; // Place last handed to the marker part (fractions).
bool hudPressed = false; // A click started on the widget window.

// v0.110: one completion row: label on the left, the count on the right and
// a thin bar (done / total) under it, like the category rows.
void BuildProgressRow(const char* label, unsigned done, unsigned total, bool saveKnown, bool here) {
    const ImVec4 gold = ImGui::GetStyleColorVec4(ImGuiCol_PlotHistogram);
    if (here) {
        ImGui::TextColored(gold, "%s", label);
    } else {
        ImGui::TextUnformatted(label);
    }
    char count[48];
    if (!saveKnown) {
        strcpy_s(count, "-");
    } else if (here && total > 0) {
        sprintf_s(count, "%u%%  (%u / %u)", done * 100 / total, done, total);
    } else {
        sprintf_s(count, "%u / %u", done, total);
    }
    ImGui::SameLine();
    float width = ImGui::CalcTextSize(count).x;
    ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetContentRegionAvail().x - width);
    ImGui::TextDisabled("%s", count);

    // The bar, tucked under the text.
    ImGuiStyle& style = ImGui::GetStyle();
    float height = style.FramePadding.y;
    ImVec2 start = ImGui::GetCursorScreenPos();
    start.y -= style.ItemSpacing.y * 0.5f;
    float end = start.x + ImGui::GetContentRegionAvail().x;
    if (total > 0) {
        ImDrawList* draw = ImGui::GetWindowDrawList();
        draw->AddRectFilled(start, ImVec2(end, start.y + height), ImGui::GetColorU32(ImGuiCol_FrameBg), height);
        float filled = saveKnown ? static_cast<float>(done) / total : 0.0f;
        if (filled > 0.0f) {
            float barEnd = start.x + (end - start.x) * filled;
            barEnd = barEnd - start.x < height ? start.x + height : barEnd;
            draw->AddRectFilled(start, ImVec2(barEnd, start.y + height),
                ImGui::GetColorU32(ImGuiCol_PlotHistogram), height);
        }
    }
    ImGui::Dummy(ImVec2(0.0f, height));
}

// v0.110: the Completion section: the area the player is in, the widget's
// options, then every region group (collapsed) with its areas.
void BuildCompletionSection() {
    static PywelRegionProgress progress; // Large; render thread only.
    if (!PywelGetRegionProgress(progress)) {
        // v0.123: the tab would otherwise be empty.
        ImGui::TextDisabled("Waiting for the loaded save.");
        return;
    }
    // v0.123: drawn inside the panel's Completion tab, which names it.
    if (progress.currentArea >= 0) {
        const PywelRegionArea& area = progress.areas[progress.currentArea];
        const char* group = progress.groups[area.group];
        char label[96];
        if (strcmp(area.name, "Other areas") == 0 || strcmp(area.name, group) == 0) {
            sprintf_s(label, "Here: %s", group);
        } else {
            sprintf_s(label, "Here: %s", area.name);
        }
        BuildProgressRow(label, area.done, area.total, progress.saveKnown, true);
    } else {
        ImGui::TextDisabled("Here: -");
    }

    // The always-on widget's options (saved by the marker part).
    PywelHudSettings hud = PywelGetHudSettings();
    if (ImGui::Checkbox("Show on screen", &hud.shown)) {
        PywelSetHudSettings(hud);
    }
    ImGui::SameLine();
    if (ImGui::Checkbox("Show details", &hud.expanded)) {
        PywelSetHudSettings(hud);
    }
    ImGui::SameLine();
    if (ImGui::Button("Reset position")) {
        hud.known = false; // Back to its default place under the minimap.
        PywelSetHudSettings(hud);
    }

    if (ImGui::TreeNode("All regions")) {
        for (unsigned group = 0; group < progress.groupCount; ++group) {
            unsigned done = 0;
            unsigned total = 0;
            unsigned areas = 0;
            for (unsigned area = 0; area < progress.areaCount; ++area) {
                if (progress.areas[area].group == group) {
                    done += progress.areas[area].done;
                    total += progress.areas[area].total;
                    ++areas;
                }
            }
            if (areas <= 1) {
                BuildProgressRow(progress.groups[group], done, total, progress.saveKnown, false);
                continue;
            }
            bool open = ImGui::TreeNode(progress.groups[group]);
            char count[48];
            if (progress.saveKnown) {
                sprintf_s(count, "%u / %u", done, total);
            } else {
                strcpy_s(count, "-");
            }
            ImGui::SameLine();
            float width = ImGui::CalcTextSize(count).x;
            ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetContentRegionAvail().x - width);
            ImGui::TextDisabled("%s", count);
            if (open) {
                for (unsigned area = 0; area < progress.areaCount; ++area) {
                    if (progress.areas[area].group == group && progress.areas[area].total > 0) {
                        BuildProgressRow(progress.areas[area].name, progress.areas[area].done,
                            progress.areas[area].total, progress.saveKnown, false);
                    }
                }
                ImGui::TreePop();
            }
        }
        ImGui::TreePop();
    }
}

// A colour given as 0xRRGGBB, in this frame's encoding (HDR10 converted).
ImU32 HudColour(unsigned rgb, float alpha = 1.0f) {
    return FrameColour(ImVec4(((rgb >> 16) & 0xff) / 255.0f, ((rgb >> 8) & 0xff) / 255.0f,
        (rgb & 0xff) / 255.0f, alpha));
}

// Writes `text` at `size` pixels in the panel font; `at.x` is the right edge
// when `right` is set. With no draw list it only measures. Returns the height.
float HudText(ImDrawList* draw, float size, ImVec2 at, ImU32 colour, const char* text, bool right) {
    ImFont* font = ImGui::GetFont();
    ImVec2 extent = font->CalcTextSizeA(size, FLT_MAX, 0.0f, text);
    if (draw) {
        draw->AddText(font, size, ImVec2(right ? at.x - extent.x : at.x, at.y), colour, text);
    }
    return extent.y;
}

// A bar from `left` to `right`: the track, then the `filled` share (0..1).
void HudBar(ImDrawList* draw, float left, float right, float top, float height, float filled, ImU32 colour) {
    if (!draw) {
        return;
    }
    draw->AddRectFilled(ImVec2(left, top), ImVec2(right, top + height), HudColour(0x2e2820), height * 0.5f);
    if (filled > 0.0f) {
        float end = left + (right - left) * (filled < 1.0f ? filled : 1.0f);
        draw->AddRectFilled(ImVec2(left, top), ImVec2(end, top + height), colour, height * 0.5f);
    }
}

// "done / total", with "-" for done while the save is not known.
void HudCount(char (&text)[32], unsigned done, unsigned total, bool saveKnown) {
    if (saveKnown) {
        sprintf_s(text, "%u / %u", done, total);
    } else {
        sprintf_s(text, "- / %u", total);
    }
}

// Lays out the widget's contents from hudProgress at `origin`, `width`
// pixels wide, every size times `scale`. With no draw list it only measures.
// Returns the box height.
float LayoutHud(ImDrawList* draw, ImVec2 origin, float width, float scale, bool expanded) {
    const PywelRegionProgress& progress = hudProgress;
    bool saveKnown = progress.saveKnown;
    bool mapped = progress.currentArea >= 0;
    const PywelRegionArea* area = mapped ? &progress.areas[progress.currentArea] : nullptr;
    const char* group = mapped ? progress.groups[area->group] : "";
    // "Other areas" is the group's own land: name the group instead.
    const char* title = !mapped ? "Unmapped area" : (strcmp(area->name, "Other areas") == 0 ? group : area->name);
    char count[32] = {};
    float share = 0.0f;
    if (mapped) {
        HudCount(count, area->done, area->total, saveKnown);
        share = saveKnown && area->total > 0 ? static_cast<float>(area->done) / area->total : 0.0f;
    }
    ImU32 text = HudColour(0xe9e2d0);
    ImU32 secondary = HudColour(0x9a917e);
    ImU32 gold = HudColour(0xd8b36a);
    float padX = (expanded ? 14.0f : 12.0f) * scale;
    float padY = (expanded ? 10.0f : 8.0f) * scale;
    float left = origin.x + padX;
    float right = origin.x + width - padX;
    float y = origin.y + padY;

    if (!expanded) {
        // Compact strip: area name and count on one line, a thin bar under it.
        float line = HudText(draw, 15.0f * scale, ImVec2(left, y), gold, title, false);
        if (mapped) {
            float countHeight = HudText(nullptr, 14.0f * scale, ImVec2(), text, count, true);
            HudText(draw, 14.0f * scale, ImVec2(right, y + (line - countHeight) * 0.5f), text, count, true);
        }
        y += line + 6.0f * scale;
        if (mapped) {
            HudBar(draw, left, right, y, 3.0f * scale, share, gold);
        }
        y += 3.0f * scale;
        return y + padY - origin.y;
    }

    // Expanded card: title, group name under it and the % on the right.
    float block = HudText(draw, 17.0f * scale, ImVec2(left, y), gold, title, false);
    if (mapped && strcmp(title, group) != 0) {
        block += 2.0f * scale;
        block += HudText(draw, 13.0f * scale, ImVec2(left, y + block), secondary, group, false);
    }
    if (mapped) {
        char percent[16];
        if (saveKnown && area->total > 0) {
            sprintf_s(percent, "%u%%", area->done * 100 / area->total);
        } else {
            strcpy_s(percent, "-");
        }
        float percentHeight = HudText(draw, 20.0f * scale, ImVec2(right, y), text, percent, true);
        block = block > percentHeight ? block : percentHeight;
    }
    y += block;
    if (!mapped) {
        return y + padY - origin.y;
    }
    y += 6.0f * scale;
    HudBar(draw, left, right, y, 4.0f * scale, share, gold);
    y += 4.0f * scale;

    // One row per category with spots in this area.
    for (unsigned index = 0; index < progress.hereCategoryCount; ++index) {
        const PywelHereCategory& category = progress.hereCategories[index];
        char categoryCount[32];
        HudCount(categoryCount, category.done, category.total, saveKnown);
        y += (index == 0 ? 8.0f : 6.0f) * scale;
        float line = HudText(draw, 13.0f * scale, ImVec2(left, y), text, category.name, false);
        HudText(draw, 13.0f * scale, ImVec2(right, y), secondary, categoryCount, true);
        y += line + 3.0f * scale;
        bool full = saveKnown && category.done == category.total;
        float filled = saveKnown && category.total > 0 ? static_cast<float>(category.done) / category.total : 0.0f;
        HudBar(draw, left, right, y, 2.0f * scale, filled, full ? gold : HudColour(0xb8975a));
        y += 2.0f * scale;
    }

    // A rule, then the whole group's count.
    unsigned groupDone = 0;
    unsigned groupTotal = 0;
    for (unsigned other = 0; other < progress.areaCount; ++other) {
        if (progress.areas[other].group == area->group) {
            groupDone += progress.areas[other].done;
            groupTotal += progress.areas[other].total;
        }
    }
    char groupCount[32];
    HudCount(groupCount, groupDone, groupTotal, saveKnown);
    y += 8.0f * scale;
    float rule = scale > 1.0f ? scale : 1.0f;
    if (draw) {
        draw->AddRectFilled(ImVec2(left, y), ImVec2(right, y + rule), HudColour(0x3a3024));
    }
    y += rule + 6.0f * scale;
    float line = HudText(draw, 12.0f * scale, ImVec2(left, y), secondary, group, false);
    HudText(draw, 12.0f * scale, ImVec2(right, y), secondary, groupCount, true);
    y += line;
    return y + padY - origin.y;
}

// Draws the whole widget (box, border, contents) at `origin`. `outline`
// adds the faint gold frame that shows it can be moved (panel open).
void DrawHud(ImDrawList* draw, ImVec2 origin, float width, float scale, bool expanded, bool outline) {
    float height = LayoutHud(nullptr, origin, width, scale, expanded);
    float rounding = (expanded ? 8.0f : 6.0f) * scale;
    ImVec2 end(origin.x + width, origin.y + height);
    draw->AddRectFilled(origin, end, HudColour(0x14110d, 0.88f), rounding);
    draw->AddRect(origin, end, HudColour(0x6b5631), rounding);
    LayoutHud(draw, origin, width, scale, expanded);
    if (outline) {
        draw->AddRect(ImVec2(origin.x - 2.0f, origin.y - 2.0f), ImVec2(end.x + 2.0f, end.y + 2.0f),
            HudColour(0xd8b36a, 0.5f), rounding + 2.0f);
    }
}

// The widget's zoom from its saved width (compact base), or 1 if none.
float HudZoomFrom(const PywelHudSettings& hud, float factor) {
    if (!hud.known) {
        return 1.0f;
    }
    float zoom = hud.width * renderer.width / (kHudCompactWidth * factor);
    return zoom < 0.6f ? 0.6f : (zoom > 3.0f ? 3.0f : zoom);
}

// v0.113: where the widget's box goes. The saved y (hud=) is always the top
// of the COMPACT strip. v0.110-v0.112 never moved the top edge when the
// details opened, so their saved y is that same edge and loads unchanged.
// Low on screen (the compact strip's centre in the lower half) the box keeps
// the compact strip's BOTTOM edge instead, so the details grow upward.

// True when a compact strip with its top at `compactTop` sits low on screen.
bool HudAnchoredLow(float compactTop, float compactHeight) {
    return compactTop + compactHeight * 0.5f >= renderer.height * 0.5f;
}

// v0.116: how far above a low minimap's centre the default widget's bottom
// sits, in minimap radii (the radius PywelRouteMinimapCircle gives: half of
// #MinimapDisplay's width). Clears the game's date and area lines, which
// reach about 2.0 radii above the centre (user screenshots, 2026-10-24).
constexpr float kHudAboveMinimap = 2.1f;
bool hudDefaultLogged = false; // The default place was logged since the last saved place.

// The compact strip's top-left: its saved place, or by the minimap circle:
// v0.116: centred above the game's date and area lines when the circle is
// low on screen (a bottom-left minimap), else right-aligned under it. 0.80 /
// 0.30 of the screen while the circle is unknown. `width` is the box's width
// in its current look.
ImVec2 HudCompactPlace(const PywelHudSettings& hud, float width, float compactHeight, float factor) {
    float screenWidth = static_cast<float>(renderer.width);
    float screenHeight = static_cast<float>(renderer.height);
    if (hud.known) {
        hudDefaultLogged = false; // Log the default again after a Reset.
        return ImVec2(hud.x * screenWidth, hud.y * screenHeight);
    }
    PywelMinimapView view = {};
    float centreX = 0.0f;
    float centreY = 0.0f;
    float radius = 0.0f;
    if (PywelGetMinimapView(view) &&
        PywelRouteMinimapCircle(view, screenWidth, screenHeight, centreX, centreY, radius)) {
        if (centreY >= screenHeight * 0.5f) {
            ImVec2 place(centreX - width * 0.5f, centreY - kHudAboveMinimap * radius - compactHeight);
            if (!hudDefaultLogged) {
                Note("completion widget default place: minimap circle centre (%.1f, %.1f) radius %.1f; "
                    "strip (%.1f, %.1f) %.1f x %.1f, bottom %.1f (before keeping it on screen)",
                    centreX, centreY, radius, place.x, place.y, width, compactHeight, place.y + compactHeight);
                hudDefaultLogged = true;
            }
            return place;
        }
        return ImVec2(centreX + radius - width, centreY + radius + 12.0f * factor);
    }
    return ImVec2(screenWidth * 0.80f, screenHeight * 0.30f);
}

// The box's top-left, for a box `width` x `height` whose compact strip has
// its top-left at `compact`: low on screen the bottom edges line up. The box
// is then kept fully inside the screen.
ImVec2 HudBoxPlace(ImVec2 compact, float width, float height, float compactHeight) {
    float top = HudAnchoredLow(compact.y, compactHeight) ? compact.y + compactHeight - height : compact.y;
    float maxLeft = renderer.width - width;
    float maxTop = renderer.height - height;
    float left = compact.x < maxLeft ? compact.x : maxLeft;
    top = top < maxTop ? top : maxTop;
    return ImVec2(left > 0.0f ? left : 0.0f, top > 0.0f ? top : 0.0f);
}

// The reverse of HudBoxPlace (without the clamp), for a box the player
// moved: the compact strip's top. Bottom-anchored if that leaves the strip
// low on screen, else top-anchored, so the two never disagree.
float HudCompactTop(float boxTop, float height, float compactHeight) {
    float lowTop = boxTop + height - compactHeight;
    return HudAnchoredLow(lowTop, compactHeight) ? lowTop : boxTop;
}

// True when the widget is due with the panel closed: switched on, the
// minimap on screen and the world map not (so it hides where the minimap does).
bool HudWanted() {
    if (!PywelGetHudSettings().shown) {
        return false;
    }
    ULONGLONG now = GetTickCount64();
    PywelMinimapView minimap = {};
    PywelWorldMapView world = {};
    bool minimapFresh = PywelGetMinimapView(minimap) && now - minimap.tick < kHudFreshMs;
    bool worldFresh = PywelGetWorldMapView(world) && now - world.tick < kHudFreshMs;
    return minimapFresh && !worldFresh;
}

// Panel closed: draws the widget at its saved place; no window, no input.
void DrawHudClosed() {
    if (!PywelGetRegionProgress(hudProgress)) {
        return;
    }
    PywelHudSettings hud = PywelGetHudSettings();
    float factor = ImGui::GetStyle().FontScaleDpi;
    float zoom = HudZoomFrom(hud, factor);
    float width = (hud.expanded ? kHudExpandedWidth : kHudCompactWidth) * factor * zoom;
    float scale = factor * zoom;
    float compactHeight = LayoutHud(nullptr, ImVec2(), width, scale, false);
    float height = LayoutHud(nullptr, ImVec2(), width, scale, hud.expanded);
    ImVec2 box = HudBoxPlace(HudCompactPlace(hud, width, compactHeight, factor), width, height, compactHeight);
    DrawHud(ImGui::GetForegroundDrawList(), box, width, scale, hud.expanded, false);
}

// Panel open: the widget as its own window, so it can be dragged and its
// corner can set the width (the zoom follows). A click without a drag
// switches compact/expanded. Begun before BuildPanel, so the panel stays on
// top. The place is handed to the marker part once the mouse is released.
void BuildHudWindow() {
    PywelHudSettings hud = PywelGetHudSettings();
    if (!hud.shown || !PywelGetRegionProgress(hudProgress)) {
        return;
    }
    float screenWidth = static_cast<float>(renderer.width);
    float screenHeight = static_cast<float>(renderer.height);
    float factor = ImGui::GetStyle().FontScaleDpi;
    float base = (hud.expanded ? kHudExpandedWidth : kHudCompactWidth) * factor;

    // Take the saved settings when they changed elsewhere (first frame, Reset,
    // Shift+F9, the panel checkbox), and keep following the default place
    // until the widget is moved.
    bool reapply = !hudAppliedValid || hud.known != hudApplied.known || hud.expanded != hudApplied.expanded ||
        (hud.known && (hud.x != hudApplied.x || hud.y != hudApplied.y || hud.width != hudApplied.width)) ||
        (!hud.known && !hudPressed);
    if (reapply) {
        hudZoom = HudZoomFrom(hud, factor);
    }
    float width = base * hudZoom;
    float height = LayoutHud(nullptr, ImVec2(), width, factor * hudZoom, hud.expanded);
    float compactHeight = LayoutHud(nullptr, ImVec2(), width, factor * hudZoom, false); // v0.113.
    if (reapply) {
        ImVec2 place = HudBoxPlace(HudCompactPlace(hud, width, compactHeight, factor), width, height, compactHeight);
        ImGui::SetNextWindowPos(place, ImGuiCond_Always);
        ImGui::SetNextWindowSize(ImVec2(width, height), ImGuiCond_Always);
        hudApplied = hud;
        hudAppliedValid = true;
        hudReported[0] = place.x / screenWidth;
        hudReported[1] = HudCompactTop(place.y, height, compactHeight) / screenHeight;
        hudReported[2] = hudZoom * kHudCompactWidth * factor / screenWidth;
    }
    // The height always fits the contents; only the width can be dragged.
    ImGui::SetNextWindowSizeConstraints(ImVec2(base * 0.6f, height),
        ImVec2(base * 3.0f < screenWidth ? base * 3.0f : screenWidth, height));
    ImGui::PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2(0.0f, 0.0f));
    ImGui::PushStyleVar(ImGuiStyleVar_WindowBorderSize, 0.0f);
    ImGui::PushStyleVar(ImGuiStyleVar_WindowMinSize, ImVec2(1.0f, 1.0f));
    ImGui::Begin("##Completion widget", nullptr, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoBackground |
        ImGuiWindowFlags_NoSavedSettings | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoScrollWithMouse |
        ImGuiWindowFlags_NoFocusOnAppearing);
    ImVec2 position = ImGui::GetWindowPos();
    ImVec2 size = ImGui::GetWindowSize();
    float zoom = size.x / base;
    hudZoom = zoom < 0.6f ? 0.6f : (zoom > 3.0f ? 3.0f : zoom);
    DrawHud(ImGui::GetWindowDrawList(), position, size.x, factor * hudZoom, hud.expanded, true);
    ImGui::Dummy(ImVec2(size.x, height));

    // A click that did not drag switches compact/expanded.
    ImGuiIO& io = ImGui::GetIO();
    if (ImGui::IsMouseClicked(0) && ImGui::IsWindowHovered()) {
        hudPressed = true;
    }
    if (ImGui::IsMouseReleased(0)) {
        float still = 4.0f * factor;
        if (hudPressed && io.MouseDragMaxDistanceSqr[0] < still * still) {
            hud.expanded = !hud.expanded;
            PywelSetHudSettings(hud);
        }
        hudPressed = false;
    }

    // Report a moved or resized widget once the mouse button is released
    // (v0.113: y as the compact strip's top, see HudCompactTop).
    float place[3] = {position.x / screenWidth, HudCompactTop(position.y, height, compactHeight) / screenHeight,
        hudZoom * kHudCompactWidth * factor / screenWidth};
    bool changed = false;
    for (unsigned index = 0; index < 3; ++index) {
        changed = changed || std::fabs(place[index] - hudReported[index]) > 0.0005f;
    }
    if (changed && !io.MouseDown[0]) {
        hud.known = true;
        hud.x = place[0];
        hud.y = place[1];
        hud.width = place[2];
        PywelSetHudSettings(hud);
        hudApplied = hud;
        memcpy(hudReported, place, sizeof(hudReported));
    }
    ImGui::End();
    ImGui::PopStyleVar(3);
}

// v0.123: the Filters tab: the marker category rows and Show all / Hide all
// (the panel's whole contents before v0.123).
void BuildFiltersTab() {
    if (!PywelMarkersEnabled()) {
        // A style colour, so it is converted for HDR like the rest.
        // v0.119: names the player's current keys.
        char offKey[32];
        char onKey[32];
        KeyName(kKeyMarkersOff, offKey);
        KeyName(kKeyMarkersOn, onKey);
        ImGui::TextColored(ImGui::GetStyleColorVec4(ImGuiCol_PlotHistogram),
            "All markers are hidden (%s). %s shows them.", offKey, onKey);
        ImGui::Spacing();
    }
    for (unsigned category = 0; category < kPywelMarkerCategories; ++category) {
        PywelMarkerCategoryStatus status = {};
        if (PywelGetMarkerCategory(category, status)) {
            BuildCategoryRow(category, status);
        }
    }
    ImGui::Spacing();
    if (ImGui::Button("Show all")) {
        for (unsigned category = 0; category < kPywelMarkerCategories; ++category) {
            PywelSetMarkerCategoryShown(category, true);
        }
    }
    ImGui::SameLine();
    if (ImGui::Button("Hide all")) {
        for (unsigned category = 0; category < kPywelMarkerCategories; ++category) {
            PywelSetMarkerCategoryShown(category, false);
        }
    }
}

// v0.123: the panel's tabs, left to right. Each row is the tab's name and
// the function that draws its contents. To add a tab, write its function
// and add one row here; nothing else needs to change.
struct PanelTab {
    const char* name;
    void (*build)();
};
const PanelTab kPanelTabs[] = {
    {"Filters", BuildFiltersTab},
    {"Route", PywelRouteBuildPanelSection},    // v0.104, RouteOverlay.cpp.
    {"Completion", BuildCompletionSection},    // v0.110.
    {"Hotkeys", BuildKeysSection},             // v0.119.
};

// The panel's contents (v0.64 behaviour, v0.65 layout; v0.123: tabs).
// ImGui remembers the chosen tab while the game runs. v0.125: a key wait
// started on the Hotkeys tab ends, as if Esc were pressed, once another tab
// is chosen.
void BuildPanelContents() {
    BuildHeader();
    ImGui::Spacing();
    if (ImGui::BeginTabBar("panelTabs")) {
        for (const PanelTab& tab : kPanelTabs) {
            if (ImGui::BeginTabItem(tab.name)) {
                tab.build();
                ImGui::EndTabItem();
            }
        }
        ImGui::EndTabBar();
    }
    if (captureAction != kKeyActionCount && keysTabFrame != ImGui::GetFrameCount()) {
        EndCapture();
        Note("key wait cancelled (another tab chosen)");
    }
    ImGui::Spacing();
    char panelKey[32];
    KeyName(kKeyOpenPanel, panelKey);
    ImGui::TextDisabled("Saved automatically \xc2\xb7 %s or Esc closes", panelKey);
}

// Size constraint: keep the width the player chose, but make the height
// exactly fit the contents measured last frame.
void FitHeight(ImGuiSizeCallbackData* data) {
    if (panelContentHeight > 0.0f) {
        data->DesiredSize.y = panelContentHeight;
    }
}

// The panel window. Its first position and width come from filters.ini (or a
// default); after that the player can drag it anywhere and drag its corner.
// v0.65: the corner sets the width only; the zoom follows the width (so text,
// spacing and boxes all grow together) and the height fits the contents.
// Changes are handed to the marker part, which saves them.
void BuildPanel() {
    float screenWidth = static_cast<float>(renderer.width);
    float screenHeight = static_cast<float>(renderer.height);
    float dpi = ImGui::GetStyle().FontScaleDpi;
    float baseWidth = kPanelBaseWidth * dpi;
    if (!panelGeometryApplied) {
        float geometry[4] = {};
        ImVec2 position(screenWidth * 0.04f, screenHeight * 0.12f);
        ImVec2 size(baseWidth, baseWidth * 0.6f);
        if (PywelGetPanelGeometry(geometry)) {
            position = ImVec2(geometry[0] * screenWidth, geometry[1] * screenHeight);
            size = ImVec2(geometry[2] * screenWidth, geometry[3] * screenHeight);
        }
        ImGui::SetNextWindowPos(position, ImGuiCond_Always);
        ImGui::SetNextWindowSize(size, ImGuiCond_Always);
        // Count this as already reported, so an unchanged panel is not re-saved.
        panelReported[0] = position.x / screenWidth;
        panelReported[1] = position.y / screenHeight;
        panelReported[2] = size.x / screenWidth;
        panelReported[3] = size.y / screenHeight;
        panelGeometryApplied = true;
    }
    ImGui::SetNextWindowSizeConstraints(ImVec2(baseWidth * 0.6f, 0.0f),
        ImVec2(baseWidth * 3.0f < screenWidth ? baseWidth * 3.0f : screenWidth, screenHeight), FitHeight);
    ImGui::SetNextWindowFocus();
    ImGui::Begin("Pywel Atlas", nullptr, ImGuiWindowFlags_NoTitleBar | ImGuiWindowFlags_NoCollapse |
        ImGuiWindowFlags_NoSavedSettings | ImGuiWindowFlags_NoScrollbar | ImGuiWindowFlags_NoScrollWithMouse);
    ImVec2 position = ImGui::GetWindowPos();
    ImVec2 size = ImGui::GetWindowSize();
    BuildPanelContents();
    // Measure the contents for next frame's height, and set next frame's zoom.
    panelContentHeight = ImGui::GetCursorPosY() - ImGui::GetStyle().ItemSpacing.y +
        ImGui::GetStyle().WindowPadding.y;
    float zoom = size.x / baseWidth;
    panelZoom = zoom < 0.6f ? 0.6f : (zoom > 3.0f ? 3.0f : zoom);
    // Report a moved or resized panel once the mouse button is released.
    float geometry[4] = {position.x / screenWidth, position.y / screenHeight,
        size.x / screenWidth, size.y / screenHeight};
    bool changed = false;
    for (unsigned index = 0; index < 4; ++index) {
        changed = changed || std::fabs(geometry[index] - panelReported[index]) > 0.0005f;
    }
    if (changed && !ImGui::GetIO().MouseDown[0]) {
        PywelSetPanelGeometry(geometry);
        memcpy(panelReported, geometry, sizeof(panelReported));
    }
    ImGui::End();
}

#ifdef PYWEL_ATLAS_DEV
// v0.68 cursor diagnostics while the panel is CLOSED, to compare with the
// "cursor" lines written while it is open (development builds only, v0.129): does the game's own menu cursor
// already change shape or blink without the panel? Summed per second; a line
// is written only when the picture differs from the last line written, or
// while the cursor image keeps changing (capped per session).
struct ClosedCursorWatch {
    ULONGLONG since; // Start of the current one-second window (0 = not started).
    unsigned frames;
    unsigned shownFrames; // Windows reported its cursor as showing.
    unsigned imageChanges; // The cursor image (handle) changed since last frame.
    HCURSOR lastImage;
    bool logged; // At least one line written.
    int loggedShown; // 0 = hidden, 1 = sometimes shown, 2 = always shown (last line).
    HCURSOR loggedImage;
    bool loggedChanging;
    unsigned lines;
};
ClosedCursorWatch closedCursor = {};
// Present can run on two threads at once; only one samples at a time.
volatile LONG closedCursorBusy = 0;
constexpr unsigned kClosedCursorLineCap = 600;

// Samples the Windows cursor once per presented frame while the panel is
// closed (game window in front only) and writes a "cursor (panel closed)" line.
void WatchClosedCursor() {
    if (InterlockedCompareExchange(&closedCursorBusy, 1, 0) != 0) {
        return;
    }
    ClosedCursorWatch& watch = closedCursor;
    if (GameInFront() && watch.lines < kClosedCursorLineCap) {
        CURSORINFO info = {};
        info.cbSize = sizeof(info);
        bool shown = GetCursorInfo(&info) && (info.flags & CURSOR_SHOWING);
        ULONGLONG now = GetTickCount64();
        if (!watch.since) {
            watch.since = now;
        }
        watch.imageChanges += (watch.frames > 0 && info.hCursor != watch.lastImage) ? 1 : 0;
        watch.frames++;
        watch.shownFrames += shown ? 1 : 0;
        watch.lastImage = info.hCursor;

        if (now - watch.since >= 1000) {
            int shownClass = watch.shownFrames == 0 ? 0 : (watch.shownFrames == watch.frames ? 2 : 1);
            bool changing = watch.imageChanges > 0;
            if (!watch.logged || shownClass != watch.loggedShown || watch.lastImage != watch.loggedImage ||
                changing || watch.loggedChanging) {
                RECT clip = {};
                GetClipCursor(&clip);
                Note("cursor (panel closed) frames=%u shown=%u imageChanges=%u image=0x%llx clip=(%ld,%ld)-(%ld,%ld)",
                    watch.frames, watch.shownFrames, watch.imageChanges,
                    reinterpret_cast<unsigned long long>(watch.lastImage),
                    clip.left, clip.top, clip.right, clip.bottom);
                watch.logged = true;
                watch.loggedShown = shownClass;
                watch.loggedImage = watch.lastImage;
                watch.loggedChanging = changing;
                watch.lines++;
            }
            watch.since = now;
            watch.frames = 0;
            watch.shownFrames = 0;
            watch.imageChanges = 0;
        }
    }
    InterlockedExchange(&closedCursorBusy, 0);
}
#endif

// v0.104: after a drawing failure the route line waits this long before
// trying again (GetTickCount64 time), so a failure is not retried every frame.
volatile LONG64 routeOverlayRetryAt = 0;

// Draws the panel (and, v0.104, the route line) onto the image `swapchain`
// is about to show. Called before the real Present; never throws work at the
// game except through its queue. The route line is drawn even while the
// panel is closed; then no input is taken and no cursor is drawn.
void DrawPanel(void* swapchain) {
    PollHotkeys();
    bool panelOpen = InterlockedCompareExchange(&panelVisible, 0, 0) != 0;
    bool hudDue = false; // v0.110: the completion widget, panel closed.
    if (!panelOpen) {
#ifdef PYWEL_ATLAS_DEV
        WatchClosedCursor();
#endif
        bool routeDue = static_cast<LONG64>(GetTickCount64()) >= InterlockedCompareExchange64(&routeOverlayRetryAt, 0, 0);
        hudDue = HudWanted();
        if (!routeDue || (!PywelRouteOverlayWanted() && !hudDue)) {
            return;
        }
    }
    if (InterlockedCompareExchange(&creatingSwapchain, 0, 0)) {
        return;
    }
    // Only the newest swapchain is drawn on, with the queue it was made with.
    KnownSwapchain entry = {};
    AcquireSRWLockShared(&knownLock);
    if (swapchain == newestSwapchain) {
        for (const KnownSwapchain& candidate : known) {
            if (candidate.swapchain == swapchain) {
                entry = candidate;
            }
        }
    }
    ReleaseSRWLockShared(&knownLock);
    if (!entry.swapchain || !entry.queue) {
        return;
    }

    AcquireSRWLockExclusive(&renderLock);
    if (renderer.swapchain != swapchain) {
        Teardown("another swapchain is now shown");
        if (!CreateRenderer(swapchain, entry)) {
            InterlockedExchange(&panelVisible, 0); // Do not retry every frame.
            InterlockedExchange64(&routeOverlayRetryAt, static_cast<LONG64>(GetTickCount64() + 5000));
            ReleaseSRWLockExclusive(&renderLock);
            return;
        }
        SubclassOnce(entry.window);
    }
    IDXGISwapChain3* swapchain3 = nullptr;
    bool ok = SUCCEEDED(static_cast<IUnknown*>(swapchain)->QueryInterface(__uuidof(IDXGISwapChain3),
        reinterpret_cast<void**>(&swapchain3))) && swapchain3;
    // A size or colour change seen without our Resize hook: start over.
    DXGI_SWAP_CHAIN_DESC1 description = {};
    if (ok && SUCCEEDED(swapchain3->GetDesc1(&description)) &&
        (description.Width != renderer.width || description.Height != renderer.height ||
         description.Format != renderer.format || description.BufferCount != renderer.bufferCount ||
         entry.colorSpace != renderer.colorSpace)) {
        Teardown("size, format or colour space changed");
        ok = CreateRenderer(swapchain, entry);
    }
    if (ok && !renderer.buffersReady) {
        ok = AcquireBuffers(swapchain3);
    }
    if (ok) {
        UINT backBuffer = swapchain3->GetCurrentBackBufferIndex();
        UINT slot = static_cast<UINT>(renderer.frames % renderer.bufferCount);
        // Wait until the GPU is done with this slot's previous use.
        if (renderer.slotFence[slot] && renderer.fence->GetCompletedValue() < renderer.slotFence[slot] &&
            SUCCEEDED(renderer.fence->SetEventOnCompletion(renderer.slotFence[slot], renderer.fenceEvent))) {
            WaitForSingleObject(renderer.fenceEvent, 2000);
        }
        ok = backBuffer < renderer.bufferCount &&
            SUCCEEDED(renderer.allocators[slot]->Reset()) &&
            SUCCEEDED(renderer.list->Reset(renderer.allocators[slot], nullptr));
        if (ok) {
            ImGuiIO& io = ImGui::GetIO();
            LARGE_INTEGER now = {};
            QueryPerformanceCounter(&now);
            float delta = static_cast<float>(now.QuadPart - lastFrameTime.QuadPart) / timerFrequency.QuadPart;
            lastFrameTime = now;
            io.DeltaTime = delta > 0.0001f ? delta : 0.0001f;
            io.DisplaySize = ImVec2(static_cast<float>(renderer.width), static_cast<float>(renderer.height));
            if (panelOpen) {
                FeedInput(io);
            } else {
                io.MouseDrawCursor = false; // v0.104: route line only; no cursor, no input.
            }
            ApplyStyle(); // v0.65: last frame's zoom applies to everything.
            ImGui_ImplDX12_NewFrame();
            ImGui::NewFrame();
            if (panelOpen) {
                BuildHudWindow(); // v0.110: movable while the panel is open.
                BuildPanel();
            }
            // v0.104: the route line, over everything (the panel draws its own
            // window above it only where they overlap).
            PywelRouteDrawOverlay(ImGui::GetForegroundDrawList(), static_cast<float>(renderer.width),
                static_cast<float>(renderer.height), FrameColour);
            if (hudDue) {
                DrawHudClosed(); // v0.110: the completion widget.
            }
            ImGui::Render();

            // Our drawing: image from "being shown" to "drawable", draw, back.
            D3D12_RESOURCE_BARRIER barrier = {};
            barrier.Type = D3D12_RESOURCE_BARRIER_TYPE_TRANSITION;
            barrier.Transition.pResource = renderer.buffers[backBuffer];
            barrier.Transition.Subresource = D3D12_RESOURCE_BARRIER_ALL_SUBRESOURCES;
            barrier.Transition.StateBefore = D3D12_RESOURCE_STATE_PRESENT;
            barrier.Transition.StateAfter = D3D12_RESOURCE_STATE_RENDER_TARGET;
            renderer.list->ResourceBarrier(1, &barrier);
            D3D12_CPU_DESCRIPTOR_HANDLE view = renderer.rtvHeap->GetCPUDescriptorHandleForHeapStart();
            view.ptr += static_cast<SIZE_T>(backBuffer) * renderer.rtvStride;
            renderer.list->OMSetRenderTargets(1, &view, FALSE, nullptr);
            ID3D12DescriptorHeap* heaps[] = {renderer.srvHeap};
            renderer.list->SetDescriptorHeaps(1, heaps);
            ImGui_ImplDX12_RenderDrawData(ImGui::GetDrawData(), renderer.list);
            barrier.Transition.StateBefore = D3D12_RESOURCE_STATE_RENDER_TARGET;
            barrier.Transition.StateAfter = D3D12_RESOURCE_STATE_PRESENT;
            renderer.list->ResourceBarrier(1, &barrier);
            ok = SUCCEEDED(renderer.list->Close());
            if (ok) {
                ID3D12CommandList* lists[] = {renderer.list};
                renderer.queue->ExecuteCommandLists(1, lists);
                renderer.queue->Signal(renderer.fence, ++renderer.fenceValue);
                renderer.slotFence[slot] = renderer.fenceValue;
                ++renderer.frames;
            }
        }
    }
    if (swapchain3) {
        swapchain3->Release();
    }
    if (!ok) {
        Note("panel: drawing failed on swapchain 0x%llx; panel closed, route line paused for 5 s",
            reinterpret_cast<unsigned long long>(swapchain));
        // The player log gets the first few only (this can repeat every 5 s).
        static volatile LONG drawFailuresLogged = 0;
        if (InterlockedIncrement(&drawFailuresLogged) <= 3) {
            PywelReleaseLog("Panel: drawing failed; panel closed, route line paused for 5 s.");
        }
        InterlockedExchange(&panelVisible, 0);
        InterlockedExchange64(&routeOverlayRetryAt, static_cast<LONG64>(GetTickCount64() + 5000));
    }
    ReleaseSRWLockExclusive(&renderLock);
}

// Before a swapchain is resized: drop our references to its images.
void BeforeResize(void* swapchain) {
    AcquireSRWLockExclusive(&renderLock);
    if (renderer.swapchain == swapchain) {
        ReleaseBuffers();
    }
    ReleaseSRWLockExclusive(&renderLock);
}

// Before a new swapchain is created: stop drawing and free everything of the
// current one, so it can be destroyed (only one swapchain may use a window at
// a time). AfterCreate allows drawing again.
void BeforeCreate() {
    InterlockedIncrement(&creatingSwapchain);
    AcquireSRWLockExclusive(&renderLock);
    Teardown("a new swapchain is being created");
    ReleaseSRWLockExclusive(&renderLock);
}

// After a swapchain creation returned (successful or not).
void AfterCreate() {
    InterlockedDecrement(&creatingSwapchain);
}

// ---------------------------------------------------------------------------
// Section: swapchain method hooks
// ---------------------------------------------------------------------------

// Hook for IDXGISwapChain::Present: counts, draws the panel if open, shows.
HRESULT STDMETHODCALLTYPE ObservePresent(IDXGISwapChain* swapchain, UINT sync, UINT flags) {
    DWORD incomingError = GetLastError();
    CountPresent(swapchain, kPresent, sync, flags, reinterpret_cast<uintptr_t>(_ReturnAddress()));
    if (!(flags & DXGI_PRESENT_TEST)) {
        DrawPanel(swapchain);
    }
    SetLastError(incomingError);
    return originalPresent(swapchain, sync, flags);
}

// Hook for IDXGISwapChain1::Present1: counts, draws the panel if open, shows.
HRESULT STDMETHODCALLTYPE ObservePresent1(IDXGISwapChain1* swapchain, UINT sync, UINT flags,
    const DXGI_PRESENT_PARAMETERS* parameters) {
    DWORD incomingError = GetLastError();
    CountPresent(swapchain, kPresent1, sync, flags, reinterpret_cast<uintptr_t>(_ReturnAddress()));
    if (!(flags & DXGI_PRESENT_TEST)) {
        DrawPanel(swapchain);
    }
    SetLastError(incomingError);
    return originalPresent1(swapchain, sync, flags, parameters);
}

// Queues a "resized" event with the arguments and the result.
void QueueResize(void* swapchain, unsigned method, uintptr_t caller, HRESULT result,
    UINT count, UINT width, UINT height, DXGI_FORMAT format, UINT flags) {
    SwapCounters* slot = CountersFor(swapchain);
    if (slot) {
        InterlockedIncrement(&slot->calls[method]);
    }
    Event event = {};
    event.kind = kResized;
    event.tick = GetTickCount64();
    event.thread = GetCurrentThreadId();
    event.caller = caller;
    event.swapchain = swapchain;
    event.method = method;
    event.result = result;
    event.resizeCount = count;
    event.resizeWidth = width;
    event.resizeHeight = height;
    event.resizeFormat = format;
    event.resizeFlags = flags;
    Queue(event);
}

// Hook for IDXGISwapChain::ResizeBuffers: frees our image references first.
HRESULT STDMETHODCALLTYPE ObserveResize(IDXGISwapChain* swapchain, UINT count, UINT width,
    UINT height, DXGI_FORMAT format, UINT flags) {
    DWORD incomingError = GetLastError();
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress());
    BeforeResize(swapchain);
    SetLastError(incomingError);
    HRESULT result = originalResize(swapchain, count, width, height, format, flags);
    DWORD originalError = GetLastError();
    QueueResize(swapchain, kResize, caller, result, count, width, height, format, flags);
    SetLastError(originalError);
    return result;
}

// Hook for IDXGISwapChain3::ResizeBuffers1: frees our image references first.
HRESULT STDMETHODCALLTYPE ObserveResize1(IDXGISwapChain3* swapchain, UINT count, UINT width,
    UINT height, DXGI_FORMAT format, UINT flags, const UINT* nodeMasks,
    IUnknown* const* presentQueues) {
    DWORD incomingError = GetLastError();
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress());
    BeforeResize(swapchain);
    SetLastError(incomingError);
    HRESULT result = originalResize1(swapchain, count, width, height, format, flags,
        nodeMasks, presentQueues);
    DWORD originalError = GetLastError();
    QueueResize(swapchain, kResize1, caller, result, count, width, height, format, flags);
    SetLastError(originalError);
    return result;
}

// Hook for IDXGISwapChain3::SetColorSpace1: remembers the colour space (HDR10
// or normal) of that swapchain so the panel colours can match.
HRESULT STDMETHODCALLTYPE ObserveSetColorSpace(IDXGISwapChain3* swapchain, DXGI_COLOR_SPACE_TYPE space) {
    DWORD incomingError = GetLastError();
    SetLastError(incomingError);
    HRESULT result = originalSetColorSpace(swapchain, space);
    DWORD originalError = GetLastError();
    if (SUCCEEDED(result)) {
        AcquireSRWLockExclusive(&knownLock);
        for (KnownSwapchain& entry : known) {
            if (entry.swapchain == swapchain) {
                entry.colorSpace = space;
            }
        }
        ReleaseSRWLockExclusive(&knownLock);
        Note("SetColorSpace1 swapchain=0x%llx colorSpace=%d",
            reinterpret_cast<unsigned long long>(swapchain), static_cast<int>(space));
    }
    SetLastError(originalError);
    return result;
}

// Our replacement and "original" pointer for each swapchain method, in
// SwapMethod order.
void* const kSwapReplacements[kSwapMethodCount] = {
    reinterpret_cast<void*>(&ObservePresent), reinterpret_cast<void*>(&ObservePresent1),
    reinterpret_cast<void*>(&ObserveResize), reinterpret_cast<void*>(&ObserveResize1),
    reinterpret_cast<void*>(&ObserveSetColorSpace)};
void** const kSwapOriginals[kSwapMethodCount] = {
    reinterpret_cast<void**>(&originalPresent), reinterpret_cast<void**>(&originalPresent1),
    reinterpret_cast<void**>(&originalResize), reinterpret_cast<void**>(&originalResize1),
    reinterpret_cast<void**>(&originalSetColorSpace)};

// Hooks the swapchain methods the first time a swapchain is created. Done
// right in the creation hook (not later by the worker) so SetColorSpace1 and
// the first frames are not missed. Each address must lie inside dxgi.dll.
void HookSwapMethodsOnce(void* swapchain) {
    AcquireSRWLockExclusive(&hookLock);
    uintptr_t addresses[kSwapMethodCount] = {};
    auto* unknown = static_cast<IUnknown*>(swapchain);
    addresses[kPresent] = VtableEntry(swapchain, kSwapPresent);
    addresses[kResize] = VtableEntry(swapchain, kSwapResizeBuffers);
    IDXGISwapChain1* swapchain1 = nullptr;
    if (SUCCEEDED(unknown->QueryInterface(__uuidof(IDXGISwapChain1),
        reinterpret_cast<void**>(&swapchain1))) && swapchain1) {
        addresses[kPresent1] = VtableEntry(swapchain1, kSwapPresent1);
        swapchain1->Release();
    }
    IDXGISwapChain3* swapchain3 = nullptr;
    if (SUCCEEDED(unknown->QueryInterface(__uuidof(IDXGISwapChain3),
        reinterpret_cast<void**>(&swapchain3))) && swapchain3) {
        addresses[kResize1] = VtableEntry(swapchain3, kSwapResizeBuffers1);
        addresses[kSetColorSpace] = VtableEntry(swapchain3, kSwapSetColorSpace1);
        swapchain3->Release();
    }
    for (unsigned method = 0; method < kSwapMethodCount; ++method) {
        uintptr_t address = addresses[method];
        if (!address || hookedSwapMethod[method] || !InDxgi(address)) {
            if (address && hookedSwapMethod[method] && address != hookedSwapMethod[method]) {
                Note("%s of swapchain 0x%llx is at a second address 0x%llx; not hooked",
                    kSwapMethodNames[method], reinterpret_cast<unsigned long long>(swapchain),
                    static_cast<unsigned long long>(address));
            } else if (address && !InDxgi(address)) {
                Note("%s at 0x%llx is outside dxgi.dll; not hooked", kSwapMethodNames[method],
                    static_cast<unsigned long long>(address));
            }
            continue;
        }
        MH_STATUS status = MH_CreateHook(reinterpret_cast<void*>(address), kSwapReplacements[method],
            kSwapOriginals[method]);
        if (status == MH_OK) {
            status = MH_EnableHook(reinterpret_cast<void*>(address));
            if (status != MH_OK) {
                MH_RemoveHook(reinterpret_cast<void*>(address));
            }
        }
        if (status == MH_OK) {
            hookedSwapMethod[method] = address;
        }
        Note("hook IDXGISwapChain::%s at dxgi.dll+0x%llx: %s", kSwapMethodNames[method],
            static_cast<unsigned long long>(address - dxgiStart), MH_StatusToString(status));
    }
    ReleaseSRWLockExclusive(&hookLock);
}

// ---------------------------------------------------------------------------
// Section: swapchain creation hooks
// ---------------------------------------------------------------------------

// Records a newly created swapchain: its queue (for D3D12, pDevice is the
// command queue), window and the log event; it becomes the newest one.
void RecordCreated(Event& event, IUnknown* device, void* swapchain) {
    ID3D12CommandQueue* queueObject = nullptr;
    if (device && SUCCEEDED(device->QueryInterface(__uuidof(ID3D12CommandQueue),
        reinterpret_cast<void**>(&queueObject))) && queueObject) {
        event.queueKnown = true;
        event.queueType = queueObject->GetDesc().Type;
        // The swapchain holds its own reference to the queue; ours is not kept.
        queueObject->Release();
    }
    if (swapchain) {
        HookSwapMethodsOnce(swapchain);
        for (unsigned method = 0; method < kSwapMethodCount; ++method) {
            event.methods[method] = hookedSwapMethod[method];
        }
        AcquireSRWLockExclusive(&knownLock);
        // Windows can reuse a destroyed swapchain's address for a new one, so
        // forget any older entry with the same address first.
        for (KnownSwapchain& older : known) {
            if (older.swapchain == swapchain) {
                older = {};
            }
        }
        KnownSwapchain& entry = known[knownNext % _countof(known)];
        entry.swapchain = swapchain;
        entry.queue = event.queueKnown && event.queueType == D3D12_COMMAND_LIST_TYPE_DIRECT
            ? queueObject : nullptr;
        entry.window = event.window;
        entry.colorSpace = DXGI_COLOR_SPACE_RGB_FULL_G22_NONE_P709; // Normal until told otherwise.
        ++knownNext;
        newestSwapchain = swapchain;
        ReleaseSRWLockExclusive(&knownLock);
    }
    Queue(event);
}

// Hook for IDXGIFactory::CreateSwapChain (older creation path).
HRESULT STDMETHODCALLTYPE ObserveCreateSwapChain(IDXGIFactory* factory, IUnknown* device,
    DXGI_SWAP_CHAIN_DESC* description, IDXGISwapChain** output) {
    DWORD incomingError = GetLastError();
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress());
    BeforeCreate();
    SetLastError(incomingError);
    HRESULT result = originalCreateSwapChain(factory, device, description, output);
    DWORD originalError = GetLastError();
    Event event = {};
    event.kind = kCreated;
    event.tick = GetTickCount64();
    event.thread = GetCurrentThreadId();
    event.caller = caller;
    event.factoryMethod = "CreateSwapChain";
    event.result = result;
    event.device = device;
    DXGI_SWAP_CHAIN_DESC copy = {};
    if (Read(description, &copy, sizeof(copy))) {
        event.window = copy.OutputWindow;
        event.width = copy.BufferDesc.Width;
        event.height = copy.BufferDesc.Height;
        event.format = copy.BufferDesc.Format;
        event.bufferCount = copy.BufferCount;
        event.swapEffect = copy.SwapEffect;
        event.flags = copy.Flags;
    }
    void* swapchain = nullptr;
    if (SUCCEEDED(result) && output) {
        Read(output, &swapchain, sizeof(swapchain));
    }
    event.swapchain = swapchain;
    RecordCreated(event, device, swapchain);
    AfterCreate();
    SetLastError(originalError);
    return result;
}

// Hook for IDXGIFactory2::CreateSwapChainForHwnd (the usual Direct3D 12 path).
HRESULT STDMETHODCALLTYPE ObserveCreateSwapChainForHwnd(IDXGIFactory2* factory, IUnknown* device,
    HWND window, const DXGI_SWAP_CHAIN_DESC1* description,
    const DXGI_SWAP_CHAIN_FULLSCREEN_DESC* fullscreen, IDXGIOutput* output,
    IDXGISwapChain1** swapchainOut) {
    DWORD incomingError = GetLastError();
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress());
    BeforeCreate();
    SetLastError(incomingError);
    HRESULT result = originalCreateSwapChainForHwnd(factory, device, window, description,
        fullscreen, output, swapchainOut);
    DWORD originalError = GetLastError();
    Event event = {};
    event.kind = kCreated;
    event.tick = GetTickCount64();
    event.thread = GetCurrentThreadId();
    event.caller = caller;
    event.factoryMethod = "CreateSwapChainForHwnd";
    event.result = result;
    event.device = device;
    event.window = window;
    DXGI_SWAP_CHAIN_DESC1 copy = {};
    if (Read(description, &copy, sizeof(copy))) {
        event.width = copy.Width;
        event.height = copy.Height;
        event.format = copy.Format;
        event.bufferCount = copy.BufferCount;
        event.swapEffect = copy.SwapEffect;
        event.flags = copy.Flags;
    }
    void* swapchain = nullptr;
    if (SUCCEEDED(result) && swapchainOut) {
        Read(swapchainOut, &swapchain, sizeof(swapchain));
    }
    event.swapchain = swapchain;
    RecordCreated(event, device, swapchain);
    AfterCreate();
    SetLastError(originalError);
    return result;
}

// ---------------------------------------------------------------------------
// Section: worker
// ---------------------------------------------------------------------------

// Append one line to filter-panel.log (worker thread only).
void Log(const char* line) {
    if (logFile == INVALID_HANDLE_VALUE) {
        return;
    }
    DWORD written = 0;
    WriteFile(logFile, line, static_cast<DWORD>(strlen(line)), &written, nullptr);
    WriteFile(logFile, "\r\n", 2, &written, nullptr);
    FlushFileBuffers(logFile);
}

// The file name of the module that contains `address` (e.g. "sl.dlss_g.dll"),
// or "?"; returns the module's start address (0 if none). Asks the Windows
// loader only; reads no game memory.
uintptr_t ModuleName(uintptr_t address, char (&name)[64]) {
    strcpy_s(name, "?");
    HMODULE module = nullptr;
    wchar_t path[MAX_PATH] = {};
    if (!address || !GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_UNCHANGED_REFCOUNT, reinterpret_cast<LPCWSTR>(address), &module) ||
        !GetModuleFileNameW(module, path, _countof(path))) {
        return 0;
    }
    const wchar_t* file = wcsrchr(path, L'\\');
    WideCharToMultiByte(CP_UTF8, 0, file ? file + 1 : path, -1, name, sizeof(name), nullptr, nullptr);
    return reinterpret_cast<uintptr_t>(module);
}

// Hooks one factory method inside dxgi.dll and logs the outcome.
bool HookFactoryMethod(const char* label, uintptr_t address, void* replacement, void** original) {
    char line[200];
    if (!InDxgi(address)) {
        sprintf_s(line, "hook %s at 0x%llx: outside dxgi.dll, not installed", label,
            static_cast<unsigned long long>(address));
        Log(line);
        return false;
    }
    MH_STATUS status = MH_CreateHook(reinterpret_cast<void*>(address), replacement, original);
    if (status == MH_OK) {
        status = MH_EnableHook(reinterpret_cast<void*>(address));
        if (status != MH_OK) {
            MH_RemoveHook(reinterpret_cast<void*>(address));
        }
    }
    sprintf_s(line, "hook %s at dxgi.dll+0x%llx: %s", label,
        static_cast<unsigned long long>(address - dxgiStart), MH_StatusToString(status));
    Log(line);
    return status == MH_OK;
}

// Finds Windows' dxgi.dll, makes one throwaway factory to read the factory
// method addresses, and hooks the two swapchain-creation methods.
bool InstallFactoryHooks() {
    HMODULE dxgi = GetModuleHandleW(L"dxgi.dll");
    if (!dxgi) {
        dxgi = LoadLibraryW(L"dxgi.dll"); // The game imports it, so normally already loaded.
    }
    if (!dxgi) {
        Log("dxgi.dll not found; no panel installed.");
        PywelReleaseLog("Panel: dxgi.dll not found; the panel and route line are off.");
        return false;
    }
    const auto* base = reinterpret_cast<const BYTE*>(dxgi);
    const auto* dos = reinterpret_cast<const IMAGE_DOS_HEADER*>(base);
    const auto* pe = reinterpret_cast<const IMAGE_NT_HEADERS64*>(base + dos->e_lfanew);
    dxgiStart = reinterpret_cast<uintptr_t>(base);
    dxgiEnd = dxgiStart + pe->OptionalHeader.SizeOfImage;

    using CreateFactoryFn = HRESULT (WINAPI*)(REFIID, void**);
    auto createFactory = reinterpret_cast<CreateFactoryFn>(GetProcAddress(dxgi, "CreateDXGIFactory1"));
    IDXGIFactory2* factory = nullptr;
    if (!createFactory ||
        FAILED(createFactory(__uuidof(IDXGIFactory2), reinterpret_cast<void**>(&factory))) || !factory) {
        Log("Could not create a DXGI factory to find its methods; no panel installed.");
        PywelReleaseLog("Panel: could not find the DirectX methods; the panel and route line are off.");
        return false;
    }
    uintptr_t createSwapChain = VtableEntry(factory, kFactoryCreateSwapChain);
    uintptr_t createForHwnd = VtableEntry(factory, kFactoryCreateSwapChainForHwnd);
    factory->Release();

    char line[200];
    sprintf_s(line, "dxgi.dll at 0x%llx size 0x%llx", static_cast<unsigned long long>(dxgiStart),
        static_cast<unsigned long long>(dxgiEnd - dxgiStart));
    Log(line);
    bool any = HookFactoryMethod("IDXGIFactory::CreateSwapChain", createSwapChain,
        reinterpret_cast<void*>(&ObserveCreateSwapChain), reinterpret_cast<void**>(&originalCreateSwapChain));
    any = HookFactoryMethod("IDXGIFactory2::CreateSwapChainForHwnd", createForHwnd,
        reinterpret_cast<void*>(&ObserveCreateSwapChainForHwnd),
        reinterpret_cast<void**>(&originalCreateSwapChainForHwnd)) || any;
    return any;
}

// Writes one queued event as a log line.
void LogEvent(const Event& event) {
    if (event.kind == kNote) {
        char line[260];
        sprintf_s(line, "t=%llu thread=%lu %s", event.tick, event.thread, event.note);
        Log(line);
        return;
    }
    char caller[64];
    uintptr_t callerModule = ModuleName(event.caller, caller);
    char line[700];
    if (event.kind == kCreated) {
        sprintf_s(line, "t=%llu CREATED via %s result=0x%08lx swapchain=0x%llx thread=%lu caller=%s "
            "device=0x%llx d3d12Queue=%u queueType=%d window=0x%llx size=%ux%u format=%d buffers=%u "
            "swapEffect=%d flags=0x%x",
            event.tick, event.factoryMethod, static_cast<unsigned long>(event.result),
            reinterpret_cast<unsigned long long>(event.swapchain), event.thread, caller,
            reinterpret_cast<unsigned long long>(event.device), event.queueKnown ? 1u : 0u,
            event.queueKnown ? static_cast<int>(event.queueType) : -1,
            reinterpret_cast<unsigned long long>(event.window), event.width, event.height,
            static_cast<int>(event.format), event.bufferCount, static_cast<int>(event.swapEffect),
            event.flags);
        Log(line);
    } else if (event.kind == kResized) {
        sprintf_s(line, "t=%llu RESIZED via %s result=0x%08lx swapchain=0x%llx thread=%lu caller=%s "
            "buffers=%u size=%ux%u format=%d flags=0x%x",
            event.tick, kSwapMethodNames[event.method], static_cast<unsigned long>(event.result),
            reinterpret_cast<unsigned long long>(event.swapchain), event.thread, caller,
            event.resizeCount, event.resizeWidth, event.resizeHeight,
            static_cast<int>(event.resizeFormat), event.resizeFlags);
        Log(line);
    } else if (event.kind == kNewCaller) {
        sprintf_s(line, "t=%llu %s new caller %s+0x%llx swapchain=0x%llx thread=%lu", event.tick,
            kSwapMethodNames[event.method], caller,
            static_cast<unsigned long long>(callerModule ? event.caller - callerModule : event.caller),
            reinterpret_cast<unsigned long long>(event.swapchain), event.thread);
        Log(line);
    }
}

// Every 5 s: frames shown per second for each swapchain since the last line.
void LogRates(LONG (&previous)[_countof(counters)][kSwapMethodCount], ULONGLONG elapsed) {
    for (unsigned index = 0; index < _countof(counters); ++index) {
        SwapCounters& slot = counters[index];
        if (!slot.swapchain) {
            continue;
        }
        LONG now[kSwapMethodCount];
        for (unsigned method = 0; method < kSwapMethodCount; ++method) {
            now[method] = slot.calls[method];
        }
        if (now[kPresent] == previous[index][kPresent] && now[kPresent1] == previous[index][kPresent1]) {
            continue;
        }
        double seconds = elapsed / 1000.0;
        char line[300];
        sprintf_s(line, "t=%llu RATE swapchain=0x%llx present/s=%.1f present1/s=%.1f "
            "resizes=%ld/%ld sync=%ld flags=0x%lx threads=%ld,%ld,%ld,%ld panel=%ld",
            GetTickCount64(), reinterpret_cast<unsigned long long>(slot.swapchain),
            (now[kPresent] - previous[index][kPresent]) / seconds,
            (now[kPresent1] - previous[index][kPresent1]) / seconds,
            now[kResize], now[kResize1], slot.lastSync, slot.lastFlags,
            slot.threads[0], slot.threads[1], slot.threads[2], slot.threads[3],
            InterlockedCompareExchange(&panelVisible, 0, 0));
        Log(line);
        for (unsigned method = 0; method < kSwapMethodCount; ++method) {
            previous[index][method] = now[method];
        }
    }
}

// Worker: opens the log, hooks swapchain creation, then every 100 ms writes
// queued events, and frame rates every 5 s.
DWORD WINAPI Run(void* address) {
    // Keep this DLL loaded for the life of the game, because hooks point into it.
    HMODULE pinned = nullptr;
    GetModuleHandleExW(GET_MODULE_HANDLE_EX_FLAG_FROM_ADDRESS |
        GET_MODULE_HANDLE_EX_FLAG_PIN, reinterpret_cast<LPCWSTR>(address), &pinned);
    wchar_t path[MAX_PATH] = {};
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return 0;
    }
    wcscat_s(path, L"\\PywelAtlas");
    CreateDirectoryW(path, nullptr);
#ifdef PYWEL_ATLAS_DEV
    // The detailed panel log; the release build has none (Log() writes nothing).
    wcscat_s(path, L"\\filter-panel.log");
    logFile = CreateFileW(path, GENERIC_WRITE, FILE_SHARE_READ, nullptr,
        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, nullptr);
#endif
#ifdef PYWEL_ATLAS_DEV
    // The version and change list (development builds only, v0.129).
    Log("Pywel Atlas combined 0.28.0 filter panel (v0.133: Route tab: the Look choice removed, at most 10 stops; v0.131: no panel change (route fix only); v0.130: no panel change (route only); v0.129: no panel change (release build without debug tools: cursor diagnostics and this log only in development builds); v0.127: panel log notes cut short instead of stopping the game when too long; v0.126: no panel change (height arrows); v0.125: tabs, slider and list highlights in the panel's bronze and gold; choosing another tab cancels a key wait; v0.124: Route tab: Look Painted / Plain for the world map line; v0.123: panel split into tabs (Filters, Route, Completion, Hotkeys), one table row per tab; v0.122: no panel change (map code split into files); v0.121: no panel change (route line on its own canvases); v0.120: no panel change (map markers share one zoom size curve); v0.119: Keys section, every mod key rebindable, saved in keybinds.ini; v0.118: no panel change (route line fixes only); v0.117: no panel change (map markers load all at once); v0.116: completion widget default place centred above the minimap's date and area lines; v0.115: route Line style covers both maps, Crimson Route look; v0.114: Constellations row; v0.113: completion widget details grow upward when low on screen, default place above a low minimap, kept on screen; v0.111: Route section Line style (game canvas / overlay), road-following route lines; v0.110: completion tracker: Completion section and always-on region widget, Shift+F9 switches its details; v0.108: Unique gear row; v0.107: route stop dots, world-map route hidden while a knowledge card is open; Abyss Cressets row; Route section and route line overlay, drawn while a map is visible even with the panel closed; quest-locked count on the Abyss chest row; Abyss-island Nexus row; Sealed Abyss Artifacts row; Abyss Nexus row; shrine add-on notice; Abyss chests row; panel cursor only while the game hides its own, settled over 250 ms; cursor log line each second while open, and on change while closed; switches marker categories, saved in filters.ini; game-matching look, X button, width-only resize scales everything) - F9 opens/closes, Esc closes; hooks only Windows' dxgi.dll; Dear ImGui " IMGUI_VERSION);
#endif
    // (MinHook was initialized once by PywelAtlas.cpp before this part started.)
    if (!InstallFactoryHooks()) {
        return 0;
    }
    PywelReleaseLog("Panel started.");

    ULONGLONG start = GetTickCount64();
    ULONGLONG lastRates = start;
    bool missedLogged = false;
    LONG loggedDrops = 0;
    LONG loggedFull = 0;
    LONG previous[_countof(counters)][kSwapMethodCount] = {};
    Event batch[_countof(queue)];
    for (;;) {
        unsigned count = 0;
        AcquireSRWLockExclusive(&queueLock);
        count = queueCount;
        memcpy(batch, queue, count * sizeof(Event));
        queueCount = 0;
        ReleaseSRWLockExclusive(&queueLock);
        for (unsigned index = 0; index < count; ++index) {
            LogEvent(batch[index]);
        }
        ULONGLONG now = GetTickCount64();
        if (!missedLogged && !newestSwapchain && now - start > 120000) {
            Log("No swapchain creation seen in the first 2 minutes (it may have happened before this part started); the panel cannot be shown this session.");
            PywelReleaseLog("Panel: the game's screen setup was missed at start; the panel and route line cannot be shown this session.");
            missedLogged = true;
        }
        LONG drops = InterlockedCompareExchange(&droppedEvents, 0, 0);
        LONG full = InterlockedCompareExchange(&countersFull, 0, 0);
        if (drops != loggedDrops || full != loggedFull) {
            char line[128];
            sprintf_s(line, "dropped events so far: %ld; presents without a counter slot: %ld", drops, full);
            Log(line);
            loggedDrops = drops;
            loggedFull = full;
        }
        if (now - lastRates >= 5000) {
            LogRates(previous, now - lastRates);
            lastRates = now;
        }
        Sleep(100);
    }
}

} // namespace

// Combined build: started by src/pywel-atlas/PywelAtlas.cpp after MinHook is
// initialized.
DWORD WINAPI PywelFilterPanelRun(void* address) {
    return Run(address);
}
