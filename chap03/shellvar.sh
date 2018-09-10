#!/bin/sh

# shellvar.sh - シェル変数の例

# シェル変数に値を設定する
username=ichiro
realname="SUZUKI Ichiro"

# 「$変数名」でOKの場合
echo "Hello, $realname"

# 「{}」を省略すると「$usernamesan」となり、うまくいかない
echo "${username}san's mailbox is empty."

# シェル変数は子プロセスには引き継がれない
sh -c 'echo "realname in child process: $realname"'
