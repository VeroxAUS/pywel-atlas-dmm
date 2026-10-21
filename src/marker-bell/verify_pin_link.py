"""Verify a native proof-pin receipt against an explicitly selected save.

This reads stable copies only. A matching selected save does not establish which
save is currently loaded by the game; consumers must not infer that from time.
"""

import argparse
import hashlib
import json
import math
from pathlib import Path
import re
import sys

TOOLS = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(TOOLS))
from save_reader import decode, stable_copy


def verify(receipt, objects):
    """Require one exact saved key and matching creation evidence attributes."""
    if receipt.get("schemaVersion") != 1 or receipt.get("status") != "candidate":
        raise ValueError("Unsupported ownership receipt")
    if receipt.get("poiId") != "mg:543894" or receipt.get("pinGroup") != 0:
        raise ValueError("This proof supports only the ordinary Hernand Bell pin")
    key_text = receipt.get("pinKey")
    if not isinstance(key_text, str) or not re.fullmatch(r"0|[1-9][0-9]*", key_text):
        raise ValueError("Pin key must be an unsigned decimal string")
    key = int(key_text)
    if key >= 2**64:
        raise ValueError("Pin key exceeds uint64")
    position = receipt.get("position")
    if not isinstance(position, list) or len(position) != 3 or not all(
        type(value) in (int, float) and math.isfinite(value) for value in position
    ):
        raise ValueError("Invalid receipt position")
    for field in ("shapeIndex", "colorIndex"):
        value = receipt.get(field)
        if type(value) is not int or not 0 <= value <= 255:
            raise ValueError(f"Invalid {field}")

    containers = [obj for obj in objects if obj.get("__pycr_type__") == "ContentsMiscSaveData"]
    if len(containers) != 1:
        raise ValueError("Ambiguous pin save container")
    pins = containers[0].get("_pinMarkerDataList")
    if not isinstance(pins, list):
        raise ValueError("Unsupported saved-pin structure")
    # An absent uint64 property may be an omitted default. Do not normalize it
    # to a guessed ID here; the current proof receipt has an explicit key of 2.
    matches = [pin for pin in pins if type(pin.get("_uiIconKey")) is int
               and pin["_uiIconKey"] == key]
    if len(matches) != 1:
        raise ValueError("The selected save must contain exactly one explicit matching pin key")
    pin = matches[0]
    if pin.get("_iconPosition") != position:
        raise ValueError("Saved pin position changed; ownership is not adopted")
    if pin.get("_shapeIndex") != receipt["shapeIndex"] or pin.get("_colorIndex") != receipt["colorIndex"]:
        raise ValueError("Saved pin style changed; ownership requires review")

    discoveries = [obj for obj in objects
                   if obj.get("__pycr_type__") == "DiscoveredLevelGimmickSceneObjectSaveData"]
    if len(discoveries) != 1:
        raise ValueError("Unsupported Bell discovery container")
    bell_uuid = [1601869702, 1450446765, 1450142268, 0]
    bells = [row for row in discoveries[0].get("_discoveredLevelGimmickSceneObjectSaveDataList", [])
             if row.get("_sceneObjectUuid") == bell_uuid
             and row.get("_levelGimmickSceneObjectInfoKey") in range(1000115, 1000120)]
    completed = any(row.get("_isCompleted") is True for row in bells)
    return {
        "poiId": "mg:543894",
        "pinKey": key_text,
        "pinGroup": 0,
        "savedPinMatch": True,
        "position": position,
        "shapeIndex": receipt["shapeIndex"],
        "colorIndex": receipt["colorIndex"],
        "bellState": "completed" if completed else "discovered" if bells else "unrecorded",
        "completionConfirmed": completed,
        "recommendedDisplay": "completed" if completed else "normal",
        "loadedSaveDetected": False,
        "automaticGameChangesEnabled": False,
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--profile", required=True)
    parser.add_argument("--receipt", type=Path, required=True)
    parser.add_argument("--save-root", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    if not re.fullmatch(r"[0-9]+:slot[0-9]+", args.profile):
        raise ValueError("Select an explicit numeric save profile")
    account, slot = args.profile.split(":")
    save_root = args.save_root.resolve()
    source = (save_root / account / slot / "save.save").resolve()
    if not source.is_relative_to(save_root):
        raise ValueError("Save is outside the selected save root")
    output = args.output.resolve()
    if output.is_relative_to(save_root):
        raise ValueError("Verification output must be outside the game's save folder")
    receipt_bytes = args.receipt.read_bytes()
    receipt = json.loads(receipt_bytes)
    snapshot = output.parent / "save-snapshot" / "save.save"
    data, stat = stable_copy(source, snapshot)
    result = verify(receipt, decode(data))
    result.update({
        "schemaVersion": 1,
        "selectedSaveProfile": args.profile,
        "saveSha256": hashlib.sha256(data).hexdigest(),
        "receiptSha256": hashlib.sha256(receipt_bytes).hexdigest(),
        "saveModifiedTime": stat.st_mtime,
        "note": "Selected-save verification only. Runtime ownership, key reuse and loaded-save detection must be handled before automatic changes.",
    })
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, allow_nan=False) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
