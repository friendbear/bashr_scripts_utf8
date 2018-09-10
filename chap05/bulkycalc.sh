#!/bin/sh

# bulkycalc.sh - まとめて計算

# 入力ファイルには、1行に1つずつ計算式を書く。bcは標準入力から1行ずつ式
# を受け取って、計算する。結果はテンポラリ・ファイルに保存される。最後
# にpasteで入力ファイルと結果を結合する。

# 引数の数が不正な場合、説明を表示
if [ $# -ne 1 ]; then
    echo "usage: bulkycalc.sh input-file"
    exit 1
fi

# テンポラリ・ファイルを作成する
temp=`mktemp /tmp/bulkycalc.XXXXXXXX` || exit 1

cat "$1" | bc > "$temp"  # 計算を行う
paste -d = "$1" "$temp"  # 計算結果を入力に貼り付ける

# テンポラリファイルを削除
rm "$temp"
