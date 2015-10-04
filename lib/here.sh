#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100

[ -e "$PROFILE" ] && grep ^REPO= "$PROFILE" >/dev/null \
    && sed -i s@^REPO=.\*@REPO=`pwd`@ "$PROFILE" \
    || echo REPO=`pwd` >> "$PROFILE"

$GZEN info "gzen REPO set to "`pwd` &

