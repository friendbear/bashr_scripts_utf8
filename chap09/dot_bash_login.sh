# dot_bash_login.sh - ログイン時にスクリプトを実行する（bash用）

# このファイルを ~/.bash_login にコピーして使う

# ログインした時にメッセージを表示
echo "Welcome to `hostname`"

# PATHを設定
PATH=$PATH:/usr/local/extra/bin

# ~/.bashrc が存在すれば読み込む
[ -f ~/.bashrc ] && . ~/.bashrc
