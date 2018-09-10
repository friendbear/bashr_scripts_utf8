#!/bin/sh

# counttext.sh - カレントディレクトリにある.txtファイルの数を数える

# （注）普通は「ls *.txt | wc -l」で充分

count=0
for fname in *; do
    ext=`expr "$fname" : '.*\(\..*\)'`
    if [ "$ext" = ".txt" ]; then
	count=`expr $count + 1`
    fi
done
echo $count
