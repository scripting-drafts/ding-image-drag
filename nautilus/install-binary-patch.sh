#!/usr/bin/env bash
set -euo pipefail

src="/usr/bin/nautilus"
dest="$HOME/.local/bin/nautilus"
service_dir="$HOME/.local/share/dbus-1/services"
build_id="25ae5c75e197c53dcb14cc46e338cd086c1254a4"
offset=$((0x5ce3e))

if ! readelf -n "$src" 2>/dev/null | grep -q "$build_id"; then
    echo "Unsupported Nautilus build; expected Build ID $build_id." >&2
    exit 1
fi

mkdir -p "$(dirname "$dest")"
install -m 0755 "$src" "$dest"

python3 - "$dest" "$offset" <<'PY'
import sys
path = sys.argv[1]
offset = int(sys.argv[2])
with open(path, 'r+b') as f:
    f.seek(offset)
    old = f.read(4)
    if old != b'\x08\x00\x00\x00':
        raise SystemExit(f'unexpected bytes at {offset:#x}: {old.hex()}')
    f.seek(offset)
    f.write(b'\x02\x00\x00\x00')
print(f'patched {path} at {offset:#x}: LINK -> COPY')
PY

mkdir -p "$service_dir"
cat > "$service_dir/org.gnome.Nautilus.service" <<EOF
[D-BUS Service]
Name=org.gnome.Nautilus
Exec=$dest --gapplication-service
EOF

echo "Installed $dest and the user D-Bus service override."
echo "Restart Files with: nautilus -q"
echo "Then reopen the folder window."
