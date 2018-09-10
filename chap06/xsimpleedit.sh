#!/bin/sh

# xsimpleedit.sh - シンプルなテキストエディタ

# 編集するファイル名を指定して起動する。「OK」をクリックすると、ユーザー
# に確認した上で、ファイルを上書き保存する。「Cancel」をクリックすると
# 保存せずに終了する。

if ! [ -f "$1" ]; then
    echo "usage: xsimpleedit.sh filename"
    exit 1
fi

tmp=`mktemp /tmp/xdialog.XXXXXXXX` || exit 1
if Xdialog --editbox "$1" 25 80 2>"$tmp"; then
    if Xdialog --yesno "Are you sure to overwrite '$1'?" 0 0; then
	cp "$tmp" "$1"
    fi
fi
rm "$tmp"
