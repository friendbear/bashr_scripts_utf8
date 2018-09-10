#!/bin/sh

# forkmany.sh - たくさんのプロセスを起動する

for i in 1 2 3 4 5 6 7 8 9 10; do
    sleep 100 &
done
