#!/bin/sh

# fileordir.sh - ファイルかディレクトリかを調べる

# 組み込みの「test -e」が使えない時には外部コマンドを使う
if /bin/sh -c 'test -e "$0"' 2>/dev/null; then
    command=""         # Solaris以外
else
    command="command"  # Solarisの場合
fi

# ファイルの存在チェック＋種類のチェック
if $command [ -e "$1" ]; then
    if [ -d "$1" ]; then
	echo "$1 is a directory"
    else
	echo "$1 is a file (regular or special)"
    fi
else
    echo "$1 does not exist"
fi
