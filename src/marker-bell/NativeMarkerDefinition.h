// Local single-marker input. Values are copied between the worker and UI;
// this module owns file/JSON parsing and never accesses game or save memory.
#pragma once
#define WIN32_LEAN_AND_MEAN
#include <windows.h>

struct MarkerDefinition {
    float position[3]; // Game XYZ: X/Z horizontal, Y altitude.
    char name[128];
    bool enabled;
};

// Create a default only when absent, then parse a bounded, write-locked read.
// Invalid input is reported without replacing the user's file or live marker.
bool LoadMarkerDefinition(const wchar_t* path, MarkerDefinition& definition,
    char (&error)[256]);
