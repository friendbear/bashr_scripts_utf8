#!/bin/sh

# str_match_expr.sh - 正規表現に一致する部分を抜き出す

# 処理対象の文字列（HTMLの一部）
text="<a target=WINDOW href=URL>ANCHOR</a>"

# タグやアンカーの必要部分を抜き出す
expr "$text" : '.* \(target=[^ >]*\)'
expr "$text" : '.* href=\([^ >]*\)'
expr "$text" : '.*>\(.*\)<'
