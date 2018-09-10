#!/bin/sh

# func_args.sh - 関数に引数を渡す

# 関数arg_reportは、与えられた引数の総数と、最初の3つの引数を表示する
arg_report() {
    echo "Number of args: $#"
    echo "     First arg: $1"
    echo "    Second arg: $2"
    echo "     Third arg: $3"
}

# いろいろな引数と共に呼び出してみる
arg_report foo
arg_report foo bar
arg_report foo bar "baz baz"
