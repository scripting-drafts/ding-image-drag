# ding-image-drag

Patched DING for Ubuntu 22.04 / GNOME 42, tested with Firefox ESR 153.6.
Dragging an image from Firefox onto the desktop or a Desktop folder icon saves
the full-resolution source instead of ignoring the remote URL.

Install: `./install.sh` then restart the shell (Alt+F2, `r`, Enter).
Revert: `./revert.sh` then restart the shell. See `nautilus/README.md` for the
Nautilus 42.6 URL-drop fix.
Based on DING (https://gitlab.com/rastersoft/desktop-icons-ng), GPL-3.0. See NOTICE and `patch/`.
