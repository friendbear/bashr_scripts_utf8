#!/bin/sh

# xmenu_dlg.sh - GUIで複数の項目から選択する

while true; do
    result=`Xdialog --stdout --no-tags --menubox \
        "Which fruits do you like?" 11 70 4 \
	A "Apples" O "Oranges" B "Bananas" X "I'm full!"`
    [ $? -ne 0 ] && break
    case "$result" in
	X)
	    break 2;;  # whileループを抜ける
	A)
	    fruit="apples";;
	O)
	    fruit="oranges";;
	B)
	    fruit="bannas";;
    esac
    Xdialog --msgbox "Okey, I will give you some $fruit." 8 70
done

Xdialog --msgbox "Good bye!" 8 70
