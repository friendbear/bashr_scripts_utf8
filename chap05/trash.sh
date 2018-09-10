#!/bin/sh

# trash.sh - 指定されたファイルをゴミ箱（$HOME/.Trash）に移動する

# 削除するファイル名が指定されていない場合、使い方を表示して終了
if [ $# -eq 0 ]; then
    echo "usage: trash files_to_trash..."
    exit 1
fi

# 組み込みの「test -e」が使えない時には外部コマンドを使う
if /bin/sh -c 'test -e "$0"' 2>/dev/null; then
    command=""
else
    command="command"    # Solarisの場合
fi

# $HOME/.Trashが存在しない場合には作成する
$command [ -e "$HOME/.Trash" ] || mkdir "$HOME/.Trash" || {
    echo "Could not create ~/.Trash"
    exit 1
}

# 削除処理を行う
error=""
for path do  # 全ての引数について繰り返す

    # 削除対象のファイルが存在するかどうか確認
    if $command [ -e "$path" ]; then

	# ファイルが存在する場合、ゴミ箱内に同名のファイルが無いか
	# チェックする
	fname=`basename "$path"`
	in_trash="$HOME/.Trash/$fname"
	suffix=0
	while $command [ -e $in_trash ]; do
	    # 同名のファイルが存在した場合、後ろに数字を付け加える
	    # それでも存在する場合、数字を順次増やして再度確認
	    in_trash="$HOME/.Trash/${fname}.${suffix}"
	    suffix=`expr $suffix + 1`
	done

	# ファイルをゴミ箱に移動する
	if mv "$path" "$in_trash"; then
            # 成功した場合、何もしない
	    :  
	else
	    # 移動に失敗
	    echo "$path: could not move to Trash" >&2
	    error="YES"
	fi

    else
	# ファイルが存在しない場合、エラーメッセージを表示
	echo "$path: not exist" >&2
	error="YES"
    fi
done

[ -n "$ERROR" ] && exit 1  # 途中でエラーが発生した場合には終了コード1
exit 0
