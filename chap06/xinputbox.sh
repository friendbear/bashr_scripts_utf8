#!/bin/sh

# xinputbox.sh - GUIで1行入力を得る

answer=`Xdialog --stdout --inputbox "May I have your name, please?" \
    8 70 "Anonymous Coward"`
Xdialog --msgbox "Your name is $answer" 8 70
