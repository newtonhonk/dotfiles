#!/bin/bash

edit="kitty -e nvim"
confdir="/home/$USER/.config/"
hyprdir="hypr/"
waybardir="waybar/"
kittydir="kitty/"
rofidir="rofi/"
fishdir="fish/"

selectconf() {
		whattodo=$(echo -e "📢 hyprland\n➖ waybar\n🐱 kitty\n🔎 rofi\n🐟 fish\n⚙️ .config" | rofi -dmenu -p "🔴   Just what do you think you're editing, Dave?")
		if [[ $whattodo == "📢 hyprland" ]]; then
				$edit $confdir$hyprdir
		elif [[ $whattodo == "➖ waybar" ]]; then
				$edit $confdir$waybardir
		elif [[ $whattodo == "🐱 kitty" ]]; then
				$edit $confdir$kittydir
		elif [[ $whattodo == "🔎 rofi" ]]; then
				$edit $confdir$rofidir
		elif [[ $whattodo == "🐟 fish" ]]; then
				$edit $confdir$fishdir
		elif [[ $whattodo == "⚙️ .config" ]]; then
				$edit $confdir
fi
}

selectconf
