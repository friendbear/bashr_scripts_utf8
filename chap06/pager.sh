#!/bin/sh

# pager.sh - ファイル名が指定されなかった場合にファイル選択ダイアログを
#            表示

if [ -z "$1" ]; then
    tmp=`mktemp /tmp/dialog.XXXXXXXX` || exit 1
    dialog --fselect ./ 12 60 2>"$tmp" || { rm "$tmp"; exit 1; }
    fname=`cat "$tmp"`
    rm "$tmp"
else
    fname="$1"
fi

${PAGER:-more} "$fname"
