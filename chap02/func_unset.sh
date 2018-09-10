#!/bin/sh

# func_unset.sh - 関数定義を取り消す

# 関数定義
myfunc() {
    echo "Hmm, this function is no longer useful."
}

unset myfunc  # 定義を取り消す
myfunc        # 呼び出す（定義が取り消されているのでエラーになる）
