#!/bin/sh

# ip2host.sh - IPアドレスからホスト名を調べる

# r_host
#     hostコマンドを使ってホスト名を調べる
#     結果の一番最後の単語がホスト名
r_host() {
    set -- `host $1`
    shift `expr $# - 1`
    case $1 in
	*\(NXDOMAIN\))  # 見つからない場合
	    return 1 ;;
	*)
	    expr "$1" : "\(.*\)\."  # ホスト名の最後の「.」は取り除く
    esac
}

# r_nslookup
#     nslookupコマンドを使ってホスト名を調べる
#     「Name: HOSTNAME」という行を探し、HOSTNAMEを取り出す
r_nslookup() {
    set -- `/usr/sbin/nslookup $1 2>/dev/null | grep '^Name:'`
    if [ -n "$2" ]; then
	echo $2
    else
	return 1
    fi
}

# Solarisの場合nslookupを、それ以外の場合hostコマンドを使って
# ホスト名からIPアドレスを調べる
case `uname` in
    SunOS)
	RESOLVER=r_nslookup ;;
    *)
	RESOLVER=r_host
esac
$RESOLVER $1
