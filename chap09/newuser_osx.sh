#!/bin/sh

# newuser_osx.sh - Mac OS Xで新規ユーザーを登録する

# デフォルトの所属グループを設定（グループIDの数字で）
PRIMARY_GROUP=20  #staff

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

# 現在登録されているユーザーのうち、最大のUIDを得る
uid=`nidump passwd . | cut -f3 -d: | sort -rn | head -1`
# 1を加えて、新しいUIDとする
uid=`expr $uid + 1`

# 新しいユーザーを作る
if ! niutil -create / /users/$login; then
    echo "User $login already exist (or any unexpected error occured)."
    exit 1
fi
niutil -createprop / /users/$login realname "$real"
niutil -createprop / /users/$login uid $uid
niutil -createprop / /users/$login gid $PRIMARY_GROUP
niutil -createprop / /users/$login home /Users/$login
niutil -createprop / /users/$login _shadow_passwd

# パスワードを設定する
expect -c "spawn passwd $login
expect \"assword:\"
send \"$pass\\r\"
expect \"assword:\"
「」send \"$pass\\r\"
expect eof" >/dev/null

echo "You should manually create /Users/$login"
echo "To rmove this account, type \"niutil -destroy / /users/$login\""
