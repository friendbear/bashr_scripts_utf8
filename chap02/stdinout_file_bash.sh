#!/bin/bash

# stdinout_file_bash.sh - 「>(command)」の例

# wgetは指定したURLからファイルをダウンロードするコマンド
# （http://www.gnu.org/software/wget/wget.html）
# 「-o」オプションはログファイルの記録先を指定する
# 「-O -」で、ダウンロードしたファイルは標準出力に表示される

# loggerは指定されたメッセージをsyslogに送るコマンド
# （/var/log/syslog等に記録される）

# nkfは文字コードを変換するコマンド

nkfopt=-w  # ターミナルの文字コードがEUC-JPの場合「-e」
           # UTF-8の場合「-w」

wget -o >(logger) -O - http://www.shuwasystem.co.jp | nkf -S $nkfopt
