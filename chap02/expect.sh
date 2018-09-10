#!/bin/sh

# expect.sh - リダイレクトやexpectでftpを制御する例

# ftpを使い、ftp.kernel.orgのファイル一覧を取得する。
# リダイレクトを使った方法と、expectを使った方法がある。

EMAIL='your@email.address.here'  # メールアドレスを記入

# [リダイレクトを使った方法]
#  ftpのコマンドを決まった順序で送る。エラーが起こった場合については
#  考えていない。
#  リダイレクトを使った方法では「Password:」に対する入力がうまく
#  いかないので、ftp自動ログインを禁止して（「-n」オプション）、
#  openとuserコマンドを使ってログインしている。
echo "open ftp.kernel.org
user anonymous $EMAIL
ls
bye" | ftp -n

echo
echo "----"
echo

# [expectを使った方法]
#  それぞれのプロンプトが表示されるのを待って、ユーザー名・パスワードなどを
#  送信する（「\r」は改行を表す）。
#  20秒待ってもログインプロンプトが現れない場合（＝ftpサーバに接続できない）
#  場合には、中断する。
expect -c "
set timeout 20
spawn ftp ftp.kernel.org
expect {
  timeout   exit
  \"Name\"
}
send \"anonymous\r\"
expect \"Password:\"
send \"$EMAIL\r\"
expect \"ftp>\"
send \"ls\r\"
expect \"ftp>\"
send \"bye\r\"
"
