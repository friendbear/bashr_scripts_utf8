#!/bin/bash

# intvar.sh - bashの整数変数の例

# i, j, kを整数変数として宣言する
declare -i i j k

i=3
j=4
k=i*j          # 四則演算
i='(i+123)/j'  # ( ) を使う場合、右辺全体を "..." や '...' で括る

echo "i=$i j=$j k=$k"
