#!/bin/sh

# loop_over_files.sh - ファイルの一覧に対して繰り返す

for name in "$1"/*; do
    if [ -f "$name" ]; then
	echo "$name (regular file)"
    elif [ -d "$name" ]; then
	echo "$name (directory)"
    else
	echo "$name (other type)"
    fi
done
