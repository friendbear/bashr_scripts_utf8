#!/bin/sh

# ulimit.sh - ulimitのサンプル

# CPU時間を制限する
ulimit -t 1

# 複雑な計算を永遠に繰り返す
i=1
while true; do
  i=`expr $i \* -5 + 20`
done
