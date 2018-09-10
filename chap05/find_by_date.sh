#!/bin/sh

# find_by_date.sh - 指定された日時に更新されたファイルを検索する

# GNU dateがgnudateとしてインストールされている場合、それを使う
gnudate=`which gnudate`
[ -z "$gnudate" ] && gnudate="date"

# cleanup
#     スクリプトが中断・終了された時、この関数が実行される
cleanup() {
    [ -n "$start_tmp" ] && rm "$start_tmp"
    [ -n "$end_tmp"   ] && rm "$end_tmp"
}

# 引数の数が不正な場合、説明を表示
if [ $# -ne 2 ]; then
    echo "usage: find_by_date.sh dir date"
    exit 1
fi

# 引数の値をセット
dir="$1"
start_date=`$gnudate -d "$2" +%Y%m%d`0000      # 指定した日付
end_date=`$gnudate -d "1 day $2" +%Y%m%d`0000  # 指定した日付+1日

# 中断・終了時に関数cleanupを実行するように設定する
trap cleanup EXIT
trap exit INT      # Solarisの/bin/shのために必要

# 日付の基準となるテンポラリ・ファイルを作成する
start_tmp=`mktemp /tmp/fbd.XXXXXXXX` || exit 1
end_tmp=`mktemp /tmp/fbd.XXXXXXXX`   || exit 1
touch -t $start_date $start_tmp
touch -t $end_date   $end_tmp

# 「日付」より新しく、「日付+1日」より新しくないファイルを検索
find "$dir" -newer $start_tmp -not -newer $end_tmp
