#!/bin/sh

# isnum.sh - 文字列が整数かどうかを調べる

# is_num STR
#     STRが整数かどうかを調べ、メッセージを表示する
is_num() {
    [ "$1" -eq 0 ] 2>/dev/null
    if [ $? -ge 2 ]; then
	echo "$1 is NOT a valid integer."
    else
	echo "$1 is a valid integer."
    fi
}

# is_numを呼び出してみる
is_num "256"
is_num "-32"
is_num "X64"
