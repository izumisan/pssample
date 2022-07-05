# 15.コマンドライン出力を表示しない.ps1
Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

echo "[1]-----"

# コマンドレットを実行すると標準出力にいろいろ表示されるので
# スクリプトから実行する場合は邪魔になる
Test-Path README.md

echo "[2]-----"

# $null にリダイレクトで表示されなくなる
Test-Path README.md > $null

echo "[3]-----"

# [void] にキャストしてもよい
[void](Test-Path README.md)
