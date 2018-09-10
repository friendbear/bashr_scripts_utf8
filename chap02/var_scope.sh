#!/bin/sh

# var_scope.sh - 変数のスコープ

# func_Aは変数varをローカル宣言し、値を変更して、func_Bを呼び出す。
# func_Bでは変数varのローカル宣言は行っていないので、C, perl, rubyなど
# の考え方でいえば、その値はグローバル（この例では「Global Value」）に
# なる。しかし、シェルスクリプトでは呼び出し元の値が引き継がれるので、
# func_A での値「function A」となる。

func_B() {
    echo $var
}

func_A() {
    local var
    var="function A"
    func_B
}

var="Global Value"
func_A
