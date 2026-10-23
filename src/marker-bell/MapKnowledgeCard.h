// MapKnowledgeCard.h - the world map's knowledge card for our chest markers
// (v0.89 phase 0: observe; v0.91 phase 1: our chests open the card).
//
// What this part does:
// - The world map has a "knowledge card": the big box with a title, a picture
//   and a description that opens when the cursor rests on, for example, a
//   discovered Abyss Nexus. Plan, static findings and the v0.89 run:
//   research/analysis/map-knowledge-card-review.md (sections 1-7).
// - It hooks four game functions:
//     0xdba0e0  fills the card for a gimmick icon (an icon of a world object)
//     0xf12770  stores the card's knowledge key (which knowledge entry)
//     0xf09e70  lays the card out (writes its title, description, ...)
//     0x3ed4e00 the UI's general "set the text of an element" function
//   For everything that is not our chest card, each hook calls the game's
//   original with the same arguments, returns its result unchanged and puts
//   back GetLastError (Read can change it), and logs what it saw.
// - Phase 1 (v0.91), chests with a known item only:
//   1. MarkChestForCard sets the icon flag +0x2b7 on our verified chest
//      markers, the flag the game's own gimmick icons get. The map then
//      calls 0xdba0e0 for them after the hover delay.
//   2. For our chests the 0xdba0e0 hook does what the original does, but with
//      the game's own "Treasure Chest" knowledge entry (row 0x16fc) instead
//      of looking up our marker number in the gimmick table (which would
//      find an unrelated object). It never calls the original for them.
//   3. While that card is laid out, the set-text hook swaps the title for the
//      item name and the description for "<type><br><item description>"
//      (tooltip-texts.h). The game sizes and draws the card itself.
//   The small map label (MapTooltips.h) still shows first, and stays the
//   fallback when any piece here is missing.
// - "view" below is the world map controller (tooltipController); its
//   knowledge card component ("box") is the pointer at view + 0x5e8.
// - Each hook checks its own guard bytes first. A mismatch (game update)
//   leaves that hook out and switches the chest card off.
//
// Included once by NativeMapCategoryProbe.cpp right after MapTooltips.h,
// inside the same unnamed namespace, so it uses that file's Read,
// QueueObservation, imageBase, FindMarkerIcon, MarkerName, tooltipController,
// kCategories and the tables of tooltip-texts.h.
#pragma once

// All four hooks forward the four register arguments unchanged (the traced
// functions take 2-3; passing a fourth register value through is harmless)
// and return whatever the original left in RAX.
using CardFunction = uintptr_t (*)(void*, uintptr_t, uintptr_t, uintptr_t);

// One hooked function: where it is, its guard bytes, and its original.
struct CardHook {
    const char* name;
    uintptr_t rva;
    BYTE guard[24];
    CardFunction original;
};

enum CardHookIndex { kCardFillGimmick, kCardSetKey, kCardLayout, kCardSetText, kCardHookCount };

// Guard bytes read from the executable with pefile (2026-10-24).
CardHook cardHooks[kCardHookCount] = {
    {"fill-gimmick", 0xdba0e0, {0x48, 0x89, 0x5c, 0x24, 0x18, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55,
        0x41, 0x56, 0x41, 0x57, 0x48, 0x8d, 0x6c, 0x24, 0xb0, 0x48, 0x81, 0xec}, nullptr},
    {"set-key", 0xf12770, {0x48, 0x89, 0x5c, 0x24, 0x08, 0x57, 0x48, 0x83, 0xec, 0x20, 0x0f, 0xb7,
        0x02, 0xbf, 0xff, 0xff, 0x00, 0x00, 0x66, 0x89, 0x81, 0x60, 0x01, 0x00}, nullptr},
    {"layout", 0xf09e70, {0x48, 0x89, 0x5c, 0x24, 0x10, 0x44, 0x88, 0x44, 0x24, 0x18, 0x48, 0x89,
        0x4c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41, 0x56}, nullptr},
    {"set-text", 0x3ed4e00, {0x48, 0x85, 0xd2, 0x0f, 0x84, 0x21, 0x06, 0x00, 0x00, 0x44, 0x88, 0x44,
        0x24, 0x18, 0x48, 0x89, 0x54, 0x24, 0x10, 0x48, 0x89, 0x4c, 0x24, 0x08}, nullptr},
};

// The card's elements we name in the log, by their offset in the box.
struct CardElement {
    const char* role;
    size_t offset;
};
constexpr CardElement kCardElements[] = {
    {"title", 0xf0}, {"free-line", 0x110}, {"description", 0x118},
    {"description-wrap", 0x120}, {"e398", 0x398}, {"e3a0", 0x3a0},
};
constexpr size_t kCardElementCount = _countof(kCardElements);

// The current box and its element pointers, refreshed by the map thread on
// every map update (NoteCardBox). The set-text hook runs for every UI text
// in the game, so it only compares against these copies and never reads
// game memory unless one matches.
void* volatile cardBox = nullptr;
void* volatile cardElements[kCardElementCount] = {};

// Box being laid out on this thread (set while the layout original runs).
thread_local void* cardLayoutBox = nullptr;

// Card log lines left for this session (their own budget, so they do not
// use up the label tooltip lines).
volatile LONG cardLinesLeft = 600;

// --- Phase 1: the chest card ---

// Master switch: false = phase 0 behavior (observe only, chests keep the
// small label only).
constexpr bool kChestCardOn = true;
// Row of the game's knowledgeinfo table "Knowledge_LevelGimmickIcon_Treasurebox"
// (title "Treasure Chest"). The card key is the table's row number; checked
// with the Nexus card (row 0x16ed = AbyssRuins) in the v0.89 run.
constexpr WORD kTreasureChestCardKey = 0x16fc;
// The UI helper that writes the card's description text (v0.89 run:
// "card text role=other caller=0x3eef5a1 ... in-layout=1").
constexpr uintptr_t kCardDescriptionCaller = 0x3eef5a1;
static_assert(_countof(kChestItemNames) == _countof(kChestLinks) &&
    _countof(kChestDescriptions) == _countof(kChestLinks), "tooltip-texts.h tables must follow kChestLinks");

// Two game functions our chest branch calls, exactly as 0xdba0e0 does. Both
// are 5-byte jumps into the game's protected code, so only those 5 bytes
// can be checked.
using ShowCardBox = void (*)(void* view, void* box); // 0xdba3f0: show this box.
using SetCardMode = void (*)(void* view, BYTE mode); // 0xdcf090: map view's tooltip mode (5 = knowledge).
constexpr uintptr_t kShowCardBoxRva = 0xdba3f0;
constexpr uintptr_t kSetCardModeRva = 0xdcf090;
constexpr BYTE kShowCardBoxGuard[5] = {0xe9, 0x0b, 0x30, 0xd3, 0x09};
constexpr BYTE kSetCardModeGuard[5] = {0xe9, 0x3b, 0x86, 0xd6, 0x09};
ShowCardBox showCardBox = nullptr;
SetCardMode setCardMode = nullptr;

// 1 once every hook and called function passed its guard check (worker
// writes it once at start-up; map thread reads it).
volatile LONG chestCardReady = 0;
// The chest the card currently shows: written by the map thread when our
// branch opens the card, cleared when the game sets another key on that box.
void* volatile chestCardBox = nullptr;
volatile LONG chestCardIndex = -1;
// Per layout pass (thread-local): whether this pass lays out our chest card
// and whether its description was swapped already.
thread_local LONG chestLayoutIndex = -1;
thread_local bool chestDescriptionDone = false;
volatile LONG chestCardOpens = 0;

// Writes one byte of game memory. WriteProcessMemory on our own process
// fails cleanly instead of crashing if the memory is not writable.
bool WriteGameByte(void* address, BYTE value) {
    SIZE_T written = 0;
    return WriteProcessMemory(GetCurrentProcess(), address, &value, sizeof(value), &written) &&
        written == sizeof(value);
}

// Map thread, for every present, wanted, verified world-map marker (next to
// DisableZoomWindows): gives our chest icons with a known item the "has a
// detailed card" flag +0x2b7, like the game's own gimmick icons. Only that
// flag: +0x2b6 also drives other icon behavior, so it stays as the game set
// it. Written only when it is 0, so a re-created icon is covered next pass.
void MarkChestForCard(unsigned category, unsigned index, void* icon) {
    if (!kChestCardOn || !InterlockedCompareExchange(&chestCardReady, 0, 0) || category != kChestCategory ||
        !kChestItemNames[index]) {
        return;
    }
    BYTE* flag = static_cast<BYTE*>(icon) + 0x2b7;
    BYTE value = 1;
    if (Read(flag, &value, sizeof(value)) && value == 0) {
        WriteGameByte(flag, 1);
    }
}

// Takes one line from the budget; false once it is used up.
bool TakeCardLine() {
    return InterlockedDecrement(&cardLinesLeft) >= 0;
}

// Copies up to 120 bytes of a game text for the log: "null", "unreadable",
// "empty" or the text in quotes. Read copies it, so a bad pointer cannot
// crash; a text that ends near unreadable memory is retried shorter.
void DescribeCardText(const char* text, char (&out)[136]) {
    if (!text) {
        strcpy_s(out, "null");
        return;
    }
    char copy[121] = {};
    if (!Read(text, copy, 120) && !Read(text, copy, 32) && !Read(text, copy, 8)) {
        strcpy_s(out, "unreadable");
        return;
    }
    copy[120] = 0;
    if (!copy[0]) {
        strcpy_s(out, "empty");
        return;
    }
    _snprintf_s(out, _TRUNCATE, "\"%s\"", copy);
}

// Describes an icon for the log: ours (category and marker) or native, its
// type, and its tag (key at +0xc8, kind byte at +0xd0).
void DescribeCardIcon(void* icon, char (&out)[160]) {
    WORD type = 0;
    uint64_t key = 0;
    BYTE kind = 0;
    Read(static_cast<const BYTE*>(icon) + 0xde, &type, sizeof(type));
    Read(static_cast<const BYTE*>(icon) + 0xc8, &key, sizeof(key));
    Read(static_cast<const BYTE*>(icon) + 0xd0, &kind, sizeof(kind));
    unsigned category = 0;
    unsigned index = 0;
    bool ours = FindMarkerIcon(icon, category, index);
    _snprintf_s(out, _TRUNCATE, "icon=%s type=%u tag=(0x%llx,0x%x)",
        ours ? kCategories[category].label : "native", static_cast<unsigned>(type),
        static_cast<unsigned long long>(key), static_cast<unsigned>(kind));
}

// Reads the card's knowledge key (a 2-byte number at box + 0x160).
unsigned CardKey(void* box) {
    WORD key = 0xffff;
    Read(static_cast<const BYTE*>(box) + 0x160, &key, sizeof(key));
    return key;
}

// Map thread, every map update: keeps copies of the box and its element
// pointers for the set-text hook.
void NoteCardBox(void* view) {
    void* box = nullptr;
    if (!view || !Read(static_cast<const BYTE*>(view) + 0x5e8, &box, sizeof(box))) {
        box = nullptr;
    }
    cardBox = box;
    for (size_t element = 0; element < kCardElementCount; ++element) {
        void* pointer = nullptr;
        if (!box || !Read(static_cast<const BYTE*>(box) + kCardElements[element].offset, &pointer, sizeof(pointer))) {
            pointer = nullptr;
        }
        cardElements[element] = pointer;
    }
}

// Map thread, after each world-map update (next to ObserveTooltipFocus):
// refreshes the box copies and, when the focused icon (view + 0x5c0)
// changes, logs the icon fields the game uses to choose a detailed card
// (see the review, section 1).
void ObserveMapCard(void* view) {
    static void* lastFocused = nullptr; // Map thread only.
    NoteCardBox(view);
    void* icon = nullptr;
    if (!Read(static_cast<const BYTE*>(view) + 0x5c0, &icon, sizeof(icon)) || icon == lastFocused) {
        return;
    }
    lastFocused = icon;
    if (!icon || !TakeCardLine()) {
        return;
    }
    const BYTE* bytes = static_cast<const BYTE*>(icon);
    int characterKey = 0;
    short shortKey = 0;
    int kindZeroKey = 0;
    BYTE flags[3] = {};
    Read(bytes + 0xd8, &characterKey, sizeof(characterKey));
    Read(bytes + 0xdc, &shortKey, sizeof(shortKey));
    Read(bytes + 0x28c, &kindZeroKey, sizeof(kindZeroKey));
    Read(bytes + 0x2b5, flags, sizeof(flags));
    char iconText[160];
    DescribeCardIcon(icon, iconText);
    char line[400];
    _snprintf_s(line, _TRUNCATE, "card focus %s d8=%d dc=%d 28c=%d 2b5=%u 2b6=%u 2b7=%u",
        iconText, characterKey, static_cast<int>(shortKey), kindZeroKey, flags[0], flags[1], flags[2]);
    QueueObservation(line);
}

// Map thread, from the 0xdba0e0 hook: opens the Treasure Chest card for our
// chest `index`, with the same steps as the game's 0xdba0e0 (copy the icon's
// +0x2b6 into box +0x1a8, set the knowledge key, show the box, tooltip mode
// 5), and remembers which chest it shows for the text swaps. The set-key
// original is called directly, so this does not clear our own state.
// Returns false (and does nothing) if the box cannot be read.
bool OpenChestCard(void* view, void* icon, unsigned index) {
    void* box = nullptr;
    BYTE iconFlag = 0;
    if (!Read(static_cast<const BYTE*>(view) + 0x5e8, &box, sizeof(box)) || !box ||
        !Read(static_cast<const BYTE*>(icon) + 0x2b6, &iconFlag, sizeof(iconFlag)) ||
        !WriteGameByte(static_cast<BYTE*>(box) + 0x1a8, iconFlag)) {
        return false;
    }
    InterlockedExchange(&chestCardIndex, static_cast<LONG>(index));
    chestCardBox = box;
    WORD key = kTreasureChestCardKey;
    cardHooks[kCardSetKey].original(box, reinterpret_cast<uintptr_t>(&key), 0, 0);
    showCardBox(view, box);
    setCardMode(view, 5);
    InterlockedIncrement(&chestCardOpens);
    if (TakeCardLine()) {
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card open-chest marker=%s box=%p key=0x%x",
            MarkerName(kChestCategory, index), box, static_cast<unsigned>(kTreasureChestCardKey));
        QueueObservation(line);
    }
    return true;
}

// Hook on 0xdba0e0 (view, icon, position). Our chests with a known item
// (only they have the +0x2b7 flag from MarkChestForCard): OpenChestCard,
// never the original, whose gimmick-table lookup would use our marker
// number. Everything else: the original, then a log line with the
// knowledge key and the free text line it chose.
uintptr_t ObserveFillGimmickCard(void* view, uintptr_t icon, uintptr_t position, uintptr_t fourth) {
    unsigned category = 0;
    unsigned index = 0;
    if (kChestCardOn && InterlockedCompareExchange(&chestCardReady, 0, 0) &&
        FindMarkerIcon(reinterpret_cast<void*>(icon), category, index) && category == kChestCategory &&
        kChestItemNames[index]) {
        DWORD ourError = GetLastError();
        if (!OpenChestCard(view, reinterpret_cast<void*>(icon), index) && TakeCardLine()) {
            QueueObservation("card open-chest failed: the card box could not be read or written");
        }
        SetLastError(ourError);
        return 0;
    }
    uintptr_t result = cardHooks[kCardFillGimmick].original(view, icon, position, fourth);
    DWORD lastError = GetLastError();
    if (TakeCardLine()) {
        void* box = nullptr;
        Read(static_cast<const BYTE*>(view) + 0x5e8, &box, sizeof(box));
        float height = 0.0f;
        Read(reinterpret_cast<const BYTE*>(position) + 4, &height, sizeof(height));
        // The free text line: a string object whose first field is its text.
        const char* freeText = nullptr;
        if (box) {
            Read(static_cast<const BYTE*>(box) + 0x3d8, &freeText, sizeof(freeText));
        }
        char iconText[160];
        DescribeCardIcon(reinterpret_cast<void*>(icon), iconText);
        char text[136];
        DescribeCardText(freeText, text);
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card fill-gimmick %s y=%.1f box=%p key=0x%x free=%s thread=%s",
            iconText, height, box, box ? CardKey(box) : 0xffffu, text,
            GetCurrentThreadId() == static_cast<DWORD>(tooltipMapThread) ? "map" : "other");
        QueueObservation(line);
    }
    SetLastError(lastError);
    return result;
}

// Hook on 0xf12770 (box, &key): logs who set which knowledge key. The game
// setting any key on the box that shows our chest means the card now shows
// something else, so our chest state is cleared (our own call in
// OpenChestCard goes to the original directly and does not come here).
uintptr_t ObserveSetCardKey(void* box, uintptr_t key, uintptr_t third, uintptr_t fourth) {
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    if (box == chestCardBox) {
        InterlockedExchange(&chestCardIndex, -1);
        chestCardBox = nullptr;
    }
    uintptr_t result = cardHooks[kCardSetKey].original(box, key, third, fourth);
    DWORD lastError = GetLastError();
    if (TakeCardLine()) {
        WORD value = 0xffff;
        Read(reinterpret_cast<const void*>(key), &value, sizeof(value));
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card set-key caller=0x%llx box=%p ours-box=%u key=0x%x",
            static_cast<unsigned long long>(caller), box, box == cardBox ? 1u : 0u, static_cast<unsigned>(value));
        QueueObservation(line);
    }
    SetLastError(lastError);
    return result;
}

// Hook on 0xf09e70 (box, ...): marks this thread as "inside the card
// layout" while the original runs, so the set-text hook logs every text
// written meanwhile. It also decides once per pass whether this pass lays
// out our chest card (our box, still showing the Treasure Chest key). The
// old marks are put back afterwards (safe if nested).
uintptr_t ObserveCardLayout(void* box, uintptr_t second, uintptr_t third, uintptr_t fourth) {
    LONG chest = InterlockedCompareExchange(&chestCardIndex, 0, 0);
    LONG layoutChest = -1;
    if (chest >= 0 && box == chestCardBox && CardKey(box) == kTreasureChestCardKey) {
        layoutChest = chest;
    }
    bool logged = box == cardBox && TakeCardLine();
    if (logged) {
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card layout enter box=%p key=0x%x caller=0x%llx chest=%s", box, CardKey(box),
            static_cast<unsigned long long>(reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase),
            layoutChest >= 0 ? MarkerName(kChestCategory, static_cast<unsigned>(layoutChest)) : "-");
        QueueObservation(line);
    }
    void* outer = cardLayoutBox;
    LONG outerChest = chestLayoutIndex;
    bool outerDone = chestDescriptionDone;
    cardLayoutBox = box;
    chestLayoutIndex = layoutChest;
    chestDescriptionDone = false;
    uintptr_t result = cardHooks[kCardLayout].original(box, second, third, fourth);
    cardLayoutBox = outer;
    chestLayoutIndex = outerChest;
    chestDescriptionDone = outerDone;
    DWORD lastError = GetLastError();
    if (logged && TakeCardLine()) {
        char line[160];
        _snprintf_s(line, _TRUNCATE, "card layout leave box=%p", box);
        QueueObservation(line);
    }
    SetLastError(lastError);
    return result;
}

// Hook on 0x3ed4e00 (element, text, flag): runs for every UI text in the
// game. Logs only texts written while our box is being laid out, or written
// into one of the box's known elements. While our chest card is laid out it
// passes our text instead: the title element gets the item name, and the
// first description write (caller kCardDescriptionCaller) gets
// "<type><br><item description>". A chest without that text keeps the game's.
uintptr_t ObserveSetElementText(void* element, uintptr_t text, uintptr_t flag, uintptr_t fourth) {
    // Fast path first: pointer compares only, no game memory reads.
    const char* role = nullptr;
    void* box = cardBox;
    if (box && element) {
        for (size_t index = 0; index < kCardElementCount; ++index) {
            if (element == cardElements[index]) {
                role = kCardElements[index].role;
                break;
            }
        }
        if (!role && cardLayoutBox == box) {
            role = "other";
        }
    }
    if (!role) {
        return cardHooks[kCardSetText].original(element, text, flag, fourth);
    }

    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    // Our chest card: swap the title and the description (texts live in
    // tooltip-texts.h for the whole process, so the pointers stay valid).
    const char* ours = nullptr;
    LONG chest = chestLayoutIndex;
    if (kChestCardOn && chest >= 0 && cardLayoutBox == box) {
        if (element == cardElements[0]) {
            ours = kChestItemNames[chest];
        } else if (caller == kCardDescriptionCaller && !chestDescriptionDone) {
            chestDescriptionDone = true;
            ours = kChestDescriptions[chest];
        }
    }
    uintptr_t sent = ours ? reinterpret_cast<uintptr_t>(ours) : text;
    uintptr_t result = cardHooks[kCardSetText].original(element, sent, flag, fourth);
    DWORD lastError = GetLastError();
    if (TakeCardLine()) {
        char described[136];
        DescribeCardText(reinterpret_cast<const char*>(text), described);
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card text role=%s caller=0x%llx element=%p flag=%u in-layout=%u sent=%s text=%s",
            role, static_cast<unsigned long long>(caller), element, static_cast<unsigned>(flag & 0xff),
            cardLayoutBox == box ? 1u : 0u, ours ? "ours" : "game", described);
        QueueObservation(line);
    }
    SetLastError(lastError);
    return result;
}

// Worker, at start-up: checks each hook's guard bytes and installs it, then
// checks the two functions the chest branch calls. The chest card is
// switched on only if all of that worked; otherwise chests keep the label.
void InstallCardHooks(BYTE* base) {
    void* detours[kCardHookCount] = {
        reinterpret_cast<void*>(&ObserveFillGimmickCard), reinterpret_cast<void*>(&ObserveSetCardKey),
        reinterpret_cast<void*>(&ObserveCardLayout), reinterpret_cast<void*>(&ObserveSetElementText),
    };
    bool allHooks = true;
    for (unsigned hook = 0; hook < kCardHookCount; ++hook) {
        CardHook& target = cardHooks[hook];
        BYTE* address = base + target.rva;
        MH_STATUS status = MH_UNKNOWN;
        bool guardOk = memcmp(address, target.guard, sizeof(target.guard)) == 0;
        if (guardOk) {
            status = MH_CreateHook(address, detours[hook], reinterpret_cast<void**>(&target.original));
            if (status == MH_OK) {
                status = MH_EnableHook(address);
            }
        }
        allHooks = allHooks && guardOk && status == MH_OK;
        char line[160];
        sprintf_s(line, "Map knowledge card hook %s rva=0x%llx: %s",
            target.name, static_cast<unsigned long long>(target.rva),
            guardOk ? MH_StatusToString(status) : "guard bytes changed, not installed");
        Log(line);
    }

    // The two called functions: only their 5-byte jumps can be compared.
    bool callsOk = memcmp(base + kShowCardBoxRva, kShowCardBoxGuard, sizeof(kShowCardBoxGuard)) == 0 &&
        memcmp(base + kSetCardModeRva, kSetCardModeGuard, sizeof(kSetCardModeGuard)) == 0;
    if (callsOk) {
        showCardBox = reinterpret_cast<ShowCardBox>(base + kShowCardBoxRva);
        setCardMode = reinterpret_cast<SetCardMode>(base + kSetCardModeRva);
    }
    bool ready = kChestCardOn && allHooks && callsOk;
    InterlockedExchange(&chestCardReady, ready ? 1 : 0);
    char line[200];
    sprintf_s(line, "Map knowledge card for chests (Treasure Chest card 0x%x, item title and description): %s",
        static_cast<unsigned>(kTreasureChestCardKey),
        ready ? "on" : !kChestCardOn ? "off (switch)" : !callsOk ? "off (called functions changed)" : "off (a hook is missing)");
    Log(line);
}

// Worker (F8): chest cards opened and lines left in the card budget.
void LogCardCounts() {
    char line[160];
    sprintf_s(line, "card chest opens=%ld, card lines left=%ld", InterlockedCompareExchange(&chestCardOpens, 0, 0),
        InterlockedCompareExchange(&cardLinesLeft, 0, 0));
    Log(line);
}
