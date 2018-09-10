#!/bin/sh

# source_main.sh - sourceコマンドの例（読み込む側）

. ./source_sub.sh

get_systype  # この関数はsource_sub.shで定義されている

echo "Machine hardware: $MACHINE"
echo "  Processor type: $PROCESSOR"
echo "Operating system: $OS"
