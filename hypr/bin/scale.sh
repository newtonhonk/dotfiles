#!/bin/bash
monitor="eDP-1"
resolution="2880x1800@120.000000"
position="0x0"

action(){
    whattodo=$(echo -e "🔎 scale (1.0)\n🔎 scale (1.3)\n🔎 scale (1.8)\n🔎 scale (2.0)" | rofi -dmenu -p "🔴   Just what do you think you're scaling, Dave?")
	if [[ $whattodo == "🔎 scale (1.0)" ]]; then
        hyprctl keyword monitor "$monitor,$resolution,$position,1"
    elif [[ $whattodo == "🔎 scale (1.3)" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,1.333333"
    elif [[ $whattodo == "🔎 scale (1.8)" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,1.8"
	elif [[ $whattodo == "🔎 scale (2.0)" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,2"
  	elif [[ $whattodo == "💡 60hz" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,2"
	elif [[ $whattodo == "💡 120hz" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,2"
    fi
}

action
