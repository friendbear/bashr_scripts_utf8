#!/bin/sh

# log_split.sh - ログファイルを適当な大きさに分割して、圧縮する

lpf=100  # 100行毎に分割

# ファイル名が指定されていない場合、説明を表示
if [ $# -ne 1 ]; then
    echo "usage: log_split.sh logfile"
    exit 1
fi

# 対象ファイルの名前と、ディレクトリ名を除いた名前をセット
logfile="$1"
splitbase=`basename "$1"`.

# ファイルを分割し、分割に成功した場合はそれぞれを圧縮する
if split -l $lpf "$logfile" "$splitbase"; then
    for split in "$splitbase"*; do
	gzip "$split"
    done
fi
