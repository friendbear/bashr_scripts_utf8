#!/bin/sh

# read_initfile.sh - 初期設定ファイルを読み込む

# initfileを読み込む
. ./initfile  # 「.」は「source」の省略形

echo "*** System Analysis Report for ${hostname} ***"

# show_uptime=YESの場合、システムの稼働時間を表示する
if [ "$show_uptime" = "YES" ]; then
    uptime
fi

# show_numprocs=YESの場合、実行中のプロセスの数を表示する
if [ "$show_numprocs" = "YES" ]; then
    numprocs=`ps ax | wc -l`
    #numprocs=`ps -A | wc -l`  # Solarisの場合
    numprocs=`expr $numprocs - 1`
    echo "${numprocs} process(es) are running."
fi
