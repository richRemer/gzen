#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100

$GZEN repo git "$@"
