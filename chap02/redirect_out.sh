#!/bin/sh

# redirect_out.sh - リダイレクト（出力）の例

# address.txtにメッセージを書き込む。「>」は上書き、「>>」は追加なので、
# address.txtには2行が保存される。
echo "In the long history of the world," >address.txt
echo "we have come to dedicate.." >>address.txt
cat address.txt

# 再び上書きでメッセージを書き込む。
# 先程の2行は消去され、新しい1行だけが保存される。
echo "I have a dream." >address.txt
cat address.txt
