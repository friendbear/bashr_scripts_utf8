#!/bin/sh

# getchar.sh - 1文字入力のサンプル

echo "Hit any key!"

stty raw -echo
char=`dd bs=1 count=1 2>/dev/null`
stty -raw echo

echo "Key pressed: '$char'"
