# ファイル.ps1

# Get-Contentによるファイル読み込み
$read_content = Get-Content -Path "sample.txt"

# Get-ContentはObject[]を返す
echo $read_content.GetType()
# Countで行数が取得できる
echo $read_content.Count

$write_content = "one`r`ntwo`r`nthree"
# Out-Fileによるファイル書き出し
echo $write_content | Out-File -FilePath "out_file.txt"
# リダイレクトによるファイル書き出し
echo $write_content > "out_file2.txt"
