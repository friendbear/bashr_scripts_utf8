#!/bin/sh

# grouping.sh - グルーピングの例

# makeとmake installをバックグラウンドで実行する
# makeが成功した場合のみ、make installを実行する
{ make && make install; } &

# ファイルfirst, ファイルsecondの内容を続けてファイルthirdに書き込む
{ cat first; cat second; } > third
