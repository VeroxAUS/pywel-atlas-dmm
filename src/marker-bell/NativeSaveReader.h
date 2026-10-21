// Standalone read-only Bell proof. No Python process, companion or save writes.
#pragma once
#include <windows.h>

struct NativeSaveSummary {
    char profile[64];
    unsigned coverage;
    unsigned recorded;
    unsigned completed;
    bool hernandCompleted;
};

// Explicit selected slot in the sole numeric Steam account directory.
// Selection never implies that this is the slot currently loaded in the game.
bool ReadSelectedBellSave(const wchar_t* runtimeDirectory, unsigned slot, NativeSaveSummary& summary,
    char (&error)[256]);

// Worker-only OS dialog listing existing saves with local modified timestamps.
// Returns false on cancel/error. Persists selection only under mod AppData.
bool ChooseNativeSaveSlot(const wchar_t* runtimeDirectory, unsigned& slot, char (&error)[256]);
unsigned LoadNativeSaveSlot(const wchar_t* runtimeDirectory);
