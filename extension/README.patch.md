# DING image-drag patch
Patched local copy of Desktop Icons NG. Dropping a remote image/URL on the
desktop downloads it instead of ignoring the drop. Built for Firefox ESR 153.
Revert: remove this folder, then run:
  gsettings set org.gnome.shell enabled-extensions "[]"
  gsettings set org.gnome.shell disabled-extensions "[]"
Restart the shell with Alt+F2, r, Enter.
