# 変数.ps1

# 変数宣言＆初期化
$str = "foo"
$num = 168

# 変数参照
echo $str       #=> foo
echo $num       #=> 168
echo ""

# ダブルクォーテーションの中の変数は展開される
echo "$str"     #=> foo
echo "$num"     #=> 168
echo ""

# シングルクォーテーションの中の変数は展開されない
echo '$str'     #=> $str
echo '$num'     #=> $num
echo ""

# foo1はint型、foo2はstring型
$foo1 = $num
$foo2 = "$num"
echo $foo1.GetType()
echo $foo2.GetType()
echo ""

# ${...}で、日本語の変数名も可能
${円周率} = 3.1415926535
echo ( "直径3の円の円周の長さ = " + ( 3.0 * ${円周率} ) )
echo ""

# 変数の型を明示する
[double] $value = 168
echo ("value type: " + $value.GetType())
echo ""

# 定数
# set 定数名 値 -option constantで定数定義
set FOO 168 -option constant

# Set-VariableのオプションでConstant指定可能
Set-Variable FOO_2 168 -Option Constant

# Set-VariableのオプションでReadOnly指定可能
Set-Variable FOO_3 168 -Option ReadOnly
echo ("FOO_3: $FOO_3")

# Constant変数とは異なりReadOnly変数は削除可能（要-Force）
Remove-Variable FOO_3 -Force
echo ("FOO_3: $FOO_3")
