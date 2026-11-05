#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
uuid="ding-images@local"
stock="ding@rastersoft.com"
dest="$HOME/.local/share/gnome-shell/extensions/$uuid"

mkdir -p "$(dirname "$dest")"
rm -rf "$dest"
cp -a "$here/extension" "$dest"
python3 "$here/scripts/set_extension_state.py" install "$uuid" "$stock"

echo "Installed. Restart GNOME Shell with Alt+F2, then type r and press Enter."
