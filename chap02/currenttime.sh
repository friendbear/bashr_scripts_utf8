#!/bin/sh

# currenttime.sh - 現在時刻を定期的にファイルに保存する

# do ... doneの間を永遠に繰り返す
while true; do
    # 現在時刻をホームディレクトリのcurrenttimeに書き込む
    date +'%H:%M:%S' >"$HOME/currenttime"
    # 1秒待つ
    sleep 1
done
