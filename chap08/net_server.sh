#!/bin/sh

# net_server.sh - tcpserverと組み合わせたネットワーク・サーバの例

echo "SAMPLE SERVER"

# クライアントから送信されるコマンドを読み込む
while read command; do
    set -- $command
    case $1 in
        DATE) # 日付を返す
            echo 0 `date +'%Y-%m-%d'`
            ;;
        TIME) # 時刻を返す
            echo 0 `date +'%H:%M:%S'`
            ;;
	EXIT) # 接続を終了
	    echo 0 "EXIT"
	    exit 0
	    ;;
        *)    # その他のコマンドはエラー
            echo 1 "Unknown command"
    esac
done
