#!/bin/sh

# is_host_alive.sh - 指定したホストが稼働中かどうかをpingを使って調べる

# Solaris以外でのpingコマンドの使い方
PING="ping"
PING_OPT="-c 1"
PING_ALIVE=' 0%'

# Solarisの場合、pingコマンドの使い方が異なる
if [ -x /usr/sbin/ping ]; then
    PING="/usr/sbin/ping"
    PING_OPT=""
    PING_ALIVE='alive'
fi

# Solarisでは「... is alive」
# それ以外では「..., 0% packet loss」の場合稼働中と判断する
$PING $PING_OPT $1 | grep -q "$PING_ALIVE"

# grepの終了コードから、指定したホストの状況を判断する
if [ $? -eq 0 ]; then
    echo $1 is alive
    exit 0
else
    echo $1 is not alive
    exit 1
fi
