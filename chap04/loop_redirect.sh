#!/bin/sh

# loop_redirect.sh - 繰り返し処理の出力をリダイレクトする

for name in *.txt; do
    echo "$name"
done >tmp.out
