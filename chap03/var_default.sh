#!/bin/sh

# var_default.sh - 変数のデフォルト値

# 変数に値がセットされている場合、その値が使われる
fruit="an orange"
echo "Do you have ${fruit:-some fruit}?"

# 変数が空の場合、指定されたデフォルト値が使われる
fruit=
echo "Do you have ${fruit:-some fruit}?"

# 「${var:=default}」の場合、varが空ならdefaultが代入される
echo "My name is ${name:=Guest}."  # nameが未定義なので、"Guest"が代入される
echo "Hello, ${name}!"
