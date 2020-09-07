# 13.CSharpコード.ps1

$cscode = @"
using System;
public class Foo
{
    public Foo() {}
    public void DoSomething( int x )
    {
        Console.WriteLine( "x: " + x.ToString() );  // $"x: {x}" は使えないっぽい...？
    }
};
"@

# Add-TypeにC#コードを指定することにより、C#で実装したクラス・関数がpowershellから利用できる
# - "CSharp"以外に、"JScript"や"VisualBasic"を指定するとjavascriptやVB.NETコードが利用できる
# - インラインに展開したコードを利用する場合は、TypeDefinitionオプションを利用する
# - インラインではなく、ソースコードファイルを利用する場合は、Pathオプションに指定する
# - Path, AssemblyNameオプションを併用することで、DLLファイルを利用できる（未検証）
Add-Type -Language CSharp -TypeDefinition $cscode

$foo = [Foo]::new()
$foo.DoSomething( 123 )
