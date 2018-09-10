#!/bin/sh

# file_datecmp.sh - ファイルの新旧を比較する

# 組み込みの「test -e」が使えない時には外部コマンドを使う
if /bin/sh -c 'test -e "$0"' 2>/dev/null; then
    command=""         # Solaris以外
else
    command="command"  # Solarisの場合
fi

# 指定された引数の数が不正な場合、説明を表示
if [ $# -ne 2 ]; then
    echo "usage: file_datecmp.sh file1 file2"
    exit 1
fi

# 比較対象のファイルが存在することを確かめておく
$command [ -e "$1" ] || { echo "$1 does not exist"; exit 1; }
$command [ -e "$2" ] || { echo "$2 does not exist"; exit 1; }

# 新旧を比較して結果を表示
if $command [ "$1" -nt "$2" ]; then
    echo "$1 is newer than $2"
elif $command [ "$1" -ot "$2" ]; then
    echo "$1 is older than $2"
else
    echo "$1 and $2 have exactly the same timestamp."
fi
