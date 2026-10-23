// =============================================================================
// Pywel Atlas - what the filter panel and the map markers share (MarkerFilter.h, v0.64)
// =============================================================================
//
// The in-game filter panel (FilterPanel.cpp) shows one checkbox per marker
// category (Bells, Greymane Shrines, treasure chests, v0.69 Abyss chests, v0.79 Abyss Nexus). The map-marker part
// (src/marker-bell/NativeMapCategoryProbe.cpp, combined build) owns the
// categories: it applies the user's choices, counts the markers, and saves
// the choices and the panel's size and position to
// %LOCALAPPDATA%\PywelAtlas\filters.ini (written automatically; nobody needs
// to edit it by hand). All functions here are safe to call from any thread.
// =============================================================================
#pragma once

// How many categories the panel lists (same order as the marker part).
constexpr unsigned kPywelMarkerCategories = 5;

// A copy of one category's state, for the panel to display.
struct PywelMarkerCategoryStatus {
    char name[40]; // Shown in the panel, e.g. "Treasure chests".
    bool available; // False = paused in this build (cannot be switched on).
    bool shown; // The user's choice.
    bool saveKnown; // The detected save's result for this category is known.
    unsigned total; // Spots this build knows.
    unsigned done; // Spots the save marks as done (hidden).
    unsigned onMap; // Markers on the map right now.
    bool needsAddon; // v0.78: the world map refuses its icon; the Shrine Icons file mod is missing.
};

// Copies the state of `category` (0 .. kPywelMarkerCategories - 1).
bool PywelGetMarkerCategory(unsigned category, PywelMarkerCategoryStatus& status);
// Switches a category's markers on or off (saved automatically).
void PywelSetMarkerCategoryShown(unsigned category, bool shown);
// False while F10 has turned all markers off (F6 turns them back on).
bool PywelMarkersEnabled();

// The panel's saved position and size, as fractions of the screen size
// (so they survive a resolution change). False if nothing is saved yet.
bool PywelGetPanelGeometry(float (&geometry)[4]);
// Stores a new position and size (saved automatically).
void PywelSetPanelGeometry(const float (&geometry)[4]);
