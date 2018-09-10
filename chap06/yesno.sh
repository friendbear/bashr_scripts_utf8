#!/bin/sh

# yesno.sh - Yes/Noでの問い合わせ

# yesno
#     標準入力から1行読み込み、返答が「yes/YES」などであれば真（終了コード0）
#     を、「no/NO」などであれば偽（終了コード1）を返す。
yesno() {
    yn_result=""
    while [ -z "$yn_result" ]; do
	read yn_reply
	case "$yn_reply" in
	    [Yy][Ee][Ss])  # yes, YES, Yes など...
		yn_result=0;;
	    [Nn][Oo])      # no, NO, No など...
		yn_result=1;;
	    *)             # その他
		echo "Please enter YES or NO.";;
	esac
    done
    return $yn_result
}

## 利用例

echo "Do you love icecream?"
if yesno; then
    echo "Okey, you love icecream." 
else
    echo "So you don't like icecream..."
fi

echo "Are you female?"
if yesno; then
    echo "Hmm, you looks so cute!"
else
    echo "You must be male."
fi
