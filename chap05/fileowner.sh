#!/bin/sh

# fileowner.sh - ファイルの所有者を返す

# 与えられた引数の数が不正な場合、使い方を表示
if [ $# -ne 2 ]; then
    echo "usage: fileowner.sh -u|-g filename"
    exit 1
fi

# オプションを解析する
case "$1" in
    "-u")
	show="user"  ;;
    "-g")
	show="group" ;;
    *)
	echo "$1: unknown option"
	exit 1
esac

# 「ls -l」の出力をsetで単語に分解する。
set -- `ls -l -d "$2"`

# 分解結果
# $1 - アクセス権
# $2 - ハードリンク数
# $3 - 所有ユーザー
# $4 - 所有グループ
# $5 - サイズ
# $6 - 最終更新日の「月」
# $7 - 最終更新日の「日」
# $8 - 最終更新日の「年」もしくは「時:分」
# $9以降 - ファイル名

# 結果を表示
[ "$show" = "user" ] && echo "$3" || echo "$4"
