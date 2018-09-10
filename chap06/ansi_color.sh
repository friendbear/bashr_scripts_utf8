#!/bin/sh

# ansi_color.sh - 文字の色を変える

# ESCキャラクタを代入する
ESC=`printf "\033"`

# echo_n - 改行しないechoコマンド
echo_n() {
    echo $ECHO_N "$*"$ECHO_C
}

# echoコマンドの互換性をセットする
if [ -z `echo -n` ]; then
    # Solaris以外
    ECHO_N="-n"
    ECHO_C=""
else
    # Solarisの場合
    ECHO_N=""
    ECHO_C="\c"
fi

# 文字色と属性を変化させる
for color in 30 31 32 33 34 35 36 37; do
    for attr in 0 1 4 5 7; do
	echo_n "${ESC}[${attr};${color}mCOLOR${ESC}[0m "
    done
    echo
done

# 文字色と背景色を変化させる
for fgcolor in 30 31 32 33 34 35 36 37; do
    for bgcolor in 40 41 42 43 44 45 46 47; do
	echo_n "${ESC}[${fgcolor};${bgcolor}mCOLOR${ESC}[0m "
    done
    echo
done
