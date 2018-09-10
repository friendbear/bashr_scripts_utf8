#!/bin/sh

# abspath2rel.sh - 絶対パスを相対パスにする

# $1が空の場合（引数が1つもない場合）、説明を表示
if [ -z "$1" ]; then
    echo "usage: abspath2rel.sh abs_path"
    exit 1
fi

# 引数が「/」から始まっているか（絶対パスかどうか）を調べる。exprの引数
# に「/」1文字を指定すると割り算記号と間違えられてエラーになるので、前に
# 余分な文字「x」を置いている。
if [ `expr x"$1" : x'/'` -eq 0 ]; then
    # 引数が相対パスなので、エラー
    echo "$1: not an absolute path"
    exit 1
fi

org=`expr x"$PWD" : x'/\(.*\)'`  # 基準ディレクトリ（最初の「/」は除く）
abs=`expr x"$1"   : x'/\(.*\)'`  # 絶対パス（最初の「/」は除く）
rel="."                          # 相対パス
org1=""
abs1=""

# 頭から調べて、共通部分は省く
while true; do
    
    # 基準ディレクトリ、絶対パスの最初の要素を取り出す
    org1=`expr x"$org" : x'\([^/]*\)'`
    abs1=`expr x"$abs" : x'\([^/]*\)'`

    # 違っていればループを終了
    [ "$org1" != "$abs1" ] && break

    # 最初の要素を捨てる
    org=`expr x"$org" : x'[^/]*/\(.*\)'`
    abs=`expr x"$abs" : x'[^/]*/\(.*\)'`

done

if [ -n "$org" ]; then  # 基準ディレクトリの要素がまだ残っている場合
    _IFS="$IFS"; IFS='/'
    for c in $org; do   # 必要な階層分遡る
	rel="$rel/.."
    done
    IFS="$_IFS"
fi

if [ -n "$abs" ]; then  # 絶対パスの要素が残っている場合
    rel="$rel/$abs"     # 相対パスに付け加える
fi

rel=`expr x"$rel" : x'\./\(.*\)'`  # 先頭の「./」は取り除く
echo "$rel"
