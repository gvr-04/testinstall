#!/bin/bash

case "$1" in
	"screen") $HOME/final/scripts/scrn.sh "$2" ;;
	"wall") $HOME/final/scripts/random_wallpaper_picker.sh ;;
	"check") $HOME/final/scripts/check.sh ;;
	"sd") $HOME/final/scripts/sd.sh ;;
esac
