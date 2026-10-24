// MapKnowledgeCard.h - the world map's knowledge card for our chest markers
// (v0.89 phase 0: observe; v0.91 phase 1: our chests open the card; v0.93:
// Sealed Abyss Artifacts too, per-category settings in kCardCategories).
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
//      item name, and the card's two description paragraphs (two separate
//      text elements, v0.91 log) for the item type and the item description
//      (tooltip-texts.h). Those elements show text as written, no markup, so
//      v0.92 dropped "<br>". The game sizes and draws the card itself.
//      v0.98: when the two markup hooks are in place, the card's whole
//      description markup is replaced instead (0x647cb0 / 0x3ed7f90 for the
//      description element), lines joined with "<br/>", so the game makes
//      real line breaks and as many lines as needed; the paragraph swap is
//      then skipped and stays only as the fallback.
//   v0.106: chest cards list the item's base stat lines (Attack, Defense,
//      stat levels, the gear's effects) in the inventory tooltip's white
//      font, before the item text. v0.109: four layouts (kCardStatStyle),
//      default 3 = the inventory tooltip's stat rows with their icons.
//   v0.103: the item icon gets a size class ("pywel-icon-60" .. "-90",
//      kChestIconStep / kAbyssChestIconStep) on the card's picture element,
//      so icons look about the same size (the UI add-on's CSS rules draw the
//      class; without the add-on the class does nothing). See ApplyIconSize.
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

// v0.96: two more observe-only hooks (kCardFormat, kCardMarkup) look for the
// call that receives the card's whole description markup (plan:
// research/analysis/map-knowledge-card-markup-plan.md). The chest card does
// not depend on them (kCardRequiredHooks).
enum CardHookIndex {
    kCardFillGimmick, kCardSetKey, kCardLayout, kCardSetText, kCardFormat, kCardMarkup, kCardNameCopy,
    kCardHookCount
};
constexpr unsigned kCardRequiredHooks = kCardFormat;

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
    // v0.96: text formatter step 1 (context, text, segments, element).
    {"format-text", 0x647cb0, {0x4c, 0x89, 0x4c, 0x24, 0x20, 0x4c, 0x89, 0x44, 0x24, 0x18, 0x48, 0x89,
        0x4c, 0x24, 0x08, 0x55, 0x53, 0x56, 0x57, 0x41, 0x54, 0x41, 0x55, 0x41}, nullptr},
    // v0.96: set an element's content from markup (element, markup, flag).
    {"set-markup", 0x3ed7f90, {0x48, 0x89, 0x5c, 0x24, 0x10, 0x48, 0x89, 0x74, 0x24, 0x18, 0x55, 0x57,
        0x41, 0x54, 0x41, 0x56, 0x41, 0x57, 0x48, 0x8d, 0xac, 0x24, 0xa0, 0xf6}, nullptr},
    // v0.101: copy a C string into a game string (string, const char* text);
    // the card layout copies its picture's texture name with it. (v0.100
    // hooked the stringinfo lookup 0x388e00 instead; its bytes in memory
    // differed from the file, so that hook never went in.)
    {"name-copy", 0x3d5f80, {0x40, 0x53, 0x55, 0x56, 0x48, 0x83, 0xec, 0x30, 0x48, 0x8b, 0x31, 0x48,
        0x8b, 0xea, 0x48, 0x8b, 0xd9, 0x48, 0x3b, 0x16, 0x0f, 0x84, 0xd0, 0x00}, nullptr},
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

// --- Phase 1: our cards (v0.91 chests, v0.93 Sealed Abyss Artifacts) ---

// Master switch: false = phase 0 behavior (observe only, markers keep the
// small label only).
constexpr bool kChestCardOn = true;
// The UI helper that writes the card's description text (v0.89 run:
// "card text role=other caller=0x3eef5a1 ... in-layout=1").
constexpr uintptr_t kCardDescriptionCaller = 0x3eef5a1;
static_assert(_countof(kChestItemNames) == _countof(kChestLinks) &&
    _countof(kChestCardParagraph1) == _countof(kChestLinks) &&
    _countof(kChestCardParagraph2) == _countof(kChestLinks), "tooltip-texts.h tables must follow kChestLinks");
static_assert(_countof(kArtifactCardTitles) == _countof(kArtifactLinks) &&
    _countof(kArtifactCardParagraph1) == _countof(kArtifactLinks) &&
    _countof(kArtifactCardParagraph2) == _countof(kArtifactLinks) &&
    _countof(kArtifactCardMarkup) == _countof(kArtifactLinks),
    "tooltip-texts.h tables must follow kArtifactLinks");
static_assert(_countof(kChestCardMarkupPlain) == _countof(kChestLinks) &&
    _countof(kChestCardMarkupCompact) == _countof(kChestLinks) &&
    _countof(kChestCardMarkupColumns) == _countof(kChestLinks) &&
    _countof(kChestCardMarkupIcons) == _countof(kChestLinks) &&
    _countof(kChestCardMarkupIconsNoBuff) == _countof(kChestLinks), "tooltip-texts.h tables must follow kChestLinks");
static_assert(_countof(kAbyssChestItemNames) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardParagraph1) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardParagraph2) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardMarkupPlain) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardMarkupCompact) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardMarkupColumns) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardMarkupIcons) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestCardMarkupIconsNoBuff) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestIconName) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestIconStep) == _countof(kAbyssChestLinks) &&
    _countof(kAbyssChestContents) == _countof(kAbyssChestLinks), "tooltip-texts.h tables must follow kAbyssChestLinks");

// v0.109: the chest card's description in each layout (kCardStatStyle):
// 0 plain lines, 1 compact (white stats, yellow effects), 2 the inventory
// tooltip's two-column stat rows, 3 the same with its stat icons.
// Entry 4 is style 3 without the effect lines' buff icons (kCardBuffIconsOn).
constexpr unsigned kCardStatStyleCount = 4;
constexpr const char* const* kChestCardStyles[kCardStatStyleCount + 1] = {
    kChestCardMarkupPlain, kChestCardMarkupCompact, kChestCardMarkupColumns, kChestCardMarkupIcons,
    kChestCardMarkupIconsNoBuff};
constexpr const char* const* kAbyssChestCardStyles[kCardStatStyleCount + 1] = {
    kAbyssChestCardMarkupPlain, kAbyssChestCardMarkupCompact, kAbyssChestCardMarkupColumns,
    kAbyssChestCardMarkupIcons, kAbyssChestCardMarkupIconsNoBuff};
// v0.112: unique gear items, same layouts.
constexpr const char* const* kUniqueGearCardStyles[kCardStatStyleCount + 1] = {
    kUniqueGearCardMarkupPlain, kUniqueGearCardMarkupCompact, kUniqueGearCardMarkupColumns,
    kUniqueGearCardMarkupIcons, kUniqueGearCardMarkupIconsNoBuff};
static_assert(_countof(kUniqueGearItemNames) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardParagraph1) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardParagraph2) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardMarkupPlain) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardMarkupCompact) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardMarkupColumns) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardMarkupIcons) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearCardMarkupIconsNoBuff) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearIconName) == _countof(kUniqueGearLinks) &&
    _countof(kUniqueGearIconStep) == _countof(kUniqueGearLinks), "tooltip-texts.h tables must follow kUniqueGearLinks");

// One marker category that opens a knowledge card: which game card it
// borrows (the knowledgeinfo row number; checked with the Nexus card, row
// 0x16ed = AbyssRuins, in the v0.89 run) and the texts swapped in. A marker
// whose title is nullptr keeps the small label only.
struct CardCategory {
    unsigned category;
    bool on; // Per-category switch.
    WORD key;
    const char* const* titles;
    const char* const* paragraph1;
    const char* const* paragraph2;
    // v0.98: the whole description as markup ("<br/>" = new line).
    const char* const* markup;
    // v0.102: the item's inventory icon per marker (nullptr table = the card
    // keeps the game's picture).
    const char* const* iconNames;
    // v0.103: the icon's size class per marker (0 = none).
    const uint8_t* iconSteps;
    // v0.109: the markup per layout (kChestCardStyles), or nullptr when
    // the category has one markup only (then `markup` is used).
    const char* const* const* styles;
};
constexpr CardCategory kCardCategories[] = {
    // "Knowledge_LevelGimmickIcon_Treasurebox" (title "Treasure Chest").
    {kChestCategory, true, 0x16fc, kChestItemNames, kChestCardParagraph1, kChestCardParagraph2,
        kChestCardMarkupCompact, kChestIconName, kChestIconStep, kChestCardStyles},
    // v0.102: Abyss chests, same Treasure Chest card.
    {kAbyssChestCategory, true, 0x16fc, kAbyssChestItemNames, kAbyssChestCardParagraph1, kAbyssChestCardParagraph2,
        kAbyssChestCardMarkupCompact, kAbyssChestIconName, kAbyssChestIconStep, kAbyssChestCardStyles},
    // v0.112: unique gear items, same Treasure Chest card (item name as title).
    {kUniqueGearCategory, true, 0x16fc, kUniqueGearItemNames, kUniqueGearCardParagraph1, kUniqueGearCardParagraph2,
        kUniqueGearCardMarkupCompact, kUniqueGearIconName, kUniqueGearIconStep, kUniqueGearCardStyles},
    // "Knowledge_LevelGimmickIcon_SealedAbyssArtifact".
    {kArtifactCategory, true, 0x16fb, kArtifactCardTitles, kArtifactCardParagraph1, kArtifactCardParagraph2,
        kArtifactCardMarkup, nullptr, nullptr, nullptr},
};

// The card settings for `category`, or nullptr if it has no card (or its
// switch is off).
const CardCategory* FindCardCategory(unsigned category) {
    for (const CardCategory& card : kCardCategories) {
        if (card.category == category && card.on) {
            return &card;
        }
    }
    return nullptr;
}

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
// v0.98: 1 once both markup hooks (format-text and set-markup) are in place.
// Then our cards get their whole description as markup (real line breaks)
// and the per-paragraph swap is skipped; otherwise the paragraph swap with
// the middle-dot texts is the fallback.
constexpr bool kCardMarkupOn = true;
// v0.106: chest cards list the item's base stats (tooltip-texts.h, from
// research/analysis/chest-item-stats.json). v0.109: which layout
// (kChestCardStyles): 0 plain lines, 1 compact, 2 two columns, 3 two
// columns with the inventory's stat icons (Thomas's choice). Styles 2 and 3
// nest divs with the inventory tooltip's classes (ItemTooltip2.css); if they
// look broken in game, set 1. A markup longer than kMaxCardMarkupBytes falls
// back to style 1 for that card.
constexpr unsigned kCardStatStyle = 3;
// v0.109: style 3 gives each effect line its own buff icon (the texture its
// game template names) through the UI add-on v0.80's pywel-buff-<name>
// classes; with an older add-on those show as blank tinted squares. false =
// effect lines only get a stat icon where the inventory has one.
constexpr bool kCardBuffIconsOn = true;
constexpr size_t kMaxCardMarkupBytes = 3000;
static_assert(kCardStatStyle < kCardStatStyleCount, "kCardStatStyle must be 0..3");

// The description markup for one of our cards in the chosen layout, and
// which layout it is (style 1 when the chosen one is missing or too long).
const char* CardMarkupFor(const CardCategory& card, unsigned index, unsigned& style, size_t& length) {
    style = kCardStatStyle;
    unsigned table = style == 3 && !kCardBuffIconsOn ? kCardStatStyleCount : style;
    const char* text = card.styles ? card.styles[table][index] : card.markup[index];
    length = text ? strnlen(text, kMaxCardMarkupBytes + 1) : 0;
    if (card.styles && (!text || length > kMaxCardMarkupBytes)) {
        style = 1;
        text = card.styles[style][index];
        length = text ? strnlen(text, kMaxCardMarkupBytes + 1) : 0;
    }
    return text;
}

// v0.100/v0.101: our chest card shows the item's inventory icon instead of
// the Treasure Chest picture. The layout 0xf09e70 looks up its picture's
// texture name in the stringinfo table and copies it into the picture's name
// with 0x3d5f80, at these two calls (return addresses). For our chest card
// the hook copies the item icon's name (kChestIconName, from the same table:
// research/analysis/chest-item-icons.json) instead. Everything else gets the
// game's text. A missing texture only makes the game use its placeholder.
constexpr bool kChestItemImageOn = true;
constexpr uintptr_t kCardPictureReturns[] = {0xf0b677, 0xf0b6ea};
volatile LONG chestImageReady = 0;
volatile LONG chestImageSwaps = 0;
volatile LONG cardMarkupReady = 0;
// The marker the card currently shows, as category * kMaxCategoryMarkers +
// index (-1 = none): written by the map thread when our branch opens the
// card, cleared when the game sets another key on that box.
void* volatile chestCardBox = nullptr;
volatile LONG chestCardIndex = -1;
// Per layout pass (thread-local): the marker (same encoding) whose card this
// pass lays out, and how many description paragraphs it has written so far.
thread_local LONG chestLayoutIndex = -1;
thread_local int chestParagraphs = 0;
// v0.103: true once this layout pass copied our item icon's name into the
// picture (ObserveNameCopy), so only then does the picture get a size class.
thread_local bool chestPictureOurs = false;
volatile LONG chestCardOpens = 0;

// Splits an encoded card marker back into its card settings and index.
const CardCategory* DecodeCardMarker(LONG marker, unsigned& index) {
    index = static_cast<unsigned>(marker) % kMaxCategoryMarkers;
    return FindCardCategory(static_cast<unsigned>(marker) / kMaxCategoryMarkers);
}

// Writes one byte of game memory. WriteProcessMemory on our own process
// fails cleanly instead of crashing if the memory is not writable.
bool WriteGameByte(void* address, BYTE value) {
    SIZE_T written = 0;
    return WriteProcessMemory(GetCurrentProcess(), address, &value, sizeof(value), &written) &&
        written == sizeof(value);
}

// Map thread, for every present, wanted, verified world-map marker (next to
// DisableZoomWindows): gives our markers that have card texts (chests with a
// known item, Sealed Abyss Artifacts) the "has a detailed card" flag +0x2b7,
// like the game's own gimmick icons. Only that flag: +0x2b6 also drives
// other icon behavior, so it stays as the game set it. Written only when it
// is 0, so a re-created icon is covered next pass.
void MarkChestForCard(unsigned category, unsigned index, void* icon) {
    const CardCategory* card = FindCardCategory(category);
    if (!kChestCardOn || !InterlockedCompareExchange(&chestCardReady, 0, 0) || !card || !card->titles[index]) {
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

// v0.106 (PywelMapKnowledgeCardState): 1 while a knowledge card is open on
// the world map. Set when any card key is set on the map's card box (the
// game's own cards and ours) and when our branch opens a card; cleared by
// the map thread when the focused icon changes. cardStateTick is the time
// of the last world-map update, so a closed map reads as "no card".
volatile LONG cardOpenFlag = 0;
volatile LONG64 cardStateTick = 0;
constexpr ULONGLONG kCardStateMaxAgeMs = 300;

// Any thread: true while a knowledge card is open and the world map is
// being updated (snapshot of two atomics).
bool KnowledgeCardOpen() {
    ULONGLONG tick = static_cast<ULONGLONG>(InterlockedCompareExchange64(&cardStateTick, 0, 0));
    return InterlockedCompareExchange(&cardOpenFlag, 0, 0) != 0 && tick != 0 &&
        GetTickCount64() - tick < kCardStateMaxAgeMs;
}

// Map thread, after each world-map update (next to ObserveTooltipFocus):
// refreshes the box copies and, when the focused icon (view + 0x5c0)
// changes, logs the icon fields the game uses to choose a detailed card
// (see the review, section 1).
void ObserveMapCard(void* view) {
    static void* lastFocused = nullptr; // Map thread only.
    NoteCardBox(view);
    InterlockedExchange64(&cardStateTick, static_cast<LONG64>(GetTickCount64()));
    void* icon = nullptr;
    if (!Read(static_cast<const BYTE*>(view) + 0x5c0, &icon, sizeof(icon)) || icon == lastFocused) {
        return;
    }
    lastFocused = icon;
    // v0.106: the card belongs to the icon under the cursor; a new focus
    // (or none) means the old card is gone until a key is set again.
    InterlockedExchange(&cardOpenFlag, 0);
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
// 5), and remembers which marker it shows for the text swaps. The set-key
// original is called directly, so this does not clear our own state.
// Returns false (and does nothing) if the box cannot be read.
bool OpenChestCard(void* view, void* icon, const CardCategory& card, unsigned index) {
    void* box = nullptr;
    BYTE iconFlag = 0;
    if (!Read(static_cast<const BYTE*>(view) + 0x5e8, &box, sizeof(box)) || !box ||
        !Read(static_cast<const BYTE*>(icon) + 0x2b6, &iconFlag, sizeof(iconFlag)) ||
        !WriteGameByte(static_cast<BYTE*>(box) + 0x1a8, iconFlag)) {
        return false;
    }
    InterlockedExchange(&chestCardIndex, static_cast<LONG>(card.category * kMaxCategoryMarkers + index));
    chestCardBox = box;
    InterlockedExchange(&cardOpenFlag, 1);
    WORD key = card.key;
    cardHooks[kCardSetKey].original(box, reinterpret_cast<uintptr_t>(&key), 0, 0);
    showCardBox(view, box);
    setCardMode(view, 5);
    InterlockedIncrement(&chestCardOpens);
    if (TakeCardLine()) {
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card open-%s marker=%s box=%p key=0x%x",
            kCategories[card.category].label, MarkerName(card.category, index), box, static_cast<unsigned>(card.key));
        QueueObservation(line);
    }
    return true;
}

// Hook on 0xdba0e0 (view, icon, position). Our markers with card texts
// (only they have the +0x2b7 flag from MarkChestForCard): OpenChestCard,
// never the original, whose gimmick-table lookup would use our marker
// number. Everything else: the original, then a log line with the
// knowledge key and the free text line it chose.
uintptr_t ObserveFillGimmickCard(void* view, uintptr_t icon, uintptr_t position, uintptr_t fourth) {
    unsigned category = 0;
    unsigned index = 0;
    const CardCategory* card = nullptr;
    if (kChestCardOn && InterlockedCompareExchange(&chestCardReady, 0, 0) &&
        FindMarkerIcon(reinterpret_cast<void*>(icon), category, index) &&
        (card = FindCardCategory(category)) != nullptr && card->titles[index]) {
        DWORD ourError = GetLastError();
        if (!OpenChestCard(view, reinterpret_cast<void*>(icon), *card, index) && TakeCardLine()) {
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
    if (box && box == cardBox) {
        InterlockedExchange(&cardOpenFlag, 1);
    }
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

// --- v0.103: picture size classes ---
//
// Each element's style has a list of class names, kept as numbers: the game
// turns a name into its number once ("interning") with 0x12becb0
// (&number, name, 1, 0x2ffff), exactly as its own start-up code does for
// "!cpp-none". 0x35ca1b0 / 0x35ca200 (style, &number) add / remove one class
// and restyle the element; both do nothing if the class is already there /
// not there. The layout itself uses them on the card's elements, and an
// element's style is the pointer at element + 0x20. The picture elements are
// the list at box + 0xd0 (count at box + 0xd8; each entry's element at +8),
// the same list the layout gives the picture name.
constexpr bool kCardIconSizeOn = true;
using InternName = void (*)(int* number, const char* name, int create, unsigned capacity);
using ChangeClass = void (*)(void* style, const int* number);
constexpr uintptr_t kInternNameRva = 0x12becb0;
constexpr uintptr_t kAddClassRva = 0x35ca1b0;
constexpr uintptr_t kRemoveClassRva = 0x35ca200;
// Guard bytes read from the executable with pefile (2026-10-24); add and
// remove start with the same 24 bytes.
constexpr BYTE kInternNameGuard[24] = {0x48, 0x89, 0x5c, 0x24, 0x20, 0x44, 0x89, 0x44, 0x24, 0x18, 0x48, 0x89,
    0x54, 0x24, 0x10, 0x48, 0x89, 0x4c, 0x24, 0x08, 0x55, 0x56, 0x57, 0x41};
constexpr BYTE kChangeClassGuard[24] = {0x40, 0x53, 0x48, 0x83, 0xec, 0x20, 0x48, 0x8b, 0x01, 0x48, 0x8b, 0xd9,
    0x48, 0x8b, 0x88, 0xa0, 0x00, 0x00, 0x00, 0x48, 0x85, 0xc9, 0x74, 0x07};
// The class names, matching the add-on's CSS rules (step = 60 + 10 * slot).
constexpr const char* kIconSizeClasses[] = {"pywel-icon-60", "pywel-icon-70", "pywel-icon-80", "pywel-icon-90"};
constexpr size_t kIconSizeCount = _countof(kIconSizeClasses);
InternName internName = nullptr;
ChangeClass addClass = nullptr;
ChangeClass removeClass = nullptr;
volatile LONG iconSizeReady = 0;
// Class numbers, made on the UI thread on first use (layout hook only).
int iconSizeNumbers[kIconSizeCount] = {};
bool iconSizeNumbered = false;
// The box whose picture last got a class, so the next pass on it can take
// the class off again (UI thread only).
void* iconSizedBox = nullptr;

// Layout hook, after the original: gives the card's picture elements the
// class for `step` (60..90) and takes our other classes off; step 0 takes
// all of ours off. Runs for our cards, and for any other card shown in a box
// that had a class, so a game card never keeps one.
void ApplyIconSize(void* box, unsigned step) {
    if (!iconSizeNumbered) {
        for (size_t slot = 0; slot < kIconSizeCount; ++slot) {
            internName(&iconSizeNumbers[slot], kIconSizeClasses[slot], 1, 0x2ffff);
        }
        iconSizeNumbered = true;
    }
    void** entries = nullptr;
    unsigned count = 0;
    if (!Read(static_cast<const BYTE*>(box) + 0xd0, &entries, sizeof(entries)) ||
        !Read(static_cast<const BYTE*>(box) + 0xd8, &count, sizeof(count)) || !entries || count > 8) {
        return;
    }
    size_t wanted = step >= 60 && step <= 90 ? (step - 60) / 10 : kIconSizeCount;
    unsigned changed = 0;
    for (unsigned entry = 0; entry < count; ++entry) {
        void* picture = nullptr;
        void* element = nullptr;
        void* style = nullptr;
        if (!Read(entries + entry, &picture, sizeof(picture)) || !picture ||
            !Read(static_cast<const BYTE*>(picture) + 8, &element, sizeof(element)) || !element ||
            !Read(static_cast<const BYTE*>(element) + 0x20, &style, sizeof(style)) || !style) {
            continue;
        }
        for (size_t slot = 0; slot < kIconSizeCount; ++slot) {
            if (slot != wanted && iconSizeNumbers[slot]) {
                removeClass(style, &iconSizeNumbers[slot]);
            }
        }
        if (wanted < kIconSizeCount && iconSizeNumbers[wanted]) {
            addClass(style, &iconSizeNumbers[wanted]);
        }
        ++changed;
    }
    iconSizedBox = wanted < kIconSizeCount ? box : nullptr;
    if (TakeCardLine()) {
        char line[160];
        _snprintf_s(line, _TRUNCATE, "card picture class=%s elements=%u of %u number=%d",
            wanted < kIconSizeCount ? kIconSizeClasses[wanted] : "none", changed, count,
            wanted < kIconSizeCount ? iconSizeNumbers[wanted] : 0);
        QueueObservation(line);
    }
}

// Hook on 0xf09e70 (box, ...): marks this thread as "inside the card
// layout" while the original runs, so the set-text hook logs every text
// written meanwhile. It also decides once per pass whether this pass lays
// out our card (our box, still showing the key our branch set). The old
// marks are put back afterwards (safe if nested).
uintptr_t ObserveCardLayout(void* box, uintptr_t second, uintptr_t third, uintptr_t fourth) {
    LONG marker = InterlockedCompareExchange(&chestCardIndex, 0, 0);
    LONG layoutChest = -1;
    unsigned index = 0;
    const CardCategory* card = marker >= 0 ? DecodeCardMarker(marker, index) : nullptr;
    if (card && box == chestCardBox && CardKey(box) == card->key) {
        layoutChest = marker;
    }
    bool logged = box == cardBox && TakeCardLine();
    if (logged) {
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card layout enter box=%p key=0x%x caller=0x%llx ours=%s", box, CardKey(box),
            static_cast<unsigned long long>(reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase),
            layoutChest >= 0 ? MarkerName(card->category, index) : "-");
        QueueObservation(line);
    }
    // v0.109: which layout this card's description uses, and its length.
    if (layoutChest >= 0 && TakeCardLine()) {
        unsigned style = 0;
        size_t length = 0;
        CardMarkupFor(*card, index, style, length);
        char line[200];
        _snprintf_s(line, _TRUNCATE, "card markup style=%u%s length=%zu marker=%s", style,
            card->styles && style != kCardStatStyle ? " (fallback, chosen one missing or too long)" : "", length,
            MarkerName(card->category, index));
        QueueObservation(line);
    }
    void* outer = cardLayoutBox;
    LONG outerChest = chestLayoutIndex;
    int outerParagraphs = chestParagraphs;
    bool outerPicture = chestPictureOurs;
    cardLayoutBox = box;
    chestLayoutIndex = layoutChest;
    chestParagraphs = 0;
    chestPictureOurs = false;
    uintptr_t result = cardHooks[kCardLayout].original(box, second, third, fourth);
    DWORD lastError = GetLastError();
    // v0.103: size class for our item icon; none for anything else.
    unsigned step = layoutChest >= 0 && chestPictureOurs && card->iconSteps ? card->iconSteps[index] : 0;
    if (InterlockedCompareExchange(&iconSizeReady, 0, 0) && (step || box == iconSizedBox)) {
        ApplyIconSize(box, step);
    }
    cardLayoutBox = outer;
    chestLayoutIndex = outerChest;
    chestParagraphs = outerParagraphs;
    chestPictureOurs = outerPicture;
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
// first and second description writes (caller kCardDescriptionCaller, one
// element per paragraph) get the item type and the item description. The
// second may be "", which blanks the card's generic chest paragraph. Any
// further paragraph keeps the game's text.
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
    // Our card: swap the title and the description (texts live in
    // tooltip-texts.h for the whole process, so the pointers stay valid).
    const char* ours = nullptr;
    LONG marker = chestLayoutIndex;
    unsigned index = 0;
    const CardCategory* card = marker >= 0 ? DecodeCardMarker(marker, index) : nullptr;
    if (kChestCardOn && card && cardLayoutBox == box) {
        if (element == cardElements[0]) {
            ours = card->titles[index];
        } else if (caller == kCardDescriptionCaller && !InterlockedCompareExchange(&cardMarkupReady, 0, 0)) {
            // Fallback only: with the markup swap in place the game builds
            // the paragraphs from our markup itself.
            int paragraph = chestParagraphs++;
            if (paragraph == 0) {
                ours = card->paragraph1[index];
            } else if (paragraph == 1) {
                ours = card->paragraph2[index];
            }
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

// v0.96, inside a card layout pass only: logs one markup-related call with
// its element (role from the box table), our marker if the pass lays out one
// of our cards, and up to 300 bytes of its text.
void LogCardMarkupCall(const char* kind, uintptr_t caller, void* element, int flag, const char* text) {
    if (!TakeCardLine()) {
        return;
    }
    const char* role = "other";
    for (size_t index = 0; index < kCardElementCount; ++index) {
        if (element && element == cardElements[index]) {
            role = kCardElements[index].role;
            break;
        }
    }
    // Copy the text through Read; near the end of readable memory, shorter.
    char copy[301] = {};
    const char* shown = copy;
    if (!text) {
        shown = "(null)";
    } else if (!Read(text, copy, 300) && !Read(text, copy, 64) && !Read(text, copy, 8)) {
        shown = "(unreadable)";
    }
    copy[300] = 0;
    LONG marker = chestLayoutIndex;
    unsigned index = 0;
    const CardCategory* card = marker >= 0 ? DecodeCardMarker(marker, index) : nullptr;
    char line[400];
    _snprintf_s(line, _TRUNCATE, "card %s caller=0x%llx element=%p role=%s flag=%d ours=%s text=\"%s\"", kind,
        static_cast<unsigned long long>(caller), element, role, flag, card ? MarkerName(card->category, index) : "-",
        shown);
    QueueObservation(line);
}

// v0.98: our description markup for `element`, or nullptr. Only while this
// thread lays out one of our cards (still our box) and only for the card's
// description element (box +0x118): the v0.96 run showed the whole
// description markup reaching exactly that element through format-text and
// then set-markup ("card format-text ... role=description" with "<br/>").
const char* OurCardMarkup(void* element) {
    if (!kChestCardOn || !kCardMarkupOn || !InterlockedCompareExchange(&cardMarkupReady, 0, 0)) {
        return nullptr;
    }
    LONG marker = chestLayoutIndex;
    unsigned index = 0;
    const CardCategory* card = marker >= 0 ? DecodeCardMarker(marker, index) : nullptr;
    if (!card || cardLayoutBox != cardBox || !element || element != cardElements[2]) {
        return nullptr;
    }
    unsigned style = 0;
    size_t length = 0;
    return CardMarkupFor(*card, index, style, length);
}

// Hook on 0x647cb0 (context, text, segments, element), the text formatter's
// first step. v0.98: for our card's description it formats our markup
// instead (OurCardMarkup). Outside a card layout pass it goes straight to the
// original; inside one it also logs the call.
uintptr_t ObserveFormatText(void* context, uintptr_t text, uintptr_t segments, uintptr_t element) {
    if (!cardLayoutBox) {
        return cardHooks[kCardFormat].original(context, text, segments, element);
    }
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    const char* ours = OurCardMarkup(reinterpret_cast<void*>(element));
    uintptr_t sent = ours ? reinterpret_cast<uintptr_t>(ours) : text;
    uintptr_t result = cardHooks[kCardFormat].original(context, sent, segments, element);
    DWORD lastError = GetLastError();
    LogCardMarkupCall(ours ? "format-text sent=ours" : "format-text", caller, reinterpret_cast<void*>(element), -1,
        reinterpret_cast<const char*>(text));
    SetLastError(lastError);
    return result;
}

// Hook on 0x3ed7f90 (element, markup, flag), which builds an element's
// content from markup (one text element per line). v0.98: for our card's
// description it builds our markup instead. Outside a card layout pass it
// goes straight to the original; inside one it also logs the call.
uintptr_t ObserveSetMarkup(void* element, uintptr_t markup, uintptr_t flag, uintptr_t fourth) {
    if (!cardLayoutBox) {
        return cardHooks[kCardMarkup].original(element, markup, flag, fourth);
    }
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    const char* ours = OurCardMarkup(element);
    uintptr_t sent = ours ? reinterpret_cast<uintptr_t>(ours) : markup;
    uintptr_t result = cardHooks[kCardMarkup].original(element, sent, flag, fourth);
    DWORD lastError = GetLastError();
    LogCardMarkupCall(ours ? "set-markup sent=ours" : "set-markup", caller, element, static_cast<int>(flag & 0xff),
        reinterpret_cast<const char*>(markup));
    SetLastError(lastError);
    return result;
}

static_assert(_countof(kChestIconRow) == _countof(kChestLinks) && _countof(kChestIconName) == _countof(kChestLinks) &&
    _countof(kChestIconStep) == _countof(kChestLinks),
    "tooltip-texts.h icon tables must follow kChestLinks");

// v0.101 hook on 0x3d5f80 (string, const char* text), the game's "copy a C
// string into a game string". Outside a card layout pass, and at any call
// site other than the layout's two picture-name copies, it goes straight to
// the original. At the picture-name copies it logs the game's picture name
// and, on our chest card, copies the item icon's name instead.
uintptr_t ObserveNameCopy(void* string, uintptr_t text, uintptr_t third, uintptr_t fourth) {
    if (!cardLayoutBox) {
        return cardHooks[kCardNameCopy].original(string, text, third, fourth);
    }
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    if (caller != kCardPictureReturns[0] && caller != kCardPictureReturns[1]) {
        return cardHooks[kCardNameCopy].original(string, text, third, fourth);
    }
    LONG marker = chestLayoutIndex;
    unsigned index = 0;
    const CardCategory* card = marker >= 0 ? DecodeCardMarker(marker, index) : nullptr;
    bool ours = kChestItemImageOn && InterlockedCompareExchange(&chestImageReady, 0, 0) && card &&
        card->iconNames && card->iconNames[index];
    uintptr_t sent = ours ? reinterpret_cast<uintptr_t>(card->iconNames[index]) : text;
    uintptr_t result = cardHooks[kCardNameCopy].original(string, sent, third, fourth);
    DWORD lastError = GetLastError();
    if (ours) {
        InterlockedIncrement(&chestImageSwaps);
        chestPictureOurs = true;
    }
    if (TakeCardLine()) {
        char gameName[136];
        DescribeCardText(reinterpret_cast<const char*>(text), gameName);
        char line[400];
        _snprintf_s(line, _TRUNCATE, "card picture caller=0x%llx chest=%s game=%s sent=%s",
            static_cast<unsigned long long>(caller), card ? MarkerName(card->category, index) : "-", gameName,
            ours ? card->iconNames[index] : "game");
        QueueObservation(line);
    }
    SetLastError(lastError);
    return result;
}

// Writes `count` bytes at `address` as hex into `out` (for guard logs).
void HexBytes(const BYTE* address, size_t count, char (&out)[80]) {
    out[0] = 0;
    for (size_t index = 0; index < count && index * 3 + 3 < sizeof(out); ++index) {
        char part[4];
        sprintf_s(part, "%02x ", address[index]);
        strcat_s(out, part);
    }
}

// Worker, at start-up: checks each hook's guard bytes and installs it, then
// checks the two functions the chest branch calls. The chest card is
// switched on only if all of its hooks worked; otherwise chests keep the
// label. The two markup hooks (v0.96/v0.98) are optional: without both, our
// cards use the per-paragraph swap with the middle-dot texts. The picture hook
// (v0.100) is optional too: without it the card keeps the game's picture.
void InstallCardHooks(BYTE* base) {
    void* detours[kCardHookCount] = {
        reinterpret_cast<void*>(&ObserveFillGimmickCard), reinterpret_cast<void*>(&ObserveSetCardKey),
        reinterpret_cast<void*>(&ObserveCardLayout), reinterpret_cast<void*>(&ObserveSetElementText),
        reinterpret_cast<void*>(&ObserveFormatText), reinterpret_cast<void*>(&ObserveSetMarkup),
        reinterpret_cast<void*>(&ObserveNameCopy),
    };
    bool allHooks = true;
    bool markupHooks = true;
    bool pictureHook = false;
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
        if (hook < kCardRequiredHooks) {
            allHooks = allHooks && guardOk && status == MH_OK;
        } else if (hook == kCardNameCopy) {
            pictureHook = guardOk && status == MH_OK;
        } else {
            markupHooks = markupHooks && guardOk && status == MH_OK;
        }
        char line[300];
        sprintf_s(line, "Map knowledge card hook %s rva=0x%llx: %s",
            target.name, static_cast<unsigned long long>(target.rva),
            guardOk ? MH_StatusToString(status) : "guard bytes changed, not installed");
        if (!guardOk) {
            // v0.101: what is in memory instead, to see who changed it.
            char found[80];
            HexBytes(address, sizeof(target.guard), found);
            strcat_s(line, "; in memory: ");
            strcat_s(line, found);
        }
        Log(line);
    }
    // v0.101: the v0.100 picture hook target, for the record.
    char lookup[80];
    HexBytes(base + 0x388e00, 24, lookup);
    char lookupLine[160];
    sprintf_s(lookupLine, "Map knowledge card: stringinfo lookup 0x388e00 in memory: %s", lookup);
    Log(lookupLine);

    // The two called functions: only their 5-byte jumps can be compared.
    bool callsOk = memcmp(base + kShowCardBoxRva, kShowCardBoxGuard, sizeof(kShowCardBoxGuard)) == 0 &&
        memcmp(base + kSetCardModeRva, kSetCardModeGuard, sizeof(kSetCardModeGuard)) == 0;
    if (callsOk) {
        showCardBox = reinterpret_cast<ShowCardBox>(base + kShowCardBoxRva);
        setCardMode = reinterpret_cast<SetCardMode>(base + kSetCardModeRva);
    }
    bool ready = kChestCardOn && allHooks && callsOk;
    InterlockedExchange(&chestCardReady, ready ? 1 : 0);
    InterlockedExchange(&cardMarkupReady, ready && kCardMarkupOn && markupHooks ? 1 : 0);
    Log(ready && kCardMarkupOn && markupHooks
        ? "Map knowledge card descriptions: our markup (real line breaks)"
        : "Map knowledge card descriptions: paragraph swap with \" \xc2\xb7 \" texts (markup hooks missing or off)");
    bool image = ready && kChestItemImageOn && pictureHook;
    InterlockedExchange(&chestImageReady, image ? 1 : 0);
    Log(image ? "Map knowledge card picture for chests: the item's inventory icon (route: name-copy hook 0x3d5f80)"
              : "Map knowledge card picture for chests: the game's own (name-copy hook missing or off)");
    // v0.103: the size-class functions, called (not hooked) on the UI thread.
    bool internOk = memcmp(base + kInternNameRva, kInternNameGuard, sizeof(kInternNameGuard)) == 0;
    bool addOk = memcmp(base + kAddClassRva, kChangeClassGuard, sizeof(kChangeClassGuard)) == 0;
    bool removeOk = memcmp(base + kRemoveClassRva, kChangeClassGuard, sizeof(kChangeClassGuard)) == 0;
    if (internOk && addOk && removeOk) {
        internName = reinterpret_cast<InternName>(base + kInternNameRva);
        addClass = reinterpret_cast<ChangeClass>(base + kAddClassRva);
        removeClass = reinterpret_cast<ChangeClass>(base + kRemoveClassRva);
    }
    bool sizes = image && kCardIconSizeOn && internOk && addOk && removeOk;
    InterlockedExchange(&iconSizeReady, sizes ? 1 : 0);
    char sizeLine[300];
    sprintf_s(sizeLine, "Map knowledge card icon sizes (pywel-icon-60..90, needs the UI add-on's rules): %s",
        sizes ? "on" : !image ? "off (no item picture)" : !kCardIconSizeOn ? "off (switch)" : "off (functions changed)");
    if (!internOk || !addOk || !removeOk) {
        char found[80];
        HexBytes(base + (!internOk ? kInternNameRva : !addOk ? kAddClassRva : kRemoveClassRva), 24, found);
        strcat_s(sizeLine, "; first changed one in memory: ");
        strcat_s(sizeLine, found);
    }
    Log(sizeLine);
    char line[300];
    int length = sprintf_s(line, "Map knowledge cards:");
    for (const CardCategory& card : kCardCategories) {
        length += sprintf_s(line + length, sizeof(line) - length, " %s (card 0x%x, %s, picture %s);",
            kCategories[card.category].label, static_cast<unsigned>(card.key), card.on ? "on" : "off",
            card.iconNames ? "item icon" : "game's");
    }
    sprintf_s(line + length, sizeof(line) - length, " overall %s",
        ready ? "on" : !kChestCardOn ? "off (switch)" : !callsOk ? "off (called functions changed)" : "off (a hook is missing)");
    Log(line);
    Log("Map knowledge card state (PywelMapKnowledgeCardState): open flag from card key sets and map focus; "
        "screen rect not available (zeros)");
    char styleLine[160];
    sprintf_s(styleLine, "Map knowledge card stat layout: style %u (0 plain, 1 compact, 2 columns, 3 columns + icons);"
        " effect buff icons %s (need UI add-on v0.80)", kCardStatStyle, kCardBuffIconsOn ? "on" : "off");
    Log(styleLine);
}

// Worker (F8): chest cards opened and lines left in the card budget.
void LogCardCounts() {
    char line[160];
    sprintf_s(line, "card chest opens=%ld, item pictures=%ld, card lines left=%ld",
        InterlockedCompareExchange(&chestCardOpens, 0, 0), InterlockedCompareExchange(&chestImageSwaps, 0, 0),
        InterlockedCompareExchange(&cardLinesLeft, 0, 0));
    Log(line);
}
