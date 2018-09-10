#!/bin/bash

# lineno.sh - 現在の行番号を得る

func() {
    echo "lineno.sh($LINENO): func()"
}

echo "lineno.sh($LINENO): main entry"
func
func
