#!/bin/sh

# envvar.sh - 環境変数の例

# 環境変数に値を設定する
export USERNAME REALNAME
USERNAME=ichiro
REALNAME="SUZUKI Ichiro"

# 基本的な使い方はシェル変数と同じ
echo "Hello, $REALNAME"
echo "${USERNAME}san's mailbox is empty."

# 環境変数は子プロセスに引き継がれる
sh -c 'echo "REALNAME in child process: $REALNAME"'

# が、親プロセスには反映しない
sh -c 'REALNAME="NAKAHASHI Ichiro"'
echo "REALNAME has been changed in child process: $REALNAME"
