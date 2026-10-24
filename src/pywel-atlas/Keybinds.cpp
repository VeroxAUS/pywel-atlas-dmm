// =============================================================================
// Pywel Atlas - rebindable keys (Keybinds.cpp, v0.119-v0.123)
// =============================================================================
//
// WHAT THIS FILE IS
//   Keeps the key for each mod action (see Keybinds.h), answers "is this
//   action's key down?" for the parts that poll keys, and reads and writes
//   %LOCALAPPDATA%\PywelAtlas\keybinds.ini. The file has one readable line
//   per action, for example "OpenPanel = F9" or "SkipStop = None".
//
// SAFETY
//   Reads only the keyboard state (GetAsyncKeyState) and its own file. No
//   game memory or game function is touched. A missing or damaged line falls
//   back to that action's default key, so a bad file never removes the
//   panel key.
// =============================================================================

#define WIN32_LEAN_AND_MEAN
#define NOMINMAX
#include <windows.h>
#include <shlobj.h>
#include <cctype>
#include <cstdio>
#include <cstring>
#include "Keybinds.h"

namespace {

// One action: its file name, its panel label and its default key.
struct ActionInfo {
    const char* fileName;
    const char* label;
    PywelKeyBinding defaultBinding;
};

constexpr ActionInfo kActions[kKeyActionCount] = {
    {"OpenPanel", "Open or close panel", {VK_F9, 0}},
    {"WidgetSize", "Widget compact or expanded", {VK_F9, kKeyShift}},
    {"MarkersOn", "Markers on", {VK_F6, 0}},
    {"MarkersOff", "Markers off", {VK_F10, 0}},
    {"SkipStop", "Skip route stop", {0, 0}},
};

// Names of the keys that can be bound, as written in keybinds.ini and shown
// in the panel. Letters, digits and F1-F24 are handled in code below.
struct KeyName {
    unsigned short virtualKey;
    const char* name;
};

constexpr KeyName kKeyNames[] = {
    {VK_BACK, "Backspace"}, {VK_TAB, "Tab"}, {VK_RETURN, "Enter"}, {VK_PAUSE, "Pause"},
    {VK_CAPITAL, "CapsLock"}, {VK_ESCAPE, "Esc"}, {VK_SPACE, "Space"}, {VK_PRIOR, "PageUp"},
    {VK_NEXT, "PageDown"}, {VK_END, "End"}, {VK_HOME, "Home"}, {VK_LEFT, "Left"},
    {VK_UP, "Up"}, {VK_RIGHT, "Right"}, {VK_DOWN, "Down"}, {VK_SNAPSHOT, "PrintScreen"},
    {VK_INSERT, "Insert"}, {VK_DELETE, "Delete"},
    {VK_NUMPAD0, "Num0"}, {VK_NUMPAD1, "Num1"}, {VK_NUMPAD2, "Num2"}, {VK_NUMPAD3, "Num3"},
    {VK_NUMPAD4, "Num4"}, {VK_NUMPAD5, "Num5"}, {VK_NUMPAD6, "Num6"}, {VK_NUMPAD7, "Num7"},
    {VK_NUMPAD8, "Num8"}, {VK_NUMPAD9, "Num9"}, {VK_MULTIPLY, "Num*"}, {VK_ADD, "Num+"},
    {VK_SUBTRACT, "Num-"}, {VK_DECIMAL, "Num."}, {VK_DIVIDE, "Num/"},
    {VK_NUMLOCK, "NumLock"}, {VK_SCROLL, "ScrollLock"},
    {VK_OEM_1, ";"}, {VK_OEM_PLUS, "="}, {VK_OEM_COMMA, ","}, {VK_OEM_MINUS, "-"},
    {VK_OEM_PERIOD, "."}, {VK_OEM_2, "/"}, {VK_OEM_3, "`"}, {VK_OEM_4, "["},
    {VK_OEM_5, "\\"}, {VK_OEM_6, "]"}, {VK_OEM_7, "'"},
};

// Each binding packed into one number (key in the low 16 bits, modifiers
// above), so threads can swap and read it in one step. DefaultsAtStart
// below fills in the defaults when the mod loads, so the panel key works
// even before keybinds.ini is read.
volatile LONG packed[kKeyActionCount] = {};
volatile LONG dirty = 0;       // A binding changed; the worker saves soon.
volatile LONG panelOpen = 0;   // The filter panel is open.
volatile LONG capturing = 0;   // The panel waits for a new key.

// Packs a binding into one number.
LONG Pack(PywelKeyBinding binding) {
    return static_cast<LONG>(binding.virtualKey) | (static_cast<LONG>(binding.modifiers) << 16);
}

// Unpacks a number made by Pack.
PywelKeyBinding Unpack(LONG value) {
    PywelKeyBinding binding = {};
    binding.virtualKey = static_cast<unsigned short>(value & 0xffff);
    binding.modifiers = static_cast<unsigned char>((value >> 16) & 0xff);
    return binding;
}

// Fills `packed` with every action's default key when the mod loads
// (before any thread starts). v0.123: taken from kActions, so a new action
// needs only its Keybinds.h entry and its kActions row.
struct DefaultsAtStart {
    DefaultsAtStart() {
        for (unsigned action = 0; action < kKeyActionCount; ++action) {
            packed[action] = Pack(kActions[action].defaultBinding);
        }
    }
} defaultsAtStart;

// True while the given key is held.
bool Held(int virtualKey) {
    return (GetAsyncKeyState(virtualKey) & 0x8000) != 0;
}

// The modifier keys held right now, as kKeyShift / kKeyCtrl / kKeyAlt bits.
unsigned char HeldModifiers() {
    unsigned modifiers = 0;
    modifiers |= Held(VK_SHIFT) ? kKeyShift : 0u;
    modifiers |= Held(VK_CONTROL) ? kKeyCtrl : 0u;
    modifiers |= Held(VK_MENU) ? kKeyAlt : 0u;
    return static_cast<unsigned char>(modifiers);
}

// True while the game window is the one in front.
bool GameInFront() {
    DWORD process = 0;
    GetWindowThreadProcessId(GetForegroundWindow(), &process);
    return process == GetCurrentProcessId();
}

// The name of one key ("F9", "A", "PageUp"), or nullptr if it has none.
// `buffer` holds names that are built rather than looked up.
const char* KeyText(unsigned short virtualKey, char (&buffer)[8]) {
    if (virtualKey >= VK_F1 && virtualKey <= VK_F24) {
        sprintf_s(buffer, "F%u", virtualKey - VK_F1 + 1u);
        return buffer;
    }
    if ((virtualKey >= 'A' && virtualKey <= 'Z') || (virtualKey >= '0' && virtualKey <= '9')) {
        buffer[0] = static_cast<char>(virtualKey);
        buffer[1] = 0;
        return buffer;
    }
    for (const KeyName& key : kKeyNames) {
        if (key.virtualKey == virtualKey) {
            return key.name;
        }
    }
    return nullptr;
}

// The key whose name is `text` (any letter case), or 0 if unknown.
unsigned short KeyFromText(const char* text) {
    if ((text[0] == 'F' || text[0] == 'f') && text[1] >= '1' && text[1] <= '9') {
        unsigned number = 0;
        if (sscanf_s(text + 1, "%u", &number) == 1 && number >= 1 && number <= 24) {
            char check[8];
            sprintf_s(check, "%u", number);
            if (_stricmp(text + 1, check) == 0) {
                return static_cast<unsigned short>(VK_F1 + number - 1);
            }
        }
    }
    if (text[0] && !text[1]) {
        char upper = static_cast<char>(toupper(static_cast<unsigned char>(text[0])));
        if ((upper >= 'A' && upper <= 'Z') || (upper >= '0' && upper <= '9')) {
            return static_cast<unsigned short>(upper);
        }
    }
    for (const KeyName& key : kKeyNames) {
        if (_stricmp(key.name, text) == 0) {
            return key.virtualKey;
        }
    }
    return 0;
}

// Reads a binding written as "Shift+Ctrl+F9" or "None". The key comes last,
// so "Num+" and "=" still read correctly. False if it is not understood.
bool ParseBinding(const char* text, PywelKeyBinding& binding) {
    binding = {};
    if (_stricmp(text, "None") == 0) {
        return true;
    }
    const char* rest = text;
    for (;;) {
        if (_strnicmp(rest, "Shift+", 6) == 0 && rest[6]) {
            binding.modifiers = static_cast<unsigned char>(binding.modifiers | kKeyShift);
            rest += 6;
        } else if (_strnicmp(rest, "Ctrl+", 5) == 0 && rest[5]) {
            binding.modifiers = static_cast<unsigned char>(binding.modifiers | kKeyCtrl);
            rest += 5;
        } else if (_strnicmp(rest, "Alt+", 4) == 0 && rest[4]) {
            binding.modifiers = static_cast<unsigned char>(binding.modifiers | kKeyAlt);
            rest += 4;
        } else {
            break;
        }
    }
    binding.virtualKey = KeyFromText(rest);
    return binding.virtualKey != 0;
}

// Full path of %LOCALAPPDATA%\PywelAtlas\keybinds.ini (false if unavailable).
bool KeybindsPath(wchar_t (&path)[MAX_PATH]) {
    if (FAILED(SHGetFolderPathW(nullptr, CSIDL_LOCAL_APPDATA, nullptr, 0, path))) {
        return false;
    }
    return wcscat_s(path, L"\\PywelAtlas\\keybinds.ini") == 0;
}

// Removes spaces, tabs and line ends from both ends of `text`, in place.
char* Trim(char* text) {
    while (*text == ' ' || *text == '\t') {
        ++text;
    }
    size_t length = strlen(text);
    while (length && strchr(" \t\r\n", text[length - 1])) {
        text[--length] = 0;
    }
    return text;
}

} // namespace

// Sets every action to its default, then reads keybinds.ini over it. Lines
// that are not understood are skipped and counted (the caller logs the
// count). The panel key can never end up as "None".
unsigned PywelKeybindsLoad() {
    for (unsigned action = 0; action < kKeyActionCount; ++action) {
        InterlockedExchange(&packed[action], Pack(kActions[action].defaultBinding));
    }
    wchar_t path[MAX_PATH] = {};
    FILE* file = nullptr;
    if (!KeybindsPath(path) || _wfopen_s(&file, path, L"r") != 0 || !file) {
        return 0; // No file yet: the defaults stay.
    }
    unsigned skipped = 0;
    char line[128];
    while (fgets(line, sizeof(line), file)) {
        char* text = Trim(line);
        char* equals = strchr(text, '=');
        if (!text[0] || text[0] == '#' || text[0] == '[') {
            continue;
        }
        if (!equals) {
            ++skipped;
            continue;
        }
        *equals = 0;
        char* name = Trim(text);
        char* value = Trim(equals + 1);
        bool known = false;
        for (unsigned action = 0; action < kKeyActionCount; ++action) {
            PywelKeyBinding binding = {};
            if (_stricmp(name, kActions[action].fileName) != 0) {
                continue;
            }
            known = ParseBinding(value, binding) && !(action == kKeyOpenPanel && !binding.virtualKey);
            if (known) {
                InterlockedExchange(&packed[action], Pack(binding));
            }
        }
        skipped += known ? 0 : 1;
    }
    fclose(file);
    return skipped;
}

// See Keybinds.h. The panel key still works while the panel is open; every
// other action waits until it is closed. Nothing fires while the panel waits
// for a new key.
bool PywelKeybindDown(PywelKeyAction action) {
    if (action >= kKeyActionCount || InterlockedCompareExchange(&capturing, 0, 0)) {
        return false;
    }
    if (action != kKeyOpenPanel && InterlockedCompareExchange(&panelOpen, 0, 0)) {
        return false;
    }
    PywelKeyBinding binding = PywelGetKeybind(action);
    return binding.virtualKey && GameInFront() && Held(binding.virtualKey) &&
        HeldModifiers() == binding.modifiers;
}

// The current binding of an action.
PywelKeyBinding PywelGetKeybind(PywelKeyAction action) {
    if (action >= kKeyActionCount) {
        return {};
    }
    return Unpack(InterlockedCompareExchange(&packed[action], 0, 0));
}

// The default binding of an action.
PywelKeyBinding PywelDefaultKeybind(PywelKeyAction action) {
    return action < kKeyActionCount ? kActions[action].defaultBinding : PywelKeyBinding{};
}

// Changes one binding and asks for a save. The panel key cannot be cleared.
void PywelSetKeybind(PywelKeyAction action, PywelKeyBinding binding) {
    if (action >= kKeyActionCount || (action == kKeyOpenPanel && !binding.virtualKey)) {
        return;
    }
    InterlockedExchange(&packed[action], Pack(binding));
    InterlockedExchange(&dirty, 1);
}

// Puts every action back to its default key and asks for a save.
void PywelResetKeybinds() {
    for (unsigned action = 0; action < kKeyActionCount; ++action) {
        InterlockedExchange(&packed[action], Pack(kActions[action].defaultBinding));
    }
    InterlockedExchange(&dirty, 1);
}

// The action's label for the panel.
const char* PywelKeyActionLabel(PywelKeyAction action) {
    return action < kKeyActionCount ? kActions[action].label : "?";
}

// Writes "Ctrl+Shift+F9"-style text (modifiers always in the order Shift,
// Ctrl, Alt), "None" for no key, or "Key 0x.." for a key without a name.
void PywelFormatKeybind(PywelKeyBinding binding, char* text, size_t size) {
    if (!text || !size) {
        return;
    }
    if (!binding.virtualKey) {
        strcpy_s(text, size, "None");
        return;
    }
    char buffer[8];
    const char* key = KeyText(binding.virtualKey, buffer);
    char unnamed[16];
    if (!key) {
        sprintf_s(unnamed, "Key 0x%02x", binding.virtualKey);
        key = unnamed;
    }
    sprintf_s(text, size, "%s%s%s%s", (binding.modifiers & kKeyShift) ? "Shift+" : "",
        (binding.modifiers & kKeyCtrl) ? "Ctrl+" : "", (binding.modifiers & kKeyAlt) ? "Alt+" : "", key);
}

// The other action with exactly this binding, or kKeyActionCount.
PywelKeyAction PywelKeybindUsedBy(PywelKeyBinding binding, PywelKeyAction except) {
    if (!binding.virtualKey) {
        return kKeyActionCount;
    }
    for (unsigned action = 0; action < kKeyActionCount; ++action) {
        PywelKeyBinding other = PywelGetKeybind(static_cast<PywelKeyAction>(action));
        if (action != except && other.virtualKey == binding.virtualKey && other.modifiers == binding.modifiers) {
            return static_cast<PywelKeyAction>(action);
        }
    }
    return kKeyActionCount;
}

// Keys the game uses for play and menus: letters, digits, Space, Tab,
// Enter, Esc, arrows, Backspace and Caps Lock. A warning only.
bool PywelKeyUsedByGame(unsigned short virtualKey) {
    bool letterOrDigit = (virtualKey >= 'A' && virtualKey <= 'Z') || (virtualKey >= '0' && virtualKey <= '9');
    bool common = virtualKey == VK_SPACE || virtualKey == VK_TAB || virtualKey == VK_RETURN ||
        virtualKey == VK_ESCAPE || virtualKey == VK_BACK || virtualKey == VK_CAPITAL ||
        (virtualKey >= VK_LEFT && virtualKey <= VK_DOWN);
    return letterOrDigit || common;
}

// The panel reports whether it is open.
void PywelKeybindsSetPanelOpen(bool open) {
    InterlockedExchange(&panelOpen, open ? 1 : 0);
}

// The panel reports whether it is waiting for a new key.
void PywelKeybindsSetCapturing(bool on) {
    InterlockedExchange(&capturing, on ? 1 : 0);
}

// True while the panel waits for a new key.
bool PywelKeybindsCapturing() {
    return InterlockedCompareExchange(&capturing, 0, 0) != 0;
}

// Writes keybinds.ini if a binding changed, first to a temporary file that
// then replaces the old one, so a crash mid-write never leaves half a file.
// True when there was nothing to do or the write worked.
bool PywelKeybindsSaveIfDirty() {
    if (!InterlockedExchange(&dirty, 0)) {
        return true;
    }
    wchar_t path[MAX_PATH] = {};
    wchar_t temporary[MAX_PATH + 8] = {};
    FILE* file = nullptr;
    if (!KeybindsPath(path) || swprintf_s(temporary, L"%ls.tmp", path) < 0 ||
        _wfopen_s(&file, temporary, L"w") != 0 || !file) {
        InterlockedExchange(&dirty, 1); // Try again later.
        return false;
    }
    fputs("# Pywel Atlas keys (written by the F9 panel's Keys section).\n"
          "# Format: Action = Shift+Ctrl+Alt+Key, or None. Delete a line to use its default.\n", file);
    for (unsigned action = 0; action < kKeyActionCount; ++action) {
        char text[32];
        PywelFormatKeybind(PywelGetKeybind(static_cast<PywelKeyAction>(action)), text, sizeof(text));
        fprintf(file, "%s = %s\n", kActions[action].fileName, text);
    }
    bool written = !ferror(file);
    if (fclose(file) != 0 || !written ||
        !MoveFileExW(temporary, path, MOVEFILE_REPLACE_EXISTING | MOVEFILE_WRITE_THROUGH)) {
        DeleteFileW(temporary);
        InterlockedExchange(&dirty, 1);
        return false;
    }
    return true;
}
