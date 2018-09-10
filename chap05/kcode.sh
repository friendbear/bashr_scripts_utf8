#!/bin/sh

# kcode.sh - 漢字コードを判別して表示する

# 入力の最初の10行だけを読み込む。入力ファイルが指定されていない時には
# 標準入力(/dev/fd/0)から読み込む。
src=`head "${1:-/dev/fd/0}"`
kcode="(unknown)"

# それぞれの文字コードに変換してみて、元と変わらなければ正しい文字コー
# ドと判断する。
for guess in "-w UTF-8" "-e EUC-JP" "-s Shift-JIS" "-j JIS"; do
    set -- $guess  # $1=オプション $2=文字コード名
    out=`echo "$src" | nkf $1`
    if [ "$src" = "$out" ]; then
	kcode=$2
	break;
    fi
done

echo "$kcode"
