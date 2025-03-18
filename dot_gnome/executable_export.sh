#!/bin/bash
mkdir -p ~/.gnome/space-bar/ # should never run, but /shrug

dconf dump /org/gnome/shell/keybindings/ > ~/.gnome/keybindings.ini
dconf dump /org/gnome/shell/app-switcher/ > ~/.gnome/app-switcher.ini

# Extensions
dconf dump /org/gnome/shell/extensions/just-perfection/ > ~/.gnome/just-perfection.ini
dconf dump /org/gnome/shell/extensions/tactile/ > ~/.gnome/tactile.ini

dconf dump /org/gnome/shell/extensions/space-bar/appearance/ > ~/.gnome/space-bar/appearance.ini
dconf dump /org/gnome/shell/extensions/space-bar/shortcuts/ > ~/.gnome/space-bar/shortcuts.ini
dconf dump /org/gnome/shell/extensions/space-bar/behavior/ > ~/.gnome/space-bar/behavior.ini
