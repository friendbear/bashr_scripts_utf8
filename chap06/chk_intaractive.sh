#!/bin/sh

# chk_interactive.sh - 対話モードがどうかを調べる

# 対話モードの場合、ユーザーに確認を求める
if test -t 0; then
    echo "Are you sure?  Press Ctrl-C to abort, or Enter to continue."
    read dummy
fi

# 実際の処理
echo "DO SOMETHING!"
