#!/bin/sh

# newuser_solaris.sh - Solarisで新規ユーザーを登録する

# デフォルトの所属グループを設定
PRIMARY_GROUP=staff

# ユーザー名（ログイン名）と本名を入力
echo "login name: \c"
read login
echo "real name: \c"
read real

# 初期パスワードを入力
stty -echo   # 入力を画面に表示しない
echo "passowrd: \c"
read pass
echo
echo "password (retype to confirm): \c"
read pass2
echo
stty echo    # 元に戻す
if [ "$pass" != "$pass2" ]; then
    echo "Passwords do not match."
    exit 1
fi

# 新規ユーザーを登録していいかどうか確認する
echo "Do you want to create new account? (y/n) \c"
read yesno

[ "$yesno" != "y" -a "$yesno" != "Y" ] && exit 1

# OKの場合、ユーザーを登録
/usr/sbin/useradd -c "$real" -g $PRIMARY_GROUP -m $login

# パスワードを設定する
expect -c "spawn passwd $login
expect \"Password:\"
send \"$pass\\r\"
expect \"Password:\"
send \"$pass\\r\"
expect eof" >/dev/null

echo "To rmove this account, type \"/usr/sbin/userdel -r $login\""
