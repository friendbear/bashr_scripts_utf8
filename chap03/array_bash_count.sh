#!/bin/bash

# array_bash_count.sh - bash配列変数の要素数を調べる

# 添字が連続している場合
sample1[0]="zero"
sample1[1]="one"
sample1[2]="two"
echo ${#sample1[*]}

# 添字が不連続の場合
sample2[1]="first"
sample2[7]="second"
sample2[10]="third"
echo ${#sample2[*]}
