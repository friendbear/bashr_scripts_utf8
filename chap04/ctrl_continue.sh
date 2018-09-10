#!/bin/sh

# ctrl_continue.sh - continueの例

# 奇数だけを表示する
for n in 1 2 3 4 5 6 7 8 9 10; do
    r=`expr $n % 2`           # a÷bの余りを計算する
    [ $r -eq 0 ] && continue  # 余りが0の場合、次の繰り返しへ
    echo "$n is odd"          # 奇数の場合は表示
done
