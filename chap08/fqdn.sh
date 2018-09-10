#!/bin/sh

# fqdn.sh - ホストのFQDN（完全修飾ドメイン名）を得る

_IFS="$IFS"
DOMAIN_ONLY=NO

# 「-d」オプションでドメイン名のみを表示（ホスト名を表示しない）
[ "$1" = "-d" ] && DOMAIN_ONLY=YES

# hostnameコマンドの結果を「.」で区切り、引数リストにセット
host=`hostname`
IFS="."
set -- $host
IFS="$_IFS"

# $#（引数の数）が1の場合、hostnameコマンドの結果はホスト名のみ
# （ドメイン名を含まない）
if [ $# -eq 1 ]; then
    # hostnameがホスト名のみを返した場合、/etc/resolv.conf中の
    # 「domain DOMAIN」からドメイン名を得る
    host=$1
    set -- `grep '^domain[ \t]' /etc/resolv.conf`
    domain=$2
else
    # hostnameがFQDNを返した場合
    host=$1
    shift
    IFS="."
    domain="$*"
    IFS="$_IFS"
fi

# 結果を表示する
if [ $DOMAIN_ONLY = YES ]; then
    echo "$domain"
else
    echo "$host.$domain"
fi
