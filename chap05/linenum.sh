#!/bin/sh

# linenum.sh - ファイルに行番号を付ける

# 引数の数が不正な場合、説明を表示
if [ $# -ne 1 ]; then
    echo "usage: linenum.sh filename"
    exit 1
fi

# IFSに改行文字を指定する
IFS='
'
ln=0

# 標準入力から1行ずつ読み込み、行番号と共に表示
while read -r line; do  # Solarisでは「read line」
    ln=`expr $ln + 1`
    printf '%3d %s\n' "$ln" "$line"
done < "$1"

# 注：readの「-r」オプションが使えない場合、バックスラッシュを含む入力
#     ファイルは正しく扱えない。
