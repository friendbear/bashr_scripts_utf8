#!/bin/sh

# array.sh - 配列を扱う

# array_put
#     配列に値をセットする
# $1 - 変数名
# $2 - インデックス（添え字）
# $3 - セットする値
array_put() {
    eval "$1_$2=\"\$3\""
}

# array_get
#     配列の値を取り出す
# $1 - 変数名
# $2 - インデックス（添え字）
array_get() {
    eval "echo \${$1_$2}"
}

# array_count
#     配列の要素の数を数える
# $1 - 変数名
array_count() {
    set | grep "^$1_[0-9]*=" | wc -l
}

# 配列に値をセットする
array_put sample 0 "zero"
array_put sample 1 "one"
array_put sample 2 "two"

# 各要素の値を表示
for i in 0 1 2; do
    item=`array_get sample $i`
    echo "sample_$i='$item'"
done

# 要素数を表示
echo "Count: `array_count sample`"
