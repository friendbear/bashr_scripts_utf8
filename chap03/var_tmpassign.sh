#!/bin/sh

# var_tmpassign.sh - 環境変数を一時的に変更する

echo "LANG=${LANG}"

for lang in ja_JP.eucJP ja_JP.UTF-8 \
    en_US.ISO8859-1 fr_FR.ISO8859-1 de_DE.ISO8859-1; do
  echo -n "$lang - "
  #echo "$lang - \c"  # Solarisの場合
  LANG="$lang" date +'%B %d (%A)'
done

# LANGの値は変わっていない
echo "LANG=${LANG}"
