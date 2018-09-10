#!/bin/sh

# file_to_var.sh - ファイルの内容を変数に読み込む

# file.outの内容を変数msgに読み込む
msg=`cat file.out`
echo "$msg"
