// LoadedSave.h - what the save-detection part tells the map-marker part.
//
// What this file is for:
// - In the combined Pywel Atlas mod, the save-detection part works out which
//   save is loaded, follows the slot the game last saved it to, and reads that
//   slot's Bells (src/save-detection/NativeSaveLoadProbe.cpp).
// - The map-marker part (src/marker-bell/NativeMapCategoryProbe.cpp) uses that
//   result to decide whether its marker may show, instead of a slot the user
//   picks by hand.
// - Only this plain copy crosses between the two parts' threads. It holds no
//   game pointers.
#pragma once
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include "../marker-bell/NativeSaveReader.h"

// The latest Bell result that save detection accepted for the loaded save.
struct LoadedSaveBell {
    // True only when a selection is active AND a Bell read for its current
    // read slot was accepted. False means "not known": never treat it as
    // "not completed".
    bool valid;
    unsigned serial; // Selection serial (changes on every re-formation).
    LONG loadScope; // Which load produced the selection; changes only on a new load.
    unsigned loadedSlot; // The slot that was loaded.
    unsigned readSlot; // The slot this result was read from (latest linked save).
    NativeSaveSummary bell; // Counts and per-Bell masks from that read.
};

// Copies the latest published result into `out` and returns out.valid.
// Safe to call from any thread at any time.
bool PywelGetLoadedSaveBell(LoadedSaveBell& out);
