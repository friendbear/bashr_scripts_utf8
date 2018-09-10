#!/bin/sh

# ctrl_if.sh - if文の例

# 「tty -s」は標準入力が端末の場合終了コード0を、端末でない場合は1を返
# す。
if tty -s; then
    # 端末で実行中
    echo "I'm running on a terminal."
else
    # 標準入力がパイプもしくはリダイレクトされている
    echo "Hmm, standard input is piped or redirected."
fi
