#!/bin/sh

# arith.sh - exprによる四則演算の例

x=5
y=9
z=13

# 「*」（かけ算）や「(」「)」などの前には「\」が必要なことに注意
a=`expr $x \* $y`
b=`expr \( $y + $z \) / $x`

echo "$a"
echo "$b"
