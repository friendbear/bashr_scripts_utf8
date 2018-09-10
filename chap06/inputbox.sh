#!/bin/sh

# inputbox.sh - テキストダイアログで1行入力を得る

tmp=`mktemp /tmp/dialog.XXXXXXXX` || exit 1
dialog --inputbox "May I have your name, please?" 8 70 "Anonymous Coward" 2>"$tmp"
dialog --msgbox "Your name is `cat "$tmp"`" 8 70
rm "$tmp"
