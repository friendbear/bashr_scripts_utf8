#!/bin/sh

# dir.sh - 指定したディレクトリ内のファイルの一覧を表示する

dir="$1"

# 指定されたディレクトリ内のファイルの一覧が $1, $2... にセットされる
set -- "$dir"/*

# 情報を表示
echo "Directory: $dir"
echo "Number of files: $#"
echo "List of files:"

# $1,$2...（ファイルの一覧）について繰り返す
for name do
    echo "  $name"
done
