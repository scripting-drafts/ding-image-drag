#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
uuid="ding-images@local"
stock="ding@rastersoft.com"
dest="$HOME/.local/share/gnome-shell/extensions/$uuid"

rm -rf "$dest"
python3 "$here/scripts/set_extension_state.py" revert "$uuid" "$stock"

echo "Removed. Restart GNOME Shell with Alt+F2, then type r and press Enter."
