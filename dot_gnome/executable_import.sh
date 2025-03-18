#!/bin/bash

# Check if .gnome directory exists
if [ ! -d ~/.gnome ]; then
	echo "~/.gnome directory not found!"
	exit 1
fi

if [ -f ~/.gnome/keybindings.ini ]; then
	dconf load /org/gnome/shell/keybindings/ < ~/.gnome/keybindings.ini
fi

if [ -f ~/.gnome/app-switcher.ini ]; then
	dconf load /org/gnome/shell/app-switcher/ < ~/.gnome/app-switcher.ini
fi

if [ -f ~/.gnome/just-perfection.ini ]; then
	dconf load /org/gnome/shell/extensions/just-perfection/ < ~/.gnome/just-perfection.ini
fi

if [ -f ~/.gnome/tactile.ini ]; then
	dconf load /org/gnome/shell/extensions/tactile/ < ~/.gnome/tactile.ini
fi

if [ -d ~/.gnome/space-bar ]; then
	if [ -f ~/.gnome/space-bar/appearance.ini ]; then
		dconf load /org/gnome/shell/extensions/space-bar/appearance/ < ~/.gnome/space-bar/appearance.ini
	fi

	if [ -f ~/.gnome/space-bar/shortcuts.ini ]; then
		dconf load /org/gnome/shell/extensions/space-bar/shortcuts/ < ~/.gnome/space-bar/shortcuts.ini
	fi

	if [ -f ~/.gnome/space-bar/behavior.ini ]; then
		dconf load /org/gnome/shell/extensions/space-bar/behavior/ < ~/.gnome/space-bar/behavior.ini
	fi
fi

echo "all done!"
echo "you might need to restart the shell with Alt+F2, then 'r' for some changes to take effect"
