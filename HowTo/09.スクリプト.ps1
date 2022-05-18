# Powershellスクリプト

# 起動引数
#-------------------------------------------------------------------------------
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


# Set-StrictMode
#-------------------------------------------------------------------------------
# Set-StrictMode -Version [1.0|2.0|Latest] を設定することで、
# 初期化していない変数への参照や存在しないプロパティへの参照をエラーとして扱うようになる（制限をかける）
#
# Set-StrictMode -Off で制限を解除する.
#
# 変数誤記によるバグを検出することができるので、少し長めのPSスクリプトの場合は設定しておく方が吉.
#
# 特にデメリットはないが、注意点として、コマンドレットの呼び出しにおいて、foo($a,$b)形式の関数呼び出しは
# エラー扱いとなる点に注意！
# > Foo 1 2   # OK
# > Foo(1,2)  # NG
Set-StrictMode -Version Latest


# 外部コマンドの実行
#-------------------------------------------------------------------------------
# 外部コマンドの直接指定
notepad.exe

# & xxx
# パスに空白を含んでいる場合はexe直接指定できないので、&をつける
& 'notepad.exe'

# Start-Processコマンドレット
# オプションなしで外部コマンド起動後すぐにpowershellに制御が戻る. -Waitで外部コマンドの終了を待機する
Start-Process -FilePath notepad.exe

# このメッセージは、メモ帳を閉じる前に表示されている
echo "This message will be written before notepad is terminated."

Start-Process -FilePath notepad.exe -Wait -PassThru

# このメッセージは、メモ帳を閉じた後にに表示される
echo "This message will be written after is terminated."

# 起動したプロセスの終了コードを取得する場合、
# -PassThru オプションを指定しないと、ExitCodeで落ちる
$process = Start-Process "notepad.exe" -Wait -PassThru
echo ("exit: " + $process.ExitCode)

# コマンド文字列の実行
#-------------------------------------------------------------------------------
# Invode-Expressionコマンドレットに文字列を指定すると、文字列をコマンドとして実行する
$command = "Get-Process"
Invoke-Expression $command


# 外部スクリプトの実行
#-------------------------------------------------------------------------------
# Start-Process, Invoke-Expressionでスクリプト実行可能

Start-Process -FilePath powershell.exe -ArgumentList ./sample.ps1
Invoke-Expression "./sample.ps1"
