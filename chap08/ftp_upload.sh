#!/bin/sh

# ftp_upload.sh - ftpでファイルをアップロードする

# show_help
#     ヘルプを表示する関数
show_help() {
    cat <<'EOF'
usage: ftp_upload.sh [options...] ftp_host remote_dir files ...
options:
  -u user      set FTP login name.
  -p password  set FTP login password.
  -P           toggle passive mode.
  -h           show this help message.
EOF
}

# echoコマンドの互換性を調べる
if [ "`echo '\c'`" = "\c" ]; then
    ECHO_N=-n
    ECHO_C=
else
    ECHO_N=
    ECHO_C="\c"
fi

# testコマンドの互換性を調べる
if /bin/sh -c '[ 1 -lt 2]' 2>/dev/null; then
    command=""
else
    command="command"
fi

# 初期設定
ftp_user=`whoami`
ftp_pass=
toggle_passive="NO"

# コマンドラインオプションを調べる
while getopts 'u:p:Ph' flag; do
    case $flag in
	u)
	    ftp_user=$OPTARG
	    ;;
	p)
	    ftp_pass=$OPTARG
	    ;;
	P)
	    toggle_passive="YES"
	    ;;
	*)
	    show_help
	    exit 1
    esac
done
shift `expr $OPTIND - 1`

# オプションの他に、少なくとも3つの引数が必要
if $command [ $# -lt 3 ]; then
    show_help
    exit 1
fi

ftp_host=$1
ftp_dir=$2
shift 2

# パスワードが指定されていない場合、問い合わせる
if [ -z "$ftp_pass" ]; then
    stty -echo
    echo $ECHO_N "Enter FTP password: $ECHO_C"
    read ftp_pass
    stty echo
    echo
fi

# expectのスクリプトを作成する
expect_script="#expectスクリプト はじまり

set timeout 20
set ftp_host \"${ftp_host}\"
set ftp_dir \"${ftp_dir}\"
set toggle_passive \"${toggle_passive}\"
set ftp_user \"${ftp_user}\"
set ftp_pass \"${ftp_pass}\"
array set files {"

# シェルスクリプトに戻る
for local_file do  # 転送するファイルの一覧を配列にしておく
    remote_file=`basename "${local_file}"`
    expect_script="${expect_script}
  \"${remote_file}\" \"${local_file}\""
done
# expectに戻る

expect_script="${expect_script}
}

#ここまでダブルクォート
"'
#ここからシングルクォート

spawn ftp $ftp_host

expect {
  "ftp>" { exit 1 }      ;# 接続できない
  "Name "
}
send "$ftp_user\r"

expect "Password:"
send "$ftp_pass\r"
expect {
  "230 " { }
  "ftp>" { exit 1 }      ;# パスワードが違う
}

if { $toggle_passive == "YES" } {
  expect "ftp>"
  send "passive\r"   ;# 必要ならpassiveモードに
}

expect "ftp>"
send "cd \"$ftp_dir\"\r"
expect {
  "250 " { }
  "ftp>" { exit 1 }      ;# cdできない
}

# ファイルを転送する
set timeout -1       ;# 転送時はタイムアウト監視しない
foreach remote_file [array names files] {
  set local_file $files($remote_file)
  expect "ftp>"
  send "put \"$local_file\" \"$remote_file\"\r"
}

# 接続終了
expect "ftp>"
send "quit\r"
expect eof

#expectスクリプト終わり
'

expect -c "${expect_script}"
