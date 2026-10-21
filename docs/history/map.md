# Pywel Atlas online prototype

The main entry point is now **Pywel Atlas.exe** in the parent folder. The HTML entry point remains available for browser backup migration. Keep app/, data/, tools/, and vendor/ beside the executable.

## Maps and locations

The app streams permitted MapGenie map imagery. Pywel and the Abyss have separate cropped views; switching replaces the active layer and remembers each region’s view during the session.

The bundled MapGenie snapshot currently contains **11,342 POIs**, grouped into **117 categories** and **11 groups**: **11,098 in Pywel** and **244 in the Abyss**. Points without an assigned provider region are classified using their map position. All supplied positions fall inside the corresponding map frame. This dataset does not meet the original 70,000+ target; the app reports the actual available count.

Map tiles load online. The POI snapshot is packaged as `poi-data.js`, so the browser can read it even when opening this app as a local file. MapGenie’s API does not provide cross-origin browser access in the inspected response. Updating data therefore uses the refresh helper below rather than a browser request to that API.

## Controls

- Drag to pan; wheel or +/− to zoom. Numbered clusters expand when clicked, and overlapping markers spread out at maximum zoom.
- Search names, descriptions, notes, categories, and region names. Multiple words can appear in any order.
- Expand category groups and use their checkboxes to show or hide an entire group or individual categories. Counts reflect the active region plus search and discovery filters.
- **Show all**, **Hide all**, and **Essentials** provide starting presets. Essentials includes fast travel, selected exploration points, quests, bosses, treasure chests, artifacts, and personal markers.
- Use **All discoveries**, **Not found**, or **Found only** to filter progress. Found status uses unique provider IDs; repeated names remain independent.
- Results load 100 at a time. Click a result to reveal its marker and details. The full matching set remains represented by map clusters.
- Location details include the category, region, provider description, map-grid position, Found control, and a link to the provider entry. Links to other known POIs open their details inside this app.
- Choose **Add personal marker**, click its map position, then enter a name, category, notes, and colour. Personal markers, filters, Found progress, and settings are saved in this browser on this device.
- **Export backup** saves personal markers, progress, filters, settings, and imported custom locations. **Import / restore** merges that backup or a custom location dataset.

## Refreshing the POI snapshot

Run `python tools/refresh-pois.py` from the application root folder, then reload the page. It fetches the permitted public metadata and location feed, validates unique IDs and category links, and replaces `poi-data.js` only after successful normalization. It does not download tile imagery or reference photos. Existing progress and personal markers remain in browser storage and use stable IDs across source updates.

Source attribution is retained on the map and in location details. The snapshot is refreshed manually; it is not a live game-state feed.

## Custom imports and coordinates

`data/locations-import-template.json` shows the import format. `mapLat` and `mapLng` are coordinates in MapGenie’s fictional atlas grid, not real-world GPS or game XYZ. `lat`/`lng` and `latitude`/`longitude` are accepted aliases. Optional game coordinates use `x`, `y`, and `z`; the MapGenie POI feed does not supply these.

Markers from the old reconstructed map without an aligned provider position remain saved and listed, but cannot be drawn accurately on the new map. Ambiguous legacy Found entries based only on a repeated name are not applied to unrelated locations.

## Libraries and remaining integration

The app bundles Leaflet 1.9.4, Leaflet.markercluster 1.5.3, and markdown-it 14.1.0, with their licenses in the corresponding `vendor/` folders. Provider descriptions render with raw HTML disabled; reference images are links rather than automatic downloads.

Live player tracking now has a local Windows bridge, a facing arrow, X/Y/Z readout, Follow player, and separate three-landmark calibration for Pywel and the Abyss. See **player-tracking.md** and open **Pywel Atlas.exe** with the game loaded. Live capture connected to the loaded Steam game and the player confirmed correct dot placement on 21 October 2026. The desktop shell provides always-on-top, global hide/restore, and a compact navigator. Bell save discovery is implemented. Automatic region detection remains pending. Teleportation remains omitted.
