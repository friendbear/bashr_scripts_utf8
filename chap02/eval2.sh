#!/bin/sh

# eval2.sh - コマンドの出力をスクリプトとして実行する

# 以下の2行が実行される
## echo "Implanted code was executed!"
## foo="BAR"

# このスクリプト自身から「## 」から始まる行を探して、行頭の「## 」を
# 取り除いて表示する。$0はこのスクリプトのファイル名を表す。
grep '^## ' $0 | sed 's/^## //'
echo "---"

# 同じものをshにリダイレクトして実行
grep '^## ' $0 | sed 's/^## //' | sh
echo "foo=$foo"  # fooは空のまま

# 今度はevalで実行
eval "`grep '^## ' $0 | sed 's/^## //'`"
echo "foo=$foo"  # fooに値がセットされている
