#!/bin/sh

# newuser_linux.sh - システムに新規ユーザーを登録する（Linux）

# デフォルトの所属グループを設定
PRIMARY_GROUP=staff

# ユーザー名（ログイン名）と本名を入力
echo -n "login name: "
read login
echo -n "real name: "
read real

# 初期パスワードを入力
stty -echo   # 入力を画面に表示しない
echo -n "passowrd: "
read pass
echo
echo -n "password (retype to confirm): "
read pass2
echo
stty echo    # 元に戻す
if [ "$pass" != "$pass2" ]; then
    echo "Passwords do not match."
    exit 1
fi

# 新規ユーザーを登録していいかどうか確認する
echo -n "Do you want to create new account? (y/n) "
read yesno

[ "$yesno" != "y" -a "$yesno" != "Y" ] && exit 1

# OKの場合、ユーザーを登録
useradd -c "$real" -g $PRIMARY_GROUP -m $login

# パスワードを設定
expect -c "spawn passwd $login
expect \"password:\"
send \"$pass\\r\"
expect \"password:\"
send \"$pass\\r\"
wait" >/dev/null

echo "To rmove this account, type \"userdel -r $login\""
