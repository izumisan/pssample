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


# 文字列の分割 (-split)
$items = ("aaa,bbb,ccc" -split ",")  #=> [aaa, bbb, ccc]

# 文字列の結合 (-join)
$items = "foo", "bar", "baz"
echo ($items -join "-")  #=> "foo-bar-baz"

# 文字列の置換 (-replace)(大文字/小文字区別なし)
"BeforeString" -replace "before", "after"  #=> "afterString"

# 文字列の置換 (-creplace)(大文字/小文字区別あり)
"BeforeString" -creplace "before", "after"  #=> "BeforeString"
"BeforeString" -creplace "Before", "after"  #=> "afterString"
