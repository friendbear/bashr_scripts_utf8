#!/bin/sh

# ftime_gnu.sh - ファイルの更新日付を調べる（Linux編）

# lsの出力を単語に分割
set -- `ls -l -d --full-time "$1"`

shift 5  # 項目数が多いのでshiftしておく

# 分解結果
# $1 - 曜日
# $2 - 月
# $3 - 日
# $4 - 時:分:秒
# $5 - 年

# 結果を表示する
month=`printf '%02d' $2`  # 01-12
day=`printf '%02d' $3`    # 01-31
echo "$5/$month/$day $4"
