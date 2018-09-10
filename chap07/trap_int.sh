#!/bin/sh

# trap_int.sh - trapコマンドのサンプル

# INTシグナルを無視する
trap 'echo "SIGINT was ignored."' INT

# 時間のかかる処理
for i in one two three four five; do
    echo $i
    sleep 1
done
