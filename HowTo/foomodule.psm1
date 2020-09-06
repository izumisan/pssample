# foomodule.psm1

function Foo()
{
    return "foomodule.Foo()"
}

$foo_variable = 123

# Export-ModuleMemberにより、コマンドレット、関数、変数、エイリアスをエクスポートする
# - Export-ModuleMemberコマンドを省略した場合は、モジュール内の関数のみが自動でエクスポートされる
# - Export-ModuleMemberコマンドを指定した場合は、指定したメンバーのみがエクスポートされる
# - メンバーの指定には、ワイルドカードが使用できる
Export-ModuleMember -Function Foo -Variable foo_variable
