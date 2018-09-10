#!/bin/sh

# if_neg.sh - if文の条件を反転する

# trueコマンドは常に真（終了コード0）を返す
if ! true; then
    echo true
else
    echo false
fi
