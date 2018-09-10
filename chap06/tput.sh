#!/bin/sh

# echo_n - 改行しないechoコマンド
echo_n() {
    echo $ECHO_N "$*"$ECHO_C
}

# echoコマンドの互換性をチェックする
if [ -z `echo -n` ]; then
    # Solaris以外
    ECHO_N="-n"
    ECHO_C=""
else
    # Solarisの場合
    ECHO_N=""
    ECHO_C="\c"
fi

# 画面の幅と高さ
cols=`tput cols`
lines=`tput lines`

# 画面をクリアする
echo_n `tput clear`

# 様々な属性で文字を描く
c=`expr $cols / 2 - 11`
echo_n `tput cup 2 $c`
echo_n "`tput rev`SAMPLE SCRIPT FOR TPUT`tput sgr0`"
echo_n `tput cup 5 $c`
echo_n "Number of lines:   `tput bold`$lines`tput sgr0`"
echo_n `tput cup 7 $c`
echo_n "Number of columns: `tput bold`$cols`tput sgr0`"
echo_n `tput cup 9 $c`
echo_n "`tput bold`BOLD`tput sgr0` "
echo_n "`tput rev`REVERSE`tput sgr0` "
echo_n "`tput smul`UNDERLINE`tput sgr0`"

# カーソル位置を画面の一番下に移動
r=`expr $lines - 1`
echo_n `tput cup $r 0`
