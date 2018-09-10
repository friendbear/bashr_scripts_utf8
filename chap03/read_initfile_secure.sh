#!/bin/sh

# read_initfile_secure.sh - 設定ファイル内容を読み込む（上級編）

# 動作がわかりにくいときには次の行のコメントを外す
#set -x

# 攻撃に成功した場合、この関数が実行される
danger_command() {
    echo "*** Your data has been lost... ***"
}

# 初期設定ファイルを読み込んで変数に値をセットする
read_init_secure() {
    while read line; do
	# 変数名に英数字以外のものが含まれている場合や、
	# var=valueの形式になっていない行はエラー
	if echo "$line" | grep -q '^[a-zA-Z][a-zA-Z0-9]*='; then         ##[A]
	    varname=`echo "$line" | sed 's/=.*//'`                       ##[B]
	    value=`echo "$line" | sed 's/^.*=//'`
	    eval "conf_${varname}=\"\$value\""                           ##[C]
	    #eval "conf_${varname}=\"$value\""  # 攻撃を受ける例
	else
	    echo "error: $line"                                          ##[D]
	fi
    done
}

# 設定ファイルを読み込む。ここではヒアドキュメントを使っているが、本来
# なら「read_init_source < config.file」のように使う。
read_init_secure <<EOF
safe=foo bar
danger1; danger_command here; =baz baz
danger2=baz baz; danger_command here
danger3=foo bar" ; danger_command here "
0invalidname=foo bar
EOF

# 設定した変数の一覧を表示
set | grep '^conf_'
