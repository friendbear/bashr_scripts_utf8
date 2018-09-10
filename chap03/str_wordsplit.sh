#!/bin/sh

# str_wordsplit.sh - 文字列中の任意の単語を取り出す

# 変数textの内容を単語に分割し、各々の単語を $1, $2, ... にセットする
text='Your nature demands love and your happiness depends on it.'
set -- $text

# 結果を表示
echo "Number of words: $#"
echo "The fourth word: $4"
