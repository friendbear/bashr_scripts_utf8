#!/bin/sh

# backup_to_winfolder.sh - ファイルをWindowsの共有フォルダにバックアップする

BACKUP_ORG="$HOME"     # tarを実行する時のカレントディレクトリ
BACKUP_TGT=bin         # tarでアーカイブするディレクトリ
LOCAL_FILE=my_bin.tar.gz

WIN_SERVICE="//sango/shared"
AUTH_FILE="$HOME/sango-shared.smbaccess"

cd "$BACKUP_ORG"
tar cf - "$BACKUP_TGT" | gzip -c > "$LOCAL_FILE"

smbclient "$WIN_SERVICE" -A "$AUTH_FILE" -c "put '$LOCAL_FILE'"

rm "$LOCAL_FILE"
