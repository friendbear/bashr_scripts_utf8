#!/bin/sh

# date_add_bsd.sh - BSD dateでの日付計算

# 2004年1月1日は何曜日？
date -v2004y -v1m -v1d +'%A'

# 2004年1月1日の100日後は何月何日？
date -v2004y -v1m -v1d -v+100d +'%F'

# 午前10時の1000秒前は何時何分何秒？
date -v10H -v0M -v0S -v-1000S +'%T'
