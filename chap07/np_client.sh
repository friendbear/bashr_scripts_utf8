#!/bin/sh

# np_client.sh - 名前付きパイプを使ったクライアント・プロセス

PIPE=/tmp/np_server.pipe

# サーバが実行中かどうか確認
if [ ! -e $PIPE ]; then
    # 名前付きパイプが存在しない場合、エラーを表示して終了
    echo "np_server.sh is not running."
    exit 1
fi

# サーバと接続し、バージョンを確認
echo "SVER" >>$PIPE
read code ver <$PIPE
echo "Connected to np_server.sh (ver $ver)"

# 標準入力から読み込んだデータをサーバに送信し、単語数を得る
wcnt=0
while read line; do
    echo WCNT "$line" >> $PIPE
    read code c < $PIPE
    wcnt=`expr $wcnt + $c`
done

# 合計の単語数を表示
echo $wcnt
