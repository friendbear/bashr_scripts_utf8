#!/bin/sh

# args.sh - 与えられた引数を1行に2個ずつ表示する

# 引数の総数を表示
echo "Number of arguments: $#"

# 2個ずつ表示する
while [ -n "$1" ]; do  # $1が空でない間繰り返す
    echo "$1 $2"
    shift 2
done
