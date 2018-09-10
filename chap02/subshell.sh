#!/bin/sh

# subshell.sh - サブシェルの例

# [A] makeとmake installをバックグラウンドで実行する。
#    （makeが成功した場合のみ、make installを実行する）
( make && make install ) &

# [B] ~/sourceにあるファイルをアーカイブ・圧縮して、
#     ~/target/archive.tar.gzに書き込む。
#     tarはカレントディレクトリが~/sourceの状態で実行される。
#     gzipはカレントディレクトリが~/targetの状態で実行される。
cd $HOME/target
(cd $HOME/source; tar cf - *) | gzip -c > archive.tar.gz
