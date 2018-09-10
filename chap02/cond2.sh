#!/bin/sh

# cond2.sh - 「||」の例

# LOCKFILE の削除に失敗したら、メッセージを表示
rm LOCKFILE || echo "Can't remove LOCKFILE"
