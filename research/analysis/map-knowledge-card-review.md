# Map knowledge card for chest markers: static review (2026-10-24)

Question: can hovering one of our chest markers open the world map's
knowledge card (the box with title, picture and description that the game
shows for a discovered Abyss Nexus), filled with the chest's item name, item
type and item description? Scope (user, 2026-10-24): chests only; Bells,
Nexuses and shrines keep the plain label.

Sources: Ghidra export (`research/scripts/ghidra_lookup.py func ...`),
`research/vendor/work/ui-map/worldmapview.*`, traces
`research/traces/pywel-atlas-*-v0.8*.log` and the v0.57+ `world-create`
records. Everything here is static unless marked "trace".

Confidence labels: **confirmed (code)** = read directly in the decompiled
code; **trace** = seen in a game log; **guess** = not checked yet.

## 1. Why the game's own Bell/Nexus icons get the card and ours do not

Map icon object = the `UIGamePlayControlCommon_WorldMapIcon` script object
(constructor `0xd8a510`, initializer `0xd8a970`). Relevant fields:

| Icon field | Meaning | Set by |
| --- | --- | --- |
| `+0xc8` (8 bytes) | tag key (the icon's identity number) | `0xd8a970` from the creation tag |
| `+0xd0` (byte) | tag kind | `0xd8a970` |
| `+0x28c` | key for tag kind 0 | `0xd8a970` (kind 0), `0xdb3340` |
| `+0xd8` | character key for kind 1 / 0x14 (`0xdecca0`, looked up with `0x473f20`) | `0xd8a970`, `0xdb3340` |
| `+0xdc` | short key for tag kind 2 | `0xd8a970`, `0xdb3340` |
| `+0x2b5`, `+0x2b6`, `+0x2b7` | flags | `+0x2b7` by `0xdb4420` |

**Confirmed (code):** `0xdb4420` (called from the icon creation paths
`0xdb3bd0` and `0xdb79e0`) sets `icon+0x2b7 = 1` when the tag kind is `0x0e`
and the icon type record has `+0xab == 0` and `+0xaf == 0`. Tag kind `0x0e`
means "the tag key is a row index of the `LevelGimmickSceneObjectInfo` table".

**Trace:** the game's own Bell icons are created with tag `(n, 0x0e)`, for
example `world-create game type=360 tag=(0x1,0xe) ... template=MapIcon_Gimmick_Bell_01`
(19 records). Native Nexus creations were not logged; they very likely use
the same kind (guess).

Our markers use tag kind `0x15` with key `0x5059415400000300 + i`, so
`0xd8a970` sets none of `+0x28c/+0xd8/+0xdc`, and `0xdb4420` does not set
`+0x2b7`. That is why the v0.84 focus test showed native 234/360 icons going
the detailed way and ours asking for the plain label.

`0xd8c400` ("has detailed tooltip") is true if any of: `+0xd8 != -1`,
`+0xdc != -1`, `+0x28c != -1`, type `+0x2c` is 8, 0x5e, 0x22 or 0x23, type
`+0xae != 0`, or `+0x2b5` / `+0x2b7` set. **Confirmed (code).**

## 2. Which detailed box the map picks (`0xdae3a0`, after the hover delay)

When the hover delay runs out (view `+0xab8`) and `icon+0x2b5 == 0`:

1. `+0x28c`, `+0xdc` set → quest/faction paths (not relevant).
2. `+0xd8 != -1` (character) → `0xdb98e0`: quest box `view+0x5d0`, or the
   plain label with a generic text when the character has no quest data.
3. Otherwise by the type record's group `+0x2c`:
   - 8 → `0xdb9ad0` (NPC box);
   - 0x22 / 0x23 → `0xdba0e0` (knowledge box);
   - 0x5e → the knowledge box from `0x3880a0(icon key)+0xa0` (mode 9);
   - type `+0xae != 0` → box `view+0x5d8` (mode 4);
   - else **`icon+0x2b7 != 0` → `0xdba0e0`** (knowledge box, mode 5).

**`0xdba0e0(view, icon, position)` — confirmed (code):**

- Copies `icon+0x2b6` to `box+0x1a8`.
- Looks up `LevelGimmickSceneObjectInfo[(uint32)icon+0xc8]` (`0x4a2630`).
  That row's `+0x30` (or `+0x3c`, chosen by height against the global at
  `0x6cde048`, the Abyss altitude) is an icon type. The icon type record's
  `+0x30` is a **knowledge key** (short). Kind `0x0f` uses `+0x34` / `+0x3e`.
- Calls `0xf12770(box, &knowledgeKey)`. If the row's `+0x4d` is set, it may
  pick the key from a per-stage list instead.
- Copies a text into **`box+0x3d8`** (the free text line) with `0x3d5f80`.
  For native icons this text is empty.
- Shows the box: `0xdba3f0(view, box)`, then `0xdcf090(view, 5)`.

**`0xf12770(box, &key)` — confirmed (code):** only writes `box+0x160 = key`,
resets the other source fields (`+0x162`, `+0x188`, `+0x18a`, `+0x18e`,
`+0x310`, `+0x3d0`), clears the free text `+0x3d8`, and calls `0xf03800`
(marks the box for refresh). The title, picture and description are built
later from `knowledgeinfo[box+0x160]` (lookup `0x433650`, inside the box's
layout functions such as `0xf0f910` / `0xf10100`). Those functions format
lines with game markup such as `"<br/>[%#]"`. That matches the v0.86 result
that the plain label also reads markup.

So the card is **driven by one knowledge key**. Title, picture and
description all come from that knowledge row, not from the icon.

## 3. Route B for chests: options

### B0. Make our chests look like the game's own (not recommended)

Create chest markers with tag kind `0x0e` and the chest's real
`LevelGimmickSceneObjectInfo` index. The game would then show that chest's
own knowledge card, if it has one. That card would be generic ("Treasure
Chest" lore), not the item. The tag would also collide with the game's own
icon for the same gimmick (same type and tag = "replace"). Not useful.

### B1. Card with a real knowledge row plus our free text line (smallest)

1. On our verified chest icons only, write `icon+0x2b7 = 1` (map thread,
   same place as the zoom-window writes). Then `0xd8c400` is true and the
   focus update routes to `0xdba0e0`.
2. Hook `0xdba0e0`. For our icons (icon pointer in `tooltipIcons`), do NOT
   call the original. The original would index `LevelGimmickSceneObjectInfo`
   with our key `0x300 + i`, an unrelated row: a wrong card, or a crash if
   the index is out of range. Instead do what it does with our own values:
   `0xf12770(box, &K)` with one chosen real knowledge key K, then
   `0x3d5f80(box+0x3d8, ourText)`, `0xdba3f0(view, box)`,
   `0xdcf090(view, 5)`. For everything else, call the original.
3. The plain label hook keeps working for the first moment. The hide path
   for the knowledge box is the game's own.

What the user sees: K's title, picture and description, plus one line of our
text (for example "Witch's Earring (Earring)"), if the layout shows `+0x3d8`
at all (guess; phase 0 must check). K would have to be a neutral entry (for
example a treasure-chest or "unknown" knowledge row); not chosen yet.

Size: 1 hook (`0xdba0e0`, guard bytes needed), 4 game calls on the map
thread, 1 byte write per marker. Risk: medium. `0xdba3f0` / `0xdcf090` are
the same calls the game makes from the same thread with the same view.

### B2. Our own title and description (what the user asked for)

Everything in B1, plus substituting the knowledge row's texts while the box
lays itself out. Possible hook points, from narrowest to widest:

- the box layout functions (`0xf0f910`, `0xf10100`, and the title/picture
  setter, not yet identified): after the original, overwrite the title and
  description elements' text when `box+0x160 == K` and our "showing a chest"
  flag is set;
- `0x433650` (knowledge row lookup): return a copy of K's row with
  different text objects. This is a hot, generic lookup and the text fields
  are probably localized string objects, so this is the riskiest choice.

Picture: comes from the knowledge row, or from the icon type record's
picture (`box+0x310` is set from the gimmick path's `+0x128`). An item icon
would need its texture name from iteminfo (not found yet) and a way to set
an element's background texture (UI call not identified). Treat the picture
as optional; leave K's picture or hide it.

Size: B1 plus 1-2 more hooks and finding the element/text setter
functions. Risk: medium-high (UI text objects, refresh timing:
`0xf03800` defers the layout, so overwrites must happen after the deferred
layout, not right after `0xf12770`).

## 4. Data available per chest item

- Item name: `item.paloc`, first text id in the iteminfo row (189/190).
- Item type: equiptypeinfo key at "end of the name text id + 4" →
  `equiptype.paloc` (179/189; the 10 others are recipes, maps, a document,
  a key). Now in `research/analysis/treasure-chest-contents.json` as
  `itemType`.
- Item description: the second length-prefixed text id in the same iteminfo
  row (usually name id + 1), present in `item.paloc` for **182 of 189**.
  For example: "Plate gloves carrying the hopes for glorious victory. ..."
  Not yet stored by the script.

## 5. Phase-0 logging build to confirm before building B1/B2

Read-only except where marked:

1. On focus of any icon, log `+0xc8`, `+0xd0` (tag kind), `+0x2b5/6/7`,
   `+0xd8`, `+0xdc`, `+0x28c` and the type record's `+0x2c/+0xab/+0xae/+0xaf`,
   for native 234/360/226 icons vs ours. This confirms section 1 for
   Nexuses and the game's own chests.
2. Hook `0xdba0e0` and `0xf12770` (observe only): log the icon, the
   resolved knowledge key, and `box+0x3d8` text, when hovering a native Nexus.
3. Log the knowledge box's element pointers (title `+0xf0`, description
   `+0x118`, wrap `+0x120`) and their text after the deferred layout (next
   map update), to find where title and description live as text.
4. Optional, one marker only (writes memory): set `+0x2b7 = 1` on one of our
   chest icons with the `0xdba0e0` hook in "ours → K + free text" mode, to
   see whether the free text line is visible.

## 6. Recommendation

The plain two-line label ("Treasure Chest" / "Witch's Earring (Earring)")
already delivers the item and its type with no extra risk. The card adds the
description and the native look, but full item text (B2) needs at least two
more hooks into UI layout code and a deferred-refresh workaround. Suggested
order: ship the label; build the section 5 logging build (items 1-3) only if
the user still wants the card; then decide between B1 (free text line only)
and B2.

## 7. v0.89 logging run results (2026-10-24)

Trace: `research/traces/pywel-atlas-v0.89-knowledge-card-phase0.log` (header
v0.89). All four observation hooks installed (`MH_OK`); 13 card lines used
of 600; no marker failures (`failures=0` throughout).

### 7.1 Focus fields, native vs ours (trace)

```
card focus icon=native type=234 tag=(0x8f00000006,0xe) d8=-1 dc=-1 28c=-1 2b5=0 2b6=1 2b7=1
card focus icon=native type=235 tag=(0x100000007,0xe) d8=-1 dc=-1 28c=-1 2b5=0 2b6=1 2b7=1
card focus icon=Chest  type=226 tag=(0x5059415400000364,0x15) d8=-1 dc=-1 28c=-1 2b5=0 2b6=0 2b7=0
```

Section 1 is confirmed. The native Nexus has tag kind `0x0e` and
`+0x2b7 = 1` (and `+0x2b6 = 1`). Our chests have kind `0x15` and all flags
0, so they never reach the card. The native Nexus tag key's low 32 bits
(6) are its `LevelGimmickSceneObjectInfo` row.

### 7.2 Native Nexus card sequence (trace)

```
card set-key caller=0xdba2d3 box=...B000 ours-box=1 key=0x16ed
card fill-gimmick icon=native type=234 tag=(0x8f00000006,0xe) y=620.7 box=...B000 key=0x16ed free=<garbage> thread=map
card layout enter box=...B000 key=0x16ed caller=0xae91ca2
card text role=title caller=0xf0a26d element=...7700 flag=0 in-layout=1 text="Abyss Nexus"
card text role=other caller=0x3eef5a1 element=...1900 flag=0 in-layout=1 text="Nexus imbued with the energy of the Abyss. These somewhat ..."
card layout leave box=...B000
```

- `0xdba0e0` sets key `0x16ed` through `0xf12770` (caller `0xdba2d3`), on
  the map thread.
- The layout `0xf09e70` runs after `0xdba0e0` returns (deferred; its caller
  `0xae91ca2` is in the protected region).
- Exactly two texts are written during the layout:
  - **title**: `0x3ed4e00(box+0xf0, "Abyss Nexus", 0)` from `0xf0a26d`
    (inside `0xf09e70`);
  - **description**: `0x3ed4e00(<child element>, description, 0)` from
    `0x3eef5a1` (UI library code called by the layout; the element is not
    one of the box fields we listed, so it shows as role `other`).
- The picture is not set through `0x3ed4e00`; it comes from the knowledge
  row (not observed).
- `box+0x3d8` is not a plain `char*` at offset 0 (the log shows garbage);
  it is a string object with a different layout. The free-text line was
  empty for the Nexus anyway.

**Static, cross-checked:** the card key is the row number (ordinal) of the
`knowledgeinfo` table: row `0x16ed` = `Knowledge_LevelGimmickIcon_AbyssRuins`
(key 1001031), matching the Nexus card. The game has a ready **Treasure
Chest** knowledge row: `Knowledge_LevelGimmickIcon_Treasurebox` (key
1000079, row `0x16fc`, title text "Treasure Chest"). Its picture is very
likely the chest picture (not checked).

### 7.3 Decision: B2 is possible

1. **Send our chests into the card path:** yes, with two pieces. (a) Write
   `+0x2b7 = 1` on our verified chest icons (map thread, our icons only),
   so `0xd8c400` is true and the focus update calls `0xdba0e0`. (b) Hook
   `0xdba0e0`. For our chest icons, do not call the original (it would read
   `LevelGimmickSceneObjectInfo` row `0x300+i`, an unrelated gimmick).
   Instead do what it does with our values: `0xf12770(box, &0x16fc)`
   (Treasure Chest card), then `0xdba3f0(view, box)` and
   `0xdcf090(view, 5)`, and remember "the card shows chest i". Native
   icons: call the original.
2. **Our own title and description:** yes. Hook `0x3ed4e00` (already
   hooked for logging; the fast path stays pointer compares). While the
   card layout runs for a box that shows one of our chests:
   - title write (element `box+0xf0`) → item name, e.g.
     "Witch's Earring";
   - the description write (first `in-layout` text from caller `0x3eef5a1`,
     or simply any `in-layout` text that is not the title) → for example
     "Earring<br><item description>".

   Both are plain argument swaps; the game keeps laying out and sizing the
   box itself. Item descriptions exist for 182 of 189 named chest items
   (section 4).
3. **Picture:** the Treasure Chest row's picture (a chest) stays. That
   suits the use. An item picture is not planned.

Phase-1 build (v0.9x) changes:

- `MapKnowledgeCard.h`: keep the four hooks. `0xdba0e0` gets the "ours"
  branch above. `0x3ed4e00` gets the two swaps, keyed on a "chest card"
  state set by the `0xdba0e0` branch (box pointer + chest index) and cleared
  when the card is filled for anything else (`0xf12770` called with another
  key) or hidden. `0xf12770` and `0xf09e70` stay observers.
- Marker code: after our chest icon is created and verified, write
  `icon+0x2b7 = 1` (alongside the zoom-window writes).
- Data: a `kChestDescriptions` table (generated like `tooltip-texts.h`,
  from item.paloc; length limit to agree, e.g. 600 bytes).
- Guard bytes for the two newly called functions, `0xdba3f0` and
  `0xdcf090`. `0xdba3f0` is a 5-byte `jmp` stub; check those 5 bytes.
- Keep the plain label as is, so the label appears at once and the card
  after the hover delay, like for native Nexuses.

Risks:

- Calling `0xdba3f0` / `0xdcf090` ourselves. These are the same calls with
  the same view on the same thread as the game's own path; low-medium risk.
- The card's hide/close path is the game's own, so the card should close
  like the Nexus card. The swaps only apply while our state matches the box
  being laid out.
- The Treasure Chest row's picture and layout are not yet seen in game.
- `+0x2b6` (copied to `box+0x1a8` by `0xdba0e0`) is 1 for native Nexuses.
  Its meaning is unknown, so copy the native value (1) in our branch.

## 8. Item picture, formatting and Sealed Artifacts (static, 2026-10-24)

### 8.1 Where the card sets its picture (confirmed in code)

- Layout file: `worldmapview.html` component `KnowledgeInfo`
  (script `UIGamePlayControlKnowledgeDescription`). Its picture is
  `#KnowledgeInfoImage` (script `UIGamePlayControlCommon_Background`,
  inside `#KnowledgeInfoImageWrap`), selected through
  `selector-knowledge-info-texture`.
- In the layout `0xf09e70`, the picture's texture name is a string object
  (`local_2e70`). It is filled with `0x3d5f80(&name, *(record+0x18))`, where
  `record` comes from a string table lookup, and checked with `0x3f34410`.
  The layout then calls, for every picture element in the box's list
  (`box+0xd0`, count `box+0xd8`), **`0xe74740(backgroundElement, &name)`**.
  If the texture does not exist it passes `"cd_knowledgeimage_00000000"`
  instead.
- `0xe74740` = "set this background element's texture by name". It looks
  the name up in the UI texture manager (`0x3f321f0` / `0x3f322d0`, via
  `vtable+0x110` → `+0x311e8`) and stores the texture. It is a 5-byte `jmp`
  stub into the protected region; MinHook can hook such a stub, or the
  call can be intercepted by the existing layout state.
- Texture names are bare names without a path or extension, the same form
  as `textureid(...)` in the CSS. Example: the Treasure Chest card uses
  `cd_knowledgeimage_knowledge_gimmick_treasurebox`
  (`ui/texture/image/knowledgeimage/...dds` in the packs).

**Smallest hook point for another picture:** hook `0xe74740`. While our
chest card is laid out (the same `chestLayoutIndex` state as the text
swaps), pass a name object holding the item's icon texture name; otherwise
call the original unchanged. The name object is a game string (first field
`char*` buffer, then length/flags). The safe way is to copy the caller's
object and only replace its text pointer. A phase-0 log line must confirm
the object's layout first.

### 8.2 Where an item's icon name lives (partly found)

- Item icon textures are in `ui/texture/icon/` (8,067 files). Names are
  like `itemicon_accessory_red_earring` or are prefab renders,
  `ItemIcon_Prefab_CD_PHM_00_Earring_0003`.
- The inventory icon code (`0xf3f4f0` and relatives, fallback
  `"itemicon_unknown"` / `"itemicon_empty"`) gets the name from the
  **`stringinfo` table** (`0x388e00(index)` → `record+0x18` = `char*`). The
  index comes from the item instance through `0x240c800`.
- Not found yet: which field of the iteminfo row holds that stringinfo
  index. A scan for u32 values that point at `itemicon*` strings gave no
  consistent offset. The index may be a 16-bit field, or may go through the
  item's model/appearance (the `ItemIcon_Prefab_*` names follow the
  equipment model names).
- iteminfo rows hold no icon path as text (`.dds` appears only for book
  page textures).

Two ways to finish this: (a) more static work on `0x240c800` (how the item
instance's icon index is derived from iteminfo); or (b) a logging build
that records the name the inventory icon passes to `0x3f321f0` when the
user opens the inventory. (b) only covers items the user owns, so (a) is
needed for full coverage.

### 8.3 Formatting (confirmed in code)

- `0x3ed4e00` (set element text) itself converts `"<br>"` to `"\n"` before
  storing the text. In v0.91, `"Cloak<br>A plate cloak..."` arrived as
  `"Cloak\nA plate cloak..."`, and the description element showed the
  `"\n"` as a space. So the element's style collapses line breaks
  (`white-space: normal`). The description element is
  `#KnowledgeInfoDiscriptionText` (`font-text-caption-minor-beige`, inside
  `item-tooltip-description-wrap`). `"<br/>"` (with the slash) is not
  converted, which is why recipe texts showed it literally.
- Real line breaks inside one paragraph therefore need a style change, not
  code: `white-space: pre-line` on `#KnowledgeInfoDiscriptionText` in
  `worldmapview.css`, through the existing UI file-mod route (like the
  Shrine Icons add-on). It would also apply to native cards; their texts
  contain no `"\n"`, so they should look the same (unchecked).
- Elements of a richer text class take another path: `0x3ed4e00` hands the
  text to `0x3ea8110(element, text, flag)` when the element's class check
  (`vtable+400`, class `0x6d66a80`) passes. That is probably a rich-text
  element that understands markup. The card's description is not such an
  element.
- Styled parts the card already has (all in the same layout):
  - `#KnowledgeInfoTitle` (`font-text-main`): the title, already swapped.
  - `#KnowledgeLevelText` (`font-text-caption-white`, in
    `#KnowledgeLevelWrap`, hidden by default).
  - `#SkillAddInfoWrap`, with title `#SkillAddInfoTitle` (fixed local string
    `UI_Knowledge_HowToLearn_Title`) and description `#SkillAddInfoDesc`
    (`font-text-sub-white`). The game fills it for knowledge rows with
    "how to learn" entries (`0xf10100` loops over the row's `+0x88` → `+0x78`
    list; entry kinds 0/1/2/4/6 pick fixed labels). Extra info lines are
    instanced from the template `SkillTreePanel` / `SkillAddInfoItem` by
    `0xf102a0`.
  - `#KnowledgeInfoConditionText` (red) and `#KnowledgeStageConditionText`.

  Showing these for our chest needs either a knowledge row that has them
  (the Treasure Chest row has none), or making the game show a hidden wrap
  (a CSS state change on that element, as the game does with
  `0x1435ca0a0` / `0x1435caec0`). That is more UI internals than the text
  swap.

### 8.4 Sealed Abyss Artifacts

The same card mechanism fits. `knowledgeinfo` has
`Knowledge_LevelGimmickIcon_SealedAbyssArtifact` at row `0x16fb`. With the
v0.91 pieces generalised per category (flag `+0x2b7` on our verified
type-187 markers, open card key `0x16fb`, swap title/paragraphs), the card
could show `challengeName` as the title and `challengeText` /
`challengeSteps` as the paragraphs from `data/sealed-artifact-links.json`.
That is a data/table change plus a category check, no new hooks.

### 8.5 Options, effort and risk

| Option | What it gives | Effort | Risk |
| --- | --- | --- | --- |
| A. Sealed Artifact card | Card with challenge name and text | Small (tables + category check) | Low (same hooks as chests) |
| B. Line breaks via CSS file mod | `"\n"`/`"<br>"` breaks inside a paragraph | Small (one CSS rule in the UI add-on) | Low; native cards to be eyeballed |
| C. Item picture | The item's icon in the card's frame | Medium: 1 hook (`0xe74740`) + finding the icon name per item (8.2) | Medium: string object layout; icon fit in the round frame |
| D. Styled info lines | "How to learn"-style styled rows | Large: CSS state changes, template instancing | Medium-high |

Recommendation: A and B next (cheap, visible improvements). Then C, starting
with static work on the item → icon name chain, plus a small logging
probe on `0xe74740` to confirm the name object's layout. Skip D unless B
is not enough.

## 9. Why the card has "paragraphs", and how to get more lines (2026-10-24)

### 9.1 What happened with line breaks

- v0.93 add-on (`white-space: pre-line` in `worldmapview.css`): the game
  failed to load the world map view at start-up and crashed (DMM: "Load
  error, no mod matched", `UIHtmlLoader::preOpen` for
  `WorldMapMercenarySkillInformationColumnList` and `FactionNodeInfo`). The
  game's style files only use `normal`, `nowrap` and its own `pa-break`.
- v0.94-test add-on (`white-space: pa-break`): loads fine, but no line
  breaks. The CSS route is dropped; the add-on is back to shrines only.
- v0.94 mod: lines inside a paragraph are joined with " · " as a stopgap.

### 9.2 How the description becomes paragraphs (confirmed in code and data)

- Knowledge descriptions are **markup**. The Treasure Chest row (`0x16fc`)
  has the description "A mysterious chest hidden from prying eyes.<br/>It
  may hold a bandit's plunder, ...". It holds one `<br/>`, i.e. two text
  nodes.
- The UI parses that markup into a node tree. `0x3eefde0` walks the tree:
  element nodes (type 1, e.g. `<br/>`) are handled by `0x3eea4a0` and their
  children are visited; **every text node (type 2) becomes its own text
  element** through `0x3eef440` (create element `0x3ed3dd0`, set its text
  with `0x3ed4e00` — return address `0x3eef5a1`, the "description" caller in
  our logs — then append it with `0x3ed5b40`).
- So the number of "paragraphs" is the number of text nodes in the
  borrowed row's description, and the line break between them comes from
  the `<br/>` element itself. A `"\n"` inside one text node is just a space.
- Consequence for v0.93/v0.94: the Sealed Abyss Artifact row (`0x16fb`)
  has a one-sentence description with **no** `<br/>`. Only one paragraph is
  written, so our artifact paragraph 2 ("Reward: ...") is never used. The
  title and paragraph 1 (the challenge) do show.
- Row statistics (knowledgeinfo descriptions in English, by `<br/>` count):
  0: 5,220; 1: 518; 2: 140; 3: 35; 4: 231; 5: 118; 6: 59; 7: 81; 8: 134 ...

### 9.3 Ways to get any number of lines, ranked by risk

1. **Swap the description markup before it is parsed (best, low risk once
   found).** If the layout hands the whole description markup to one "set
   markup" call, a hook there can pass our own markup for our card. The
   candidates are `0x3ed7f90(element, markup, flag)` (26 callers; also used
   by the info-line builder `0xf102a0` with flag 1) or `0x3d2ce00`. Our
   markup would be, for example, "Footwear<br/>Plate boots of ...", or
   "A recipe ...<br/>[Effect] ...<br/>※ When made ...", or "Step 1<br/>Step 2<br/>...<br/>Reward: ...".
   The game then builds the elements and line breaks itself, any count, and
   the paragraph swaps in `0x3ed4e00` can go. **Not yet confirmed which call
   carries the description**: `0xf09e70` does not call `0x3ed7f90` directly.
   A small logging step settles it: in the layout pass, log every
   `0x3ed7f90` / `0x3d2ce00` call with its text (observe-only, same pattern
   as v0.89).
2. **Borrow a row with more text nodes (medium).** Pick, per category, a
   knowledgeinfo row whose description has enough `<br/>` (e.g. 4-5 for
   artifacts), ideally with a fitting picture, and fill paragraphs 1..N
   through the existing `0x3ed4e00` swap (unused ones as ""). Downsides: the
   picture changes to that row's, an empty paragraph may still leave a gap,
   and the count is fixed per row.
3. **Call the paragraph builder ourselves (high risk).** Calling
   `0x3eef440` / `0x3ed3dd0` with the builder state from inside the layout
   means using game UI internals outside their normal call path. Not
   recommended.

Recommendation: a v0.95 logging step for option 1 (one Thomas run: hover
one of our chests and a native Nexus), then build the markup swap. Until
then v0.94's " · " joins stay, and artifact rewards are not shown.
