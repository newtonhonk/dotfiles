#!/bin/bash

#AUTHOR: ABDELRHMAN NILE (PIRATE)
#github: https://github.com/AbdelrhmanNile

# this script WILL NOT WORK if you don't have feh and rofi, please install them first
#
dir="/home/$USER/Bilder/Wallpaper/" # wallpapers folder, change it to yours, make sure that it ends with a /
cd $dir
wallpaper="none is selected" 
set="swaybg -m fill -i "
view="feh"
waybardir="/home/$USER/.config/waybar"

########################-FUNCTION FOR SELECTING A WALLPAPER-###################
selectpic(){
    wallpaper=$(ls $dir | rofi -dmenu -p "select a wallpaper: ($wallpaper)")

    if [[ $wallpaper == "q" || $wallpaper == "" ]]; then
        killall feh && exit 
    else
        action
    fi
}
###############################################################################

#########################-FUNCTION FOR TAKING AN ACTION ON THE SELECTED WALLPAPER-#########################
action(){
		whattodo=$(echo -e "view\nset\nset (permanant)\nset (permanant light)\nset (permanant dark)\nset (permanant light-dark)" | rofi -dmenu -p "whatcha wanna do with it? ($wallpaper)")
    if [[ $whattodo == "set" ]]; then
        set_wall
    elif [[ $whattodo == "set (permanant)" ]]; then
      set_permanant
    elif [[ $whattodo == "set (permanant dark)" ]]; then
      set_permanant_dark
    elif [[ $whattodo == "set (permanant light)" ]]; then
      set_permanant_light
    elif [[ $whattodo == "set (permanant light-dark)" ]]; then
      set_permanant_light_dark
    else
        view_wall
    fi
}
#############################################################################################################

########-FUNCTION TO SET THE SELECTED WALLPAPER, BUT IT IS NOT PERMANANT, THE CHANGE WILL BE UNDONE AFTER LOGOUT OR REBOOT-#######
set_wall(){
    $set $wallpaper && killall feh &
}
###################################################################################################################################

####################-FUNCTION TO VIEW THE WALLPAPER-######################
view_wall(){
    $view $wallpaper &
    set_after_view
}
###########################################################################

##############-FUNCTION TO PROMPT THE USER AFTER VIEWING THE WALLPAPER-#######################
set_after_view(){
  setorno=$(echo -e "set (permanant)\ngo back" | rofi -dmenu -p "wanna set it? ($wallpaper)")

  if [[ $setorno == "set (permanant)" ]]; then
      set_permanant
    else
      killall feh && wch
    fi
}
################################################################################################

#########-FUNCTION TO SET THE WALLPAPER permanantly, IT WILL MODIFY YOUR START UP CONFIG FILE-###########
set_permanant(){
  set_wall
  ln -fs $dir$wallpaper $HOME/.wallpaper
  killall feh &
  swaybg -m fill -i $HOME/.wallpaper
}
set_permanant_dark(){
  set_wall
  ln -fs $dir$wallpaper $HOME/.wallpaper
  killall feh &
  swaybg -m fill -i $HOME/.wallpaper &
  ln -fs $waybardir/dark.css $waybardir/colors.css
  sh /home/$USER/.local/bin/waybarreload.sh
}
set_permanant_light(){
  set_wall
  ln -fs $dir$wallpaper $HOME/.wallpaper
  killall feh &
  swaybg -m fill -i $HOME/.wallpaper &
  ln -fs $waybardir/light.css $waybardir/colors.css
  sh /home/$USER/.local/bin/waybarreload.sh
}
set_permanant_light_dark(){
  set_wall
  ln -fs $dir$wallpaper $HOME/.wallpaper
  killall feh &
  swaybg -m fill -i $HOME/.wallpaper &
  ln -fs $waybardir/light_dark.css $waybardir/colors.css
  sh /home/$USER/.local/bin/waybarreload.sh
}
########################################################################################################

###################-MAIN-####################
selectpic