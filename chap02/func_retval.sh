#!/bin/sh

# func_retval.sh - 関数から結果を返す

# 関数dayofweekは、今日の曜日を英語表記で返す
dayofweek() {
    LANG=C date +%A
}

# 関数issundayは、今日が日曜日なら終了コード0（成功）を、
# それ以外なら1（失敗）を返す
issunday() {
    if [ `dayofweek` = "Sunday" ]; then
	return 0
    else
	return 1
    fi
}

# 今日の曜日を表示する
dow=`dayofweek`  # dayofweekの出力を変数dowに代入する
echo "Today is $dow"

# 今日が日曜日ならメッセージを表示する
# （「&&」は、前のコマンドが成功した時だけ後ろのコマンドを実行する）
issunday && echo "Have a nice holiday!"
