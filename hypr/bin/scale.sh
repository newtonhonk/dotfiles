#!/bin/bash
monitor="eDP-1"
resolution="2880x1800@120.00000"
resolution96="2880x1800@96.01"
position="0x0"

action(){
    whattodo=$(echo -e "scale (1.0)\nscale (1.3)\nscale (1.8)\nscale (2.0)\n96hz\n120hz" | rofi -dmenu -p "Just what do you think you're doing, Dave?")
	if [[ $whattodo == "scale (1.0)" ]]; then
        hyprctl keyword monitor "$monitor,$resolution,$position,1"
    elif [[ $whattodo == "scale (1.3)" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,1.333333"
    elif [[ $whattodo == "scale (1.8)" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,1.8"
	elif [[ $whattodo == "scale (2.0)" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,2"
  	elif [[ $whattodo == "96hz" ]]; then
		hyprctl keyword monitor "$monitor,$resolution96,$position,2"
	elif [[ $whattodo == "120hz" ]]; then
		hyprctl keyword monitor "$monitor,$resolution,$position,2"
    fi
}

action
