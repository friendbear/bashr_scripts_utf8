#!/bin/sh

# local.sh - ローカル変数の例

##
## ローカル変数を使わない例
##

# 関数の中と呼び出し元で、同じ名前の変数nameを使っているので、
# 期待通りに動作しない。
osname_global() {
    name=`uname -s`
    echo "OS name: $name"
}
name=`whoami`
osname_global  # 変数nameの中身が変わってしまう
echo "User name: $name"


##
## ローカル変数を使う例
##

# 関数の中で変数nameをローカル変数として宣言しているので、
# 呼び出し元の変数nameと干渉しない
osname_local() {
    local name
    name=`uname -s`
    echo "OS name: $name"
}
name=`whoami`
osname_local
echo "User name: $name"
