#!/bin/sh

# avinfo.sh - 音声・動画ファイルの情報を得る

mplayer -identify -ao null -vo null -frames 0 "$1" 2>/dev/null | \
    grep ^ID

