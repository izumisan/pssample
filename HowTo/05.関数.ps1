# 関数.ps1

# 関数定義
# - Foo1()でもok
function Foo1 {
    echo "Foo1 called."
}

# 関数呼び出し
# - Foo1()ではない
Foo1

#-------------------------------------------------------------------------------
# 引数あり関数定義
# - デフォルト引数の設定可
function Foo2( $a, $b, $c=168 ) {
    echo "Foo2( $a, $b, $c ) called."
}

# 引数あり関数の呼び出し
# - 引数は空白区切り
# - カンマ区切りで渡すと配列と解釈される
Foo2 1 2 3
Foo2 "bar1" "bar2"

#-------------------------------------------------------------------------------
# 戻り値がある関数の定義
function Foo3( $x, $y ) {
    $result = $x + $y
    echo "Foo3( $x, $y ) called. result: $result "
    return $result
}

# Foo3の呼び出し
# Foo3()のechoはこのタイミングで出力されない
$foo3 = Foo3 1 2
echo "-----"
echo $foo3
echo "-----"

# Foo3()のechoの内容は、Foo3の戻り値（配列）として格納されている
# []を使って取得可能
echo ('$foo3[0]: ' + $foo3[0])
echo ('$foo3[1]: ' + $foo3[1])
