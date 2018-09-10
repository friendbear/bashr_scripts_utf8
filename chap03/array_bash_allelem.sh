#!/bin/bash

# array_bash_allelem.sh - bash配列変数の全ての要素を得る

# 配列変数を作成
array=(one two three four)

# 全ての要素を「:」で繋いで表示
IFS=':'
echo "${array[*]}"

# 全ての要素を改行文字で繋いで表示（＝1行にひとつずつ表示）
IFS=$'\n'  # 改行文字
echo "${array[*]}"
