#!/bin/sh

# date_format.sh - 日付・時刻の書式指定

date +'%Y/%m/%d %H:%M:%S'  # yyyy/mm/dd HH:MM:SS
date +'%c'                 # ローケール（言語環境）に応じた書式で
date +'Timezone: %Z'       # 現在のタイムゾーンを表示
