#!/bin/sh

# var_to_file.sh - 変数の内容をファイルに書き込む

# file.outに変数msgの内容が書き込まれる
msg='Where do you want to go today?'
echo "$msg" > file.out
