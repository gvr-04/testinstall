#!/bin/bash
# script to take Screenshot in differnt modes

help()
{
   echo ""
   echo "Usage: $0 Parameter"
   echo -e "\ta takes Screenshot of the active window"
   echo -e "\ts takes Screenshot of a selection"
   echo -e "\tf takes Screenshot of the active monitor"
   exit 1 
}

screenshot_filename="$HOME/Pictures/screenshots/$(date +"%d-%m-%Y-[%H:%M:%S]")-_-.png"

case "$1" in

	"a") hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - $screenshot_filename ;;

	"s") grim -g "$(slurp)" $screenshot_filename ;;	

	"f")active_workspace_monitor=$(hyprctl -j activeworkspace | jq -r '(.monitor)')
		grim -o $active_workspace_monitor $screenshot_filename ;;

	"?") help;;

esac

if [ -e $screenshot_filename ]; then
	notify-send -i $screenshot_filename "Grim" "Screenshot Saved\n$(date +"[%H:%M:%S]")"
	# hyprctl notify 1 5000 "rgb(ff0000)" "Screenshot Saved $screenshot_filename"
	wl-copy < $screenshot_filename
fi
