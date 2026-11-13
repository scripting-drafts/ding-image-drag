#!/usr/bin/env bash
set -euo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
uuid="ding-images@local"
stock="ding@rastersoft.com"
dest="$HOME/.local/share/gnome-shell/extensions/$uuid"
viewer_src="$here/viewer/image-canvas"
viewer_dest="$HOME/bin/image-canvas"

mkdir -p "$(dirname "$dest")"
rm -rf "$dest"
cp -a "$here/extension" "$dest"
install -Dm755 "$viewer_src" "$viewer_dest"
python3 "$here/scripts/set_extension_state.py" install "$uuid" "$stock"

echo "Installed viewer at $viewer_dest"
echo "Installed. Restart GNOME Shell with Alt+F2, then type r and press Enter."
