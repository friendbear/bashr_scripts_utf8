#!/bin/sh

# www_get.sh - httpプロトコルでファイルを取り寄せる

CR=`printf "\r"`

# URLからホスト名だけを抜き出す
url="$1"
host=`expr "$1" : "http://\([^/]*\)"`

# sedコマンドで最初の空行まで（ヘッダ部）を取り除く。ヘッダの改行コード
# はCR-LFなので、空行の正規表現は「^」+CR+「$」となる。送られてきたデー
# タがエンコードされていた場合などについては、ここでは考えない。

cat <<EOF | nc $host 80 | sed "1,/^${CR}\$/d"
GET $url HTTP/1.0

EOF
