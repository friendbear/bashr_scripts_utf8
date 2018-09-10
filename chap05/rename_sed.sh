#!/bin/sh

# rename_sed.sh - 正規表現を使ってファイル名を変更

# 引数がない場合、説明を表示
if [ $# -lt 3 ]; then
    echo "usage: rename_sed.sh regexp replace files..."
    exit 1
fi

# 正規表現と置き換え文字列をセットする
regexp="$1"
pattern="$2"
shift 2

# 残りの引数で指定されたファイルについて繰り返し処理
for orig do
    new=`echo "$orig" | sed s/"$regexp"/"$pattern"/`
    echo "$orig -> $new"
    mv "$orig" "$new"
done
