// NativeSaveReader.h - read the player's save file (read-only) to check Bells.
//
// What this file is for:
// - The game stores progress in an encrypted save file on disk.
// - NativeSaveReader.cpp opens a copy of that file, decrypts, verifies and
//   decompresses it, then looks only at the in-game "Bell" landmarks.
// - It reports how many Bells are recorded/completed, and in particular whether
//   the Hernand Bell is completed. The main mod file (NativeMapCategoryProbe.cpp)
//   uses that answer to remove its test marker once the Bell is done.
// - It also lets the user pick which save slot to read (F9 in game).
//
// Standalone read-only Bell proof. No Python process, companion or save writes.
// (Nothing here ever writes to the game's save files.)
#pragma once
#include <windows.h>

// The result of one successful save read.
struct NativeSaveSummary {
    char profile[64]; // Text label "<steam account id>:slot<N>".
    unsigned coverage; // How many known Bells this build checks for.
    unsigned recorded; // How many of those Bells appear in the save at all.
    unsigned completed; // How many the save explicitly marks as completed.
    bool hernandCompleted; // True only if the save explicitly says Hernand Bell is done.
};

// Explicit selected slot in the sole numeric Steam account directory.
// Selection never implies that this is the slot currently loaded in the game.
// Returns true and fills `summary` on success; on failure returns false and
// writes a short reason into `error`. Also writes diagnostic copies under the
// mod's own folder (`runtimeDirectory`), never into the game's save folder.
bool ReadSelectedBellSave(const wchar_t* runtimeDirectory, unsigned slot, NativeSaveSummary& summary,
    char (&error)[256]);

// Worker-only OS dialog listing existing saves with local modified timestamps.
// Returns false on cancel/error. Persists selection only under mod AppData.
// (A simple Windows Yes/No/Cancel message box that steps through the saves.)
bool ChooseNativeSaveSlot(const wchar_t* runtimeDirectory, unsigned& slot, char (&error)[256]);

// Returns the slot number remembered from a previous choice (101 if none).
unsigned LoadNativeSaveSlot(const wchar_t* runtimeDirectory);
