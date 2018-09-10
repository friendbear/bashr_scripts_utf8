#!/bin/sh

# echo.sh - echoのサンプル

# 空白を含む場合
echo 1: Hoge   Hoge
echo "2: Hoge   Hoge"

# 特別な記号を含む場合
echo 3: *.sh $PWD
echo "4: *.sh $PWD"
echo '5: *.sh $PWD'
