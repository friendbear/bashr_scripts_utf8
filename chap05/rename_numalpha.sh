#!/bin/sh

# rename_numalpha.sh - ファイル名中の一桁の数字をアルファベット
#                      (1=A, 2=B, ..., 9=I)に置き換える

# 引数がない場合、説明を表示する
if [ $# -eq 0 ]; then
    echo "usage: rename_numalpha.sh files..."
    exit 1
fi

# 引数で指定された全てのファイルについて繰り返す
for orig do
    new=`echo "$orig" | ruby -pe 'gsub!(/[1-9]/) { |m| (m.to_i+64).chr }'`
    echo "$orig -> $new"
    mv "$orig" "$new"
done
