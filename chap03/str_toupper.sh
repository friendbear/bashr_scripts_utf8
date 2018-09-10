#!/bin/sh

# str_toupper.sh - 文字列を大文字にする

# 処理する文字列
text="The quick brown fox jumps over the lazy dog."

# text中の小文字を大文字にする
result=`echo "$text" | tr 'a-z' 'A-Z'`
echo "$result"
