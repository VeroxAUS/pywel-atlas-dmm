// =============================================================================
// Pywel Atlas - rebindable keys (Keybinds.h, v0.119-v0.123)
// =============================================================================
//
// WHAT THIS FILE IS
//   The shared list of the mod's hotkeys. Every part that reacts to a key
//   asks this module "is the key for this action down?" instead of checking
//   a fixed key. The player changes the keys in the panel's Keys section,
//   and the choices are saved to %LOCALAPPDATA%\PywelAtlas\keybinds.ini.
//
// KEY IDEAS
//   Action   - one thing the player can do with a key (open the panel, ...).
//   Binding  - one key plus the Shift / Ctrl / Alt keys that must be held
//              with it. The held modifiers must match exactly, so F9 and
//              Shift+F9 never trigger each other.
//   Virtual key - Windows' number for a keyboard key (VK_F9 = 0x78, ...).
//
// THREADS
//   Bindings are stored as single numbers and swapped atomically, so any
//   thread can read them at any time. Only the map-marker worker writes the
//   file (PywelKeybindsSaveIfDirty), never the game's render thread.
// =============================================================================

#pragma once

#include <cstddef>

// The actions that can have a key. The order is also the order of the rows
// in the panel's Hotkeys tab and of the lines in keybinds.ini.
// To add an action: add its name here (before kKeyActionCount) and one row
// (file name, label, default key) to kActions in Keybinds.cpp. The Hotkeys
// tab, the file and the clash check pick it up by themselves; the part that
// reacts to it calls PywelKeybindDown with the new name.
enum PywelKeyAction : unsigned {
    kKeyOpenPanel = 0, // Open or close the filter panel (default F9).
    kKeyWidgetSize,    // Completion widget compact / expanded (Shift+F9).
    kKeyMarkersOn,     // Turn all markers back on (F6).
    kKeyMarkersOff,    // Turn all markers off (F10).
    kKeySkipStop,      // Skip the current route stop (no key by default).
    kKeyActionCount
};

// Modifier bits of a binding.
constexpr unsigned char kKeyShift = 1;
constexpr unsigned char kKeyCtrl = 2;
constexpr unsigned char kKeyAlt = 4;

// One binding. virtualKey 0 means "no key".
struct PywelKeyBinding {
    unsigned short virtualKey;
    unsigned char modifiers;
};

// Reads keybinds.ini once at start-up (missing lines keep their defaults).
unsigned PywelKeybindsLoad(); // Returns how many lines were not understood.

// True while the action's key and exactly its modifiers are held and the
// game window is in front. While the panel is open, only the panel key
// counts, so typing in the panel never fires other actions.
bool PywelKeybindDown(PywelKeyAction action);

// The current binding of an action, and its default.
PywelKeyBinding PywelGetKeybind(PywelKeyAction action);
PywelKeyBinding PywelDefaultKeybind(PywelKeyAction action);

// Changes a binding (any thread); the file is saved soon after.
void PywelSetKeybind(PywelKeyAction action, PywelKeyBinding binding);

// Puts every action back to its default key.
void PywelResetKeybinds();

// The action's name as shown in the panel ("Open or close panel").
const char* PywelKeyActionLabel(PywelKeyAction action);

// Writes a binding as text, for example "Shift+F9" or "None".
void PywelFormatKeybind(PywelKeyBinding binding, char* text, size_t size);

// The other action that already uses `binding`, or kKeyActionCount if none.
PywelKeyAction PywelKeybindUsedBy(PywelKeyBinding binding, PywelKeyAction except);

// True for keys the game itself relies on (letters, numbers, Space, Tab,
// ...): the panel warns about them but still allows them.
bool PywelKeyUsedByGame(unsigned short virtualKey);

// The panel tells this module whether it is open (see PywelKeybindDown) and
// whether it is waiting for the player to press a new key. While it waits,
// no action fires at all.
void PywelKeybindsSetPanelOpen(bool open);
void PywelKeybindsSetCapturing(bool capturing);
bool PywelKeybindsCapturing();

// Saves keybinds.ini if a binding changed (map-marker worker only). False if
// the write failed; it is then tried again later.
bool PywelKeybindsSaveIfDirty();
