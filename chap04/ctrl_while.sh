#!/bin/sh

# ctrl_while.sh - while文の例

# 全ての引数を表示する
while [ -n "$1" ]; do
    echo "$1"
    shift
done
