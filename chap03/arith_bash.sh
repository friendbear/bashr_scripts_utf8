#!/bin/bash

# arith_bash.sh - bashの四則演算

x=5
y=9
z=13

# exprの場合とは違い、記号を「\」でエスケープする必要がない。変数名の前
# の「$」も省略できる。
a=$(( x*y ))
b=$(( (y+z)/x ))

echo "$a"
echo "$b"
