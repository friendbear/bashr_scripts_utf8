#!/bin/sh

## command.sh - 組み込みコマンドを優先して呼び出す

##
## 注意！ このスクリプトは暴走します
##

## 正しい使い方の例
cd() {                                # cdを関数定義
    echo "New current directory: $1"
    command cd $1                     # 組み込みのcdを呼び出す
}

## 間違いの例
pwd() {                               # pwdを関数定義
    echo -n "Current directory: "
    #echo "Current directory: \c"     # Solarisの場合
    pwd                   # 組み込みのpwdではなく、自分自身が呼び出される
}                         # （エラーになるまで）永遠に自分自身を呼び出し続ける

cd /
pwd
