#!/bin/sh

# space.sh - 空白や記号を含む引数の使用例

# 空白を含む例
echo "MILES        AWAY"         # [A] "..."で括る
echo MILES\ \ \ \ \ \ \ \ AWAY   # [B] 空白の前に「\」を書く
echo MILES        AWAY           # [C] そのまま書く
                                 #     （2つ目以降の空白は無視される）

# 記号を含む例
echo "<TAG>"                     # [D] "..."で括る
echo '<TAG>'                     # [E] '...'で括る
echo \<TAG\>                     # [F] 記号の前に「\」を書く
echo <TAG>                       # [G] そのまま書く（エラーになる）
