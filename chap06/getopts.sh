#!/bin/sh

# getopts.sh - getoptsのサンプル

opt_f="(none)"
opt_g="(none)"
opt_h="NO"

# 「-f」「-g」は引数を取る、「-h」は引数を取らないオプション
while getopts f:g:h flag; do
    case $flag in
	f)
	    opt_f="$OPTARG";;
	g)
	    opt_g="$OPTARG";;
	h)
	    opt_h=YES;;
    esac
done

echo "-f $opt_f"
echo "-g $opt_g"
echo "-h $opt_h"

# ($OPTIND - 1)だけshiftすることで、オプションでない残りの引数を
# 参照できる
shift `expr $OPTIND - 1`
echo "other args: $*"
