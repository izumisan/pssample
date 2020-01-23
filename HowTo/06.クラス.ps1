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

    # デストラクタ(指定方法不明）

    # メソッド
    [int] Value() {
        return $this._value
    }

    # オーバーロード可能
    Pluse() {
        ++$this._value
    }
    Pluse([int] $x) {
        $this._value += $x
    }

    # フィールド(プロパティ)
    [int]$_value = 0  # 初期化構文が可能

    # アクセス修飾子はpublic, staticのみで、protected, privateは使用できない
    # よって、フィールドもpublic扱いになってしまう
    # "Hidden"キーワードを使うことで、IntelliSenseから隠すことができる

    # "Hidden"メソッド
    Hidden [int] HiddenMethod() {
        return $this._hiddenValue
    }

    # "Hidden"フィールド
    Hidden [int] $_hiddenValue = 123
}

# New-Objectでインスタンス化する
$foo = New-Object Foo
$foo.Pluse()
$foo.Pluse(10)
$foo.Pluse(100)
echo $foo.Value()  #=> 111

# [クラス名]::new()でもインスタンス化できる
$foo2 = [Foo]::new(168)
echo $foo2.Value()

# Hiddenメソッド/プロパティは、IntelliSenseは効かないがアクセス可能
echo $foo2.HiddenMethod()
echo $foo2._hiddenValue
