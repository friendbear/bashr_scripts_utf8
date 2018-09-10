#!/bin/sh

# chk_root.sh - 自分がrootかどうかを調べる

if [ `id -u` -eq 0 ]; then
    echo "I am root!"
    exit 0
else
    echo "I wanna be a superuser..."
    exit 1
fi
