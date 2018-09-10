#!/bin/sh

# exec_redirect.sh - 複数のコマンドにわたるリダイレクト


# グルーピングを使った例
#   ディレクトリdir1とdir2の両方にあるファイルだけを表示

{ ls dir1; ls dir2; } | sort | uniq -d


# execを使った例

echo "Terminal - line 1"   # 画面に表示される

# 「3>&1」で、ファイルハンドル3が現在の標準出力（＝ターミナル）に結びつ
# けられる（後で元に戻すために保存しておく）。さらに、「>file」で、標準
# 出力がファイルfileにリダイレクトされる。
exec 3>&1 >file

echo "File - line 1"       # ファイルへ
echo "File - line 2"       # ファイルへ

# 「>&3」で、標準出力はファイルハンドル3（＝ターミナル）に結びつけられ
# る（元通りになる）。「3>&-」で、ファイルハンドル3は閉じられる。
exec >&3 3>&-

echo "Terminal - line 2"   # 画面へ
