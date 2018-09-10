#!/bin/sh

# ps_log.sh - psコマンドの実行結果を定期的に記録
#            （シグナルを用いたサーバ・プロセスの例）

PS_LOG=/tmp/ps.log

# do_start
#     記録を開始する関数
do_start() {
    echo "=== `date`: start logging" >> $PS_LOG
    do_log=YES
}

# do_stop
#     記録を停止する関数
do_stop() {
    echo "=== `date`: stop logging" >> $PS_LOG
    do_log=NO
}

do_log=NO

# シグナルにより、記録開始・停止の関数が呼び出されるようにする
trap do_start USR1
trap do_stop USR2

# メインループ
while true; do
    sleep 1
    if [ "$do_log" = "YES" ]; then
	echo >> $PS_LOG
	echo "*** `date`" >> $PS_LOG
	ps x >> $PS_LOG
	#ps -a >> $PS_LOG  # Solaris
    fi
done
