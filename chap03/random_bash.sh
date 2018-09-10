#!/bin/bash

# random_bash.sh - bashのRANDOM変数で乱数を得る

# 10個の乱数を表示
for n in 1 2 3 4 5 6 7 8 9 10; do
    random=$(( (RANDOM % 10) + 1 ))
    echo -n "$random "
done
echo
