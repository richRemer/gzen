#!/bin/bash -e

GZEN=`readlink -f $0`
BIN=`dirname $GZEN`
LIB=`readlink -f "$BIN/../lib"`
PROFILE="$HOME/.gzen"

[ -e "$PROFILE" ] && . "$PROFILE"

GZENCMD=$1
shift || $GZEN error "Usage: $0 CMD [CMDOPTS]"

[ $GZENCMD == "error" ] && zenity --error --title gzen --text "$1" 2>/dev/null && exit 1
[ $GZENCMD == "info" ] && zenity --info --title gzen --text "$1" 2>/dev/null && exit 2
[ ! -e $LIB/$GZENCMD.sh ] && $GZEN error "Invalid command: $GZENCMD"

. $LIB/$GZENCMD.sh

