#!/bin/sh

# showusers.sh - システムに登録されているユーザーの一覧を本名で表示する

if [ `uname` = "Darwin" ]; then
    # Mac OS Xでは/etc/passwdは使われない
    nidump passwd . | cut -d : -f 8
else
    # その他のシステム
    cat /etc/passwd | cut -d : -f 5
fi | sed 's/,.*//'  # 「,」より後は捨てる

