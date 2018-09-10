#!/bin/sh

# str_find_grep.sh - grepで文字列を検索する

# 検索用の文字列
text="The quick brown fox jumps over the lazy dog."

# textに「fox」が含まれるかどうか調べる
if echo "$text" | grep -q 'fox'; then
    echo "found"
else
    echo "not found"
fi
