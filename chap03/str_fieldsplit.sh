#!/bin/sh

# str_fieldsplit.sh - 文字列をフィールドに分割する

# 対象の文字列
text="field1,field2,field3,field4,field5"

_IFS="$IFS"   # IFSの内容を保存しておく
IFS=','       # 区切り文字を「,」にする
set -- $text  # 分割: $1,...$9などに結果が入る
IFS="$_IFS"   # IFSの内容を元に戻す

# 結果を表示する
echo "$2"
echo "$4"
