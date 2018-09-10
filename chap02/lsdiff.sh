#!/bin/bash
#   ↑bashの拡張機能を有効にするために、/bin/bashで呼び出す

# lsdiff.sh - 「<(command)」の例

# 引数の数が2個でない場合には、エラーを表示して終了
if [ "$#" -ne 2 ]; then
    echo "usage: lsdiff DIR1 DIR2"
    exit 1
fi

# 2つのディレクトリの内容をdiffで比較する
# （「tput cols」は、使用中の端末の横幅を返す）
diff -y --width=`tput cols` <( ls "$1" ) <( ls "$2" )
#diff <( ls "$1" ) <( ls "$2" )  # Solarisのdiffには-yオプションがない
