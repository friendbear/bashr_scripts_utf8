#!/bin/sh

# lsdaemon.sh - デーモンの実行状況を表示する

# 調べたいデーモンの一覧を空白で区切って書く
DAEMONS="cron crond cupsd inetd lpd named nmbd ntpd smbd sshd syslogd xinetd"

# psコマンドのオプションをOSに応じてセットする
if [ "`uname`" = "SunOS" ]; then
    PSCMD="ps -A -ocomm"
else
    PSCMD="ps axcww -ocommand"
fi

# 各デーモンの動作をチェックする
for daemon in $DAEMONS; do
    # 「\<」「\>」は単語の始まり、終わりにマッチする正規表現
    out=`$PSCMD | grep "\\<${daemon}\\>"`
    if [ -n "$out" ]; then
	status="RUNNING"
    else
	status="not found"
    fi
    printf "%-16s %s\n" "$daemon" "$status"
done
