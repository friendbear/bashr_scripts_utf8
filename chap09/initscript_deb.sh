#!/bin/sh

# initscript_deb.sh - Debian GNU/Linuxの起動スクリプト

case $1 in
  start)
    # 起動時にメッセージを表示し、10秒待つ
    echo -n "Running initscript_deb.sh for startup..."
    sleep 10
    echo "done."
    exit 0
    ;;
  stop)
    # シャットダウンにメッセージを表示し、10秒待つ
    echo -n "Running initscript_deb.sh for shutdown..."
    sleep 10
    echo "done."
    exit 0
    ;;
esac

echo "usage: initscript_deb.sh {start|stop}"
exit 1
