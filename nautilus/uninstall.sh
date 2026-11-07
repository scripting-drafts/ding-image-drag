#!/usr/bin/env bash
set -euo pipefail

rm -f "$HOME/.local/bin/nautilus"
rm -f "$HOME/.local/share/dbus-1/services/org.gnome.Nautilus.service"

echo "Removed the patched Nautilus and the user D-Bus override."
echo "Restart Files with: nautilus -q"
