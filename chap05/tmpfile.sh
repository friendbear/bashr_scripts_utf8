#!/bin/sh

# tmpfile.sh - テンポラリファイルを作成する

# テンポラリファイルを作成（作成に失敗したら終了する）
tmpfile=`mktemp /tmp/scripttmp.XXXXXXXX` || exit 1

echo "hoge hoge" >>$tmpfile  # テンポラリファイルを使った処理
rm $tmpfile                  # 終わったら削除する

# /tmp 以外の場所にテンポラリファイルを作成する例
tmpfile=`mktemp "$HOME/tmp/scripttemp.XXXXXXXX"`|| exit 1
rm $tmpfile
