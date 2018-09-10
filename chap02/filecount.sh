#!/bin/sh

# filecount.sh - ファイルの数を数える

# 指定したディレクトリ以下の全ディレクトリについて、
# 含まれるファイル・ディレクトリの数を数えて報告する。

do_list() {
    # この関数は再帰的（自分自身を呼び出す）なので、変数をローカル宣言する
    local dir count
    dir="$1"
    count=0

    #「${dir}/*」で表される全てのファイル・ディレクトリについて繰り返す
    for fn in ${dir}/*; do
	if [ -d "$fn" ]; then   #ディレクトリであれば、再帰呼び出し
	    do_list "${fn}"
	fi
	count=`expr $count + 1` #ファイルの個数を数える
    done
    echo "${count} ${dir}"
}

do_list $1
