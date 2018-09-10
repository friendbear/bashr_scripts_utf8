#!/bin/sh

# random.sh - rubyを使って乱数を得る

# 10個の乱数を表示
for n in 1 2 3 4 5 6 7 8 9 10; do
    random=`ruby -e 'print Integer(rand()*10)+1'`
    echo -n "$random "
    #echo "$random \c"  # Solaris
done
echo
