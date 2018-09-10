#!/bin/bash

# array_bash_paren.sh - bash配列変数に一度に値をセットする

# ( ... ) で囲まれた単語が配列になる
array=(first "second" 'third with space' fourth\ with\ space)

# 各要素を表示
for n in 0 1 2 3; do
    echo "${array[$n]}"
done
