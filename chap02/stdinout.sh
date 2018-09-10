#!/bin/sh

# stdinout.sh - 標準入出力の使い方

# lsはファイルの一覧を標準出力に書き込むコマンド。
ls

# lsの標準出力が、lessの標準入力に接続される。
# lessは、ファイル名を指定しない場合、標準入力からデータを読み込み
# 1ページずつ標準出力に書き込む。
ls | less  

# lsの標準出力が、ファイルlist.outに接続される
# （lsの結果がlist.outに書き込まれる）
ls > list.out

# lessの標準入力が、ファイルlist.outに接続される
# （list.outの内容が1ページずつ表示される）
less < list.out
