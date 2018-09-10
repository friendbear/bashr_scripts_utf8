#!/bin/sh

# lock.sh - ロックファイル（ロックディレクトリ）を使う例

LOCKDIR=/tmp/lock.sh.lockdir
COUNTFILE=/tmp/lock.sh.count

# count
#     共有ファイルを読み込み、内容に1を加えて書き込む
count() {
    # 引数に「lock」が指定されている場合、ロックディレクトリを使って
    # 排他制御する
    if [ "$1" = "lock" ]; then
	# ロックディレクトリの作成に成功するまで、1秒おきに繰り返す
	until mkdir $LOCKDIR 2>/dev/null; do
	    sleep 1
	done
    fi

    # 共有ファイルを読み込み、1を加えて保存
    cnt=`cat $COUNTFILE`
    cnt=`expr $cnt + 1`
    echo $cnt >$COUNTFILE
    echo $cnt

    # 必要なら、ロックディレクトリを削除する
    if [ "$1" = "lock" ]; then
	rmdir $LOCKDIR
    fi
}

# 起動時にロックディレクトリが存在する場合、エラーを表示して終了
if [ -d $LOCKDIR ]; then
    echo "Lock directory $LOCKDIR exist."
    exit 1
fi


# count関数を10個同時にバックグラウンドで動作させ、共有ファイルの中身が
# カウントアップされる様子を調べる

# ロックディレクトリを使って実行
echo "*** WITH LOCK FILE ***"
echo 0 >$COUNTFILE
for i in 1 2 3 4 5 6 7 8 9 10; do
    count lock &
done
wait

# ロックディレクトリを使わずに実行
echo "*** WITHOUT LOCK FILE ***"
echo 0 >$COUNTFILE
for i in 1 2 3 4 5 6 7 8 9 10; do
    count &
done
wait

rm $COUNTFILE
