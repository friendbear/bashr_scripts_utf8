#!/bin/sh

# dictionary.sh - 連想配列（辞書）を使う

# dict_put
#     辞書に値をセットする
# $1 - 辞書名
# $2 - キー
# $3 - 値
dict_put() {
    eval "$1_$2=\"\$3\""
}

# dict_get
#     辞書の値を取り出す
# $1 - 辞書名
# $2 - キー
dict_get() {
    eval "echo \${$1_$2}"
}

# dict_count
#     辞書の項目の数を数える
# $1 - 辞書名
dict_count() {
    set | grep "^$1_[0-9a-zA-Z]*=" | wc -l
}

# dict_keys
#     辞書のキーの一覧を返す
# $1 - 辞書名
dict_keys() {
    set | grep "^$1_[0-9a-zA-Z]*=" | sed -e 's/^.*_//' -e 's/=.*$//'
}

# 辞書に値をセット
dict_put capital "Japan" "Tokyo"
dict_put capital "US" "Washington"
dict_put capital "China" "Beijing"
dict_put capital "France" "Paris"

# 全ての項目について繰り返す
for k in `dict_keys capital`; do
    item=`dict_get capital "$k"`
    echo "The capital of $k is $item"
done

# 項目数を調べる
echo "Count: `dict_count capital`"
