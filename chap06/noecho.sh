#!/bin/sh

# noecho.sh - 入力のエコーバックを禁止する

echo -n "Password: "
#echo "Password: \c"  # for Solaris

stty -echo
read password
stty echo

echo

if [ "$password" = "secret" ]; then
    echo "Open sesami!"
else
    echo "Bye!"
fi
