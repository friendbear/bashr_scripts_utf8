#!/bin/sh

# ctrl_elif.sh - elifの例

# 現在時刻の「時」を得る
hour=`date +%H`

# 4時から12時までは「Good morning!」
# 12時から17時までは「Good afternoon!」
# 17時から21時までは「Good evening!」
# 21時から翌朝2時までは「Good night...」
# それ以外には「Don't you have to go to bed?」を表示する。

if [ $hour -ge 5 -a $hour -lt 12 ]; then
    echo "Good morning!"
elif [ $hour -ge 12 -a $hour -lt 17 ]; then
    echo "Good afternoon!"
elif [ $hour -ge 17 -a $hour -lt 21 ]; then
    echo "Good evening!"
elif [ $hour -lt 2 -o $Hour -ge 21 ]; then
    echo "Good night..."
else
    echo "Hmm, it seems to be midnight. Don't you have to go to bed?"
fi
