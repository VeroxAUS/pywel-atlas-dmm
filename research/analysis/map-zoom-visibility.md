# World-map icon visibility by zoom (static research)

Build: `CrimsonDesert.exe`, timestamp 1790086912. All addresses are RVAs.
Labels: **static** means read from disassembly only, and **observed** means
seen in an existing trace or reported by the user. Nothing here is
runtime-confirmed unless it is marked observed.

Disassembly is in `research/disasm/map-zoom-*.asm`. It was made with
`research/scripts/disassemble_map_zoom.py`, which notes any constant the
executable holds and flags globals that only get a value at runtime. Cross-references
were found with `research/scripts/find_rip_references.py`.

## Short answer

The game uses **two independent zoom mechanisms** for each icon. Both are
driven by data from the icon's type and template, not by the 24 suppression bits:

1. **Zoom visibility window ("changePoint")** decides whether the icon is shown
   and how opaque it is. This is the likely cause of "disappears / hard to see".
2. **Zoom size curve** (`d91820`, our `ObserveScale`) decides how large the
   icon is drawn. This can make an icon tiny when zoomed out.

## 1. The zoom visibility window (static)

**Where the window comes from (set once, at icon initialisation):**

- `d8a970` (initialisation, our `ObserveInitialize`) calls `d8c4c0` three times,
  at `d8a9a1`, `d8a9b7` and `d8a9cd`. Each call fills a 0x14-byte window on the icon:
  - `icon+0x1f8` comes from UI attribute **`changePoint`** (global name id at `0x6cd0150`).
  - `icon+0x20c` comes from **`iconImageChangePoint`** (`0x6cd0154`), for the image sub-element `icon+0x150`.
  - `icon+0x220` comes from **`iconTextChangePoint`** (`0x6cd0158`), for the text sub-element `icon+0x158`.
  
  The attribute names are registered by the static initialisers at
  `0x14f2e0`, `0x14f300` and `0x14f320` (strings at `0x5669240`,
  `0x5669228` and `0x5668e28`).
- `d8c4c0` reads the attribute from the icon's UI element (`icon+8`, via
  `0x3eda3d0`). If the attribute is present and not empty:
  - It splits the text on spaces, parses 4 numbers into floats `[p0 p1 p2 p3]` at
    window `+0x0..+0xc`, and sets **`window+0x10 = 1` (enabled)**.
  - It sets `window+0x11` from attribute **`needSetOpacity`** (`0x6cd0160`,
    default text `"true"` at `0x55870e0`), which enables opacity fading.
  - If the attribute is missing, the window stays disabled.
- So the window belongs to the **UI template** (the `MapIcon_*` entry in
  `ui/xml/gamemain/template/worldmapicon.thtml`). It is not in the icon-type record.
  The archive reader (pycrimson) is not in this repository, so the per-template
  values could not be read statically.

**Where it is applied (every frame, `d94040`, our `ObserveWorldProjection`):**

- Zoom value: `zoomT = 1 - (ctrl+0xaa0 - G[0x6cab9e8]) / (G[0x6caba88] - G[0x6cab9e8])`
  (`d940bf..d940eb`, kept in `xmm10`). `ctrl+0xaa0` is the map camera distance.
  The two G values are runtime globals with no value in the file.
- Range test `dabae0(ctrl, element, &window, zoomT, ...)`:
  - window disabled (`+0x10 == 0`): returns visible, with no fade.
  - `p0 < zoomT < p1`: fades in, with opacity `(zoomT-p0)/(p1-p0)`.
  - `p1 <= zoomT <= p2`: fully visible.
  - `p2 < zoomT < p3`: fades out.
  - Anywhere else, the result is **invisible**: the element is hidden (`element+0xb4 |= 8`),
    unless `ctrl+0xace == 1`, the first-update flag cleared at `dadc12`.
  - With `needSetOpacity`, it writes the opacity to UI property `0x52` (`dabbc0`).
    This makes the icon faint inside the fade bands.
- Main icon: `d94e79..d94eaa` uses `icon+0x1f8`. Sub-elements: `+0x150` uses
  `icon+0x20c` (`d950f9`) and `+0x158` uses `icon+0x220` (`d95174`). Their results are
  OR-ed into `icon+0x2b9`, written at `d951a9`. If all of them are invisible, the rest
  of the frame's work for that icon is skipped (`d951b1 -> d95dff`).
- **Exemptions** (the window is skipped when `r13b == 0`, set in `d946a5..d94a64`).
  The mode value is `ctrl+0xbf8`:
  - mode 1: categories `0x16`, `0x17`, `0x5a..0x5d`.
  - modes 2/4/5: any of the following:
    - `rec+0xa8 == 2/3`. For actor icons, `icon+0x2b0` holds the per-icon form,
      `(1 << rec+0xa8) | 0x40`, set at `d8b3d0`.
    - `rec+0xbc != 0`.
    - categories `0x1e`, `0x20`, `0x21`, `0x24`, `0x5e`.
    - `icon+0x2b6`, set at `db45d6` and `db51dc`.
    - for tag kind 9, a flag in a looked-up record.
  - `icon+0x2bc > 0` also skips the window (`d94e62`). Its meaning is unknown.
  - mode 3: icons with `rec+0xa8 == 4` use controller-wide windows (`ctrl+0x980` and
    `ctrl+0x994`) and suppression bit 0 instead (`d94d04..d94e58`).
- The map update `dabd10` also applies `icon+0x1f8` to its other icon lists
  (`dacdfa`, `dacfa5`, `dad215` and `dad6aa`).

**Why this fits the chest (observed + static):**

- v0.25 log: the chest "first appeared ONLY AFTER zooming in". Later, it was
  already visible when the map reopened at a remembered zoom.
- The chest has category `0xffffffff`, which is in no exemption list.
- `MapIcon_Gimmick_LevelTreasureBox` is a small local-detail icon, the kind a
  designer would give a zoomed-in-only `changePoint`.
- The personal pin (type 1, category `0x25`) is not in the category exemptions either. Its
  template most likely has no `changePoint` (window disabled), or `rec+0xa8`
  exempts it. This is not confirmed; see section 4.

## 2. Zoom size curve (static)

- Input size `ctrl+0xabc = G[0x6caba38] / ctrl+0xaa0` (`dabe66..dabe90`). This is
  inversely proportional to camera distance. `d94692` calls
  `d91820(icon, ctrl+0xabc, ctrl+0xae4, ctrl+0xa9c)`. `d91660` writes the
  result as the element's X/Y scale (`+0x20` and `+0x28`).
- Branches in `d91820`, read from the icon-type record (`rec`):
  - `icon+0x2b8 == 0` (copied from `rec+0x60` at `d8aa7d`): returns a **constant 1.0**.
  - `rec+0xb5 != 0`: returns the input or `input * rec+0xa4` (the `rec+0xb6` mode
    flag and `icon+0x100` choose between them).
  - otherwise: clamps the size to a **maximum** of `rec+0x8c` and a **minimum** of `rec+0x90`
    (0 means unused). A shrink ramp uses `rec+0x94..0xa0`.
- Observed: v0.25/v0.26 samples gave the chest `calculatedScale = 1.0` at one zoom.
  Either `rec+0x60 == 0` (fixed size) or a clamp applied. Which one is unknown.

`d91480` (called from `d91660`) is only an on-screen test. It hides icons that are
outside the view and does not depend on zoom.

## 3. Options to keep our markers visible at every zoom (ranked)

1. **Switch to an existing icon type whose template has no `changePoint`.**
   - No game-memory writes, and it uses the same creator. First, confirm with the
     runtime log (section 4) that `window+0x10 == 0` for that type. Then repeat the
     `ChestDefinitionReady`-style exact checks for that type: template, category,
     presentation provider `rec+0x68`, and selector/altitude.
   - Candidates seen in traces:
     - `360 MapIcon_Gimmick_Bell_01` and `337 MapIcon_Gimmick_Bell_00`: category `0xffffffff`,
       and the Bell look fits. Risk: confusion with the game's own Bell icons.
     - `336 MapIcon_Gimmick_Campfire`: category `0xffffffff`.
     - `234 MapIcon_Abyss_Ruins`: category `0x20`, exempt only in modes 2/4/5, and has
       an Abyss meaning.
   - Avoid `1 MapIcon_Pin_Marker` (category `0x25` drives personal-pin counting, `d92930`)
     and `3 MapIcon_PathFinderDestination` (navigation).
2. **Turn off the window on our own icons only.**
   - On the map thread, right after our own creation and its exact readback (same
     type, private key `0x5059415400000100+i`, kind `0x15`, world controller), write
     `0` to the window-enabled bytes `icon+0x208`, `icon+0x21c` and `icon+0x230`.
     `dabae0` then always returns visible with no fade.
   - Narrow scope: these bytes are read only at init (`d8c4c0`), so the change stays.
   - Risk: it is a write into a game object, and the field meanings are static only.
     It is a forced-visibility change in the spirit of the existing "never clear
     suppression bits" rule, so it needs the user's explicit approval.
   - Do **not** use `icon+0x2bc`, `icon+0x2b6` or `icon+0x2b0` (other meanings are
     unknown), patch `dabae0` globally, or edit the shared type record, which would
     change every chest.
3. **If size is also a problem: raise the scale for our icons only in
   `ObserveScale`.** For example, return `max(result, 1.0)` when type == 226 and the key
   is in our private range.
   - It changes no memory, only a return value for our own icons.
   - Cost: an identity check every frame for every icon. Check `icon+0xde` first, which
     is cheap. This is only needed if the log shows `rec+0x60 != 0` and a small scale.

## 4. One-run runtime observation build: what to log

Make only copies, taken on the UI thread, with no stored pointers.

- **Once per distinct icon type** (world controller, after the original
  `d8a970` returns):
  - type, category, template name;
  - windows `icon+0x1f8`, `icon+0x20c` and `icon+0x220`, each as 4 floats plus the enabled
    and opacity bytes;
  - `icon+0x2b0`, `icon+0x2b6`, `icon+0x2b8` and `icon+0x2bc`;
  - record bytes `rec+0x60`, `+0x61`, `+0x8c..+0xa4` (floats), `+0xa8`, `+0xb0`,
    `+0xb1`, `+0xb4`, `+0xb5`, `+0xb6` and `+0xbc`, where
    `rec = icons.cache[type]` (same table read as `ChestDefinitionReady`).
  - This alone answers: is the chest window enabled, and what are its values; does the
    pin (type 1) have a window; which candidate types have no window.
- **During the F8 window** (throttled, for our icons plus one pin):
  - `ctrl+0xaa0`, `ctrl+0xabc`, `ctrl+0xa9c`, `ctrl+0xae4`, `ctrl+0xbf8` and
    `ctrl+0xace`;
  - globals `0x6cab9e8` and `0x6caba88`, and the computed `zoomT`;
  - the `ObserveScale` result, `icon+0x2b9` (window result), `icon+0x1eb`
    (on screen), and the hidden flag `(icon+8)->+0xb4 & 8`.
- User sequence: open the map; press F8 at full zoom-in, at middle zoom and at full
  zoom-out; at each step, say whether the markers are visible, faint or gone.
  - Confirmation: the markers disappear exactly when `zoomT` leaves `[p0, p3]` and fade
    inside `[p0, p1]` / `[p2, p3]`.
