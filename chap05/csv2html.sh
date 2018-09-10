#!/bin/sh

# csv2html.sh - CVSファイルをHTMLの表にする

# read -r が使えるかどうかを調べる
if echo | read -r 2>/dev/null; then
    READ_R="-r"
else
    READ_R=""
fi

# 引数の数が不正の場合、説明を表示
if [ $# -ne 1 ]; then
    echo "usage: cvs2html.sh csvfile"
    exit 1
fi

# 変数LFに改行文字を代入
LF='
'

echo '<TABLE>'

# readコマンドを実行中のみ、IFS=改行文字 になる
while IFS="$LF" read $READ_R record; do
    echo '<TR>'
    IFS=','
    set -- $record  # 「,」で分解
    for col do     # $1, $2... について繰り返す
	echo "<TD>$col</TD>"
    done
    echo '</TR>'
done < "$1"

echo '</TABLE>'
