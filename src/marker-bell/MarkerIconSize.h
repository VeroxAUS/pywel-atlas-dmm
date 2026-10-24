// MarkerIconSize.h - even icon sizes for Pywel Atlas markers (v0.117).
//
// What this part does:
// - Our markers reuse the game's own map icons (Bell, chest, Cresset...).
//   Each icon's size comes from the game's interface style files, and every
//   picture has a different empty margin, so some markers look much bigger
//   than others (Thomas, 2026-10-24).
// - The UI add-on (src/pywel-atlas-ui/build_ui_patch.py, v0.84) adds style
//   rules that resize an icon's picture only when the picture element also
//   carries the class "pywel-marker". This file gives that class to the
//   picture elements of OUR markers, so the game's own icons keep their size.
//   Without the add-on's rules the class does nothing.
// - A "class" is a style name on a UI element (like "pywel-marker"); the game
//   keeps them as numbers. The same game functions the knowledge card uses
//   (MapKnowledgeCard.h: internName turns the name into its number once,
//   addClass adds it to an element's style and restyles it) do the work.
// - Which elements: a map icon keeps its main picture element ("#BaseIcon"
//   in the game's layout) at +0x118, and a second one at +0x260 (the Abyss
//   Nexus' small picture; 0 for most icons), as logged in v0.81-v0.83. Each
//   is only touched if its first 8 bytes are the game's UI element vtable (a
//   "vtable" is the table of functions every object of one kind points to),
//   the same one seen on every icon picture in the v0.83 and v0.103 logs.
// - Runs only on the game's map threads, for markers ServiceMarkersOn has
//   just verified as ours, once per icon object.
//
// This file is included once by NativeMapCategoryProbe.cpp, inside its
// unnamed namespace, after MapKnowledgeCard.h (internName, addClass).
#pragma once

// Switch for the whole feature.
constexpr bool kMarkerSizeOn = true;
// The class the add-on's size rules look for.
constexpr const char* kMarkerSizeClass = "pywel-marker";
// The game's UI element vtable (0x145d6b618 in the v0.83 and v0.103 logs).
constexpr uintptr_t kUiElementVtableRva = 0x5d6b618;
// Where a map icon keeps its picture elements.
constexpr unsigned kIconPictureOffsets[2] = {0x118, 0x260};

// The class number, made on first use (map thread).
int markerSizeNumber = 0;
bool markerSizeNumbered = false;
// The icon object each marker last got the class on, per map (0 = world map,
// 1 = minimap), so each icon is tagged once. Map threads only.
void* sizedIcons[2][kCategoryCount][kMaxCategoryMarkers] = {};
// Counts for the log: icons tagged, and icons with no picture element found.
volatile LONG markerSizeTagged[2] = {};
volatile LONG markerSizeMissed[2] = {};

// True if `element` looks like one of the game's UI elements (vtable check).
bool IsUiElement(uintptr_t element) {
    uintptr_t table = 0;
    return element && Read(reinterpret_cast<const void*>(element), &table, sizeof(table)) &&
        table == imageBase + kUiElementVtableRva;
}

// Gives one picture element our class. Returns false if it is not a UI
// element or has no style object.
bool TagPictureElement(uintptr_t element) {
    void* style = nullptr;
    if (!IsUiElement(element) ||
        !Read(reinterpret_cast<const void*>(element + 0x20), &style, sizeof(style)) || !style) {
        return false;
    }
    addClass(style, &markerSizeNumber);
    return true;
}

// Map thread: gives our verified marker's picture elements the size class,
// once per icon object. `world` picks the map's bookkeeping.
void ApplyMarkerSize(void* icon, unsigned category, unsigned index, bool world) {
    if (!kMarkerSizeOn || !internName || !addClass || !icon) {
        return;
    }
    unsigned map = world ? 0 : 1;
    if (sizedIcons[map][category][index] == icon) {
        return;
    }
    if (!markerSizeNumbered) {
        internName(&markerSizeNumber, kMarkerSizeClass, 1, 0x2ffff);
        markerSizeNumbered = true;
    }
    if (!markerSizeNumber) {
        return;
    }

    // Tag every picture element the icon has (main, and the Nexus' small one).
    unsigned tagged = 0;
    for (unsigned offset : kIconPictureOffsets) {
        uintptr_t element = 0;
        if (Read(static_cast<const BYTE*>(icon) + offset, &element, sizeof(element)) &&
            TagPictureElement(element)) {
            ++tagged;
        }
    }
    // Remember the icon either way, so a marker without a picture element is
    // not looked at again every update.
    sizedIcons[map][category][index] = icon;
    LONG count = InterlockedIncrement(tagged ? &markerSizeTagged[map] : &markerSizeMissed[map]);
    if (count <= 3) {
        char line[200];
        sprintf_s(line, "marker-size %s %s marker=%s pictures tagged=%u class=%s number=%d",
            world ? "world map" : "minimap", tagged ? "tagged" : "no picture element", MarkerName(category, index),
            tagged, kMarkerSizeClass, markerSizeNumber);
        QueueObservation(line);
    }
}

// Map thread: the marker's icon is gone (removed, or the map was rebuilt), so
// a new icon for it is tagged again even if it reuses the same address.
void ForgetMarkerSize(unsigned category, unsigned index, bool world) {
    sizedIcons[world ? 0 : 1][category][index] = nullptr;
}
