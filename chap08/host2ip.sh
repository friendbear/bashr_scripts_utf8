#!/bin/sh

# host2ip.sh - ホスト名からIPアドレスを調べる

# r_host
#     hostコマンドを使ってIPアドレスを調べる
#     結果の一番最後の単語がIPアドレス
r_host() {
    set -- `host $1`
    shift `expr $# - 1`
    case $1 in
	*\(NXDOMAIN\))  # 見つからない場合
	    return 1 ;;
	*)
	    echo $1
    esac
}

# r_nslookup
#     nslookupコマンドを使ってIPアドレスを調べる
#     「Name: HOSTNAME」の次の行に「Address: IP_ADDRESS」がある
r_nslookup() {
    set -- `/usr/sbin/nslookup $1 2>/dev/null | sed -n '/^Name:/ {
n
p
}'`
    if [ -n "$2" ]; then
	echo $2
    else
	return 1
    fi
}

# Solarisではnslookupコマンドを、それ以外ではhostコマンドを使って
# ホスト名からIPアドレスを調べる
case `uname` in
    SunOS)
	RESOLVER=r_nslookup ;;
    *)
	RESOLVER=r_host
esac

$RESOLVER $1
