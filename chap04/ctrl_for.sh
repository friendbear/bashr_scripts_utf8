#!/bin/sh

# ctrl_for.sh - for文の例

for item in one "two !" 'three !' four\ !; do
    echo "$item"
done
