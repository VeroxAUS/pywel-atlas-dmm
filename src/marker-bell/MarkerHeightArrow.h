// MarkerHeightArrow.h - up / down arrows on markers above or below the player (v0.126).
//
// What this part does:
// - Thomas (2026-10-24): "if the player is above or below said collectible
//   we can put a small up or down arrow in the bottom left of the marker".
// - Every marker's position (MarkerPosition) is game X, height, Z in metres,
//   and the minimap hook already copies the player's X, height, Z in the same
//   units (MinimapMarkers.cpp, playerPosition.minimap).
// - Each time ServiceMarkersOn checks one of our verified markers, this
//   compares the two heights and gives the marker's picture elements the
//   class "pywel-above" (marker higher than the player) or "pywel-below"
//   (lower), or neither. The UI add-on (build_ui_patch.py with height_arrows.py,
//   v0.88) has rules that swap the picture for a copy with the arrow badge
//   when the class is there. Without the add-on's rules the classes do nothing.
// - An arrow appears once the marker is more than kArrowShowMetres above or
//   below, and goes away only once the difference is under kArrowHideMetres,
//   so walking along a slope near the line does not make it flicker.
// - v0.128: only markers near the player get one: within kArrowNearMetres
//   on the ground (X/Z), cleared again past kArrowFarMetres (Thomas,
//   2026-10-24: "a 50 metre bubble ... so when you open the main map a
//   collectible on the other side of the map" has no badge).
// - v0.132: the world map uses a wider reach (kWorldArrowNearMetres), since
//   a marker within 50 m is hidden under the player arrow there.
// - 0.14.0: the minimap reach is the minimap's own view at full zoom-out
//   (47 m, cleared past 52 m) instead of 50 m.
// - No arrow when the player and the marker are on different layers
//   (surface vs Abyss, above kRegionAbyssHeight): from the surface every
//   Abyss marker is hundreds of metres up, so all of them would show one.
// - Classes are added and removed with the game's own functions
//   (MapKnowledgeCard.h: internName, addClass, removeClass), on the same
//   picture elements MarkerIconSize.h tags, and only when the state changes.
//
// This file is included once by MarkerService.cpp, inside its namespace,
// after MarkerIconSize.h (IsUiElement, kIconPictureOffsets).
#pragma once

// Switch for the whole feature.
constexpr bool kHeightArrowOn = true;
// Show past 10 m, clear under 8 m (Thomas, 2026-10-24: "test with 10m").
constexpr float kArrowShowMetres = 10.0f;
constexpr float kArrowHideMetres = 8.0f;
// v0.128: ground distance (X/Z) for an arrow on the minimap. 0.14.0: set to
// the minimap's own reach at full zoom-out (Thomas, 2026-10-24: no badge on
// markers the minimap can't show). The circle is h = 100 canvas units, and a
// metre is ctrl+0x554 x the scale layer's scale units (RouteSystem.cpp's
// minimap maths), so the reach is 100 / (2.667 x 0.8) = 46.9 m zoomed out
// (layer scale 0.8, the smallest in route.log) and 30 m at the default zoom.
// Shown within 47 m, cleared past 52 m.
constexpr float kArrowNearMetres = 47.0f;
constexpr float kArrowFarMetres = 52.0f;
// v0.132: the world map's own reach. At world-map zoom a marker within 50 m
// sits under the player arrow, which hid its badge (Thomas's v0.130 test).
constexpr float kWorldArrowNearMetres = 300.0f;
constexpr float kWorldArrowFarMetres = 330.0f;
// The player copy must be this fresh (the minimap updates every frame).
constexpr ULONGLONG kArrowPlayerMaxAgeMs = 2000;
// The classes the add-on's rules look for.
constexpr const char* kArrowClasses[2] = {"pywel-above", "pywel-below"};

enum ArrowState : BYTE { kArrowNone = 0, kArrowAbove = 1, kArrowBelow = 2 };

// Class numbers, made on first use (map thread).
int arrowNumbers[2] = {};
bool arrowNumbered = false;
// Per map (0 = world map, 1 = minimap): the icon object each marker's state
// belongs to, and the state its pictures carry. Map threads only.
void* arrowIcons[2][kCategoryCount][kMaxCategoryMarkers] = {};
BYTE arrowStates[2][kCategoryCount][kMaxCategoryMarkers] = {};
// Counts for the log, per map: class changes, and the first few logged.
volatile LONG arrowChanges[2] = {};

// The player's position if the minimap copy is fresh; false otherwise.
bool FreshPlayerPosition(float* xyz, bool& abyss) {
    if (!TryAcquireSRWLockShared(&positionLock)) {
        return false;
    }
    bool fresh = playerPosition.minimapUpdates > 0 &&
        GetTickCount64() - playerPosition.minimapTick <= kArrowPlayerMaxAgeMs;
    memcpy(xyz, playerPosition.minimap, sizeof(float) * 3);
    abyss = playerPosition.abyssLayer != 0;
    ReleaseSRWLockShared(&positionLock);
    return fresh;
}

// The arrow a marker should show now, given the state it shows already.
ArrowState WantedArrow(const float* marker, const float* player, bool playerAbyss, ArrowState current, bool world) {
    bool markerAbyss = marker[1] > kRegionAbyssHeight;
    bool onAbyss = playerAbyss || player[1] > kRegionAbyssHeight;
    if (markerAbyss != onAbyss) {
        return kArrowNone;
    }
    // v0.128: only near the player (squared ground distance, no square root).
    float dx = marker[0] - player[0];
    float dz = marker[2] - player[2];
    float reach = world ? (current == kArrowNone ? kWorldArrowNearMetres : kWorldArrowFarMetres)
                        : (current == kArrowNone ? kArrowNearMetres : kArrowFarMetres);
    if (dx * dx + dz * dz > reach * reach) {
        return kArrowNone;
    }
    float rise = marker[1] - player[1];
    if (rise > kArrowShowMetres || (current == kArrowAbove && rise > kArrowHideMetres)) {
        return kArrowAbove;
    }
    if (rise < -kArrowShowMetres || (current == kArrowBelow && rise < -kArrowHideMetres)) {
        return kArrowBelow;
    }
    return kArrowNone;
}

// Puts `state`'s class on every picture element of `icon` and takes the
// other one off. Returns how many elements were changed.
unsigned SetArrowClass(void* icon, ArrowState state) {
    unsigned changed = 0;
    for (unsigned offset : kIconPictureOffsets) {
        uintptr_t element = 0;
        void* style = nullptr;
        if (!Read(static_cast<const BYTE*>(icon) + offset, &element, sizeof(element)) || !IsUiElement(element) ||
            !Read(reinterpret_cast<const void*>(element + 0x20), &style, sizeof(style)) || !style) {
            continue;
        }
        for (unsigned slot = 0; slot < 2; ++slot) {
            if (state != slot + 1) {
                removeClass(style, &arrowNumbers[slot]);
            }
        }
        if (state != kArrowNone) {
            addClass(style, &arrowNumbers[state - 1]);
        }
        ++changed;
    }
    return changed;
}

// Map thread: brings our verified marker's arrow up to date. `world` picks
// the map's bookkeeping.
void ApplyHeightArrow(void* icon, unsigned category, unsigned index, bool world) {
    if (!kHeightArrowOn || !internName || !addClass || !removeClass || !icon) {
        return;
    }
    if (!arrowNumbered) {
        for (unsigned slot = 0; slot < 2; ++slot) {
            internName(&arrowNumbers[slot], kArrowClasses[slot], 1, 0x2ffff);
        }
        arrowNumbered = true;
    }
    if (!arrowNumbers[0] || !arrowNumbers[1]) {
        return;
    }
    unsigned map = world ? 0 : 1;
    // A new icon object (re-created, or the map was rebuilt) starts clean.
    if (arrowIcons[map][category][index] != icon) {
        arrowIcons[map][category][index] = icon;
        arrowStates[map][category][index] = kArrowNone;
    }
    ArrowState current = static_cast<ArrowState>(arrowStates[map][category][index]);
    float player[3] = {};
    bool playerAbyss = false;
    // No fresh player position: keep what the marker shows.
    if (!FreshPlayerPosition(player, playerAbyss)) {
        return;
    }
    const float* position = MarkerPosition(category, index);
    if (!position) {
        return;
    }
    ArrowState wanted = WantedArrow(position, player, playerAbyss, current, world);
    if (wanted == current) {
        return;
    }
    unsigned changed = SetArrowClass(icon, wanted);
    arrowStates[map][category][index] = static_cast<BYTE>(wanted);
    LONG count = InterlockedIncrement(&arrowChanges[map]);
    if (count <= 5) {
        char line[240];
        sprintf_s(line, "height-arrow %s marker=%s %s -> %s marker height=%.1f player height=%.1f pictures=%u",
            world ? "world map" : "minimap", MarkerName(category, index),
            current == kArrowAbove ? "above" : current == kArrowBelow ? "below" : "none",
            wanted == kArrowAbove ? "above" : wanted == kArrowBelow ? "below" : "none",
            position[1], player[1], changed);
        QueueObservation(line);
    }
}

// Map thread: the marker's icon is gone, so a new icon for it starts clean
// even if it reuses the same address.
void ForgetHeightArrow(unsigned category, unsigned index, bool world) {
    unsigned map = world ? 0 : 1;
    arrowIcons[map][category][index] = nullptr;
    arrowStates[map][category][index] = kArrowNone;
}
