#!/bin/sh

# menu_dlg.sh - テキストダイアログで複数の項目から選択する

tmp=`mktemp /tmp/dialog.XXXXXXXX` || exit 1

while true; do
    dialog --menu "Which fruits do you like?" 11 70 4 \
	A "Apples" O "Oranges" B "Bananas" X "I'm full!" 2>"$tmp"
    [ $? -ne 0 ] && break
    case `cat "$tmp"` in
	X)
	    break 2;;  # whileループを抜ける
	A)
	    fruit="apples";;
	O)
	    fruit="oranges";;
	B)
	    fruit="bannas";;
    esac
    dialog --msgbox "Okey, I will give you some $fruit." 8 70
done

dialog --msgbox "Good bye!" 8 70
rm "$tmp"
