# ファイル.ps1

# ファイル読み込み
#-------------------------------------------------------------------------------
# Get-Contentによるファイル読み込み
$read_content = Get-Content -Path "sample.txt"

# Get-ContentはObject[]を返す
echo $read_content.GetType().Name  # => Object[]
# Countで行数が取得できる
echo $read_content.Count  # => 3

# cat は Get-Content のエイリアス
echo (cat "sample.txt")

# 一行読み込み
# ForEach-Objectにパイプすることで1行ずつ処理する
Get-Content -Path "sample.txt" | ForEach-Object {
    echo ("Line: " + $_)  # $_ はパイプで受け取ったオブジェクトを参照する自動変数
}

# % は ForEach-Object のエイリアス
cat "sample.txt" | % { echo ("Line: " + $_) }


# ファイル書き出し
#-------------------------------------------------------------------------------
$write_content = "one`r`ntwo`r`nthree"
# Out-Fileによるファイル書き出し
echo $write_content | Out-File -FilePath "out_file.txt"
# リダイレクトによるファイル書き出し
echo $write_content > "out_file2.txt"
