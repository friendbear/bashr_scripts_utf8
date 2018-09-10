#!/bin/sh

# disk_free.sh - 指定したディレクトリ・ファイルがあるディスクの空き容量を得る

# 引数の数が不正な場合、説明を表示する
if [ $# -eq 0 ]; then
    echo "usage: disk_free.sh file_or_dir"
    exit 1
fi

# dfコマンドの出力を単語に分解し、必要な部分だけを表示する
set -- `df -k "$1" | tail -1`
echo $4
