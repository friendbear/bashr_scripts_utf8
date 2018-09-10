#!/bin/sh

# np_server.sh - 名前付きパイプを使ったサーバ・プロセス

# 初期設定
PIPE=/tmp/np_server.pipe
SVER=1

# cleanup
#     終了時に名前付きパイプを消去する
cleanup() {
    echo "cleanup" >&2
    [ -p $PIPE ] && rm $PIPE
    exit
}

# 既に名前付きパイプが存在する場合、エラーを表示して終了する
if [ -e $PIPE ]; then
    echo "Named pipe $PIPE already exist."
    echo "If it is sure that server is not running,"
    echo "remove it manually and restart server."
    exit 1
fi

# 名前付きパイプを作成する
trap cleanup INT TERM
mkfifo -m 600 $PIPE

# クライアントから送信されるコマンドを読み込む
while true; do
    read command <$PIPE
    set -- $command
    case $1 in
	WCNT) # 単語数を数える
	    echo 0 `expr $# - 1` >>$PIPE
	    ;;
	SVER) # サーバのバージョンを返す
	    echo 0 $SVER >>$PIPE
	    ;;
	*)    # その他のコマンドはエラー
	    echo 1 "Unknown command" >>$PIPE
    esac
done
