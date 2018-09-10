#!/bin/bash

# array_diff.sh - 配列の差分を取る

# 処理対象
array1=('Tokyo' 'Beijing' 'Washington D.C.' 'London' 'Paris')
array2=('Paris' 'Pusan' 'London' 'Kuala Lumpur' 'Tokyo' 'Canberra')

# IFSに改行文字をセットし、単語の区切りを変更する
IFS=$'\n'

# まず、両方の配列に含まれる項目を抜き出す
both=(`{ echo "${array1[*]}"; echo "${array2[*]}"; } | sort | uniq -d`)

# array1から重複部分を取り除くと、array1には含まれるがarray2には含まれ
# ない項目が取り出せる
only1=(`{ echo "${array1[*]}"; echo "${both[*]}"; } | sort | uniq -u`)

# 結果を表示
echo "${only1[*]}"
