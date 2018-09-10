#!/bin/sh

# file_exist.sh - ファイルが存在するかどうかを調べる

if [ -f "$1" ]; then
    echo "$1 exists"
else
    echo "$1 does not exist"
fi
