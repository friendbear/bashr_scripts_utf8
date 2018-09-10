#!/bin/sh

# dirsize.sh - ディレクトリのサイズ（ディスク使用量）を返す

# 引数が指定されていない場合、説明を表示
if [ $# -ne 1 ]; then
    echo "usage: dirsize.sh dirname"
    exit 1
fi

# 「du -ks」の出力をsetで単語に分解する。
set -- `du -ks "$1"`

# 分解結果
# $1 - サイズ（KB単位）
# $2以降 - ディレクトリ名

# サイズ（バイト単位）を表示
expr $1 \* 1024
