#!/bin/sh

# trap_exit.sh - trapコマンドのサンプル

# cleanup
#     終了時に呼び出される関数
cleanup() {
    echo "Doing cleanup jobs."
    [ -n "$tmpfile" ] && rm "$tmpfile"
}

# トラップを設定する
trap cleanup EXIT
trap 'exit' INT  # Solarisの/bin/sh以外では不要


# テンポラリファイルを作成する
tmpfile=`mktemp /tmp/tmp.XXXXXXXX` || exit 1
echo "Press Ctrl-C to abort."

# 時間のかかる処理
for i in one two three four five six seven eight nine ten; do
    echo $i >>"$tmpfile"
    sleep 1
done

# テンポラリファイルの内容を表示する
cat "$tmpfile"
