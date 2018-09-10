#!/bin/sh

# list.sh - サブシェルとグルーピングの例

echo "First"; echo "Second"
{ echo "Alpha"; echo "Beta"; }  #グルーピング
( echo "One"; echo "Two" )      #サブシェル
