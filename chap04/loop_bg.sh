#!/bin/sh

# loop_bg.sh - 繰り返し処理をバックグラウンドで行う

for i in 5 4 3 2 1 "Fire!"; do
    echo "$i"
    sleep 1
done &

sleep 6
