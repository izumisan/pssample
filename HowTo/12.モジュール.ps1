# 12.モジュール.ps1

# Import-Moduleにより、現在のセッションにpsm1ファイルに定義されたコマンドレット、関数、変数等をインポートする
# インポートするメンバーを制限したい場合は、各種オプションを利用する
Import-Module .\foomodule.psm1

# foomodule.psm1で定義された関数Foo()を呼び出す
$func_value = Foo
echo $func_value

# foomodule.psm1で定義された変数foo_variableを参照する
echo $foo_variable



# Remove-Moduleにより、インポートしたモジュールを取り除く
Remove-Module foomodule
echo "foomodule removed."

try
{
    # Remove-Moduleにより、foomodule.Foo()はアンインストールされているので、
    # この関数呼び出しはエラーになる
    $func_value2 = Foo
}
catch
{
    echo "Fail to call foomodule.Foo()!"
}
