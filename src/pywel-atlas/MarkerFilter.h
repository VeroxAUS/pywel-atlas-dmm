// =============================================================================
// Pywel Atlas - what the filter panel and the map markers share (MarkerFilter.h, v0.64)
// =============================================================================
//
// The in-game filter panel (FilterPanel.cpp) shows one checkbox per marker
// category (Bells, Greymane Shrines, treasure chests, v0.69 Abyss chests, v0.79 Abyss Nexus,
// v0.88 Sealed Abyss Artifacts, v0.95 Abyss-island Nexus, v0.105 Abyss
// Cressets, v0.108 unique gear, v0.114 Constellations, 0.29.0 Treasure Maps and Legendary
// Animals, Memory Fragments, Sanctum Cores, Kuku Pot items, Eggs). The map-marker part
// (src/marker-bell/NativeMapCategoryProbe.cpp, combined build) owns the
// categories: it applies the user's choices, counts the markers, and saves
// the choices and the panel's size and position to
// %LOCALAPPDATA%\PywelAtlas\filters.ini (written automatically; nobody needs
// to edit it by hand). All functions here are safe to call from any thread.
// =============================================================================
#pragma once

// How many categories the panel lists (same order as the marker part).
constexpr unsigned kPywelMarkerCategories = 16;

// A copy of one category's state, for the panel to display.
struct PywelMarkerCategoryStatus {
    char name[40]; // Shown in the panel, e.g. "Treasure chests".
    bool available; // False = paused in this build (cannot be switched on).
    bool shown; // The user's choice.
    bool saveKnown; // The detected save's result for this category is known.
    unsigned total; // Spots this build knows.
    unsigned done; // Spots the save marks as done (hidden).
    unsigned onMap; // Markers on the map right now.
    unsigned locked; // v0.101: spots hidden until a quest is done (not in done or total).
    bool needsAddon; // v0.78: the world map refuses its icon; the Shrine Icons file mod is missing.
};

// Copies the state of `category` (0 .. kPywelMarkerCategories - 1).
bool PywelGetMarkerCategory(unsigned category, PywelMarkerCategoryStatus& status);
// Switches a category's markers on or off (saved automatically).
void PywelSetMarkerCategoryShown(unsigned category, bool shown);
// False while F10 has turned all markers off (F6 turns them back on).
bool PywelMarkersEnabled();
// v0.106: true while a knowledge card is open on the world map (ours or
// the game's own, e.g. a Nexus). rectOut gets the card's screen rect (left,
// top, right, bottom in backbuffer pixels) when known; this build cannot
// read it and always writes zeros.
bool PywelMapKnowledgeCardState(float rectOut[4]);

// The panel's saved position and size, as fractions of the screen size
// (so they survive a resolution change). False if nothing is saved yet.
bool PywelGetPanelGeometry(float (&geometry)[4]);
// Stores a new position and size (saved automatically).
void PywelSetPanelGeometry(const float (&geometry)[4]);

// v0.110: completion tracker. Collected spots per region, in the game's own
// regions (src/marker-bell/region-map.h): areas such as "Grace Estate", each
// in a group such as "Duchy of Hernand".
constexpr unsigned kPywelMaxRegionGroups = 12;
constexpr unsigned kPywelMaxRegionAreas = 48;
constexpr unsigned kPywelMaxHereCategories = 16;

// One area's count, for the panel to display.
struct PywelRegionArea {
    char name[40]; // e.g. "Grace Estate"; "Other areas" = the group's land outside its named areas.
    unsigned group; // Index into PywelRegionProgress::groups.
    unsigned done; // Spots the save marks as done.
    unsigned total; // Spots in this area (decoys and quest-locked spots not counted).
};

// One category's count in the player's current area (the widget's details).
struct PywelHereCategory {
    char name[32]; // categoryStatus[category].name
    unsigned done, total;
};

// A copy of the whole completion state.
struct PywelRegionProgress {
    unsigned groupCount;
    char groups[kPywelMaxRegionGroups][40]; // e.g. "Duchy of Hernand", "Abyss".
    unsigned areaCount;
    PywelRegionArea areas[kPywelMaxRegionAreas];
    bool saveKnown; // At least one category's save result is known.
    int currentArea; // The area the player is in; -1 if unknown or outside every area.
    unsigned hereCategoryCount; // Categories with at least one counted spot in currentArea.
    PywelHereCategory hereCategories[kPywelMaxHereCategories];
};

// Fills `progress`: every category that is not paused counts, whether its
// markers are shown or not. False until the marker part has started.
bool PywelGetRegionProgress(PywelRegionProgress& progress);

// v0.110: the always-on widget's saved place (screen fractions) and options.
struct PywelHudSettings { bool known; float x, y, width; bool shown, expanded; };
PywelHudSettings PywelGetHudSettings();
void PywelSetHudSettings(const PywelHudSettings& settings);
