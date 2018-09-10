#!/bin/sh

# logwatch.sh - システムログを監視する

# システムのログファイルの位置に応じて書き換える
LOGFILE=/var/log/system.log

# 「tail -f」でログファイルの追加分だけを順次出力
tail -f -n0 "$LOGFILE" | while read line; do
    # cronのログをチェックする
    # Solarisではログの保存場所、形式などが違うので動かない
    program=`expr "$line" : '.*(\(.*\))'`
    if [ -n "$program" ]; then
	printf "%s was executed by cron.\a\n" "$program"
    fi
done
