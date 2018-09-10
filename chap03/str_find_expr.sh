#!/bin/sh

# str_find_expr.sh - exprで文字列を検索する

# 検索用の文字列
text="The quick brown fox jumps over the lazy dog."

# textに「fox」が含まれるかどうか調べる
if expr "$text" : '.*fox' >/dev/null; then
    echo "fox was found!"
else
    echo "not found"
fi
