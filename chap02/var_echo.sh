#!/bin/sh

# var_echo.sh - 変数の内容をコマンドの入力にする

greeting="Hello, brother!"
echo "$greeting" | sed 's/Hello/Good morning/'
