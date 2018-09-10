#!/bin/sh

# nice.sh - niceコマンドのサンプル

# do_load
#     システムに負荷をかける（CPU利用率を上げる）関数
do_load() {
    while true; do
	gzip -9 -c /bin/sh > /dev/null  # システムに負荷をかける
    done
}

# バックグラウンドでシステムに負荷をかける
do_load &
bgpid=$!

# 異なるnice値で同じプログラムを実行する
time nice -n 0  gzip -9 -c /bin/sh > /dev/null
time nice -n 10 gzip -9 -c /bin/sh > /dev/null
time nice -n 20 gzip -9 -c /bin/sh > /dev/null

# バックグラウンドプロセスを終了させる
kill $bgpid
