#!/bin/sh

# str_replace.sh - sedで文字列を置換する

# 置換用の文字列
text="The quick brown fox jumps over the lazy fox."

# text中の「fox」を「DOG」に置き換える
echo "$text" | sed 's/fox/DOG/'   # 最初に出現するfoxのみを置き換え
echo "$text" | sed 's/fox/DOG/g'  # 全てのfoxを置き換え

# 正規表現を使った例：「o」で始まる単語を「after」に置き換える
echo "$text" | sed 's/\<o[^ ]*/after/'
