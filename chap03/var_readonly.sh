#!/bin/sh

# var_readonly.sh - 変数を読み出し専用にする

foo="foo bar bar"
readonly foo
foo="baz baz foo"  # エラーになる
