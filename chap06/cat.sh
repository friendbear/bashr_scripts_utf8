#!/bin/sh

# animal.sh - 指定された動物の声で鳴く

# オプションが指定されていない場合、自分自身のスクリプト名から拡張子
# （.sh）を除いたものをオプションとして設定する。
# 例：cat.sh → animal.sh --cat
#     dog.sh → animal.sh --dog

# オプションが指定されていない場合、スクリプト名から拡張子（.sh）を
# 除いたものをオプションとして利用する。
# オプションが指定されていれば、それを利用する。
if [ -z "$1" ]; then
    opt=--`basename "$0" .sh`
else
    opt="$1"
fi

# オプションに応じて「鳴く」
case "$opt" in
    --dog)
	bow="Bowwow, bowwow";;
    --cat)
	bow="Meow, meow";;
    --cow)
	bow="Moo, moo";;
    --pig)
	bow="Oink, Oink";;
    *)
	bow="!?X, !?X"
esac
echo $bow
