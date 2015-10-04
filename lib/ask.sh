#!/bin/bash -e

[ -z "$GZEN" ] && echo "use gzen to run this script" 1>&2 && exit 100

FILES=`xclip -o 2>/dev/null` || true
[ ${#FILES} -gt 30 ] \
    && files=${FILES:0:30}... \
    || files=$FILES

[ -n "$FILES" ] && ACTIONS="add\nreset\ncheckout\n"
ACTIONS="${ACTIONS}commit\ndifftool\npush\npull"

TEXT="Run command (files: $files)"
ACTION=`echo -ne $ACTIONS | zenity --list --hide-header --title gzen --column=A \
    --text "$TEXT" 2>/dev/null`

case $ACTION in
    commit)
        MSG=`$GZEN read "Commit message"`
        [ -z "$MSG" ] && $GZEN error "Commit message is required"
        ;;
esac

case $ACTION in
    add)        $GZEN git add `xclip -o`            ;;
    reset)      $GZEN git reset HEAD `xclip -o`     ;;
    checkout)   $GZEN git checkout -- `xclip -o`    ;;
    commit)     $GZEN git commit -m"$MSG"           ;;
    difftool)   $GZEN git difftool -y               ;;
    push)       $GZEN git push origin HEAD          ;;
    pull)       $GZEN git pull origin HEAD          ;;
esac
