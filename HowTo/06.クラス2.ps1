# クラス2.ps1

class BaseClass
{
    BaseClass()
    {
        Write-Host "Base.ctor."
    }

    [void] Foo()
    {
        Write-Host "Base.Foo()"
    }
}

class DerivedClass : BaseClass
{
    # baseで親クラスのコンストラクタを呼び出せる
    DerivedClass()
        : base()
    {
        Write-Host "Derived.ctor."
    }

    [void] Foo()
    {
        # 親クラスメソッドを呼び出す場合は$thisをキャストして呼び出す
        # (baseではないことに注意!!!)
        ([BaseClass]$this).Foo()
        Write-Host "Derived.Foo()"
    }
}

$derived = [DerivedClass]::new()
$derived.Foo()

