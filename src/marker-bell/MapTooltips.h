// MapTooltips.h - map tooltips for Pywel Atlas markers, phase 1.
//
// What this part does:
// - When the map cursor rests on an icon, the game asks the function 0x3edd6b0
//   for the "tooltip" text of that icon's UI element (a UI element is the
//   on-screen object the map draws for an icon; the icon keeps a pointer to it
//   at +8). If the text is not empty, the game shows its own small map label
//   beside the cursor. Plan: docs/tooltip-implementation-plan.md; static
//   check: research/analysis/map-tooltip-ghidra-review.md.
// - Phase 0 (v0.84) only observed: every show/hide call ran on the map
//   thread, and our markers reached the show path (chests and shrines with
//   the game's own text, Bells and Abyss Nexuses with empty text).
// - Phase 1 (v0.85): for our own markers the hook returns our text instead
//   (chest contents, Bell and shrine names), so the game's own label shows
//   it. Every other element gets the game's answer unchanged. v0.86: the
//   label ignores "\n"; Bells and Nexuses by name only. v0.87: chest
//   contents on a second line through "<br>" (the label reads markup).
// - It also logs each change of the map's focused icon (the icon under the
//   cursor), so we can still see which markers get focus.
// - Everything here only reads game memory (through Read, which cannot crash
//   on a bad address) and never calls a game function except the original.
//
// This file is included once by NativeMapCategoryProbe.cpp, inside its
// unnamed namespace, so it uses that file's Read, Log, QueueObservation,
// imageBase, kCategories, kChestLinks, IsCategoryMarker and MarkerName.
#pragma once

// Generated: the English name of the main item in each chest of kChestLinks.
#include "tooltip-texts.h"
static_assert(_countof(kChestContents) == _countof(kChestLinks),
    "tooltip-texts.h must have one entry per chest; rerun prepare_tooltip_texts.py");

// Master switch for our texts: false = phase 0 behavior (observe only).
constexpr bool kTooltipTextsOn = true;
// Our tooltip texts by category and marker, built once before the hook is
// enabled and never changed afterwards, so any thread may read them.
constexpr size_t kTooltipTextSize = 160;
char tooltipTexts[kCategoryCount][kMaxCategoryMarkers][kTooltipTextSize] = {};
// 0.29.0: a Legendary Animal's text while it is tracked (its last line says
// a click stops tracking). Built with the others, never changed afterwards.
char trackedAnimalTexts[_countof(kLegendaryAnimalLinks)][kTooltipTextSize] = {};

// The game's "tooltip text of a UI element" function. It returns the
// element's tooltip attribute (a NUL-terminated byte string) or null.
using GetTooltipText = const char* (*)(void* element);
GetTooltipText originalGetTooltipText = nullptr;
constexpr uintptr_t kTooltipTextRva = 0x3edd6b0;
// Its first 24 bytes in the supported build (docs/tooltip-implementation-plan.md
// 2.3; confirmed against the executable in the Ghidra review).
constexpr BYTE kTooltipTextGuard[24] = {
    0x40, 0x53, 0x48, 0x83, 0xec, 0x20, 0x48, 0x8b,
    0x99, 0xa0, 0x00, 0x00, 0x00, 0x48, 0x85, 0xdb,
    0x74, 0x07, 0x48, 0x83, 0x7b, 0x08, 0x00, 0x75,
};

// Who called it, told apart by the return address (the instruction right
// after the call, as an RVA). "Show" callers display the label, "hide"
// callers only ask whether a label must be hidden, "setup" is the icon's
// element setup (0xdb5510, which reads the text once). Anything else is
// generic UI code.
enum TooltipCaller { kTooltipShow, kTooltipHide, kTooltipSetup, kTooltipOther, kTooltipCallerCount };
const char* const kTooltipCallerNames[kTooltipCallerCount] = {"show", "hide", "setup", "other"};
constexpr uintptr_t kTooltipShowReturns[] = {0xdaecda, 0xdaecec};
constexpr uintptr_t kTooltipHideReturns[] = {0xdae670, 0xdaaeac, 0xda85cd, 0xdb90ee};
constexpr uintptr_t kTooltipSetupReturn = 0xdb5585;

// Our world-map markers' UI elements and icons, by category and index.
// Written only on the map thread (ServiceMarkersOn); the hook may run on
// another thread, so it only compares pointer values (a pointer-sized write
// is never seen half done on x64) and reads through Read.
void* volatile tooltipElements[kCategoryCount][kMaxCategoryMarkers] = {};
void* volatile tooltipIcons[kCategoryCount][kMaxCategoryMarkers] = {};
// The world-map controller and the map thread, as last seen by the map update.
void* volatile tooltipController = nullptr;
volatile LONG tooltipMapThread = 0;
// Counters for the F8 summary: all calls, calls about our elements, and
// calls about our elements that came from another thread.
volatile LONG tooltipCalls[kTooltipCallerCount] = {};
volatile LONG tooltipOurCalls[kTooltipCallerCount] = {};
volatile LONG tooltipOffThread[kTooltipCallerCount] = {};
volatile LONG tooltipFocusChanges = 0;
volatile LONG tooltipOurFocus = 0;
// Detailed log lines left for this session (show/hide calls and focus
// changes); after that, only the F8 counts.
volatile LONG tooltipLinesLeft = 400;

// Sorts a return address into one of the caller groups above.
TooltipCaller TooltipCallerGroup(uintptr_t caller) {
    for (uintptr_t address : kTooltipShowReturns) {
        if (caller == address) {
            return kTooltipShow;
        }
    }
    for (uintptr_t address : kTooltipHideReturns) {
        if (caller == address) {
            return kTooltipHide;
        }
    }
    return caller == kTooltipSetupReturn ? kTooltipSetup : kTooltipOther;
}

// Map thread: remembers the UI element of our verified world-map marker.
// Called for every present, wanted marker, so a re-created element is
// picked up on the next pass.
void NoteMarkerElement(unsigned category, unsigned index, void* icon) {
    void* element = nullptr;
    if (!Read(static_cast<const BYTE*>(icon) + 8, &element, sizeof(element))) {
        element = nullptr;
    }
    tooltipElements[category][index] = element;
    tooltipIcons[category][index] = element ? icon : nullptr;
}

// Map thread: forgets a marker that is gone (removed, or the map was rebuilt).
void ForgetMarkerElement(unsigned category, unsigned index) {
    tooltipElements[category][index] = nullptr;
    tooltipIcons[category][index] = nullptr;
}

// Finds which of our markers owns `element`. A plain scan over at most
// 6 x 256 pointers, cheap next to the game's own UI work.
bool FindMarkerElement(const void* element, unsigned& category, unsigned& index) {
    if (!element) {
        return false;
    }
    for (category = 0; category < kCategoryCount; ++category) {
        for (index = 0; index < kCategories[category].count; ++index) {
            if (tooltipElements[category][index] == element) {
                return true;
            }
        }
    }
    return false;
}

// The same search by icon (the map's focused icon is an icon, not an element).
bool FindMarkerIcon(const void* icon, unsigned& category, unsigned& index) {
    if (!icon) {
        return false;
    }
    for (category = 0; category < kCategoryCount; ++category) {
        for (index = 0; index < kCategories[category].count; ++index) {
            if (tooltipIcons[category][index] == icon) {
                return true;
            }
        }
    }
    return false;
}

// Current map zoom (controller +0xaa0), or -1 if unreadable.
float TooltipMapZoom() {
    float zoom = -1.0f;
    void* controller = tooltipController;
    if (!controller || !Read(static_cast<const BYTE*>(controller) + 0xaa0, &zoom, sizeof(zoom))) {
        return -1.0f;
    }
    return zoom;
}

// Describes a returned tooltip text for the log: "null", "empty" or its
// first characters in quotes. Read copies it, so a bad pointer cannot crash.
void DescribeTooltipText(const char* text, char (&out)[64]) {
    if (!text) {
        strcpy_s(out, "null");
        return;
    }
    char copy[40] = {};
    if (!Read(text, copy, sizeof(copy) - 1)) {
        // The text may end close to the end of readable memory: try short.
        if (!Read(text, copy, 8)) {
            strcpy_s(out, "unreadable");
            return;
        }
    }
    copy[sizeof(copy) - 1] = 0;
    if (!copy[0]) {
        strcpy_s(out, "empty");
        return;
    }
    sprintf_s(out, "\"%s\"", copy);
}

// What goes between "Treasure Chest" and the chest's contents. The game's
// map label (.cpp-worldmap-tooltip, "white-space: normal") turned "\n" into
// a space in v0.85, but it reads its text as markup: "<br>" gave a second
// line in the v0.86 test build (user-confirmed), so every build uses it.
constexpr const char* kTooltipLineBreak = "<br>";

// 0.29.0: the Treasure Map piece (1-12) whose solution is chest `index` of
// kChestLinks, or 0 if none.
unsigned TreasureMapPieceForChest(unsigned index) {
    for (const auto& link : kTreasureMapLinks) {
        if (link.solutionChest == index) {
            return link.piece;
        }
    }
    return 0;
}

// Worker, before the hook is enabled: writes every marker's tooltip text.
// A chest's contents go on a second line, after kTooltipLineBreak.
// Longest texts (contents at most 100 bytes, tooltip-texts.h): a solution
// chest's 154 bytes, a Treasure Map piece's 142; both fit kTooltipTextSize.
void BuildTooltipTexts() {
    for (unsigned category = 0; category < kCategoryCount; ++category) {
        for (unsigned index = 0; index < kCategories[category].count; ++index) {
            char* text = tooltipTexts[category][index];
            if (category == kChestCategory) {
                const char* contents = kChestContents[index];
                if (contents) {
                    sprintf_s(text, kTooltipTextSize, "Treasure Chest%s%s", kTooltipLineBreak, contents);
                } else {
                    strcpy_s(text, kTooltipTextSize, "Treasure Chest");
                }
                // 0.29.0: the chest a Treasure Map piece leads to says so.
                if (unsigned piece = TreasureMapPieceForChest(index)) {
                    size_t used = strlen(text);
                    sprintf_s(text + used, kTooltipTextSize - used, "%sTreasure map solution (piece %u)",
                        kTooltipLineBreak, piece);
                }
            } else if (category == kTreasureMapCategory) {
                // 0.29.0: the piece's name, then what its solution chest holds.
                const char* contents = kChestContents[kTreasureMapLinks[index].solutionChest];
                sprintf_s(text, kTooltipTextSize, "%s%sLeads to: %s", MarkerName(category, index), kTooltipLineBreak,
                    contents ? contents : "a treasure chest");
            } else if (category == kLegendaryAnimalCategory) {
                // 0.29.0: the animal's name, how far it roams and what a
                // click does (Black Lion has no patrol path: it comes with
                // the House Celeste quest).
                const LegendaryAnimalLink& animal = kLegendaryAnimalLinks[index];
                if (animal.lineCount == 0) {
                    sprintf_s(text, kTooltipTextSize, "%s%sLegendary Animal, met during a quest", animal.name,
                        kTooltipLineBreak);
                } else {
                    sprintf_s(text, kTooltipTextSize, "%s%sLegendary Animal, roams about %u m%sClick to track it",
                        animal.name, kTooltipLineBreak, animal.roam, kTooltipLineBreak);
                    sprintf_s(trackedAnimalTexts[index], kTooltipTextSize,
                        "%s%sLegendary Animal, roams about %u m%sTracked: click to stop", animal.name,
                        kTooltipLineBreak, animal.roam, kTooltipLineBreak);
                }
            } else if (category == kMemoryFragmentCategory) {
                // 0.29.0: the fragment's name, then what kind of marker it is.
                sprintf_s(text, kTooltipTextSize, "%s%sMemory Fragment", MarkerName(category, index),
                    kTooltipLineBreak);
            } else if (category == kSanctumCoreCategory) {
                // The core's name, then what it is and where it comes from.
                sprintf_s(text, kTooltipTextSize, "%s%sSanctum Core, from the secret puzzle after cleansing the Sanctum",
                    MarkerName(category, index), kTooltipLineBreak);
            } else if (category == kKukuPotItemCategory) {
                // The item's name, then its kind.
                sprintf_s(text, kTooltipTextSize, "%s%sKuku Pot item", MarkerName(category, index),
                    kTooltipLineBreak);
            } else if (category == kEggCategory) {
                // The egg's kind; it can be carried to a nest to hatch.
                sprintf_s(text, kTooltipTextSize, "%s%sMount egg", MarkerName(category, index), kTooltipLineBreak);
            } else if (category == kAbyssChestCategory) {
                // v0.102: the Abyss chest's item on a second line, like the surface chests.
                const char* contents = kAbyssChestContents[index];
                if (contents) {
                    sprintf_s(text, kTooltipTextSize, "Treasure Chest%s%s", kTooltipLineBreak, contents);
                } else {
                    strcpy_s(text, kTooltipTextSize, "Treasure Chest");
                }
            } else if (category == kNexusCategory || category == kIslandNexusCategory) {
                // v0.95: island Nexuses use the same label as surface ones.
                strcpy_s(text, kTooltipTextSize, "Abyss Nexus");
            } else if (category == kCressetCategory) {
                // v0.105: just the kind; the cresset's name is left out (user, v0.105 run).
                strcpy_s(text, kTooltipTextSize, "Abyss Cresset");
            } else if (category == kUniqueGearCategory) {
                // v0.112: just the item's name (user: no source line).
                strcpy_s(text, kTooltipTextSize, MarkerName(category, index));
            } else if (category == kArtifactCategory) {
                // v0.88: the kind, then the artifact's name on a second line
                // ("Shield of Unchanging Will I"), like a chest's contents.
                sprintf_s(text, kTooltipTextSize, "Sealed Abyss Artifact%s%s", kTooltipLineBreak,
                    MarkerName(category, index));
            } else {
                // Bells, shrines and (v0.114) constellations: just the name
                // ("Demeniss Bell", "Shield Constellation"; user, v0.85 run).
                strcpy_s(text, kTooltipTextSize, MarkerName(category, index));
            }
        }
    }
}

// Decides whether the hook answers with our text for marker (category,
// index). Show calls re-check that the element still belongs to our verified
// marker, because the game may have reused it since the map thread noted it.
// Hide calls skip the check: a wrong answer there only hides a label.
bool UseOurTooltipText(void* element, TooltipCaller group, unsigned category, unsigned index) {
    if constexpr (!kTooltipTextsOn) {
        return false;
    }
    if (group == kTooltipHide) {
        return true;
    }
    if (group != kTooltipShow) {
        return false;
    }
    void* icon = tooltipIcons[category][index];
    void* iconElement = nullptr;
    return icon && IsCategoryMarker(icon, category, index) &&
        Read(static_cast<const BYTE*>(icon) + 8, &iconElement, sizeof(iconElement)) && iconElement == element;
}

// Hook on 0x3edd6b0. For our markers' show/hide calls it returns our text
// (see UseOurTooltipText); for everything else, the game's own answer. It
// records each call for the log. GetLastError is kept as the game left it,
// because Read uses ReadProcessMemory, which can change it.
const char* ProvideTooltipText(void* element) {
    const char* text = originalGetTooltipText(element);
    DWORD lastError = GetLastError();
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    TooltipCaller group = TooltipCallerGroup(caller);
    InterlockedIncrement(&tooltipCalls[group]);

    unsigned category = 0;
    unsigned index = 0;
    bool ours = FindMarkerElement(element, category, index);
    bool mapThread = GetCurrentThreadId() == static_cast<DWORD>(tooltipMapThread);
    // The game's own text, kept for the log line.
    const char* gameText = text;
    bool returnedOurs = false;
    if (ours) {
        InterlockedIncrement(&tooltipOurCalls[group]);
        if (!mapThread) {
            InterlockedIncrement(&tooltipOffThread[group]);
        }
        if (UseOurTooltipText(element, group, category, index)) {
            text = tooltipTexts[category][index];
            // 0.29.0: the tracked Legendary Animal says a click stops it.
            if (category == kLegendaryAnimalCategory && trackedAnimalTexts[index][0] &&
                static_cast<LONG>(index) == InterlockedCompareExchange(&trackedAnimal, 0, 0)) {
                text = trackedAnimalTexts[index];
            }
            returnedOurs = true;
        }
    }

    // Log every show/hide call (ours and the game's, for comparison) and any
    // other call about our elements, until the line budget is used up.
    bool worthLogging = ours || group == kTooltipShow || group == kTooltipHide;
    if (worthLogging && InterlockedDecrement(&tooltipLinesLeft) >= 0) {
        char result[64];
        DescribeTooltipText(gameText, result);
        char line[400];
        if (ours) {
            // Icon +0x258: must be 0 for the focus picker to accept the icon.
            uint64_t blocker = 0;
            bool blockerRead = Read(static_cast<const BYTE*>(tooltipIcons[category][index]) + 0x258,
                &blocker, sizeof(blocker));
            sprintf_s(line, "tooltip %s caller=0x%llx mapThread=%u ours=%s marker=%s zoom=%.3f "
                "icon258=%s0x%llx result=%s returned=%s",
                kTooltipCallerNames[group], static_cast<unsigned long long>(caller), mapThread ? 1u : 0u,
                kCategories[category].label, MarkerName(category, index), TooltipMapZoom(),
                blockerRead ? "" : "?", static_cast<unsigned long long>(blocker), result,
                returnedOurs ? "ours" : "game");
        } else {
            sprintf_s(line, "tooltip %s caller=0x%llx mapThread=%u ours=no zoom=%.3f result=%s",
                kTooltipCallerNames[group], static_cast<unsigned long long>(caller), mapThread ? 1u : 0u,
                TooltipMapZoom(), result);
        }
        QueueObservation(line);
    }
    SetLastError(lastError);
    return text;
}

// Map thread, after each world-map update: remembers the controller and the
// thread, and logs each change of the focused icon. The controller keeps the
// focused icon at +0x5c0 (Ghidra review, section 3). The picker entry at
// +0x5c8 is no longer read: v0.84 found it unreadable for every icon.
void ObserveTooltipFocus(void* controller) {
    static void* lastFocused = nullptr; // Map thread only.
    tooltipController = controller;
    InterlockedExchange(&tooltipMapThread, static_cast<LONG>(GetCurrentThreadId()));

    auto* bytes = static_cast<const BYTE*>(controller);
    void* focused = nullptr;
    if (!Read(bytes + 0x5c0, &focused, sizeof(focused)) || focused == lastFocused) {
        return;
    }
    lastFocused = focused;
    InterlockedIncrement(&tooltipFocusChanges);
    if (!focused) {
        return;
    }
    unsigned category = 0;
    unsigned index = 0;
    bool ours = FindMarkerIcon(focused, category, index);
    if (ours) {
        InterlockedIncrement(&tooltipOurFocus);
    }
    if (InterlockedDecrement(&tooltipLinesLeft) < 0) {
        return;
    }

    // The icon's type and its +0x258 value.
    WORD type = 0;
    uint64_t blocker = 0;
    Read(static_cast<const BYTE*>(focused) + 0xde, &type, sizeof(type));
    Read(static_cast<const BYTE*>(focused) + 0x258, &blocker, sizeof(blocker));
    char line[400];
    sprintf_s(line, "tooltip focus type=%u ours=%s marker=%s zoom=%.3f icon258=0x%llx",
        static_cast<unsigned>(type), ours ? kCategories[category].label : "no",
        ours ? MarkerName(category, index) : "-", TooltipMapZoom(), static_cast<unsigned long long>(blocker));
    QueueObservation(line);
}

// --- 0.29.0: Legendary Animal hover and click ------------------------------
//
// The world map controller keeps the icon under the cursor at +0x5c0 (the
// same field ObserveTooltipFocus reads). When that is one of our Legendary
// Animal markers, the route canvas draws the animal's patrol path
// (RouteCanvas.cpp, through PywelGetAnimalPathState). A left click on such a
// marker (button pressed on it and released with the cursor moved less than
// kAnimalClickSlop pixels, so dragging the map is not a click; game window
// in front) tracks the animal: its path stays on the world map and
// the minimap and the route pauses. A click on the tracked animal, or Stop
// tracking on the panel's Route tab, ends it; so does finishing the animal
// (MarkerState.cpp). The game itself has no click action for this test icon.
//
// 0.29.1 (test 21/22: clicks only counted now and then, and again only after
// the map was closed and opened): the game seems to drop its focus on the
// icon once the button goes down, and not to take it again until the cursor
// leaves the icon. A click no longer needs the focus at release. The press counts
// for the animal the focus was last on while the cursor is still within
// kAnimalReach pixels of where it was then and the focus has not moved to
// something else (closing the map forgets it).
volatile LONG hoveredAnimal = -1;
volatile LONG trackedAnimal = -1;
volatile LONG64 hoveredAnimalTick = 0;
constexpr LONG kAnimalClickSlop = 6;
constexpr LONG kAnimalReach = 14;
// More than this between two world-map updates (ms) means the map was closed.
constexpr ULONGLONG kAnimalMapGapMs = 500;

// Map thread, after each world-map update (from ServiceMarkers).
void ObserveAnimalFocus(void* controller) {
    static bool buttonWasDown = false; // Map thread only.
    static LONG pressedOn = -1; // The animal the press was on.
    static POINT pressedAt = {}; // Where the cursor was then (screen pixels).
    static LONG lastAnimal = -1; // The animal the focus was last on (-1: none, or it moved on).
    static POINT lastAt = {}; // Where the cursor was then.
    static ULONGLONG lastUpdate = 0;
    ULONGLONG now = GetTickCount64();
    if (now - lastUpdate > kAnimalMapGapMs) {
        // The map was closed (or this is the first update): start afresh.
        buttonWasDown = false;
        pressedOn = -1;
        lastAnimal = -1;
    }
    lastUpdate = now;

    void* focused = nullptr;
    unsigned category = 0;
    unsigned index = 0;
    LONG hovered = -1;
    bool focusRead = Read(static_cast<const BYTE*>(controller) + 0x5c0, &focused, sizeof(focused));
    if (focusRead && FindMarkerIcon(focused, category, index) && category == kLegendaryAnimalCategory) {
        hovered = static_cast<LONG>(index);
    }
    InterlockedExchange(&hoveredAnimal, hovered);
    InterlockedExchange64(&hoveredAnimalTick, static_cast<LONG64>(now));

    POINT cursor = {};
    bool cursorKnown = GetCursorPos(&cursor) != 0;
    // The animal under the cursor: the focus, else the one it was last on
    // (as of the previous update, in case this one already moved it) while
    // the cursor is still near.
    LONG reachX = cursor.x - lastAt.x;
    LONG reachY = cursor.y - lastAt.y;
    LONG under = hovered >= 0 ? hovered :
        lastAnimal >= 0 && cursorKnown && reachX * reachX + reachY * reachY <= kAnimalReach * kAnimalReach ?
        lastAnimal : -1;
    if (hovered >= 0 && cursorKnown) {
        lastAnimal = hovered;
        lastAt = cursor;
    } else if (focusRead && focused != nullptr) {
        lastAnimal = -1; // The focus is on something else now.
    }

    DWORD foreground = 0;
    GetWindowThreadProcessId(GetForegroundWindow(), &foreground);
    bool down = foreground == GetCurrentProcessId() && (GetAsyncKeyState(VK_LBUTTON) & 0x8000) != 0;
    if (down && !buttonWasDown) {
        pressedOn = cursorKnown ? under : -1;
        pressedAt = cursor;
    } else if (!down && buttonWasDown) {
        // A click: pressed on an animal with a path, released with the
        // cursor still where it was pressed.
        LONG movedX = cursor.x - pressedAt.x;
        LONG movedY = cursor.y - pressedAt.y;
        bool still = cursorKnown && movedX * movedX + movedY * movedY <= kAnimalClickSlop * kAnimalClickSlop;
        if (still && pressedOn >= 0 && kLegendaryAnimalLinks[pressedOn].lineCount > 0) {
            LONG before = InterlockedCompareExchange(&trackedAnimal, 0, 0);
            LONG after = before == pressedOn ? -1 : pressedOn;
            InterlockedExchange(&trackedAnimal, after);
            if (after >= 0) {
                PywelReleaseNote("animals", "Tracking %s (route paused)", kLegendaryAnimalLinks[after].name);
            } else {
                PywelReleaseNote("animals", "Stopped tracking %s (map click)", kLegendaryAnimalLinks[before].name);
            }
        } else if (pressedOn >= 0) {
            PywelReleaseEvent("animals", "Click on %s not counted (cursor moved %ld, %ld px)",
                kLegendaryAnimalLinks[pressedOn].name, static_cast<long>(movedX), static_cast<long>(movedY));
        }
        pressedOn = -1;
    }
    buttonWasDown = down;
}

// Worker (F8): the call counts per caller group.
void LogTooltipCounts() {
    char line[400];
    int length = sprintf_s(line, "tooltip counts (all/ours/ours off the map thread):");
    for (unsigned group = 0; group < kTooltipCallerCount; ++group) {
        length += sprintf_s(line + length, sizeof(line) - length, " %s=%ld/%ld/%ld", kTooltipCallerNames[group],
            InterlockedCompareExchange(&tooltipCalls[group], 0, 0),
            InterlockedCompareExchange(&tooltipOurCalls[group], 0, 0),
            InterlockedCompareExchange(&tooltipOffThread[group], 0, 0));
    }
    sprintf_s(line + length, sizeof(line) - length, "; focus changes=%ld (ours %ld); detailed lines left=%ld",
        InterlockedCompareExchange(&tooltipFocusChanges, 0, 0), InterlockedCompareExchange(&tooltipOurFocus, 0, 0),
        InterlockedCompareExchange(&tooltipLinesLeft, 0, 0));
    Log(line);
}

// Worker, at start-up: checks the guard bytes, builds our texts and installs
// the hook. A mismatch (game update) only leaves tooltips off; the markers
// keep working.
void InstallTooltipHook(BYTE* base) {
    if (memcmp(base + kTooltipTextRva, kTooltipTextGuard, sizeof(kTooltipTextGuard)) != 0) {
        Log("Map tooltip text function changed; map tooltips not installed.");
        return;
    }
    // The texts must be complete before any game thread can reach the hook.
    BuildTooltipTexts();
    MH_STATUS status = MH_CreateHook(base + kTooltipTextRva,
        reinterpret_cast<void*>(&ProvideTooltipText), reinterpret_cast<void**>(&originalGetTooltipText));
    if (status == MH_OK) {
        status = MH_EnableHook(base + kTooltipTextRva);
    }
    char line[160];
    sprintf_s(line, "Map tooltip hook rva=0x%llx (phase 1, our text for our markers: %s, chest separator \"%s\"): %s",
        static_cast<unsigned long long>(kTooltipTextRva), kTooltipTextsOn ? "on" : "off", kTooltipLineBreak,
        MH_StatusToString(status));
    Log(line);
}
