#!/bin/bash

fpath=$(dirname "$(realpath $0)")

case "$1" in
	"screen") $fpath/scrn.sh "$2" ;;
	"wall") $fpath/random_wallpaper_picker.sh ;;
	"check") $fpath/check.sh ;;
	"sd") $fpath/sd.sh ;;
esac
