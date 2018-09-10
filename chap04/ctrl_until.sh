#!/bin/sh

# ctrl_until.sh - untilの例

# 秘密の単語が入力されるまで繰り返す
# readは標準入力から1行読み込み、指定された変数に格納する組み込みコマンド
secret=''
until [ "$secret" = "secret" ]; do
    echo -n "Enter secret word: "
    # echo "Enter secret word: \c"  # Solaris
    read secret
done
echo "Bingo!"
