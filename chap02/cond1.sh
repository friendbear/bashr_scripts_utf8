#!/bin/sh

# cond1.sh - 「&&」の例

# [A] makeが成功した場合のみ、make installを実行する
make && make install

# [B] 3つ以上のコマンドを続けて書くこともできる
configure && make && make install

# [C] 「&&」の後で改行しても構わない
configure &&
make &&
make install &&
make clean
