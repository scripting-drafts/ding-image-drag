# DING image-drag patch
Patched local copy of Desktop Icons NG. Dropping a remote image/URL on the
desktop or a folder icon saves the full-resolution source instead of ignoring
the drop. Built for Firefox ESR 153.6.
Revert: remove this folder, then run:
  gsettings set org.gnome.shell enabled-extensions "[]"
  gsettings set org.gnome.shell disabled-extensions "[]"
Restart the shell with Alt+F2, r, Enter.
