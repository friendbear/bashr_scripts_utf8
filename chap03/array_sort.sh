#!/bin/bash

# array_sort.sh - bash配列変数の中身をソートする

# 処理対象の配列
array1=('Tokyo' 'Beijing' 'Washington D.C.' 'Longon' 'Paris')

# IFSに改行文字をセットして、「${array[*]}」で配列の内容が
# 1行に1要素ずつ出力されるようにする
IFS=$'\n'

# ソートして、結果を表示
array2=(`echo "${array1[*]}" | sort`)
echo "${array2[*]}"
