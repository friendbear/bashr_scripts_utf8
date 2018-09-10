#!/bin/sh

# float.sh - bcを使った浮動小数点演算

# シェル変数を定義
A=5
B=7

# scaleを設定しないと小数点以下が切り捨てられる
echo 'scale=5; sqrt(1/3)' | bc

# ヒアドキュメントを使った書き方もできる
bc <<EOF
scale=3
($A + 2) * $B / 11
EOF
