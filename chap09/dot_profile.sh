# dot_profile.sh - ログイン時にスクリプトを実行する

# このファイルを ~/.profile にコピーして使う

# ログインした時にメッセージを表示
echo "Welcome to `hostname`"

# PATHを設定
PATH=$PATH:/usr/local/extra/bin
