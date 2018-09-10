#!/bin/bash

# linenum_bash.sh - ファイルに行番号を付ける

# 引数の数が不正の場合、説明を表示
if [ $# -ne 1 ]; then
    echo "usage: linenum_bash.sh filename"
    exit 1
fi

IFS=$'\n'          # IFSに改行文字を指定する
file=(`cat "$1"`)  #ファイルを配列に読み込む

# 各行を行番号と共に表示する
ln=0
for line in "${file[@]}"; do
    ln=`expr $ln + 1`
    printf '%3d %s\n' "$ln" "$line"
done
