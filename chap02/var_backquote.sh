#!/bin/sh

# var_backquote.sh - コマンド置換の例

# usernameに現在ログインしているユーザーの名前が代入される
username=`id -un`
echo "$username"

# greetingに、挨拶のメッセージを代入する
greeting="Hello, `id -un`"
echo "$greeting"

# 変数に代入せず、そのまま引数として書くこともできる
echo "My name is `id -un`."
