#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100
[ -z "$REPO" ] && $GZEN error "No repo directory has been set"
$GZEN info "Repo dir: $REPO"
