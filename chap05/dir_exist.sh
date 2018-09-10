#!/bin/sh

# dir_exist.sh - ディレクトリが存在するかどうかを調べる

if [ -d "$1" ]; then
    echo "$1 exists"
else
    echo "$1 does not exist"
fi
