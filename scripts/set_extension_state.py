#!/usr/bin/env python3
"""Add or remove extension UUIDs in the GNOME Shell enabled/disabled lists."""
import ast
import subprocess
import sys


def get_list(key):
    out = subprocess.check_output(
        ["gsettings", "get", "org.gnome.shell", key], text=True
    ).strip()
    if out.startswith("@as "):
        out = out[4:]
    return ast.literal_eval(out) if out else []


def set_list(key, values):
    subprocess.check_call(
        ["gsettings", "set", "org.gnome.shell", key, repr(values)]
    )


def main():
    if len(sys.argv) != 4 or sys.argv[1] not in ("install", "revert"):
        sys.exit("usage: set_extension_state.py install|revert UUID STOCK_UUID")
    mode, uuid, stock = sys.argv[1:]
    enabled = get_list("enabled-extensions")
    disabled = get_list("disabled-extensions")
    if mode == "install":
        enabled = sorted(set(enabled) | {uuid})
        disabled = sorted(set(disabled) | {stock})
    else:
        enabled = [item for item in enabled if item != uuid]
        disabled = [item for item in disabled if item != stock]
    set_list("enabled-extensions", enabled)
    set_list("disabled-extensions", disabled)


if __name__ == "__main__":
    main()
