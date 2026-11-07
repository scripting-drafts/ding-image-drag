# Nautilus Firefox URL-drop fix

Nautilus 42.6 maps Firefox `_NETSCAPE_URL` drags to `GDK_ACTION_LINK`, then
rejects LINK with “An invalid drag type was used”. The source patch always COPYs.

Build: apply `nautilus-42.6-firefox-url-drop.patch` to Nautilus 42.6.
Install: `./install-binary-patch.sh`, then `nautilus -q` and reopen Files.
Revert: `./uninstall.sh`, then restart Files.
The binary patch is tied to Build ID `25ae5c75e197c53dcb14cc46e338cd086c1254a4`;
re-run it after a Nautilus upgrade.
