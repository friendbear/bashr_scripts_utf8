#!/bin/sh

# autoresponder.sh - メールに自動返信する

FROM_ADDRESS="query@nnip.org"
TAB=`printf "\t"`

# cleanup
#     シェルスクリプト中断・終了時に呼び出される関数
cleanup() {
    [ -n "$temp" ] && rm $temp
}


# header
#     指定されたヘッダの内容を抜き出す
header() {
    sed '/^$/q' $temp | grep -i "$1:" | sed 's/.*:[ $TAB]*\(.*\)/\1/'
    # sedでメッセージの先頭から空行（/^$/）までを抜き出し、
    # grepで指定されたヘッダの行を抜き出し、
    # sedでヘッダの内容だけを取り出す。
    # 「:」の後には0個以上の空白もしくはタブがあるかもしれない。
}


# 受信メッセージをテンポラリファイルに保存する
trap cleanup EXIT
trap exit INT
temp=`mktemp /tmp/autoresponder.XXXXXXXX` || exit 1
chmod 600 $temp
cat >> $temp

# 新しいメールを作成
mail_send.sh --send <<EOF
From: $FROM_ADDRESS
To: `header from`
Subject: お問い合わせありがとうございます
In-Reply-To: `header message-id`

この度はお問い合わせありがとうございます。
お客様よりのお問い合わせ内容については、弊社担当者が2営業日以内に
メールにて回答申し上げます。

...
EOF
