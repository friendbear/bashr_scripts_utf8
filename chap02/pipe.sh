#!/bin/sh

# pipe.sh - パイプの使い方

# システムログの内容を1ページずつ区切って表示する
dmesg | less

# システムログの、「irq」（大文字小文字を問わない）を含む行を
# 1ページずつ区切って表示する
dmesg | grep -i 'irq' | less
