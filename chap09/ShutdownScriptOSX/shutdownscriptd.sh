#!/bin/sh

# shutdownscriptd.sh - Mac OS Xでシャットダウン時の処理を可能にする

# at_shutdown
#     シャットダウン時に実行される関数
at_shutdown() {
    # 目印となるファイルを作成する
    touch /shutdown-stamp
}

# シャットダウン時、このスクリプトが終了されると at_shutdown が実行される
trap 'at_shutdown' EXIT

# シャットダウンされるまで、適当に時間を潰す
while true; do
    sleep 3600
done
