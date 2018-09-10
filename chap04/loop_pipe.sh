#!/bin/sh

# loop_pipe.sh - 繰り返し処理の出力をパイプに流し込む

for capital in London Paris Beijing Pusan Washington; do
    echo "$capital"
done | sort
