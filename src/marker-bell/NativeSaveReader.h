// NativeSaveReader.h - read the player's save file (read-only) to check Bells,
// (v0.56) Greymane Shrines and (v0.58) treasure chests.
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
    // One bit per known Bell, in the reader's Bell-list order (see
    // FindBellIndex): set when the save records / explicitly completes it.
    unsigned recordedMask;
    unsigned completedMask;
    // Greymane Shrines (v0.56), from a second, independent pass over the
    // save's knowledge list. One bit per shrine in shrine-links.h order.
    // shrinesValid false = unknown (the pass failed; see shrineError): never
    // treat that as "not found". The Bell fields above are unaffected by it.
    bool shrinesValid;
    unsigned shrineCoverage; // How many known shrines this build checks for.
    unsigned shrinesFound; // How many the save marks as found (knowledge level 2+).
    unsigned shrineFoundMask; // Knowledge entry present at level 2 or more.
    unsigned shrineSeenMask; // Knowledge entry present at any level (diagnostic only).
    char shrineError[96]; // Why the shrine pass failed ("" when it succeeded).
    // Treasure chests in the game's dedicated chest levels (v0.58) and caves
    // and dungeons (v0.59; same record type). Read in
    // the same pass and list as the Bells, so they are valid whenever the
    // Bell result is. One bit per chest in chest-links.h order; 8 words hold
    // up to 256 chests (bit i is word i / 32, bit i % 32).
    unsigned chestCoverage; // How many known chests this build checks for.
    unsigned chestsOpened; // How many the save explicitly marks as opened.
    unsigned chestSeenMask[8]; // A record for the chest exists (seen or opened).
    unsigned chestOpenedMask[8]; // That record says _isCompleted = true.
    // v0.68: puzzle strongboxes and surface itemboxes (chest rows with the
    // field rule) are also checked in a third, independent pass over the
    // save's field-object list. A box whose state cannot be decided (that
    // pass failed, or its record looks unlike any studied one) is set in
    // chestUnknownMask: never treat it as "not opened". List-rule chests are
    // never unknown here (they follow the Bell result's validity).
    unsigned chestsUnknown; // How many chests are in chestUnknownMask.
    unsigned chestUnknownMask[8];
    bool chestFieldValid; // The field pass succeeded.
    unsigned chestFieldRecords; // Field records found for field-rule chests (diagnostic).
    char chestFieldError[96]; // Why the field pass failed ("" when it succeeded).
    // v0.69: Abyss chests (chest-links.h kAbyssChestLinks), read in the same
    // pass and list as the Bells, so valid whenever the Bell result is.
    unsigned abyssChestCoverage; // How many known Abyss chests this build checks for.
    unsigned abyssChestsOpened; // How many the save explicitly marks as opened.
    unsigned abyssChestSeenMask[8]; // A record for the chest exists (seen or opened).
    unsigned abyssChestOpenedMask[8]; // That record says _isCompleted = true.
    // v0.79: surface Abyss Nexuses (nexus-links.h). Discovered comes from the
    // Bell pass (key 1000001); activated from the field-object pass (same
    // pass and validity as the field-rule chests). A Nexus whose field record
    // looks unlike any studied one, or every Nexus when that pass failed, is
    // in nexusUnknownMask: never treat it as "not activated".
    unsigned nexusCoverage; // How many known Nexuses this build checks for.
    unsigned nexusesActivated; // How many the save explicitly marks as activated.
    unsigned nexusesUnknown; // How many are in nexusUnknownMask.
    unsigned nexusSeenMask[8]; // Discovered (or any field record exists).
    unsigned nexusActivatedMask[8];
    unsigned nexusUnknownMask[8];
    // v0.95: Abyss-island Nexuses (island-nexus-links.h; the 51 on the Abyss
    // map), the same rule and passes as the surface Nexuses: discovered from
    // the Bell pass (each row's own type key), activated from the field-object
    // pass. Unknown ones are in islandNexusUnknownMask: never treat them as
    // "not activated".
    unsigned islandNexusCoverage; // How many known island Nexuses this build checks for.
    unsigned islandNexusesActivated; // How many the save explicitly marks as activated.
    unsigned islandNexusesUnknown; // How many are in islandNexusUnknownMask.
    unsigned islandNexusSeenMask[8]; // Discovered (or any field record exists).
    unsigned islandNexusActivatedMask[8];
    unsigned islandNexusUnknownMask[8];
    // v0.88: Sealed Abyss Artifacts (artifact-links.h), from a fourth,
    // independent pass over the field-object list. artifactsValid false =
    // unknown (that pass failed; see artifactError): never treat that as "not
    // picked up". An artifact whose field record looks unlike the studied
    // "picked up" shape is in artifactUnknownMask. Other results are unaffected.
    bool artifactsValid;
    unsigned artifactCoverage; // How many known artifacts this build checks for.
    unsigned artifactsPickedUp; // How many the save explicitly marks as picked up.
    unsigned artifactsUnknown; // How many are in artifactUnknownMask.
    unsigned artifactPickedUpMask[8];
    unsigned artifactUnknownMask[8];
    char artifactError[96]; // Why the artifact pass failed ("" when it succeeded).
    // v0.101: quest gates of chests (chest-links.h kChestGates), from a fifth,
    // independent pass over QuestSaveData. Bit g of gateOpenMask = gate g is
    // open (its mission or quest record has state 5, completed). questsValid
    // false = unknown (that pass failed; see questError): never treat that as
    // "gate closed". Other results are unaffected.
    bool questsValid;
    unsigned gateOpenMask;
    // Abyss chests whose gate is closed and that have no seen/opened record
    // (no marker until the quest is done; left out of the F7 total).
    unsigned abyssChestsLocked;
    char questError[96]; // Why the quest pass failed ("" when it succeeded).
    // v0.105: Abyss Cressets (cresset-links.h), from the same quest pass:
    // done = the cresset's challenge mission has a record at state 5
    // (completed); a record at another state = not done yet. A cresset whose
    // mission has no record at all is in cressetUnknownMask (never treated as
    // "not done"). questsValid false makes every cresset unknown.
    unsigned cressetCoverage; // How many known cressets this build checks for.
    unsigned cressetsDone; // How many the save explicitly marks as done.
    unsigned cressetsUnknown; // How many are in cressetUnknownMask.
    unsigned cressetDoneMask[8];
    unsigned cressetUnknownMask[8];
    // v0.108: unique gear (unique-gear-links.h). Reward items from the quest
    // pass's stage list (collected = the reward scene's stage at state 5);
    // ground and quest items from the field pass (collected = a record of
    // the item with reason 2 that never resets). A failed pass (or no stage
    // list) puts its items in uniqueGearUnknownMask: never "not collected".
    unsigned uniqueGearCoverage; // How many known items this build checks for.
    unsigned uniqueGearCollected; // How many the save marks as collected.
    unsigned uniqueGearUnknown; // How many are in uniqueGearUnknownMask.
    unsigned uniqueGearCollectedMask[8];
    unsigned uniqueGearUnknownMask[8];
    // v0.114: Constellations (constellation-links.h), same quest pass and
    // same rule as the cressets: done = the challenge mission's record at
    // state 5; no record = unknown; questsValid false = every one unknown.
    unsigned constellationCoverage; // How many known constellations this build checks for.
    unsigned constellationsDone; // How many the save explicitly marks as done.
    unsigned constellationsUnknown; // How many are in constellationUnknownMask.
    unsigned constellationDoneMask[8];
    unsigned constellationUnknownMask[8];
    // 0.29.0: Hidden Treasure Map pieces (treasure-map-links.h), from the
    // shrine (knowledge) pass: collected = the piece's knowledge entry exists
    // at any level; no entry = not collected yet. shrinesValid false (that
    // pass failed) = every piece unknown.
    unsigned treasureMapCoverage; // How many known pieces this build checks for.
    unsigned treasureMapsCollected; // How many the save marks as collected.
    unsigned treasureMapCollectedMask[8];
    // 0.29.0: Legendary Animals (legendary-animal-links.h), same quest pass
    // and same rule as the cressets: done = the challenge mission's record at
    // state 5; no record = unknown; questsValid false = every one unknown.
    unsigned legendaryAnimalCoverage; // How many known animals this build checks for.
    unsigned legendaryAnimalsDone; // How many the save explicitly marks as done.
    unsigned legendaryAnimalsUnknown; // How many are in legendaryAnimalUnknownMask.
    unsigned legendaryAnimalDoneMask[8];
    unsigned legendaryAnimalUnknownMask[8];
    // 0.29.0: Memory Fragments (memory-fragment-links.h), same knowledge
    // pass and same rule as the Treasure Map pieces: collected = the
    // fragment's knowledge entry exists at any level; shrinesValid false =
    // every fragment unknown.
    unsigned memoryFragmentCoverage; // How many known fragments this build checks for.
    unsigned memoryFragmentsCollected; // How many the save marks as collected.
    unsigned memoryFragmentCollectedMask[8];
    // Sanctum Cores (sanctum-core-links.h), same quest pass as the cressets:
    // done = the Sanctum's Witch mission record at state 5; no record =
    // unknown; questsValid false = every one unknown. A Sanctum with no
    // mission in the game's tables (missionKey 0) is neither done nor unknown.
    unsigned sanctumCoreCoverage; // How many known cores this build checks for.
    unsigned sanctumCoresDone; // How many the save explicitly marks as done.
    unsigned sanctumCoresUnknown; // How many are in sanctumCoreUnknownMask.
    unsigned sanctumCoreDoneMask[8];
    unsigned sanctumCoreUnknownMask[8];
    // Kuku Pot items (kuku-pot-item-links.h), from the artifact (field-object)
    // pass: taken = a record of the exact studied shape; any other record =
    // unknown; none = not taken. artifactsValid false = every item unknown.
    unsigned kukuPotItemCoverage; // How many known items this build checks for.
    unsigned kukuPotItemsTaken; // How many the save marks as taken.
    unsigned kukuPotItemsUnknown; // How many are in kukuPotItemUnknownMask.
    unsigned kukuPotItemTakenMask[8];
    unsigned kukuPotItemUnknownMask[8];
    // Eggs (egg-links.h): the Kuku Pot items' rule on the same artifact pass.
    unsigned eggCoverage; // How many known eggs this build checks for.
    unsigned eggsTaken; // How many the save marks as taken.
    unsigned eggsUnknown; // How many are in eggUnknownMask.
    unsigned eggTakenMask[8];
    unsigned eggUnknownMask[8];
};

// Returns the display name for a chest index ("Hernand chest 8"), or "" if out of range.
const char* ChestName(int index);

// Returns the display name for a shrine index ("Nas River Shrine"), or "" if out of range.
const char* ShrineName(int index);

// Returns the reader's index for a Bell id such as "mg:545680" (Calphade
// Bell), or -1 if this build does not know that Bell.
int FindBellIndex(const char* id);

// Returns the display name for a Bell index ("Calphade Bell"), or "" if out of range.
const char* BellName(int index);

// Explicit selected slot in the sole numeric Steam account directory.
// Selection never implies that this is the slot currently loaded in the game.
// Returns true and fills `summary` on success; on failure returns false and
// writes a short reason into `error`. Also writes diagnostic copies under the
// mod's own folder (`runtimeDirectory`), never into the game's save folder.
bool ReadSelectedBellSave(const wchar_t* runtimeDirectory, unsigned slot, NativeSaveSummary& summary,
    char (&error)[256]);

// Read slot `slot` inside one exact, already validated account folder
// (<LOCALAPPDATA>\Pearl Abyss\CD\save\<digits>, backslashes). `account` is
// that folder's digits, used only for summary.profile. Never searches for or
// guesses an account and writes no files. On success, `modified` is the
// last-modified time of the exact bytes that were decoded. Slow (at least
// 120 ms plus decoding), so call it from a background thread.
bool ReadBellSaveAt(const wchar_t* accountFolder, const char* account, unsigned slot,
    NativeSaveSummary& summary, FILETIME& modified, char (&error)[256]);

// Worker-only OS dialog listing existing saves with local modified timestamps.
// Returns false on cancel/error. Persists selection only under mod AppData.
// (A simple Windows Yes/No/Cancel message box that steps through the saves.)
bool ChooseNativeSaveSlot(const wchar_t* runtimeDirectory, unsigned& slot, char (&error)[256]);

// Returns the slot number remembered from a previous choice (101 if none).
unsigned LoadNativeSaveSlot(const wchar_t* runtimeDirectory);
