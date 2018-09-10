#!/bin/bash

# array_bash.sh - bashの配列変数

# 配列に値をセットする
sample[0]="zero"
sample[1]="one"
sample[2]="two"

# 各要素の値を表示
for i in 0 1 2; do
    echo "sample[$i]=${sample[$i]}"
done
