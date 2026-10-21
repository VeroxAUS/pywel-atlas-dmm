// NativeMarkerDefinition.h - the shape of the one test marker and how to load it.
//
// What this file is for:
// - The mod draws one test marker (the "proof chest") on the game's map.
// - Where that marker goes and what it is called come from a small local JSON
//   file that the user can edit (native-map-marker.json in the mod's AppData).
// - This header declares the MarkerDefinition struct that holds those values
//   and the LoadMarkerDefinition() function that fills it from the file.
// - NativeMarkerDefinition.cpp does the actual file reading and JSON parsing.
// - NativeMapCategoryProbe.cpp (the main mod file) calls it when F6 is pressed.
//
// Local single-marker input. Values are copied between the worker and UI;
// this module owns file/JSON parsing and never accesses game or save memory.
// ("Worker" = the mod's own background thread. "UI" = the game's map thread.
// Only plain copies of these values cross between them, never shared pointers.)
#pragma once
#define WIN32_LEAN_AND_MEAN
#include <windows.h>

// One validated marker: where it sits in the game world, its display name,
// and whether the user has switched it on.
struct MarkerDefinition {
    float position[3]; // Game XYZ: X/Z horizontal, Y altitude.
    char name[128]; // UTF-8 text, at most 127 bytes plus a terminating zero.
    bool enabled; // false means "do not show; remove it if already shown".
};

// Create a default only when absent, then parse a bounded, write-locked read.
// Invalid input is reported without replacing the user's file or live marker.
// Returns true and fills `definition` on success; on failure returns false and
// writes a short human-readable reason into `error`.
bool LoadMarkerDefinition(const wchar_t* path, MarkerDefinition& definition,
    char (&error)[256]);
