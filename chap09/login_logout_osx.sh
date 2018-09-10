#!/bin/sh

# login_logout_osx.sh - Mac OS Xでログイン・ログアウト時にスクリプトを実行する

# at_logout
#     ログアウト時に実行するコマンドを書く
at_logout() {
    # AppleScriptを利用して、"Good Bye"を発音
    osascript -e 'say "Good bye"'
}

# ログイン時に実行するコマンドを書く
# AppleScriptを利用して、"Welcome to <HOSTNAME>"を発音
osascript -e "say \"Welcome to `hostname -s`\""

# ログアウトを待つ
trap at_logout EXIT
while true; do
    sleep 60
done
