#!/bin/sh

# date_add.sh - Linux/GNU dateでの日付計算

# 2004年1月1日は何曜日？
date -d '2004/1/1' +'%A'

# 2004年1月1日の100日後は何月何日？
date -d '2004/1/1 100 days' +'%F'

# 午前10時の1000秒前は何時何分何秒？
date -d '10:00:00 1000 seconds ago' +'%T'
