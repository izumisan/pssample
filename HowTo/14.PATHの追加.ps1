# 14.PATHの追加.ps1
$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest

#
# PATHを確認する
#
echo "[1]----------"
echo $env:PATH

#
# PATHが通っているかを確認する
#
echo "[2]----------"
Get-Command "git"

#
# PATHが通っていなければPATHに追加する
#
echo "[3]----------"
try
{
    Get-Command "foo" > $null
    echo "already exsit"
}
catch
{
    $env:PATH = "path/to/foo/bin;$env:PATH"
    echo "added"
}

echo $env:PATH
