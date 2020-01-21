# Powershellスクリプト

# 起動引数
# Param()により、起動引数を宣言することができる
# > xxxx.ps1 aaa bbb  #=> foo=aaa, $bar=bbb
#
# Param()により宣言した引数は、ハイフン付きのオプションとして使用できる
# > xxxx.ps1 -foo aaa -bar bbb  #=> $foo=aaa, $bar=bbb
#
# Param()を明記しない場合、スクリプト引数は自動変数$Argsに格納される
# > xxxx.ps1 aaa bbb #=> $Args[0]=aaa, $Args[1]=bbb
Param([string]$foo, [string]$bar)
echo ("foo: $foo, bar: $bar")

# スクリプトのインポート
# ". スクリプトファイル名"で外部スクリプトをインポートする
. .\foo.ps1
echo (Foo 1 2)  # foo.ps1 で定義した関数Foo の呼び出し

# 外部スクリプトの実行

# 外部コマンドの実行

# コマンド文字列の実行
