#!/bin/sh

# grepedit.sh - 正規表現にマッチする行をエディタで開く

# 引数の数が不正な場合、説明を表示する
if [ $# -ne 2 ]; then
    echo "usage: grepedit.sh regexp filename"
    exit 1
fi

regexp="$1"
filename="$2"

# 「grep -n」は、見つかった行を「行番号:内容」の形で表示する。
# パターンに一致する行があれば「$1」に行番号が得られる。
# 見つからなければ「NF」
IFS=':'
set -- `grep -n "$regexp" "$filename" || echo 'NF'`

# 正規表現にマッチする行が見つからなかった場合、エラーを表示
if [ "$1" = "NF" ]; then
    echo "pattern not found."
    exit 1
fi

# EDITORが設定されていない時はviを使う
${EDITOR:-vi} +$1 "$filename"
