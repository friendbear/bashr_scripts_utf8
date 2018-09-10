# dot_profile_logout.sh - ログアウト時にスクリプトを実行する

# このファイルを ~/.profile にコピーして使う

# ログイン時の処理
echo "Welcome to `hostname`"

# シェルを実行
/bin/sh

# ログアウト時の処理
echo "Good-bye"

# ログアウトする
exit
