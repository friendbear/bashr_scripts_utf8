#!/bin/sh

# wait.sh - 子プロセスが終了するのを待つ

# この関数を子プロセス（サブシェル）として実行する
sub_process() {
    echo "Sub-process: start"
    sleep 5
    echo "Sub-process: end"
}

sub_process &  # 子プロセスをバックグラウンドで実行
wait $!        # 子プロセスが終了するのを待つ
echo "Finished!"
