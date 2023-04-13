#!/bin/bash

# This is just some stuff for retaining config stuff on WSL...
# Don't think about it too much 😀 

# FIXME Try to make it link instead
#
# Wezterm

SRC="$HOME/dotfiles/wezterm/.wezterm.lua"
DST="/mnt/c/Users/Linus/.wezterm.lua"
echo "Copying: $SRC => $DST"
cp $SRC $DST

