#!/bin/sh

# source_sub.sh - sourceコマンドの例（読み込まれる側）

# unameコマンドは、OSのバージョンやCPUの種類などを表示する

get_systype() {
    MACHINE=`uname -m`
    PROCESSOR=`uname -p`
    OS=`uname -s`
}
