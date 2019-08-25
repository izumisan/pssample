# クラス.ps1

class Foo {
    # コンストラクタ
    Foo() {
        # フィールドにアクセスする場合は、$thisで修飾する
        $this._value = 0
    }

    # コンストラクタ
    Foo( [int]$value ) {
        $this._value = $value
    }

    [int] Value() {
        return $this._value
    }

    PluseOne() {
        ++$this._value
    }

    # フィールド
    [int]$_value
}

# New-Objectでインスタンス化する
$foo = New-Object Foo
$foo.PluseOne()
$foo.PluseOne()
$foo.PluseOne()
echo $foo.Value()

# [クラス名]::new()でもインスタンス化できる
$foo2 = [Foo]::new( 168 )
echo $foo2.Value()
