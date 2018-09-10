#!/bin/sh

# var_error.sh - 変数が定義されていない場合エラー

# ここにあなたの名前を書く
yourname=

# yournameが空の場合、エラーになる
echo "Good evening, ${yourname:?Please edit var_error.sh!}!"
