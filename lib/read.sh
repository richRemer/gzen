#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100

zenity --entry --title gzen --text "$1" 2>/dev/null
