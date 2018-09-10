#!/bin/sh

# str_substr.sh - 文字列の一部を取り出す

# 「ABCDEFGHIJ」の3文字目から7文字目を抜き出す
str="ABCDEFGHIJ"
start=3
end=7
substr=`echo "$str" | cut -c${start}-${end}`
echo "$substr"
