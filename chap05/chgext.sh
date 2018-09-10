#!/bin/sh

# chgext.sh - ファイルの拡張子をまとめて変更する

# 引数が2つ未満の時は説明を表示する
if [ $# -lt 2 ]; then
    echo "usage: chgext.sh .newext files..."
    exit 1
fi

newext="$1"  # 最初の引数が新しい拡張子
shift

# 新しい拡張子が「.」で始まっていない場合、付け加える
# （「.txt」「txt」のどちらの形式で書いても大丈夫なように）
expr "$newext" : '\.' >/dev/null || newext=".${newext}"

# 残りの全ての引数について繰り返して処理
for fname do
    bname=`echo "$fname" | sed 's/\.[^.]*$//'`
    mv "$fname" "${bname}${newext}"
done
