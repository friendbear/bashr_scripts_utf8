#!/bin/sh

# xyesno.sh - GUIでYes/Noを問い合わせる

if Xdialog --yesno "Are you sure?" 8 70; then
    echo "Your answer was YES."
else
    echo "Your answer was NO."
fi
