#!/bin/sh

# group_add.sh - グループを追加する

# 初期設定
MIN_GID=1000
MAX_GID=60000

# show_usage
#     使い方説明を表示する関数
show_usage() {
    echo 'usage: group_add.sh [-g gid] group'
    exit 1
}

# コマンドラインオプションを解析する
gid=''
while getopts 'g:' flag; do
    case "$flag" in
	g)
	    gid=$OPTARG
	    ;;
	*)
	    show_usage
	    ;;
    esac
done
shift `expr $OPTIND - 1`
[ -z "$1" ] && show_usage
group="$1"

# /etc/groupを読み込んで、新しいグループIDを決める
# グループ名の重複もチェック
# （「-g」オプションで指定されている場合には、重複が無いかチェックする）

# while...doneに対してリダイレクトを行うと、ループ全体がサブシェルで実
# 行されてしまう。Solairsの（伝統的な）/bin/shでは、サブシェル内での
# exitはサブシェルのみを終了するので、うまくいかない。execでリダイレク
# トを行えばカレントシェルで実行されるので問題ない。

newgid=$MIN_GID
exec 3<&0 </etc/group
while read entry; do
    echo "$entry" | grep '^#' >/dev/null && continue  # コメント行は読み飛ばす
    
    # エントリをフィールドに分割する
    # パスワードのフィールドが空の場合、setで切り分けられるように「x」を
    # 入れる
    IFS=":"
    set -- `echo "$entry" | sed 's/::/:x:/g'`
    IFS="$_IFS"
    n=$1
    i=$3

    # グループの重複をチェックする
    if [ "$n" = "$group" ]; then
	echo "Group $group already exists."
	exit 1
    fi

    # グループIDをチェック
    if [ -z "$gid" ]; then
	[ $i -lt $MAX_GID -a $i -gt $newgid ] && newgid=`expr $i + 1`
    else
	if [ $gid -eq $i ]; then
	    echo "Gid $gid already exists."
	    exit 1
	fi
    fi
done
exec 0<&3
[ -z "$gid" ] && gid=$newgid

# /etc/groupに新しいエントリを追加する
echo "$group:x:$gid:" >>/etc/group
echo "Group $group, gid $gid has been created."
exit 0
