#!/bin/sh

# xpager.sh - ファイル名が指定されなかった場合にファイル選択ダイアログを
#             表示

if [ -z "$1" ]; then
    fname=`Xdialog --stdout --fselect ./ 25 60` || exit 1
else
    fname="$1"
fi

Xdialog --no-cancel --textbox "$fname" 25 80
