#!/bin/sh
# chkconfig: 2345 95 05
# description: Just for test

# initscript_rh.sh - RedHat系Linuxの起動スクリプト

case $1 in
  start)
    # 起動時に目印となるファイルを作成し、10秒待つ
    touch /var/lock/subsys/initscript_rh.sh
    sleep 10
    exit 0
    ;;
  stop)
    # シャットダウン時に目印ファイルを消去し、10秒待つ
    rm /var/lock/subsys/initscript_rh.sh
    sleep 10
    exit 0
    ;;
esac

echo "usage: initscript_rh.sh {start|stop}"
exit 1
