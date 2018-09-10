#!/bin/sh

# func_return.sh - returnの例

# returnコマンドは、関数の途中で呼び出し元に戻る
myfunc() {
    echo "This line will be executed."
    return  # 呼び出し元に戻る
            # 以降のコマンドは実行されない
    echo "This line will be ignored."
}

# 関数を呼び出す
myfunc
