#!/bin/sh

# tiny_cgi.sh - 簡単なCGIスクリプト

CHARSET="UTF-8"    # このスクリプトの文字コード
#CHARSET="EUC-JP"

# HTTPヘッダを出力する
echo "Content-Type: text/html; charset=$CHARSET"
echo

# ドキュメントを出力する
cat <<EOF
<html>
<head>
<title>Sample CGI script</title>
</head>
<body>
<h1>Sample CGI script</h1>
<pre>
`env`
</pre>
</body>
</html>
EOF
