#!/bin/sh

# relpath2abs.sh - 相対パスを絶対パスにする

# $1が空の場合（引数が1つもない場合）、説明を表示
if [ -z "$1" ]; then
    echo "usage: relpath2abs.sh path"
    exit 1
fi

# 引数が「/」から始まっているか（絶対パスかどうか）を調べる。exprの引数
# に「/」1文字を指定すると割り算記号と間違えられてエラーになるので、前
# に余分な文字「x」を置いている。
if [ `expr x"$1" : x'/'` -ne 0 ]; then
    rel="$1"       # 引数が絶対パス（「..」などが含まれていれば処理）
else
    rel="$PWD/$1"  # 引数が相対パス
fi

abs="/"
IFS='/'  # 単語区切りを「/」にする
for comp in $rel; do  # 相対パスの要素について繰り返す
    case "$comp" in
	'.'|'')  # 「/./」「//」→「/」
	    continue
	    ;;
	'..')    # 「..」の場合、絶対パスの最後の要素を取り除く
	    abs=`dirname "$abs"`
	    ;;
	*)       # その他の場合、要素を絶対パスの最後に追加
	    [ "$abs" = "/" ] && abs="/$comp" || abs="$abs/$comp"
	    ;;
    esac
done

echo "$abs"  # 結果を表示
