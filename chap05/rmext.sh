#!/bin/sh

# rmext.sh - ファイル名から拡張子を取り除く

# exprを使った処理
rmext_expr() {
    bname=`expr "$1" : '\(.*\)\.'`
    [ $? -eq 0 ] && echo "$bname" || echo "$1"
}

# sedを使った処理
rmext_sed() {
    echo "$1" | sed 's/\.[^.]*$//'
}

# exprバージョン、sedバージョンを選ぶ
rmext_expr "$1"
#rmext_sed "$1"
