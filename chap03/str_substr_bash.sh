#!/bin/bash

# str_substr_bash.sh - 文字列の一部を取り出す（bash）

# 「ABCDEFGHIJ」の3文字目から7文字目を抜き出す
str="ABCDEFGHIJ"
start=3
end=7

# bashの場合、開始位置（0から数える）と長さを指定する
# 「$(( 数式 ))」はbashの機能
offset=$(( start - 1 ))        # 開始位置（0=最初の文字）
length=$(( end - start + 1 ))  # 取り出す長さ

# 文字列を取りだし、結果を表示
substr=${str:offset:length}
echo "$substr"
