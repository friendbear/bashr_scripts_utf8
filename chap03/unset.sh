#!/bin/sh

# unset.sh - 変数の定義を取り消す

# fooに値を設定する
foo="bar"
echo "Before unset: $foo"

# fooを取り消す
unset foo
echo " After unset: $foo"

# 環境変数も取り消すことができる
unset PATH
ls
