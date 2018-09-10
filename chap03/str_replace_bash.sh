#!/bin/bash

# str_replace_bash.sh - 文字列を置換する（bash）

# 置換用の文字列
text="The quick brown fox jumps over the lazy fox."

# text中の「fox」を「DOG」に置き換える
echo ${text/"fox"/"DOG"}   # 最初の1個だけ置き換え
echo ${text//"fox"/"DOG"}  # 全てのfoxを置き換え

# パターンを使う例：「jumps」以降を「jumps...」にする
echo ${text/"jumps*"/"jumps..."}
