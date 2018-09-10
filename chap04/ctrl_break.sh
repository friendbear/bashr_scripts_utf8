#!/bin/sh

# ctrl_break.sh - breakの例

for item in one two three STOP four five; do
    [ "$item" = "STOP" ] && break  # 「STOP」の場合、for文の繰り返しを中断
    echo "$item"
done
