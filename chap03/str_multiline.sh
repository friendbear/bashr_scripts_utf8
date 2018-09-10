#!/bin/sh

# str_multiline.sh - 複数行にわたる文字列を書く

# 「三匹の子豚」の豚をカバに、母親を父親に変える
# （sedに改行を含むコマンドを渡している）
cat <<'EOF' | sed 's/pigs/HIPPOPOTAMUSES/g
s/mother/FATHER/g'
Once upon a time there were three little pigs and the time came for 
them to leave home and seek their fortunes.
    Before they left, their mother told them "Whatever you do, do it 
the best that you can because that's the way to get along in the world.
EOF
