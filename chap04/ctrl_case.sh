#!/bin/sh

# ctrl_case.sh - case文の例

echo "Enter yes or no."
read yesno  # 標準入力から1行読み込み、変数yesnoに代入する
case "$yesno" in
    y*|Y*)  # yもしくはYから始まる文字列全て
	echo "Your answer is YES."
	;;
    [nN]*)  # nもしくはNから始まる文字列全て
	echo "Your answer is NO."
	;;
    *)      # 上記のいずれにも当てはまらない場合
	echo "Your answer is ambigous."
esac
