#!/bin/sh

# cmddir.sh - 引数で指定されたコマンドが存在するディレクトリを表示する

fullpath=`which "$1"`   # コマンドのフルパス表記を得る
[ $? -ne 0 ] && exit 1  # コマンドが見つからない場合には終了

dirname "$fullpath"
