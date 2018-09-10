#!/bin/sh

# tee.sh - teeコマンドの例

# lsの出力をlist.txtに書き込む
# さらに、逆順にソートしたものをlist_rev.txtに書き込む
ls | tee list.txt | sort -r > list_rev.txt
