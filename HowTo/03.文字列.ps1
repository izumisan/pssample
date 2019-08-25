# 文字列.ps1

# 文字列の連結
$key = "foo"
$value = 168
echo ($key + ": " + $value)
echo ""

# ヒアドキュメント
# @" ... "@ でヒアドキュメント
$foo = @"
1行目
  2行目
    3行目
"@
echo $foo
echo ""

# エスケープシーケンス
# バッククォートでエスケープシーケンス
echo "tab_1`ttab_2`ttab_3"  # `t タブ
echo "CR_1`rCR_2`rCR_3"     # `r キャリッジリターン(CR)
echo "LF_1`nLF_2`nLF_3"     # `n NewLine(LF)
