#!/bin/bash
# This is just some stuff for linking stuff on WSL...
# Don't think about it too much :)

# Wezterm
SRC="$(pwd)/wezterm/.wezterm.lua"
DST="/mnt/c/Users/Linus/.wezterm.lua"

echo "Linking $SRC => $DST"
ln -s $SRC $DST

