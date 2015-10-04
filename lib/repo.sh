#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100
[ -z "$REPO" ] && $GZEN error "Use 'gzen here' first"
[ ! -d "$REPO/.git" ] && $GZEN error "REPO '$REPO' is not a git repository"

cd "$REPO"
"$@"
