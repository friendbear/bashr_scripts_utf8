#!/bin/sh

# lang.sh - 言語環境を変更する例

# LANGの値を様々に変えてdateを実行する
for LANG in C ja_JP.eucJP ja_JP.UTF-8 en_US.ISO8859-1 fr_FR.ISO8859-1; do
    echo -n "$LANG -- "
    #echo "$LANG -- \c"   # Solarisの場合
    date
done
