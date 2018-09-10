#!/bin/sh

# loop_over_cmd.sh - コマンドの出力に対して繰り返す

# 処理対象のディレクトリ
dir="$1"

# 単語区切りを改行文字だけにする
IFS='
'

# lsコマンドは、標準出力が端末でない場合にはファイルを1行に1つずつ表示
# する。IFSを改行だけに設定しているので、ファイル名が空白を含んでも問題
# ない。
for name in `ls "$dir"`; do
    if [ -f "$dir/$name" ]; then
	echo "$dir/$name (regular file)"
    elif [ -d "$dir/$name" ]; then
	echo "$dir/$name (directory)"
    else
	echo "$dir/$name (other type)"
    fi
done
