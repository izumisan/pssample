# コンテナ.ps1

# 配列
#-------------------------------------------------------------------------------
# @(...)で配列
$array = @("foo", "bar", "baz")
echo $array.GetType()

# forループ
for ($i = 0; $i -lt $array.Count; ++$i) {
    echo $array[$i]
}

# カンマ区切りのみでも配列となる
$array = "aaa", "bbb", "ccc"
echo $array.GetType()

# foreachループ
foreach ( $item in $array ) {
    echo $item
}

# 空配列
$array = @()
echo $array.Count


# 連想配列
#-------------------------------------------------------------------------------
# @{key=value; ....}で連想配列
$map = @{foo="FOO"; bar="BAR"; baz="BAZ"}

# [key]で要素にアクセスする
echo $map["foo"]
# Item(key)でも要素にアクセスできる
echo $map.Item("bar")

