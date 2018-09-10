#!/bin/sh

# stdinout_file.sh - 標準入出力を表すファイル名の例

# この例では、sortは/dev/fd/0（標準入力）からデータを受け取り、結果を
# /dev/fd/1（標準出力）に書き込む。つまり、「cat $0 | sort」と同じ。
# $0はスクリプトファイル自分自身のファイル名を表す。

cat $0 | sort -o /dev/fd/1 /dev/fd/0
