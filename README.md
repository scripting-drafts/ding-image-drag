# ding-image-drag

Patched DING for Ubuntu 22.04 / GNOME 42; Firefox ESR 153.6 images dragged to the desktop or folder icon stay full resolution.
Install: `./install.sh` then restart the shell (Alt+F2, `r`, Enter). Revert: `./revert.sh`.
Installs `image-canvas` to `~/bin`; right-click a desktop image and choose Open With Image Canvas.
Viewer: `image-canvas IMAGE`; Ctrl+W or Esc closes, left-drag moves the window.
See `nautilus/README.md` for the Nautilus 42.6 URL-drop fix.
Copy Path: https://github.com/scripting-drafts/nautilus-copy-path
Based on DING (https://gitlab.com/rastersoft/desktop-icons-ng), GPL-3.0. See NOTICE and `patch/`.
