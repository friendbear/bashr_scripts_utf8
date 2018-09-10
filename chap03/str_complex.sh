#!/bin/sh

# str_complex.sh - 入れ子になった文字列

# do_manytimes
#    引数$1に与えられた文字列を、コマンドとして3回繰り返し実行する
do_manytimes() {
    for count in 1 2 3; do
	eval "$1"
    done
    echo
}

# いろいろな引数でdo_manytimesを呼び出す
do_manytimes 'echo "Example A - $count"'     # [A] これはOK
do_manytimes "echo \"Example B - $count\""   # [B] これはうまくいかない
do_manytimes "echo \"Example C - \$count\""  # [C] これもOK
