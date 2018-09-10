#!/bin/sh

# lspage.sh - ls コマンドの結果を1ページずつ表示する

ls "$@" | ${PAGER:-more}
