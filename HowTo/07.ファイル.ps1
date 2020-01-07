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

# UTF-8 with BOMでファイル出力
# (Out-Fileやリダイレクトの既定値はUTF-16(BOM)っぽい？）
echo $write_content | Out-File "out_file3.txt" -Encoding utf8

# UTF-8 without BOMでファイル出力
# (コマンドレットでは出来ないっぽいので.NETクラスを利用する)
$writer = [System.IO.StreamWriter]::new( "out_file4.txt", $false, [System.Text.UTF8Encoding]::new() )
$writer.Write( $write_content )
$writer.Close()

# csv
#-------------------------------------------------------------------------------
# Import-Csv でcsvファイルを読み込める
$csv = Import-Csv -Path "sample.csv"
echo $csv
# Countでレコード数（ヘッダー行除く）を取得する
echo ('$csv.Count: ' + $csv.Count)
# インデックス指定でレコード取得
echo ("[0]: {id: " + $csv[0].id + ", name: " + $csv[0].name + ", value: " + $csv[0].value + ", enabled: " + $csv[0].enabled + "}")
foreach($item in $csv) {
    # ヘッダーラベルがそのままプロパティとなる
    echo ("id: " + $item.id + ", name: " + $item.name + ", value: " + $item.value + ", enabled: " + $item.enabled)
}
# 各要素は文字列で読み込まれる
echo $csv[0].id.GetType()       #=> String
echo $csv[0].enabled.GetType()  #=> String
# 数値等は -as でキャストする
echo ($csv[0].id -as [int]).GetType()        #=> Int32
echo ($csv[0].enabled -as [bool]).GetType()  #=> Boolean


# json
#-------------------------------------------------------------------------------


# xml
#-------------------------------------------------------------------------------


# etc
#-------------------------------------------------------------------------------
# カレントディレクトリ (Get-Location)
# (Set-Locationでカレントディレクトリを設定できる)
$current_dir = Get-Location
echo $current_dir.Path

# スクリプトディレクトリ
echo $PSScriptRoot

# スクリプトのパス
echo $MyInvocation.MyCommand.Path

# ファイルの存在チェック (Test-Path)
Test-Path sample.csv    #=> True
Test-Path path/to/foo   #=> False

# フォルダの存在チェック (Test-Path)
Test-Path 'C:\Program Files'    #=> True

# パスの結合 (Join-Path)
Join-Path foo bar  #=> foo\bar

# パスの分割 (Split-Path)
Split-Path -Parent path/to/foo/bar  #=> path/to/foo
Split-Path -Leaf   path/to/foo/bar  #=> bar

# 相対パス -> 絶対パス (Resolve-Path)
echo (Resolve-Path sample.csv).Path

# 絶対パス -> 相対パス (Resolve-Path)
echo (Resolve-Path "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe" -Relative)

# Resolve-Pathは存在しないパスを指定するとエラーとなる
echo (Resolve-Path path/to/foo)

# 相対パス -> 絶対パス (Convert-Path)
Convert-Path .
Convert-Path ..

# ファイル検索 (Get-ChildItem)
# (カレントディレクトリから*.ps1を検索する)
echo (Get-ChildItem . -Filter *.ps1).Count
