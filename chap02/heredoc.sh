#!/bin/sh

# heredoc.sh - ヒアドキュメントの例

# 地名の一覧をソートして表示する
sort <<EOF
Sapporo
Tokyo
Nagoya
Osaka
Fukuoka
EOF
# ↑「EOF」の前後に余計なものがあってはいけない

echo

# メッセージを画面に表示する
# （長いメッセージを表示したい時に、このような書き方をすることがある）
# 「-」が指定されているので、行頭のタブが無視される
cat <<-ENDOFFILE
	Acquaintance, n.: A person whom we know well enough to borrow from,
	but not well enough to lend to.
	    - Ambrose Bierce, The Devil's Dictionary
	ENDOFFILE
# ↑これはスペースではなくてタブ


#
# 「<<EOF」と「<<'EOF'」の違い
#

# 「<<EOF」の場合、変数展開が有効なので、「$PATH」が展開される（"..."と同じ）
echo
cat <<EOF
[cat <<EOF]
$PATH
EOF

# 「<<'EOF'」の場合、変数展開は無効（'...'と同じ）
echo
cat <<'EOF'    # $PATHは展開されない
[cat <<'EOF']
$PATH
EOF
