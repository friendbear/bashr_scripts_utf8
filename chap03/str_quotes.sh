#!/bin/sh

# str_quotes.sh - 引用符の違い

# 引数の数と一覧を表示する
showargs() {
    echo "Number of args: $#"
    echo "List of args:"
    for arg in "$@"; do    # 全ての引数について繰り返す
	echo "  $arg"
    done
}

# testvarに空白を含む文字列を代入
testvar="abc def ghi"

# 「"$testvar"」の場合
echo "*** Quoted by \"...\" ****"
showargs "$testvar"

# 「'$testvar'」の場合（変数が展開されない）
echo "*** Quoted by '...'  ***"
showargs '$testvar'

# 「$testvar」の場合（空白で単語が分割される）
echo "*** Not quoted ***"
showargs $testvar
