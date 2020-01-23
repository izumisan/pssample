# .NET API

# New-Objectでインスタンスを生成する
$dateTime = New-Object System.DateTime(2020, 1, 2, 23, 45, 59)
echo $dateTime

# プロパティアクセス
echo $dateTime.Year

# メソッドアクセス
echo $dateTime.ToString("yyyy-MM-dd hh:mm:ss")

# ref, out 引数
[int]$num = 0
$ret = [int]::TryParse("123", [ref]$num)
echo $num

# 注意点1
# 戻り値があるメソッドの戻り値を捨てた場合、戻り値が標準出力に出力される
[double]::TryParse("-1.234", [ref]$num)  #=> Trueが表示される

# [void]を指定するか$nullにリダイレクトすると標準出力への表示が抑制される
[void][double]::TryParse("-1.234", [ref]$num)
[double]::TryParse("-1.234", [ref]$num) > $null

# 注意点2
# メソッド呼び出し時の引数の指定について
# - コマンドレット, Powershell関数: カンマ不要
# - .NET APIメソッド: カンマ必要

function pow($x, $y) {
    echo "powershell function"
    return [Math]::Pow($x, $y)
}

# powershellメソッドの呼び出し(カンマなし)
echo (pow 2 3)
# .NETのMath::Powの呼び出し(カンマあり)
echo ([Math]::Pow(2, 3))
