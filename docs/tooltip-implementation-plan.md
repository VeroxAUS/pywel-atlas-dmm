# Map tooltips for Pywel Atlas markers: implementation plan

Written 2026-10-22, after a read-only study of the game executable. Nothing
here has been built or run yet. All addresses are RVAs (offsets inside the
executable) for the build the mod already checks: timestamp `1790086912`,
image size `389722112` (`src/marker-bell/category-profile.h`). If the game
updates, every address and offset below must be found again.

Evidence types used below:

- **static**: read from the disassembly or the game files, not seen at runtime;
- **measured**: computed from the game files with a script;
- **runtime**: must be confirmed in the game (open questions).

## 1. Goal

When the player moves the map cursor onto one of our chest markers, the
game's own small map label appears beside the cursor with our text, for
example:

```
Treasure Chest
Light of the Battlefield Plate Gloves
```

Later, a short location hint can be added (see Phase 3). Bells may get a
label too (see Phase 4).

## 2. How the game shows map tooltips (static)

Saved disassembly: `research/disasm/map-tooltip-*.asm`. Comments in those
files give the text or the "interned UI name" behind each global. An
interned name is a text name the game turns into a small number once at
startup, such as `tooltip` or `selector-worldmap-tooltip`.

### 2.1 The world map view and its tooltip boxes

The world map view object (its `WorldMapView` component) keeps five tooltip
boxes, found in its setup function `0xda18f0`:

| View offset | Selector name | What it is |
| --- | --- | --- |
| `+0x5d0` | (quest tooltip selector) | Quest box |
| `+0x5d8` | `selector-worldmap-npc-tooltip` | NPC box |
| `+0x5e0` | `selector-worldmap-tooltip` | **Plain text label** (`WorldMapTooltip`) |
| `+0x5e8` | `selector-worldmap-knowledge-tooltip` | Knowledge box (title, picture, description) |
| `+0x5f0` | (faction node selector) | Faction node box |

The plain label's layout is in `ui/xml/gamemain/play/worldmapview.html`,
component `WorldMapTooltip`, and its style in `worldmapview.css`
(`.cpp-worldmap-tooltip`). It is a small ink label beside the cursor
(`transform: translate(10px,-44px)`). It sizes itself to its text
(`width: auto; height: auto`) and allows wrapping (`white-space: normal`),
with centred white caption text.

### 2.2 How the map picks a tooltip (`0xdae3a0`, the map focus update)

1. Each update it finds the icon under the map cursor. The view keeps the
   focused icon at `+0x5c0`.
2. When focus moves to a new icon, it calls `0xd8c400(icon)`, "has a
   detailed tooltip?". The entry is a jump to `0xaab0410`. It returns true
   if any of these hold (icon fields; "type record" is the icon type's data,
   from `0x537250(icon + 0xde)`):
   - `icon+0xd8 != -1`, `icon+0xdc != 0xffff` or `icon+0x28c != -1`;
   - type record `+0x2c` (category) is `8`, `0x5e`, `0x22` or `0x23`;
   - type record `+0xae != 0`, or icon `+0x2b5` / `+0x2b7` is set.
3. **If true** (quest, NPC, landmark icons and so on): after a short hover
   delay (`view+0xab8`) it fills one of the detailed boxes (`0xdb9ca0`,
   `0xdb9ad0`, `0xdb98e0`, `0xdba0e0`, …).
4. **If false** (plain icons such as chests): at `0xdaecd5` and `0xdaece7`
   it calls **`0x3edd6b0(icon->element)`** (the element is the pointer at
   `icon + 8`). If the result is a non-empty text, it shows the plain label
   straight away:
   `0xdba3f0(view, label)`, then `0x3d5f80(label + 0xd0, text)` (copies the
   text into the game's own string), `0xf03800(label)` (refresh),
   `0xdcf090(view, 0)`.

### 2.3 The function we would hook: `0x3edd6b0`

It is 116 bytes. It returns the element's **`tooltip` attribute** text
(name global `0x6d67038`). It looks in the element's own attributes
(`element+0xe0`), then in its template's (`element+0xa0` → `+0x68`). It
returns a `const char*` or null.

- No world-map icon template sets `tooltip=` (checked in
  `worldmapicon.thtml`), and no game code writes it. So chests show no label
  today.
- `0x3d5f80` measures and copies the text byte by byte (`strlen` style), so
  the text is a NUL-terminated byte string. Use UTF-8, like the game's text
  files.

Guard bytes (first 24 bytes at `0x3edd6b0`):

```
0x40 0x53 0x48 0x83 0xec 0x20 0x48 0x8b 0x99 0xa0 0x00 0x00
0x00 0x48 0x85 0xdb 0x74 0x07 0x48 0x83 0x7b 0x08 0x00 0x75
```

### 2.4 Everyone who calls `0x3edd6b0` (static)

The return address is the instruction right after each call. The hook can
tell callers apart with `_ReturnAddress()`.

| Call site | Return address | Function | What the caller does |
| --- | --- | --- | --- |
| `0xdaecd5` | `0xdaecda` | `0xdae3a0` | Focus gained: is there text? |
| `0xdaece7` | `0xdaecec` | `0xdae3a0` | Focus gained: fetch the text and show the label |
| `0xdae66b` | `0xdae670` | `0xdae3a0` | Focus leaving: if the old icon had text, **hide** the label |
| `0xdaaea7` | `0xdaaeac` | `0xdaad10` | Focus cleared: hide if it had text |
| `0xda85c8` | `0xda85cd` | `0xda84b0` | Focus cleared: hide if it had text |
| `0xdb90e9` | `0xdb90ee` | `0xdb8a60` | Icon removal (the removal function we already call): hide if the removed icon was focused |
| `0xdb5580` | `0xdb5585` | `0xdb5510` | Reads an icon's text and keeps the pointer (purpose unknown; maybe pins or route names) |
| `0x3ea320a` | `0x3ea320f` | `0x3ea30e0` | Generic UI code (not map-specific) |
| `0x3f1fa02` | `0x3f1fa07` | `0x3f1f9c0` | Generic UI hover change (maybe the general mouse tooltip) |

The hide callers matter: if the hook says "no text" there while our label is
up, the label could stay on screen.

### 2.5 The knowledge box (not used in this plan)

Component setup `0xf06e20`, method table at `0x56bb100`. Fields: title
element `+0xf0`, description text element `+0x118`, description wrap
`+0x120`, knowledge key `+0x160`, worldmap flag `+0x1ba`, free text line
`+0x3d8`. `0xf12770` fills it from a knowledge key. Showing our own title and
description there would need us to call the game's UI functions or fake a
knowledge key. Keep it as a later option only if the plain label is too
limited.

## 3. Design

### 3.1 Idea

Hook `0x3edd6b0`. Call the original first. If it returned nothing and the
element belongs to one of our verified markers, return a pointer to that
marker's text, which is stored in our DLL. The game then does all the
showing, positioning and hiding itself.

- The hook writes no game memory.
- It calls no new game functions. It only uses `worldLookup`
  (`kInspectSites[3]`), which the map thread already calls every update.
- Our texts are compile-time constants in the DLL. The DLL is never unloaded,
  so every pointer the game keeps (including `0xdb5510`'s copy) stays valid.
- It changes what a game function returns, so it needs the user's OK before
  it is built (CLAUDE.md implementation boundaries).

### 3.2 Knowing which element is ours (map thread only)

- New map-thread table: `void* markerElement[kCategoryCount][kMaxCategoryMarkers]`.
- In `ServiceMarkers`, when a marker is present, wanted and passes
  `IsCategoryMarker`, read `icon + 8` and store it. Do this in the existing
  "Wanted and present" branch, next to `DisableZoomWindows(icon)`.
- Clear the entry when `worldLookup` returns null for that marker (it is
  gone, for example after a load).
- On removal by us: put the element in a map-thread variable
  `removingElement` before `removeWorldIcon`. Clear it and the table entry
  only after removal returns. During removal, the game asks the hook about
  that element (`0xdb90ee`) and must get our text, so it hides the label.
- Also keep `mapController` (last controller seen in `ObserveWorldMapUpdate`,
  map thread only) and `mapThreadId`.

The table is only read and written on the map thread. Phase 0 must confirm
that the hook runs on that same thread (see 4.1). If it does not, the table
needs an `SRWLOCK`, and the hook must not call `worldLookup`.

### 3.3 Hook rule per caller

| Caller group | Return addresses | Rule when the element is in our table |
| --- | --- | --- |
| Show | `0xdaecda`, `0xdaecec` | Check it again: `worldLookup(mapController, type, our key)` must return an icon whose `+8` equals this element, and `IsCategoryMarker` must pass. Then return our text. |
| Hide | `0xdae670`, `0xdaaeac`, `0xda85cd`, `0xdb90ee` | Return our text without the re-check. A wrong "yes" here only hides a label, which is harmless. It never re-reads a possibly freed icon. |
| Other | `0xdb5585`, `0x3ea320f`, `0x3f1fa07`, anything else | Phase 1: return the original result (no change). Decide after the Phase 0 log. |

Always return the original result if:

- the original returned non-empty text;
- the call is not on the map thread;
- the element is not in the table;
- tooltips are switched off;
- the re-check fails.

Save and restore `GetLastError()` around our own code, because `Read` uses
`ReadProcessMemory` (CLAUDE.md: preserve LastError).

Matching cost: a linear scan of up to about 170 pointers. The show and hide
callers only run when focus changes, so this is cheap. The generic callers
may run more often; skip the scan for them unless Phase 0 shows it is needed.

### 3.4 Sketch (style of `NativeMapCategoryProbe.cpp`)

```cpp
// The game's "tooltip text of a UI element" function (0x3edd6b0). It returns
// the element's tooltip attribute, or null.
using GetTooltipText = const char* (*)(void* element);
GetTooltipText originalGetTooltipText = nullptr;

// Return addresses inside the map code (2.4). "Show" callers display the
// text; "hide" callers only ask whether a label must be hidden.
constexpr uintptr_t kTooltipShowReturns[] = {0xdaecda, 0xdaecec};
constexpr uintptr_t kTooltipHideReturns[] = {0xdae670, 0xdaaeac, 0xda85cd, 0xdb90ee};

// Hook on 0x3edd6b0: gives our own map markers a tooltip text. The game
// itself then shows its plain map label with that text.
const char* ProvideTooltipText(void* element) {
    const char* text = originalGetTooltipText(element);
    if (text && text[0]) {
        return text; // The game already has a text: never replace it.
    }
    DWORD lastError = GetLastError();
    uintptr_t caller = reinterpret_cast<uintptr_t>(_ReturnAddress()) - imageBase;
    const char* ours = OwnTooltipFor(element, caller); // 3.2 / 3.3 rules
    SetLastError(lastError);
    return ours ? ours : text;
}
```

Install it like the minimap hook (`kMinimapUpdateRva`/`kMinimapUpdateGuard`):
compare the 24 guard bytes, then `MH_CreateHook` and `MH_EnableHook` on that
one address. In the combined build, MinHook is already set up by
`PywelAtlas.cpp`. If the guard fails, log it and skip only the tooltip
feature; the markers keep working.

## 4. Phases

Build each phase as a test build first (with `build.ps1`). The game must be
closed before swapping the ASI. Keep traces in `research/traces/` as usual.

### 4.1 Phase 0: observe only (no visible change)

The hook always returns the original result and only counts and logs.

Log per call, rate-limited (for example the first 200 lines, then counts
only on F8):

- the return address (or "other");
- the thread id, compared with the map-update thread id;
- whether the element is in our table (category, index, name);
- the original result (null, empty or text).

User test:

1. Open the map.
2. Put the cursor on several of our chest markers, on the game's own
   opened-chest icons, on a Bell marker of ours and on a native Bell.
3. Move away again.
4. Press F10 while hovering one of our markers, then F6.
5. Close the map and press F8.

Questions this answers:

1. Do our chest markers get focus at all? Look for show-caller lines with our
   element.
2. Does the hook run on the map-update thread?
3. Which other callers see our elements (`0xdb5510`, generic UI)?
4. Do our Bell markers reach the plain-label path? If not, `0xd8c400` returns
   true for type 360, so Bells use a detailed box instead.

Stop and rethink if question 1 is "no". See section 6, risk 1.

### 4.2 Phase 1: fixed text

Return a fixed text for every chest marker: `"Treasure Chest"`, plus the
marker name from `chest-links.h` for testing (for example
`"Treasure Chest\nCrimson Desert chest 1"`). The name makes it easy to
check that each label belongs to the right marker.

Check in game:

- [ ] Label appears on our chest markers, at every zoom, with mouse and with
      controller.
- [ ] Label disappears when the cursor leaves.
- [ ] Hover a marker, press F10: the marker goes and the label goes too.
- [ ] Open a chest, save: the marker is removed and no label is left.
- [ ] Load another save while the map is closed, then reopen the map:
      labels match the new markers.
- [ ] The game's own icons (opened chests, Bells, quests) behave exactly as
      before.
- [ ] No second tooltip anywhere else (generic UI callers).
- [ ] Does `\n` make a second line? If not, use `" - "` between parts.
- [ ] Very long text: does it wrap nicely, or must lines stay short?

### 4.3 Phase 2: chest contents from the game's own files

**Measured chain** (works for all 120 chest-level chests):

1. In the chest's level file, the chest object has a
   `GimmickSpawnDataComponent` with `_spawnReason`, for example
   `Drop_Demian_PlateArmor_Gloves_II`.
2. Drop the `Drop_` prefix. The rest is an item row name in `iteminfo`,
   for example `Demian_PlateArmor_Gloves_II` (key `2600032`).
3. That item row holds the English text id as a length-prefixed digit
   string just after the name, for example `11167052408553584`.
4. `item.paloc` (the English item text file, extracted copy in
   `research/vendor/work/eng/item.paloc`) has entries of the form
   `[8 bytes][u32 length][id digits][u32 length][UTF-8 text]`, giving
   "Light of the Battlefield Plate Gloves".

Result of a quick test: 120 of 120 chest-level chests named. Spot checks
match MapGenie (chest 1 = Light of the Battlefield Plate Gloves, chest 2 =
Radiant Plate Boots).

Work:

1. New research script `research/scripts/find_chest_contents.py`. It reads
   each chest's level (the `level` field in `data/treasure-chest-links.json`)
   through pycrimson, `iteminfo` (with the `load_table` helper in
   `classify_chest_gates.py`) and `item.paloc`.
   - It writes `research/analysis/treasure-chest-contents.json`. Per chest:
     UUID, `_spawnReason`, item key, item internal name, English name, and a
     status (`named` / `no spawn reason` / `no item row` / `no text`).
   - It covers the 44 cave and dungeon chests too. They are not in the six
     chest levels, so read the level named in their row.
   - If a `_spawnReason` does not map after dropping `Drop_`, fall back to
     the drop table (`dropsetinfo`). Its row names read
     `Item(<internal name>,…)`. Otherwise report it and do not guess.
2. `research/scripts/export_chest_links.py`: add a `contents` field
   (English item name) to each row of `data/treasure-chest-links.json`.
   Keep the row order, because marker keys come from row numbers.
3. `src/marker-bell/prepare_chest_links.py`: add `const char* tooltip` to
   `ChestLink`. Build the text, for example
   `Treasure Chest\n<item name>`, and write it as an escaped C string (all
   non-ASCII bytes as escapes, so the header stays plain ASCII). Fail if any
   text is empty or longer than an agreed limit (for example 120 bytes).
4. The hook returns `kChestLinks[index].tooltip`.

Notes:

- MapGenie sometimes lists a second, common item (for example "Refined
  Palmar Pill"). That probably comes from a shared extra drop, not from
  `_spawnReason`. Version 1 shows only the main item.
- Only English for now. Other languages would need the same `.paloc` file
  per language and a way to know the game's language. Later.

### 4.4 Phase 3: location hints (needs a decision first)

Options:

| Option | Source | Gives | Concern |
| --- | --- | --- | --- |
| A | Game data: nearest named place (knowledge or region names in the `.paloc` files, with positions from the game's tables) | "Near Castlewood Ruins" | Needs research to link names to positions |
| B | MapGenie place names only (the `Locations` group in `data/poi-data.js`), nearest within N metres | "Near Castlewood Ruins" | Names are facts, low risk; positions are about 35 m accurate |
| C | Hand-written hints, new file `data/treasure-chest-hints.json` (UUID → short hint) | "Inside the waterfall cave" | Manual work per chest |
| D | MapGenie "Location:" descriptions | Full sentences | Their community's writing. Fine for personal use; do not ship in a public mod |

Suggestion: A or B automatically for every chest, plus C to override
individual chests. D only in a private build, if at all.

### 4.5 Phase 4 (optional)

- Filter panel: an "Show tooltips" switch saved with the other choices
  (`src/pywel-atlas/MarkerFilter.h`, `FilterPanel.cpp`). The hook reads one
  shared flag.
- Bells: use the plain-label path only if Phase 0 shows Bells reach it.
  Text: the Bell name and "not rung yet".
- Shrines: once shrine markers are working again.

## 5. Files to change (summary)

| File | Change |
| --- | --- |
| `src/marker-bell/NativeMapCategoryProbe.cpp` | Tooltip hook, guard, install/remove in the combined build; element table and `removingElement` in `ServiceMarkers`; `mapController` / `mapThreadId` in `ObserveWorldMapUpdate`; F8 log lines and counters |
| `src/marker-bell/chest-links.h` (generated) | `tooltip` text per chest |
| `src/marker-bell/prepare_chest_links.py` | Builds and checks the texts |
| `research/scripts/find_chest_contents.py` (new) | Chest → item name research output |
| `research/scripts/export_chest_links.py` | Adds `contents` to the data file |
| `data/treasure-chest-links.json` (generated) | `contents` field |
| `src/pywel-atlas/MarkerFilter.h`, `FilterPanel.cpp` | Phase 4 switch only |
| Startup log line in `NativeMapCategoryProbe.cpp` | Mention tooltips and the version |

## 6. Risks and fallbacks

1. **Our markers never get focus.** The focus picker (`0xdadcd0`, and
   `0xd95eb0` per layer) was not fully read. If Phase 0 shows no show-caller
   calls for our elements, study why native chest icons get focus and ours
   do not (layer, container, a type flag). Last resort: the ImGui label
   drawn by our Present hook.
2. **The label sticks after leaving or removing.** Covered by the hide-caller
   rule and `removingElement`. If the game removes our icon itself while it
   is focused (map rebuild), our table may already be cleared. Check this in
   Phase 1 by loading a save while the map is open.
3. **Second tooltip from generic UI.** Keep the generic callers unchanged
   unless Phase 0 shows our elements reach them.
4. **`\n` not supported, or long text clipped.** Use one short line with
   `" - "`, and keep texts short.
5. **The hook runs on another thread.** Then guard the table with an
   `SRWLOCK`. The re-check must not call `worldLookup` off the map thread;
   use only the table and the hide-only rule.
6. **Game update.** The guard bytes fail, the tooltip feature switches off
   and the markers keep working. The addresses must be found again (see 7).

## 7. Re-finding the addresses after a game update

- `0x3edd6b0`: the only function that uses the `tooltip` name global
  (found through the interned-name start-up stubs; the stub pattern is
  `lea rdx, "tooltip"`, `lea rcx, <global>`, `jmp 0x12becb0`). It is
  also the function called right before `0xdba3f0` with the plain label
  `view+0x5e0` in the focus code.
- Map focus code: the function that stores the focused icon at the view's
  focus field and calls the tooltip boxes. Find it from the
  `selector-worldmap-tooltip` and `selector-worldmap-knowledge-tooltip`
  names (setup function binds them to view offsets).
- Return addresses: the calls to the getter in that code (see 2.4).
- `research/scripts/disassemble_map_zoom.py` and
  `find_rip_references.py` do most of this work. The `map-tooltip-*.asm`
  files show what each piece looks like in this build.
