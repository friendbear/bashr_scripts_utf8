#!/bin/sh

# func_call.sh - 関数呼び出しの例

# 関数を定義する
today() {
    date +'%Y/%m/%d'
}

# 関数を呼び出す
today > today.txt   # リダイレクトも使える
