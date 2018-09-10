#!/bin/sh

# expand_all.sh - 全ての引数を表す方法

argcount() {
    echo "Number of arguments: $#"
    echo '$1:' "$1"
}

# "$*" は、"$1 $2 $3 ..." と同等
# （全ての引数が、ひとつの単語として展開される）
echo 'argcount "$*"'
argcount "$*"

# "$@" は、"$1" "$2" "$3" ... と同等
# （全ての引数が、それぞれ別の単語として展開される）
echo 'argcount "$@"'
argcount "$@"
