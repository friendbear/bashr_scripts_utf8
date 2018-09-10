#!/bin/sh

# cecho.sh - Solarisでも「echo -n」を使えるようにする

# 「echo -n」で「-n」が表示されるシステムでは、echoを関数として再定義す
# る。その他のシステムでは、何もしない。
if [ -n "`echo -n`" ]; then
    echo() {
	(  # Solarisではlocalが使えないので、サブシェルで変数を保護
	    if [ "$1" = "-n" ]; then
		shift
		postfix="\c"
	    else
		postfix=""
	    fi
	    command echo "$*$postfix"  # 本来のechoを実行
	)
    }
fi

# 動作テスト
echo -n "Hello, "
echo "world!"
