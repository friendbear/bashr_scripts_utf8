#!/bin/sh

# str_special.sh - 制御文字を含む文字列

# 16進数のダンプリストを表示するコマンドを探す
# （Solarisではodを、それ以外ではhexdumpを使う）
hexdump=`which hexdump 2>/dev/null`
if [ -x "$hexdump" ]; then
    DUMP="hexdump -C"
else
    DUMP="od -tx1"
fi


## 直接代入
str=':
	'            # 目に見えないが「':<ENTER><TAB>'」と入力している
echo "$str" | $DUMP  # 文字列の16進ダンプを表示する


## printfを使って代入
str=`printf ':\n\t'`
        # 「`...`」（コマンド置換）では最後の改行文字が取り除かれるので、
        # 「str=`printf ':\t\n'`」ではうまくいかない。
echo "$str" | $DUMP  # 文字列の16進ダンプを表示する

## bashの「$'...'」を使って代入
str=$':\n\t'         # この表現はbashのみ使える
echo "$str" | $DUMP  # 文字列の16進ダンプを表示する
