#!/bin/sh

# str_compare.sh - 文字列を比較する

# 比較用の文字列
str1="foo"
str2=""

# 「[」コマンドは、比較結果に応じた終了コードを返す
[ "$str1" = "foo" ];  echo $?
[ "$str1" != "foo" ]; echo $?

# if文を使って結果に応じた処理を行う
if [ "$str1" = "foo" ]; then
    echo '$str1 is foo'
else
    echo '$str1 is not foo'
fi

# このように書くこともできる
[ -z "$str2" ] && echo '$str2 is empty' || echo '$str2 is not empty'

# その他、複雑な条件の書き方
[ "$str1" = "foo" -a -z "$str2" ] && echo '$str1 is foo AND $str2 is empty'
[ "$str1" = "bar" -o -z "$str2" ] && echo '$str1 is bar OR $str2 is empty'
