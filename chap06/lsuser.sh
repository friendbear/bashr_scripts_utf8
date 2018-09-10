#!/bin/sh

# lsuser.sh - システムに登録されているユーザーの一覧を表示する

# 変数LFに改行文字を代入
LF='
'

# 標準出力が端末なら、カラム表示をデフォルトにする。
if test -t 1; then
    column=YES
else
    column=NO
fi

# カラム表示のON/OFFはオプションで指定できる。
while getopts 1Ch flag; do
    case $flag in
	1)
	    column=NO ;;
	C)
	    column=YES ;;
	h)
	    echo "usage: lsuser.sh -1Ch"
	    exit 1 ;;
	*)
	    exit 1
    esac
done

# Darwin (Mac OS X) では、/etc/passwdは使わない。
if [ `uname` = "Darwin" ]; then
    show_passwd_db="nidump passwd ."
else
    show_passwd_db="cat /etc/passwd"
fi

# columnは入力をカラム表示に直すコマンド。残念ながらSolarisには存在しな
# い。
filter="cat"
if [ "$column" = "YES" ]; then
    if expr "x`which column`" : "x/" >/dev/null; then
	filter="column"
    else
	echo "Warning: This system does not have column command." >&2
    fi
fi

# 結果を表示する
IFS="$LF"
for record in `eval "$show_passwd_db"`; do
    IFS=':'
    set -- $record
    echo "$1"
done | $filter
