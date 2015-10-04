#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100

[ -e "$PROFILE" ] && grep ^REPO= "$PROFILE" >/dev/null \
    && sed -i s@^REPO=.\*@REPO=`pwd`@ "$PROFILE" \
    || echo REPO=`pwd` >> "$PROFILE"

zenity --info --title gzen --text "gzen repo set to "`pwd` 2>/dev/null &
