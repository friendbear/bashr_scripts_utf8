#!/bin/sh

# background.sh - コマンドや関数をバックグラウンドで実行する

# 関数定義
bgfunc() {
    for i in 1 2 3 4 5; do  # ループ1（1秒おきに1,2,3,4,5と表示）
	echo $i
	sleep 1
    done
}

bgfunc &   # bgfuncをバックグラウンドで実行
for j in A B C D E; do      # ループ2（1秒おきにA,B,C,D,Eと表示）
    echo $j
    sleep 1
done
