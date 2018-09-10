#!/bin/sh

# mail_send.sh - メールの体裁を整え、必要であれば送信する

# メッセージを標準入力から受け取り、漢字コードの変換・ヘッダのMIMEエン
# コードを行った後、標準出力に書き出す（オプション「--send」）が指定さ
# れていれば、送信する）。
#
# 「From:」「Message-Id:」ヘッダがない場合には、付け加える。sendmailの
# 「-f」オプションには常にFROM_ADDRESS（このスクリプト中で定義）が渡さ
# れる。

# sendmailの位置を調べる
if [ -x /usr/sbin/sendmail ]; then
    SENDMAIL_PATH="/usr/sbin/sendmail"
elif [ -x /usr/lib/sendmail ]; then
    SENDMAIL_PATH="/usr/lib/sendmail"
else
    echo "sendmail not found."
    exit 1
fi

# From: に設定するアドレスを設定
FROM_ADDRESS="ichiro@nnip.org"
FROM_REALNAME="中橋 一朗"

LF='
'

# サポートされていれば「read -r」を使う
if echo x | read -r 2>/dev/null; then
    READ_R="-r"
else
    READ_R=""
fi


# tohex
#     標準入力から読み込んだデータを16進でダンプする関数

tohex() {
    od -x | head -1 | sed -e 's/[^ ]* //' -e 's/ //g'
}


# msgid
#     Message-Idを生成する関数

msgid() {
    # 具体的な生成方法は定まっていないが、全てのメッセージが異なる
    # Message-Idを持つようにする。ここに挙げたのは一例。

    # 日付と時刻
    datestr=`date +%Y%m%d.%H%M%S`
    # /dev/randomから8バイト読み込んで16進表記にする
    random=`dd if=/dev/random bs=8 count=1 2>/dev/null | tohex`

    # 差出人のメールアドレスからドメイン名を取り出す
    domain=`expr "$FROM_ADDRESS" : ".*@\(.*\)"`

    echo "$datestr-$$-$random@$domain"
}


# fixheader
#     欠けているヘッダがあれば追加する関数

fixheader() {
    # 標準入力からメッセージを読み込み、ヘッダ部だけを抜き出す
    header=""
    while read $READ_R line; do
	[ -z "$line" ] && break
	header="$header$line$LF"
    done

    # ヘッダを調べる
    ## 書籍では grep -qvi を使っているが誤り。サポートwebサイト参照。
    if echo "$header" | grep -qi '^from:'; then
	:
    else
        # 「From:」が見つからない場合、追加する
	header="${header}From: $FROM_REALNAME <$FROM_ADDRESS>$LF"
    fi
    if echo "$header" | grep -qi '^message-id:'; then 
        :
    else
	# 「Message-Id:」が見つからない場合、追加する
	header="${header}Message-Id: <`msgid`>$LF"
    fi

    # ヘッダと本文を出力する
    echo "$header"
    cat
}

# コマンドラインオプションを処理する
if [ "$1" = "--send" ]; then
    emit="$SENDMAIL_PATH -t -f $FROM_ADDRESS"
    shift
else
    emit="cat"
fi
if [ -n "$1" ]; then
    echo "usage: mail_send.sh [--send]"
    exit 1
fi

# メールを処理
fixheader | nkf -j | enMime | $emit
