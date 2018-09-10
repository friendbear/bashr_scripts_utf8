#!/bin/sh

# graphics.sh - PostScript言語で画像を作成する

cat <<EOF | display -
%!
%%BoundingBox: 0 0 640 240
%%EndComments

% 四角い枠を描く
20 20 600 200 4 copy
1.0 0.7 0.7 setrgbcolor
rectfill
1.0 0.5 0.5 setrgbcolor
4 setlinewidth
rectstroke

% 円を描く
0.7 0.7 1.0 setrgbcolor
120 180 50 0 360 arc
4 setlinewidth
stroke
600 40 150 0 360 arc
8 setlinewidth
stroke

% ユーザーのログイン名を描く
/TimesRoman findfont
72 scalefont
setfont
50 100 moveto
0 setgray
(Welcome `whoami`!) show

% ページを表示
showpage
%%EOF
EOF
