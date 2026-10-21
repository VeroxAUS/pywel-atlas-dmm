"""Count the POI categories in the MapGenie snapshot (data/poi-data.js).

What it does:
    Loads the generated POI dataset, then prints one line per category with
    its group, how many locations it has, how many of those have a map
    position (mapLat/mapLng), how many have a unique id, and which worlds and
    how many regions they are spread over. It also prints how many locations
    have a non-empty description. The goal is to see which collectible
    categories are large or small, and which could be linked to save records.
    Read-only: nothing is written.

Key terms:
    POI ("point of interest") - one pin on the community map.
    mapLat/mapLng - the provider's map-grid position, not the game's world
        coordinates. Game positions are only known for linked Bells.

Reads:  data/poi-data.js
Writes: nothing; prints a tab-separated table.
Run:    python -B research/scripts/survey_poi_categories.py
        (from the repository root)
"""
import json
import sys
from collections import Counter, defaultdict
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DATA_PATH = ROOT / 'data' / 'poi-data.js'


def load_dataset(path):
    """Strip the JavaScript wrapper and parse the JSON object inside."""
    text = path.read_text(encoding='utf-8')
    start = text.index('{')
    end = text.rindex('}')
    return json.loads(text[start:end + 1])


def main():
    """Print per-category counts, sorted by group and then by size."""
    data = load_dataset(DATA_PATH)
    groups = {group['id']: group['name'] for group in data['groups']}
    categories = {category['id']: category for category in data['categories']}

    per_category = defaultdict(list)
    for location in data['locations']:
        per_category[location['categoryId']].append(location)

    # Check that every location id is unique across the whole dataset.
    id_counts = Counter(location['id'] for location in data['locations'])
    duplicate_ids = {key for key, count in id_counts.items() if count > 1}

    print('group\tcategory\tcategoryId\tcount\twithPos\tuniqueIds\twithDesc\tworlds\tregions')
    rows = []
    for category_id, category in categories.items():
        locations = per_category.get(category_id, [])
        with_position = sum(
            1 for item in locations
            if isinstance(item.get('mapLat'), (int, float))
            and isinstance(item.get('mapLng'), (int, float))
        )
        unique_ids = sum(1 for item in locations if item['id'] not in duplicate_ids)
        with_description = sum(1 for item in locations if item.get('description'))
        worlds = Counter(item.get('world') for item in locations)
        regions = {item.get('region') for item in locations}
        rows.append((
            groups.get(category['groupId'], '?'),
            category['name'],
            category_id,
            len(locations),
            with_position,
            unique_ids,
            with_description,
            ','.join(f'{name}:{count}' for name, count in worlds.items()),
            len(regions),
        ))

    rows.sort(key=lambda row: (row[0], -row[3]))
    for row in rows:
        print('\t'.join(str(value) for value in row))

    print(f'total locations: {len(data["locations"])}', file=sys.stderr)
    print(f'duplicate ids: {len(duplicate_ids)}', file=sys.stderr)


if __name__ == '__main__':
    main()
