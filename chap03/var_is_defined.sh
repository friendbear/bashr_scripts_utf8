#!/bin/sh

# var_is_defined.sh - 変数が定義されているかどうかを調べる

is_defined() {
    varname="$1"
    if set | grep -q "^${varname}="; then
	echo "${varname} is defined."
    else
	echo "${varname} is NOT defined."
    fi
}

# fooは空だが、定義されている
foo=""

is_defined "PATH"
is_defined "foo"
is_defined "bar"

# fooの定義を取り消して、改めて調べてみる
unset foo
is_defined "foo"
