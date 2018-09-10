#!/bin/sh

# metachar.sh - メタキャラクタの使い方

# showargs
#     引数の個数と一覧を表示する
showargs() {
    echo "Number of args: $#"
    echo "List of args:"
    for arg in "$@"; do    # 全ての引数について繰り返す
	echo "  $arg"
    done
}

# 適当な変数を定義しておく
meta='<VARIABLE>'

# 2番目の例では「$meta」が展開され、空白で単語に分割される
echo "*** Example 1 ***"
showargs word\ contains\ spaces\ with\ \$meta\ character
showargs words separated by spaces, without $meta character

# 2番目の例では「$meta」「`date`」が展開される
echo "*** Example 2 ***"
showargs "Quoted \"string\" with \$meta character: \`date\`"
showargs "Without $meta chacacter: `date`"

# 文脈によってメタキャラクタの働きが違う例
echo "*** Example 3 ***"
showargs Single-Quote-\' "Single-Quote-\'"
